package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

@Suppress("unused")
val offlineDownloadPatch = patch(
    name = "Enable offline downloads",
    description = "Unlocks the OFFLINE entitlement and download actions in menus (subject to server-side stream availability).",
) {
    compatibleWith(deezerCompatibility)
    dependsOn(appBasePatch)

    execute {
        // Unlock the OFFLINE entitlement in the policy model.
        val hasEntitlement = mutableClassDefBy("Lcom/deezer/core/data/model/policy/IllIlIlIIlIllIll;").methods.single {
            it.name == "lIIIIlllIlllll" && it.parameterTypes == listOf("LlIlIIIllIlIlll;") && it.returnType == "Z"
        }
        check(
            checkNotNull(hasEntitlement.implementation).instructions.any { instruction ->
                instruction.opcode == Opcode.IGET &&
                    (instruction as ReferenceInstruction).reference.toString() ==
                    "Lcom/deezer/core/data/model/policy/IllIlIlIIlIllIll;->IIlllIlIIlIlII:I"
            },
        )
        hasEntitlement.addInstructionsWithLabels(
            0,
            """
                sget-object v0, LlIlIIIllIlIlll;->IIIIIllIIIlIIllI:LlIlIIIllIlIlll;
                if-ne p1, v0, :original_offline
                const/4 v0, 0x1
                return v0
                :original_offline
                nop
            """.trimIndent(),
        )

        // Hide the Premium upsell entry for download buttons so the native download action is shown.
        val entrypointsClass = mutableClassDefBy("LlIlIIlllIIll;")
        val entrypoints = entrypointsClass.methods.single {
            it.name == "IllIlIlIIlIllIll" &&
                it.parameterTypes == listOf("Ljava/lang/String;") &&
                it.returnType == "Lcore/auth/module/models/AppConversionEntrypoint;"
        }
        check(
            checkNotNull(entrypoints.implementation).instructions.any { instruction ->
                instruction.opcode == Opcode.IGET_OBJECT &&
                    (instruction as ReferenceInstruction).reference.toString() ==
                    "LlIlIIlllIIll;->llIIIIIIlIIIIll:Ljava/util/HashMap;"
            },
        )
        check(entrypointsClass.methods.remove(entrypoints))
        val updatedEntrypoints = MutableMethod(
            ImmutableMethod(
                entrypoints.definingClass,
                entrypoints.name,
                entrypoints.parameters,
                entrypoints.returnType,
                entrypoints.accessFlags,
                entrypoints.annotations,
                entrypoints.hiddenApiRestrictions,
                ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList()),
            ),
        )
        updatedEntrypoints.addInstructionsWithLabels(
            0,
            """
                const-string v0, "CONTEXTUAL_MENU_DOWNLOAD"
                invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :original_download
                const/4 v0, 0x0
                return-object v0
                :original_download
                iget-object v0, p0, LlIlIIlllIIll;->llIIIIIIlIIIIll:Ljava/util/HashMap;
                invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Lcore/auth/module/models/AppConversionEntrypoint;
                return-object v0
            """.trimIndent(),
        )
        check(entrypointsClass.methods.add(updatedEntrypoints))
    }
}
