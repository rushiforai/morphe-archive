package app.morphe.patches.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

// Port of NmaxConnect's tools/waze-patch (patch.py + resolve.py). R8 renames Waze's classes on every build, but not
// what the hooks are found by: Android framework types, Kotlin's parameter-name strings and the shape of the code.
// Each role must match exactly once, or patching stops naming the role that broke.
private const val SURFACE_VIEW = "Landroid/view/SurfaceView;"
private const val HOLDER = "Landroid/view/SurfaceHolder;"
private const val CALLBACKS = "Landroid/view/SurfaceHolder\$Callback;"
private const val CALLBACKS2 = "Landroid/view/SurfaceHolder\$Callback2;"
private const val SURFACE = "Landroid/view/Surface;"
private const val LIST = "Ljava/util/List;"
private const val INTEGER = "Ljava/lang/Integer;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val MARKER_SET_SCALE = "Lcom/waze/jni/protos/map/Marker\$Builder;->setScale(F)"
private const val MAP_NATIVE = "Lcom/waze/map/WazeMapNativeManager;"
private const val MAP_NATIVE_BASE = "Lcom/waze/map/WazeMapNativeManagerBase;"
private const val NIM = "Lcom/waze/navigate/NavigationInfoNativeManager;"
private const val NIM_BASE = "Lcom/waze/navigate/NavigationInfoNativeManagerBase;"
private const val LANE_LIST = "Lcom/waze/jni/protos/navigate/NavigationLaneList;"
private const val PLACEHOLDER = "DASH:"
private val log = Logger.getLogger("app.morphe.patches.waze.WazeDashPatch")

// Navigation data: Waze's native code calls these by name, so R8 keeps them. (class, method, registers, WazeNav method)
private val NAV_HOOKS = listOf(
    Triple(NIM_BASE, "initializeJNI(I)V", "p1" to "initialized(I)V"),
    Triple(NIM_BASE, "onNavigationStateChangedJNI(ZI)V", "p1, p2" to "navState(ZI)V"),
    Triple(NIM_BASE, "onCurrentInstructionChangedJNI(I)V", "p1" to "turn(I)V"),
    Triple(NIM_BASE, "onNextInstructionChangedJNI(I)V", "p1" to "thenTurn(I)V"),
    Triple(NIM_BASE, "onCurrentInstructionDistanceChangedJNI([B)V", "p1" to "turnDistance([B)V"),
    Triple(NIM_BASE, "onEtaDistanceChangedJNI([B)V", "p1" to "remaining([B)V"),
    Triple(NIM_BASE, "onStreetNameChangedJNI([B)V", "p1" to "street([B)V"),
    Triple(NIM_BASE, "onTimeStringChangedJNI($STRING)V", "p1" to "etaClock($STRING)V"),
    Triple(NIM_BASE, "onEtaMinutesChangedJNI(${STRING}${STRING}I)V", "p1, p2, p3" to "etaMinutes(${STRING}${STRING}I)V"),
    Triple(NIM_BASE, "onAverageSpeedCamZoneUpdateJNI([B)V", "p1" to "avgZone([B)V"),
    Triple(NIM_BASE, "onAverageSpeedCamZoneClearJNI()V", "" to "avgZoneClear()V"),
    Triple("Lcom/waze/alerters/AlerterNativeManagerBase;", "updateAlertersRepositoryJNI([B)V", "p1" to "alerts([B)V"),
    Triple("Lcom/waze/location/LocationNativeManagerBase;", "onPositionJNI([B)V", "p1" to "position([B)V"),
    Triple(
        "Lcom/waze/location/LocationSensorListenerBase;", "updateSpeedometerJNI(I${STRING}ID)V",
        "p1, p2, p3" to "speedometer(I${STRING}I)V",
    ),
)

private fun <T> one(role: String, found: Collection<T>): T {
    val distinct = found.distinct()
    if (distinct.size != 1) throw PatchException("Waze dash: role '$role' matched ${distinct.size} candidates ${distinct.take(5)}")
    return distinct.single()
}

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList() ?: emptyList()
private fun Method.sig() = name + parameterTypes.joinToString("", "(", ")") + returnType
private fun Method.calls() = code().mapNotNull { it.getReference<MethodReference>() }
private fun MethodReference.sig() = name + parameterTypes.joinToString("", "(", ")") + returnType
private fun Method.hasString(s: String) = code().any { it.getReference<StringReference>()?.string == s }
private fun ClassDef.method(sig: String) = one("$type->$sig", methods.filter { it.sig() == sig })
private fun javaName(type: String) = type.substring(1, type.length - 1).replace('/', '.')
private fun Method.locals() = (implementation?.registerCount ?: 0) - parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } -
    (if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1)

