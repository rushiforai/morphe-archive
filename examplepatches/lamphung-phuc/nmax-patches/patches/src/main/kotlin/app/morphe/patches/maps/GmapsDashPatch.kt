package app.morphe.patches.maps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Element
import java.util.logging.Logger

// NmaxConnect (com.lampp.nmaxconnect) binds this service and hands Maps a Surface to draw its map into, for the
// bike's dash. Contract: NmaxConnect's IGmapsDash.aidl and docs/gmap-dash.md in that repo.
private const val BRIDGE = "Lapp/morphe/extension/maps/patches/GmapsDashBridge;"
private const val NAV = "Lapp/morphe/extension/maps/patches/GmapsDashNav;"
private const val SETTINGS = "Lapp/morphe/extension/maps/patches/NmaxSettings;"
private const val MAP_CONTAINER = "Lcom/google/android/apps/gmm/base/views/map/MapViewContainer;"
private const val CUSTOM_PREF = "Lcom/google/android/apps/gmm/settings/CustomSettingsPreference;"
private const val SCREEN = "Landroidx/preference/PreferenceScreen;"
private const val PREFERENCE = "Landroidx/preference/Preference;"
private const val CONTEXT = "Landroid/content/Context;"
private const val SERVICE = "app.morphe.extension.maps.patches.GmapsDashService"
private const val BIND_ACTION = "com.lampp.nmaxconnect.gmaps.action.BIND"
private const val HOLDER = "Landroid/view/SurfaceHolder;"
private const val SURFACE_VIEW = "Landroid/view/SurfaceView;"
private const val CALLBACK = "Landroid/view/SurfaceHolder\$Callback;"
private const val CHOREOGRAPHER = "Landroid/view/Choreographer;"
private const val FRAME_CALLBACK = "Landroid/view/Choreographer\$FrameCallback;"
private const val FRAME_LABEL = "ActiveFrameRateRegulator.doFrame()"
private const val MAPS_ACTIVITY = "Lcom/google/android/maps/MapsActivity;"
private const val BUNDLE = "Landroid/os/Bundle;"
private const val ACTIVITY = "Landroid/app/Activity;"
private val log = Logger.getLogger("app.morphe.patches.maps.GmapsDashPatch")

private fun dashGuard(ok: Boolean, why: String) {
    if (!ok) throw PatchException("Unrecognized Maps map view: $why")
}

private val gmapsDashServicePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val action = document.createElement("action").apply { setAttribute("android:name", BIND_ACTION) }
            val filter = document.createElement("intent-filter").apply { appendChild(action) }
            application.appendChild(document.createElement("service").apply {
                setAttribute("android:name", SERVICE)
                setAttribute("android:exported", "true")
                appendChild(filter)
            })
        }
    }
}

/**
 * The map view (26.45: `blqv`) is the only SurfaceView that is its own SurfaceHolder.Callback and has
 * setGlThreadPriority(int). Its surface callbacks only forward to its GL thread (26.45: `blrd`): created → store the
 * holder for EGL10.eglCreateWindowSurface, changed → size, destroyed → drop it. Hooks run the bridge first; a null
 * from the bridge means the dash has the map, so the phone's call is skipped. The GL thread's resume is the call
 * onAttachedToWindow makes right after creating it; its pause is the only other no-arg GL method that writes the first state flag
 * resume writes.
 */
