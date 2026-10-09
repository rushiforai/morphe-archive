package app.aidan.patches.blackjack.customization

import app.aidan.patches.blackjack.shared.COMPATIBILITY_BLACKJACK
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch

private val OPEN_SHOP_PROLOGUE = byteArrayOf(
    0xfe.toByte(), 0x0f, 0x1a, 0xf8.toByte(),
    0xfc.toByte(), 0x6f, 0x01, 0xa9.toByte(),
    0xfa.toByte(), 0x67, 0x02, 0xa9.toByte(),
    0xf8.toByte(), 0x5f, 0x03, 0xa9.toByte(),
    0xf6.toByte(), 0x57, 0x04, 0xa9.toByte()
)

private val LEGACY_CUSTOM_STORE_GRANT = byteArrayOf(
    0x01, 0x48, 0x88.toByte(), 0xd2.toByte(),
    0xe1.toByte(), 0x01, 0xa0.toByte(), 0xf2.toByte(),
    0x02, 0x00, 0x80.toByte(), 0x52,
    0x23, 0x00, 0x80.toByte(), 0x52,
    0x97.toByte(), 0x01, 0x00, 0x14
)

private val OPEN_SHOP_HOOK = byteArrayOf(
    0xfe.toByte(), 0x0f, 0x1f, 0xf8.toByte(), // str x30, [sp, #-0x10]!
    0xe0.toByte(), 0x03, 0x1f, 0xaa.toByte(), // mov x0, xzr
    0xe1.toByte(), 0x03, 0x1f, 0xaa.toByte(), // mov x1, xzr
    0xe2.toByte(), 0x03, 0x1f, 0xaa.toByte(), // mov x2, xzr
    0xe3.toByte(), 0x03, 0x1f, 0xaa.toByte(), // mov x3, xzr
    0x7f, 0x25, 0x73, 0x94.toByte(),         // bl MNAndroidNative.showDialog (0x3c98ce4)
    0xfe.toByte(), 0x07, 0x41, 0xf8.toByte(), // ldr x30, [sp], #0x10
    0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte()  // ret
)

private val CHECK_UPDATE_PROLOGUE = byteArrayOf(
    0xfe.toByte(), 0x5f, 0xbd.toByte(), 0xa9.toByte(),
    0xf6.toByte(), 0x57, 0x01, 0xa9.toByte(),
    0xf4.toByte(), 0x4f, 0x02, 0xa9.toByte()
)
private val PREVIOUS_SET_CREDIT_HOOK = byteArrayOf(
    0xf3.toByte(), 0x7b.toByte(), 0xbe.toByte(), 0xa9.toByte(),
    0xf3.toByte(), 0x03, 0x00, 0xaa.toByte(),
    0xe0.toByte(), 0x03, 0x01, 0xaa.toByte(),
    0xe1.toByte(), 0x43.toByte(), 0x00, 0x91.toByte(),
    0x61.toByte(), 0x9e.toByte(), 0x56, 0x94.toByte()
)