/** `const/4 r, literal` → `iput-boolean r, ?, owner->flag:Z` → `invoke-virtual {..}, (one of calls)()V`; the flag name. */
private fun Method.flagThenCall(literal: Int, owner: String, call: (MethodReference) -> Boolean): List<String> {
    val c = code()
    return (0 until c.size - 2).mapNotNull { i ->
        val set = c[i]
        val put = c[i + 1]
        val inv = c[i + 2]
        val field = put.getReference<FieldReference>()
        val target = inv.getReference<MethodReference>()
        if (set.opcode == Opcode.CONST_4 && (set as NarrowLiteralInstruction).narrowLiteral == literal &&
            put.opcode == Opcode.IPUT_BOOLEAN && (put as TwoRegisterInstruction).registerA == (set as OneRegisterInstruction).registerA &&
            field?.definingClass == owner && field.type == "Z" &&
            inv.opcode == Opcode.INVOKE_VIRTUAL && target != null && target.parameterTypes.isEmpty() && target.returnType == "V" &&
            call(target)
        ) field.name else null
    }
}

private fun BytecodePatchContext.wazeClasses(): List<ClassDef> {
    val all = mutableListOf<ClassDef>()
    classDefForEach { if (!it.type.startsWith("Lcom/lampp/")) all += it }
    return all
}