@Suppress("unused")
val gmapsDashPatch = bytecodePatch(
    name = "NmaxConnect dash map",
    description = "Lets NmaxConnect show this Maps' live map on the motorbike dash. Hooks found by structure on Maps 26.45.",
    default = true,
) {
    compatibleWith(compatibility)
    dependsOn(googleMapsMicroGPatch, gmapsDashServicePatch, mapsSettingsRowsPatch)

    execute {
        val view = mapView()
        val glType = view.fields.mapNotNull { f -> f.type.takeIf { t -> view.methods.any { it.callsInto(t) } } }
            .distinct().singleOrNull { t -> view.methods.any { it.name == "onAttachedToWindow" && it.creates(t) } }
        dashGuard(glType != null, "no GL thread field created in onAttachedToWindow of ${view.type}")
        val gl = classDefBy(glType!!)

        val attached = view.methods.single { it.name == "onAttachedToWindow" && it.parameterTypes.isEmpty() }
        val glResume = attached.callsAfterNew(glType)
        dashGuard(glResume != null, "onAttachedToWindow does not start the GL thread it creates")
        val pauseFlag = gl.methods.single { it.name == glResume!!.name && it.parameterTypes.isEmpty() }
            .booleanWrites().firstOrNull { !it.startsWith("$glType->") } // skips its own "started" flag
        val glPause = gl.methods.filter {
            it.name != glResume!!.name && it.parameterTypes.isEmpty() && it.returnType == "V" &&
                pauseFlag in it.booleanWrites()
        }
        dashGuard(glPause.size == 1, "expected one GL pause beside ${glResume!!.name}, found ${glPause.map { it.name }}")

        val viewResume = view.forwarder(glType, glResume.name)
        val viewPause = view.forwarder(glType, glPause.single().name)

        val mutableView = mutableClassDefBy(view.type)
        fun mutable(m: Method): MutableMethod = mutableView.methods.single { it.toString() == m.toString() }
        fun callback(name: String, params: String) = mutableView.methods.singleOrNull {
            it.name == name && it.parameterTypes.joinToString("") == params && it.returnType == "V"
        } ?: throw PatchException("Unrecognized Maps map view: no $name($params) in ${view.type}")

        // Every hooked method has .locals 0 on 26.45, so the bridge's result goes back into a parameter register.
        callback("surfaceCreated", HOLDER).hookHolder("{p0, p1}", "surfaceCreated(Ljava/lang/Object;$HOLDER)$HOLDER")
        callback("surfaceChanged", "${HOLDER}III")
            .hookHolder("{p0, p1, p2, p3, p4}", "surfaceChanged(Ljava/lang/Object;${HOLDER}III)$HOLDER")
        callback("surfaceDestroyed", HOLDER).hookHolder("{p0, p1}", "surfaceDestroyed(Ljava/lang/Object;$HOLDER)$HOLDER")
        mutable(viewPause).hookSelf("pause", view.type)
        mutable(viewResume).hookSelf("resume", view.type)

        val frames = frameScheduler()
        val lifecycle = lifecycleHooks()
        val nav = navStateHook()
        val pip = pipHooks()
        val settings = nmaxSettings()
        val touch = touchBlock()

        val bridge = mutableClassDefBy(BRIDGE)
        fun name(getter: String, value: String) = bridge.methods.single { it.name == getter }
            .replaceInstructions(0, "const-string v0, \"$value\"\nreturn-object v0")
        name("pauseName", viewPause.name)
        name("resumeName", viewResume.name)
        name("lifecycleEventName", lifecycle.second)

        log.info("Dash map: view ${view.type}, GL thread $glType (resume ${glResume.name}, pause " +
            "${glPause.single().name}), view resume ${viewResume.name}, pause ${viewPause.name}, frames $frames, " +
            "lifecycle ${lifecycle.first}, nav $nav, pip $pip, settings $settings, touch $touch; " +
            "service $SERVICE")
    }
}

/**
 * The map's frame scheduler (26.45: `bkfe`, found by its trace label) asks Choreographer for each frame. With the phone
 * screen off there is no vsync, so no frame is ever drawn: its post/remove calls go through the bridge, which ticks
 * them from a main-thread timer while the dash has the map.
 */
private fun BytecodePatchContext.frameScheduler(): String {
    val found = mutableListOf<String>()
    classDefForEach { c ->
        if (FRAME_CALLBACK in c.interfaces && c.methods.any { m ->
                m.name == "doFrame" && m.refs().any { it.getReference<StringReference>()?.string == FRAME_LABEL }
            }
        ) found += c.type
    }
    dashGuard(found.size == 1, "expected one \"$FRAME_LABEL\" frame callback, found $found")
    val scheduler = mutableClassDefBy(found.single())
    // setHidden(boolean): the map view went invisible (Activity stopped); hidden stops the frames, so the bridge
    // keeps it false while the dash has the map.
    val hide = scheduler.methods.filter { m ->
        m.parameterTypes.joinToString("") == "Z" && m.returnType == "V" && m.refs().any {
            it.getReference<MethodReference>()?.let { r -> r.definingClass == CHOREOGRAPHER && r.name == "removeFrameCallback" } == true
        }
    }
    dashGuard(hide.size == 1, "expected one setHidden(Z) in ${found.single()}, found ${hide.map { it.name }}")
    var hooked = 0
    for (m in scheduler.methods) {
        val code = m.implementation?.instructions?.toList() ?: continue
        code.forEachIndexed { i, ins ->
            val ref = ins.getReference<MethodReference>() ?: return@forEachIndexed
            if (ins.opcode != Opcode.INVOKE_VIRTUAL || ref.definingClass != CHOREOGRAPHER) return@forEachIndexed
            if (ref.name != "postFrameCallback" && ref.name != "removeFrameCallback") return@forEachIndexed
            val r = ins as FiveRegisterInstruction
            m.replaceInstruction(i, "invoke-static {v${r.registerC}, v${r.registerD}}, " +
                "$BRIDGE->${ref.name}($CHOREOGRAPHER$FRAME_CALLBACK)V")
            hooked++
        }
    }
    dashGuard(hooked >= 2, "only $hooked Choreographer calls in ${found.single()}")
    hide.single().addInstructions(0, """
        invoke-static {p1}, $BRIDGE->frameHidden(Z)Z
        move-result p1
    """.trimIndent())
    return "${found.single()} ($hooked calls, hidden ${hide.single().name})"
}

