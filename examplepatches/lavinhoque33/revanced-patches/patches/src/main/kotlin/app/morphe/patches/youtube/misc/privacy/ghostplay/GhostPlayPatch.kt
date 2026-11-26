/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/5197
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-25.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.patches.youtube.misc.privacy.ghostplay

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.misc.request.buildRequestPatch
import app.morphe.patches.shared.misc.request.hasNativeMediaHeaderBridge
import app.morphe.patches.shared.misc.request.hasNativeMediaRequestHook
import app.morphe.patches.shared.misc.request.hookBuildRequest
import app.morphe.patches.shared.misc.request.hookMediaRequest
import app.morphe.patches.shared.misc.request.mediaRequestPatch
import app.morphe.patches.shared.trackingurlhook.hookTrackingUrl
import app.morphe.patches.shared.trackingurlhook.trackingUrlHookPatch
import app.morphe.patches.youtube.general.downloads.videoFlyoutMenuHookPatch
import app.morphe.patches.youtube.player.overlaybuttons.overlayButtonsPatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.navigation.addBrowseIdHook
import app.morphe.patches.youtube.utils.navigation.addSearchResultsHook
import app.morphe.patches.youtube.utils.navigation.browseIdHookPatch
import app.morphe.patches.youtube.utils.navigation.navigationBarHookPatch
import app.morphe.patches.youtube.utils.patch.PatchList.GHOST_PLAY
import app.morphe.patches.youtube.utils.playercontrols.injectControl
import app.morphe.patches.youtube.utils.playercontrols.playerControlsPatch
import app.morphe.patches.youtube.utils.playservice.is_20_26_or_greater
import app.morphe.patches.youtube.utils.playservice.versionCheckPatch
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.patches.youtube.utils.toolbar.hookToolBarWithImageView
import app.morphe.patches.youtube.utils.toolbar.toolBarHookPatch
import app.morphe.patches.youtube.video.information.hookVideoInformation
import app.morphe.patches.youtube.video.information.videoInformationPatch
import app.morphe.patches.youtube.video.playerresponse.Hook
import app.morphe.patches.youtube.video.playerresponse.addPlayerResponseMethodHook
import app.morphe.patches.youtube.video.videoid.hookVideoId
import app.morphe.util.ResourceGroup
import app.morphe.util.Utils.printWarn
import app.morphe.util.copyResources
import app.morphe.util.findElementByAttributeValue
import app.morphe.util.setExtensionIsPatchIncluded
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val EXTENSION = "Lapp/morphe/extension/youtube/patches/ghostplay/GhostPlayPatch;"
private const val TOOLBAR = "Lapp/morphe/extension/youtube/patches/ghostplay/GhostPlayToolbarButton;"
private const val BUTTON = "Lapp/morphe/extension/youtube/videoplayer/GhostPlayButton;"

private var linked = false

