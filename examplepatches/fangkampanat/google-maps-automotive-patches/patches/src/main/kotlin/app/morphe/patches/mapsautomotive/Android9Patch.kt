package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.w3c.dom.Element
import java.nio.ByteBuffer
import java.util.logging.Logger

// Patch "Android 9 (API 28)" (0.1.8): tester builds for Android 9 head units (issue #11). Off by default; the
// default output is the BYD build. Maps 120003.E was built for Android 11, and Android 10 members are used without a
// version check. The extension android9.mpe carries the Android 10 classes Android 9 lacks, under their framework
// names (classes load parent first, so Android 10 and newer never load them), and one compat class per framework
// class (its OWNER) for the Android 10 members of older classes. In finalize, after the other patches added their
// code, every call or static field read of a member that a compat class declares goes to that compat method, in Maps
// and in the other extensions alike: the compat classes are the list. Maps' one call of RenderNode.beginRecording()
// (an R8 outline returning RecordingCanvas, which Android 9 lacks) becomes a Canvas. minSdk becomes 28.

private const val ANDROID9_PACKAGE = "Lapp/morphe/extension/mapsautomotive/android9/"
private const val ANDROID9_CLASS = "${ANDROID9_PACKAGE}Android9;"
private const val ANDROID9_EXTENSION = "extensions/android9.mpe"
private const val RENDER_NODE = "Landroid/graphics/RenderNode;"
private const val RECORDING_CANVAS = "Landroid/graphics/RecordingCanvas;"
private const val CANVAS = "Landroid/graphics/Canvas;"
private const val BEGIN_RECORDING = "$RENDER_NODE->beginRecording()$RECORDING_CANVAS"
private const val LIFECYCLE_CALLBACKS = "Landroid/app/Application\$ActivityLifecycleCallbacks;"
private val renderNodeCompatReference =
    ImmutableMethodReference("${ANDROID9_PACKAGE}RenderNode28;", "beginRecording", listOf(RENDER_NODE), CANVAS)
private val android9Logger = Logger.getLogger("app.morphe.patches.mapsautomotive.Android9Patch")

internal val android9ManifestPatch = resourcePatch {
    dependsOn(manifestPatch)

    execute {
        document("AndroidManifest.xml").use { document ->
            val usesSdk = document.getElementsByTagName("uses-sdk").item(0) as? Element
                ?: throw PatchException("The manifest has no uses-sdk")
            val minSdk = usesSdk.getAttribute("android:minSdkVersion")
            if (minSdk != "29") throw PatchException("Expected the core patch's minSdk 29, found '$minSdk'")
            usesSdk.setAttribute("android:minSdkVersion", "28")
        }
    }
}

@Suppress("unused")
val android9Patch = bytecodePatch(
    name = "Android 9 (API 28)",
    description = "Test builds for Android 9 head units (issue #11): lets the app install and start on Android 9. " +
        "Tested on one Android 9 head unit; BYD head units do not need it.",
    default = false,
) {
    compatibleWith(compatibility)
    dependsOn(automotiveMicroGPatch, android9ManifestPatch)
    extendWith(ANDROID9_EXTENSION)

    execute {
        hookAndroid9Start()
    }

    // After every other patch's execute and finalize except the core's, which adds only calls of its extension.
    finalize {
        val ours = android9ExtensionClasses()
        routeRecordingCanvas(ours)
        routeAndroid10Members(ours)
    }
}

// The start-up log line and, on Android 9, the hidden API exemption, before Maps' own start (Android9).
private fun BytecodePatchContext.hookAndroid9Start() {
    val method = findHierarchyHook(APPLICATION_CLASS, "Maps application onCreate") {
        it.name == "onCreate" && it.returnType == "V" && it.parameterTypes.isEmpty()
    }
    requireExtensionMethod(ANDROID9_CLASS, "onApplicationCreate", listOf("Landroid/app/Application;"), "V")
    method.addInstruction(
        0,
        "invoke-static/range { p0 .. p0 }, $ANDROID9_CLASS->onApplicationCreate(Landroid/app/Application;)V",
    )
    android9Logger.info("Android 9 start-up check at the start of $method")
}

