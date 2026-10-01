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
 * Builds the fingerprint for one network profile's `DOWN_THREADS_*` ceiling.
 *
 * The three profiles are laid out identically in `Pref.U()`: a `DOWN_LOADS_*` control,
 * a `DOWN_THREADS_*` control, then a chunk-size control, each a fresh `Lv2/j4;` whose
 * `a` is the minimum and `b` the maximum. Every `DOWN_THREADS_*` maximum is the same
 * `const/16 v8, 16` store, so the control cannot be told apart from the chunk-size
 * minimum it shares that constant with. The only per-profile difference is the
 * preference key that follows it, and a control's bounds always precede its own key, so
 * the chain is anchored on the profile's `DOWN_LOADS_*` key and then walks the next
 * `a`, the next `b`, and that profile's `DOWN_THREADS_*` key. Nothing else touches
 * `Lv2/j4;->a:I` or `->b:I` between the two keys, so the match is unambiguous.
 */
private fun threadCeilingFingerprint(
    downloadsKey: String,
    threadsKey: String,
) = Fingerprint(
    definingClass = "Lcom/dv/get/Pref;",
    name = "U",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string(downloadsKey),
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
        string(threadsKey)
    )
)

/** The `DOWN_THREADS_3G` ceiling, at instruction 33 in 14.0.39. */
val ThreadCeiling3GFingerprint = threadCeilingFingerprint(
    "DOWN_LOADS_3G",
    "DOWN_THREADS_3G"
)

/** The `DOWN_THREADS_WF` ceiling, at instruction 170 in 14.0.39. */
val ThreadCeilingWifiFingerprint = threadCeilingFingerprint(
    "DOWN_LOADS_WF",
    "DOWN_THREADS_WF"
)

/** The `DOWN_THREADS_3GWF` ceiling, at instruction 317 in 14.0.39. */
val ThreadCeiling3GWifiFingerprint = threadCeilingFingerprint(
    "DOWN_LOADS_3GWF",
    "DOWN_THREADS_3GWF"
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