/**
 * With the phone screen off Maps' Activity pauses and stops, and its UI stops feeding locations to the map: the puck
 * greys out and the camera freezes, though navigation goes on. While the dash has the map the bridge holds those back:
 * - the Maps activity base (26.45: `mve`, superclass of MapsActivity) runs only android.app.Activity's own
 *   onPause/onStop/onSaveInstanceState, and later skips the matching onRestart/onStart/onResume the same way;
 * - androidx LifecycleRegistry.handleLifecycleEvent (found by its main-thread check string) holds ON_PAUSE/ON_STOP
 *   and replays them when the dash lets go.
 * Returns (description, registry event method name).
 */
private fun BytecodePatchContext.lifecycleHooks(): Pair<String, String> {
    val base = mutableClassDefBy(classDefBy(MAPS_ACTIVITY).superclass!!)
    val lookup = "Ljava/lang/invoke/MethodHandles\$Lookup;"
    // MethodHandles.findSpecial behaves like super.x() from the lookup's class, so to reach android.app.Activity's own
    // method past every Maps override the lookup must come from the class right under Activity (26.45: `bx`).
    var top = classDefBy(base.type)
    while (top.superclass != ACTIVITY) top = classDefBy(top.superclass ?: throw PatchException("${base.type} is no Activity"))
    val root = mutableClassDefBy(top.type)
    dashGuard(root.methods.none { it.name == "dashLookup" }, "dashLookup already in ${root.type}")
    root.methods.add(MutableMethod(ImmutableMethod(root.type, "dashLookup", emptyList(), lookup,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
        emptySet(), emptySet(), ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList()))).apply {
        addInstructions(0, """
            invoke-static {}, Ljava/lang/invoke/MethodHandles;->lookup()$lookup
            move-result-object v0
            return-object v0
        """.trimIndent())
    })
    val rootLookup = "invoke-static {}, ${root.type}->dashLookup()$lookup"
    for (name in listOf("onPause", "onStop", "onRestart", "onStart", "onResume")) {
        val m = base.methods.singleOrNull { it.name == name && it.parameterTypes.isEmpty() && it.returnType == "V" }
            ?: throw PatchException("Unrecognized Maps activity: no $name() in ${base.type}")
        // v0-v2 are scratch; p0 may sit above v15, so it is copied down for the invoke.
        dashGuard((m.implementation?.registerCount ?: 0) >= 4, "$name() in ${base.type} has too few registers")
        m.addInstructionsWithLabels(0, """
            $rootLookup
            move-result-object v0
            const-string v1, "$name"
            move-object/from16 v2, p0
            invoke-static {v2, v0, v1}, $BRIDGE->holdActivity(Landroid/app/Activity;${lookup}Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :go
            return-void
            :go
            nop
        """.trimIndent())
    }
    val save = base.methods.singleOrNull { it.name == "onSaveInstanceState" && it.parameterTypes.joinToString("") == BUNDLE }
        ?: throw PatchException("Unrecognized Maps activity: no onSaveInstanceState in ${base.type}")
    dashGuard((save.implementation?.registerCount ?: 0) >= 6, "onSaveInstanceState in ${base.type} has too few registers")
    save.addInstructionsWithLabels(0, """
        $rootLookup
        move-result-object v0
        move-object/from16 v2, p0
        move-object/from16 v3, p1
        invoke-static {v2, v0, v3}, $BRIDGE->holdSave(Landroid/app/Activity;$lookup$BUNDLE)Z
        move-result v0
        if-eqz v0, :go
        return-void
        :go
        nop
    """.trimIndent())

    val found = mutableListOf<Pair<String, Method>>()
    classDefForEach { c ->
        c.methods.forEach { m ->
            if (m.refs().any { it.getReference<StringReference>()?.string == "handleLifecycleEvent" }) found += c.type to m
        }
    }
    dashGuard(found.size == 1, "expected one handleLifecycleEvent, found ${found.map { "${it.first}.${it.second.name}" }}")
    val (registry, handle) = found.single()
    dashGuard(handle.parameterTypes.size == 1 && handle.returnType == "V", "handleLifecycleEvent shape: $handle")
    val event = handle.parameterTypes.single().toString()
    mutableClassDefBy(registry).methods.single { it.toString() == handle.toString() }.addInstructionsWithLabels(0, """
        invoke-static {p0, p1}, $BRIDGE->lifecycleEvent(Ljava/lang/Object;Ljava/lang/Enum;)Ljava/lang/Enum;
        move-result-object p1
        if-nez p1, :go
        return-void
        :go
        check-cast p1, $event
    """.trimIndent())
    return "${base.type}, registry $registry.${handle.name}" to handle.name
}

