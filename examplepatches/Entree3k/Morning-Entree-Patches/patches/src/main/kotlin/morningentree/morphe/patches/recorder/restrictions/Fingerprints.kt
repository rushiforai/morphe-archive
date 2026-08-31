package morningentree.morphe.patches.recorder.restrictions

import app.morphe.patcher.Fingerprint

internal object ApplicationOnCreateFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    custom = { method, classDef ->
        method.name == "onCreate" &&
            method.returnType == "V" &&
            method.parameterTypes.isEmpty() &&
            classDef.type.endsWith("/RecorderApplication;")
    },
)
