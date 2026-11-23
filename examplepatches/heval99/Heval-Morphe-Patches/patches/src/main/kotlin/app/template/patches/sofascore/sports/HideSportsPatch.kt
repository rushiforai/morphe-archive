package app.template.patches.sofascore.sports

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.sofascore.controls.SOFASCORE_CONTROLS
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.sofascoreControls
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val SPORTS = "Lcom/sofascore/model/Sports;"

// The Room queries of the sport_order table (sportName, sportOrder, isSelected). Room generates
// them into R8-merged lambda classes, so they are found by their SQL.
internal const val SPORT_ORDER_ROWS_QUERY = "SELECT * FROM sport_order ORDER BY sportOrder ASC"
internal const val SPORT_NAMES_QUERY = "SELECT sportName FROM sport_order ORDER BY sportOrder ASC"
internal const val SELECTED_SPORT_QUERY = "SELECT sportName FROM sport_order WHERE isSelected = 1"

// static String(Context): the home sport ("PREF_HOME_SPORT_V2", default "football", cached in a
// static field). The other holder of the key is a Runnable's run()V.
internal object HomeSportFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(string("PREF_HOME_SPORT_V2")),
)

// The selected-sport setter of the main screen's ViewModel (final (String, boolean)V): returns
// unless Sports.getEntries contains the slug, then stores it in the static home-sport cache (the
// String field HomeSportFingerprint's getter reads first; checked at patch time) and loads it.
// MainActivity calls it for a deep link or notification of a sport (26.11.09: d5e.M).
internal object SelectSportFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Z"),
    filters = listOf(
        methodCall(definingClass = SPORTS, name = "getEntries"),
        methodCall(definingClass = "Ljava/util/List;", name = "contains"),
        fieldAccess(opcode = Opcode.SPUT_OBJECT, type = "Ljava/lang/String;"),
    ),
)

/** Sofascore's sports (Sports.getEntries order) with their row titles. */
private val SPORT_TITLES = listOf(
    "football" to "Football", "tennis" to "Tennis", "basketball" to "Basketball", "ice-hockey" to "Ice hockey",
    "volleyball" to "Volleyball", "handball" to "Handball", "esports" to "Esports", "mma" to "MMA",
    "baseball" to "Baseball", "cricket" to "Cricket", "motorsport" to "Motorsport",
    "american-football" to "American football", "rugby" to "Rugby", "badminton" to "Badminton",
    "snooker" to "Snooker", "darts" to "Darts", "futsal" to "Futsal", "minifootball" to "Minifootball",
    "table-tennis" to "Table tennis", "beach-volley" to "Beach volleyball", "waterpolo" to "Water polo",
    "cycling" to "Cycling", "aussie-rules" to "Aussie rules", "floorball" to "Floorball", "bandy" to "Bandy",
)

/**
 * One switch per sport, off by default. The id is `sofascore.hide_sport_<slug>` with `-` as `_`;
 * SofascoreControls.isSportHidden builds the same id from the slug. Restart required: the sport
 * strip and lists come from Room queries whose flows only run again when the table changes.
 */
internal val SPORT_FEATURES: List<Pair<String, HevalFeature>> = SPORT_TITLES.map { (slug, title) ->
    slug to HevalFeature(
        id = "sofascore.hide_sport_" + slug.replace('-', '_'),
        name = "Hide $title",
        description = "Hides $title from the sport list.",
        category = SofascoreControlsCategory.SPORTS,
        default = false,
        restartRequired = true,
    )
}

private fun MutableMethod.stringIndices(value: String) = instructions.indices.filter {
    ((instructions[it] as? ReferenceInstruction)?.reference as? StringReference)?.string == value
}

/**
 * The first return-object after the [query] load at [load], checked to return the ArrayList that
 * the query result is collected into (the first new-instance ArrayList after the load).
 */
