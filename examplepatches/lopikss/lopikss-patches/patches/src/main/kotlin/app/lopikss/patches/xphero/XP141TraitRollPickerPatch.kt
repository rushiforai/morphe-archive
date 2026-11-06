package app.lopikss.patches.xphero

import app.lopikss.patches.shared.Constants.XP_HERO_27
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption

/**
 * Morphe's dropdown renders the stored String value, not a separate label.
 * Human-readable values are the canonical representation; the original
 * XP Hero numeric codes remain accepted for previous Morphe settings.
 */
internal object XP141TraitOptionLabels {
    val grades = linkedMapOf(
        "S" to 6,
        "SS" to 7,
        "SSS" to 8,
    )

    val stats = linkedMapOf(
        "Total Attack Power" to 1,
        "Melee Weapon Damage" to 20,
        "Ranged Weapon Damage" to 19,
        "Critical Damage" to 2,
        "Critical Chance" to 9,
        "Attack Speed" to 10,
        "Max HP" to 5,
        "Healing Reduction on Hit" to 18,
        "Status Effect Resistance" to 21,
    )

    val synergies = linkedMapOf(
        "Warrior's Fist (orange attack)" to 1,
        "Vampire Fang (red)" to 2,
        "Dragon's Claw (blue critical damage)" to 3,
        "Ogre Heart (green HP)" to 4,
        "Sage's Hourglass (purple cooldown)" to 5,
    )

    fun toId(value: String?, available: Map<String, Int>, fallback: String): Int {
        val selected = value ?: fallback
        return available[selected] ?: selected.toIntOrNull()?.takeIf { it in available.values }
            ?: error("Unrecognized trait choice: " + selected)
    }
}

/**
 * XP Hero 27.0.0 S-ticket outcome picker.
 *
 * Configure from Morphe's PATCH SETTINGS before patching. The chosen outcome
 * applies to subsequent S-ticket rolls; it does not directly edit existing
 * traits, add tickets, or provide an in-game menu. Change the choice by
 * changing patch settings and creating a new patched APK.
 */
@Suppress("unused")
val xp141ChooseSTicketTrait = rawResourcePatch(
    name = "XP Hero | Choose S-Ticket Trait",
    description = "Choose S/SS/SSS rarity, stat and set icon in patch settings. S-ticket roll weights favor exactly that combination. Coin-roll rarity/synergy odds unchanged; same-rarity stats are shared. Combine with Free S-Ticket Rolls.",
    default = false,
) {
    compatibleWith(XP_HERO_27)

    // Morphe's dropdown values are displayed literally in the selected field.
    // Keep both map keys AND stored values readable, and translate internally
    // to the XP Hero numeric data-table identifiers on execute.
    val desiredGrade = stringOption(
        key = "chosenTraitGradeLabel",
        default = "SSS",
        values = XP141TraitOptionLabels.grades.keys.associateWith { it },
        title = "S-ticket rarity",
        description = "Every S-ticket roll selects this rarity. SSS is the highest.",
        required = true,
        validator = { it != null && (it in XP141TraitOptionLabels.grades ||
            it.toIntOrNull() in XP141TraitRollPickerData.validRarities) },
    )

    val desiredStat = stringOption(
        key = "chosenTraitStatLabel",
        default = "Total Attack Power",
        values = XP141TraitOptionLabels.stats.keys.associateWith { it },
        title = "Trait stat",
        description = "Choose the exact bonus you want from the next S-ticket roll.",
        required = true,
        validator = { it != null && (it in XP141TraitOptionLabels.stats ||
            it.toIntOrNull() in XP141TraitRollPickerData.validStats) },
    )

    val desiredSet = stringOption(
        key = "chosenTraitSynergyLabel",
        default = "Warrior's Fist (orange attack)",
        values = XP141TraitOptionLabels.synergies.keys.associateWith { it },
        title = "Trait synergy icon",
        description = "Choose the set icon to build matching trait synergy.",
        required = true,
        validator = { it != null && (it in XP141TraitOptionLabels.synergies ||
            it.toIntOrNull() in XP141TraitRollPickerData.validSynergies) },
    )

    execute {
        // Fresh option keys prevent Morphe from redisplaying the old numeric
        // saved selections. The parser still accepts legacy numeric codes
        // in case settings are restored from an older user configuration.
        val grade = XP141TraitOptionLabels.toId(
            desiredGrade.value, XP141TraitOptionLabels.grades, "SSS"
        )
        val stat = XP141TraitOptionLabels.toId(
            desiredStat.value, XP141TraitOptionLabels.stats, "Total Attack Power"
        )
        val synergy = XP141TraitOptionLabels.toId(
            desiredSet.value, XP141TraitOptionLabels.synergies, "Warrior's Fist (orange attack)"
        )

        val rollAsset = get(XP141TraitRollPickerData.ROLLS)
        val optionAsset = get(XP141TraitRollPickerData.OPTIONS)
        val synergyAsset = get(XP141TraitRollPickerData.SYNERGIES)

        // All three files must pass original-XAPK SHA-256 and table validation
        // BEFORE writing any edited resource.
        val editedRolls = XP141TraitRollPickerData.forceTicketRarity(
            rollAsset.readBytes(), grade
        )
        val editedOptions = XP141TraitRollPickerData.forceTicketStat(
            optionAsset.readBytes(), grade, stat
        )
        val editedSynergies = XP141TraitRollPickerData.forceTicketSynergy(
            synergyAsset.readBytes(), synergy
        )
        rollAsset.writeBytes(editedRolls)
        optionAsset.writeBytes(editedOptions)
        synergyAsset.writeBytes(editedSynergies)
    }
}
