package app.template.patches.flashscore.misc.rating

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// The app settings store's boolean getter (R8-renamed, lhk.a(ehk) in 26.10.2). It takes the
// settings-key enum and is the only method that logs " using getBool!". Every read of
// CAN_SHOW_RATING_BANNER and CAN_SHOW_INAPP_RATING goes through it. Both strings are pieces of
// one concatenated message ("Undefined default value for " + key + " using getBool!"), so they
// are matched by prefix and with CONTAINS (patcher 2.0 compares raw `strings` with the whole
// constant). The second piece sits in `custom`, so the order of the two constants is not pinned.
internal object SettingsGetBoolFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("L"),
    filters = listOf(string("Undefined default value for ", StringComparisonType.STARTS_WITH)),
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string?.contains(" using getBool!") == true
        } == true
    },
)
