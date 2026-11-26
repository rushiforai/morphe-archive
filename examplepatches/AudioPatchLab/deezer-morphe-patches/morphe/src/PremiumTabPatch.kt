package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val TAB_ENUM = "LIIlIIIIIIllllI;"
private const val PREMIUM_TAB_FIELD = "LIIlIIIIIIllllI;->llIIIlIIIIIlIll:$TAB_ENUM"
private const val ARRAY_LIST_ADD = "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z"
private const val CONVERSION_ENTRYPOINTS = "LlIlIllIIllllI;"
private const val CONVERSION_ENTRYPOINT = "Lcore/auth/module/models/AppConversionEntrypoint;"
private const val FILTER_OFFER = "morpheFilterContextualOffer"

private fun filterContextualOffer(): MutableMethod {
    val method = MutableMethod(ImmutableMethod(
        CONVERSION_ENTRYPOINTS, FILTER_OFFER,
        listOf("Ljava/util/HashMap;", "Ljava/lang/String;").map { ImmutableMethodParameter(it, emptySet(), null) },
        "Ljava/lang/Object;", AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        emptySet(), emptySet(), ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList()),
    ))
    method.addInstructionsWithLabels(
        0,
        """
            const-string v0, "CONTEXTUAL_MENU_ADS_FREE"
            invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :lookup
            const/4 v0, 0x0
            return-object v0
            :lookup
            invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """.trimIndent(),
    )
    return method
}

internal val premiumTabPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        val build = mutableClassDefBy("LlIllIIlIlIlI;").methods.single {
            it.name == "build" && it.parameterTypes.isEmpty() && it.returnType == "LIllIlllIlIIIlllI;"
        }
        val instructions = checkNotNull(build.implementation).instructions
        val premiumLoad = instructions.indices.single { index ->
            val instruction = instructions[index]
            instruction.opcode == Opcode.SGET_OBJECT &&
                (instruction as ReferenceInstruction).reference.toString() == PREMIUM_TAB_FIELD
        }
        val addCall = instructions[premiumLoad + 1]
        check(addCall.opcode == Opcode.INVOKE_VIRTUAL)
        check((addCall as ReferenceInstruction).reference.toString() == ARRAY_LIST_ADD)
        val loadRegister = (instructions[premiumLoad] as OneRegisterInstruction).registerA
        val addArgs = addCall as FiveRegisterInstruction
        check(addArgs.registerCount == 2 && addArgs.registerD == loadRegister)

        build.replaceInstruction(premiumLoad, "nop")
        build.replaceInstruction(premiumLoad + 1, "nop")

        val profileUpgrade = mutableClassDefBy("LlIlllIllIlII;").methods.single { method ->
            method.returnType == "V" && method.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "get-premium"
            } == true
        }
        profileUpgrade.addInstructions(0, "return-void")

        val settings = mutableClassDefBy("LIlllIllIlIlIlIll;").methods.single { method ->
            method.name == "invoke" && method.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;") &&
                method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "conversion_banner"
                } == true
        }
        val settingsInstructions = checkNotNull(settings.implementation).instructions
        val banner = settingsInstructions.indices.single { index ->
            val instruction = settingsInstructions[index]
            instruction.opcode == Opcode.IGET_OBJECT && (instruction as ReferenceInstruction).reference.toString() ==
                "LIIllIlIlIIlIIIlI;->lIIlIIlIlllllII:LIlllIlIlIIIlIllI;"
        }
        val bannerRegister = (settingsInstructions[banner] as OneRegisterInstruction).registerA
        check(settingsInstructions[banner + 1].opcode == Opcode.IF_NEZ ||
            settingsInstructions[banner + 1].opcode == Opcode.IF_EQZ)
        settings.replaceInstruction(banner, "const/4 v$bannerRegister, 0x0")
    }

    // Offline downloads can replace this lookup in their execute phase.
    finalize {
        val offers = mutableClassDefBy(CONVERSION_ENTRYPOINTS)
        val offer = offers.methods.single {
            it.name == "lIIIIIlllllIIIII" && it.parameterTypes == listOf("Ljava/lang/String;") &&
                it.returnType == CONVERSION_ENTRYPOINT
        }
        val offerInstructions = checkNotNull(offer.implementation).instructions
        val lookup = offerInstructions.indices.single { index ->
            val instruction = offerInstructions[index]
            instruction.opcode == Opcode.INVOKE_VIRTUAL && (instruction as ReferenceInstruction).reference.toString() ==
                "Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;"
        }
        val lookupArgs = offerInstructions[lookup] as FiveRegisterInstruction
        check(lookupArgs.registerCount == 2)
        check(offers.methods.add(filterContextualOffer()))
        offer.replaceInstruction(
            lookup,
            "invoke-static {v${lookupArgs.registerC}, v${lookupArgs.registerD}}, " +
                "$CONVERSION_ENTRYPOINTS->$FILTER_OFFER(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/Object;",
        )
    }
}
