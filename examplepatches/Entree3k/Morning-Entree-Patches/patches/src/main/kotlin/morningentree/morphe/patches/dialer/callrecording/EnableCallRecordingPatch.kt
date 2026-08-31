package morningentree.morphe.patches.dialer.callrecording

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import morningentree.morphe.patches.dialer.shared.Constants
import morningentree.morphe.util.returnEarly

@Suppress("unused")
val enableCallRecordingPatch = bytecodePatch(
    name = "Enable call recording",
    description = "Enables call recorder, check local laws before using it.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val canRecordClass = CallRecordingCountryGateFingerprint.originalClassDef
        val mutableCanRecord = mutableClassDefBy(canRecordClass)

        val availability = mutableCanRecord.methods.filter { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty()
        }
        if (availability.size != 1) {
            throw PatchException(
                "Google Phone: expected one no-arg boolean availability method on CanRecord, found " +
                    "${availability.size}. Re-derive.",
            )
        }

        availability.single().returnEarly(true)
    }
}
