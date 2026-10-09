/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.interaction.offlinevideos

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.tiktok.shared.guardAtEntry
import app.morphe.patches.tiktok.shared.requireLocals
import com.android.tools.smali.dexlib2.AccessFlags

/** The log line TikTok writes when a phone low on space shortens the lifetime. Only the calculation writes it. */
internal const val OFFLINE_LIFETIME_LOG = "resolveExpiredIntervalMs: low-storage override="

/** When the offline page was last opened, which picks between TikTok's two fallback lifetimes. */
internal const val OFFLINE_DETAIL_VISIT_KEY = "key_last_enter_offline_detail_timestamp"

private const val OFFLINE_LIFETIME_EXTENSION = "Lapp/morphe/extension/tiktok/offline/OfflineVideoExpiry;"

/**
 * How long an offline video lives, in milliseconds (#123). TikTok answers with a low-storage
 * figure in hours when the phone is short on room, else a server figure in hours, else 48 hours
 * when the offline page was opened in the last two days and 90 days when it wasn't. One getter
 * caches the answer per account, and every query over the offline table hides a row once
 * `insert_time` plus that lifetime has passed; the start-up task then deletes those rows and
 * their files. That is how a list saved in one go disappears in one go, watched or not.
 *
 * The method is static, takes nothing and is renamed per build, so it is found by the two strings
 * it loads: its own low-storage log line and the key of the last visit to the offline page.
 */
internal object OfflineVideoLifetimeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "J",
    parameters = emptyList(),
    strings = listOf(OFFLINE_LIFETIME_LOG, OFFLINE_DETAIL_VISIT_KEY),
)

/**
 * Puts the Keep offline videos switch in front of the lifetime. With the switch on the method
 * answers the extension's kept lifetime at once, so nothing expires and the start-up task finds
 * nothing to delete, and with it off TikTok's own calculation runs from its first instruction.
 * The answer is a long, a pair of registers, so the frame needs two locals; the method has no
 * parameters, so every register it has is one.
 */
internal fun MutableMethod.keepOfflineVideos(patch: String) {
    requireLocals(patch, 2)
    guardAtEntry(
        patch,
        "invoke-static {}, $OFFLINE_LIFETIME_EXTENSION->keepOfflineVideos()Z",
        """
            invoke-static {}, $OFFLINE_LIFETIME_EXTENSION->keptLifetimeMs()J
            move-result-wide v0
            return-wide v0
        """,
    )
}
