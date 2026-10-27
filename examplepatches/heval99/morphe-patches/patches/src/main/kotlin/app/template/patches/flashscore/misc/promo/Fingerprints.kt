package app.template.patches.flashscore.misc.promo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val IN_APP_STRIP_MODEL = "Lflashplatform/service/inappStrip/model/InAppStripNetworkModel;"

// The remote "support" dialog helper (R8-renamed, rq5 in 26.10.2). Its constructor opens the
// "dialogSupport" preferences.
internal object RemoteDialogHelperFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf(string("dialogSupport", StringComparisonType.CONTAINS)),
)

// Its show method: reads the server-configured dialog (title, text, "btnGoUrl" button, ...) and
// shows it over EventListActivity, returning whether it did. When it returns false the activity
// carries on with its normal startup.
internal object RemoteDialogShowFingerprint : Fingerprint(
    classFingerprint = RemoteDialogHelperFingerprint,
    returnType = "Z",
    parameters = listOf("Leu/livesport/LiveSport_cz/EventListActivity;"),
    strings = listOf(string("btnGoUrl", StringComparisonType.CONTAINS)),
)

// Parses the remote-config JSON of the in-app promo strips into the list the UI renders.
internal object InAppStripParseFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    strings = listOf(string("Failed to parse InAppStrip JSON", StringComparisonType.CONTAINS)),
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            (insn as? ReferenceInstruction)?.reference?.toString()?.startsWith(IN_APP_STRIP_MODEL) == true
        } == true
    },
)
