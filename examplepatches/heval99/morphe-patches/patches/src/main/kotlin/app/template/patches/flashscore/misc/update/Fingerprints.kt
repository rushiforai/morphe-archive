package app.template.patches.flashscore.misc.update

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// The unsupported-version reporter (R8-renamed, acn in 26.10.2). Its constructor opens the
// "unssupported_version_reporter" preferences (the typo is the app's own).
internal object UnsupportedVersionReporterFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf(string("unssupported_version_reporter", StringComparisonType.CONTAINS)),
)

// Builds and shows the SOFT ("update available") or HARD ("update required", not cancelable)
// dialog, throttled through the "last_notify_<level>" preference. Its only Dialog.show() call.
// The key prefix is concatenated with the level, so it is matched by prefix (patcher 2.0 compares
// raw `strings` with the whole constant). The check sits in `custom`, not in an ordered string
// filter, because the key is read before show() and written after it, so its position relative to
// the show() filter is not pinned.
internal object UpdateDialogFingerprint : Fingerprint(
    classFingerprint = UnsupportedVersionReporterFingerprint,
    returnType = "V",
    filters = listOf(methodCall(definingClass = "Landroid/app/Dialog;", name = "show")),
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string?.startsWith("last_notify_") == true
        } == true
    },
)
