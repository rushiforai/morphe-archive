package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.util.logging.Logger

// Color scheme, chosen in Maps' Settings (part of the core patch, like the driver side). Maps for
// Android Automotive takes its day or night colors, for its screens and for the map, from its
// "CarNightModeController". Its own Day/Night preferences are not stored in this build, so the
// controller always runs its automatic mode: night when the system configuration is in night mode
// (or the car maker's cluster settings ask for it, which BYD does not send). Some BYD head units (the
// Dolphin's) keep the system in night mode all day; on others the car's day/night setting switches it.
// The controller's one read of the system night flag, in its configuration update, passes through
// ColorScheme.night, which gives Day, Night or, for Auto, the car's low beam (Maps' own value when the
// light cannot be read). The patch adds an interface method to the controller that runs that update
// again and, when the controller's stored night value changed, makes the call that refreshes Maps'
// screens, the one Maps makes after a night change from the cluster settings. Maps' cards take their
// colors when they are bound, so without it they kept the old colors until Maps was opened again (a real
// configuration change refreshes them through the activity). ColorScheme can then apply a change at once.
// Required: a missing anchor, an ambiguity or an unknown layout fails the patch.

internal const val COLOR_SCHEME_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/ColorScheme;"
private const val COLOR_SCHEME_CONTROLLER = "Lapp/morphe/extension/mapsautomotive/patches/ColorScheme\$Controller;"
private const val REFRESH_METHOD = "morpheRefreshNight"
// The controller's two update traces (one for its screens, one for the map).
private const val NIGHT_TRACE = "CarNightModeController.updateNightModeState"
private const val BASEMAP_TRACE = "CarNightModeController.updateBasemapNightModeState"
// The controller's mode enum, one field each for the screens and the map.
private val MODE_NAMES = setOf("AUTO", "FORCE_DAY", "FORCE_NIGHT")
private const val CONFIGURATION = "Landroid/content/res/Configuration;"
private const val UI_MODE = "Landroid/content/res/Configuration;->uiMode:I"
// Configuration.UI_MODE_NIGHT_MASK and UI_MODE_NIGHT_YES: Maps' night read compares the masked bits.
private const val UI_MODE_NIGHT_MASK = 0x30
private const val UI_MODE_NIGHT_YES = 0x20
private const val MAX_NIGHT_READ_SIZE = 8
private val colorSchemeLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.ColorSchemePatch")

internal fun BytecodePatchContext.useColorScheme() {
    requireExtensionMethod(COLOR_SCHEME_CLASS, "night", listOf(COLOR_SCHEME_CONTROLLER, "Z"), "Z")
    val controllerInterface = classDefByOrNull(COLOR_SCHEME_CONTROLLER)
        ?: throw PatchException("Missing extension interface $COLOR_SCHEME_CONTROLLER")
    if (!AccessFlags.INTERFACE.isSet(controllerInterface.accessFlags) ||
        controllerInterface.methods.map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" } !=
        listOf("$REFRESH_METHOD($CONFIGURATION)Z")
    ) {
        throw PatchException("$COLOR_SCHEME_CONTROLLER must be an interface with only $REFRESH_METHOD($CONFIGURATION)Z")
    }

    val controller = nightModeController()
    if (COLOR_SCHEME_CONTROLLER in controller.interfaces || controller.methods.any { it.name == REFRESH_METHOD }) {
        throw PatchException("${controller.type} already has $REFRESH_METHOD")
    }
    val (update, call) = nightRead(controller)
    // Every anchor is checked, and the added method built, before the controller changes.
    val night = nightField(controller, update, call)
    val refresh = screensRefresh(controller)
    val refreshMethod = refreshMethod(controller, update, night, refresh)
    giveNight(controller, update, call)
    addRefresh(controller, update, night, refresh, refreshMethod)
}

private fun Instruction.literalString() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.methodReference() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.fieldReference() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.registerA() = (this as OneRegisterInstruction).registerA

private fun Instruction.writesRegister(register: Int): Boolean {
    if (this !is OneRegisterInstruction) return false
    return (opcode.setsRegister() && registerA == register) || (opcode.setsWideRegister() && registerA + 1 == register)
}

private fun ClassDef.hasString(value: String) =
    methods.any { method -> method.implementation?.instructions?.any { it.literalString() == value } == true }