/**
 * Maps' navigation notification updater (26.45: `bmmc.d(bmlk, xxa, Bitmap, Z, J, Z, PendingIntent)`, in the class
 * holding the "navigation_status_notification_group" string) runs about once a second while Maps navigates. Its first
 * argument's getter (26.45: `bmlk.e()`) returns the nav state (26.45: `blzt`); the hook hands that to GmapsDashNav,
 * which reads it by the field names resolved here (see [navFields]) and pushes NmaxConnect a snapshot.
 */
private fun BytecodePatchContext.navStateHook(): String {
    val tail = listOf("Landroid/graphics/Bitmap;", "Z", "J", "Z", "Landroid/app/PendingIntent;")
    val found = mutableListOf<Pair<String, Method>>()
    classDefForEach { c ->
        if (!c.hasString("navigation_status_notification_group")) return@classDefForEach
        c.methods.filter { m ->
            m.returnType == "V" && m.parameterTypes.size == 7 && m.parameterTypes.takeLast(5).map { it.toString() } == tail
        }.forEach { found += c.type to it }
    }
    dashGuard(found.size == 1, "expected one nav notification updater, found ${found.map { "${it.first}.${it.second.name}" }}")
    val (updater, update) = found.single()
    val holder = update.parameterTypes.first().toString()
    val getter = classDefBy(holder).methods.filter { m ->
        m.parameterTypes.isEmpty() && m.returnType.startsWith("L") &&
            classDefByOrNull(m.returnType)?.hasString("metersToNextStep") == true
    }
    dashGuard(getter.size == 1, "expected one nav state getter in $holder, found ${getter.map { it.name }}")
    val state = getter.single()
    dashGuard((update.implementation?.registerCount ?: 0) > update.parameterTypes.size + 2, "$updater.${update.name} has no scratch register")
    val fields = navFields(classDefBy(state.returnType))
    mutableClassDefBy(NAV).methods.single { it.name == "navFields" }
        .replaceInstructions(0, "const-string v0, \"$fields\"\nreturn-object v0")
    mutableClassDefBy(updater).methods.single { it.toString() == update.toString() }.addInstructions(0, """
        move-object/from16 v0, p1
        invoke-virtual {v0}, $holder->${state.name}()${state.returnType}
        move-result-object v0
        invoke-static {v0}, $NAV->navState(Ljava/lang/Object;)V
    """.trimIndent())
    return "$updater.${update.name} → $holder.${state.name}() ${state.returnType} [$fields]"
}

/**
 * The nav state's and its step's field names, as "key=field;…" for GmapsDashNav. Maps' state classes keep Guava
 * toString() labels; each label follows the read of the field it prints (26.45 `blzt`: i metersToNextStep, m
 * metersRemaining, o combinedSecondsRemaining, q isOnRoute, s routeCompletedSuccessfully; step `ycb`: c maneuverType,
 * d turnSide, h stepNumber, A/B direct/indirectCues). The rest by type: the step (the class labelling
 * "maneuverType"), the route (holds a step array), the turn severity (the enum naming "TURN_SLIGHT").
 */
private fun BytecodePatchContext.navFields(state: ClassDef): String {
    val stateLabels = mapOf(
        "toNext" to "metersToNextStep", "remaining" to "metersRemaining", "secsRemaining" to "combinedSecondsRemaining",
        "onRoute" to "isOnRoute", "done" to "routeCompletedSuccessfully", "fromStart" to "metersFromStart",
    )
    val stepField = state.fields.filter { classDefByOrNull(it.type)?.hasString("maneuverType") == true }
    dashGuard(stepField.size == 1, "expected one step field in ${state.type}, found ${stepField.map { it.name }}")
    val step = classDefBy(stepField.single().type)
    val stepLabels = mapOf(
        "maneuver" to "maneuverType", "side" to "turnSide", "stepNumber" to "stepNumber",
        "directCues" to "directCues", "indirectCues" to "indirectCues",
    )
    val routeField = state.fields.filter { f -> classDefByOrNull(f.type)?.fields?.any { it.type == "[${step.type}" } == true }
    dashGuard(routeField.size == 1, "expected one route field in ${state.type}, found ${routeField.map { it.name }}")
    val steps = classDefBy(routeField.single().type).fields.filter { it.type == "[${step.type}" }
    dashGuard(steps.size == 1, "expected one step array in ${routeField.single().type}")
    val severity = step.fields.filter { classDefByOrNull(it.type)?.hasString("TURN_SLIGHT") == true }
    dashGuard(severity.size == 1, "expected one turn severity field in ${step.type}, found ${severity.map { it.name }}")
    val out = labelledFields(state, stateLabels) + labelledFields(step, stepLabels) + mapOf(
        "step" to stepField.single().name, "route" to routeField.single().name, "steps" to steps.single().name,
        "severity" to severity.single().name,
    ) + trafficFields(classDefBy(routeField.single().type))
    return out.entries.joinToString(";") { "${it.key}=${it.value}" }
}

