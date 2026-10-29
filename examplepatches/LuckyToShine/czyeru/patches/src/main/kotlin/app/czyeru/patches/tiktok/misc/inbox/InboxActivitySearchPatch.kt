package app.czyeru.patches.tiktok.misc.inbox

import app.czyeru.patches.shared.compat.AppCompatibilities
import app.czyeru.patches.tiktok.misc.extension.sharedExtensionPatch
import app.czyeru.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/czyeru/extension/tiktok/inbox/InboxActivitySearchPatch;"

private const val SETTINGS_STATUS_DESCRIPTOR =
    "Lapp/czyeru/extension/tiktok/settings/SettingsStatus;"

@Suppress("unused")
val inboxActivitySearchPatch = bytecodePatch(
    name = "Inbox activity search",
    description = "Adds an option to show a search bar on the Activity notifications and New followers " +
        "pages to filter by user, comment, or notification text.",
    default = true,
) {
    dependsOn(sharedExtensionPatch)

    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, $SETTINGS_STATUS_DESCRIPTOR->enableInboxActivitySearch()V",
        )

        // End of NotificationResultFragment.onViewCreated: pass fragment and root view to extension.
        NotificationResultFragmentViewCreatedFingerprint.method.apply {
            val returnIndices = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }

            returnIndices.asReversed().forEach { returnIndex ->
                addInstructions(
                    returnIndex,
                    """
                        invoke-static/range {p0 .. p1}, $EXTENSION_CLASS_DESCRIPTOR->onNotificationListViewCreated(Ljava/lang/Object;Landroid/view/View;)V
                    """,
                )
            }
        }

        // End of InboxFollowerFragmentV2.onViewCreated: pass fragment and root view to extension.
        InboxFollowerFragmentV2ViewCreatedFingerprint.method.apply {
            val returnIndices = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }

            returnIndices.asReversed().forEach { returnIndex ->
                addInstructions(
                    returnIndex,
                    """
                        invoke-static/range {p0 .. p1}, $EXTENSION_CLASS_DESCRIPTOR->onFollowersListViewCreated(Ljava/lang/Object;Landroid/view/View;)V
                    """,
                )
            }
        }

        // Re-filter when TikTok loads more items or refreshes.
        PowerAdapterBindViewHolderFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $EXTENSION_CLASS_DESCRIPTOR->onBind(Ljava/lang/Object;)V",
        )
    }
}
