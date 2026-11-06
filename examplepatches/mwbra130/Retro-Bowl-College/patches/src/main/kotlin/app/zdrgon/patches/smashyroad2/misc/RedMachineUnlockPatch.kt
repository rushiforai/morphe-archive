package app.zdrgon.patches.smashyroad2.misc

import app.morphe.patcher.patch.rawResourcePatch
import app.zdrgon.patches.smashyroad2.shared.Constants.COMPATIBILITY_SMASHY_ROAD_2

/**
 * Unlocks all slot machines (machine1/2/3) without Google Play.
 *
 * The game has three separate ownership checks, one per machine.
 * Each sets hasMachineN=0, queries Google Play, and only sets it to 1
 * if the purchase is found. This patch NOPs all three conditional
 * branches so the "owned" path always executes.
 *
 * All patterns verified unique (1 occurrence each in 52MB binary).
 * Aborts safely if any pattern count isn't exactly 1.
 */
private val MACHINE1_PATTERN = byteArrayOf(
    0x0F, 0x03, 0x5D.toByte(), 0x94.toByte(),
    0x1F, 0x04, 0x00, 0x71,
    0x61, 0x00, 0x00, 0x54,
    0x28, 0x00, 0x80.toByte(), 0x52,
    0x68, 0x42, 0x0E, 0x39,
    0x80.toByte(), 0x02, 0x40, 0xF9.toByte(),
)

private val MACHINE2_PATTERN = byteArrayOf(
    0x06, 0x03, 0x5D.toByte(), 0x94.toByte(),
    0x1F, 0x04, 0x00, 0x71,
    0x61, 0x00, 0x00, 0x54,
    0x28, 0x00, 0x80.toByte(), 0x52,
    0x68, 0x46, 0x0E, 0x39,
    0x80.toByte(), 0x02, 0x40, 0xF9.toByte(),
)

private val MACHINE3_PATTERN = byteArrayOf(
    0xFF.toByte(), 0x02, 0x5D.toByte(), 0x94.toByte(),
    0x1F, 0x04, 0x00, 0x71,
    0x61, 0x00, 0x00, 0x54,
    0x28, 0x00, 0x80.toByte(), 0x52,
    0x68, 0x4A, 0x0E, 0x39,
    0xF7.toByte(), 0xD7.toByte(), 0x00, 0xD0.toByte(),
)

// NOP instruction (ARM64) - replaces b.ne at offset 8 in each pattern
private val NOP = byteArrayOf(0x1F, 0x20, 0x03, 0xD5.toByte())

// Vehicle/character unlock via checkIfUnlocked - DISABLED
// The mov w1,#1 patch was not effective. Research ongoing.
// Keeping patterns for reference but not applying.
private val CHECK_VEHICLE_PATTERN = byteArrayOf(
    0x94.toByte(), 0x94.toByte(), 0x05, 0x94.toByte(),
    0xA0.toByte(), 0x0A, 0x00, 0xB4.toByte(),
    0x08, 0x58, 0x40, 0xB9.toByte(),
    0x1F, 0x01, 0x13, 0x6B,
)

private val CHECK_PERSON_PATTERN = byteArrayOf(
    0x83.toByte(), 0xFE.toByte(), 0xFF.toByte(), 0x97.toByte(),
    0x34, 0x00, 0x00, 0x14,
    0xE0.toByte(), 0x03, 0x14, 0xAA.toByte(),
    0xA6.toByte(), 0xF0.toByte(), 0xFF.toByte(), 0x97.toByte(),
)

// carSelector.setUnlocked() - 40-byte pattern
// At offset 36: ldr w8, [x20, #0x18] (loads owned count)
// Patch: mov w8, #100 (unlock 100 vehicles)
private val SET_UNLOCKED_PATTERN = byteArrayOf(
    0x88.toByte(), 0xCE.toByte(), 0x35, 0x8B.toByte(),
    0x00, 0x11, 0x40, 0xF9.toByte(),
    0x40, 0x09, 0x00, 0xB4.toByte(),
    0xE1.toByte(), 0x03, 0x1F, 0xAA.toByte(),
    0x67, 0x65, 0x5B, 0x94.toByte(),
    0xE0.toByte(), 0x08, 0x00, 0xB4.toByte(),
    0x61, 0x1E, 0x40, 0xF9.toByte(),
    0xE2.toByte(), 0x03, 0x1F, 0xAA.toByte(),
    0x28, 0x68, 0x5B, 0x94.toByte(),
    0x88.toByte(), 0x1A, 0x40, 0xB9.toByte(),
)