// The classes of android9.mpe, read from the bundle as extendWith reads it: the framework-named classes and the
// compat package are never rewritten.
private fun android9ExtensionClasses(): Set<String> {
    val stream = object {}.javaClass.classLoader.getResourceAsStream(ANDROID9_EXTENSION)
        ?: throw PatchException("Extension \"$ANDROID9_EXTENSION\" not found")
    val dex = stream.use { DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(it.readBytes())) }
    return dex.classes.mapTo(mutableSetOf()) { it.type }
}

private fun String.isAndroid9Class(ours: Set<String>) = this in ours || startsWith(ANDROID9_PACKAGE)

// One route: the compat method that replaces a framework member.
private class Route(val compat: MethodReference) {
    var sites = 0
}

private class Routes {
    val static = mutableMapOf<String, Route>()
    val instance = mutableMapOf<String, Route>()
    val constructors = mutableMapOf<String, Route>()
    val fields = mutableMapOf<String, Route>()
    val all get() = (static.values + instance.values + constructors.values + fields.values).distinct()
}

// Each compat class names its framework class in OWNER. Its public static methods are routes for that class: the
// member itself (static), the member with the receiver first (instance), create(...) returning OWNER (constructor),
// and a method without parameters named like a static field of OWNER (field read).
private fun BytecodePatchContext.loadRoutes(ours: Set<String>): Routes {
    val routes = Routes()
    var classes = 0
    classDefForEach { classDef ->
        if (!classDef.type.startsWith(ANDROID9_PACKAGE) || "$" in classDef.type) return@classDefForEach
        val ownerField = classDef.fields.singleOrNull { it.name == "OWNER" } ?: return@classDefForEach
        val owner = (ownerField.initialValue as? StringEncodedValue)?.value
            ?: throw PatchException("${classDef.type}.OWNER is not a constant")
        if (!owner.startsWith("L") || !owner.endsWith(";") || owner.startsWith(ANDROID9_PACKAGE)) {
            throw PatchException("${classDef.type}.OWNER is not a framework class: $owner")
        }
        classes++
        classDef.methods.forEach { method ->
            if (!AccessFlags.STATIC.isSet(method.accessFlags) || !AccessFlags.PUBLIC.isSet(method.accessFlags) ||
                method.name.startsWith("<")
            ) {
                return@forEach
            }
            val parameters = method.parameterTypes.map { it.toString() }
            val route = Route(ImmutableMethodReference(classDef.type, method.name, parameters, method.returnType))
            val proto = parameters.joinToString("") + ")" + method.returnType
            routes.static["$owner->${method.name}($proto"] = route
            if (parameters.firstOrNull() == owner) {
                routes.instance["$owner->${method.name}(${parameters.drop(1).joinToString("")})${method.returnType}"] = route
            }
            if (method.name == "create" && method.returnType == owner) {
                routes.constructors["$owner-><init>(${parameters.joinToString("")})V"] = route
            }
            if (parameters.isEmpty() && method.name.matches(Regex("[A-Z][A-Z0-9_]*"))) {
                routes.fields["$owner->${method.name}:${method.returnType}"] = route
            }
        }
    }
    if (classes < 20) throw PatchException("Found only $classes Android 9 compat classes")
    android9Logger.info("Android 9 routes from $classes compat classes: ${routes.instance.size} instance, " +
        "${routes.static.size} static, ${routes.constructors.size} constructor, ${routes.fields.size} field")
    return routes
}

private fun MethodReference.memberKey() = definingClass + "->" + name + parameterTypes.joinToString("", "(", ")") + returnType

private val staticInvokes = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)
private val instanceInvokes = setOf(
    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE,
)
private val constructorInvokes = setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE)
private val superInvokes = setOf(Opcode.INVOKE_SUPER, Opcode.INVOKE_SUPER_RANGE)
private val staticReads = setOf(Opcode.SGET, Opcode.SGET_WIDE, Opcode.SGET_OBJECT, Opcode.SGET_BOOLEAN, Opcode.SGET_BYTE,
    Opcode.SGET_CHAR, Opcode.SGET_SHORT)

