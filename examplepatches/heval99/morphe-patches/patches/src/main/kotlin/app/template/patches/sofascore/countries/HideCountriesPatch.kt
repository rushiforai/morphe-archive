package app.template.patches.sofascore.countries

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.hevalcontrols.HevalListFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.sofascoreControls
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

internal val HIDDEN_COUNTRIES = HevalListFeature(
    id = "sofascore.hidden_countries",
    name = "Hidden countries",
    description = "Leagues and matches from the countries you pick are hidden, favourites too.",
    category = SofascoreControlsCategory.LEAGUES,
    restartRequired = true,
)

/** The registers an invoke passes, in order. */
private fun Instruction.invokeRegisters(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

/**
 * The string constant in [register] right before instruction [before] of this straight-line
 * method, following `move-object`s; null when the register holds anything else.
 */
private fun List<Instruction>.stringIn(register: Int, before: Int): String? {
    var wanted = register
    for (i in before - 1 downTo 0) {
        val instruction = this[i]
        if (!instruction.opcode.setsRegister()) continue
        val target = (instruction as? OneRegisterInstruction)?.registerA ?: continue
        if (instruction.opcode.setsWideRegister()) {
            if (wanted == target || wanted == target + 1) return null
            continue
        }
        if (target != wanted) continue
        when (instruction.opcode) {
            Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO ->
                return ((instruction as ReferenceInstruction).reference as StringReference).string
            Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 ->
                wanted = (instruction as TwoRegisterInstruction).registerB
            else -> return null
        }
    }
    return null
}

/**
 * The app's country list, code to name, read from the Country constructor calls of [this]
 * <clinit>. Every Country constructor the list uses takes (mcc or mcc list, iso2Alpha, iso3Alpha,
 * ioc, name, ...); a code or name that is not a string constant is skipped.
 */
internal fun Method.countrySeeds(): Map<String, String> {
    val instructions = implementation?.instructions?.toList() ?: return emptyMap()
    val seeds = LinkedHashMap<String, String>()
    instructions.forEachIndexed { index, instruction ->
        val reference = instruction.methodReference() ?: return@forEachIndexed
        if (reference.definingClass != COUNTRY || reference.name != "<init>") return@forEachIndexed
        val parameters = reference.parameterTypes.map(CharSequence::toString)
        if (parameters.size < 5 || parameters[0] !in setOf("I", "Ljava/util/List;") ||
            parameters.subList(1, 5).any { it != "Ljava/lang/String;" }
        ) return@forEachIndexed
        val registers = instruction.invokeRegisters()
        if (registers.size < 6) return@forEachIndexed
        val code = instructions.stringIn(registers[2], index) ?: return@forEachIndexed
        val name = instructions.stringIn(registers[5], index) ?: return@forEachIndexed
        if (code.isEmpty() || code.length > 100 || name.isBlank() || code.any { it == '\t' || it == '\n' } ||
            name.any { it == '\t' || it == '\n' }
        ) return@forEachIndexed
        seeds.putIfAbsent(code, name.trim())
    }
    return seeds
}

/** Rewrites the String getter [this] (CountryFilter.seeds) to return [value]. */
private fun MutableMethod.returnString(value: String) {
    val implementation = implementation ?: throw PatchException("$definingClass->$name has no code")
    if (returnType != "Ljava/lang/String;" || implementation.registerCount < 1) {
        throw PatchException("$definingClass->$name is not a String getter with a register")
    }
    implementation.addInstruction(0, BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, 0, ImmutableStringReference(value)))
    implementation.addInstruction(1, BuilderInstruction11x(Opcode.RETURN_OBJECT, 0))
}

// A Patch settings list (2026-11-03, owner request), opt-in in Manager. The keys are the categories'
// alpha2 codes (Sofascore's own: EN England, SX Scotland, WA Wales, NX Northern Ireland, XK Kosovo,
// ...); categories without one (World, Europe, International, tours) are "slug:<slug>". CountryFilter
// in extensions/sofascore does the filtering; the hook sites are in sofascoreListFiltersPatch
// (ListFilterHooks.kt), shared with "Hide competitions" since 2026-11-03: the leagues list (never
// emptied), the date feed's country rows, search (events, competitions, teams and players), the
// Live tab, the chronological view and an expanded country's events. This patch turns the country
// part on (CountryFilter.patched() -> true) and bakes the picker seeds.
// Not filtered: LiveCategoriesResponse.getLiveCategories (a category id -> live count map with no
// country; the rows it counts are filtered by the date feed's rows), pinned/favourite leagues fetched
// by their own tournament requests, team/player/tournament pages, the widget and notifications.
// Favourites are not exempt in the filtered lists. The picker is seeded with the app's own country
// list (read at patch time) by CountryFilter.init at the end of ReleaseApp.onCreate; every filtered
// category is reported as seen, also while nothing is picked, under the seed's name when its key is
// a seeded country (the "X Amateur" categories share the country's alpha2 and used to rename it in
// the picker). Search players carry their team without a country, so they are matched by team id
// against the teams seen in the same results and in the Live/chronological events (2026-11-03).
@Suppress("unused")
val hideCountriesPatch = sofascoreControls.featurePatch(
    HIDDEN_COUNTRIES,
    name = "Hide countries",
    description = "Hides the countries you pick in Patch settings from match lists, leagues and search.",
    default = false,
    dependencies = setOf(sofascoreListFiltersPatch),
) {
    val filter = mutableClassDefBy(COUNTRY_FILTER)

    // Validate before the first edit.
    val seeds = CountryListFingerprint.method.countrySeeds()
    if (seeds.size < 100 || listOf("EN", "SX", "WA", "NX").any { it !in seeds }) {
        throw PatchException("Hide countries: the app's country list gave ${seeds.size} countries")
    }
    val seedsGetter = filter.methods.single { it.name == "seeds" && it.parameterTypes.isEmpty() }
    val patched = filter.methods.single { it.name == "patched" && it.parameterTypes.isEmpty() && it.returnType == "Z" }

    // Picker seeds: the app's country list into CountryFilter.seeds(), registered at startup by
    // CountryFilter.init (sofascoreListFiltersPatch).
    seedsGetter.returnString(seeds.entries.joinToString("\n") { (code, name) -> "$code\t$name" })
    // The shared hooks run the country list.
    patched.returnEarly(true)
}