// mov w8, #100 (0x64)
private val MOV_W8_100 = byteArrayOf(
    0x88.toByte(), 0x0C, 0x80.toByte(), 0x52,
)

// buyBtn() - called when tapping a locked car's buy button
// Pattern: 16 bytes unique
private val BUY_BTN_PATTERN = byteArrayOf(
    0x71, 0x71, 0x5B.toByte(), 0x94.toByte(),
    0x60, 0x62, 0x40, 0xF9.toByte(),
    0x80.toByte(), 0x0A, 0x00, 0xB4.toByte(),
    0xA1.toByte(), 0x02, 0x40, 0xF9.toByte(),
)

// bl unlockAll (0x169EA54 from 0x16A08BC); ret; nop; nop (16 bytes)
// Verified: bl #0x169ea54 = 66 F8 FF 97
private val BUY_BTN_PATCHED = byteArrayOf(
    0x66, 0xF8.toByte(), 0xFF.toByte(), 0x97.toByte(),
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
    0x1F, 0x20, 0x03, 0xD5.toByte(),
    0x1F, 0x20, 0x03, 0xD5.toByte(),
)

private val FORCE_UNLOCKED = byteArrayOf(
    0x21, 0x00, 0x80.toByte(), 0x52,
)

@Suppress("unused")
val redMachineUnlockPatch = rawResourcePatch(
    name = "Unlock All Slot Machines",
    description = "Unlocks all slot machines (1/2/3) without Google Play purchase. " +
        "Patches the native ownership checks to always grant the machines.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMASHY_ROAD_2)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        fun findUnique(pattern: ByteArray, name: String): Int {
            var foundOffset = -1
            var count = 0
            for (i in 0..bytes.size - pattern.size) {
                var match = true
                for (j in pattern.indices) {
                    if (bytes[i + j] != pattern[j]) {
                        match = false
                        break
                    }
                }
                if (match) {
                    count++
                    if (foundOffset == -1) foundOffset = i
                }
            }
            if (count != 1) {
                throw Exception(
                    "UnlockAll: Expected 1 match for $name, found $count. " +
                        "APK version may not be supported. Aborting safely."
                )
            }
            return foundOffset
        }

        // Patch 1-3: Slot machines (NOP the b.ne at offset 8)
        val machinePatterns = listOf(
            MACHINE1_PATTERN to "machine1",
            MACHINE2_PATTERN to "machine2",
            MACHINE3_PATTERN to "machine3",
        )
        for ((pattern, name) in machinePatterns) {
            val offset = findUnique(pattern, name)
            val patchOffset = offset + 8
            for (j in NOP.indices) {
                bytes[patchOffset + j] = NOP[j]
            }
        }

        // Patch 4: Vehicles - DISABLED (caused black UI)
        // The setUnlocked count patch broke the UI by looping out of bounds.
        // Vehicle unlock requires a different approach.
        /*
        val setUnlockedOffset = findUnique(SET_UNLOCKED_PATTERN, "setUnlocked")
        val ldrOffset = setUnlockedOffset + 36
        for (j in MOV_W8_100.indices) {
            bytes[ldrOffset + j] = MOV_W8_100[j]
        }
        */

        // Patch 5: buyBtn (DISABLED - was not effective)
        /*
        val buyBtnOffset = findUnique(BUY_BTN_PATTERN, "buyBtn")
        for (j in BUY_BTN_PATCHED.indices) {
            bytes[buyBtnOffset + j] = BUY_BTN_PATCHED[j]
        }
        */

        // Vehicle/character patches DISABLED - not effective
        // Research ongoing for proper unlock method
        /*
        val vehicleOffset = findUnique(CHECK_VEHICLE_PATTERN, "checkIfUnlocked")
        for (j in FORCE_UNLOCKED.indices) {
            bytes[vehicleOffset + j] = FORCE_UNLOCKED[j]
        }

        val personOffset = findUnique(CHECK_PERSON_PATTERN, "checkIfUnlockedPerson")
        for (j in FORCE_UNLOCKED.indices) {
            bytes[personOffset + j] = FORCE_UNLOCKED[j]
        }
        */

        soFile.writeBytes(bytes)
    }
}