private class Edit(val index: Int, val route: Route, val kind: Char)

// A call through a Maps class (a subclass of View, say) reaches the framework member when no Maps class on the way
// declares it: the framework classes and interfaces where the Maps hierarchy ends, nearest first.
private fun BytecodePatchContext.frameworkOwners(owner: String, name: String, proto: String): List<String> {
    val found = mutableListOf<String>()
    val queue = ArrayDeque(listOf(owner))
    val seen = mutableSetOf<String>()
    while (queue.isNotEmpty()) {
        val type = queue.removeFirst()
        if (!seen.add(type)) continue
        val classDef: ClassDef = classDefByOrNull(type) ?: run {
            found += type
            null
        } ?: continue
        if (classDef.methods.any { it.name == name && it.parameterTypes.joinToString("", "(", ")") + it.returnType == proto }) {
            return emptyList()
        }
        classDef.superclass?.let(queue::add)
        queue.addAll(classDef.interfaces)
    }
    return found
}

private fun BytecodePatchContext.routeAndroid10Members(ours: Set<String>) {
    val routes = loadRoutes(ours)
    val edits = mutableMapOf<Method, MutableList<Edit>>()
    val superCalls = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.isAndroid9Class(ours)) return@classDefForEach
        classDef.methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.forEachIndexed { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                val edit = when {
                    reference is MethodReference && instruction.opcode in staticInvokes ->
                        routes.static[reference.memberKey()]?.let { Edit(index, it, 'S') }
                    reference is MethodReference && instruction.opcode in instanceInvokes -> {
                        val proto = reference.parameterTypes.joinToString("", "(", ")") + reference.returnType
                        val direct = routes.instance[reference.memberKey()]
                        val route = direct ?: if (classDefByOrNull(reference.definingClass) != null) {
                            frameworkOwners(reference.definingClass, reference.name, proto)
                                .firstNotNullOfOrNull { routes.instance["$it->${reference.name}$proto"] }
                        } else {
                            null
                        }
                        route?.let { Edit(index, it, 'I') }
                    }
                    reference is MethodReference && instruction.opcode in constructorInvokes && reference.name == "<init>" ->
                        routes.constructors[reference.memberKey()]?.let { Edit(index, it, 'C') }
                    reference is MethodReference && instruction.opcode in superInvokes -> {
                        // Never routed: the compat method would call the override again. The framework of Android 9
                        // never calls an override of an Android 10 member, but LifecycleBridge calls the pre/post
                        // lifecycle overrides there, so a super call to one of those fails the patch. Others are
                        // listed here and by Api28Audit.
                        if (routes.instance.containsKey(reference.memberKey())) {
                            if (reference.definingClass == LIFECYCLE_CALLBACKS) {
                                throw PatchException("Super call to ${reference.memberKey()} in $method: it throws on Android 9")
                            }
                            superCalls += "${reference.memberKey()} in $method"
                        }
                        null
                    }
                    reference is FieldReference && instruction.opcode in staticReads ->
                        routes.fields["${reference.definingClass}->${reference.name}:${reference.type}"]?.let { Edit(index, it, 'F') }
                    else -> null
                }
                if (edit != null) edits.getOrPut(method) { mutableListOf() } += edit
            }
        }
    }

    var sites = 0
    edits.forEach { (original, methodEdits) ->
        val method = mutableMethodOf(original)
        methodEdits.sortedByDescending { it.index }.forEach { edit ->
            val instruction = method.implementation!!.instructions[edit.index]
            when (edit.kind) {
                'S', 'I' -> method.replaceInstruction(edit.index, staticCallOf(instruction, edit.route.compat))
                'C' -> method.routeConstructor(edit.index, edit.route.compat)
                'F' -> {
                    val target = (instruction as OneRegisterInstruction).registerA
                    method.replaceInstruction(edit.index, BuilderInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0, edit.route.compat))
                    method.addInstruction(edit.index + 1, BuilderInstruction11x(moveResultFor(edit.route.compat.returnType), target))
                }
            }
            edit.route.sites++
            sites++
        }
    }
    routes.all.sortedBy { it.compat.memberKey() }.forEach { route ->
        android9Logger.info("Android 9 route ${route.compat.definingClass.substringAfterLast('/')}${route.compat.name}: ${route.sites} sites")
    }
    if (sites == 0) throw PatchException("No Android 10 member was routed")
    superCalls.forEach { android9Logger.info("Android 9: super call left as it is: $it") }
    android9Logger.info("Android 9: routed $sites sites in ${edits.size} methods; ${superCalls.size} super calls left as they are")
}