/**
 * The route's traffic, as Maps' notification progress bar reads it (26.45 `aajx.b(Context, progress, total, color,
 * cjjk)`, the one static (Context, I, I, I, L) method that makes NotificationCompat progress segments): the route's
 * `cjjk` field `o`, its `l` (`cjjj`), that one's list `b` of jams (`cjji`: d start m, e length m, c level 1 slower
 * traffic / 2 jam). Read in the builder's order: the two iget-objects, then the jam's int fields start, length, level.
 */
private fun BytecodePatchContext.trafficFields(route: ClassDef): Map<String, String> {
    val segmentParams = mutableSetOf<String>()
    classDefForEach { c ->
        c.methods.filter { it.returnType == "Landroid/app/Notification\$ProgressStyle\$Segment;" && it.parameterTypes.size == 1 }
            .forEach { segmentParams += it.parameterTypes.single().toString() }
    }
    dashGuard(segmentParams.size == 1, "expected one progress segment class, found $segmentParams")
    val segment = segmentParams.single()
    val builders = mutableListOf<Method>()
    classDefForEach { c ->
        if (c.type.startsWith("Lapp/morphe/")) return@classDefForEach
        c.methods.filter { m ->
            val p = m.parameterTypes.map { it.toString() }
            AccessFlags.STATIC.isSet(m.accessFlags) && p.size == 5 && p.subList(0, 4) == listOf(CONTEXT, "I", "I", "I") && p[4].startsWith("L") &&
                m.refs().any { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == segment }
        }.forEach { builders += it }
    }
    dashGuard(builders.size == 1, "expected one progress segments builder, found ${builders.map { "${it.definingClass}.${it.name}" }}")
    val builder = builders.single()
    val traffic = builder.parameterTypes.last().toString()
    val onRoute = route.fields.filter { it.type == traffic }
    dashGuard(onRoute.size == 1, "expected one $traffic field in ${route.type}, found ${onRoute.map { it.name }}")
    val fields = builder.refs().mapNotNull { i -> i.getReference<FieldReference>()?.takeIf { i.opcode == Opcode.IGET_OBJECT || i.opcode == Opcode.IGET } }
    val box = fields.firstOrNull { it.definingClass == traffic }
    val list = box?.let { b -> fields.firstOrNull { it.definingClass == b.type } }
    dashGuard(list != null, "no jam list read in ${builder.definingClass}.${builder.name}")
    val jamInts = fields.filter { it.type == "I" && it.definingClass != traffic && it.definingClass != box!!.type }
    val jam = jamInts.firstOrNull()?.definingClass
    val order = jamInts.filter { it.definingClass == jam }.map { it.name }.distinct()
    dashGuard(order.size == 3, "expected start, length and level in $jam, found $order")
    return mapOf(
        "traffic" to onRoute.single().name, "jamBox" to box!!.name, "jamList" to list!!.name,
        "jamStart" to order[0], "jamLength" to order[1], "jamLevel" to order[2],
    )
}

/** key → the field [c]'s toString() reads just before it loads the key's label. */
private fun labelledFields(c: ClassDef, labels: Map<String, String>): Map<String, String> {
    val code = c.methods.singleOrNull { it.name == "toString" && it.parameterTypes.isEmpty() }?.refs()
        ?: throw PatchException("Unrecognized Maps nav state: no toString in ${c.type}")
    val byLabel = mutableMapOf<String, String>()
    var last: String? = null
    for (i in code) {
        i.getReference<FieldReference>()?.takeIf { it.definingClass == c.type && i.opcode.name.startsWith("iget", ignoreCase = true) }
            ?.let { last = it.name }
        val label = i.getReference<StringReference>()?.string ?: continue
        if (label in labels.values && last != null) byLabel.putIfAbsent(label, last!!)
    }
    return labels.mapValues { (_, label) ->
        byLabel[label] ?: throw PatchException("Unrecognized Maps nav state: no \"$label\" field in ${c.type}")
    }
}

/**
 * Maps' picture-in-picture (26.45: `mve.onUserLeaveHint` enters it, `od` sets its auto-enter params) goes through the
 * bridge, which drops it while the rider has PiP off. Every Activity enterPictureInPictureMode(params) /
 * setPictureInPictureParams(params) call in Maps' own code becomes a static bridge call with the same registers.
 */
