/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.links

import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val MINI_APP_LOCATION = "$EXTENSION_PACKAGE/misc/MiniAppLocation;"
internal const val GEO_CALLBACK = "Landroid/webkit/GeolocationPermissions\$Callback;"
internal const val GEO_INVOKE = "$GEO_CALLBACK->invoke(Ljava/lang/String;ZZ)V"
internal const val SHOW_PROMPT = "onGeolocationPermissionsShowPrompt"
private const val LOCATION = "Landroid/location/Location;"
private const val LOCATION_LISTENER = "Landroid/location/LocationListener;"
/** What a location's coordinates and how sure they are can be read through. */
private val COORDINATES = setOf("getLatitude()D", "getLongitude()D", "getAltitude()D", "getAccuracy()F")
    .map { "$LOCATION->$it" }.toSet()
private const val JSON = "Lorg/json/JSONObject;"
private const val BOT_LOCATION_PREFS = "botlocation_"
private const val GPS_FEATURE = "android.hardware.location.gps"
private const val HAS_FEATURE = "Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z"

/** Where the location switch asks, and what a yes does there, in [size] instructions. */
internal enum class LocationGate(val code: String, val labeled: Boolean, val size: Int) {
    /** The bot location manager's GPS check answers no, so no location is asked for. */
    GPS("""
        invoke-static {}, $MINI_APP_LOCATION->refuse()Z
        move-result v0
        if-eqz v0, :hush_stock
        const/4 v0, 0x0
        return v0
    """, true, 5),

    /** The manager's answer for a Mini App gets no location, so it says location isn't available. */
    ANSWER("""
        invoke-static/range {p0 .. p0}, $MINI_APP_LOCATION->location($LOCATION)$LOCATION
        move-result-object p0
    """, false, 2),

    /** The web view's geolocation prompt refuses the page itself and shows no dialog. */
    PROMPT("""
        invoke-static/range {p1 .. p2}, $MINI_APP_LOCATION->refusePrompt(Ljava/lang/String;Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :hush_stock
        return-void
    """, true, 4),

    /** Telegram's geolocation dialog, once answered, answers no. */
    DIALOG("""
        invoke-static/range {p1 .. p1}, $MINI_APP_LOCATION->answer(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object p1
    """, false, 2),
}

/** Each gate's method, found and checked before anything is edited, or [missing], why this build can't keep location. */
internal class MiniAppLocationPlan(val gates: Map<LocationGate, MutableMethod>, val missing: String?) {
    /** Every edit, on the methods themselves or on what [into] makes of each. */
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        for ((gate, method) in gates) {
            val target = into(method)
            val before = target.implementation!!.instructions.size
            if (gate.labeled) target.addInstructionsWithLabels(0, gate.code, ExternalLabel("hush_stock", target.getInstruction(0)))
            else target.addInstructions(0, gate.code)
            // smali drops an instruction it can't build, a register out of reach among them, and only logs it.
            need(target.implementation!!.instructions.size - before == gate.size,
                "the $gate gate didn't compile whole in ${method.definingClass}->${method.name}")
        }
    }

    /**
     * The same edits on copies, so a smali or register problem shows before the app is touched. A
     * snippet smali refuses outright comes back as no class, which the patcher trips over as an
     * empty collection or a null, so any failure on the copies is a reason to leave the switch out.
     */
    fun rehearse() = try {
        apply { MutableMethod(ImmutableMethod.of(it)) }
    } catch (failed: RuntimeException) {
        throw Ungated("the location gates don't compile (${failed.javaClass.simpleName}: ${failed.message})")
    }

    companion object {
        fun missing(why: String) = MiniAppLocationPlan(emptyMap(), why)
    }
}