private fun moveResultFor(type: String) = when (type[0]) {
    'L', '[' -> Opcode.MOVE_RESULT_OBJECT
    'J', 'D' -> Opcode.MOVE_RESULT_WIDE
    else -> Opcode.MOVE_RESULT
}

// [reference] invoked statically with the registers of [call].
private fun staticCallOf(call: Instruction, reference: MethodReference): BuilderInstruction = when (call) {
    is FiveRegisterInstruction -> BuilderInstruction35c(
        Opcode.INVOKE_STATIC, call.registerCount, call.registerC, call.registerD, call.registerE, call.registerF,
        call.registerG, reference,
    )
    is RegisterRangeInstruction -> BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, call.startRegister, call.registerCount, reference)
    else -> throw PatchException("Unexpected call instruction ${call.opcode}")
}

// new-instance vX, T; ...; invoke-direct {vX, args}, T-><init>(args)V becomes const/16 vX, 0; ...;
// invoke-static {args}, compat->create(args)T; move-result-object vX. Between the two, vX must be neither read nor
// written and nothing may jump in.
private fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.routeConstructor(index: Int, compat: MethodReference) {
    val instructions = implementation!!.instructions
    val call = instructions[index]
    fun unexpected(): Nothing = throw PatchException("Unexpected Android 10 constructor call in $this at $index")
    val registers = when (call) {
        is FiveRegisterInstruction -> listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG).take(call.registerCount)
        is RegisterRangeInstruction -> (call.startRegister until call.startRegister + call.registerCount).toList()
        else -> unexpected()
    }
    val instance = registers.first()
    val creation = (index - 1 downTo 0).firstOrNull { position ->
        val candidate = instructions[position]
        candidate.opcode == Opcode.NEW_INSTANCE && (candidate as OneRegisterInstruction).registerA == instance
    } ?: unexpected()
    if ((instructions[creation] as ReferenceInstruction).reference.toString() != compat.returnType) unexpected()
    for (position in creation + 1 until index) {
        val between = instructions[position]
        if (between.location.labels.isNotEmpty() || between.opcode.name.let { it.startsWith("goto") || it.startsWith("if-") }) unexpected()
        val used = when (between) {
            is FiveRegisterInstruction -> listOf(between.registerC, between.registerD, between.registerE, between.registerF, between.registerG).take(between.registerCount)
            is RegisterRangeInstruction -> (between.startRegister until between.startRegister + between.registerCount).toList()
            is ThreeRegisterInstruction -> listOf(between.registerA, between.registerB, between.registerC)
            is TwoRegisterInstruction -> listOf(between.registerA, between.registerB)
            is OneRegisterInstruction -> listOf(between.registerA)
            else -> emptyList()
        }
        if (instance in used) unexpected()
    }
    if (instructions[index].location.labels.isNotEmpty()) unexpected()
    val arguments = registers.drop(1)
    val static: BuilderInstruction = when (call) {
        is RegisterRangeInstruction -> BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, call.startRegister + 1, arguments.size, compat)
        else -> {
            val r = arguments + List(5 - arguments.size) { 0 }
            BuilderInstruction35c(Opcode.INVOKE_STATIC, arguments.size, r[0], r[1], r[2], r[3], r[4], compat)
        }
    }
    replaceInstruction(index, static)
    addInstruction(index + 1, BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, instance))
    replaceInstruction(creation, BuilderInstruction21s(Opcode.CONST_16, instance, 0))
}

