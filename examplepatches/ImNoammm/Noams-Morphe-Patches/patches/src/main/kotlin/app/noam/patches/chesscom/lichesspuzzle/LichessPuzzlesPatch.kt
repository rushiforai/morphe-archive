package app.noam.patches.chesscom.lichesspuzzle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.arguments
import app.noam.patches.chesscom.shared.fieldForLabel
import app.noam.patches.chesscom.shared.filterStores
import app.noam.patches.chesscom.shared.getterForLabel
import app.noam.patches.chesscom.shared.markFeaturePatched
import app.noam.patches.chesscom.shared.returnString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val PUZZLES = "${Constants.EXTENSION_PACKAGE}/lichesspuzzle/LichessPuzzles;"
private const val PUZZLES_TAB = "Lcom/chess/features/puzzles/home/ui/HomePuzzlePathRootContentKt;"
private const val BUTTON_SIZE = "Lcom/chess/palette/core/style/ButtonSize;"
private const val MENU_LISTENER = "Lcom/chess/palette/components/menu/a;"
private const val BIG_BUTTON_CLICK =
    "Lcom/chess/palette/components/menu/PathRootMenuKt\$PathRootMenu\$4\$6\$4\$primaryCtaButton\$1\$1\$1;"
private const val MODE = "Lcom/chess/navigationinterface/PathPuzzlesMode;"
private const val ACTIVITY = "Landroidx/fragment/app/FragmentActivity;"
private const val DIRECTIONS = "Lcom/chess/navigationinterface/NavigationDirections;"
private const val REPOSITORY = "Lcom/chess/internal/puzzles/p;"
private const val SOURCE = "Lcom/chess/features/puzzles/db/model/ProblemSource;"
private const val SOLUTION = "Lcom/chess/features/puzzles/db/model/l;"
private const val TACTICS_PROBLEM = "Lcom/chess/net/model/TacticsProblem;"
private const val PATH_RESULT = "Lchesscom/puzzles/v1/PuzzlePathResult;"
private const val RATING = "Lchesscom/puzzles/v1/Rating;"
private const val ROOM_DATABASE = "Landroidx/room/RoomDatabase;"
private const val DELETE_QUERY = "DELETE FROM tactics_problem WHERE source = ?"
/** Lambdas that kept their names where R8 inlined chess.com's guest flow and next-puzzle call. */
private const val GUEST_FLOW =
    "Lcom/chess/internal/puzzles/RatedPuzzleRepositoryImpl\$nextGuestProblem\$\$inlined\$flatMapLatest\$1;"
private const val NEXT_RATED_PUZZLE = "Lcom/chess/internal/puzzles/PuzzleServiceImpl\$getNextRatedPuzzle\$2;"
private const val SETTINGS_LOADED = "Lcom/chess/features/puzzles/rated/r\$m0;"
private const val PUZZLE_SETTINGS = "Lcom/chess/features/puzzles/rated/api/PuzzleSettings;"
private const val PATH_STATS = "Lcom/chess/features/path/ui/v2;"
private const val RATING_STATS = "Lcom/chess/features/puzzles/db/model/n;"
private const val STATS_LOADED = "Lcom/chess/features/puzzles/rated/r\$r0;"
private const val PATH_REPOSITORY = "Lcom/chess/features/path/data/d;"
private const val HOME_PUZZLES_REFRESH =
    "Lcom/chess/features/puzzles/home/menu/HomePuzzlesMenuViewModel\$refreshData\$2;"
private const val HOME_PUZZLES_RESUME =
    "Lcom/chess/features/puzzles/home/menu/HomePuzzlesMenuViewModel\$refreshDailyPuzzleFab\$2;"
private const val HUB_STATE = "Lcom/chess/features/puzzles/home/ui/j0;"
private const val HUB_PATH = "Lcom/chess/features/puzzles/home/ui/m0;"
private const val HUB_USER = "Lcom/chess/features/puzzles/home/ui/n0;"
private const val UNIT = "sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;\nreturn-object v0"
private const val NOTHING = "const/4 v0, 0x0\nreturn-object v0"

