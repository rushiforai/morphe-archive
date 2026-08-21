package app.morphe.patches.delonghi.incidents

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall

/**
 * Matches NewBaseActivity.showGigyaApiValidationError().
 *
 * The literals are the four resources used by the GetReceivedShares-003 branch in
 * De'Longhi Comfort 5.1.5. Keeping the dialog method call as the final filter lets
 * the patch remove only that branch's call without affecting any other errors.
 */
internal object ReceivedSharesIncidentDialogFingerprint : Fingerprint(
    definingClass = "Lcom/ddsx_ayla_android/view/comfort_v4/base/NewBaseActivity;",
    returnType = "V",
    parameters = listOf("Lcom/ddsx_ayla_android/gigya/GigyaApi${'$'}GIGYA_API_ERROR_ID;"),
    filters = listOf(
        literal(0x7f1402c4), // GET_RECEIVED_SHARE_003_TITLE
        literal(0x7f1402c5), // GET_RECEIVED_SHARE_003_TXT
        literal(0x7f1402c3), // GET_RECEIVED_SHARE_003_ERROR
        literal(0x7f1402c2), // GET_RECEIVED_SHARE_003_BTN_OK
        methodCall(
            smali = "Lcom/ddsx_ayla_android/view/comfort_v4/base/NewBaseActivity;->t(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
        ),
    ),
)
