package app.template.patches.cinemahq.services

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private val cinemaHqCompatibilities = listOf(
    ApkFileType.APKM,
    ApkFileType.XAPK,
    ApkFileType.APKS,
    ApkFileType.APK
).map { fileType ->
    Compatibility(
        name = "CinemaHQ",
        packageName = "com.app.mlounge",
        description = "CinemaHQ app",
        apkFileType = fileType,
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = true
            ),
            AppTarget(
                version = "8.9"
            ),
            AppTarget(
                version = "8.7"
            )
        )
    )
}

private fun thisRegister(method: MutableMethod): Int {
    return method.implementation!!.registerCount - 1
}

private fun method(mutableClass: MutableClass, vararg signature: String): MutableMethod? {
    val methods = mutableClass.virtualMethods + mutableClass.directMethods
    return methods.firstOrNull { m ->
        m.name == signature.first() && m.parameterTypes == signature.drop(1)
    }
}

private fun replaceVoidNoOp(mutableClass: MutableClass, name: String, vararg parameters: String) {
    method(mutableClass, name, *parameters)?.let { m ->
        setBody(
            m,
            listOf(
                BuilderInstruction10x(Opcode.RETURN_VOID)
            )
        )
    }
}

private fun setBody(method: MutableMethod, instructions: List<BuilderInstruction>) {
    val impl = method.implementation ?: return
    for (i in impl.instructions.size - 1 downTo 0) {
        impl.removeInstruction(i)
    }
    for (instruction in instructions) {
        impl.addInstruction(instruction)
    }
}

@Suppress("unused")
val neutralizeHopmnBandwidthSharingPatch = bytecodePatch(
    name = "Neutralize Hopmn bandwidth sharing",
    description = "Stops the Hopmn SDK from selling your upload bandwidth. The service stays declared so the app does not crash, but it acquires no wake lock, registers nothing and stops itself immediately.",
    default = true
) {
    for (compat in cinemaHqCompatibilities) {
        compatibleWith(compat)
    }
    execute {
        mutableClassDefByOrNull("Lio/hopmonsdk/service/MoneytiserService;")?.let { serviceClass ->
            val stopMethods = listOf("onCreate", "onStartCommand", "onLowMemory", "onTaskRemoved", "onTimeout", "register", "registerWithSeedMode", "ensureForeground")
            for (methodName in stopMethods) {
                method(serviceClass, methodName)?.let { m ->
                    val reg = thisRegister(m)
                    setBody(
                        m,
                        listOf(
                            BuilderInstruction35c(
                                Opcode.INVOKE_VIRTUAL,
                                1,
                                reg,
                                0, 0, 0, 0,
                                ImmutableMethodReference(
                                    "Landroid/app/Service;",
                                    "stopSelf",
                                    emptyList(),
                                    "V"
                                )
                            ),
                            BuilderInstruction11n(Opcode.CONST_4, 1, 2),
                            BuilderInstruction11x(Opcode.RETURN, 1)
                        )
                    )
                }
            }
        }
    }
}

@Suppress("unused")
val neutralizeAppsaltRewardServicePatch = bytecodePatch(
    name = "Neutralize Appsalt reward service",
    description = "Stops the Appsalt rewards/loyalty service from running. It stays declared, but it terminates itself on start and does no work.",
    default = true
) {
    for (compat in cinemaHqCompatibilities) {
        compatibleWith(compat)
    }
    execute {
        mutableClassDefByOrNull("Lcom/appsalt/lib/longevity/RewardService;")?.let { serviceClass ->
            method(serviceClass, "onStartCommand", "Landroid/content/Intent;", "I", "I")?.let { m ->
                val reg = thisRegister(m)
                setBody(
                    m,
                    listOf(
                        BuilderInstruction35c(
                            Opcode.INVOKE_VIRTUAL,
                            1,
                            reg,
                            0, 0, 0, 0,
                            ImmutableMethodReference(
                                "Landroid/app/Service;",
                                "stopSelf",
                                emptyList(),
                                "V"
                            )
                        ),
                        BuilderInstruction11n(Opcode.CONST_4, 1, 2),
                        BuilderInstruction11x(Opcode.RETURN, 1)
                    )
                )
            }
            replaceVoidNoOp(serviceClass, "onDestroy")
        }
    }
}

@Suppress("unused")
val neutralizeBackgroundRelaunchReceiversPatch = bytecodePatch(
    name = "Disable background service relaunch receivers",
    description = "The app's BootReceiver, Appsalt's BootReceiver and Hopmn's NetworkStateReceiver no longer relaunch the background services on boot or on connectivity change.",
    default = true
) {
    for (compat in cinemaHqCompatibilities) {
        compatibleWith(compat)
    }
    execute {
        val receivers = listOf(
            "Lcom/app/mlounge/BootReceiver;",
            "Lcom/appsalt/lib/BootReceiver;",
            "Lio/hopmonsdk/support/NetworkStateReceiver;"
        )
        for (receiver in receivers) {
            mutableClassDefByOrNull(receiver)?.let { receiverClass ->
                replaceVoidNoOp(receiverClass, "onReceive", "Landroid/content/Context;", "Landroid/content/Intent;")
            }
        }
    }
}