private val lichessPuzzlesResourcePatch = resourcePatch(
    description = "Adds the Puzzles tab button's text.",
) {
    execute {
        document("res/values/strings.xml").use { document ->
            document.documentElement.appendChild(
                document.createElement("string").apply {
                    setAttribute("name", "morphe_lichess_puzzles")
                    textContent = "Puzzles from Lichess"
                },
            )
        }
    }
}

private val Instruction.methodReference get() = (this as? ReferenceInstruction)?.reference as? MethodReference
private val Instruction.fieldReference get() = (this as? ReferenceInstruction)?.reference as? FieldReference
private val Instruction.typeReference get() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type
private val Instruction.stringReference get() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

/** "Lcom/x/Y;" as Class.forName wants it. */
private fun String.javaName() = substring(1, length - 1).replace('/', '.')

private fun MethodReference.parameters() = parameterTypes.map(CharSequence::toString)

/** The literal a const put in [register] last before [index], if a const set it. */
private fun List<Instruction>.literalBefore(index: Int, register: Int): Int? =
    (index - 1 downTo 0).firstOrNull { this[it].opcode.setsRegister() && (this[it] as OneRegisterInstruction).registerA == register }
        ?.let { (this[it] as? NarrowLiteralInstruction)?.narrowLiteral }