/** resolve.py: the obfuscated names the hooks and DashNames need. */
private fun resolve(classes: List<ClassDef>): Map<String, String> {
    val byType = classes.associateBy { it.type }
    // Z: Waze's map SurfaceView; its render-thread start checks the Kotlin parameter "renderThread".
    val z = one("map SurfaceView (z)", classes.filter { c -> c.superclass == SURFACE_VIEW && c.methods.any { it.hasString("renderThread") } })
    val start = one("render start (z.s)", z.methods.filter { it.hasString("renderThread") })
    // The start returns early while the render runner field is set (5.24 asks a ()Z getter, 5.27 reads the field
    // inline); stop() is the ()V method that nulls it.
    val getter = start.calls().firstOrNull { it.definingClass == z.type && it.parameterTypes.isEmpty() && it.returnType == "Z" }
    val runner = if (getter != null) {
        one("render runner field", z.method(getter.sig()).code().filter { it.opcode == Opcode.IGET_OBJECT }
            .mapNotNull { it.getReference<FieldReference>()?.takeIf { f -> f.definingClass == z.type }?.name })
    } else {
        val c = start.code()
        one("render runner field", (0 until c.size - 1).mapNotNull { i ->
            val f = c[i].getReference<FieldReference>()
            if (c[i].opcode == Opcode.IGET_OBJECT && f?.definingClass == z.type && c[i + 1].opcode == Opcode.IF_NEZ &&
                (c[i + 1] as OneRegisterInstruction).registerA == (c[i] as TwoRegisterInstruction).registerA
            ) f.name else null
        })
    }
    val stop = one("render stop (z.t)", z.methods.filter { m ->
        m != start && m.parameterTypes.isEmpty() && m.returnType == "V" && m.code().let { c ->
            (1 until c.size).any { i ->
                c[i].opcode == Opcode.IPUT_OBJECT && c[i].getReference<FieldReference>()?.let { it.definingClass == z.type && it.name == runner } == true &&
                    c[i - 1].opcode == Opcode.CONST_4 && (c[i - 1] as NarrowLiteralInstruction).narrowLiteral == 0 &&
                    (c[i - 1] as OneRegisterInstruction).registerA == (c[i] as TwoRegisterInstruction).registerA
            }
        }
    }.map { it.name })

    // X: the SurfaceHolder callback Z wires up; its fields are (fan-out Y, Z).
    val x = one("phone surface callback (x)", classes.filter { c ->
        (CALLBACKS in c.interfaces || CALLBACKS2 in c.interfaces) && c.fields.any { it.type == z.type }
    })
    val objectFields = x.fields.filter { it.type.startsWith("L") && !AccessFlags.STATIC.isSet(it.accessFlags) }
    val yField = one("fan-out field (x.a)", objectFields.filter { it.type != z.type })
    val y = yField.type
    val viewField = one("map view field (x.b)", objectFields.filter { it.type == z.type })
    val created = x.method("surfaceCreated($HOLDER)V")
    val createdCalls = created.calls()
    val j = one("renderer callbacks (bl.j)", createdCalls.filter { it.sig().endsWith("(${SURFACE}III)V") && it.definingClass != y }
        .map { it.definingClass })
    fun callsOn(owner: String, m: Method, sig: String, role: String) =
        one(role, m.calls().filter { it.definingClass == owner && it.sig().substringAfter(it.name) == sig }.map { it.name })

    val roles = linkedMapOf(
        "j" to javaName(j),
        "j.surfaceReady" to callsOn(j, created, "(${SURFACE}III)V", "j.b"),
        "j.resized" to callsOn(j, x.method("surfaceChanged(${HOLDER}III)V"), "(III)V", "j.a"),
        "j.gone" to callsOn(j, x.method("surfaceDestroyed($HOLDER)V"), "()V", "j.c"),
        "y" to javaName(y),
        "y.listeners" to callsOn(y, created, "()$LIST", "y.a"),
        "y.setHolder" to callsOn(y, created, "($HOLDER)V", "y.e"),
        "x" to javaName(x.type),
        "x.fan" to yField.name,
        "x.view" to viewField.name,
        "z" to javaName(z.type),
        "z.runner" to runner,
        "z.stop" to stop,
    )
    // surfaceCreated sets width, height, dpi in that order (h, w from getSurfaceFrame, dpi from DisplayMetrics).
    val sizes = createdCalls.filter { it.definingClass == y && it.sig().substringAfter(it.name) == "($INTEGER)V" }.map { it.name }
    if (sizes.size != 3 || sizes.toSet().size != 3) throw PatchException("Waze dash: fan-out size setters (y.f/d/c) expected 3, got $sizes")
    roles["y.setWidth"] = sizes[0]
    roles["y.setHeight"] = sizes[1]
    roles["y.setDpi"] = sizes[2]
    val yClass = byType[y] ?: throw PatchException("Waze dash: fan-out class $y not found")
    roles["y.addListener"] = one("y.i", yClass.methods.filter { m ->
        m.parameterTypes.joinToString("") == j && m.returnType == "V" && m.calls().any { it.definingClass == LIST && it.name == "add" }
    }.map { it.name })

    // V: the phone map view (a Z). Pause = clear the "resumed" flag + stop; resume = set it + restart. A second flag
    // (attached to window) has the same shape but is driven by View overrides (on*).
    val resumes = classes.filter { it.superclass == z.type }.flatMap { c ->
        c.methods.filter { it.sig().endsWith("()V") && !it.name.startsWith("on") }.flatMap { pause ->
            pause.flagThenCall(0, c.type) { (it.definingClass == z.type || it.definingClass == c.type) && it.name == stop }.flatMap { flag ->
                c.methods.filter { r ->
                    r.sig().endsWith("()V") && !r.name.startsWith("on") &&
                        r.flagThenCall(1, c.type) { it.definingClass == c.type }.contains(flag)
                }.map { Triple(c.type, pause.name, it.name) }
            }
        }
    }
    val (v, pause, resume) = one("map pause/resume (v.o/v.p)", resumes)
    roles["v"] = javaName(v)
    roles["v.pause"] = pause
    roles["v.resume"] = resume
    return roles
}

/**
 * Where to hook [method] with [count] scratch registers: (method, maybe a replacement, the first scratch register, the
 * index to insert at, its parameter registers). Too few locals: addFreeRegisters adds registers on top and moves the
 * parameters back down at the start, so the hook goes after those moves and names the original registers itself.
 */
private class Hook(val method: MutableMethod, val scratch: Int, val at: Int, val p: (Int) -> String)

private fun BytecodePatchContext.hookWith(method: MutableMethod, count: Int): Hook {
    val locals = method.locals()
    if (locals >= count) return Hook(method, 0, 0) { "p$it" }
    val before = method.implementation!!.instructions.size
    val registers = method.implementation!!.registerCount
    // The added registers are the ones above the original count (addFreeRegisters' own answer can be a parameter's).
    val (grown, _) = method.addFreeRegisters(count)
    val first = registers
    if (grown.implementation!!.registerCount != registers + count) throw PatchException("Waze dash: ${method.name} did not get $count registers")
    if (first + count > 16 || locals + method.parameterTypes.size + 1 > 16) throw PatchException("Waze dash: no low registers in ${method.name}")
    return Hook(grown, first, grown.implementation!!.instructions.size - before) { "v${locals + it}" }
}

