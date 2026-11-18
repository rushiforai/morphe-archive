package io.github.sabopura.morphe.patches.twitch.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_SUPPORTED
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.enableTwitchFeature
import io.github.sabopura.morphe.patches.twitch.support.freeLocalAt
import io.github.sabopura.morphe.patches.twitch.support.softHook
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import java.util.logging.Logger

private const val RN_FEED = "Ltv/twitch/android/feature/discovery/feed/rn/feed/"
private const val PREWARMER = "${RN_FEED}TwitchRNFeedPrewarmer;"
internal const val RN_HOME_RESOLVER = "${RN_FEED}DiscoveryFeedRNFragment\$NavResolver;"
private const val CLASSIC_HOME = "Lio/github/sabopura/morphe/extension/twitch/app/ClassicHome;"
private val PLATFORM = listOf("Ljava/", "Lkotlin/", "Landroid/", "Landroidx/")

private fun Method.calls(): List<MethodReference> =
    (implementation?.instructions ?: emptyList()).mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }

private fun Method.builtTypes(): List<String> = (implementation?.instructions ?: emptyList())
    .filter { it.opcode == Opcode.NEW_INSTANCE }
    .map { ((it as ReferenceInstruction).reference as TypeReference).type }

private fun Method.answersLike(call: MethodReference) =
    name == call.name && parameterTypes.isEmpty() && returnType == "Z"

/** Twitch's "use the React Native screens (Ultralight)" decision, as [prewarm] asks it: its one no-argument boolean call into app code. */
internal fun ultralightDecisionCall(prewarm: Method): MethodReference =
    prewarm.calls().filter { call ->
        call.parameterTypes.isEmpty() && call.returnType == "Z" && PLATFORM.none { call.definingClass.startsWith(it) }
    }.distinct().uniqueContract("Classic home: Ultralight decision in prewarmIfEnabled")

/** The method that answers [call]: the callee itself, or the single concrete override when it is abstract. */
internal fun decisionBody(call: MethodReference, owner: ClassDef, implementors: () -> List<ClassDef>): Pair<ClassDef, Method> {
    val declared = owner.methods.filter { it.answersLike(call) }.uniqueContract("Classic home: $call declared")
    if (declared.implementation != null) return owner to declared
    return implementors().flatMap { type -> type.methods.filter { it.answersLike(call) && it.implementation != null }.map { type to it } }
        .uniqueContract("Classic home: implementation of $call")
}

/**
 * The home Twitch shows when the decision says no. The home picker builds either [rnHome] or this
 * native destination; without it, forcing the decision off would leave the app without a home.
 */
internal fun nativeHomeDestination(picker: Method, rnHome: String, isDestination: (String) -> Boolean): String =
    picker.builtTypes().filter { it != rnHome && isDestination(it) }.distinct()
        .uniqueContract("Classic home: native home destination in ${picker.definingClass}->${picker.name}")

/** At the decision's entry: when the user chose the classic home, answer no as Twitch does for a block-listed device. */
internal fun MutableMethod.answerNoForClassicHome() {
    val scratch = freeLocalAt(this, 0)?.takeIf { it < 16 }
        ?: throw PatchException("Classic home: no free low register at the start of $definingClass->$name")
    addInstructionsWithLabels(0, """
        invoke-static {}, $CLASSIC_HOME->forced()Z
        move-result v$scratch
        if-eqz v$scratch, :twitch
        const/4 v$scratch, 0x0
        return v$scratch
    """, ExternalLabel("twitch", getInstruction(0)))
}

private fun BytecodePatchContext.hookUltralightDecision(): Boolean {
    val prewarmer = classDefByOrNull(PREWARMER)
    if (prewarmer == null) {
        if (classDefByOrNull(RN_HOME_RESOLVER) != null) throw PatchException("Classic home: TwitchRNFeedPrewarmer moved")
        Logger.getLogger("SabopuraTwitch.ClassicHome").info("No React Native home in this version")
        return false
    }
    val prewarm = prewarmer.methods.filter {
        it.name == "prewarmIfEnabled" && it.parameterTypes.map { p -> p.toString() } == listOf("Landroid/content/Context;")
    }.uniqueContract("Classic home: prewarmIfEnabled")
    val call = ultralightDecisionCall(prewarm)
    val (owner, decision) = decisionBody(call, classDefBy(call.definingClass)) {
        classesMatching { call.definingClass in it.interfaces || it.superclass == call.definingClass }
    }
    val asked = setOf(call.toString(), "${owner.type}->${decision.name}()Z")
    val rnHome = classDefBy(RN_HOME_RESOLVER).methods.filter {
        it.name == "createBundle" && !AccessFlags.BRIDGE.isSet(it.accessFlags) && it.parameterTypes.size == 1
    }.uniqueContract("Classic home: React Native home destination").parameterTypes.single().toString()
    fun picks(method: Method) = rnHome in method.builtTypes() && method.calls().any { it.toString() in asked }
    val picker = classesMatching { type -> type.methods.any(::picks) }
        .flatMap { type -> type.methods.filter(::picks) }.uniqueContract("Classic home: home destination picker")
    val nativeHome = nativeHomeDestination(picker, rnHome) { type ->
        classDefByOrNull(type)?.let { picker.returnType in it.interfaces || it.superclass == picker.returnType } == true
    }
    mutableClassDefBy(owner).methods.filter { it.answersLike(call) }.uniqueContract("Classic home: mutable decision")
        .answerNoForClassicHome()
    Logger.getLogger("SabopuraTwitch.ClassicHome")
        .info("Classic home: hooked ${owner.type}->${decision.name}()Z; home picker ${picker.definingClass}->${picker.name} builds $nativeHome")
    return true
}

/**
 * Offers Twitch's native home instead of the React Native one that Twitch 31.9.0 and later show
 * signed-in phones. The card size, the recommended streams and the recap cards only reach the native
 * home; what [newHomeFeedHook] hides works on both.
 * Twitch 30.7.2 has no React Native home, so nothing changes there.
 */
internal val classicHomePatch = bytecodePatch(
    description = "Lets the user switch back to Twitch's native home screen.",
) {
    compatibleWith(TWITCH_SUPPORTED)
    extendWith(TWITCH_EXTENSION)
    var hooked = false
    execute {
        hooked = false
        // The switch only adds a choice: the patches that depend on this still apply without it.
        softHook("Classic home") { hooked = hookUltralightDecision() }
    }
    finalize { if (hooked) enableTwitchFeature("CLASSIC_HOME") }
}
