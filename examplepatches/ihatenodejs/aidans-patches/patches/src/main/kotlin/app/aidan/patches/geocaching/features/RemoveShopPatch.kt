package app.aidan.patches.geocaching.features

import app.aidan.patches.geocaching.shared.COMPATIBILITY_GEOCACHING
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val REMOTE_CONFIG_CLASS = "Lku9;"
private const val SHOP_LINK_HIDDEN_STRING = "RemoteConfig.SHOP_LINK_IS_HIDDEN"
private const val PROFILE_COMPOSABLE_CLASS = "Lcom/groundspeak/geocaching/intro/profile/l;"

@Suppress("unused")
val removeShopPatch = bytecodePatch(
    name = "Remove Shop",
    description = "Removes the Shop Geocaching promotional section and link from the Profile screen.",
    default = true
) {
    category("Interface")
    compatibleWith(COMPATIBILITY_GEOCACHING)

    execute {
        patchRemoteConfigShopHidden()
        patchProfileShopComposable()
    }
}

/**
 * Forces RemoteConfigManager (ku9.h) to return true (shopLinkIsHidden = true).
 *
 * This ensures that ProfileViewModel initializes ShopLinkData with isHidden = true,
 * setting the domain state flow to permanently hidden and preventing the shop link
 * and promotional banner from being displayed on the Profile screen.
 */
private fun BytecodePatchContext.patchRemoteConfigShopHidden() {
    val remoteConfigClass = mutableClassDefByOrNull(REMOTE_CONFIG_CLASS)
        ?.takeIf { cls ->
            cls.methods.any { method ->
                method.returnType == "Z" &&
                    method.parameterTypes.isEmpty() &&
                    method.implementation?.instructions?.any { inst ->
                        (inst as? ReferenceInstruction)?.reference?.let { ref ->
                            (ref as? StringReference)?.string == SHOP_LINK_HIDDEN_STRING
                        } == true
                    } == true
            }
        }
        ?: getAllClassesWithString(SHOP_LINK_HIDDEN_STRING)
            .map { mutableClassDefBy(it) }
            .firstOrNull { cls ->
                cls.methods.any { method ->
                    method.returnType == "Z" &&
                        method.parameterTypes.isEmpty() &&
                        method.implementation?.instructions?.any { inst ->
                            (inst as? ReferenceInstruction)?.reference?.let { ref ->
                                (ref as? StringReference)?.string == SHOP_LINK_HIDDEN_STRING
                            } == true
                        } == true
                }
            }
        ?: throw PatchException("RemoteConfig class containing $SHOP_LINK_HIDDEN_STRING not found")

    val hMethod = remoteConfigClass.methods.firstOrNull {
        it.returnType == "Z" &&
            it.parameterTypes.isEmpty() &&
            it.implementation != null &&
            (
                it.name == "h" ||
                    it.implementation?.instructions?.any { inst ->
                        (inst as? ReferenceInstruction)?.reference?.let { ref ->
                            (ref as? StringReference)?.string == SHOP_LINK_HIDDEN_STRING
                        } == true
                    } == true
                )
    } ?: throw PatchException("Method returning shopLinkIsHidden not found in ${remoteConfigClass.type}")

    val impl = hMethod.implementation ?: throw PatchException("Missing implementation in ${hMethod.name}")
    val firstInst = impl.instructions.firstOrNull()
    if (firstInst?.opcode == Opcode.CONST_4 &&
        (firstInst as? OneRegisterInstruction)?.registerA == 0 &&
        impl.instructions.elementAtOrNull(1)?.opcode == Opcode.RETURN
    ) {
        return
    }

    hMethod.addInstructions(
        0,
        """
        const/4 v0, 0x1
        return v0
        """.trimIndent()
    )
}

/**
 * In the Profile screen root composable (profile/l.c), ensures the if-nez branch following
 * `ura.a` (ShopLinkData.isHidden) unconditionally evaluates to true.
 *
 * This guarantees that even if ShopLinkData was emitted with isHidden = false, the Composable
 * skips the entire Shop Geocaching row and promotional item card without disrupting Compose
 * slot table alignment.
 */
private fun BytecodePatchContext.patchProfileShopComposable() {
    val profileClass = mutableClassDefByOrNull(PROFILE_COMPOSABLE_CLASS)
        ?: throw PatchException("Class $PROFILE_COMPOSABLE_CLASS not found")

    val cMethod = profileClass.methods.firstOrNull {
        it.name == "c" && it.returnType == "V" && it.implementation != null && it.parameterTypes.size == 13
    } ?: throw PatchException("Profile composable method c not found in $PROFILE_COMPOSABLE_CLASS")

    val impl = cMethod.implementation ?: throw PatchException("Missing implementation in profile c method")
    val instructions = impl.instructions.toList()

    val igetIndex = instructions.indexOfFirst { inst ->
        inst.opcode == Opcode.IGET_BOOLEAN &&
            ((inst as? ReferenceInstruction)?.reference as? FieldReference)?.let { fieldRef ->
                fieldRef.name == "a" && fieldRef.type == "Z" && fieldRef.definingClass == "Lura;"
            } == true
    }
    if (igetIndex < 0) {
        throw PatchException("Could not find iget-boolean for ura.a in profile c method")
    }

    val igetInst = instructions[igetIndex] as? OneRegisterInstruction
        ?: throw PatchException("iget-boolean is not OneRegisterInstruction")
    val reg = igetInst.registerA

    val branchIndex = instructions.subList(igetIndex + 1, instructions.size).indexOfFirst { inst ->
        inst.opcode == Opcode.IF_NEZ &&
            (inst as? OneRegisterInstruction)?.registerA == reg
    }.let { if (it >= 0) igetIndex + 1 + it else -1 }

    if (branchIndex < 0) {
        throw PatchException("Could not find if-nez instruction following ura.a in profile c method")
    }

    val prev = instructions.getOrNull(branchIndex - 1)
    val alreadyPatched = prev?.opcode == Opcode.CONST_4 &&
        (prev as? OneRegisterInstruction)?.registerA == reg
    if (!alreadyPatched) {
        cMethod.addInstructions(branchIndex, "const/4 v$reg, 0x1")
    }
}