private fun MutableMethod.queryListReturn(load: Int, query: String): Int {
    val list = (load until instructions.size).firstOrNull { i ->
        instructions[i].opcode == Opcode.NEW_INSTANCE &&
            ((instructions[i] as ReferenceInstruction).reference as TypeReference).type == "Ljava/util/ArrayList;"
    } ?: throw PatchException("\"$query\" in $definingClass->$name builds no ArrayList")
    val ret = (list until instructions.size).firstOrNull { instructions[it].opcode == Opcode.RETURN_OBJECT }
        ?: throw PatchException("\"$query\" in $definingClass->$name has no return-object")
    if ((instructions[ret] as OneRegisterInstruction).registerA != (instructions[list] as OneRegisterInstruction).registerA) {
        throw PatchException("\"$query\" in $definingClass->$name does not return its ArrayList")
    }
    return ret
}

/**
 * The return-object of every [prepare] call that takes the SQL loaded by [load] (the nearest
 * const-string into that register before the call is [load]); each is checked to return the
 * ArrayList that is built between the call and the return.
 */
private fun MutableMethod.preparedListReturns(load: Int, query: String, prepare: MethodReference): List<Int> {
    val sqlRegister = (getInstruction(load) as OneRegisterInstruction).registerA
    fun lastSqlLoad(before: Int): Int? = (before - 1 downTo 0).firstOrNull { j ->
        val ins = getInstruction(j)
        (ins.opcode == Opcode.CONST_STRING || ins.opcode == Opcode.CONST_STRING_JUMBO) &&
            (ins as OneRegisterInstruction).registerA == sqlRegister
    }
    val calls = (load + 1 until instructions.size).filter { i ->
        val call = getInstruction(i)
        lastSqlLoad(i) == load && call is FiveRegisterInstruction && call.registerCount == 2 &&
            call.registerD == sqlRegister &&
            ((call as ReferenceInstruction).reference as? MethodReference)?.let {
                it.name == prepare.name && it.definingClass == prepare.definingClass
            } == true
    }
    if (calls.isEmpty()) throw PatchException("\"$query\" is never prepared in $definingClass")
    return calls.map { call ->
        val ret = (call until instructions.size).firstOrNull { instructions[it].opcode == Opcode.RETURN_OBJECT }
            ?: throw PatchException("\"$query\" in $definingClass->$name has no return-object")
        val list = (call until ret).firstOrNull { i ->
            instructions[i].opcode == Opcode.NEW_INSTANCE &&
                ((instructions[i] as ReferenceInstruction).reference as TypeReference).type == "Ljava/util/ArrayList;"
        } ?: throw PatchException("\"$query\" in $definingClass->$name builds no ArrayList before its return")
        if ((instructions[ret] as OneRegisterInstruction).registerA != (instructions[list] as OneRegisterInstruction).registerA) {
            throw PatchException("\"$query\" in $definingClass->$name does not return its ArrayList")
        }
        ret
    }
}

/** Before the return-object at [ret]: `vX = SofascoreControls.<helper>(vX)`. */
private fun MutableMethod.filterReturn(ret: Int, helper: String, signature: String, what: String) {
    requireNoBranchTargetAt(ret, what)
    val register = (getInstruction(ret) as OneRegisterInstruction).registerA
    addInstructionsChecked(
        ret,
        """
            invoke-static/range { v$register .. v$register }, $SOFASCORE_CONTROLS->$helper$signature
            move-result-object v$register
        """.trimIndent(),
    )
}

/** Every method of the app holding [value], as mutable methods (fails when there is none). */
private fun BytecodePatchContext.methodsHolding(value: String): List<MutableMethod> {
    val methods = classDefByStrings(value).flatMap { classDef ->
        mutableClassDefBy(classDef).methods.filter { method ->
            method.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
            } == true
        }
    }
    if (methods.isEmpty()) throw PatchException("No method holds \"$value\"")
    return methods
}

