package app.noam.patches.chesscom.lichesspuzzle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import app.noam.patches.chesscom.shared.getterForLabel
import app.noam.patches.chesscom.shared.returnString
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.value.ArrayEncodedValue
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PUZZLES = "${Constants.EXTENSION_PACKAGE}/lichesspuzzle/LichessPuzzles;"
private const val PUZZLES_TAB = "Lcom/chess/features/puzzles/home/ui/HomePuzzlePathRootContentKt;"
private const val BUTTON_SIZE = "Lcom/chess/palette/core/style/ButtonSize;"
private const val MENU_LISTENER = "Lcom/chess/palette/components/menu/a;"
private const val BIG_BUTTON_CLICK =
    "Lcom/chess/palette/components/menu/PathRootMenuKt\$PathRootMenu\$4\$6\$4\$primaryCtaButton\$1\$1\$1;"
private const val PUZZLES_MENU_SCREEN = "Lcom/chess/features/puzzles/home/menu/HomePuzzlesMenuScreenKt\$"
private const val MODE = "Lcom/chess/navigationinterface/PathPuzzlesMode;"
private const val REPOSITORY = "Lcom/chess/internal/puzzles/RatedPuzzleRepositoryImpl;"
private const val SOURCE = "Lcom/chess/features/puzzles/db/model/ProblemSource;"
private const val SOLUTION = "Lcom/chess/features/puzzles/db/model/m;"
private const val TACTICS_PROBLEM = "Lcom/chess/net/model/TacticsProblem;"
private const val PATH_RESULT = "Lchesscom/puzzles/v1/PuzzlePathResult;"
private const val RATING = "Lchesscom/puzzles/v1/Rating;"
private const val SETTINGS_LOADED = "Lcom/chess/features/puzzles/rated/p0\$l0;"
private const val PUZZLE_SETTINGS = "Lcom/chess/features/puzzles/rated/api/PuzzleSettings;"
private const val PATH_STATS = "Lcom/chess/features/path/ui/v4;"
private const val RATING_STATS = "Lcom/chess/features/puzzles/db/model/o;"
private const val STATS_LOADED = "Lcom/chess/features/puzzles/rated/p0\$q0;"
private const val VIEW_MODEL = "Lcom/chess/features/puzzles/rated/RatedPuzzlesGameViewModel;"
private const val PATH_REPOSITORY = "Lcom/chess/features/path/data/PathProgressRepositoryImpl;"
private const val PUZZLE_SERVICE = "Lcom/chess/features/puzzles/api/h;"
private const val GUEST_STORE = "Lcom/chess/internal/puzzles/r2;"
private const val HOME_PUZZLES_VM = "Lcom/chess/features/puzzles/home/menu/HomePuzzlesMenuViewModel;"
private const val HOME_PUZZLES_REFRESH =
    "Lcom/chess/features/puzzles/home/menu/HomePuzzlesMenuViewModel\$refreshData\$2;"
private const val HOME_PUZZLES_RESUME =
    "Lcom/chess/features/puzzles/home/menu/HomePuzzlesMenuViewModel\$refreshDailyPuzzleFab\$2;"
private const val HUB_STATE = "Lcom/chess/features/puzzles/home/ui/y1;"
private const val HUB_PATH = "Lcom/chess/features/puzzles/home/ui/z1;"
private const val HUB_USER = "Lcom/chess/features/puzzles/home/ui/a2;"
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

