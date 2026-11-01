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
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
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
private const val PUZZLES_MENU_SCREEN = "Lcom/chess/features/puzzles/home/"
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
// 4.10.23 renamed the hub state types: o0 (state), q0 (path), p0 (user).
private const val HUB_STATE_41023 = "Lcom/chess/features/puzzles/home/ui/o0;"
private const val HUB_PATH_41023 = "Lcom/chess/features/puzzles/home/ui/q0;"
private const val HUB_USER_41023 = "Lcom/chess/features/puzzles/home/ui/p0;"
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
        val click = mutableClassDefBy(BIG_BUTTON_CLICK).methods
            .filter { it.name == "invoke" && it.parameterTypes.isEmpty() }
            .firstNotNullOfOrNull { method ->
                method.implementation?.instructions?.firstNotNullOfOrNull { instruction ->
                    instruction.methodReference?.takeIf {
                        instruction.opcode == Opcode.INVOKE_INTERFACE && it.definingClass == MENU_LISTENER
                    }?.name
                }
            } ?: throw PatchException("The big button's click was not found")
        name("solveMethod", click)

        // The Puzzles tab's listener: remembered when made, and its big-button click opens chess.com's
        // puzzle screen in guest mode, as Solve Puzzles does for a guest (or settings, with no
        // puzzles downloaded yet).
        fun findListeners(prefix: String): List<String> {
            val found = mutableListOf<String>()
            classDefForEach { classDef ->
                if (classDef.type.startsWith(prefix) && classDef.interfaces.isNotEmpty() &&
                    classDef.methods.any { it.name == click && it.parameterTypes.isEmpty() && it.returnType == "V" }
                ) found += classDef.type
            }
            return found
        }
        // 4.10.18 has the menu screen listener; 4.10.23 moved it to home/ui.
        val listeners = findListeners("Lcom/chess/features/puzzles/home/menu/HomePuzzlesMenuScreenKt\$")
            .takeIf { it.size == 1 } ?: findListeners(PUZZLES_MENU_SCREEN)
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
        // The click is handled in Java: the listener's router and activity are found with their
        // public fields at runtime, so the two versions' different listener layouts (4.10.18 keeps
        // them on the listener, 4.10.23 delegates to a holder) do not need separate smali.
        val guestMode = enumField(MODE, "GUEST")
        solvePuzzles.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v0, p0
                const-string v2, "$directions"
                const-string v3, "$guestMode"
                invoke-static { v0, v2, v3 }, $PUZZLES->interceptBigButton(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Z
                move-result v1
                if-eqz v1, :morphe_solve_puzzles
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

        val guestSource = enumField(SOURCE, "RATED_GUEST")

        // The repository: guest puzzles are Lichess's, and their results are scored here. Chess.com's
        // guest refill shows how puzzles are converted and stored.
        // 4.10.23 merged RatedPuzzleRepositoryImpl into an obfuscated class; the one that
        // converts guest tactics problems is the repository.
        val repository = mutableClassDefByOrNull(REPOSITORY) ?: mutableClassDefBy(classDefByOrNull { classDef ->
            classDef.type.startsWith("Lcom/chess/internal/puzzles/") &&
                classDef.methods.any { method ->
                    val instructions = method.implementation?.instructions ?: return@any false
                    val converts = instructions.any { instruction ->
                        instruction.methodReference?.let { reference ->
                            reference.name == "i" && reference.parameterTypes.size == 3 &&
                                reference.parameterTypes[0].toString() == TACTICS_PROBLEM &&
                                reference.parameterTypes[1].toString() == SOURCE &&
                                reference.parameterTypes[2].toString() == "J"
                        } == true
                    }
                    converts && instructions.any {
                        it.opcode == Opcode.SGET_OBJECT && it.fieldReference?.let { field ->
                            field.definingClass == SOURCE && field.name == guestSource
                        } == true
                    }
                }
        } ?: throw PatchException("The rated puzzle repository was not found"))
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
                (instruction.opcode == Opcode.INVOKE_INTERFACE || instruction.opcode == Opcode.INVOKE_VIRTUAL) &&
                    reference.returnType == "V" &&
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
        // 4.10.23 runs the delete in a coroutine lambda, so it cannot be found this way; the seeded
        // puzzles still work there (the queue holds none of chess.com's own guest puzzles).
        val clearFound = clear
        if (clearFound != null) {
            val (clearClass, clearMethod) = clearFound
            // The repository's field holding that database: a type the class or one it extends implements.
            val clearTypes = generateSequence(clearClass) { type -> classDefByOrNull { it.type == type }?.superclass }
                .flatMap { type -> sequenceOf(type) + (classDefByOrNull { it.type == type }?.interfaces?.asSequence() ?: emptySequence()) }
                .toSet()
            name("puzzleDbField", repository.fields.singleOrNull { it.type in clearTypes }?.name
                ?: throw PatchException("The repository's puzzle database was not found"))
            name("puzzleDbClear", clearMethod)
        }
        // The puzzle screen's guest puzzles: the refill above is only called by Home for real guests.
        val guestPuzzles = repository.methods.singleOrNull { method ->
            method.parameterTypes.isEmpty() && method.returnType != "V" &&
                method.implementation?.instructions?.any { instruction ->
                    instruction.opcode == Opcode.SGET_OBJECT && instruction.fieldReference?.let {
                        it.definingClass == SOURCE && it.name == guestSource
                    } == true
                } == true
        }
        var modernGuestFlow = false
        if (guestPuzzles != null) {
            guestPuzzles.addInstructions(0, "invoke-static/range { p0 .. p0 }, $PUZZLES->onGuestPuzzles(Ljava/lang/Object;)V")
        } else {
            // 4.10.18 keeps the repository class; 4.10.23 merges it into an obfuscated class and
            // inlines the guest flow into the view model, so the refill hook never runs on a
            // fresh account. Seed the guest store from the view model there instead.
            val guestFlow =
                "Lcom/chess/internal/puzzles/RatedPuzzleRepositoryImpl\$nextGuestProblem\$\$inlined\$flatMapLatest\$1;"
            val repositoryType = mutableClassDefByOrNull(guestFlow)
                ?.fields?.firstOrNull { it.name == "this\$0" }?.type
            if (repositoryType != null && repositoryType != "Lcom/chess/internal/puzzles/RatedPuzzleRepositoryImpl;") {
                modernGuestFlow = true
                name("guestRepositoryClass", repositoryType.javaName())
                mutableClassDefBy(VIEW_MODEL).methods.filter { it.name == "<init>" }.forEach { constructor ->
                    constructor.implementation!!.instructions.withIndex()
                        .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.sortedDescending()
                        .forEach { index ->
                            constructor.addInstructions(
                                index,
                                "invoke-static/range { p0 .. p0 }, $PUZZLES->onGuestPuzzlesFrom(Ljava/lang/Object;)V",
                            )
                        }
                }
            } else {
                refill.addInstructions(0, "invoke-static/range { p0 .. p0 }, $PUZZLES->onGuestPuzzles(Ljava/lang/Object;)V")
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
        // The screen also refreshes chess.com's puzzle, friends and stats data, which need an
        // account and either raise the app's "something went wrong" snackbar or close the screen
        // in a session. Hook the suspend body: the invoke() bridge has no local registers to spare.
        listOf(
            "Lcom/chess/features/puzzles/rated/RatedPuzzlesGameViewModel\$updatePuzzleData\$2;",
            "Lcom/chess/features/puzzles/rated/RatedPuzzlesGameViewModel\$updateFriendsData\$2;",
            "Lcom/chess/features/puzzles/rated/RatedPuzzlesGameViewModel\$updateUserStatsData\$2;",
        ).forEach { type ->
            mutableClassDefByOrNull(type)?.methods
                ?.filter { it.name == "invokeSuspend" }
                ?.forEach { it.skipIf("session") }
        }
        // The Lichess screen must not refresh the hub's path; the hub does that on resume.
        val pathRepository = mutableClassDefByOrNull(PATH_REPOSITORY) ?: mutableClassDefBy(
            classDefByOrNull { classDef ->
                classDef.type.startsWith("Lcom/chess/features/path/data/") &&
                    classDef.fields.count() >= 3 &&
                    classDef.methods.any { it.parameterTypes.size == 1 && it.returnType == "Ljava/lang/Object;" }
            } ?: throw PatchException("The path repository was not found")
        )
        pathRepository.methods.filter {
            it.parameterTypes.size == 1 && it.returnType == "Ljava/lang/Object;"
        }.forEach { it.skipIf("onPuzzleScreen") }

        // The hub only refreshes its daily puzzle on resume; also refresh its path.
        fun MutableMethod.createsType(type: String) = implementation?.instructions?.any { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == type
        } == true
        val homePuzzles = mutableClassDefBy(HOME_PUZZLES_VM)
        val refreshData = homePuzzles.methods.singleOrNull { method ->
            method.parameterTypes.isEmpty() && method.returnType == "V" && method.createsType(HOME_PUZZLES_REFRESH)
        }
        val refreshOnResume = homePuzzles.methods.singleOrNull { method ->
            method.parameterTypes.isEmpty() && method.returnType == "V" && method.createsType(HOME_PUZZLES_RESUME)
        }
        // 4.10.23 inlines the refresh into the view model's constructor; the hub's resume already
        // refreshes what it needs there.
        if (refreshData != null && refreshOnResume != null) {
            refreshOnResume.addInstructions(0, "invoke-direct { p0 }, $HOME_PUZZLES_VM->${refreshData.name}()V")
        }

        // Keep the hub's map and XP on the pre-session values while Lichess closes: the guest
        // path and user data would otherwise jump the map to puzzle 1. 4.10.18 keeps the state
        // in y1 with (user, path) at 5/6; 4.10.23 renamed it o0 and added a parameter before
        // them, so path and user sit at 5/6 the other way round.
        fun hookHubState(
            stateType: String,
            pathType: String,
            userType: String,
            arity: Int,
            pathIndex: Int,
            userIndex: Int,
        ) {
            val constructor = mutableClassDefBy(stateType).methods.singleOrNull { method ->
                method.name == "<init>" && method.parameterTypes.size == arity &&
                    method.parameterTypes[pathIndex].toString() == pathType &&
                    method.parameterTypes[userIndex].toString() == userType
            } ?: throw PatchException("The Puzzles hub state constructor was not found in $stateType")
            val path = "p${pathIndex + 1}"
            val user = "p${userIndex + 1}"
            constructor.addInstructions(
                1,
                """
                    invoke-static { $user }, $PUZZLES->userForHub(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object $user
                    check-cast $user, $userType
                    invoke-static { $path }, $PUZZLES->pathForHub(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object $path
                    check-cast $path, $pathType
                """,
            )
        }
        when {
            mutableClassDefByOrNull(HUB_STATE) != null ->
                hookHubState(HUB_STATE, HUB_PATH, HUB_USER, arity = 12, pathIndex = 6, userIndex = 5)
            mutableClassDefByOrNull(HUB_STATE_41023) != null ->
                hookHubState(HUB_STATE_41023, HUB_PATH_41023, HUB_USER_41023, arity = 13, pathIndex = 5, userIndex = 6)
            else -> throw PatchException("The puzzles hub state was not found for this version")
        }

        val score: MutableMethod = repository.methods.singleOrNull { method ->
            method.parameterTypes.size == 4 && method.parameterTypes[0].toString() == "Ljava/util/List;" &&
                method.parameterTypes[1].toString() == SOLUTION && method.parameterTypes[2].toString() == "Z"
        } ?: throw PatchException("The solution scoring was not found")
        val scoreCode = score.implementation!!.instructions.toList()
        fun constructed(parameters: List<String>) = scoreCode.firstNotNullOfOrNull { instruction ->
            instruction.methodReference?.takeIf { reference ->
                reference.name == "<init>" && reference.parameterTypes.size == parameters.size &&
                    reference.parameterTypes.map(CharSequence::toString).zip(parameters).all { (actual, expected) ->
                        actual == expected ||
                            (expected == "Ljava/lang/Throwable;" && actual.endsWith("ApiException;"))
                    }
            }?.definingClass
        } ?: throw PatchException("Nothing in the scoring is made from $parameters")
        name("resultClass", constructed(listOf(SOLUTION, "Ljava/lang/Object;")).javaName())
        name("scoreClass", constructed(listOf(PATH_RESULT, RATING, "Ljava/lang/Throwable;")).javaName())
        val logged = scoreCode.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "Scoring puzzle "
        }
        // "Scoring puzzle " + solution.problemId() + " exceeded ...": the id is read just before.
        // 4.10.18 reads the id through a getter; 4.10.23 through a public field.
        val problemId = scoreCode.take(logged.coerceAtLeast(0)).lastOrNull { instruction ->
            instruction.methodReference?.let {
                it.definingClass == SOLUTION && it.returnType == "J" && it.parameterTypes.isEmpty()
            } == true || instruction.fieldReference?.let {
                it.definingClass == SOLUTION && it.type == "J"
            } == true
        }?.takeIf { logged >= 0 } ?: throw PatchException("The solution's problem id was not found")
        name("problemIdGetter", problemId.methodReference?.name ?: problemId.fieldReference!!.name)
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
        // Wait for the background Lichess insert instead of ending the guest flow.
        mutableClassDefByOrNull(GUEST_STORE)?.methods
            ?.singleOrNull { it.parameterTypes.isEmpty() && it.returnType == "Z" }
            ?.whileSession("const/4 v0, 0x0\nreturn v0")
        // 4.10.23 reads the same flag inline in the puzzle flow instead of a store method. A
        // fresh account has it false, so the guest screen ends before the Lichess puzzles
        // arrive; treat it as started while a session is active.
        var guestStartedHooks = 0
        classDefForEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                val instructions = implementation.instructions.toList()
                if (instructions.none { instruction ->
                        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "is_guest_mode_started"
                    }) return@forEach
                instructions.indices.filter { index ->
                    val instruction = instructions[index]
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    instruction.opcode == Opcode.INVOKE_STATIC &&
                        reference?.definingClass == "Lcom/chess/utils/android/preferences/f;" &&
                        reference.name == "a" && reference.returnType == "Z" &&
                        instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT
                }.sortedDescending().forEach { index ->
                    val register = (instructions[index + 1] as OneRegisterInstruction).registerA
                    method.addInstructions(
                        index + 2,
                        """
                            invoke-static/range { v$register .. v$register }, $PUZZLES->guestStarted(Z)Z
                            move-result v$register
                        """,
                    )
                    guestStartedHooks++
                }
            }
        }
        if (guestStartedHooks == 0 && modernGuestFlow) throw PatchException("The guest started check was not found")
        val regularMode = enumField(MODE, "REGULAR")
        mutableClassDefBy(MODE).methods.single { it.parameterTypes.isEmpty() && it.returnType == "Z" }
            .whileSession("const/4 v0, 0x0\nreturn v0")
        val settingsLoaded = mutableClassDefByOrNull(SETTINGS_LOADED)
            ?: mutableClassDefBy("Lcom/chess/features/puzzles/rated/t\$l0;")
        // 4.10.18 has a mode getter; 4.10.23 inlines it, so set the constructor's mode instead.
        val modeGetter = runCatching { settingsLoaded.getterForLabel(", mode=") }.getOrNull()
        if (modeGetter != null) {
            modeGetter.whileSession("sget-object v0, $MODE->$regularMode:$MODE\nreturn-object v0")
        } else {
            settingsLoaded.methods.first { method ->
                method.name == "<init>" && method.parameterTypes.any { it.toString() == MODE }
            }.apply {
                val mode = parameterTypes.indexOfFirst { it.toString() == MODE }
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static { }, $PUZZLES->session()Z
                        move-result v0
                        if-eqz v0, :morphe_mode
                        sget-object p${mode + 1}, $MODE->$regularMode:$MODE
                    """,
                    ExternalLabel("morphe_mode", getInstruction(0)),
                )
            }
        }
        val puzzleSettings = mutableClassDefBy(PUZZLE_SETTINGS)
        val collectPoints = runCatching { puzzleSettings.getterForLabel("PuzzleSettings(collectPoints=") }.getOrNull()
        if (collectPoints != null) {
            collectPoints.whileSession("const/4 v0, 0x0\nreturn v0")
        } else {
            puzzleSettings.methods.first { method ->
                method.name == "<init>" && method.parameterTypes.size == 7 &&
                    method.parameterTypes.count { it.toString() == "Z" } == 6
            }.apply {
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static { }, $PUZZLES->session()Z
                        move-result v0
                        if-eqz v0, :morphe_points
                        const/4 p1, 0x0
                    """,
                    ExternalLabel("morphe_points", getInstruction(0)),
                )
            }
        }
        val ratingValue = "invoke-static { }, $PUZZLES->rating()I\nmove-result v0\nreturn v0"
        val pathStats = mutableClassDefByOrNull(PATH_STATS)
            ?: mutableClassDefBy("Lcom/chess/features/path/ui/o2;")
        val userRating = runCatching { pathStats.getterForLabel(", userRating=") }.getOrNull()
        if (userRating != null) {
            userRating.whileSession(ratingValue)
        } else {
            // 4.10.23 inlines the getter; userRating is the second constructor parameter.
            pathStats.methods.first { method ->
                method.name == "<init>" && method.parameterTypes.size == 12 &&
                    method.parameterTypes[1].toString() == "I"
            }.apply {
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static { }, $PUZZLES->session()Z
                        move-result v0
                        if-eqz v0, :morphe_rating
                        invoke-static { }, $PUZZLES->rating()I
                        move-result p2
                    """,
                    ExternalLabel("morphe_rating", getInstruction(0)),
                )
            }
        }

        // The Classic layout needs path stats, which guest mode never loads.
        val statsLoaded = mutableClassDefByOrNull(STATS_LOADED)
            ?: mutableClassDefBy("Lcom/chess/features/puzzles/rated/t\$q0;")
        val withStats = statsLoaded.methods.singleOrNull { method ->
            method.returnType == pathStats.type && method.parameterTypes.map { it.toString() } == listOf(pathStats.type)
        } ?: throw PatchException("The puzzle screen's stats were not found")
        withStats.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $PUZZLES->session()Z
                move-result v0
                if-eqz v0, :morphe_stats
                if-nez p1, :morphe_stats
                new-instance v0, ${pathStats.type}
                invoke-direct { v0 }, ${pathStats.type}-><init>()V
                return-object v0
            """,
            ExternalLabel("morphe_stats", withStats.getInstruction(0)),
        )
        val ratingStatsClass = mutableClassDefBy(RATING_STATS)
        val currentRating = runCatching { ratingStatsClass.getterForLabel(", current=") }.getOrNull()
        if (currentRating != null) {
            currentRating.whileSession(ratingValue)
        } else {
            // 4.10.23 stores the current rating as a long and inlines the getter.
            ratingStatsClass.methods.first { method ->
                method.name == "<init>" && method.parameterTypes.size == 9 &&
                    method.parameterTypes[0].toString() == "J"
            }.apply {
                addInstructions(
                    0,
                    """
                        invoke-static { p1, p2 }, $PUZZLES->currentRating(J)J
                        move-result-wide p1
                    """,
                )
            }
        }
        // The rating chip also needs stats, which guest mode gives as flowOf(null).
        val ratingStats = mutableClassDefBy(VIEW_MODEL).methods.singleOrNull { method ->
            method.parameterTypes.isEmpty() && method.annotations.any { annotation ->
                annotation.type == "Ldalvik/annotation/Signature;" && annotation.elements.any { element ->
                    (element.value as? ArrayEncodedValue)?.value?.any { (it as? StringEncodedValue)?.value == RATING_STATS } == true
                }
            }
        }
        // 4.10.23 no longer annotates the rating-stats getter; its chip falls back to guest mode.
        if (ratingStats != null) {
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
        }
        // The Puzzles tab's menu is PathRootMenuState(expanded, big button text, button above it,
        // buttons, ...). The button above is empty unless there is a next lesson. Ours takes the big
        // button and Solve Puzzles goes above it, or first in the menu's list when Next Lesson has the spot.
        mutableClassDefBy(PUZZLES_TAB).methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            val index = instructions.indexOfFirst { instruction ->
                val reference = instruction.methodReference
                instruction.opcode == Opcode.INVOKE_DIRECT_RANGE && reference != null && reference.name == "<init>" &&
                    reference.parameterTypes.size >= 7 && reference.parameterTypes[1] == "I" &&
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
