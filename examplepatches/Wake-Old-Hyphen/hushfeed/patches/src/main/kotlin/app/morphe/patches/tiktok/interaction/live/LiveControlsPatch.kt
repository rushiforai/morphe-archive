/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.interaction.live

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch
import app.morphe.patches.tiktok.shared.guardAtEntry
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION = "Lapp/morphe/extension/tiktok/live/LiveControls;"

/** The feed LIVE preview's guide, real-named on 47.0.3, 47.1.3 and 47.1.4. */
internal const val LIVE_PREVIEW_GUIDE_VM = "Lcom/ss/android/ugc/aweme/feed/adapter/widget/guide/LivePreviewGuideEnterVM;"

/**
 * Starts the countdown that takes a LIVE preview in the feed into its room: it checks the feed
 * (homepage_hot for For You, homepage_live for the LIVE tab behind
 * live_preview_page_enable_auto_entering_guide, and it returns on homepage_follow), then either
 * hands a smart countdown to LivePreviewEnterRoomGuideManager or arms a fixed one of
 * live_preview_page_auto_entering_request_delay seconds. When that fires, BottomTipsWidget runs
 * its AutoEnterProgressBar for live_preview_page_auto_entering_guide_duration seconds, and the
 * bar's listener enters the room with "enter_room". Renamed on every build (O63 on 47.0.3, E83 on
 * 47.1.3 and 47.1.4); the only method that loads the enable key. It already returns early on
 * the Following feed and once a countdown has started, so returning at entry is a state TikTok
 * handles: no countdown, no bar, and the preview stays a preview until it's tapped.
 */
internal object LivePreviewAutoEnterFingerprint : Fingerprint(
    definingClass = LIVE_PREVIEW_GUIDE_VM,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    strings = listOf("live_preview_page_enable_auto_entering_guide", "homepage_follow"),
)

/** The LIVE room's top-right viewer count, real-named on 47.0.3, 47.1.3 and 47.1.4. */
internal const val ONLINE_AUDIENCE_RANK_WIDGET = "Lcom/bytedance/android/livesdk/rank/impl/widget/OnlineAudienceRankWidget;"

/** How many places the widget turns the viewer count into text; the same on all three builds. */
internal const val VIEWER_COUNT_SITES = 4

/**
 * The viewer count in a programmed LIVE (a scheduled show with a lineup), collapsed, expanded and
 * in landscape; real-named on 47.0.3, 47.1.3 and 47.1.4. Each formats its count once, through the
 * same abbreviator as [ONLINE_AUDIENCE_RANK_WIDGET].
 */
internal val PROGRAMMED_AUDIENCE_WIDGETS = listOf(
    "Lcom/bytedance/android/livesdk/programmedlive/ui/ProgrammedLiveOnlineAudienceCollapseWidget;",
    "Lcom/bytedance/android/livesdk/programmedlive/ui/ProgrammedLiveOnlineAudienceExpandWidget;",
    "Lcom/bytedance/android/livesdk/programmedlive/ui/ProgrammedLiveOnlineAudienceLandscapeWidget;",
)

/**
 * One place a widget formats the viewer count: `int-to-long vLow, vCount`, a static (J)String
 * formatter called on the pair (vLow, vLow + 1) and `move-result-object vResult`. Then either
 * `sget-object Locale.ENGLISH` and `toUpperCase` on vResult (the room's top-right count) or a
 * (String)String wrap of vResult (the programmed widgets' text direction wrap). [formatIndex] is
 * the formatter call.
 */
internal data class ViewerCountSite(
    val method: Method,
    val formatIndex: Int,
    val pairLow: Int,
    val result: Int,
) {
    /** The formatter, as `class->name`. */
    val formatter: String
        get() = ((method.implementation!!.instructions.toList()[formatIndex] as ReferenceInstruction).reference as MethodReference)
            .let { "${it.definingClass}->${it.name}" }
}

/**
 * Every call in [widget] to a static (J)Ljava/lang/String; helper that isn't the JDK's, or only
 * those to [formatter] when given. That helper is the "K+", "M+" and "B+" abbreviator (X.0LE4.LIZJ
 * on 47.0.3, X.0LDD on 47.1.3, X.0LDH on 47.1.4), renamed per build, so the shape is matched, not
 * the name. Throws if any such call has a shape the hook can't take: a site the patch skipped would
 * keep showing the rounded count with nothing to say so.
 */
internal fun viewerCountSites(widget: ClassDef, formatter: String? = null): List<ViewerCountSite> {
    val sites = mutableListOf<ViewerCountSite>()
    for (method in widget.methods) {
        val instructions = method.implementation?.instructions?.toList() ?: continue
        instructions.forEachIndexed { index, instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@forEachIndexed
            if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) {
                return@forEachIndexed
            }
            if (call.returnType != "Ljava/lang/String;" ||
                call.parameterTypes.map(CharSequence::toString) != listOf("J")
            ) {
                return@forEachIndexed
            }
            if (call.definingClass.startsWith("Ljava/")) return@forEachIndexed
            if (formatter != null && "${call.definingClass}->${call.name}" != formatter) return@forEachIndexed
            val where = "${widget.type}->${method.name} at $index"
            val invoke = instruction as? FiveRegisterInstruction
                ?: throw PatchException("LIVE controls: viewer count call is not a plain invoke at $where")
            val low = invoke.registerC
            val widened = instructions.getOrNull(index - 1)
            val moved = instructions.getOrNull(index + 1)
            val result = (moved as? OneRegisterInstruction)?.registerA
            val shaped = invoke.registerCount == 2 && invoke.registerD == low + 1 &&
                widened?.opcode == Opcode.INT_TO_LONG &&
                (widened as TwoRegisterInstruction).registerA == low &&
                moved?.opcode == Opcode.MOVE_RESULT_OBJECT && result != null &&
                (upperCased(instructions, index + 2, result) || wrapped(instructions, index + 2, result))
            if (!shaped) throw PatchException("LIVE controls: viewer count call has an unexpected shape at $where")
            sites += ViewerCountSite(method, index, low, result!!)
        }
    }
    return sites
}

