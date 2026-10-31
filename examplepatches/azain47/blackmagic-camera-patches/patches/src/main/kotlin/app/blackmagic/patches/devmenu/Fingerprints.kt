package app.blackmagic.patches.devmenu

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal const val CATEGORY_CLASS =
    "Lcom/blackmagicdesign/android/settings/entity/BaseSettingsCategory;"
internal const val AVAILABILITY_CLASS =
    "Lcom/blackmagicdesign/android/settings/entity/BaseSettingsCategory\$Availability;"

/**
 * The settings-category visibility gate (obfuscated `SettingsModel.g(BaseSettingsCategory)`):
 * it reads the category's `Availability`, switches on `ordinal()`, and returns `true` only for
 * `AllBuilds`, hiding every category tagged `InternalBuilds` (the developer/debug menu).
 *
 * Matched by its non-obfuscated parameter type, boolean return, the read of the non-obfuscated
 * `BaseSettingsCategory$Availability` field, and the `Enum.ordinal()` call — none of which are
 * obfuscated names.
 */
internal object CategoryAvailabilityGateFingerprint : Fingerprint(
    isStatic = false,
    returnType = "Z",
    parameters = listOf(CATEGORY_CLASS),
    filters = listOf(
        fieldAccess(type = AVAILABILITY_CLASS, opcode = Opcode.IGET_OBJECT),
        methodCall(definingClass = "Ljava/lang/Enum;", name = "ordinal", returnType = "I"),
    ),
)

/**
 * `BaseSettingsCategory$Availability.<clinit>`, used to locate the `InternalBuilds` enum constant:
 * the `const-string "InternalBuilds"` is immediately followed (after the enum `<init>`) by the
 * `sput-object` that stores the constant into its (obfuscated-name) static field.
 */
internal object AvailabilityClinitFingerprint : Fingerprint(
    definingClass = AVAILABILITY_CLASS,
    name = "<clinit>",
    filters = listOf(
        string("InternalBuilds"),
    ),
)
