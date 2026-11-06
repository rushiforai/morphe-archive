package app.ayufa.patches.youtube.layout.hide.livechat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.methodCall
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches the constructor of the live chat banner presenter: the class
 * that looks up the view with id `live_chat_banner` and casts it to
 * LiveChatBannerContainerLayout. Verified against YouTube 21.30.216.
 */
internal object LiveChatBannerPresenterFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        resourceLiteral(ResourceType.ID, "live_chat_banner"),
        methodCall(
            name = "findViewById",
            returnType = "Landroid/view/View;"
        ),
        checkCast("Lcom/google/android/libraries/youtube/livechat/ui/view/LiveChatBannerContainerLayout;")
    )
)

/**
 * Matches a method of the live chat poll card presenter: a getter that
 * looks up the view with id `poll_metadata_text`. The defining class of
 * the matched method is the poll presenter, whose constructor is hooked.
 * Verified against YouTube 21.30.216.
 */
internal object LiveChatPollPresenterFingerprint : Fingerprint(
    filters = listOf(
        resourceLiteral(ResourceType.ID, "poll_metadata_text"),
        methodCall(
            name = "findViewById",
            returnType = "Landroid/view/View;"
        ),
        checkCast("Landroid/widget/TextView;")
    )
)
