package app.morphe.patches.vix.privacy

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructions
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.indexOfFirstStringInstruction
import app.morphe.util.returnEarly
import app.morphe.util.returnEarlyNull
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val AD_ID_PERMISSION = "com.google.android.gms.permission.AD_ID"

@Suppress("unused")
val disableTelemetryPatch = patch(
    name = "Disable telemetry and tracking",
    description = "Disables NewRelic, Permutive, AppsFlyer attribution, Conviva/PAL player telemetry, " +
        "advertising ID collection, and strips the AD_ID manifest permission.",
    default = true,
) {
    category("Privacy")
    compatibleWith(*AppCompatibilities.vix())

    execute {
        NewRelicStartFingerprint.method.returnEarly()

        val permutiveClass = mutableClassDefBy(PermutiveInitFingerprint.classDef.type)
        // Skip only the Permutive SDK construction block while preserving `appInstance` initialization (`:cond_1`).
        PermutiveInitFingerprint.method.apply {
            val insns = instructions.toList()
            val newInstanceIdx = insns.indexOfFirst { insn ->
                insn.opcode == Opcode.NEW_INSTANCE &&
                    insn.getReference<com.android.tools.smali.dexlib2.iface.reference.TypeReference>()?.type == PERMUTIVE_DESCRIPTOR
            }
            if (newInstanceIdx < 2) {
                throw PatchException("Unexpected Permutive init layout in $definingClass->$name")
            }
            val sgetIdx = (newInstanceIdx - 1 downTo 0).firstOrNull { idx ->
                insns[idx].opcode == Opcode.SGET_BOOLEAN &&
                    insns.getOrNull(idx + 1)?.opcode == Opcode.IF_NEZ
            } ?: throw PatchException("Permutive guard flag read not found in $definingClass->$name")
            val flagReg = (insns[sgetIdx] as OneRegisterInstruction).registerA
            replaceInstruction(sgetIdx, BuilderInstruction21s(Opcode.CONST_16, flagReg, 1))
        }
        permutiveClass.methods.singleOrNull {
            it.returnType == PERMUTIVE_DESCRIPTOR && it.parameterTypes.isEmpty()
        }?.returnEarlyNull() ?: throw PatchException("Permutive getter not found in ${permutiveClass.type}")
        permutiveClass.methods.singleOrNull {
            it.returnType == "V" && it.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/String;")
        }?.returnEarly() ?: throw PatchException("Permutive update helper not found in ${permutiveClass.type}")
        permutiveClass.methods.singleOrNull {
            it.returnType == "Z" && it.parameterTypes.isEmpty()
        }?.returnEarly(false) ?: throw PatchException("Permutive enabled flag getter not found in ${permutiveClass.type}")
        permutiveClass.methods.singleOrNull {
            it.returnType == "V" && it.parameterTypes == listOf("Z")
        }?.returnEarly() ?: throw PatchException("Permutive enabled flag setter not found in ${permutiveClass.type}")
        permutiveClass.methods.singleOrNull {
            it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty()
        }?.addInstructions(
            0,
            """
                const-string v0, ""
                return-object v0
            """.trimIndent(),
        ) ?: throw PatchException("Permutive reactions helper not found in ${permutiveClass.type}")

        AppsFlyerStartFingerprint.method.apply {
            val getInstanceIndex = indexOfFirstInstructionOrThrow {
                val ref = getReference<MethodReference>()
                ref?.definingClass == APPSFLYER_LIB_DESCRIPTOR && ref.name == "getInstance"
            }
            addInstructions(
                getInstanceIndex,
                """
                    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                    return-object v0
                """.trimIndent(),
            )
        }

        val playerClass = PalPluginSelectorFingerprint.classDef
        val disabledPalFactory = playerClass.methods.singleOrNull { method ->
            method.returnType == PAL_CONFIG_DESCRIPTOR &&
                method.parameterTypes.isEmpty() &&
                method.indexOfFirstStringInstruction("disabled pal plugin: %s") >= 0
        } ?: throw PatchException("Disabled PAL plugin helper not found in ${playerClass.type}")

        PalPluginSelectorFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                invoke-direct {v0}, ${playerClass.type}->${disabledPalFactory.name}()$PAL_CONFIG_DESCRIPTOR
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )

        disableConvivaInMethod(ConvivaConfigInitFingerprint.method)
        disableConvivaInMethod(ConvivaAssetConfigFingerprint.method)

        val adsIdHelperClass = mutableClassDefBy(FireOsAdvertisingIdCollectorFingerprint.classDef.type)
        val voidContextMethods = adsIdHelperClass.methods.filter {
            it.returnType == "V" && it.parameterTypes == listOf("Landroid/content/Context;")
        }
        if (voidContextMethods.size != 2) {
            throw PatchException(
                "Expected 2 (Context)V collectors in ${adsIdHelperClass.type}, found ${voidContextMethods.size}",
            )
        }
        voidContextMethods.forEach { it.returnEarly() }

        document("AndroidManifest.xml").use { xml ->
            val manifest = xml.documentElement
            val permissions = manifest.getElementsByTagName("uses-permission")
            val toRemove = mutableListOf<Element>()
            for (i in 0 until permissions.length) {
                val elem = permissions.item(i) as? Element ?: continue
                if (elem.getAttribute("android:name") == AD_ID_PERMISSION) {
                    toRemove += elem
                }
            }
            toRemove.forEach { manifest.removeChild(it) }
        }
    }
}

private fun disableConvivaInMethod(method: MutableMethod) {
    val insns = method.instructions.toList()
    val initIndex = insns.indexOfFirst { insn ->
        val ref = insn.getReference<MethodReference>()
        ref?.definingClass == CONVIVA_CONFIG_DESCRIPTOR && ref.name == "<init>"
    }
    if (initIndex < 0) {
        throw PatchException("ConvivaConfiguration.<init> call not found in ${method.definingClass}->${method.name}")
    }
    val initInsn = insns[initIndex] as? RegisterRangeInstruction
        ?: throw PatchException("Unexpected ConvivaConfiguration.<init> format in ${method.definingClass}->${method.name}")
    // Parameter 0 is `this`, parameter 1 is `LuraPluginType`, parameter 2 is `enabled: Z`.
    val enabledReg = initInsn.startRegister + 2
    val constIndex = (initIndex - 1 downTo 0).firstOrNull { idx ->
        val insn = insns[idx]
        (insn.opcode == Opcode.CONST_4 || insn.opcode == Opcode.CONST_16) &&
            (insn as OneRegisterInstruction).registerA == enabledReg
    } ?: throw PatchException("Conviva enabled register v$enabledReg assignment not found in ${method.definingClass}->${method.name}")

    method.replaceInstruction(
        constIndex,
        BuilderInstruction21s(Opcode.CONST_16, enabledReg, 0),
    )
}
