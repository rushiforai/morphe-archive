package app.zdrgon.patches.ytmusicwear.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.zdrgon.patches.ytmusicwear.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC_WEAR
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXTENSION_CLASS = "Lapp/template/extension/ytmusicwear/DownloadsUnlock;"
private const val OFFLINEABILITY_TYPE = "Labyn;"
private const val HELPER_NAME = "patch_unlockOfflineability"

/**
 * YouTube Music (Wear OS) — Enable downloads.
 *
 * Wear port of the offlineability-unlock core of the official Morphe
 * "Downloads" patch (MorpheApp/morphe-patches), adapted to how the Wear
 * build's save flow is actually wired (verified by dex scan on
 * 2026-11-14; the phone patch's own fingerprints do not transplant —
 * the Wear save path passes the offlineability into save-task
 * constructors instead of a (String, ...) store call).
 *
 * Mechanism: before a video or playlist is saved, the app consults an
 * OfflineabilityRenderer value (Wear type Labyn;) that the server
 * delivered with the content. If it says not-offlineable, carries a
 * "not offlineable" dialog, or lists formats as PREMIUM_LOCKED, the
 * save is refused. This patch rewrites that value at the two points
 * where the save flow consumes it:
 *
 * - Playlist flow: Ljdr;->g (the OfflinePlaylistCommandResolver's save
 *   method) — its Labyn; parameter is rewritten at method entry.
 * - Video flow: Ljlu;-><init> (the video save task) — its Labyn;
 *   parameter is rewritten at constructor entry, which covers both
 *   branches inside Ljds;->a that can produce the value.
 *
 * The rewrite itself runs in the extension (DownloadsUnlock), a raw
 * protobuf wire editor: it sets offlineable=true, drops the
 * not-offlineable dialog, and flips every format's availability from
 * PREMIUM_LOCKED to FREE, preserving all other fields byte-for-byte.
 * The helper added to each target class converts the app's object to
 * bytes and back using the app's own protobuf runtime
 * (MessageLite.toByteArray / GeneratedMessageLite.parseFrom with the
 * generated registry — both verified present under usable names in the
 * Wear dex). If the extension returns null (already unlocked, nothing
 * to unlock, unreadable value), the original object is kept untouched.
 *
 * Scope, stated plainly: this changes only the local gate on saves the
 * app attempts. It does not change what Google's servers send this
 * account on this surface — content the server never delivers to the
 * watch (catalog browse for free accounts) cannot be saved by any
 * local patch. What it unlocks is any save the app does attempt, e.g.
 * uploaded music and Smart Downloads candidates.
 */
@Suppress("unused")
val enableDownloadsWearPatch = bytecodePatch(
    name = "Enable downloads",
    description = "Unlocks the offline save gate (offlineability) for videos and playlists the app delivers, so attempted downloads save instead of refusing or showing a Premium dialog. Does not change what the server sends a free account.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC_WEAR)

    // Merge the extension DEX into the patched app. Without this the
    // helper below references a class that does not exist at runtime.
    extendWith("extensions/extension.mpe")

    execute {
        // Adds the shared helper to the fingerprint's class: a private
        // static method (Labyn;)Labyn; that round-trips the
        // offlineability through the extension's wire editor.
        fun addUnlockHelper(fingerprint: app.morphe.patcher.Fingerprint) {
            val helper = ImmutableMethod(
                fingerprint.classDef.type,
                HELPER_NAME,
                listOf(ImmutableMethodParameter(OFFLINEABILITY_TYPE, null, null)),
                OFFLINEABILITY_TYPE,
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(4),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-interface { p0 }, Lcom/google/protobuf/MessageLite;->toByteArray()[B
                        move-result-object v0
                        invoke-static { v0 }, $EXTENSION_CLASS->unlockOfflineability([B)[B
                        move-result-object v0
                        if-eqz v0, :keep_offlineability
                        invoke-static { }, Lcom/google/protobuf/ExtensionRegistryLite;->getGeneratedRegistry()Lcom/google/protobuf/ExtensionRegistryLite;
                        move-result-object v2
                        invoke-static { p0, v0, v2 }, Lync;->parseFrom(Lync; [B Lcom/google/protobuf/ExtensionRegistryLite;)Lync;
                        move-result-object v0
                        check-cast v0, $OFFLINEABILITY_TYPE
                        return-object v0
                        :keep_offlineability
                        return-object p0
                    """.trimIndent()
                )
            }
            fingerprint.classDef.methods.add(helper)
        }

        // Playlist flow: helper on Ljdr;, rewrite of the Labyn;
        // parameter (p3) at the entry of Ljdr;->g.
        addUnlockHelper(PlaylistSaveFingerprint)
        PlaylistSaveFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p3 }, Ljdr;->patch_unlockOfflineability(Labyn;)Labyn;
                move-result-object p3
            """.trimIndent()
        )

        // Video flow: helper on Ljlu;, rewrite of the Labyn; parameter
        // (p2) at the entry of Ljlu;-><init>. The inserted code does not
        // touch p0 (the uninitialized this), so it is legal before the
        // super constructor call.
        addUnlockHelper(VideoSaveTaskFingerprint)
        VideoSaveTaskFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p2 }, Ljlu;->patch_unlockOfflineability(Labyn;)Labyn;
                move-result-object p2
            """.trimIndent()
        )
    }
}