internal val UNIFIED_APP_HOOK = byteArrayOf(
    0xf3.toByte(), 0x7b.toByte(), 0xbe.toByte(), 0xa9.toByte(), // stp x19, x30, [sp, #-0x20]!
    0xf3.toByte(), 0x03, 0x00, 0xaa.toByte(),                 // mov x19, x0
    0xe0.toByte(), 0x03, 0x01, 0xaa.toByte(),                 // mov x0, x1
    0xe1.toByte(), 0x43.toByte(), 0x00, 0x91.toByte(),         // add x1, sp, #0x10
    0x3f, 0x57, 0x57, 0x94.toByte(),         // bl System.Int64.TryParse (0x35a655c)
    0xa0.toByte(), 0x02, 0x00, 0x34.toByte(),                 // cbz w0, 0x68 (_skip_level)
    0x62.toByte(), 0x1e.toByte(), 0x40, 0xf9.toByte(),         // ldr x2, [x19, #0x38]
    0xe2.toByte(), 0x04, 0x00, 0xb4.toByte(),                 // cbz x2, 0xb8 (_success)
    0x43.toByte(), 0x08, 0x40, 0xf9.toByte(),                 // ldr x3, [x2, #0x10]
    0xa3.toByte(), 0x04, 0x00, 0xb4.toByte(),                 // cbz x3, 0xb8 (_success)
    0x62.toByte(), 0x08, 0x40, 0xf9.toByte(),                 // ldr x2, [x3, #0x10]
    0xe1.toByte(), 0x0b.toByte(), 0x40, 0xf9.toByte(),         // ldr x1, [sp, #0x10]
    0x21.toByte(), 0x00, 0x02, 0xcb.toByte(),                 // sub x1, x1, x2 (delta = newCredit - oldCredit)
    0x3f.toByte(), 0x00, 0x00, 0xf1.toByte(),                 // cmp x1, #0
    0xec.toByte(), 0x00, 0x00, 0x54.toByte(),                 // b.gt 0x54 (add_mode)
    0xe1.toByte(), 0x0b.toByte(), 0x40, 0xf9.toByte(),         // ldr x1, [sp, #0x10]
    0x60.toByte(), 0x1e.toByte(), 0x40, 0xf9.toByte(),         // ldr x0, [x19, #0x38]
    0x49, 0xe8.toByte(), 0xff.toByte(), 0x97.toByte(), // bl PlayerProfile.SetDebugCredit (0x1fca9b8)
    0xe1.toByte(), 0x03, 0x1f, 0xaa.toByte(),                 // mov x1, xzr
    0xe3.toByte(), 0x03, 0x1f, 0x2a.toByte(),                 // mov w3, wzr
    0x02.toByte(), 0x00, 0x00, 0x14.toByte(),                 // b 0x58 (call_addchips)
    0x23.toByte(), 0x00, 0x80.toByte(), 0x52.toByte(),         // mov w3, #1 (visualize = true)
    0x02.toByte(), 0x00, 0x80.toByte(), 0x52.toByte(),         // mov w2, #0 (RewardOption.None)
    0xe0.toByte(), 0x03, 0x13, 0xaa.toByte(),                 // mov x0, x19
    0x24.toByte(), 0xfd.toByte(), 0xff.toByte(), 0x97.toByte(), // bl BlackjackApplication.AddChips (0x1fcfd40)
    0x15.toByte(), 0x00, 0x00, 0x14.toByte(),                 // b 0xb8 (_success)
    // _skip_level (0x68):
    0x60.toByte(), 0x1e.toByte(), 0x40, 0xf9.toByte(),         // ldr x0, [x19, #0x38]
    0x20.toByte(), 0x02, 0x00, 0xb4.toByte(),                 // cbz x0, 0xb0 (_fail)
    0xf4.toByte(), 0x57.toByte(), 0xbf.toByte(), 0xa9.toByte(), // stp x20, x21, [sp, #-0x10]!
    0xf4.toByte(), 0x03, 0x00, 0xaa.toByte(),                 // mov x20, x0
    0x3f, 0xe4.toByte(), 0xff.toByte(), 0x97.toByte(), // bl PlayerProfile.get_LevelData (0x1fc99c4)
    0x80.toByte(), 0x01, 0x00, 0xb4.toByte(),                 // cbz x0, 0xac (to ldp)
    0x01.toByte(), 0x10.toByte(), 0x40, 0xf9.toByte(),         // ldr x1, [x0, #0x20] (XPPerLevel)
    0x88.toByte(), 0x0a.toByte(), 0x40, 0xf9.toByte(),         // ldr x8, [x20, #0x10] (PlayerData)
    0x28.toByte(), 0x01, 0x00, 0xb4.toByte(),                 // cbz x8, 0xac (to ldp)
    0x01.toByte(), 0x11.toByte(), 0x00, 0xf9.toByte(),         // str x1, [x8, #0x20] (data->XP = XPPerLevel)
    0xe0.toByte(), 0x03, 0x14.toByte(), 0xaa.toByte(),         // mov x0, x20 (PlayerProfile*)
    0x21.toByte(), 0x00, 0x80.toByte(), 0xd2.toByte(),         // mov x1, #1 (bet = 1)
    0xec.toByte(), 0xe5.toByte(), 0xff.toByte(), 0x97.toByte(), // bl PlayerProfile.EarnXp (0x1fca098)
    0xe0.toByte(), 0x03, 0x13, 0xaa.toByte(),                 // mov x0, x19 (BlackjackApplication*)
    0x7e.toByte(), 0xfd.toByte(), 0xff.toByte(), 0x97.toByte(), // bl BlackjackApplication.GoToLastPlayedTable (0x1fcfee8)
    0xf4.toByte(), 0x57.toByte(), 0xc1.toByte(), 0xa8.toByte(), // ldp x20, x21, [sp], #0x10
    0x04.toByte(), 0x00, 0x00, 0x14.toByte(),                 // b 0xb8 (_success)
    0xf4.toByte(), 0x57.toByte(), 0xc1.toByte(), 0xa8.toByte(), // ldp x20, x21, [sp], #0x10
    // _fail (0xb0):
    0xe0.toByte(), 0x03, 0x1f, 0x2a.toByte(),                 // mov w0, wzr
    0x02.toByte(), 0x00, 0x00, 0x14.toByte(),                 // b 0xbc (_done)
    // _success (0xb8):
    0x20.toByte(), 0x00, 0x80.toByte(), 0x52.toByte(),         // mov w0, #1
    // _done (0xbc):
    0xf3.toByte(), 0x7b.toByte(), 0xc2.toByte(), 0xa8.toByte(), // ldp x19, x30, [sp], #0x20
    0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte()                  // ret
)
private const val OPEN_SHOP_OFFSET = 0x1fcf6d4
private const val CHECK_UPDATE_OFFSET = 0x1fd0850
private const val NATIVE_POPUPS_MANAGER = "Lcom/mnp/popups/NativePopupsManager;"

