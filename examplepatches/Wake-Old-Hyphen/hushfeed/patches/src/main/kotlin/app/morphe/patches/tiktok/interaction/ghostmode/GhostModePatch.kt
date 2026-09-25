/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 * Follows eduardo3677-ai/tiktok-patches-for-morphe.
 */
package app.morphe.patches.tiktok.interaction.ghostmode

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch
import app.morphe.patches.tiktok.shared.guardAtEntry
import app.morphe.util.numberOfParameterRegisters

/** Reports that a story was seen, opened or interacted with. */
private object StoryViewReportFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith("/StoryApi;") &&
            method.name in setOf("reportStoryViewed", "reportUserInteraction", "reportStoryReveal")
    },
)

/** Records a profile visit against the profile's viewer list. */
private object ProfileViewReportFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith("/ProfileViewerApiService;") && method.name == "reportView"
    },
)

/** Pushes the "typing…" indicator into a conversation. */
private object TypingStatusSenderFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith("/TypingStatusSenderTimer;") &&
            method.parameterTypes.size == 1 &&
            method.parameterTypes[0] == "Ljava/lang/String;" &&
            method.returnType == "V"
    },
)

/**
 * Returns from a reporter before it sends anything, when the extension says to.
 *
 * <p>Only a reporter that returns nothing can take this. One that hands something back is
 * handing back a lazy `Call`, `Observable` or `Single` that its caller goes on to `enqueue` or
 * `subscribe`, and the only value this could put there is a null. That null was the crash on
 * opening a story with Ghost mode on, and the reason other people's profiles showed no
 * follower counts. Those reporters are suppressed where they are called instead, by stepping
 * over the whole send: see [skipReportsAtEveryCallSite].
 *
 * @return true when the guard was injected; false for an abstract method, one with no local
 *         register to hold the answer, or one that returns anything at all.
 */
internal fun MutableMethod.returnBeforeReporting(guard: String): Boolean {
    if (returnType != "V") return false
    val implementation = implementation ?: return false
    if (implementation.registerCount - numberOfParameterRegisters < 1) return false

    guardAtEntry(
        "Ghost mode",
        "invoke-static {}, $GHOST_MODE_EXTENSION->$guard()Z",
        "return-void",
    )
    return true
}

/**
 * Stops the reports that tell other people what you looked at: story views, profile
 * views and the typing indicator. It suppresses the client's own
 * reporting only; nothing here changes what the server already knows.
 */
@Suppress("unused")
val ghostModePatch = bytecodePatch(
    name = "Ghost mode",
    description = "Stop TikTok reporting that you viewed a story or a " +
        "profile or that you are typing. Online status is unchanged. Switch: Hushfeed settings > Privacy.",
    default = false,
) {
    category("Privacy")
    dependsOn(settingsPatch, sharedExtensionPatch)

    compatibleWith(*AppCompatibilities.tiktok4703())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, " +
                "Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableGhostMode()V",
        )
        // So the export carries the ghost mode family even on a run where no reporter is
        // reached. Without it a family that is simply absent says both "this build has no
        // ghost mode" and "nothing called it", and an export taken while a profile showed no
        // follower counts could not tell those apart.
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, $GHOST_MODE_EXTENSION->installed()V",
        )

        listOf(
            StoryViewReportFingerprint to "shouldBlockStoryView",
            ProfileViewReportFingerprint to "shouldBlockProfileView",
            TypingStatusSenderFingerprint to "shouldBlockTypingStatus",
        ).forEach { (fingerprint, guard) ->
            // Retrofit declarations have no body. Every concrete reporting method is mandatory.
            val reporters = fingerprint.matchAll().map { it.method }.filter { it.implementation != null }
            if (reporters.isEmpty()) {
                throw PatchException("Ghost mode: no concrete reporter for $guard.")
            }
            val (silent, lazy) = reporters.partition { it.returnType == "V" }
            if (silent.any { !it.returnBeforeReporting(guard) }) {
                throw PatchException("Ghost mode: could not install every $guard hook.")
            }
            if (lazy.isNotEmpty()) skipReportsAtEveryCallSite(lazy, guard)
        }
    }
}
