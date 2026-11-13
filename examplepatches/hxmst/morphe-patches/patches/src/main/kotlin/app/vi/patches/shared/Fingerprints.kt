package app.vi.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

object RaspLoadFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("cachehandler")
    )
)

object RaspExitProcessFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("android.intent.category.HOME")
    )
)

object RaspKillHandlerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/Thread;", "Ljava/lang/Throwable;"),
    filters = listOf(
        string("Suppressed NoClassDefFoundError")
    )
)

object RaspHandlerInstallFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "setupGlobalHandlers" && classDef.superclass == "Landroid/app/Application;"
    }
)

object RaspLifecycleRegistrationFingerprint : Fingerprint(
    custom = { method, classDef ->
        if (method.name != "start" || method.returnType != "V" || method.parameters.isNotEmpty()) {
            false
        } else {
            val registersCallbacks = method.implementation?.instructions?.any { instruction ->
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                            ?.name == "registerActivityLifecycleCallbacks"
            } == true
            val holdsApplication = classDef.fields.any { it.type == "Landroid/app/Application;" }
            registersCallbacks && holdsApplication
        }
    }
)

object RootBeerRootCheckFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "isRooted" && method.returnType == "Z" && method.parameters.isEmpty() &&
                AccessFlags.STATIC.isSet(method.accessFlags).not() &&
                classDef.methods.any { it.name == "isRootedWithoutBusyBoxCheck" }
    }
)

object JuspayRootCheckFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "isRooted" && method.returnType == "Z" && method.parameters.isEmpty() &&
                AccessFlags.STATIC.isSet(method.accessFlags) &&
                classDef.methods.any { it.name == "createSessionDataMap" }
    }
)

object RaspProxyOnCreateFingerprint : Fingerprint(
    custom = { method, classDef ->
        val isProxyOnCreate = classDef.superclass == "Landroid/app/Application;" &&
                method.name == "onCreate" && method.returnType == "V" && method.parameters.isNotEmpty().not()
        val callsProxySwap = method.implementation?.instructions?.any { instruction ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                        ref.returnType == "Landroid/app/Application;" && ref.parameterTypes.size == 2
                    } == true
        } == true
        isProxyOnCreate && callsProxySwap
    }
)
