package app.danielthemaniel.patches.pokegenie

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val DATA_MANAGER = "Lcom/canjin/pokegenie/pokegenie/DataManager;"
private const val POKE_GENIE_USER = "Lcom/canjin/pokegenie/signIn/PokeGenieUser;"

/**
 * Unlocks all Client-Side and Server-Side premium features using a "short-circuit" technique.
 * 
 * Instead of searching for instruction indices (which causes compilation errors), this patch 
 * injects at index 0 of the target methods and immediately returns. This safely bypasses 
 * local file reading and forces the app to read our hardcoded 'true' / max-tier values.
 */
@Suppress("unused")
val unlockAllIapPatch = bytecodePatch(
    name = "Unlock All IAPs",
    description = "Forces premium flags and server getters to true/max by short-circuiting their methods.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_POKEGENIE)
    
    execute {
        // ==========================================
        // DOMAIN A: CLIENT-SIDE (Scan Pro / Battle Pro)
        // ==========================================
        val dataManagerClass = mutableClassDefBy(DATA_MANAGER)
        
        // 1. Short-circuit readPro() to force disableAds = true
        dataManagerClass.methods.find { it.name == "readPro" && it.parameterTypes.isEmpty() }?.addInstructions(0, """
            const/4 v0, 0x1
            iput-boolean v0, p0, $DATA_MANAGER->disableAds:Z
            return-void
        """.trimIndent())

        // 2. Short-circuit readBattlePro() to force battleProVersion = true
        dataManagerClass.methods.find { it.name == "readBattlePro" && it.parameterTypes.isEmpty() }?.addInstructions(0, """
            const/4 v0, 0x1
            iput-boolean v0, p0, $DATA_MANAGER->battleProVersion:Z
            return-void
        """.trimIndent())

        // ==========================================
        // DOMAIN B: SERVER-SIDE (Raid Tiers / Host Passes)
        // ==========================================
        val userClass = mutableClassDefBy(POKE_GENIE_USER)
        
        // 1. Force Raid Pro Level to max (3 = Master tier)
        userClass.methods.find { it.name == "getRaidProSubLevel" || it.name == "getRaidProLevel" }?.addInstructions(0, """
            const/4 v0, 0x3
            return v0
        """.trimIndent())

        // 2. Force Host Pass Active to Express pass (Value 2)
        userClass.methods.find { it.name == "getHostPassActive" }?.addInstructions(0, """
            const/4 v0, 0x2
            return v0
        """.trimIndent())

        // 3. Force VIP Member status to true
        userClass.methods.find { it.name == "isRaidVIPMember" }?.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """.trimIndent())
    }
}