// Several Heval Controls features in one patch: they are registered once every hook is in place.
@Suppress("unused")
val hideSportsPatch = bytecodePatch(
    name = "Hide sports",
    description = "Adds switches to hide sports you don't follow.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    dependsOn(sofascoreControls.patch)

    execute {
        // Only sports the app still lists get a switch (Sports.<clinit> builds getEntries from these
        // slugs).
        val known = mutableClassDefBy(SPORTS).methods.single { it.name == "<clinit>" }.instructions
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }.toSet()
        val features = SPORT_FEATURES.filter { (slug, _) -> slug in known }
        if (features.isEmpty()) throw PatchException("$SPORTS lists none of the known sports")

        // Validate every site before the first edit.
        // 1. The rows (List<DbSportOrder>): the Matches sport strip and the reorder dialog.
        val rowsQuery = methodsHolding(SPORT_ORDER_ROWS_QUERY).singleOrNull()
            ?: throw PatchException("Expected one method holding \"$SPORT_ORDER_ROWS_QUERY\"")
        val rowsLoad = rowsQuery.stringIndices(SPORT_ORDER_ROWS_QUERY).single()
        val rowsReturn = rowsQuery.queryListReturn(rowsLoad, SPORT_ORDER_ROWS_QUERY)
        // The database's prepare call, the instruction right after the SQL load.
        val prepare = (rowsQuery.getInstruction(rowsLoad + 1) as? ReferenceInstruction)?.reference as? MethodReference
            ?: throw PatchException("\"$SPORT_ORDER_ROWS_QUERY\" is not prepared right after its load")

        // 2. The names (List<String>): the sport repository's list (feed, favourites, start screen,
        //    notification settings). Up to 26.11.03 two lambda classes held the same query.
        //    Up to 26.11.03 each lambda loaded the SQL right before its ArrayList; in 26.11.09 one
        //    lambda class loads it once at the top and two switch cases prepare it, so the sites are
        //    the prepare calls whose SQL register was last loaded with the names SQL (each is checked
        //    to return the ArrayList built after the call).
        val namesSites = methodsHolding(SPORT_NAMES_QUERY).map { method ->
            method to method.stringIndices(SPORT_NAMES_QUERY).flatMap { load ->
                method.preparedListReturns(load, SPORT_NAMES_QUERY, prepare)
            }
        }

        // 3. The selected sport query. Its sites are the prepare calls taking the register its SQL is
        //    loaded into; the first return-object after each returns the name (or null). Up to
        //    26.10.26 R8 loaded that SQL once at the top of one shared lambda; in 26.11.03 the queries
        //    are split over three lambda classes (rows + selected, names + selected, names) and each
        //    loads its SQL right before its own prepare call, often reusing the same register. So a
        //    prepare call is a site only when the nearest preceding const-string into that register
        //    is the selected-sport SQL. The scan is straight-line, not control-flow aware: the smoke
        //    test pins the exact site counts, keep them strict.
        val selectedSites = methodsHolding(SELECTED_SPORT_QUERY).map { method ->
            val loads = method.stringIndices(SELECTED_SPORT_QUERY)
            val load = loads.singleOrNull()
                ?: throw PatchException("\"$SELECTED_SPORT_QUERY\" is loaded ${loads.size} times in ${method.definingClass}")
            val sqlRegister = (method.getInstruction(load) as OneRegisterInstruction).registerA
            // The nearest const-string into the SQL register before a call tells which query it
            // prepares (26.11.03: every query loads its SQL right before its own prepare call).
            fun lastSqlLoad(before: Int): Int? = (before - 1 downTo 0).firstOrNull { j ->
                val ins = method.getInstruction(j)
                (ins.opcode == Opcode.CONST_STRING || ins.opcode == Opcode.CONST_STRING_JUMBO) &&
                    (ins as OneRegisterInstruction).registerA == sqlRegister
            }
            val returns = (load + 1 until method.instructions.size).filter { i ->
                val call = method.getInstruction(i)
                val reloaded = lastSqlLoad(i) != load
                !reloaded && call is FiveRegisterInstruction && call.registerCount == 2 && call.registerD == sqlRegister &&
                    ((call as ReferenceInstruction).reference as? MethodReference)?.let {
                        it.name == prepare.name && it.definingClass == prepare.definingClass
                    } == true
            }.map { call ->
                (call until method.instructions.size).first { method.getInstruction(it).opcode == Opcode.RETURN_OBJECT }
            }
            if (returns.isEmpty()) throw PatchException("\"$SELECTED_SPORT_QUERY\" is never prepared in ${method.definingClass}")
            method to returns
        }

        // 4. The home sport preference.
        val homeSport = HomeSportFingerprint.method
        val homeReturns = homeSport.instructions.indices.filter { homeSport.getInstruction(it).opcode == Opcode.RETURN_OBJECT }

        // 5. The selected-sport setter (2026-11-22): a deep link or notification of a hidden sport
        //    selected it. It must store into the home-sport cache, the one static String the home
        //    sport getter reads.
        fun Instruction.stringField() = ((this as? ReferenceInstruction)?.reference as? FieldReference)
            ?.takeIf { it.type == "Ljava/lang/String;" }?.let { "${it.definingClass}->${it.name}" }
        val homeCache = homeSport.instructions.filter { it.opcode == Opcode.SGET_OBJECT }.mapNotNull { it.stringField() }
            .distinct().singleOrNull()
            ?: throw PatchException("${homeSport.definingClass}->${homeSport.name} does not read one static String cache")
        val selectSport = SelectSportFingerprint.method
        if (selectSport.instructions.none { it.opcode == Opcode.SPUT_OBJECT && it.stringField() == homeCache }) {
            throw PatchException("${selectSport.definingClass}->${selectSport.name} does not store the home sport cache $homeCache")
        }
        // Instance (String, boolean): p0, p1, p2 are the last three registers, so p1 is the second last.
        val selectSlug = (selectSport.implementation?.registerCount ?: 0) - 2
        if (selectSlug < 0) throw PatchException("${selectSport.definingClass}->${selectSport.name} has no code")
        selectSport.requireNoBranchTargetAt(0, "selected sport hook")

        // Edits. Several sites can sit in one method (two queries share a lambda class in 26.11.03),
        // so every insert of a method is made from its last index to its first, which keeps the
        // earlier indices valid.
        data class Edit(val method: MutableMethod, val index: Int, val helper: String, val signature: String)
        val edits = listOf(Edit(rowsQuery, rowsReturn, "filterSportOrders", "(Ljava/util/List;)Ljava/util/List;")) +
            namesSites.flatMap { (method, returns) ->
                returns.map { Edit(method, it, "filterSportNames", "(Ljava/util/List;)Ljava/util/List;") }
            } +
            selectedSites.flatMap { (method, returns) ->
                returns.map { Edit(method, it, "visibleSport", "(Ljava/lang/String;)Ljava/lang/String;") }
            }
        edits.groupBy { it.method }.forEach { (method, list) ->
            if (list.map { it.index }.toSet().size != list.size) throw PatchException("Two sport hooks share a return in ${method.definingClass}")
            list.sortedByDescending { it.index }.forEach { method.filterReturn(it.index, it.helper, it.signature, "sport hook ${it.helper}") }
        }
        // Each return of the home sport getter (two of them are branch targets) becomes
        // `vX = visibleSport(vX); return vX`. Replacing the return keeps its labels on the call.
        homeReturns.sortedDescending().forEach { ret ->
            val register = (homeSport.getInstruction(ret) as OneRegisterInstruction).registerA
            homeSport.replaceInstruction(
                ret,
                "invoke-static/range { v$register .. v$register }, $SOFASCORE_CONTROLS->visibleSport(Ljava/lang/String;)Ljava/lang/String;",
            )
            homeSport.addInstructionsChecked(ret + 1, "move-result-object v$register\nreturn-object v$register")
        }
        // The setter's slug: p1 = visibleSport(p1) first, so a hidden sport becomes the first
        // visible one before the Sports.getEntries check (getClass right after keeps the null check).
        selectSport.addInstructionsChecked(
            0,
            """
                invoke-static/range { v$selectSlug .. v$selectSlug }, $SOFASCORE_CONTROLS->visibleSport(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$selectSlug
            """.trimIndent(),
        )

        features.forEach { (_, feature) -> sofascoreControls.register(feature) }
    }
}