private fun BytecodePatchContext.mutableMethod(type: String, sig: String): MutableMethod =
    one("$type->$sig", mutableClassDefBy(type).methods.filter { it.sig() == sig })

private const val GUARD = """
    if-eqz v%1${'$'}d, :dash_go
    return-void
    :dash_go
    nop
"""

private fun BytecodePatchContext.patchMap(roles: Map<String, String>, classes: List<ClassDef>): String {
    fun type(role: String) = "L" + roles.getValue(role).replace('.', '/') + ";"
    val (x, y, z, j, v) = listOf("x", "y", "z", "j", "v").map(::type)

    // y: register every phone fan-out; a renderer that joins while the dash owns the map gets the dash surface.
    val yClass = mutableClassDefBy(y)
    val ctor = one("y.<init> addCallback", yClass.methods.filter { m ->
        m.name == "<init>" && m.code().let { c ->
            c.indices.any { i -> c[i].getReference<MethodReference>()?.sig() == "addCallback($CALLBACKS)V" && c.getOrNull(i + 1)?.opcode == Opcode.RETURN_VOID }
        }
    })
    val add = ctor.code().indexOfFirst { it.getReference<MethodReference>()?.sig() == "addCallback($CALLBACKS)V" }
    ctor.addInstruction(add + 1, "invoke-static {p0}, $WAZE_BRIDGE->register($OBJECT)V")

    val addListener = mutableMethod(y, "${roles.getValue("y.addListener")}($j)V")
    addListener.code().let { c ->
        var at = one("y.addListener List.add", c.indices.filter { c[it].getReference<MethodReference>()?.let { r -> r.definingClass == LIST && r.name == "add" } == true }) + 1
        if (c.getOrNull(at)?.opcode == Opcode.MOVE_RESULT) at++
        addListener.addInstruction(at, "invoke-static {p0, p1}, $WAZE_BRIDGE->listenerAdded($OBJECT$OBJECT)V")
    }

    // x: the phone SurfaceView's callbacks; record the holder always, skip the rest while the dash owns the map.
    // surfaceDestroyed also passes the map view, so the bridge can tell a closed view (route preview) from a hidden one.
    val fan = "$x->${roles.getValue("x.fan")}:$y"
    val view = "$x->${roles.getValue("x.view")}:$z"
    for ((sig, call) in listOf(
        "surfaceCreated($HOLDER)V" to "phoneSurface($OBJECT$HOLDER)Z",
        "surfaceDestroyed($HOLDER)V" to "phoneSurfaceGone(${OBJECT}Landroid/view/View;)Z",
        "surfaceChanged(${HOLDER}III)V" to "isActive($OBJECT)Z",
    )) {
        val gone = sig.startsWith("surfaceDestroyed")
        val h = hookWith(mutableMethod(x, sig), if (gone) 2 else 1)
        val r = h.scratch
        val args = when {
            sig.startsWith("surfaceCreated") -> "{v$r, ${h.p(1)}}"
            gone -> "{v$r, v${r + 1}}"
            else -> "{v$r}"
        }
        h.method.addInstructionsWithLabels(h.at, buildString {
            appendLine("iget-object v$r, ${h.p(0)}, $fan")
            if (gone) appendLine("iget-object v${r + 1}, ${h.p(0)}, $view")
            appendLine("invoke-static $args, $WAZE_BRIDGE->$call")
            appendLine("move-result v$r")
            append(GUARD.trimIndent().format(r))
        })
    }

    // v: the map view's Activity pause/resume. Pause stops the render thread, so with the screen off the dash froze on
    // its last frame; the bridge skips the pause while the dash owns the map and replays it on detach.
    val pause = hookWith(mutableMethod(v, "${roles.getValue("v.pause")}()V"), 1)
    pause.method.addInstructionsWithLabels(pause.at, "invoke-static {${pause.p(0)}}, $WAZE_BRIDGE->mapPause($OBJECT)Z\n" +
        "move-result v${pause.scratch}\n" + GUARD.trimIndent().format(pause.scratch))
    mutableMethod(v, "${roles.getValue("v.resume")}()V").addInstruction(0, "invoke-static {p0}, $WAZE_BRIDGE->mapResume($OBJECT)V")

    // Map pins (home/work bubbles): Java draws their bitmap at the phone's density, which the dash's lower dpi leaves
    // ~3x too big; the bridge scales them down while the dash owns the map. Protobuf names survive R8, so no resolve.
    val markerCalls = classes.filter { it.type.startsWith("Lcom/waze/") && !it.type.startsWith("Lcom/waze/jni/protos/") }.flatMap { c ->
        c.methods.filter { m -> m.calls().any { it.toString().startsWith(MARKER_SET_SCALE) } }.map { c.type to it.sig() }
    }
    val (markerType, markerSig) = one("Marker.setScale caller", markerCalls)
    val marker = mutableMethod(markerType, markerSig)
    val at = one("Marker.setScale call", marker.code().indices.filter { marker.code()[it].getReference<MethodReference>()?.toString()?.startsWith(MARKER_SET_SCALE) == true })
    val scale = (marker.code()[at] as FiveRegisterInstruction).registerD
    marker.addInstructions(at, "invoke-static {v$scale}, $WAZE_BRIDGE->markerScale(F)F\nmove-result v$scale")

    // Dash +/-: each map's native manager and its mapId (an obfuscated field) for WazeZoom, as the object comes up.
    val native = one("WazeMapNativeManager.<init>(String…)", mutableClassDefBy(MAP_NATIVE).methods.filter { it.name == "<init>" && it.parameterTypes.firstOrNull() == STRING })
    val superInit = one("WazeMapNativeManager super()", native.code().indices.filter { native.code()[it].getReference<MethodReference>()?.toString() == "$MAP_NATIVE_BASE-><init>()V" })
    native.addInstruction(superInit + 1, "invoke-static {p0, p1}, $WAZE_ZOOM->manager($OBJECT$STRING)V")
    return "marker $markerType"
}