// The class with both update traces, and two fields of its AUTO/FORCE_DAY/FORCE_NIGHT mode enum.
private fun BytecodePatchContext.nightModeController(): ClassDef {
    val classes = mutableListOf<ClassDef>()
    val modeEnums = mutableSetOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        if (classDef.hasString(NIGHT_TRACE) && classDef.hasString(BASEMAP_TRACE)) classes += classDef
        if (classDef.superclass == "Ljava/lang/Enum;") {
            val names = classDef.methods.firstOrNull { it.name == "<clinit>" }?.implementation?.instructions
                ?.mapNotNullTo(HashSet()) { it.literalString() } ?: return@classDefForEach
            if (names.containsAll(MODE_NAMES)) modeEnums += classDef.type
        }
    }
    val controller = classes.singleOrNull()
        ?: throw PatchException("Expected one class with \"$NIGHT_TRACE\" and \"$BASEMAP_TRACE\", found ${classes.map { it.type }}")
    val modeFields = controller.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type in modeEnums }
    if (modeFields.size != 2) {
        throw PatchException("Expected two mode fields (${MODE_NAMES.joinToString("/")}) in ${controller.type}, found ${modeFields.size} (enums $modeEnums)")
    }
    return controller
}

// In the controller's (Configuration)V methods: the one static (I)Z call on Configuration.uiMode read
// right before it, moved to a register. That static method is Maps' night check: (uiMode & 0x30) == 0x20.
private fun BytecodePatchContext.nightRead(controller: ClassDef): Pair<Method, Int> {
    val sites = controller.methods.filter { method ->
        method.returnType == "V" && method.parameterTypes.map { it.toString() } == listOf(CONFIGURATION) &&
            !AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation != null
    }.flatMap { method ->
        val code = method.implementation!!.instructions.toList()
        code.indices.filter { index ->
            val reference = code[index].methodReference()
            index > 0 && code[index].opcode == Opcode.INVOKE_STATIC && reference != null &&
                reference.parameterTypes.map { it.toString() } == listOf("I") && reference.returnType == "Z" &&
                code[index - 1].opcode == Opcode.IGET && memberKey(code[index - 1]) == UI_MODE &&
                (code[index] as FiveRegisterInstruction).registerC == code[index - 1].registerA()
        }.map { method to it }
    }
    val (update, call) = sites.singleOrNull()
        ?: throw PatchException("Expected one night read of $UI_MODE in ${controller.type}, found ${sites.size}")

    val check = update.implementation!!.instructions.toList()[call].methodReference()!!
    val checkBody = classDefByOrNull(check.definingClass)?.methods?.singleOrNull {
        it.name == check.name && it.returnType == "Z" && it.parameterTypes.map { type -> type.toString() } == listOf("I")
    }?.implementation?.instructions?.toList()
        ?: throw PatchException("The night check $check is not in the APK")
    val literals = checkBody.mapNotNull { (it as? NarrowLiteralInstruction)?.narrowLiteral }.toSet()
    if (checkBody.size > MAX_NIGHT_READ_SIZE || checkBody.none { it.opcode == Opcode.AND_INT_LIT8 } ||
        !literals.containsAll(setOf(UI_MODE_NIGHT_MASK, UI_MODE_NIGHT_YES))
    ) {
        throw PatchException("$check is not the night check (uiMode & $UI_MODE_NIGHT_MASK) == $UI_MODE_NIGHT_YES")
    }
    return update to call
}

// The controller's stored night value: the one boolean field of the controller that the update writes from the night
// read's register (while it still holds the value read), after reading it to compare. The refresh compares it before
// and after the update.
private fun nightField(controller: ClassDef, update: Method, call: Int): String {
    val code = update.implementation!!.instructions.toList()
    val result = code.getOrNull(call + 1)
    if (result?.opcode != Opcode.MOVE_RESULT) throw PatchException("The night read in $update is not moved")
    val night = result.registerA()
    val self = update.implementation!!.registerCount - 2
    val held = (call + 2 until code.size).firstOrNull { code[it].writesRegister(night) } ?: code.size
    val stores = (call + 2 until held).filter { index ->
        val store = code[index]
        store.opcode == Opcode.IPUT_BOOLEAN && store.registerA() == night &&
            (store as TwoRegisterInstruction).registerB == self && store.fieldReference()?.definingClass == controller.type
    }
    val store = stores.singleOrNull()
        ?: throw PatchException("Expected one store of the night value in $update, found ${stores.size}")
    val field = memberKey(code[store])!!
    val compared = (call + 2 until store).any { index ->
        code[index].opcode == Opcode.IGET_BOOLEAN && memberKey(code[index]) == field &&
            (code[index] as TwoRegisterInstruction).registerB == self
    }
    if (!compared) throw PatchException("$update stores the night value in $field without comparing it first")
    if (controller.fields.none { "${it.definingClass}->${it.name}:${it.type}" == field && !AccessFlags.STATIC.isSet(it.accessFlags) }) {
        throw PatchException("$field is not an instance field of ${controller.type}")
    }
    return field
}