private fun BytecodePatchContext.pipHooks(): String {
    val bridgeCall = mapOf("enterPictureInPictureMode" to "enterPip", "setPictureInPictureParams" to "pipParams")
    val params = "Landroid/app/PictureInPictureParams;"
    fun isActivity(type: String): Boolean {
        var t: String? = type
        while (t != null) {
            if (t == ACTIVITY) return true
            t = classDefByOrNull(t)?.superclass
        }
        return false
    }
    fun Instruction.pip(): MethodReference? = getReference<MethodReference>()?.takeIf {
        it.name in bridgeCall && it.parameterTypes.map(CharSequence::toString) == listOf(params) &&
            (opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_VIRTUAL_RANGE) && isActivity(it.definingClass)
    }
    val found = mutableListOf<Pair<String, Method>>()
    classDefForEach { c ->
        if (c.type.startsWith("Lapp/morphe/")) return@classDefForEach // our bridge calls the real ones
        c.methods.forEach { m -> if (m.refs().any { it.pip() != null }) found += c.type to m }
    }
    dashGuard(found.any { (_, m) -> m.refs().any { it.pip()?.name == "enterPictureInPictureMode" } }, "no enterPictureInPictureMode call")
    var hooked = 0
    for ((type, method) in found) {
        val m = mutableClassDefBy(type).methods.single { it.toString() == method.toString() }
        m.refs().forEachIndexed { i, ins ->
            val ref = ins.pip() ?: return@forEachIndexed
            dashGuard(ins.opcode == Opcode.INVOKE_VIRTUAL, "range call to ${ref.name} in $type.${m.name}")
            val r = ins as FiveRegisterInstruction
            m.replaceInstruction(i, "invoke-static {v${r.registerC}, v${r.registerD}}, " +
                "$BRIDGE->${bridgeCall.getValue(ref.name)}($ACTIVITY$params)${ref.returnType}")
            hooked++
        }
    }
    return "$hooked calls in ${found.map { "${it.first}.${it.second.name}" }}"
}

/**
 * Maps' Settings → NMAX patch (NmaxSettings, attached through upstream's shared settings-rows hook): the last row of
 * the main page, Maps' own CustomSettingsPreference, opening a page of our own: a second instance of Maps' Settings
 * fragment (26.45 `awof`, the page whose onCreatePreferences builds CustomSettingsPreference rows) opened the way it
 * opens its sub-pages (`bw().af(fragment)` in its click handler), whose title getter (the class's one ()String) is
 * hooked and whose list NmaxSettings swaps for Maps' switch rows. Every obfuscated member is found by structure here
 * and written into NmaxSettings.names().
 */
