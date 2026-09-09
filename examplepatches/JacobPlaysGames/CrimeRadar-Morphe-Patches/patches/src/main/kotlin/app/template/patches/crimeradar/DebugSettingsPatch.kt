package app.template.patches.crimeradar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CRIMERADAR

/**
 * Adds a "CrimeRadar+ Patches" entry to the Settings screen.
 *
 * Implementation: Injects into SettingAdapter.initSettingItems() to append a new
 * SettingItem using the unused SettingId.Favorite enum value. The entry shows
 * "CrimeRadar+ Patches" with "Tap for debug info" description.
 *
 * Clicking the entry does nothing harmful — Favorite (ordinal 0) maps to
 * WhenMappings[0] = 0 which has no case in the switch, so it falls through silently.
 *
 * NOTE: We do NOT inject into onClick(). Prepending code into onClick() causes
 * ART VerifyError at class-load time because the injected code modifies v0/v1
 * which creates type-state conflicts at the :original merge point during
 * bytecode verification. ART verifies ALL methods when SettingAdapter loads.
 */
@Suppress("unused")
val debugSettingsPatch = bytecodePatch(
    name = "Debug Settings",
    description = "Adds a CrimeRadar+ debug info entry to the settings screen.",
    default = false
) {
    compatibleWith(COMPATIBILITY_CRIMERADAR)

    execute {
        val initMethod = SettingInitItemsFingerprint.method
        val initCount = initMethod.implementation?.instructions?.size
            ?: error("initSettingItems has no implementation")

        // Inject BEFORE the last instruction (return-void).
        // No comments in smali string — Morphe assembler may not handle # lines.
        val smali = """
new-instance v0, Lcom/particlemedia/feature/settings/SettingItem;
sget-object v1, Lcom/particlemedia/feature/settings/SettingItem${'$'}SettingId;->Favorite:Lcom/particlemedia/feature/settings/SettingItem${'$'}SettingId;
sget-object v2, Lcom/particlemedia/feature/settings/SettingItem${'$'}SettingType;->Option_New:Lcom/particlemedia/feature/settings/SettingItem${'$'}SettingType;
const/4 v3, 0x0
const/4 v4, 0x0
const/4 v5, 0x0
const/4 v6, 0x0
invoke-direct/range {v0 .. v6}, Lcom/particlemedia/feature/settings/SettingItem;-><init>(Lcom/particlemedia/feature/settings/SettingItem${'$'}SettingId;Lcom/particlemedia/feature/settings/SettingItem${'$'}SettingType;IIILjava/lang/String;)V
const-string v1, "CrimeRadar+ Patches"
iput-object v1, v0, Lcom/particlemedia/feature/settings/SettingItem;->nameString:Ljava/lang/String;
const-string v1, "Tap for debug info"
iput-object v1, v0, Lcom/particlemedia/feature/settings/SettingItem;->descStr:Ljava/lang/String;
iget-object v1, p0, Lcom/particlemedia/feature/settings/SettingAdapter;->items:Ljava/util/ArrayList;
invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        """.trimIndent()

        initMethod.addInstructions(initCount - 1, smali)
    }
}