/** "Lcom/x/Y;" as Class.forName wants it. */
private fun String.javaName() = substring(1, length - 1).replace('/', '.')

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
            val at = instructions.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == constant }
            return instructions.drop(at).firstNotNullOfOrNull { instruction ->
                instruction.fieldReference?.takeIf { instruction.opcode == Opcode.SPUT_OBJECT && it.type == type }?.name
            } ?: throw PatchException("$type.$constant was not found")
        }

        // The big button calls the menu listener's method that chess.com's own click lambda calls.
        val click = mutableClassDefBy(BIG_BUTTON_CLICK).methods.single { it.name == "invoke" && it.returnType == "V" }
            .implementation!!.instructions.firstNotNullOfOrNull { instruction ->
                instruction.methodReference?.takeIf { instruction.opcode == Opcode.INVOKE_INTERFACE && it.definingClass == MENU_LISTENER }
            }?.name ?: throw PatchException("The big button's click was not found")
        name("solveMethod", click)

        // The Puzzles tab's listener: remembered when made, and its big-button click opens chess.com's
        // puzzle screen in guest mode, as Solve Puzzles does for a guest (or settings, with no
        // puzzles downloaded yet).
        val listeners = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(PUZZLES_MENU_SCREEN) && classDef.interfaces.isNotEmpty() &&
                classDef.methods.any { it.name == click && it.parameterTypes.isEmpty() && it.returnType == "V" }
            ) listeners += classDef.type
        }
        val listener = mutableClassDefBy(listeners.singleOrNull() ?: throw PatchException("Puzzles tab listeners: $listeners"))
        val solvePuzzles = listener.methods.single { it.name == click && it.parameterTypes.isEmpty() && it.returnType == "V" }
        val solveCode = solvePuzzles.implementation!!.instructions.toList()
        val navigate = solveCode.firstNotNullOfOrNull { instruction ->
            instruction.methodReference?.takeIf {
                instruction.opcode == Opcode.INVOKE_INTERFACE && it.parameterTypes.size == 2 &&
                    it.parameterTypes[0] == "Landroidx/fragment/app/FragmentActivity;" &&
                    it.parameterTypes[1] == "Lcom/chess/navigationinterface/NavigationDirections;"
            }
        } ?: throw PatchException("Solve Puzzles' navigation was not found")
        val directions = solveCode.firstNotNullOfOrNull { instruction ->
            instruction.methodReference?.takeIf {
                instruction.opcode == Opcode.INVOKE_DIRECT && it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(MODE)
            }?.definingClass
        } ?: throw PatchException("Solve Puzzles' screen was not found")
        fun listenerField(type: String) = listener.fields.singleOrNull { it.type == type }?.name
            ?: throw PatchException("The listener has no single $type")
        val router = listenerField(navigate.definingClass)
        val activity = listenerField("Landroidx/fragment/app/FragmentActivity;")
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
                iget-object v0, p0, ${listener.type}->$router:${navigate.definingClass}
                iget-object v1, p0, ${listener.type}->$activity:Landroidx/fragment/app/FragmentActivity;
                new-instance v2, $directions
                sget-object v3, $MODE->$guestMode:$MODE
                invoke-direct { v2, v3 }, $directions-><init>($MODE)V
                invoke-interface { v0, v1, v2 }, $navigate
                return-void
            """,
            ExternalLabel("morphe_solve_puzzles", solvePuzzles.getInstruction(0)),
        )
        listener.methods.filter { it.name == "<init>" }.forEach { constructor ->
            constructor.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.sortedDescending()
                .forEach { index ->
                    constructor.addInstructions(index, "invoke-static { p0 }, $PUZZLES->onListener(Ljava/lang/Object;)V")
                }
        }

        // The repository: guest puzzles are Lichess's, and their results are scored here. Chess.com's
        // guest refill shows how puzzles are converted and stored.
        val repository = mutableClassDefBy(REPOSITORY)
        val guestSource = enumField(SOURCE, "RATED_GUEST")
        val refill = repository.methods.singleOrNull { method ->
            method.parameterTypes.size == 1 && method.returnType == "Ljava/lang/Object;" &&
                method.implementation?.instructions?.any { instruction ->
                    instruction.opcode == Opcode.SGET_OBJECT && instruction.fieldReference?.let {
                        it.definingClass == SOURCE && it.name == guestSource
                    } == true
                } == true
        } ?: throw PatchException("The guest refill was not found")
        val refillCode = refill.implementation!!.instructions.toList()
        val converter = refillCode.firstNotNullOfOrNull { instruction ->
            instruction.methodReference?.takeIf {
                instruction.opcode == Opcode.INVOKE_STATIC && it.parameterTypes.map(CharSequence::toString) == listOf(TACTICS_PROBLEM, SOURCE, "J")
            }
        } ?: throw PatchException("The problem converter was not found")
        val daoInsert = refillCode.firstNotNullOfOrNull { instruction ->
            instruction.methodReference?.takeIf { reference ->
                instruction.opcode == Opcode.INVOKE_INTERFACE && reference.returnType == "V" &&
                    reference.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/List;") &&
                    repository.fields.any { it.type == reference.definingClass }
            }
        } ?: throw PatchException("The problem insert was not found")
        name("converterClass", converter.definingClass.javaName())
        name("converterMethod", converter.name)
        name("daoField", repository.fields.single { it.type == daoInsert.definingClass }.name)
        name("daoInsert", daoInsert.name)
        // Chess.com's own guest puzzles (a signed-out user has them) share the guest queue with ours
        // and come first, oldest first: a session clears the queue with the puzzle database's own
        // "delete every puzzle of a source" before it stores its first Lichess puzzles.
        var clear: Pair<String, String>? = null
        classDefForEach { classDef ->
            if (clear != null) return@classDefForEach
            classDef.methods.firstOrNull { method ->
                method.returnType == "V" && method.parameterTypes.map(CharSequence::toString) == listOf(SOURCE) &&
                    method.implementation?.instructions?.any { instruction ->
                        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                            "DELETE FROM tactics_problem WHERE source = ?"
                    } == true
            }?.let { clear = classDef.type to it.name }
        }
        val (clearClass, clearMethod) = clear ?: throw PatchException("The puzzle database's clear was not found")
        // The repository's field holding that database: a type the class or one it extends implements.
        val clearTypes = generateSequence(clearClass) { type -> classDefByOrNull { it.type == type }?.superclass }
            .flatMap { type -> sequenceOf(type) + (classDefByOrNull { it.type == type }?.interfaces?.asSequence() ?: emptySequence()) }
            .toSet()
        name("puzzleDbField", repository.fields.singleOrNull { it.type in clearTypes }?.name
            ?: throw PatchException("The repository's puzzle database was not found"))
        name("puzzleDbClear", clearMethod)
        // The puzzle screen's guest puzzles: the refill above is only called by Home for real guests.
        val guestPuzzles = repository.methods.singleOrNull { method ->
            method.parameterTypes.isEmpty() && method.returnType != "V" &&
                method.implementation?.instructions?.any { instruction ->
                    instruction.opcode == Opcode.SGET_OBJECT && instruction.fieldReference?.let {
                        it.definingClass == SOURCE && it.name == guestSource
                    } == true
                } == true
        } ?: throw PatchException("The guest puzzles were not found")
        guestPuzzles.addInstructions(0, "invoke-static/range { p0 .. p0 }, $PUZZLES->onGuestPuzzles(Ljava/lang/Object;)V")

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
        fun MutableMethod.fetchesPuzzle() = implementation?.instructions?.any { instruction ->
            instruction.methodReference?.let { it.definingClass == PUZZLE_SERVICE && it.name == "b" } == true
        } == true
        // Next puzzle and prefetch; the prefetch returns its error, the update methods Unit.
        repository.methods.filter { it.returnType == "Ljava/lang/Object;" && it.fetchesPuzzle() }
            .forEach { method ->
                val result = if (method.parameterTypes.firstOrNull()?.toString() == "J") NOTHING else UNIT
                method.skipIf("session", result)
            }
        // Don't mix chess.com's guest puzzles into the Lichess database.
        refill.skipIf("session")
        // The Lichess screen must not refresh the hub's path; the hub does that on resume.
        mutableClassDefBy(PATH_REPOSITORY).methods.filter {
            it.parameterTypes.size == 1 && it.returnType == "Ljava/lang/Object;"
        }.forEach { it.skipIf("onPuzzleScreen") }

        // The hub only refreshes its daily puzzle on resume; also refresh its path.
        fun MutableMethod.createsType(type: String) = implementation?.instructions?.any { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == type
        } == true
        val homePuzzles = mutableClassDefBy(HOME_PUZZLES_VM)
        val refreshData = homePuzzles.methods.singleOrNull { method ->
            method.parameterTypes.isEmpty() && method.returnType == "V" && method.createsType(HOME_PUZZLES_REFRESH)
        } ?: throw PatchException("The Puzzles hub's refresh was not found")
        val refreshOnResume = homePuzzles.methods.singleOrNull { method ->
            method.parameterTypes.isEmpty() && method.returnType == "V" && method.createsType(HOME_PUZZLES_RESUME)
        } ?: throw PatchException("The Puzzles hub's resume was not found")
        refreshOnResume.addInstructions(0, "invoke-direct { p0 }, $HOME_PUZZLES_VM->${refreshData.name}()V")

        // Keep the hub's map and XP on the pre-session values while Lichess closes.
        val hubState = mutableClassDefBy(HUB_STATE)
        val hubStateConstructor = hubState.methods.singleOrNull { method ->
            method.name == "<init>" && method.parameterTypes.size == 12 &&
                method.parameterTypes[6].toString() == HUB_PATH
        } ?: throw PatchException("The Puzzles hub state constructor was not found")
        hubStateConstructor.addInstructions(
            1,
            """
                invoke-static { p6 }, $PUZZLES->userForHub(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p6
                check-cast p6, $HUB_USER
                invoke-static { p7 }, $PUZZLES->pathForHub(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p7
                check-cast p7, $HUB_PATH
            """,
        )

        val score: MutableMethod = repository.methods.singleOrNull { method ->
            method.parameterTypes.size == 4 && method.parameterTypes[0].toString() == "Ljava/util/List;" &&
                method.parameterTypes[1].toString() == SOLUTION && method.parameterTypes[2].toString() == "Z"
        } ?: throw PatchException("The solution scoring was not found")
        val scoreCode = score.implementation!!.instructions.toList()
        fun constructed(parameters: List<String>) = scoreCode.firstNotNullOfOrNull { instruction ->
            instruction.methodReference?.takeIf {
                it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == parameters
            }?.definingClass
        } ?: throw PatchException("Nothing in the scoring is made from $parameters")
        name("resultClass", constructed(listOf(SOLUTION, "Ljava/lang/Object;")).javaName())
        name("scoreClass", constructed(listOf(PATH_RESULT, RATING, "Ljava/lang/Throwable;")).javaName())
        val logged = scoreCode.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "Scoring puzzle "
        }
        // "Scoring puzzle " + solution.problemId() + " exceeded ...": the id is read just before.
        val problemId = scoreCode.take(logged.coerceAtLeast(0)).lastOrNull { instruction ->
            instruction.methodReference?.let { it.definingClass == SOLUTION && it.returnType == "J" && it.parameterTypes.isEmpty() } == true
        }?.methodReference?.takeIf { logged >= 0 } ?: throw PatchException("The solution's problem id was not found")
        name("problemIdGetter", problemId.name)
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
        mutableClassDefBy(GUEST_STORE).methods.single { it.parameterTypes.isEmpty() && it.returnType == "Z" }
            .whileSession("const/4 v0, 0x0\nreturn v0")
        val regularMode = enumField(MODE, "REGULAR")
        mutableClassDefBy(MODE).methods.single { it.parameterTypes.isEmpty() && it.returnType == "Z" }
            .whileSession("const/4 v0, 0x0\nreturn v0")
        mutableClassDefBy(SETTINGS_LOADED).getterForLabel(", mode=").whileSession("sget-object v0, $MODE->$regularMode:$MODE\nreturn-object v0")
        mutableClassDefBy(PUZZLE_SETTINGS).getterForLabel("PuzzleSettings(collectPoints=").whileSession("const/4 v0, 0x0\nreturn v0")
        val ratingValue = "invoke-static { }, $PUZZLES->rating()I\nmove-result v0\nreturn v0"
        mutableClassDefBy(PATH_STATS).getterForLabel(", userRating=").whileSession(ratingValue)

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
        mutableClassDefBy(RATING_STATS).getterForLabel(", current=").whileSession(ratingValue)
        // The rating chip also needs stats, which guest mode gives as flowOf(null).
        val ratingStats = mutableClassDefBy(VIEW_MODEL).methods.singleOrNull { method ->
            method.parameterTypes.isEmpty() && method.annotations.any { annotation ->
                annotation.type == "Ldalvik/annotation/Signature;" && annotation.elements.any { element ->
                    (element.value as? ArrayEncodedValue)?.value?.any { (it as? StringEncodedValue)?.value == RATING_STATS } == true
                }
            }
        } ?: throw PatchException("The puzzle screen's rating stats were not found")
        val flowOf = ratingStats.implementation!!.instructions.firstNotNullOfOrNull { instruction ->
            instruction.methodReference?.takeIf {
                instruction.opcode == Opcode.INVOKE_STATIC && it.returnType == ratingStats.returnType &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;")
            }
        } ?: throw PatchException("The rating stats' flowOf was not found")
        ratingStats.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $PUZZLES->session()Z
                move-result v0
                if-eqz v0, :morphe_rating_stats
                new-instance v0, $RATING_STATS
                invoke-direct { v0 }, $RATING_STATS-><init>()V
                invoke-static { v0 }, $flowOf
                move-result-object v0
                return-object v0
            """,
            ExternalLabel("morphe_rating_stats", ratingStats.getInstruction(0)),
        )

        // The Puzzles tab's menu is PathRootMenuState(expanded, big button text, button above it,
        // buttons, ...). The button above is empty unless there is a next lesson. Ours takes the big
        // button and Solve Puzzles goes above it, or first in the menu's list when Next Lesson has the spot.
        mutableClassDefBy(PUZZLES_TAB).methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            val index = instructions.indexOfFirst { instruction ->
                val reference = instruction.methodReference
                instruction.opcode == Opcode.INVOKE_DIRECT_RANGE && reference != null && reference.name == "<init>" &&
                    reference.parameterTypes.size == 9 && reference.parameterTypes[1] == "I" &&
                    reference.parameterTypes[3] == "Ljava/util/List;" && reference.parameterTypes[5] == BUTTON_SIZE
            }
            if (index < 0) return@forEach
            val constructor = instructions[index].methodReference!!
            val state = constructor.definingClass
            val created = (index - 1 downTo 0).firstOrNull { i ->
                instructions[i].opcode == Opcode.NEW_INSTANCE &&
                    ((instructions[i] as ReferenceInstruction).reference as TypeReference).type == state
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
