package app.aidan.patches.geocaching.features

import app.aidan.patches.geocaching.shared.COMPATIBILITY_GEOCACHING
import app.aidan.patches.geocaching.shared.patchAllPremiumChecksToValue
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val unlockTemplatesPatch = bytecodePatch(
    name = "Unlock Templates",
    description = "Unlocks geocache log templates, allowing creating, editing, and applying custom log templates without Geocaching Premium.",
    default = true
) {
    category("Features")
    compatibleWith(COMPATIBILITY_GEOCACHING)

    execute {
        patchTemplatesSettingsGate()
        removeTemplatesPremiumBadge()
        patchTemplatesApiToLocalStore()
    }
}

/**
 * Bypasses the Premium upsell check in SettingsFragment.y when clicking Templates,
 * navigating directly to toTemplatesListFragment.
 */
private fun BytecodePatchContext.patchTemplatesSettingsGate() {
    val settingsClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/fragments/settings/SettingsFragment;")
    val yMethod = settingsClass.methods.firstOrNull {
        it.name == "y" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("SettingsFragment.y not found")

    patchAllPremiumChecksToValue(yMethod, "SettingsFragment.y", true)
}

/**
 * Removes the "Premium" badge next to "Templates" in Settings by setting
 * the isPremium boolean in c0.<init> to false. The badge flag is already
 * absent on some builds, in which case this is a no-op.
 */
private fun BytecodePatchContext.removeTemplatesPremiumBadge() {
    val rowClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/fragments/settings/c0;")
    val initMethod = rowClass.methods.firstOrNull {
        it.name == "<init>" && it.implementation != null
    } ?: throw PatchException("c0.<init> not found")

    val impl = initMethod.implementation ?: throw PatchException("Missing implementation in c0.<init>")
    val instructions = impl.instructions.toList()

    val invokeIdx = instructions.indexOfFirst { inst ->
        inst.opcode == Opcode.INVOKE_DIRECT_RANGE &&
            (inst as? ReferenceInstruction)?.reference?.let { ref ->
                ref is MethodReference &&
                    ref.definingClass == "Lujc;" &&
                    ref.name == "<init>" &&
                    ref.parameterTypes.joinToString("") == "IILjava/lang/Integer;IZI"
            } == true
    }
    if (invokeIdx < 0) {
        throw PatchException("ujc.<init>(IILjava/lang/Integer;IZI)V call not found in c0.<init>")
    }

    val range = instructions[invokeIdx] as? RegisterRangeInstruction
        ?: throw PatchException("ujc.<init> call in c0.<init> is not a range invoke")
    val premiumReg = range.startRegister + 5

    val constIdx = (invokeIdx - 1 downTo 0).firstOrNull { i ->
        val inst = instructions[i]
        inst.opcode == Opcode.CONST_4 && (inst as? OneRegisterInstruction)?.registerA == premiumReg
    } ?: throw PatchException("Could not find isPremium literal v$premiumReg in c0.<init>")

    when ((instructions[constIdx] as NarrowLiteralInstruction).narrowLiteral) {
        0 -> return
        1 -> initMethod.replaceInstruction(constIdx, "const/4 v$premiumReg, 0x0")
        else -> throw PatchException("Unexpected isPremium literal in c0.<init>")
    }
}

/**
 * Redirects TemplatesApi network calls to local store equivalents so that
 * creating, updating, deleting, and fetching templates operate purely on the local
 * Room database without failing against Groundspeak's server on Basic accounts.
 */
private fun BytecodePatchContext.patchTemplatesApiToLocalStore() {
    val templatesApiClass = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/network/api/templates/a;")
    mutableClassDefBy("Lly9;")
    mutableClassDefBy("Lky9;")
    mutableClassDefBy("Loz6;")
    mutableClassDefBy("Lkec;")

    // 1. Method a: create template -> return Success(LogTemplate(0, title, text))
    val aMethod = templatesApiClass.methods.firstOrNull {
        it.name == "a" && it.implementation != null && it.parameterTypes.size == 3
    } ?: throw PatchException("TemplatesApi.a not found")
    aMethod.addInstructions(
        0,
        """
        new-instance v0, Loz6;
        const/4 v1, 0x0
        invoke-direct {v0, v1, p1, p2}, Loz6;-><init>(ILjava/lang/String;Ljava/lang/String;)V
        new-instance v1, Lly9;
        invoke-direct {v1, v0}, Lly9;-><init>(Ljava/lang/Object;)V
        return-object v1
        """.trimIndent()
    )

    // 2. Method b: delete template -> return Success(Unit)
    val bMethod = templatesApiClass.methods.firstOrNull {
        it.name == "b" && it.implementation != null && it.parameterTypes.size == 2
    } ?: throw PatchException("TemplatesApi.b not found")
    bMethod.addInstructions(
        0,
        """
        new-instance v0, Lly9;
        sget-object v1, Lkec;->a:Lkec;
        invoke-direct {v0, v1}, Lly9;-><init>(Ljava/lang/Object;)V
        return-object v0
        """.trimIndent()
    )

    // 3. Method c: getAll templates -> return Failure("local") to force local DB fallback
    val cMethod = templatesApiClass.methods.firstOrNull {
        it.name == "c" && it.implementation != null && it.parameterTypes.size == 1
    } ?: throw PatchException("TemplatesApi.c not found")
    cMethod.addInstructions(
        0,
        """
        new-instance v0, Lky9;
        const-string v1, "local"
        invoke-direct {v0, v1}, Lky9;-><init>(Ljava/lang/Object;)V
        return-object v0
        """.trimIndent()
    )

    // 4. Method d: update template -> return Success(Unit)
    val dMethod = templatesApiClass.methods.firstOrNull {
        it.name == "d" && it.implementation != null && it.parameterTypes.size == 4
    } ?: throw PatchException("TemplatesApi.d not found")
    dMethod.addInstructions(
        0,
        """
        new-instance v0, Lly9;
        sget-object v1, Lkec;->a:Lkec;
        invoke-direct {v0, v1}, Lly9;-><init>(Ljava/lang/Object;)V
        return-object v0
        """.trimIndent()
    )
}
