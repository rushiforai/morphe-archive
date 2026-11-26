package patches.soundcloud

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import patches.shared.uniqueMatch

private const val ROOT = "Lcom/soundcloud/android/"

private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

context(context: BytecodePatchContext)
private fun target(owner: String, name: String, result: String, vararg parameters: String) =
    Fingerprint(
        definingClass = "$ROOT$owner;",
        name = name,
        returnType = result,
        parameters = parameters.toList(),
    ).uniqueMatch().method

@Suppress("unused")
val hideMessageIconPatch = bytecodePatch(
    name = "Hide Message icon",
    description = "Hides SoundCloud's direct message / inbox icon on user profile headers and the top toolbar.",
    default = false,
) {
    compatibleWith(soundcloud)
    dependsOn(originalInput)

    execute {
        // 1. Hide the Inbox / Messages action item in the top toolbar (Home / main navigation).
        target(
            "messages/inbox/titlebar/TitleBarInboxController",
            "a",
            "V",
            "Landroidx/lifecycle/LifecycleOwner;",
            "Landroid/view/Menu;",
            "${ROOT}messages/inbox/titlebar/TitleBarInboxViewModel;",
        ).apply {
            val index = instructions.indexOfFirst {
                it.methodRef()?.let { ref ->
                    ref.definingClass == "Landroid/view/MenuItem;" && ref.name == "setVisible"
                } == true
            }
            if (index < 0) throw PatchException("SoundCloud TitleBarInboxController menu visibility call changed")
            addInstructions(
                index,
                """
                    const/4 v0, 0x0
                    invoke-interface {p2, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;
                    return-void
                """.trimIndent(),
            )
        }

        target(
            "messages/inbox/titlebar/TitleBarInboxView",
            "<init>",
            "V",
            "Landroid/content/Context;",
            "Landroid/util/AttributeSet;",
            "I",
        ).apply {
            addInstructions(
                instructions.count() - 1,
                """
                    const/16 p1, 0x8
                    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V
                """.trimIndent(),
            )
        }

        // 2. Hide the Message icon button on User / Artist Profile headers (both standard & revamped Compose profiles).
        target("profile/data/ApiCanSendMessageResponse", "<init>", "V", "Z", "Ljava/lang/String;")
            .addInstructions(0, "const/4 p1, 0x0")

        target("profile/data/ApiCanSendMessageResponse", "isSendAllowed", "Z")
            .addInstructions(
                0,
                """
                    const/4 p0, 0x0
                    return p0
                """.trimIndent(),
            )

        target(
            "profile/feature/data/ProfileItem",
            "<init>",
            "V",
            "${ROOT}foundation/domain/users/UserItem;",
            "${ROOT}foundation/domain/users/UserItem;",
            "Ljava/lang/String;",
            "${ROOT}foundation/domain/UserUrn;",
            "Ljava/util/List;",
            "${ROOT}profile/feature/data/ProfileStoriesIndicator;",
            "${ROOT}foundation/attribution/SearchQuerySourceInfo;",
            "Z",
            "${ROOT}foundation/domain/releasenotifications/ReleaseNotificationsLevel;",
            "Ljava/util/List;",
            "I",
            "Z",
            "${ROOT}tipping/api/TippingResult;",
            "${ROOT}creatorcommerce/merchant/api/MerchantResult;",
        ).addInstructions(0, "const/4 p8, 0x0")
    }
}