private fun BytecodePatchContext.nmaxSettings(): String {
    val names = linkedMapOf<String, String>()
    fun javaName(type: String) = type.removePrefix("L").removeSuffix(";").replace('/', '.')
    fun MethodReference.params() = parameterTypes.map { it.toString() }

    // TwoStatePreference.setChecked: its one (Z)V writing two boolean fields of its own (mChecked, mCheckedSet).
    val twoState = classDefBy("Landroidx/preference/TwoStatePreference;")
    val setChecked = twoState.methods.filter { m ->
        m.parameterTypes.joinToString("") == "Z" && m.returnType == "V" &&
            m.booleanWrites().count { it.startsWith("${twoState.type}->") } >= 2
    }
    dashGuard(setChecked.size == 1, "expected one TwoStatePreference.setChecked, found ${setChecked.map { it.name }}")
    names["setChecked"] = setChecked.single().name
    dashGuard(classDefBy("Landroidx/preference/SwitchPreferenceCompat;").methods.any {
        it.name == "<init>" && it.parameterTypes.joinToString("") == "${CONTEXT}Landroid/util/AttributeSet;"
    }, "no (Context, AttributeSet) constructor in SwitchPreferenceCompat")

    // The Settings page and its onCreatePreferences(Bundle, String).
    val pages = mutableListOf<Pair<ClassDef, Method>>()
    classDefForEach { c ->
        c.methods.filter { m ->
            m.parameterTypes.joinToString("") == "${BUNDLE}Ljava/lang/String;" && m.returnType == "V" &&
                m.refs().count { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == CUSTOM_PREF } >= 3
        }.forEach { pages += c to it }
    }
    dashGuard(pages.size == 1, "expected one Settings page building CustomSettingsPreference rows, found ${pages.map { it.first.type }}")
    val (page, build) = pages.single()
    names["page"] = javaName(page.type)
    val calls = build.refs().mapNotNull { it.getReference<MethodReference>() }
    val create = calls.filter { it.returnType == SCREEN && it.params() == listOf(CONTEXT) }.distinctBy { it.toString() }
    dashGuard(create.size == 1, "expected one createPreferenceScreen(Context) in ${page.type}.${build.name}, found $create")
    val managerType = create.single().definingClass
    names["createScreen"] = create.single().name
    val fields = build.refs().mapNotNull { it.getReference<FieldReference>() }
    val manager = fields.filter { it.type == managerType }.distinctBy { it.toString() }
    val managerContext = fields.filter { it.definingClass == managerType && it.type == CONTEXT }.distinctBy { it.toString() }
    dashGuard(manager.size == 1 && managerContext.size == 1, "PreferenceManager fields in ${page.type}: $manager, $managerContext")
    names["manager"] = "${javaName(manager.single().definingClass)}#${manager.single().name}"
    names["managerContext"] = "${javaName(managerType)}#${managerContext.single().name}"
    val setScreen = calls.filter {
        it.params() == listOf(SCREEN) && it.returnType == "V" && !it.definingClass.startsWith("Landroidx/preference/")
    }.map { it.name }.distinct()
    dashGuard(setScreen.size == 1, "expected one setPreferenceScreen in ${page.type}.${build.name}, found $setScreen")
    names["setScreen"] = setScreen.single()

    // Sub-page navigation in the page's click handler: host = this.x(), host.y(fragment).
    val click = page.methods.single { it.parameterTypes.joinToString("") == PREFERENCE && it.returnType == "Z" }
    val clickCalls = click.refs().mapNotNull { it.getReference<MethodReference>() }
    val virtualCalls = click.refs().filter { it.opcode == Opcode.INVOKE_VIRTUAL || it.opcode == Opcode.INVOKE_INTERFACE }
        .mapNotNull { it.getReference<MethodReference>() }
    val nav = clickCalls.filter { it.parameterTypes.isEmpty() && it.returnType.startsWith("L") }.flatMap { getter ->
        virtualCalls.filter { it.definingClass == getter.returnType && it.parameterTypes.size == 1 && it.returnType == "V" }
            .map { getter.name to it.name }
    }.distinct()
    dashGuard(nav.size == 1, "expected one host.open(fragment) in ${page.type}.${click.name}, found $nav")
    names["host"] = nav.single().first
    names["nav"] = nav.single().second

    // The row icon: CustomSettingsPreference's icon lambda type, and the Compose painter-from-resource helper Maps'
    // own icon lambdas call between the composer's start/end group calls.
    val iconType = classDefBy(CUSTOM_PREF).methods.single { it.name == "<init>" && it.parameterTypes.size == 5 }
        .parameterTypes[4].toString()
    names["iconType"] = javaName(iconType)
    val lambdas = build.refs().filter { it.opcode == Opcode.NEW_INSTANCE }.mapNotNull { it.getReference<TypeReference>()?.type }
        .distinct().mapNotNull { classDefByOrNull(it) }.filter { iconType in it.interfaces }
    val painters = mutableSetOf<List<String>>()
    for (m in lambdas.flatMap { it.methods }) {
        val code = m.refs()
        code.forEachIndexed { i, ins ->
            val ref = ins.getReference<MethodReference>() ?: return@forEachIndexed
            if (ins.opcode != Opcode.INVOKE_STATIC || ref.parameterTypes.size != 3 || !ref.returnType.startsWith("L")) return@forEachIndexed
            val p = ref.params()
            if (p[0] != "I" || p[2] != "I") return@forEachIndexed
            val composer = p[1]
            val before = code.take(i).lastOrNull { it.getReference<MethodReference>() != null }?.getReference<MethodReference>()
            val after = code.drop(i + 1).firstOrNull { it.getReference<MethodReference>() != null }?.getReference<MethodReference>()
            if (before?.definingClass == composer && before.params() == listOf("I") && before.returnType == "V" &&
                after?.definingClass == composer && after.parameterTypes.isEmpty() && after.returnType == "V"
            ) painters += listOf(javaName(ref.definingClass), ref.name, before.name, after.name)
        }
    }
    dashGuard(painters.size == 1, "expected one painterResource helper in ${lambdas.map { it.type }}, found $painters")
    val painter = painters.single()
    names["iconOwner"] = painter[0]
    names["iconMethod"] = painter[1]
    names["groupStart"] = painter[2]
    names["groupEnd"] = painter[3]

    // Our page's title: the page's one ()String getter returns ours first when NmaxSettings knows the fragment.
    val title = page.methods.filter {
        it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" && !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    dashGuard(title.size == 1, "expected one title getter in ${page.type}, found ${title.map { it.name }}")
    val titleRegs = title.single().implementation?.registerCount ?: 0
    dashGuard(titleRegs in 2..16, "title getter ${page.type}.${title.single().name} has $titleRegs registers")
    mutableClassDefBy(page.type).methods.single { it.toString() == title.single().toString() }.addInstructionsWithLabels(0, """
        invoke-static {p0}, $SETTINGS->title(Ljava/lang/Object;)Ljava/lang/String;
        move-result-object v0
        if-eqz v0, :go
        return-object v0
        :go
        nop
    """.trimIndent())

    val packed = names.entries.joinToString(";") { "${it.key}=${it.value}" }
    dashGuard(packed.none { it == '"' || it == '\\' || it == '\n' }, "safe NMAX names: $packed")
    mutableClassDefBy(SETTINGS).methods.single { it.name == "names" }
        .replaceInstructions(0, "const-string v0, \"$packed\"\nreturn-object v0")
    enableSettingsRow("nmaxRow")
    return packed
}

/**
 * While the dash has the map, a pan or zoom on the phone's blank map would move the dash map unseen. Maps' gestures
 * live in its map container (`MapViewContainer`, a kept name; its onInterceptTouchEvent feeds the gesture code), so
 * the container gets a dispatchTouchEvent that swallows every touch while GmapsDashBridge.eatTouch says so. Maps'
 * cards and buttons are outside the container and keep working.
 */
private fun BytecodePatchContext.touchBlock(): String {
    val container = mutableClassDefBy(MAP_CONTAINER)
    dashGuard(container.methods.none { it.name == "dispatchTouchEvent" }, "${container.type} already has dispatchTouchEvent")
    val parent = container.superclass ?: throw PatchException("${container.type} has no superclass")
    val event = "Landroid/view/MotionEvent;"
    container.methods.add(MutableMethod(ImmutableMethod(container.type, "dispatchTouchEvent",
        listOf(ImmutableMethodParameter(event, null, null)), "Z", AccessFlags.PUBLIC.value, null, null,
        ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList()))).apply {
        addInstructionsWithLabels(0, """
            invoke-static {p0}, $BRIDGE->eatTouch(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :pass
            const/4 v0, 0x1
            return v0
            :pass
            invoke-super {p0, p1}, $parent->dispatchTouchEvent($event)Z
            move-result v0
            return v0
        """.trimIndent())
    })
    return "${container.type} (super $parent)"
}

