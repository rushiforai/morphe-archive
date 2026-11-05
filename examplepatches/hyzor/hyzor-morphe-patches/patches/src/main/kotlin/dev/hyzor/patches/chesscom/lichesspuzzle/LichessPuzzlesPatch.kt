package dev.hyzor.patches.chesscom.lichesspuzzle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import dev.hyzor.patches.chesscom.misc.settings.settingsPatch
import dev.hyzor.patches.chesscom.shared.Constants
import dev.hyzor.patches.chesscom.shared.markFeaturePatched
import dev.hyzor.patches.chesscom.shared.returnString
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PUZZLES = "${Constants.EXTENSION_PACKAGE}/lichesspuzzle/LichessPuzzles;"
private const val SETTINGS_COMBINE =
    "Lcom/chess/features/settings/puzzles/PuzzlesSettingsViewModel\$special\$\$inlined\$combine\$1\$1\$1;"
// The Classic puzzle layout: the state the rating box reads, its rating graph and the
// graph's points. The constructor parameter lists identify them, not the short names.
private const val CLASSIC_STATE = "Lcom/chess/features/puzzles/rated/ui/h0\$a;"
private const val RATING_HISTORY = "Lcom/chess/features/puzzles/rated/ui/l;"
private const val RATING_POINT = "Lcom/chess/features/puzzles/rated/ui/m;"
private const val PUZZLES_TAB = "Lcom/chess/features/puzzles/home/ui/HomePuzzlePathRootContentKt;"
private const val BUTTON_SIZE = "Lcom/chess/palette/core/style/ButtonSize;"
private const val MENU_LISTENER = "Lcom/chess/palette/components/menu/a;"
private const val BIG_BUTTON_CLICK =
    "Lcom/chess/palette/components/menu/PathRootMenuKt\$PathRootMenu\$4\$6\$4\$primaryCtaButton\$1\$1\$1;"
