package app.adm.patches.limits

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * `Lcom/dv/get/Pref;->U()V` builds the download settings screen. Every control is a
 * `Lv2/j4;` preference whose bounds are the `a` (minimum) and `b` (maximum) fields,
 * and the dialog sets the seek bar range to `b - a`.
 *
 * The bounds come from register constants loaded once at the top of the method rather
 * than from per-control literals, so the 14.0.27 slider accessor no longer exists. The
 * shared `const/4 v7, 5` is the ceiling for all three simultaneous-download controls
 * (`DOWN_LOADS_3G`, `DOWN_LOADS_WF`, `DOWN_LOADS_3GWF`). `v7` is reused later in the
 * method for unrelated case identifiers and objects, but it is always reassigned
 * before those uses, so its value reaches only the three ceilings.
 */
object DownloadCeilingFingerprint : Fingerprint(
    definingClass = "Lcom/dv/get/Pref;",
    name = "U",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        literal(5, listOf(Opcode.CONST_4)),
        fieldAccess(
            definingClass = "Lv2/j4;",
            name = "b",
            type = "I"
        ),
        string("DOWN_LOADS_3G")
    )
)

/**
 * The `DOWN_THREADS_*` ceilings are the `b` field of each control, written just
 * before that control's own preference key. They cannot be raised by editing their
 * source register, because `v8` is also the minimum of the chunk-size controls, so the
 * ordered chain below instead walks shared minimum constant, the `DOWN_LOADS_*`
 * maximum, then the first `DOWN_THREADS_*` control's minimum, maximum, and key.
 */
object ThreadCeilingFingerprint : Fingerprint(
    definingClass = "Lcom/dv/get/Pref;",
    name = "U",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        literal(1, listOf(Opcode.CONST_4)),
        fieldAccess(
            definingClass = "Lv2/j4;",
            name = "b",
            type = "I"
        ),
        fieldAccess(
            definingClass = "Lv2/j4;",
            name = "a",
            type = "I"
        ),
        fieldAccess(
            definingClass = "Lv2/j4;",
            name = "b",
            type = "I"
        ),
        string("DOWN_THREADS_3G")
    )
)

/**
 * `Lcom/dv/get/Pref;->C(Landroid/app/Activity;)V` loads the torrent preferences. The
 * global and per-torrent connection counts are read with the `Pref.A(String, String)`
 * helper using the string defaults `210` and `70`; both keys are app-owned literals
 * that do not change between releases.
 */
object TorrentConnectionDefaultsFingerprint : Fingerprint(
    definingClass = "Lcom/dv/get/Pref;",
    name = "C",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(
        string("TORR_MAXCONNECT"),
        string("210"),
        methodCall(
            definingClass = "Lcom/dv/get/Pref;",
            name = "A",
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
            returnType = "I"
        ),
        string("TORR_MAXCONNECTPER"),
        string("70")
    )
)
