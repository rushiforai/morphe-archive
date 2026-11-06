// Ported from virzak/morphe-patches (GPLv3), app/rutube/patches/ads/DisableAdsPatch.kt.
package app.ru_apps.rutube.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.ru_apps.rutube.shared.Constants.COMPATIBILITY_RUTUBE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val AD_SDK_KERNEL_CLASS = "Lru/rutube/adsdk/core/internal/b;"

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Prevents the ad SDK from starting, which stops banner ads and " +
        "pre-roll video ads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUTUBE)

    execute {
        // Return before the SDK kernel is built. Everything the ad stack needs is
        // resolved from that kernel, so neither the banner APIs nor the VAST loader
        // are ever reachable afterwards.
        //
        // The method already has a path that returns without building anything: it
        // guards on a static `isInitializeCalled` and returns early when the SDK was
        // already started. That is not proof this is safe - in the normal flow the
        // kernel does exist by the time anything calls into it - so this needs to be
        // checked by running the app, not by the patch applying.
        val match = AdSdkInitializeFingerprint.matchOrNull()
        if (match != null) {
            match.method.addInstruction(0, "return-void")
            return@execute
        }

        // A 2026-10 build removed AdSdk.initialize() entirely (confirmed via live
        // decompile) and inlined the equivalent logic into RtApp.onCreate(), guarded by
        // a one-shot static boolean field (`isInitializeCalled`, renamed to an
        // obfuscated short name by R8 - too unstable to match by name across builds).
        // Rather than depend on that obfuscated field's name, find the guard
        // structurally: locate where the ad SDK kernel class
        // (ru.rutube.adsdk.core.internal.b, still unobfuscated) is constructed, then
        // walk backward to the nearest preceding `sget-boolean` - that is the flag read
        // feeding the `if` that guards this exact construction. Overwriting its
        // destination register with `true` immediately after it's read forces the
        // surrounding `if` to always take the "already initialized" branch, independent
        // of the field's real (always-false-on-first-launch) value - without touching
        // any of onCreate()'s other, unrelated application bootstrap logic.
        val onCreateMethod = RtAppOnCreateFingerprint.method
        val instructions = onCreateMethod.implementation!!.instructions

        val kernelConstructionIndex = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.NEW_INSTANCE &&
                ((instruction as? ReferenceInstruction)?.reference as? TypeReference)
                    ?.type == AD_SDK_KERNEL_CLASS
        }
        if (kernelConstructionIndex == -1) {
            throw PatchException(
                "Could not find where RtApp.onCreate() constructs the ad SDK kernel " +
                    "($AD_SDK_KERNEL_CLASS) - the ad SDK's bootstrap method has likely " +
                    "changed shape again",
            )
        }

        val guardFlagIndex = (kernelConstructionIndex - 1 downTo 0).firstOrNull { index ->
            instructions[index].opcode == Opcode.SGET_BOOLEAN
        } ?: throw PatchException(
            "Could not find the one-shot init guard (sget-boolean) preceding the ad " +
                "SDK kernel construction in RtApp.onCreate()",
        )

        val guardRegister = (instructions[guardFlagIndex] as OneRegisterInstruction).registerA
        onCreateMethod.addInstructions(
            guardFlagIndex + 1,
            // const/16 (not const/4) because onCreate() has enough locals that the
            // guard register is not guaranteed to fit in const/4's 4-bit register field.
            "const/16 v$guardRegister, 0x1",
        )
    }
}