private const val PUZZLES_MENU_SCREEN = "Lcom/chess/features/puzzles/home/"
private const val MODE = "Lcom/chess/navigationinterface/PathPuzzlesMode;"
private const val SOURCE = "Lcom/chess/features/puzzles/db/model/ProblemSource;"
private const val SOLUTION = "Lcom/chess/features/puzzles/db/model/m;"
private const val TACTICS_PROBLEM = "Lcom/chess/net/model/TacticsProblem;"
private const val PATH_RESULT = "Lchesscom/puzzles/v1/PuzzlePathResult;"
private const val RATING = "Lchesscom/puzzles/v1/Rating;"
private const val API_EXCEPTION = "Lcom/chess/net/errors/ApiException;"
private const val SETTINGS_LOADED = "Lcom/chess/features/puzzles/rated/t\$l0;"
private const val PUZZLE_SETTINGS = "Lcom/chess/features/puzzles/rated/api/PuzzleSettings;"
private const val PATH_STATS = "Lcom/chess/features/path/ui/o2;"
private const val RATING_STATS = "Lcom/chess/features/puzzles/db/model/o;"
private const val STATS_LOADED = "Lcom/chess/features/puzzles/rated/t\$q0;"
private const val VIEW_MODEL = "Lcom/chess/features/puzzles/rated/RatedPuzzlesGameViewModel;"
private const val PATH_REPOSITORY = "Lcom/chess/features/path/data/PathProgressRepositoryImpl;"
private const val PUZZLE_SERVICE = "Lcom/chess/features/puzzles/api/h;"
private const val HUB_STATE = "Lcom/chess/features/puzzles/home/ui/o0;"
private const val HUB_PATH = "Lcom/chess/features/puzzles/home/ui/q0;"
private const val HUB_USER = "Lcom/chess/features/puzzles/home/ui/p0;"
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
        val listeners = findListeners(PUZZLES_MENU_SCREEN)
        val listener = mutableClassDefBy(
            listeners.singleOrNull() ?: throw PatchException("The Puzzles tab listener was not found: $listeners"),
        )
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
        // public fields at runtime, so the listener's own layout does not need separate smali.
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

        // The next button: chess.com would fetch a rated puzzle from its server and hit the free
        // daily limit; during a session the extension reopens the Lichess flow instead.
        val onNext = mutableClassDefBy(VIEW_MODEL).methods.singleOrNull { method ->
            method.parameterTypes.map(CharSequence::toString) == listOf("J") && method.returnType == "V" &&
                method.implementation?.instructions?.any { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type
                        ?.contains("onNextClicked\$2") == true
                } == true
        } ?: throw PatchException("The puzzle next button was not found")
        onNext.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $PUZZLES->onNext()Z
                move-result v0
                if-eqz v0, :morphe_next
                return-void
            """,
            ExternalLabel("morphe_next", onNext.getInstruction(0)),
        )

        val guestSource = enumField(SOURCE, "RATED_GUEST")

        // The repository is obfuscated: the class that converts guest tactics problems into rows,
        // as chess.com's own guest refill does, is the one to hook.
        val repository = mutableClassDefBy(classDefByOrNull { classDef ->
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
        // The refill above is only called by Home for real guests, and the guest flow itself is
        // inlined into the view model, so seed the store from the view model instead.
        val guestFlow =
            "Lcom/chess/internal/puzzles/RatedPuzzleRepositoryImpl\$nextGuestProblem\$\$inlined\$flatMapLatest\$1;"
        val repositoryType = mutableClassDefByOrNull(guestFlow)
            ?.fields?.firstOrNull { it.name == "this\$0" }?.type
            ?: throw PatchException("The guest puzzle repository was not found")
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

        // Keep the hub's map and XP on the pre-session values while Lichess closes: the guest
        // path and user data would otherwise jump the map to puzzle 1. The state carries
        // (…, path, user, …) at positions 5 and 6.
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
        hookHubState(HUB_STATE, HUB_PATH, HUB_USER, arity = 13, pathIndex = 5, userIndex = 6)

        val score: MutableMethod = repository.methods.singleOrNull { method ->
            method.parameterTypes.size == 4 && method.parameterTypes[0].toString() == "Ljava/util/List;" &&
                method.parameterTypes[1].toString() == SOLUTION && method.parameterTypes[2].toString() == "Z"
        } ?: throw PatchException("The solution scoring was not found")
        val scoreCode = score.implementation!!.instructions.toList()
        fun constructed(parameters: List<String>) = scoreCode.firstNotNullOfOrNull { instruction ->
            instruction.methodReference?.takeIf { reference ->
                reference.name == "<init>" &&
                    reference.parameterTypes.map(CharSequence::toString) == parameters
            }?.definingClass
        } ?: throw PatchException("Nothing in the scoring is made from $parameters")
        name("resultClass", constructed(listOf(SOLUTION, "Ljava/lang/Object;")).javaName())
        name("scoreClass", constructed(listOf(PATH_RESULT, RATING, API_EXCEPTION)).javaName())
        val logged = scoreCode.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "Scoring puzzle "
        }
        // "Scoring puzzle " + solution.problemId() + " exceeded ...": the id is read just before.
        val problemId = scoreCode.take(logged.coerceAtLeast(0)).lastOrNull { instruction ->
            instruction.fieldReference?.let { it.definingClass == SOLUTION && it.type == "J" } == true
        }?.takeIf { logged >= 0 } ?: throw PatchException("The solution's problem id was not found")
        name("problemIdField", problemId.fieldReference!!.name)
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
        // The puzzle flow reads "is_guest_mode_started" inline. A fresh account has it false, so
        // the guest screen ends before the Lichess puzzles arrive; treat it as started while a
        // session is active.
        //
        // The methods are found on the immutable classes, and only the classes that get a hook are
        // made mutable: making one mutable rewrites that class into a new DEX file, so doing it while
        // scanning every class of the app (this scan visits all of them) costs hundreds of MB.
        val guestStartedUsers = mutableListOf<Pair<String, Method>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions ?: return@forEach
                if (instructions.none { instruction ->
                        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "is_guest_mode_started"
                    }
                ) return@forEach
                guestStartedUsers += classDef.type to method
            }
        }
        var guestStartedHooks = 0
        guestStartedUsers.forEach { (type, user) ->
            mutableClassDefBy(type).methods.first { method ->
                method.name == user.name && method.parameterTypes == user.parameterTypes &&
                    method.returnType == user.returnType
            }.apply {
                val snapshot = instructions.toList()
                snapshot.indices.filter { index ->
                    val instruction = snapshot[index]
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    instruction.opcode == Opcode.INVOKE_STATIC &&
                        reference?.definingClass == "Lcom/chess/utils/android/preferences/f;" &&
                        reference.name == "a" && reference.returnType == "Z" &&
                        snapshot.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT
                }.sortedDescending().forEach { index ->
                    val register = (snapshot[index + 1] as OneRegisterInstruction).registerA
                    addInstructions(
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
        if (guestStartedHooks == 0) throw PatchException("The guest started check was not found")
        val regularMode = enumField(MODE, "REGULAR")
        mutableClassDefBy(MODE).methods.single { it.parameterTypes.isEmpty() && it.returnType == "Z" }
            .whileSession("const/4 v0, 0x0\nreturn v0")
        val settingsLoaded = mutableClassDefBy(SETTINGS_LOADED)
        // The mode getter is inlined, so set the constructor's mode instead.
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
        val puzzleSettings = mutableClassDefBy(PUZZLE_SETTINGS)
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
        val pathStats = mutableClassDefBy(PATH_STATS)
        // The getter is inlined; userRating is the second constructor parameter.
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

        // The Classic layout needs path stats, which guest mode never loads.
        val statsLoaded = mutableClassDefBy(STATS_LOADED)
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
        // The current getter is inlined. The constructor is (JIIIIIJII): the first long is
        // user_id, the first int is current, so hook the int, not the long.
        ratingStatsClass.methods.first { method ->
            method.name == "<init>" && method.parameterTypes.size == 9 &&
                method.parameterTypes[0].toString() == "J" &&
                method.parameterTypes[1].toString() == "I"
        }.apply {
            addInstructions(
                0,
                "invoke-static { p3 }, $PUZZLES->currentRating(I)I\nmove-result p3",
            )
        }
        // The stats event carries the rating summary. Guest stats have none (the flow emits
        // null), so the Classic rating box is never built even though path stats were filled
        // above. Supply an empty summary during a session; its constructor above sets current.
        val statsEvent = statsLoaded.methods.singleOrNull { method ->
            method.name == "<init>" && method.parameterTypes.size == 3 &&
                method.parameterTypes[1].toString() == RATING_STATS
        } ?: throw PatchException("The puzzle stats event was not found")
        statsEvent.addInstructions(
            0,
            """
                invoke-static { p2 }, $PUZZLES->ratingStats(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p2
                check-cast p2, $RATING_STATS
            """,
        )
        // The Classic box's rating comes from the path stats captured when the session started,
        // and its graph from chess.com's rating history. Show the live Lichess rating instead
        // (the queue fix makes the screen serve Lichess puzzles), and drop the foreign graph.
        val classicState = mutableClassDefBy(CLASSIC_STATE).methods.singleOrNull { method ->
            // (timer, rating, ratingChange, ratingHistory): the hook reads p2, so only the two
            // ints after the timer and the graph's type have to be what it expects.
            val parameters = method.parameterTypes.map(CharSequence::toString)
            method.name == "<init>" && parameters.size == 4 &&
                parameters[1] == "I" && parameters[2] == "I" && parameters[3] == RATING_HISTORY
        } ?: throw PatchException("The Classic puzzle layout's state was not found")
        classicState.addInstructions(0, "invoke-static { p2 }, $PUZZLES->displayRating(I)I\nmove-result p2")
        val ratingGraph = mutableClassDefBy(RATING_HISTORY).methods.singleOrNull { method ->
            method.name == "<init>" && method.parameterTypes.map(CharSequence::toString) ==
                listOf(RATING_POINT, "Ljava/util/List;", "I")
        } ?: throw PatchException("The puzzle rating graph's constructor was not found")
        ratingGraph.addInstructions(
            0,
            """
                invoke-static { p1 }, $PUZZLES->liveRatingPoint(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p1
                check-cast p1, $RATING_POINT
                invoke-static { p2 }, $PUZZLES->ratingHistory(Ljava/util/List;)Ljava/util/List;
                move-result-object p2
            """,
        )
        // "Always Show Rating" only drives the Path layout and the submitted rated mode, and a
        // Lichess session forces the Classic layout with points off, so the row would do nothing
        // in the puzzle screen's dialog. Drop it from the list while the session is on screen.
        mutableClassDefByOrNull(SETTINGS_COMBINE)?.let { settings ->
            fun Instruction.handsOffSettingsList(): Boolean {
                val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
                return opcode == Opcode.INVOKE_INTERFACE &&
                    reference.definingClass == "Lcom/google/android/vb6;" && reference.name == "j"
            }
            val emit = settings.methods.firstOrNull { method ->
                method.returnType == "Ljava/lang/Object;" &&
                    method.implementation?.instructions?.any { it.handsOffSettingsList() } == true
            } ?: return@let
            val handoff = emit.implementation!!.instructions.indexOfFirst { it.handsOffSettingsList() }
            if (handoff < 0) return@let
            // The settings list is the hand-off's last argument: three register operands, the
            // list in the third. A different shape leaves this cosmetic filter out rather than
            // hooking a register that may hold something else.
            val invoke = emit.getInstruction(handoff) as? FiveRegisterInstruction ?: return@let
            if (invoke.registerCount != 3) return@let
            val list = "v${invoke.registerE}"
            emit.addInstructions(
                handoff,
                "invoke-static/range { $list .. $list }, $PUZZLES->withoutUnusedSettings(Ljava/util/List;)Ljava/util/List;\n" +
                    "move-result-object $list",
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