private val ghostPlayBytecodePatch = bytecodePatch(description = "Links Ghost mode playback and tracking hooks.") {
    dependsOn(
        sharedExtensionPatch,
        versionCheckPatch,
        videoFlyoutMenuHookPatch,
        playerControlsPatch,
        videoInformationPatch,
        navigationBarHookPatch,
        browseIdHookPatch,
        toolBarHookPatch,
        trackingUrlHookPatch,
        buildRequestPatch,
        mediaRequestPatch,
    )

    execute {
        linked = false
        if (!is_20_26_or_greater) {
            printWarn("Ghost mode not applied: pre-20.26 tracking and native header linkage is unverified.")
            return@execute
        }

        // Resolve every tracking hook before mutating any of them. No partial protection or UI.
        val vss2Ping = VideoStats2SendPingFingerprint.matchOrNull()?.method
        val vss2Log = VideoStats2LogEventFingerprint.matchOrNull()?.method
        val vss2Id = VideoStats2DocIdFingerprint.matchOrNull()?.instructionMatches?.get(3)?.fieldReference
        val vss3Segment = VideoStats3FinishSegmentFingerprint.matchOrNull()?.method
        val vss3Id = VideoStats3SegmentIdsFingerprint.matchOrNull()?.instructionMatches?.get(2)?.fieldReference
        val vss3Site = vss3Segment?.segmentGuardSite()
        val ptrackingMatch = PtrackingSendFingerprint.matchOrNull()
        val ptracking = ptrackingMatch?.method
        val ptrackingUriIndex = ptrackingMatch?.instructionMatches?.first()?.index
        val ptrackingUri = ptrackingUriIndex?.let { index ->
            ptracking?.getInstruction(index + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT }
                as? OneRegisterInstruction
        }
        val missing = buildList {
            if (!isGuardable(vss2Ping, vss2Id)) add("VSS2 pings")
            if (!isGuardable(vss2Log, vss2Id)) add("VSS2 watchtime events")
            if (!isGuardable(vss3Segment, vss3Id) || vss3Site == null) add("VSS3 watchtime segments")
            if (ptrackingUriIndex != 0 || ptrackingUri == null || ptracking == null || ptracking.p0Register < 2) {
                add("Ptracking pings")
            }
            if (!hasNativeMediaHeaderBridge() || !hasNativeMediaRequestHook()) add("NetFetch headers")
        }
        if (missing.isNotEmpty()) {
            printWarn("Ghost mode not applied: could not link ${missing.joinToString()}.")
            return@execute
        }

        val stats2Id = requireNotNull(vss2Id)
        vss2Ping!!.addStatsGuard(stats2Id)
        vss2Log!!.addStatsGuard(stats2Id)
        vss3Segment!!.addSegmentGuard(vss3Id!!, vss3Site!!)
        ptracking!!.addPtrackingGuard(ptrackingUri!!.registerA)
        hookTrackingUrl("$EXTENSION->blockTrackingUrl(Landroid/net/Uri;)Landroid/net/Uri;")

        // The Java observers (including spoof fetch) should see the same minimized headers as the app.
        hookBuildRequest(
            "$EXTENSION->overrideRequestHeaders(Ljava/lang/String;Ljava/util/Map;[B)Ljava/util/Map;",
            hookHeader = true,
            includeBody = true,
            first = true,
        )
        // This hook doesn't rewrite /videoplayback; the spoof clients keep their own SABR handling.
        hookMediaRequest("$EXTENSION->onMediaRequest", replacesRequest = true)

        addPlayerResponseMethodHook(Hook.VideoId("$EXTENSION->onVideoResponse(Ljava/lang/String;Z)V"))
        hookVideoId("$EXTENSION->onVideoStarted(Ljava/lang/String;)V")
        hookVideoInformation(
            "$EXTENSION->onVideoMetadata(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)V"
        )
        hookToolBarWithImageView("$TOOLBAR->onToolbarButton")
        addBrowseIdHook("$TOOLBAR->setBrowseId(Ljava/lang/String;)V")
        addSearchResultsHook("$TOOLBAR->clearBrowseId()V")
        injectControl(BUTTON, topControl = false)

        setExtensionIsPatchIncluded(EXTENSION)
        linked = true
    }
}

private fun isGuardable(method: MutableMethod?, id: FieldReference?): Boolean =
    method != null && id != null && method.definingClass == id.definingClass && method.p0Register > 0

private fun MutableMethod.addStatsGuard(id: FieldReference) {
    val check = statsGuardCall(id, 0)
    addInstructionsWithLabels(
        0,
        "$check\n" + """
            move-result v0
            if-eqz v0, :allow
            return-void
            :allow
            nop
        """
    )
}

private fun statsGuardCall(id: FieldReference, scratch: Int) =
    """
        move-object/from16 v$scratch, p0
        iget-object v$scratch, v$scratch, $id
        invoke-static { v$scratch }, $EXTENSION->shouldBlockStats(Ljava/lang/String;)Z
    """

private data class SegmentGuardSite(val insertIndex: Int, val scratch: Int, val cleanupIndex: Int, val reset: Int)

/** The guarded branch finishes the native segment lifecycle without emitting its log event. */
private fun MutableMethod.segmentGuardSite(): SegmentGuardSite? {
    val implementation = implementation ?: return null
    val code = implementation.instructions
    val enterIndex = code.indexOfFirst { it.opcode == Opcode.MONITOR_ENTER }
    if (enterIndex !in 0..3) return null
    if (enterIndex + 2 >= code.size) return null

    // Insert inside the stock catch-all. Preserve anything the first instruction sets.
    val first = code[enterIndex + 1]
    val second = code[enterIndex + 2]
    val scratch = when {
        first.opcode == Opcode.CONST_STRING && second.opcode == Opcode.IGET_BOOLEAN ->
            (second as OneRegisterInstruction).registerA
        enterIndex == 0 && first.opcode == Opcode.IGET_BOOLEAN && second.opcode == Opcode.IF_EQZ ->
            if ((first as OneRegisterInstruction).registerA == 0) 1 else 0
        else -> return null
    }
    if (scratch !in 0..15 || scratch >= p0Register) return null

    val firstAddress = code.take(enterIndex + 1).sumOf { it.codeUnits }
    val insertAddress = firstAddress + first.codeUnits
    if (implementation.tryBlocks.none { block ->
        block.startCodeAddress <= firstAddress &&
            insertAddress < block.startCodeAddress + block.codeUnitCount &&
            block.exceptionHandlers.any { it.exceptionType == null }
    }) return null

    val cleanupIndex = code.indices.lastOrNull { index ->
        val call = code[index].getReference<MethodReference>() ?: return@lastOrNull false
        if (code[index].opcode != Opcode.INVOKE_DIRECT || call.definingClass != definingClass ||
            call.parameterTypes.isNotEmpty() || call.returnType != "V"
        ) return@lastOrNull false
        val resetIndex = if (code.getOrNull(index + 1)?.opcode == Opcode.CONST_4) index + 2 else index + 1
        code.getOrNull(resetIndex)?.opcode == Opcode.IPUT_BOOLEAN &&
            code.getOrNull(resetIndex + 1)?.opcode == Opcode.MONITOR_EXIT &&
            code.getOrNull(resetIndex + 2)?.opcode == Opcode.RETURN_VOID
    } ?: return null

    val resetIndex = if (code[cleanupIndex + 1].opcode == Opcode.CONST_4) cleanupIndex + 2 else cleanupIndex + 1
    val reset = (code[resetIndex] as OneRegisterInstruction).registerA
    return SegmentGuardSite(enterIndex + 2, scratch, cleanupIndex, reset)
}