@Suppress("unused")
val lichessPuzzlesPatch = bytecodePatch(
    name = "Lichess Puzzles",
    description = "Puzzles from Lichess becomes the Puzzles tab's big button, with chess.com's Solve " +
        "Puzzles above it. Lichess's puzzles play in chess.com's own puzzle screen (board, coach, sounds), " +
        "rated on the phone the way Lichess rates them; nothing is sent to chess.com.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch, lichessPuzzlesResourcePatch)

    execute {
        markFeaturePatched("lichessPuzzlesPatched")
        val names = mutableClassDefBy(PUZZLES).methods
        fun name(stub: String, value: String) = names.first { it.name == stub }.returnString(value)

        // An enum constant's field, from the name its static initialiser gives it.
        fun enumField(type: String, constant: String): String {
            val instructions = mutableClassDefBy(type).methods.single { it.name == "<clinit>" }.implementation!!.instructions.toList()
            val at = instructions.indexOfFirst { it.stringReference == constant }
            return instructions.drop(at).firstNotNullOfOrNull { instruction ->
                instruction.fieldReference?.takeIf { instruction.opcode == Opcode.SPUT_OBJECT && it.type == type }?.name
            } ?: throw PatchException("$type.$constant was not found")
        }

        // Methods to change, found while walking every class and changed after the walk.
        fun methodsWhere(predicate: (ClassDef, Method) -> Boolean): List<MutableMethod> {
            val found = mutableListOf<Pair<String, Method>>()
            classDefForEach { classDef -> classDef.methods.filter { predicate(classDef, it) }.forEach { found += classDef.type to it } }
            return found.map { (type, method) ->
                mutableClassDefBy(type).methods.first {
                    it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
                }
            }
        }

        // The big button calls the menu listener's method that chess.com's own click lambda calls.
        val click = mutableClassDefBy(BIG_BUTTON_CLICK).methods.single { it.name == "invoke" }
            .implementation!!.instructions.firstNotNullOfOrNull { instruction ->
                instruction.methodReference?.takeIf { instruction.opcode == Opcode.INVOKE_INTERFACE && it.definingClass == MENU_LISTENER }
            }?.name ?: throw PatchException("The big button's click was not found")
        name("solveMethod", click)

        // The Puzzles tab's listener: the menu listener whose click opens chess.com's puzzle screen
        // in a mode. It is remembered when made, and its big-button click opens that screen in guest
        // mode, as Solve Puzzles does for a guest (or settings, with no puzzles downloaded yet).
        fun MethodReference.navigates() = parameters() == listOf(ACTIVITY, DIRECTIONS)
        fun MethodReference.makesScreen() = name == "<init>" && parameters() == listOf(MODE)
        val listeners = methodsWhere { classDef, method ->
            MENU_LISTENER in classDef.interfaces && method.name == click && method.parameterTypes.isEmpty() && method.returnType == "V" &&
                method.implementation?.instructions?.let { code ->
                    code.any { it.methodReference?.navigates() == true } && code.any { it.methodReference?.makesScreen() == true }
                } == true
        }
        val solvePuzzles = listeners.singleOrNull() ?: throw PatchException("Puzzles tab listeners: ${listeners.size}")
        val listener = mutableClassDefBy(solvePuzzles.definingClass)
        val solveCode = solvePuzzles.implementation!!.instructions.toList()
        val navigate = solveCode.firstNotNullOfOrNull { instruction ->
            instruction.methodReference?.takeIf { instruction.opcode == Opcode.INVOKE_INTERFACE && it.navigates() }
        } ?: throw PatchException("Solve Puzzles' navigation was not found")
        val directions = solveCode.firstNotNullOfOrNull { instruction ->
            instruction.methodReference?.takeIf { instruction.opcode == Opcode.INVOKE_DIRECT && it.makesScreen() }?.definingClass
        } ?: throw PatchException("Solve Puzzles' screen was not found")
        // The router and the activity: fields of the listener, or of the one object it keeps them in.
        fun load(register: String, from: String, type: String): String {
            listener.fields.singleOrNull { it.type == type }?.let { return "iget-object $register, $from, ${listener.type}->${it.name}:$type" }
            val hops = listener.fields.mapNotNull { holder ->
                classDefByOrNull(holder.type)?.fields?.singleOrNull { it.type == type }?.let { holder to it }
            }
            val (holder, field) = hops.singleOrNull() ?: throw PatchException("The listener holds no single $type")
            return "iget-object $register, $from, ${listener.type}->${holder.name}:${holder.type}\n" +
                "iget-object $register, $register, ${holder.type}->${field.name}:$type"
        }
        val guestMode = enumField(MODE, "GUEST")
        solvePuzzles.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $PUZZLES->onBigButton()I
                move-result v0
                if-eqz v0, :morphe_solve_puzzles
                const/4 v1, 0x1
                if-eq v0, v1, :morphe_lichess_puzzles
                return-void
                :morphe_lichess_puzzles
                move-object/from16 v3, p0
                ${load("v0", "v3", navigate.definingClass)}
                ${load("v1", "v3", ACTIVITY)}
                if-eqz v1, :morphe_no_activity
                new-instance v2, $directions
                sget-object v3, $MODE->$guestMode:$MODE
                invoke-direct { v2, v3 }, $directions-><init>($MODE)V
                invoke-interface { v0, v1, v2 }, $navigate
                :morphe_no_activity
                return-void
            """,
            ExternalLabel("morphe_solve_puzzles", solvePuzzles.getInstruction(0)),
        )
        listener.methods.filter { it.name == "<init>" }.forEach { constructor ->
            constructor.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.sortedDescending()
                .forEach { index ->
                    constructor.addInstructions(index, "invoke-static/range { p0 .. p0 }, $PUZZLES->onListener(Ljava/lang/Object;)V")
                }
        }

        // The repository: guest puzzles are Lichess's, and their results are scored here. Chess.com's
        // guest refill shows how puzzles are converted and stored.
        val repository = mutableClassDefBy(REPOSITORY)
        val guestSource = enumField(SOURCE, "RATED_GUEST")
        fun Method.readsGuestSource() = implementation?.instructions?.any { instruction ->
            instruction.opcode == Opcode.SGET_OBJECT && instruction.fieldReference?.let { it.definingClass == SOURCE && it.name == guestSource } == true
        } == true
        val refill = repository.methods.singleOrNull { method ->
            method.parameterTypes.size == 1 && method.returnType == "Ljava/lang/Object;" && method.readsGuestSource()
        } ?: throw PatchException("The guest refill was not found")
        val refillCode = refill.implementation!!.instructions.toList()
        val converter = refillCode.firstNotNullOfOrNull { instruction ->
            instruction.methodReference?.takeIf {
                instruction.opcode == Opcode.INVOKE_STATIC && it.parameters() == listOf(TACTICS_PROBLEM, SOURCE, "J")
            }
        } ?: throw PatchException("The problem converter was not found")
        val daoInsert = refillCode.firstNotNullOfOrNull { instruction ->
            instruction.methodReference?.takeIf { reference ->
                (instruction.opcode == Opcode.INVOKE_INTERFACE || instruction.opcode == Opcode.INVOKE_VIRTUAL) &&
                    reference.returnType == "V" && reference.parameters() == listOf("Ljava/util/List;") &&
                    repository.fields.any { it.type == reference.definingClass }
            }
        } ?: throw PatchException("The problem insert was not found")
        name("converterClass", converter.definingClass.javaName())
        name("converterMethod", converter.name)
        name("daoField", repository.fields.single { it.type == daoInsert.definingClass }.name)
        name("daoInsert", daoInsert.name)

        // Chess.com's own guest puzzles (a signed-out user has them) share the guest queue with ours
        // and come first, oldest first: a session clears the queue with the puzzle database's own
        // "delete every puzzle of a source" before it stores its first Lichess puzzles. That query
        // only exists as a suspend function, so the database gets a blocking twin: the same query
        // object, run by Room's blocking runner like the database's other blocking queries. The
        // suspend one is told from its reading twin by Room's read-only flag: false.
        fun Method.runsDelete(): Boolean {
            if (parameterTypes.size != 2 || parameterTypes[0].toString() != SOURCE) return false
            val code = implementation?.instructions?.toList() ?: return false
            val runner = code.indexOfFirst { it.opcode == Opcode.INVOKE_STATIC && it.methodReference?.parameterTypes?.firstOrNull() == ROOM_DATABASE }
            // The read-only flag is the runner's first boolean (R8 moved the flags behind the block).
            val readOnly = code.getOrNull(runner)?.methodReference?.parameterTypes?.indexOfFirst { it.toString() == "Z" } ?: -1
            if (readOnly < 0 || code.literalBefore(runner, code[runner].arguments()[readOnly]) != 0) return false
            val query = code.firstNotNullOfOrNull { it.typeReference?.takeIf { _ -> it.opcode == Opcode.NEW_INSTANCE } } ?: return false
            return classDefByOrNull(query)?.methods?.any { method -> method.implementation?.instructions?.any { it.stringReference == DELETE_QUERY } == true } == true
        }
        val suspendDelete = methodsWhere { _, method -> method.runsDelete() }.singleOrNull()
            ?: throw PatchException("The puzzle database's delete was not found")
        val dao = mutableClassDefBy(suspendDelete.definingClass)
        val deleteCode = suspendDelete.implementation!!.instructions.toList()
        val made = deleteCode.indexOfFirst {
            it.opcode == Opcode.INVOKE_DIRECT && it.methodReference?.let { ref -> ref.name == "<init>" && ref.parameterTypes.firstOrNull() == SOURCE } == true
        }
        if (made < 0) throw PatchException("The delete query is not made from the source")
        val query = deleteCode[made].methodReference!!
        // A lambda R8 merged others into also takes the case that runs this query.
        val case = when (query.parameters().drop(1)) {
            emptyList<String>() -> ""
            listOf("I") -> "const v1, ${deleteCode.literalBefore(made, deleteCode[made].arguments()[2]) ?: throw PatchException("The delete query's case was not found")}"
            else -> throw PatchException("Unexpected delete query: $query")
        }
        val blockingRunner = dao.methods.flatMap { it.implementation?.instructions?.toList() ?: emptyList() }.mapNotNull { instruction ->
            instruction.methodReference?.takeIf {
                instruction.opcode == Opcode.INVOKE_STATIC && it.parameters() == listOf(ROOM_DATABASE, "Z", "Z", "Lkotlin/jvm/functions/Function1;")
            }
        }.distinctBy { it.toString() }.singleOrNull() ?: throw PatchException("Room's blocking runner was not found")
        val database = dao.fields.singleOrNull { it.type == ROOM_DATABASE } ?: throw PatchException("The puzzle database has no Room database")
        val blockingDelete = "morpheDeleteSource"
        dao.methods.add(
            ImmutableMethod(
                dao.type, blockingDelete, listOf(ImmutableMethodParameter(SOURCE, null, null)), "V",
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, MutableMethodImplementation(6),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        new-instance v0, ${query.definingClass}
                        $case
                        invoke-direct { v0, p1${if (case.isEmpty()) "" else ", v1"} }, $query
                        iget-object v1, p0, ${dao.type}->${database.name}:$ROOM_DATABASE
                        const/4 v2, 0x0
                        const/4 v3, 0x1
                        invoke-static { v1, v2, v3, v0 }, $blockingRunner
                        return-void
                    """,
                )
            },
        )
        // The repository's field holding that database: a type the class or one it extends implements.
        val databaseTypes = generateSequence(dao.type) { type -> classDefByOrNull(type)?.superclass }
            .flatMap { type -> sequenceOf(type) + (classDefByOrNull(type)?.interfaces?.asSequence() ?: emptySequence()) }
            .toSet()
        name("puzzleDbField", repository.fields.singleOrNull { it.type in databaseTypes }?.name
            ?: throw PatchException("The repository's puzzle database was not found"))
        name("puzzleDbClear", blockingDelete)

        // The puzzle screen's guest puzzles: the screen builds chess.com's guest flow around the
        // repository (its nextGuestProblem, inlined); Lichess puzzles get stored first.
        val guestFlows = methodsWhere { classDef, method ->
            classDef.type != GUEST_FLOW && method.implementation?.instructions?.any { instruction ->
                instruction.opcode == Opcode.INVOKE_DIRECT && instruction.methodReference?.let {
                    it.definingClass == GUEST_FLOW && it.name == "<init>" && it.parameterTypes.lastOrNull() == REPOSITORY
                } == true
            } == true
        }
        if (guestFlows.isEmpty()) throw PatchException("The puzzle screen's guest puzzles were not found")
        guestFlows.forEach { method ->
            val code = method.implementation!!.instructions.toList()
            code.indices.filter { index ->
                code[index].opcode == Opcode.INVOKE_DIRECT && code[index].methodReference?.let { it.definingClass == GUEST_FLOW && it.name == "<init>" } == true
            }.sortedDescending().forEach { index ->
                val owner = code[index].arguments().last()
                // Before the flow object is allocated, so no unmade object is live across the call.
                val made = index - 1
                if (code[made].opcode != Opcode.NEW_INSTANCE || code[made].typeReference != GUEST_FLOW) {
                    throw PatchException("The guest flow is not made right before its constructor")
                }
                method.addInstructions(made, "invoke-static/range { v$owner .. v$owner }, $PUZZLES->onGuestPuzzles(Ljava/lang/Object;)V")
            }
        }

        // A Lichess session supplies puzzles, solutions and rating locally; skip server calls.
        fun MutableMethod.skipIf(condition: String, result: String = UNIT) = addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $PUZZLES->$condition()Z
                move-result v0
                if-eqz v0, :morphe_continue
                $result
            """,
            ExternalLabel("morphe_continue", getInstruction(0)),
        )
        // The next rated puzzle from chess.com's puzzle service (the call that makes this lambda).
        val nextRatedPuzzle = methodsWhere { classDef, method ->
            classDef.type != NEXT_RATED_PUZZLE &&
                method.implementation?.instructions?.any { it.opcode == Opcode.NEW_INSTANCE && it.typeReference == NEXT_RATED_PUZZLE } == true
        }.singleOrNull() ?: throw PatchException("The next rated puzzle call was not found")
        fun MutableMethod.fetchesPuzzle() = implementation?.instructions?.any { instruction ->
            instruction.methodReference?.let { it.definingClass == nextRatedPuzzle.definingClass && it.name == nextRatedPuzzle.name } == true
        } == true
        // Prefetch and update; the prefetch returns its error, the update Unit.
        val fetches = repository.methods.filter {
            it.returnType in listOf("Ljava/lang/Object;", "Ljava/io/Serializable;") && it.fetchesPuzzle()
        }
        if (fetches.isEmpty()) throw PatchException("The repository's puzzle fetches were not found")
        fetches.forEach { method ->
            method.skipIf("session", if (method.parameterTypes.firstOrNull()?.toString() == "J") NOTHING else UNIT)
        }
        // Don't mix chess.com's guest puzzles into the Lichess database.
        refill.skipIf("session")
        // The Lichess screen must not refresh the hub's path; the hub does that on resume.
        mutableClassDefBy(PATH_REPOSITORY).methods.filter {
            it.parameterTypes.size == 1 && it.returnType == "Ljava/lang/Object;"
        }.ifEmpty { throw PatchException("The path refreshes were not found") }.forEach { it.skipIf("onPuzzleScreen") }

        // The hub refreshes only its daily puzzle on resume: its path refresh (the one it starts when
        // made) is launched beside it, the same way.
        val refreshes = listOf(HOME_PUZZLES_REFRESH, HOME_PUZZLES_RESUME).map { type ->
            classDefBy(type).methods.single { it.name == "<init>" }.parameterTypes.joinToString("")
        }
        if (refreshes.distinct().size != 1) throw PatchException("The hub's refreshes are made differently")
        val onResume = methodsWhere { classDef, method ->
            classDef.type != HOME_PUZZLES_RESUME &&
                method.implementation?.instructions?.any { it.opcode == Opcode.NEW_INSTANCE && it.typeReference == HOME_PUZZLES_RESUME } == true
        }.singleOrNull() ?: throw PatchException("The Puzzles hub's resume was not found")
        onResume.apply {
            val code = implementation!!.instructions.toList()
            val start = code.indexOfFirst {
                it.opcode == Opcode.INVOKE_DIRECT && it.methodReference?.let { ref -> ref.definingClass == HOME_PUZZLES_RESUME && ref.name == "<init>" } == true
            }
            val coroutine = code[start].arguments()
            val launch = (start + 1 until code.size).firstOrNull {
                code[it].opcode == Opcode.INVOKE_STATIC && coroutine[0] in code[it].arguments()
            } ?: throw PatchException("The daily puzzle refresh is never launched")
            val launched = code[launch].arguments()
            if ((coroutine + launched).any { it > 15 }) throw PatchException("Unexpected hub refresh registers")
            addInstructions(
                launch + 1,
                """
                    new-instance v${coroutine[0]}, $HOME_PUZZLES_REFRESH
                    invoke-direct { ${coroutine.joinToString { "v$it" }} }, $HOME_PUZZLES_REFRESH-><init>(${refreshes[0]})V
                    invoke-static { ${launched.joinToString { "v$it" }} }, ${code[launch].methodReference}
                """,
            )
        }

        // Keep the hub's map and XP on the pre-session values while Lichess closes.
        val hubStateConstructor = mutableClassDefBy(HUB_STATE).methods.singleOrNull { method ->
            method.name == "<init>" && method.parameterTypes.map(CharSequence::toString).let { types ->
                types.indexOf(HUB_PATH).let { path -> path > 0 && types[path - 1] == HUB_USER }
            }
        } ?: throw PatchException("The Puzzles hub state constructor was not found")
        val path = hubStateConstructor.parameterTypes.map(CharSequence::toString).indexOf(HUB_PATH) + 1
        hubStateConstructor.addInstructions(
            1,
            """
                invoke-static/range { p${path - 1} .. p${path - 1} }, $PUZZLES->userForHub(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p${path - 1}
                check-cast p${path - 1}, $HUB_USER
                invoke-static/range { p$path .. p$path }, $PUZZLES->pathForHub(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p$path
                check-cast p$path, $HUB_PATH
            """,
        )
        // The hub's empty user data while it loads (an object), which must not replace the real one.
        val emptyUser = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.superclass == HUB_USER && classDef.staticFields.any { it.type == classDef.type }) emptyUser += classDef.type
        }
        name("emptyUserClass", (emptyUser.singleOrNull() ?: throw PatchException("The hub's empty user was not found")).javaName())

        val score: MutableMethod = repository.methods.singleOrNull { method ->
            method.parameterTypes.size == 4 && method.parameterTypes[0].toString() == "Ljava/util/List;" &&
                method.parameterTypes[1].toString() == SOLUTION && method.parameterTypes[2].toString() == "Z"
        } ?: throw PatchException("The solution scoring was not found")
        val scoreCode = score.implementation!!.instructions.toList()
        fun constructed(parameters: List<String>, size: Int) = scoreCode.firstNotNullOfOrNull { instruction ->
            instruction.methodReference?.takeIf {
                it.name == "<init>" && it.parameterTypes.size == size && it.parameters().take(parameters.size) == parameters
            }?.definingClass
        } ?: throw PatchException("Nothing in the scoring is made from $parameters")
        name("resultClass", constructed(listOf(SOLUTION, "Ljava/lang/Object;"), 2).javaName())
        // The score takes the path result in chess.com's Legacy wrapper (its other kind is the Worlds
        // path's), which the scoring's own fallback makes from an empty path result.
        val legacyPathResult = constructed(listOf(PATH_RESULT), 1)
        name("legacyPathResultClass", legacyPathResult.javaName())
        // (path result, rating, the error R8 narrowed to the type it is given)
        name("scoreClass", constructed(listOf(classDefBy(legacyPathResult).interfaces.single(), RATING), 3).javaName())
        val logged = scoreCode.indexOfFirst { it.stringReference == "Scoring puzzle " }
        // "Scoring puzzle " + solution's problem id + " exceeded ...": the id is read just before.
        val problemId = scoreCode.take(logged.coerceAtLeast(0)).lastOrNull { instruction ->
            instruction.opcode == Opcode.IGET_WIDE && instruction.fieldReference?.let { it.definingClass == SOLUTION && it.type == "J" } == true
        }?.fieldReference?.takeIf { logged >= 0 } ?: throw PatchException("The solution's problem id was not found")
        name("problemIdField", problemId.name)
        score.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v0, p0
                move-object/from16 v1, p2
                invoke-static { v0, v1 }, $PUZZLES->solved(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                if-eqz v0, :morphe_score
                return-object v0
            """,
            ExternalLabel("morphe_score", score.getInstruction(0)),
        )

        // During a Lichess session chess.com's puzzle screen plays it as rated and online: the
        // guest mode stays the data source, but "local mode" is off (solutions get scored, rating
        // stats load), the layout is Classic, and the rating it shows is the Lichess one. The
        // server calls that come with it are skipped above.
        fun MutableMethod.whileSession(value: String) = addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $PUZZLES->session()Z
                move-result v0
                if-eqz v0, :morphe_no_session
                $value
            """,
            ExternalLabel("morphe_no_session", getInstruction(0)),
        )
        // Once a guest has started guest mode, an empty guest queue ends chess.com's guest flow with
        // its sign-up wall. During a session it counts as never started, so the screen waits for the
        // Lichess puzzles stored in the background. The guest refill, its other reader, is skipped.
        var guestModeReads = 0
        mutableClassDefBy(GUEST_FLOW).methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            code.indices.filter { code[it].stringReference == "is_guest_mode_started" }.sortedDescending().forEach { at ->
                val key = (code[at] as OneRegisterInstruction).registerA
                val read = (at + 1 until code.size).firstOrNull { key in code[it].arguments() }
                    ?.takeIf { code.getOrNull(it + 1)?.opcode == Opcode.MOVE_RESULT && code[it].methodReference?.returnType == "Z" }
                    ?: throw PatchException("The guest mode flag is not read")
                val started = (code[read + 1] as OneRegisterInstruction).registerA
                method.addInstructions(
                    read + 2,
                    """
                        invoke-static/range { v$started .. v$started }, $PUZZLES->guestModeStarted(Z)Z
                        move-result v$started
                    """,
                )
                guestModeReads++
            }
        }
        if (guestModeReads != 1) throw PatchException("Guest mode flag reads: $guestModeReads")
        mutableClassDefBy(MODE).methods.single { it.parameterTypes.isEmpty() && it.returnType == "Z" }
            .whileSession("const/4 v0, 0x0\nreturn v0")
        // R8 left most of these data classes no getters: their values change where they are stored.
        mutableClassDefBy(SETTINGS_LOADED).apply {
            filterStores(fieldForLabel(", mode=", MODE), "$PUZZLES->sessionMode(Ljava/lang/Object;)Ljava/lang/Object;")
        }
        mutableClassDefBy(PUZZLE_SETTINGS).getterForLabel("PuzzleSettings(collectPoints=", "Z").whileSession("const/4 v0, 0x0\nreturn v0")
        mutableClassDefBy(PATH_STATS).apply { filterStores(fieldForLabel(", userRating=", "I"), "$PUZZLES->sessionRating(I)I") }
        mutableClassDefBy(RATING_STATS).apply { filterStores(fieldForLabel(", current=", "I"), "$PUZZLES->sessionRating(I)I") }

        // The Classic layout needs path stats, which guest mode never loads.
        val statsLoaded = mutableClassDefBy(STATS_LOADED)
        val withStats = statsLoaded.methods.singleOrNull { method ->
            method.returnType == PATH_STATS && method.parameterTypes.map { it.toString() } == listOf(PATH_STATS)
        } ?: throw PatchException("The puzzle screen's stats were not found")
        withStats.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $PUZZLES->session()Z
                move-result v0
                if-eqz v0, :morphe_stats
                if-nez p1, :morphe_stats
                new-instance v0, $PATH_STATS
                invoke-direct { v0 }, $PATH_STATS-><init>()V
                return-object v0
            """,
            ExternalLabel("morphe_stats", withStats.getInstruction(0)),
        )
        // The rating chip also needs rating stats, which guest mode gives as null.
        statsLoaded.filterStores(
            statsLoaded.fieldForLabel(", ratingStats=", RATING_STATS),
            "$PUZZLES->ratingStats(Ljava/lang/Object;)Ljava/lang/Object;",
        )
        name("ratingStatsClass", RATING_STATS.javaName())

        // The Puzzles tab's menu is PathRootMenuState(expanded, big button text, button above it,
        // buttons, ...). The button above is empty unless the other call to action (Solve Puzzles or
        // Next Lesson) has it. Ours takes the big button, and the one it displaces goes above it, or
        // first in the menu's list when the other one has the spot.
        mutableClassDefBy(PUZZLES_TAB).methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            val index = instructions.indexOfFirst { instruction ->
                val reference = instruction.methodReference
                instruction.opcode == Opcode.INVOKE_DIRECT_RANGE && reference != null && reference.name == "<init>" &&
                    reference.parameterTypes.size >= 6 && reference.parameterTypes[1] == "I" &&
                    reference.parameterTypes[3] == "Ljava/util/List;" && reference.parameterTypes[5] == BUTTON_SIZE
            }
            if (index < 0) return@forEach
            val constructor = instructions[index].methodReference!!
            val state = constructor.definingClass
            val created = (index - 1 downTo 0).firstOrNull { i ->
                instructions[i].opcode == Opcode.NEW_INSTANCE && instructions[i].typeReference == state
            } ?: throw PatchException("The Puzzles tab menu is never created")
            val first = (instructions[index] as RegisterRangeInstruction).startRegister
            val text = "v${first + 2}"
            val secondary = "v${first + 3}"
            val buttons = "v${first + 4}"
            method.addInstructions(
                created,
                """
                    invoke-static/range { $text .. $buttons }, $PUZZLES->buttons(ILjava/lang/Object;Ljava/util/List;)Ljava/util/List;
                    move-result-object $buttons
                    invoke-static/range { $text .. $buttons }, $PUZZLES->secondary(ILjava/lang/Object;Ljava/util/List;)Ljava/lang/Object;
                    move-result-object $secondary
                    check-cast $secondary, ${constructor.parameterTypes[2]}
                    invoke-static/range { $text .. $text }, $PUZZLES->bigButtonText(I)I
                    move-result $text
                """,
            )
            return@execute
        }
        throw PatchException("The Puzzles tab menu was not found")
    }
}
