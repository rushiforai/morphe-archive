package io.github.sazap10.patches.sync.sort

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.sazap10.patches.sync.shared.SyncCompatibility

private const val DEFAULT_POST_SORT = "Lio/github/sazap10/extension/sync/DefaultPostSort;"

/** SettingsSingleton's settings loader, which reads `post_sort_preference` with the default `sort_0` (Hot). */
internal object LoadSettingsFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/singleton/SettingsSingleton;",
    strings = listOf("post_sort_preference", "sort_0"),
)

/**
 * The fallback posts sort for a feed without a sort saved for that feed: New for friends and user feeds, Relevance
 * for searches, otherwise the global default from SettingsSingleton.
 */
internal object FeedDefaultSortFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    returnType = "Landroid/util/Pair;",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("friends", "Relevance"),
)

@Suppress("unused")
val defaultPostsSortBestPatch = patch(
    name = "Default posts sort: Best",
    description = "Uses Best as the front page's posts sort until you choose a default posts sort in settings. " +
        "Subreddits keep Hot, and sorts you saved for a feed are kept.",
    default = true,
) {
    compatibleWith(*SyncCompatibility.SyncForReddit)

    extendWith("extensions/sync.mpe")

    execute {
        // Tell the extension whether the user has chosen a default posts sort, each time settings load.
        LoadSettingsFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val keyIndex = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == "post_sort_preference"
            }
            if (keyIndex < 0) throw PatchException("post_sort_preference not found")
            val getString = instructions.drop(keyIndex).first {
                val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Landroid/content/SharedPreferences;" && reference.name == "getString"
            } as Instruction35c

            addInstruction(
                keyIndex,
                "invoke-static { v${getString.registerC} }, " +
                    "$DEFAULT_POST_SORT->remember(Landroid/content/SharedPreferences;)V",
            )
        }

        // Return Best for the front page before Sync falls back to its global default.
        FeedDefaultSortFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0 }, $DEFAULT_POST_SORT->frontPageDefault(Ljava/lang/String;)Landroid/util/Pair;
                    move-result-object v0
                    if-eqz v0, :sync_default
                    return-object v0
                """,
                ExternalLabel("sync_default", implementation!!.instructions.first()),
            )
        }
    }
}