// Maps' screens refresh after a night change that comes without a configuration change: in each of the controller's
// two update methods (the one with each trace), after the trace, one call through a lazy field of the controller:
// iget-object -> invoke-interface ()Object -> move-result-object -> check-cast T -> invoke-interface T ()V. Maps makes it
// when the cluster settings change the night mode. Both methods must make the same call, through interfaces of the APK.
private data class ScreensRefresh(val lazyField: String, val lazyGet: String, val refreshType: String, val refresh: String)

private fun BytecodePatchContext.screensRefresh(controller: ClassDef): ScreensRefresh {
    val calls = listOf(NIGHT_TRACE, BASEMAP_TRACE).map { trace ->
        val methods = controller.methods.filter { method ->
            method.implementation?.instructions?.any { it.literalString() == trace } == true
        }
        val method = methods.singleOrNull()
            ?: throw PatchException("Expected one method with \"$trace\" in ${controller.type}, found ${methods.size}")
        if (AccessFlags.STATIC.isSet(method.accessFlags)) throw PatchException("$method is static")
        val code = method.implementation!!.instructions.toList()
        val parameterRegisters = method.parameterTypes.sumOf { type -> if (type.toString() in setOf("J", "D")) 2 else 1 }
        val self = method.implementation!!.registerCount - parameterRegisters - 1
        val traceAt = code.indexOfFirst { it.literalString() == trace }
        val found = (traceAt + 1..code.size - 5).mapNotNull { refreshAt(controller, code, it, self) }
        found.singleOrNull()
            ?: throw PatchException("Expected one screens refresh after \"$trace\" in $method, found ${found.size}")
    }
    val refresh = calls.first()
    if (calls.any { it != refresh }) {
        throw PatchException("The two night updates in ${controller.type} refresh differently: ${calls.joinToString(" / ")}")
    }
    requireInterfaceMethod(refresh.lazyField.substringAfterLast(':'), refresh.lazyGet)
    requireInterfaceMethod(refresh.refreshType, refresh.refresh)
    return refresh
}

private fun refreshAt(controller: ClassDef, code: List<Instruction>, index: Int, self: Int): ScreensRefresh? {
    val (get, getter, result, cast, call) = code.subList(index, index + 5)
    if (get.opcode != Opcode.IGET_OBJECT || getter.opcode != Opcode.INVOKE_INTERFACE || result.opcode != Opcode.MOVE_RESULT_OBJECT ||
        cast.opcode != Opcode.CHECK_CAST || call.opcode != Opcode.INVOKE_INTERFACE
    ) {
        return null
    }
    val field = get.fieldReference() ?: return null
    val lazyGet = getter.methodReference() ?: return null
    val refreshType = ((cast as ReferenceInstruction).reference as? TypeReference)?.type ?: return null
    val refresh = call.methodReference() ?: return null
    val holder = get.registerA()
    val value = result.registerA()
    val getterCall = getter as FiveRegisterInstruction
    val refreshCall = call as FiveRegisterInstruction
    if (field.definingClass != controller.type || (get as TwoRegisterInstruction).registerB != self ||
        getterCall.registerCount != 1 || getterCall.registerC != holder || lazyGet.definingClass != field.type ||
        lazyGet.parameterTypes.isNotEmpty() || lazyGet.returnType != "Ljava/lang/Object;" ||
        cast.registerA() != value || refreshCall.registerCount != 1 || refreshCall.registerC != value ||
        refresh.definingClass != refreshType || refresh.parameterTypes.isNotEmpty() || refresh.returnType != "V"
    ) {
        return null
    }
    return ScreensRefresh(memberKey(get)!!, memberKey(getter)!!, refreshType, memberKey(call)!!)
}