private fun BytecodePatchContext.patchNav(): String {
    for ((type, sig, call) in NAV_HOOKS) {
        mutableMethod(type, sig).addInstruction(0, "invoke-static {${call.first}}, $WAZE_NAV->${call.second}")
    }
    // Lanes: the one static method of NavigationInfoNativeManager taking (itself, NavigationLaneList), renamed per build.
    val lanes = one("lanes", mutableClassDefBy(NIM).methods.filter {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.joinToString("") == NIM + LANE_LIST
    })
    lanes.addInstruction(0, "invoke-static {p1}, $WAZE_NAV->lanes($OBJECT)V")
    return "lanes ${lanes.name}"
}

/** DashNames' fields start as "DASH:<role>" (D8 keeps them as the fields' static values); this build's names go there. */
private fun BytecodePatchContext.fillDashNames(roles: Map<String, String>) {
    val names = mutableClassDefBy(WAZE_DASH_NAMES)
    val seen = mutableSetOf<String>()
    names.fields.forEach { field ->
        val value = field.initialValue as? MutableStringEncodedValue ?: return@forEach
        if (!value.value.startsWith(PLACEHOLDER)) return@forEach
        val role = value.value.removePrefix(PLACEHOLDER)
        value.setValue(roles[role] ?: throw PatchException("Waze dash: DashNames.${field.name} wants role '$role', which was not resolved"))
        seen += role
    }
    if (names.methods.any { m -> m.code().any { it.getReference<StringReference>()?.string?.startsWith(PLACEHOLDER) == true } }) {
        throw PatchException("Waze dash: DashNames sets a placeholder in code, not as a static value")
    }
    val missing = roles.keys - seen
    if (missing.isNotEmpty()) throw PatchException("Waze dash: DashNames has no field for $missing")
}

@Suppress("unused")
val wazeDashPatch = bytecodePatch(
    name = "NmaxConnect dash map (Waze)",
    description = "Lets NmaxConnect show Waze's live map and navigation on the motorbike dash. Hooks found by structure on Waze 5.27.",
    default = true,
) {
    compatibleWith(wazeCompatibility)
    dependsOn(wazeNmaxPatch)

    execute {
        val classes = wazeClasses()
        val roles = resolve(classes)
        val map = patchMap(roles, classes)
        val nav = patchNav()
        fillDashNames(roles)
        log.info("Waze dash: $roles; $map; $nav")
    }
}
