package app.finance.patches.sezzle.navigation

import app.finance.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.finance.patches.sezzle.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

@Suppress("unused")
val renameShopToHomePatch = rawResourcePatch(
    name = "Replace Shop with Home",
    description = "Replaces the Shop bottom navigation tab with Home and removes home feed content.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SEZZLE)

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())

        // Rename tab title: replace string operand "navigation.Shop" with "navigation.Home"
        val protectedStackOffset = editor.findFunctionOffsetByName("ProtectedStack")
            ?: throw PatchException("ProtectedStack function not found")

        val oldTitleId = editor.findStringId("navigation.Shop")
            ?: throw PatchException("String 'navigation.Shop' not found")
        val newTitleId = editor.findStringId("navigation.Home")
            ?: throw PatchException("String 'navigation.Home' not found")

        val bytes = editor.toByteArray()

        val oldTitleBytes = byteArrayOf(
            (oldTitleId and 0xFF).toByte(),
            ((oldTitleId ushr 8) and 0xFF).toByte()
        )
        val newTitleBytes = byteArrayOf(
            (newTitleId and 0xFF).toByte(),
            ((newTitleId ushr 8) and 0xFF).toByte()
        )

        // Locate LoadConstString for navigation.Shop within ProtectedStack bytecode
        var titlePatched = false
        for (i in protectedStackOffset until protectedStackOffset + 15000) {
            // LoadConstString opcode is 0x90, format: [0x90, reg, id_low, id_high]
            if ((bytes[i].toInt() and 0xFF) == 0x90 &&
                bytes[i + 2] == oldTitleBytes[0] &&
                bytes[i + 3] == oldTitleBytes[1]
            ) {
                bytes[i + 2] = newTitleBytes[0]
                bytes[i + 3] = newTitleBytes[1]
                titlePatched = true
                break
            }
        }
        if (!titlePatched) {
            throw PatchException("Could not find LoadConstString instruction for navigation.Shop in ProtectedStack")
        }

        // Remove home feed content while preserving header and search navigation:
        // unmount ScrollListView by setting storeDirectoryContainer children array size to 1
        val storeRootOffset = editor.findFunctionOffsetByName("StoreRoot")
            ?: throw PatchException("StoreRoot function not found")

        var feedPatched = false
        for (i in storeRootOffset until storeRootOffset + 18000) {
            // DefineOwnInDenseArray: [0x5a, regArr, regFeed, 0x01]
            // PutOwnBySlotIdx: [0x52, regView, regArr, 0x04]
            if ((bytes[i].toInt() and 0xFF) == 0x5a &&
                bytes[i + 3] == 0x01.toByte() &&
                (bytes[i + 4].toInt() and 0xFF) == 0x52 &&
                bytes[i + 6] == bytes[i + 1] &&
                bytes[i + 7] == 0x04.toByte()
            ) {
                val regArr = bytes[i + 1]
                val regFeed = bytes[i + 2]

                // Replace DefineOwnInDenseArray with LoadConstUndefined regFeed twice
                bytes[i] = 0x93.toByte()
                bytes[i + 1] = regFeed
                bytes[i + 2] = 0x93.toByte()
                bytes[i + 3] = regFeed

                // Scan backwards for NewArray <regArr, 2> to change array size from 2 to 1
                for (j in i - 1 downTo i - 200) {
                    if ((bytes[j].toInt() and 0xFF) == 0x08 &&
                        bytes[j + 1] == regArr &&
                        bytes[j + 2] == 0x02.toByte() &&
                        bytes[j + 3] == 0x00.toByte()
                    ) {
                        bytes[j + 2] = 0x01.toByte()
                        feedPatched = true
                        break
                    }
                }
                break
            }
        }
        if (!feedPatched) {
            throw PatchException("Could not find storeDirectoryContainer children instructions in StoreRoot")
        }
        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