private fun BytecodePatchContext.requireInterfaceMethod(type: String, method: String) {
    val classDef = classDefByOrNull(type) ?: throw PatchException("$type is not in the APK")
    if (!AccessFlags.INTERFACE.isSet(classDef.accessFlags) || classDef.methods.none {
            "${it.definingClass}->${it.name}${it.parameterTypes.joinToString("", "(", ")")}${it.returnType}" == method &&
                AccessFlags.ABSTRACT.isSet(it.accessFlags)
        }
    ) {
        throw PatchException("$method is not a method of the interface $type")
    }
}

// Right after the night read's move-result: ColorScheme.night(controller, Maps' value) replaces the value.
private fun BytecodePatchContext.giveNight(controller: ClassDef, update: Method, call: Int) {
    val method = mutableClassDefBy(controller).methods.single {
        it.name == update.name && it.returnType == update.returnType &&
            it.parameterTypes.map { type -> type.toString() } == update.parameterTypes.map { type -> type.toString() }
    }
    val code = method.implementation!!.instructions
    val result = code.getOrNull(call + 1)
    if (result?.opcode != Opcode.MOVE_RESULT) throw PatchException("The night read in $update is not moved")
    val register = result.registerA()
    // Inserted code before a branch target would be skipped by that branch.
    if (code.getOrNull(call + 2)?.location?.labels?.isNotEmpty() != false) {
        throw PatchException("No straight-line point after the night read in $update")
    }
    // The receiver is the first parameter register (registers minus this and the configuration), and nothing in the
    // method may write it, so it still holds the controller at the insertion point.
    val self = method.implementation!!.registerCount - 2
    if (self > 15 || register > 15) throw PatchException("Registers v$self and v$register in $update need a 4-bit invoke")
    if (register == self || code.any { it.writesRegister(self) }) throw PatchException("v$self is not the receiver at the night read in $update")
    method.addInstructions(
        call + 2,
        """
            invoke-static { v$self, v$register }, $COLOR_SCHEME_CLASS->night(${COLOR_SCHEME_CONTROLLER}Z)Z
            move-result v$register
        """.trimIndent(),
    )
    colorSchemeLogger.info(
        "Color scheme: $update reads the system night flag into v$register at ${call + 1} through ColorScheme.night " +
            "(receiver v$self)",
    )
}

// morpheRefreshNight(Configuration) runs the controller's update again and, when the stored night value changed,
// refreshes Maps' screens; it returns whether the value changed. Built before the controller changes.
private fun refreshMethod(controller: ClassDef, update: Method, night: String, refresh: ScreensRefresh): MutableMethod {
    val invoke = if (AccessFlags.PRIVATE.isSet(update.accessFlags)) "invoke-direct" else "invoke-virtual"
    return ImmutableMethod(
        controller.type,
        REFRESH_METHOD,
        listOf(ImmutableMethodParameter(CONFIGURATION, null, null)),
        "Z",
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        null,
        null,
        MutableMethodImplementation(4),
    ).toMutable().apply {
        addInstructionsWithLabels(
            0,
            """
                iget-boolean v0, p0, $night
                $invoke { p0, p1 }, ${controller.type}->${update.name}($CONFIGURATION)V
                iget-boolean v1, p0, $night
                if-eq v0, v1, :morphe_night_unchanged
                iget-object v0, p0, ${refresh.lazyField}
                invoke-interface { v0 }, ${refresh.lazyGet}
                move-result-object v0
                check-cast v0, ${refresh.refreshType}
                invoke-interface { v0 }, ${refresh.refresh}
                const/4 v0, 0x1
                return v0
                :morphe_night_unchanged
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )
    }
}

// The controller implements ColorScheme.Controller with the method built above.
private fun BytecodePatchContext.addRefresh(
    controller: ClassDef,
    update: Method,
    night: String,
    refresh: ScreensRefresh,
    refreshMethod: MutableMethod,
) {
    val mutable = mutableClassDefBy(controller)
    mutable.interfaces.add(COLOR_SCHEME_CONTROLLER)
    mutable.methods.add(refreshMethod)
    colorSchemeLogger.info(
        "Color scheme: ${controller.type} implements ColorScheme.Controller ($REFRESH_METHOD runs ${update.name}; when " +
            "$night changed: ${refresh.lazyField} -> ${refresh.refresh}, as after the controller's night updates)",
    )
}