/** The runtime the gates call. It's the extension's own, so a change there refuses the patch. */
internal fun BytecodePatchContext.requireMiniAppLocationRuntime() {
    requireStatusMethod("miniAppLocation")
    controlHook(MINI_APP_LOCATION, "refuse", listOf(), "Z")
    controlHook(MINI_APP_LOCATION, "location", listOf(LOCATION), LOCATION)
    controlHook(MINI_APP_LOCATION, "refusePrompt", listOf("Ljava/lang/String;", "Ljava/lang/Object;"), "Z")
    controlHook(MINI_APP_LOCATION, "answer", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;")
}

/** Why this build's location paths can't be gated. */
private class Ungated(val why: String) : Exception(why)

private fun need(ok: Boolean, why: String) {
    if (!ok) throw Ungated(why)
}

/**
 * A Mini App gets the phone's location from Telegram's bot location manager, the one class that keeps
 * its choices in a "botlocation_" file. It checks the phone has GPS before every request and check,
 * and turns every location it reads, at once or from a listener that comes back later, into the
 * Mini App's answer through one static method. A web page asks through the one web view geolocation
 * prompt in the app, whose dialog hands its answer to one class, and nothing else answers those
 * prompts. Each must still be that shape, or the switch is left out.
 */
internal fun BytecodePatchContext.resolveMiniAppLocation(): MiniAppLocationPlan = try {
    // Rehearsed here, so edits that don't fit this build leave the switch out rather than the patch.
    MiniAppLocationPlan(gates(), null).also { it.rehearse() }
} catch (ungated: Ungated) {
    MiniAppLocationPlan.missing(ungated.why)
}

private fun ClassDef.isOwn() = type.startsWith("Lapp/hushtelegram/")

private fun Method.static() = AccessFlags.STATIC.isSet(accessFlags)

private fun Method.strings() = controlBody().mapNotNull { it.controlString() }.toSet()

private fun BytecodePatchContext.gates(): Map<LocationGate, MutableMethod> {
    val managers = mutableListOf<String>()
    forEachClassMentioning(Mention.string(BOT_LOCATION_PREFS)) { cls ->
        if (!cls.isOwn() && cls.methods.any { BOT_LOCATION_PREFS in it.strings() }) managers += cls.type
    }
    need(managers.size == 1, "the bot location manager is missing or ambiguous")
    val manager = tgMutableClassDefBy(managers.single())
    val gps = manager.methods.filter { !it.static() && it.parameterTypes.isEmpty() && it.origReturnType == "Z" &&
        GPS_FEATURE in it.strings() && it.controlBody().any { i -> i.controlRef() == HAS_FEATURE } }
    need(gps.size == 1, "the bot location manager's GPS check is missing or ambiguous")
    val answers = manager.methods.filter { it.static() && it.parameterTypes.map(CharSequence::toString) == listOf(LOCATION) &&
        it.origReturnType == JSON }
    need(answers.size == 1 && "latitude" in answers.single().strings(), "the bot location manager's answer is missing or ambiguous")
    // Another method building coordinates would hand them out around the answer.
    need(manager.methods.count { "latitude" in it.strings() } == 1, "the bot location manager builds coordinates outside its answer")
    // A fix that comes in later reaches the Mini App through a listener the manager makes. It has to
    // go through the answer too: with the answer folded into it, the gate there would never run.
    val answerRef = answers.single().let { "${it.origDefiningClass}->${it.origName}($LOCATION)$JSON" }
    val listeners = manager.methods.flatMap { m -> m.controlBody().filter { it.opcode == Opcode.NEW_INSTANCE }.mapNotNull { it.controlRef() } }
        .distinct().mapNotNull { tgClassDefByOrNull(it) }.filter { isLocationListener(it.type) }
    need(listeners.isNotEmpty(), "the bot location manager's listener for later fixes is missing")
    for (listener in listeners) {
        val changed = listener.methods.filter { it.origName == "onLocationChanged" && it.origReturnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(LOCATION) }
        need(changed.size == 1 && changed.single().controlBody().any { it.controlRef() == answerRef },
            "${listener.type} hands a later fix on without the bot location manager's answer")
        // A parent Telegram carries runs on the same fix (a super call, say), so it's held to the same rule.
        need(lineage(listener.type).none { cls -> cls.methods.any { m -> "latitude" in m.strings() ||
            m.controlBody().any { it.controlRef() in COORDINATES } } },
            "${listener.type} reads coordinates outside the bot location manager's answer")
    }

    val callers = mutableListOf<String>()
    forEachClassMentioning(Mention.reference(GEO_INVOKE)) { cls ->
        if (!cls.isOwn() && cls.methods.any { m -> m.controlBody().any { it.controlRef() == GEO_INVOKE } }) callers += cls.type
    }
    val promptOwners = mutableListOf<String>()
    classDefForEach { cls ->
        if (!cls.isOwn() && cls.methods.any { it.isPrompt() }) promptOwners += cls.type
    }
    val prompts = promptOwners.flatMap { owner -> tgMutableClassDefBy(owner).methods.filter { it.isPrompt() } }
    need(prompts.size == 1, "the web view geolocation prompt is missing or ambiguous")
    val prompt = prompts.single()
    val made = prompt.controlBody().filter { it.opcode == Opcode.NEW_INSTANCE }.mapNotNull { it.controlRef() }.distinct()
    val dialogs = made.mapNotNull { tgMutableClassDefByOrNull(it) }.filter { cls ->
        cls.methods.any { it.origName == "<init>" && GEO_CALLBACK in it.origParameterTypes.map(CharSequence::toString) }
    }
    need(dialogs.size == 1, "the geolocation dialog's answer is missing or ambiguous")
    val dialog = dialogs.single().methods.filter { it.origName == "accept" && !it.static() &&
        it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;") && it.origReturnType == "V" &&
        it.controlBody().any { i -> i.controlRef() == GEO_INVOKE } }
    need(dialog.size == 1, "the geolocation dialog's answer no longer answers the page")
    val others = callers.filter { it != prompt.origDefiningClass && it != dialog.single().origDefiningClass }.sorted()
    need(others.isEmpty(), "something else answers web pages' location prompts (${others.joinToString()})")

    val gates = mapOf(
        LocationGate.GPS to gps.single(),
        LocationGate.ANSWER to answers.single(),
        LocationGate.PROMPT to prompt,
        LocationGate.DIALOG to dialog.single(),
    )
    for ((gate, method) in gates) {
        val where = "${method.definingClass}->${method.name}"
        if (gate.labeled) {
            val locals = try {
                method.localRegisterCount()
            } catch (failed: PatchException) {
                throw Ungated("$where's registers can't be read (${failed.message})")
            }
            need(locals >= 1, "$where has no local to answer in")
        } else {
            // The others write their answer back to the last parameter, which move-result reaches only below 256.
            need(method.implementation!!.registerCount <= 256, "$where keeps its parameter past register 255")
        }
        val flow = try {
            ControlFlow.of(method)
        } catch (failed: IllegalArgumentException) {
            throw Ungated("$where's control flow can't be read (${failed.message})")
        }
        need(flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it }, "something jumps back to the start of $where")
    }
    return gates
}

/** Whether [type] is a LocationListener, itself or through a parent class or interface Telegram carries. */
private fun BytecodePatchContext.isLocationListener(type: String, depth: Int = 0): Boolean {
    if (type == LOCATION_LISTENER) return true
    if (depth > 8) return false
    val cls = tgClassDefByOrNull(type) ?: return false
    return cls.interfaces.any { isLocationListener(it, depth + 1) } || cls.superclass?.let { isLocationListener(it, depth + 1) } == true
}

/** [type] and every parent class and interface of it that Telegram carries, up to 8 deep. */
private fun BytecodePatchContext.lineage(type: String): List<ClassDef> {
    val found = linkedMapOf<String, ClassDef>()
    fun walk(at: String, depth: Int) {
        if (depth > 8 || at in found) return
        val cls = tgClassDefByOrNull(at) ?: return
        found[at] = cls
        cls.superclass?.let { walk(it, depth + 1) }
        cls.interfaces.forEach { walk(it, depth + 1) }
    }
    walk(type, 0)
    return found.values.toList()
}

private fun Method.isPrompt() = name == SHOW_PROMPT && returnType == "V" && !static() &&
    parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", GEO_CALLBACK)
