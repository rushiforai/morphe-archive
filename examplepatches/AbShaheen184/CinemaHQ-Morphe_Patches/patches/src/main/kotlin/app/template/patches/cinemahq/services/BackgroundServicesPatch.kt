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
                version = "9.1"
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

private fun clearTryBlocks(impl: com.android.tools.smali.dexlib2.builder.MutableMethodImplementation) {
    // Try the public, mutable list first.
    try {
        (impl.getTryBlocks() as? MutableList<*>)?.clear()
    } catch (_: Throwable) {
    }
    // Fall back to reflection for patcher versions where getTryBlocks() is immutable
    // or the field lives in a superclass: walk the whole class hierarchy and clear any
    // field that looks like a try-block list (or replace it with an empty list).
    var cls: Class<*>? = impl::class.java
    while (cls != null) {
        for (field in cls.declaredFields) {
            val name = field.name.lowercase()
            if (!(name.contains("try") || name.contains("catch") || name.contains("block"))) continue
            field.isAccessible = true
            try {
                val value = field.get(impl)
                if (value is MutableList<*>) {
                    value.clear()
                    continue
                }
            } catch (_: Throwable) {
            }
            try {
                val modifiersField = java.lang.reflect.Field::class.java.getDeclaredField("modifiers")
                modifiersField.isAccessible = true
                modifiersField.setInt(field, field.modifiers and java.lang.reflect.Modifier.FINAL.inv())
                field.set(impl, ArrayList<Any>())
            } catch (_: Throwable) {
            }
        }
        cls = cls.superclass
    }
}

private fun setBody(method: MutableMethod, instructions: List<BuilderInstruction>) {
    val impl = method.implementation ?: return
    // Clear stale try/catch blocks first: their handler addresses point at the original
    // instructions that are about to be removed, which would otherwise leave an invalid
    // dex (Morphe on-device patching then fails with "Invalid handler addr").
    clearTryBlocks(impl)

    // Collapse to a single anchor location (the trailing null-tail), append the
    // replacement body, and leave the trailing null-tail for the dex writer to ignore.
    // Collapsing on impl.instructions (which excludes the null-tail) leaves a real
    // instruction behind, so collapse on the underlying instructionList instead.
    var locations: ArrayList<*>? = null
    var cls: Class<*>? = impl::class.java
    while (cls != null && locations == null) {
        for (field in cls.declaredFields) {
            if (field.name == "instructionList") {
                field.isAccessible = true
                locations = field.get(impl) as? ArrayList<*>
            }
        }
        cls = cls.superclass
    }
    if (locations != null) {
        while (locations.size > 1) {
            impl.removeInstruction(0)
        }
    }
    for (instruction in instructions) {
        impl.addInstruction(instruction)
    }
}