/** `sget-object Locale.ENGLISH`, then `toUpperCase` on [result]. */
private fun upperCased(instructions: List<Instruction>, at: Int, result: Int): Boolean {
    val localeGet = instructions.getOrNull(at)
    val locale = (localeGet as? ReferenceInstruction)?.reference as? FieldReference
    val upper = instructions.getOrNull(at + 1)
    val upperCall = (upper as? ReferenceInstruction)?.reference as? MethodReference
    return localeGet?.opcode == Opcode.SGET_OBJECT &&
        locale?.definingClass == "Ljava/util/Locale;" && locale?.name == "ENGLISH" &&
        upper?.opcode == Opcode.INVOKE_VIRTUAL && upperCall?.name == "toUpperCase" &&
        (upper as? FiveRegisterInstruction)?.registerC == result
}

/** An instance (String)String call that takes [result] as its argument. */
private fun wrapped(instructions: List<Instruction>, at: Int, result: Int): Boolean {
    val wrap = instructions.getOrNull(at) as? FiveRegisterInstruction ?: return false
    val wrapCall = (wrap as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return wrap.opcode == Opcode.INVOKE_VIRTUAL && wrapCall.returnType == "Ljava/lang/String;" &&
        wrapCall.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
        wrap.registerCount == 2 && wrap.registerD == result
}

@Suppress("unused")
val liveControlsPatch = bytecodePatch(
    name = "LIVE controls",
    description = "Adds a switch that stops a LIVE in the feed counting down and taking you into the room on its " +
        "own, so you stay in the feed until you tap it, and one that shows a LIVE's exact viewer count instead " +
        "of TikTok's rounded one. Switches: Hushfeed settings > Playback.",
) {
    category("Playback")
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        val guide = LivePreviewAutoEnterFingerprint.method
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableLiveControls()V",
        )
        guide.guardAtEntry(
            "LIVE controls",
            "invoke-static {}, $EXTENSION->skipAutoEnter()Z",
            "return-void",
        )

        // The formatter's result lands in the upper half of the long it was given, so the count
        // can't be read back after the call and the hook needs no spare register: the count is
        // handed over before the call and TikTok's text after it, on the main thread in one
        // straight line of code, and the extension answers with the exact number or TikTok's
        // text. Both added calls use only registers the original instructions just wrote: the
        // first reads the pair int-to-long filled, the second reads and rewrites the register
        // move-result-object filled. No frame grows.
        val widget = classDefByOrNull(ONLINE_AUDIENCE_RANK_WIDGET)
            ?: throw PatchException("LIVE controls: $ONLINE_AUDIENCE_RANK_WIDGET not found")
        val sites = viewerCountSites(widget)
        if (sites.size != VIEWER_COUNT_SITES) {
            throw PatchException("LIVE controls: expected $VIEWER_COUNT_SITES viewer count calls, found ${sites.size}")
        }
        val formatter = sites.map { it.formatter }.distinct().singleOrNull()
            ?: throw PatchException("LIVE controls: the viewer count calls use more than one formatter")
        hookViewerCounts(ONLINE_AUDIENCE_RANK_WIDGET, sites)

        // A programmed LIVE shows its count in its own widgets, through the same formatter.
        PROGRAMMED_AUDIENCE_WIDGETS.forEach { type ->
            val programmed = classDefByOrNull(type) ?: throw PatchException("LIVE controls: $type not found")
            val found = viewerCountSites(programmed, formatter)
            if (found.size != 1) {
                throw PatchException("LIVE controls: expected one viewer count call in $type, found ${found.size}")
            }
            hookViewerCounts(type, found)
        }
    }
}

/**
 * Hands each site's count to the extension before the formatter and swaps TikTok's text for the
 * extension's after it.
 */
private fun BytecodePatchContext.hookViewerCounts(type: String, sites: List<ViewerCountSite>) {
    val mutableWidget = mutableClassDefBy(type)
    for ((method, group) in sites.groupBy { it.method }) {
        val mutable = mutableWidget.findMutableMethodOf(method)
        // Last site first, so an earlier site's index is still right when it is edited.
        for (site in group.sortedByDescending { it.formatIndex }) {
            mutable.hookViewerCount(site)
        }
    }
}

/** The two calls around one site; both use only the registers the site's own instructions write. */
internal fun MutableMethod.hookViewerCount(site: ViewerCountSite) {
    addInstructions(
        site.formatIndex + 2,
        "invoke-static/range {v${site.result} .. v${site.result}}, $EXTENSION->viewerCountText(Ljava/lang/String;)" +
            "Ljava/lang/String;\nmove-result-object v${site.result}",
    )
    addInstruction(
        site.formatIndex,
        "invoke-static/range {v${site.pairLow} .. v${site.pairLow + 1}}, $EXTENSION->noteViewerCount(J)V",
    )
}
