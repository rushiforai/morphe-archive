package app.ra1nify.f4t.virtualtablet

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.ra1nify.f4t.shared.VIRTUAL_TABLET
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method

private const val DIAG_TAG = "VTPatch"
private const val VERIFICATION_RESULT_FQN = "Lcom/revenuecat/purchases/VerificationResult;"

// Diagnostic only; logs RevenueCat channel calls and entitlement build steps.
@Suppress("unused")
val channelCallLogPatch = bytecodePatch(
    name = "Logs",
    default = false,
) {
    compatibleWith(VIRTUAL_TABLET)

    execute {
        val plugin = mutableClassDefBy("Lcom/revenuecat/purchases_flutter/PurchasesFlutterPlugin;")
        val dispatchers = plugin.methods
            .filterIsInstance<MutableMethod>()
            .filter { method -> method.isChannelDispatcher() }
        if (dispatchers.size != 1) {
            throw PatchException(
                "expected exactly 1 onMethodCall(MethodCall, Result), found ${dispatchers.size}"
            )
        }
        dispatchers.single().logChannelCall()
        println("[virtualtablet] channel-call logging installed")

        val factories = mutableClassDefBy("Lcom/revenuecat/purchases/common/EntitlementInfoFactoriesKt;")
        val builders = factories.methods
            .filterIsInstance<MutableMethod>()
            .filter { method ->
                AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.name == "buildEntitlementInfo" &&
                    method.parameterTypes.size == 5
            }
        if (builders.size != 1) {
            throw PatchException(
                "expected exactly 1 buildEntitlementInfo(JSONObject, String, JSONObject, Date, " +
                    "VerificationResult), found ${builders.size}"
            )
        }
        builders.single().logEntry("buildEntitlementInfo entered")
        println("[virtualtablet] buildEntitlementInfo logging installed")

        val infos = mutableClassDefBy("Lcom/revenuecat/purchases/EntitlementInfos;")
        val constructors = infos.methods
            .filterIsInstance<MutableMethod>()
            .filter { method ->
                method.name == "<init>" &&
                    method.parameterTypes.size == 2 &&
                    method.parameterTypes[0] == "Ljava/util/Map;" &&
                    method.parameterTypes[1] == VERIFICATION_RESULT_FQN
            }
        if (constructors.size != 1) {
            throw PatchException(
                "expected exactly 1 EntitlementInfos(Map, VerificationResult) constructor, " +
                    "found ${constructors.size}"
            )
        }
        constructors.single().logEntry("EntitlementInfos ctor entered")
        println("[virtualtablet] EntitlementInfos ctor logging installed")
    }
}

private fun Method.isChannelDispatcher(): Boolean =
    name == "onMethodCall" &&
        parameterTypes.size == 2 &&
        parameterTypes[0] == "Lio/flutter/plugin/common/MethodCall;" &&
        parameterTypes[1] == "Lio/flutter/plugin/common/MethodChannel\$Result;"

private fun MutableMethod.logBeforeLastReturn(message: String) {
    val body = implementation as? MutableMethodImplementation
        ?: throw PatchException("$definingClass->$name has no mutable implementation")
    val locals = body.registerCount - (parameterTypes.size + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1)
    if (locals < 2) {
        throw PatchException("$definingClass->$name has $locals local register(s); 2 are needed")
    }

    val index = body.instructions.indexOfLast { it.opcode.name.startsWith("RETURN") }
    if (index < 0) {
        throw PatchException("$definingClass->$name has no return instruction")
    }

    addInstructions(
        index,
        """
            const-string v0, "$DIAG_TAG"
            const-string v1, "$message"
            invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
        """.trimIndent(),
    )
}

private fun MutableMethod.logChannelCall() {
    val body = implementation ?: throw PatchException("$definingClass->$name has no implementation")
    val locals = body.registerCount - (parameterTypes.size + 1)
    if (locals < 2) {
        throw PatchException(
            "$definingClass->$name has $locals local register(s); 2 are needed for a log call"
        )
    }
    val methodCallRegister = body.registerCount - 2

    addInstructions(
        0,
        """
            iget-object v0, v$methodCallRegister, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;
            const-string v1, "$DIAG_TAG"
            invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
        """.trimIndent(),
    )
}

private fun MutableMethod.logEntry(message: String) {
    val body = implementation ?: throw PatchException("$definingClass->$name has no implementation")
    val occupied = parameterTypes.size + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    val locals = body.registerCount - occupied
    if (locals < 2) {
        throw PatchException(
            "$definingClass->$name has $locals local register(s); 2 are needed for a log call"
        )
    }

    addInstructions(
        0,
        """
            const-string v0, "$DIAG_TAG"
            const-string v1, "$message"
            invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
        """.trimIndent(),
    )
}