private fun invokeSuper(
    method: MutableMethod,
    superClass: String,
    name: String,
    parameters: List<String>,
    returnType: String,
    args: IntArray
): BuilderInstruction35c = BuilderInstruction35c(
    Opcode.INVOKE_SUPER,
    args.size,
    args.getOrElse(0) { 0 },
    args.getOrElse(1) { 0 },
    args.getOrElse(2) { 0 },
    args.getOrElse(3) { 0 },
    args.getOrElse(4) { 0 },
    ImmutableMethodReference(superClass, name, parameters, returnType)
)

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
            // onCreate / onDestroy / onLowMemory: super only.
            method(serviceClass, "onCreate")?.let { m ->
                val thisReg = thisRegister(m)
                setBody(
                    m,
                    listOf(
                        invokeSuper(m, "Landroid/app/Service;", "onCreate", m.parameterTypes.map { it.toString() }, "V", intArrayOf(thisReg)),
                        BuilderInstruction10x(Opcode.RETURN_VOID)
                    )
                )
            }
            method(serviceClass, "onDestroy")?.let { m ->
                val thisReg = thisRegister(m)
                setBody(
                    m,
                    listOf(
                        invokeSuper(m, "Landroid/app/Service;", "onDestroy", m.parameterTypes.map { it.toString() }, "V", intArrayOf(thisReg)),
                        BuilderInstruction10x(Opcode.RETURN_VOID)
                    )
                )
            }
            method(serviceClass, "onLowMemory")?.let { m ->
                val thisReg = thisRegister(m)
                setBody(
                    m,
                    listOf(
                        invokeSuper(m, "Landroid/app/Service;", "onLowMemory", m.parameterTypes.map { it.toString() }, "V", intArrayOf(thisReg)),
                        BuilderInstruction10x(Opcode.RETURN_VOID)
                    )
                )
            }

            // onTaskRemoved: super call.
            method(serviceClass, "onTaskRemoved", "Landroid/content/Intent;")?.let { m ->
                val thisReg = thisRegister(m)
                setBody(
                    m,
                    listOf(
                        invokeSuper(m, "Landroid/app/Service;", "onTaskRemoved", m.parameterTypes.map { it.toString() }, "V", intArrayOf(thisReg, thisReg - 1)),
                        BuilderInstruction10x(Opcode.RETURN_VOID)
                    )
                )
            }

            // Android 15+ FGS timeout callbacks.
            replaceVoidNoOp(serviceClass, "onTimeout", "I")
            replaceVoidNoOp(serviceClass, "onTimeout", "I", "I")

            // Device registration with the seed servers.
            replaceVoidNoOp(serviceClass, "register")
            replaceVoidNoOp(serviceClass, "registerWithSeedMode", "Ljava/lang/String;", "I")

            // onStartCommand: must call startForeground() once, then stopSelf().
            method(serviceClass, "onStartCommand", "Landroid/content/Intent;", "I", "I")?.let { m ->
                val thisReg = thisRegister(m)
                setBody(
                    m,
                    listOf(
                        BuilderInstruction35c(
                            Opcode.INVOKE_DIRECT,
                            1,
                            thisReg,
                            0, 0, 0, 0,
                            ImmutableMethodReference(
                                "Lio/hopmonsdk/service/MoneytiserService;",
                                "ensureForeground",
                                emptyList(),
                                "Z"
                            )
                        ),
                        BuilderInstruction11x(Opcode.MOVE_RESULT, 0),
                        BuilderInstruction35c(
                            Opcode.INVOKE_VIRTUAL,
                            1,
                            thisReg,
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

        // Close the residual Hopmn.start() entry point.
        mutableClassDefByOrNull("Lio/hopmonsdk/Hopmn;")?.let { hopmnClass ->
            method(hopmnClass, "start")?.let { m ->
                setBody(
                    m,
                    listOf(
                        BuilderInstruction11n(Opcode.CONST_4, 0, 0),
                        BuilderInstruction11x(Opcode.RETURN, 0)
                    )
                )
            }
            // Suppress the "keep CinemaHQ free" consent dialog.
            replaceVoidNoOp(hopmnClass, "showConsent", "Landroid/app/Activity;", "Lio/hopmonsdk/Hopmn\$ConsentCallback;")
            replaceVoidNoOp(hopmnClass, "showConsentNow", "Landroid/app/Activity;", "Lio/hopmonsdk/Hopmn\$ConsentCallback;")
            replaceVoidNoOp(hopmnClass, "startWithConsent", "Landroid/app/Activity;", "Lio/hopmonsdk/Hopmn\$ConsentCallback;")
        }
    }
}

@Suppress("unused")
val neutralizeEarnFmBandwidthSharingPatch = bytecodePatch(
    name = "Neutralize EarnFM bandwidth sharing",
    description = "Stops the EarnFM (FleetSdk) SDK from sharing the device's spare network bandwidth. The SDK stays present, but initialize() and startSdk() return false so no native harvester or foreground sharing is started.",
    default = true
) {
    for (compat in cinemaHqCompatibilities) {
        compatibleWith(compat)
    }
    execute {
        mutableClassDefByOrNull("Lcom/fleet/FleetSdk;")?.let { sdkClass ->
            method(sdkClass, "initialize")?.let { m ->
                setBody(
                    m,
                    listOf(
                        BuilderInstruction11n(Opcode.CONST_4, 0, 0),
                        BuilderInstruction11x(Opcode.RETURN, 0)
                    )
                )
            }
            method(sdkClass, "startSdk")?.let { m ->
                setBody(
                    m,
                    listOf(
                        BuilderInstruction11n(Opcode.CONST_4, 0, 0),
                        BuilderInstruction11x(Opcode.RETURN, 0)
                    )
                )
            }
        }
    }
}

@Suppress("unused")
val neutralizeBackgroundRelaunchReceiversPatch = bytecodePatch(
    name = "Disable background service relaunch receivers",
    description = "The app's BootReceiver and Hopmn's NetworkStateReceiver no longer relaunch the background services on boot or on connectivity change.",
    default = true
) {
    for (compat in cinemaHqCompatibilities) {
        compatibleWith(compat)
    }
    execute {
        val receivers = listOf(
            "Lcom/app/mlounge/BootReceiver;",
            "Lio/hopmonsdk/support/NetworkStateReceiver;"
        )
        for (receiver in receivers) {
            mutableClassDefByOrNull(receiver)?.let { receiverClass ->
                replaceVoidNoOp(receiverClass, "onReceive", "Landroid/content/Context;", "Landroid/content/Intent;")
            }
        }
    }
}
