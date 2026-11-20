package app.tgseed.patches.skvalex

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/**
 * SKVALEX Call Recorder keeps its whole licence verdict in one int field of the Application class:
 *
 *     0 = check pending, 1/2 = not licensed (trial or error), 3/4 = licensed.
 *
 * The field is written by the licence engine (`App->i(II)V`, driven by native messages) and read
 * by exactly one accessor, a package-private static `()S` that is a plain field read:
 *
 *     sget   v0, Lorg/skvalex/cr/App;->t:I
 *     int-to-short v0, v0
 *     return v0
 *
 * `Lorg/skvalex/cr/App;` is the `android:name` of the `<application>` element, so R8 cannot rename
 * it — only the field and the method name rotate. The body shape and the int type are therefore the
 * stable anchors; no obfuscated name appears here.
 */
object LicenseStateGetterFingerprint : Fingerprint(
    definingClass = "Lorg/skvalex/cr/App;",
    returnType = "S",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET,
            // "this" = the class the method was declared in, i.e. App itself.
            definingClass = "this",
            type = "I"
        ),
        opcode(Opcode.INT_TO_SHORT),
        opcode(Opcode.RETURN)
    )
)
