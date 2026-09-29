package app.adm.patches.limits

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

object DownloadSliderMaxFingerprint : Fingerprint(
    definingClass = "Lcom/dv/get/Pref\$o;",
    name = "f",
    returnType = "V",
    parameters = listOf("Lcom/dv/get/Pref\$o;"),
    filters = listOf(
        literal(2131755635),
        literal(2131755637),
        literal(32)
    )
)

object TorrentConnectionDefaultsFingerprint : Fingerprint(
    definingClass = "Lcom/dv/get/Pref;",
    name = "G1",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(
        string("TORR_MAXCONNECT"),
        string("210"),
        methodCall(
            definingClass = "Lcom/dv/get/Pref;",
            name = "E1",
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
            returnType = "I"
        ),
        string("TORR_MAXCONNECTPER"),
        string("70")
    )
)
