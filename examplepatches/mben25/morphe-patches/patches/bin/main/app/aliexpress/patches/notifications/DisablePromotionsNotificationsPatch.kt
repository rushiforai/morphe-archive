package app.aliexpress.patches.notifications

import app.aliexpress.patches.shared.Constants.COMPATIBILITY_ALIEXPRESS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

/**
 * `TaobaoIntentService.c(Context, PushMessageExt, …, PendingIntent, int)` — builds and posts the
 * system notification for every AliExpress push (agoo/accs). `onMessage` parses the payload
 * into `PushMessageExt` and funnels every message type into it.
 *
 * The original patch matched "first `void(Context)` method in the app" and hit
 * `WVUCWebView$Builder.a(Context)` (WebView pre-initialisation) instead.
 */
internal object BuildPushNotificationFingerprint : Fingerprint(
    definingClass = "Lcom/alibaba/aliexpresshd/TaobaoIntentService;",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/alibaba/aliexpresshd/notification/PushMessageExt;",
        "L",
        "Landroid/app/PendingIntent;",
        "I",
    ),
    strings = listOf("buildNotification,msgType:"),
)

/**
 * `PushMessage.msgType` values of marketing pushes. Transactional ones are not listed and keep
 * working: `msg` / `icbu_ae_order_msg` (seller and order chat) and `icbu_ae_order` (order status).
 */
private val PROMOTIONAL_MSG_TYPES = listOf(
    "icbu_ae_promotion",    // promotions
    "icbu_ae_web",          // campaign landing pages
    "start",                // "open the app" re-engagement
    "icbu_ae_ugc",          // feed/UGC content
    "icbu_ae_wishlist",     // wishlist price drops
    "icbu_ae_trends_alert", // trending items
)

@Suppress("unused")
val disablePromotionsNotificationsPatch = bytecodePatch(
    name = "Disable promotions notifications",
    description = "Drops promotional push notifications (deals, campaigns, wishlist price drops, " +
        "trends). Order status and message notifications still come through.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        BuildPushNotificationFingerprint.method.apply {
            // `.locals 20`: p2 is v22, out of range for a non-range invoke, so copy it first.
            val checks = PROMOTIONAL_MSG_TYPES.joinToString("\n") { type ->
                """
                    const-string v1, "$type"
                    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v1
                    if-nez v1, :drop
                """
            }
            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p2
                    if-eqz v0, :show
                    invoke-virtual {v0}, Lcom/aliexpress/framework/api/pojo/PushMessage;->getMsgType()Ljava/lang/String;
                    move-result-object v0
                    if-eqz v0, :show
                    $checks
                    goto :show
                    :drop
                    return-void
                """,
                ExternalLabel("show", getInstruction(0)),
            )
        }
    }
}
