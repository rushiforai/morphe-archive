package app.timetree.patches.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.timetree.patches.shared.ACC_STATIC
import app.timetree.patches.shared.ADS_CONFIG_MODEL
import app.timetree.patches.shared.AdsConfigConstructorFingerprint
import app.timetree.patches.shared.PACKAGE_NAME
import com.android.tools.smali.dexlib2.Opcode

/**
 * Turns every server-driven ad slot in `AdsConfigModel` off.
 *
 * The downloaded ads config carries one boolean per placement (`optout`, `enableDaily`,
 * `enableMonthly`, `enableCreation`, `enableActivities`, `enableEventDetail`, plus the
 * target-user / excluded-device markers). Feeding `false` into all of them makes the app
 * conclude that no slot is enabled, so ad list items are never created and no empty
 * placeholder is left behind in the calendar or the activities feed.
 *
 * The field list is read from the class at patch time, so obfuscated field names and the
 * constructor's parameter order do not matter.
 */
@Suppress("unused")
val disableAdSlotFlagsPatch = bytecodePatch(
    name = "Disable ad slot flags",
    description = "Forces every boolean in the server-driven AdsConfigModel to false, " +
        "so no ad slot is created at all. Reads the fields at patch time, so it is not " +
        "tied to obfuscated field names.",
) {
    compatibleWith(
        Compatibility(
            packageName = PACKAGE_NAME,
            name = "TimeTree",
            description = "Shared calendar app. Patch targets the downloadable ads config.",
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = null)),
        ),
    )

    execute {
        val classDef = AdsConfigConstructorFingerprint.classDef
        val method = AdsConfigConstructorFingerprint.method

        val instructions = method.implementation?.instructions?.toList()
            ?: throw IllegalStateException("AdsConfigModel.<init> has no body")
        if (instructions.isEmpty() || instructions.last().opcode != Opcode.RETURN_VOID) {
            throw IllegalStateException(
                "AdsConfigModel.<init> does not end with return-void, refusing to guess",
            )
        }

        val boolFields = classDef.fields.filter {
            it.type == "Z" && (it.accessFlags and ACC_STATIC) == 0
        }
        if (boolFields.isEmpty()) {
            throw IllegalStateException("AdsConfigModel has no boolean fields to disable")
        }

        // p1 is a String parameter that is already dead at this point of the constructor,
        // so it can hold the zero constant without touching the register layout.
        val body = buildString {
            appendLine("const/4 p1, 0x0")
            boolFields.forEach { field ->
                appendLine("iput-boolean p1, p0, $ADS_CONFIG_MODEL->${field.name}:Z")
            }
        }

        method.addInstructions(instructions.size - 1, body)
    }
}