private fun MutableMethod.addSegmentGuard(id: FieldReference, site: SegmentGuardSite) {
    val index = site.insertIndex
    val scratch = "v${site.scratch}"
    addInstructionsWithLabels(
        index,
        statsGuardCall(id, site.scratch) + """
            move-result $scratch
            if-eqz $scratch, :stock
            const/16 v${site.reset}, 0x0
            goto/32 :cleanup
        """,
        ExternalLabel("stock", getInstruction(index)),
        ExternalLabel("cleanup", getInstruction(site.cleanupIndex)),
    )
}

/** The URI is available before Ptracking starts appending client and account context. */
private fun MutableMethod.addPtrackingGuard(uri: Int) {
    val scratch = if (uri == 0) 1 else 0
    addInstructionsWithLabels(
        2,
        """
            invoke-static/range { v$uri .. v$uri }, $EXTENSION->shouldBlockPtracking(Landroid/net/Uri;)Z
            move-result v$scratch
            if-eqz v$scratch, :allow
            return-void
            :allow
            nop
        """,
    )
}

@Suppress("unused")
val ghostPlayPatch = resourcePatch(GHOST_PLAY.title, GHOST_PLAY.summary) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(ghostPlayBytecodePatch, overlayButtonsPatch, settingsPatch)

    execute {
        if (!linked) return@execute
        copyResources(
            "ghostplay",
            ResourceGroup(
                "drawable",
                "morphe_ghost_play_button_off.xml",
                "morphe_ghost_play_button_off_bold.xml",
                "morphe_ghost_play_button_on.xml",
                "morphe_ghost_play_button_on_bold.xml",
                "morphe_ghost_play_channels.xml",
                "morphe_ghost_play_flyout.xml",
                "morphe_ghost_play_power.xml",
                "morphe_ghost_play_timer.xml",
            ),
        )

        // The common overlay patch already sized and positioned these controls for each style.
        // Clone one slot and its animation placeholder to keep the same layout options.
        listOf(
            "youtube_controls_bottom_ui_container.xml",
            "youtube_video_exploder_controls_bottom_ui_container.xml",
        ).forEach { layout ->
            val path = "res/layout/$layout"
            if (!get(path).exists()) return@forEach
            document(path).use { doc ->
                val nodes = doc.documentElement.childNodes
                val existing = nodes.findElementByAttributeValue("android:id", "@+id/revanced_loop_segment_button")
                    ?: return@use
                val existingPlaceholder = nodes.findElementByAttributeValue(
                    "android:id", "@+id/revanced_loop_segment_button_placeholder"
                ) ?: return@use
                val control = existing.cloneNode(true) as Element
                control.setAttribute("android:id", "@+id/morphe_ghost_play_button")
                control.setAttribute("android:src", "@drawable/morphe_ghost_play_button_off")
                control.setAttribute("android:contentDescription", "@string/morphe_ghost_play_dialog_title")
                control.setAttribute("android:visibility", "gone")
                val placeholder = existingPlaceholder.cloneNode(true) as Element
                placeholder.setAttribute("android:id", "@+id/morphe_ghost_play_button_placeholder")
                existing.parentNode.insertBefore(control, existing)
                existing.parentNode.insertBefore(placeholder, existing)
            }
        }

        addPreference(arrayOf("SETTINGS: GHOST_PLAY", "SETTINGS: GHOST_PLAY_PLAYER_BUTTON"), GHOST_PLAY)
    }
}
