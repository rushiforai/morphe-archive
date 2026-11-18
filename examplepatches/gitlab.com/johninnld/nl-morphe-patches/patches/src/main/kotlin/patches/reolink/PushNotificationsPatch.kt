package patches.reolink

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

internal const val FIREBASE_INSTALLATION_CLIENT =
    "Lcom/google/firebase/installations/remote/FirebaseInstallationServiceClient;"
internal const val REOLINK_FIREBASE_CERTIFICATE = "B2D0246EFC055FA09DEEB3604330C89A35F6DC31"

/** Restore only the HTTP identity of Reolink's existing Firebase installation. */
internal fun withReolinkFirebaseHeaders(original: Method): MutableMethod {
    check(original.definingClass == FIREBASE_INSTALLATION_CLIENT &&
        original.name == "openHttpURLConnection" &&
        original.parameterTypes.map(CharSequence::toString) == listOf("Ljava/net/URL;", "Ljava/lang/String;") &&
        original.returnType == "Ljava/net/HttpURLConnection;") {
        "Reolink Firebase connection signature changed"
    }
    val code = checkNotNull(original.implementation).instructions.toList()
    fun reference(index: Int) = (code[index] as? ReferenceInstruction)?.reference?.toString()
    for (header in listOf("X-Android-Package", "X-Android-Cert")) {
        check(code.indices.count { reference(it) == header } == 1) {
            "Reolink Firebase header $header changed"
        }
    }
    val replacements = listOf(
        "Landroid/content/Context;->getPackageName()Ljava/lang/String;" to REOLINK_PACKAGE,
        "$FIREBASE_INSTALLATION_CLIENT->getFingerprintHashForPackage()Ljava/lang/String;" to REOLINK_FIREBASE_CERTIFICATE,
    ).map { (call, value) ->
        val index = code.indices.singleOrNull { reference(it) == call }
            ?: error("Reolink Firebase identity call changed: $call")
        check(index + 1 < code.size && code[index + 1].opcode == Opcode.MOVE_RESULT_OBJECT) {
            "Reolink Firebase identity result changed or patch already applied"
        }
        Triple(index + 1, (code[index + 1] as OneRegisterInstruction).registerA, value)
    }
    return original.toMutable().apply {
        replacements.forEach { (index, register, value) ->
            replaceInstruction(index, "const-string v$register, \"$value\"")
        }
    }
}

@Suppress("unused")
val reolinkPushNotificationsPatch = bytecodePatch(
    name = "Fix push notification registration",
    description = "Uses Reolink's original Firebase installation identity so the re-signed app can register for push " +
        "notifications, also with a changed package name. Keeps Android's installed identity and native FCM delivery.",
) {
    compatibleWith(reolink)
    dependsOn(originalInput)
    execute {
        val owner = mutableClassDefBy(FIREBASE_INSTALLATION_CLIENT)
        val original = owner.methods.single { it.name == "openHttpURLConnection" }
        val replacement = withReolinkFirebaseHeaders(original)
        check(owner.methods.remove(original)) { "Reolink Firebase connection method disappeared" }
        owner.methods.add(replacement)
    }
}
