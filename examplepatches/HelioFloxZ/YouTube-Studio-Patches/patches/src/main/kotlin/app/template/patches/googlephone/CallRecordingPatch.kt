package app.template.patches.googlephone

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.GOOGLE_PHONE_COMPATIBILITY
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

private val CallRecordingCountryGateFingerprint = Fingerprint(
    custom = { method: Method, classDef: ClassDef ->
        classDef.type.contains("callrecording") &&
            method.returnType == "Z" &&
            method.parameterTypes.isEmpty()
    },
)

@Suppress("unused")
val enableCallRecordingPatch = bytecodePatch(
    name = "Enable call recording",
    description = "Enables the existing Google Phone call recording capability.",
    default = true,
) {
    compatibleWith(GOOGLE_PHONE_COMPATIBILITY)

    execute {
        val classDef = CallRecordingCountryGateFingerprint.originalClassDef
        val mutableClass = mutableClassDefBy(classDef)

        val candidates = mutableClass.methods.filter { method ->
            method.returnType == "Z" &&
                method.parameterTypes.isEmpty()
        }

        if (candidates.size != 1) {
            throw PatchException(
                "Google Phone: expected one no-argument boolean call-recording " +
                    "availability method, found ${candidates.size}.",
            )
        }

        val method = candidates.single()

        method.addInstruction(
            0,
            "const/4 v0, 0x1",
        )

        method.addInstruction(
            1,
            "return v0",
        )
    }
}
