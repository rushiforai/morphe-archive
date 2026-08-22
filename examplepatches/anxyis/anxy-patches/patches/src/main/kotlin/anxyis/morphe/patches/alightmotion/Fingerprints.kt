package anxyis.morphe.patches.alightmotion

import app.morphe.patcher.Fingerprint

object FqAbFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.interfaces.any { it.endsWith("/ge;") || it == "Lcom/google/firebase/analytics/ge;" } &&
                method.name == "ab" &&
                method.parameterTypes.size == 3 &&
                method.returnType == "V"
    }
)

object AlightMotionAppFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/alightcreative/app/motion/AlightMotionApplication;" &&
                method.name == "onCreate" &&
                method.parameterTypes.isEmpty() &&
                method.implementation != null
    }
)

object SystemExitFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/google/firebase/analytics/FirebaseEncoder\$9;" &&
                method.name == "n" &&
                method.parameterTypes.size == 1 &&
                method.parameterTypes[0] == "I"
    }
)

object KillProcessFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/google/firebase/analytics/connector/internal/core/d;" &&
                method.name == "bb" &&
                method.parameterTypes.size == 1 &&
                method.parameterTypes[0] == "I"
    }
)

object SignatureMatchesFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/pairip/SignatureCheck;" &&
                method.name == "verifySignatureMatches"
    }
)

object LibraryVersionCreateFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "Jz" &&
                method.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/String;") &&
                method.returnType.endsWith("/m;")
    }
)