private fun ClassDef.hasString(s: String) = methods.any { m -> m.refs().any { it.getReference<StringReference>()?.string == s } }

private fun BytecodePatchContext.mapView(): ClassDef {
    val found = mutableListOf<ClassDef>()
    classDefForEach { c ->
        if (c.superclass == SURFACE_VIEW && CALLBACK in c.interfaces &&
            c.methods.any { it.name == "setGlThreadPriority" && it.parameterTypes.joinToString("") == "I" }
        ) found += c
    }
    dashGuard(found.size == 1, "expected one GL SurfaceView, found ${found.map { it.type }}")
    return found.single()
}

private fun Method.refs(): List<Instruction> = implementation?.instructions?.toList() ?: emptyList()

private fun Method.callsInto(type: String) =
    refs().any { it.getReference<MethodReference>()?.definingClass == type }

private fun Method.creates(type: String) =
    refs().any { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == type }

/** The first virtual call on [type] after `new-instance type`. */
private fun Method.callsAfterNew(type: String): MethodReference? {
    val code = refs()
    val start = code.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == type }
    if (start < 0) return null
    return code.drop(start).firstNotNullOfOrNull { i ->
        i.getReference<MethodReference>()?.takeIf { i.opcode == Opcode.INVOKE_VIRTUAL && it.definingClass == type }
    }
}

private fun Method.booleanWrites() =
    refs().filter { it.opcode == Opcode.IPUT_BOOLEAN }.mapNotNull { it.getReference<FieldReference>()?.toString() }

/** The view's one no-arg method whose only call is `glThread.name()`. */
private fun ClassDef.forwarder(glType: String, name: String): Method {
    val found = methods.filter { m ->
        m.parameterTypes.isEmpty() && m.returnType == "V" && m.name != "onAttachedToWindow" &&
            m.refs().mapNotNull { it.getReference<MethodReference>() }.let { calls ->
                calls.size == 1 && calls[0].definingClass == glType && calls[0].name == name
            }
    }
    dashGuard(found.size == 1, "expected one view method forwarding to GL $name, found ${found.map { it.name }}")
    return found.single()
}

/** `holder = Bridge.x(this, holder, ...); if (holder == null) return;` — p1 is the holder. */
private fun MutableMethod.hookHolder(registers: String, signature: String) = addInstructionsWithLabels(0, """
    invoke-static $registers, $BRIDGE->$signature
    move-result-object p1
    if-nez p1, :go
    return-void
    :go
    nop
""".trimIndent())

/** `this = Bridge.x(this); if (this == null) return;` — the cast keeps the verifier's type for p0. */
private fun MutableMethod.hookSelf(name: String, viewType: String) = addInstructionsWithLabels(0, """
    invoke-static {p0}, $BRIDGE->$name(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    if-nez p0, :go
    return-void
    :go
    check-cast p0, $viewType
""".trimIndent())
