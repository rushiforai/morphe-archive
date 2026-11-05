package app.template.patches.flashscore.misc.promo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val IN_APP_STRIP_MODEL = "/InAppStripNetworkModel;"

// The remote "support" dialog helper (R8-renamed, rq5 in 26.10.2, lb6 in 26.11.4). Its
// constructor opens the "dialogSupport" preferences; it holds the parsed dialog model.
internal object RemoteDialogHelperFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf(string("dialogSupport", StringComparisonType.CONTAINS)),
)

// EventListActivity.onResume (kept class, lifecycle name). Up to 26.10.2 the helper had its own
// show method; 26.11.4 inlined it here: onResume parses the server-configured dialog (title,
// text, "btnGoUrl" button, ...) into a model stored on the helper, reads the model back, and
// takes the app's own "no dialog" branch when it is null, otherwise checks the re-show interval
// and builds and shows the dialog. It is the only method that reads or writes the model field,
// builds the dialog layout or calls the helper's show-and-record method.
internal object RemoteDialogOnResumeFingerprint : Fingerprint(
    definingClass = "Leu/livesport/LiveSport_cz/EventListActivity;",
    name = "onResume",
    returnType = "V",
    parameters = listOf(),
    strings = listOf(string("btnGoUrl", StringComparisonType.CONTAINS)),
)

// Parses the remote-config JSON of the in-app promo strips into the list the UI renders. The
// kept serializable model's simple name is the anchor: 26.11.4 moved it from
// flashplatform/service/inappStrip/model to flashplatform/repository/inappStrip/models.
internal object InAppStripParseFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    strings = listOf(string("Failed to parse InAppStrip JSON", StringComparisonType.CONTAINS)),
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            (insn as? ReferenceInstruction)?.reference?.toString()?.contains(IN_APP_STRIP_MODEL) == true
        } == true
    },
)