@Suppress("unused")
val patchChipStoreResourcePatch = rawResourcePatch(
    name = "Custom Chip Store Binary Hook",
    description = "Hooks BlackjackApplication.OpenShop and CheckUpdateToVersion in libil2cpp.so to bridge the custom chip store.",
    default = true
) {
    category("Features")
    compatibleWith(COMPATIBILITY_BLACKJACK)

    execute {

        val library = get("lib/arm64-v8a/libil2cpp.so")
        if (!library.exists()) throw PatchException("Missing arm64 IL2CPP library")

        val bytes = library.readBytes()
        if (bytes.size < CHECK_UPDATE_OFFSET + UNIFIED_APP_HOOK.size) {
            throw PatchException("libil2cpp.so is too small for chip store hooks")
        }

        // 1. Hook OpenShop
        val openShopAlreadyPatched = OPEN_SHOP_HOOK.indices.all { bytes[OPEN_SHOP_OFFSET + it] == OPEN_SHOP_HOOK[it] }
        if (!openShopAlreadyPatched) {
            val matchesPrologue = OPEN_SHOP_PROLOGUE.indices.all { bytes[OPEN_SHOP_OFFSET + it] == OPEN_SHOP_PROLOGUE[it] }
            val matchesLegacy = LEGACY_CUSTOM_STORE_GRANT.indices.all { bytes[OPEN_SHOP_OFFSET + it] == LEGACY_CUSTOM_STORE_GRANT[it] }
            if (!matchesPrologue && !matchesLegacy) {
                throw PatchException("BlackjackApplication.OpenShop byte sequence mismatch at 0x${OPEN_SHOP_OFFSET.toString(16)}")
            }
            System.arraycopy(OPEN_SHOP_HOOK, 0, bytes, OPEN_SHOP_OFFSET, OPEN_SHOP_HOOK.size)
        }

        // 2. Hook CheckUpdateToVersion to set debug credit and skip level
        val setCreditAlreadyPatched = UNIFIED_APP_HOOK.indices.all { bytes[CHECK_UPDATE_OFFSET + it] == UNIFIED_APP_HOOK[it] }
        if (!setCreditAlreadyPatched) {
            val matchesPrologue = CHECK_UPDATE_PROLOGUE.indices.all { bytes[CHECK_UPDATE_OFFSET + it] == CHECK_UPDATE_PROLOGUE[it] }
            val matchesPrevious = PREVIOUS_SET_CREDIT_HOOK.indices.all { bytes[CHECK_UPDATE_OFFSET + it] == PREVIOUS_SET_CREDIT_HOOK[it] }
            if (!matchesPrologue && !matchesPrevious) {
                throw PatchException("BlackjackApplication.CheckUpdateToVersion byte sequence mismatch at 0x${CHECK_UPDATE_OFFSET.toString(16)}")
            }
            System.arraycopy(UNIFIED_APP_HOOK, 0, bytes, CHECK_UPDATE_OFFSET, UNIFIED_APP_HOOK.size)
        }

        library.writeBytes(bytes)
    }
}

@Suppress("unused")
val addCustomChipStorePatch = bytecodePatch(
    name = "Add Custom Chip Store",
    description = "Replaces the unavailable store with a dialog to view and set your exact chip balance.",
    default = true
) {
    category("Features")
    compatibleWith(COMPATIBILITY_BLACKJACK)
    dependsOn(patchChipStoreResourcePatch)
    extendWith("extensions/extension.mpe")

    execute {
        val manager = mutableClassDefByOrNull(NATIVE_POPUPS_MANAGER)
            ?: throw PatchException("NativePopupsManager class not found")
        val showDialog = manager.methods.singleOrNull { method ->
            method.name == "ShowDialog" &&
                method.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;") &&
                method.returnType == "V"
        } ?: throw PatchException("NativePopupsManager.ShowDialog(String, String, String, String) method not found")

        showDialog.addInstructions(
            0,
            """
            invoke-static {}, Lapp/aidan/extension/blackjack/ChipBalanceDialog;->show()V
            return-void
            """.trimIndent()
        )
    }
}