// Maps calls RenderNode.beginRecording() once, in an R8 outline (RenderNode)RecordingCanvas whose callers use the
// result as a Canvas. RecordingCanvas does not exist on Android 9, so the outline is replaced by one returning Canvas
// that calls RenderNode28.beginRecording, and its callers call the new one. A caller that mentions RecordingCanvas
// anywhere else, a second beginRecording() call or another outline layout fails the patch.
private fun BytecodePatchContext.routeRecordingCanvas(ours: Set<String>) {
    val users = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.isAndroid9Class(ours)) return@classDefForEach
        classDef.methods.forEach { method ->
            if (method.implementation?.instructions?.any { memberKey(it) == BEGIN_RECORDING } == true) users += method
        }
    }
    val outline = users.singleOrNull()
        ?: throw PatchException("Expected one RenderNode.beginRecording() call, found ${users.size}: ${users.joinToString()}")
    val instructions = outline.implementation!!.instructions.toList()
    if (!AccessFlags.STATIC.isSet(outline.accessFlags) || outline.returnType != RECORDING_CANVAS ||
        outline.parameterTypes.map { it.toString() } != listOf(RENDER_NODE) || instructions.size != 3 ||
        instructions[0].opcode != Opcode.INVOKE_VIRTUAL || instructions[1].opcode != Opcode.MOVE_RESULT_OBJECT ||
        instructions[2].opcode != Opcode.RETURN_OBJECT
    ) {
        throw PatchException("Unexpected RenderNode.beginRecording() outline: $outline")
    }
    val outlineKey = "${outline.definingClass}->${outline.name}($RENDER_NODE)$RECORDING_CANVAS"
    val newOutline = ImmutableMethodReference(outline.definingClass, outline.name, listOf(RENDER_NODE), CANVAS)

    val callers = mutableMapOf<Method, MutableList<Int>>()
    classDefForEach { classDef ->
        if (classDef.type.isAndroid9Class(ours)) return@classDefForEach
        classDef.methods.forEach { method ->
            method.implementation?.instructions?.forEachIndexed { index, instruction ->
                if (memberKey(instruction) == outlineKey) callers.getOrPut(method) { mutableListOf() } += index
            }
        }
    }
    if (callers.isEmpty()) throw PatchException("No caller of $outlineKey")
    callers.forEach { (caller, indices) ->
        val others = caller.implementation!!.instructions.filter {
            memberKey(it)?.contains(RECORDING_CANVAS) == true && memberKey(it) != outlineKey ||
                (it as? ReferenceInstruction)?.reference?.toString() == RECORDING_CANVAS
        }
        if (others.isNotEmpty() || caller.returnType == RECORDING_CANVAS ||
            caller.parameterTypes.any { it.toString() == RECORDING_CANVAS }
        ) {
            throw PatchException("$caller uses RecordingCanvas besides $outlineKey")
        }
        val method = mutableMethodOf(caller)
        indices.forEach { index ->
            val call = method.implementation!!.instructions[index]
            if (call.opcode !in staticInvokes) throw PatchException("Unexpected call of $outlineKey in $caller at $index")
            method.replaceInstruction(index, staticCallOf(call, newOutline))
        }
    }

    val outlineClass = mutableClassDefBy(outline.definingClass)
    outlineClass.methods.removeIf { it.name == outline.name && it.returnType == RECORDING_CANVAS && it.parameterTypes == outline.parameterTypes }
    outlineClass.methods.add(
        ImmutableMethod(
            outline.definingClass, outline.name, listOf(ImmutableMethodParameter(RENDER_NODE, null, null)), CANVAS,
            outline.accessFlags, null, null, MutableMethodImplementation(1),
        ).toMutable().apply {
            addInstruction(0, BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, 0, 0, 0, 0, 0, renderNodeCompatReference))
            addInstruction(1, BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0))
            addInstruction(2, BuilderInstruction11x(Opcode.RETURN_OBJECT, 0))
        },
    )
    android9Logger.info("Android 9: $outlineKey now returns Canvas through RenderNode28; callers ${callers.keys.joinToString()}")
}
