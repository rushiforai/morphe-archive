package arpit.morphe.patches.movieboxtv.seekstep

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import arpit.morphe.patches.movieboxtv.shared.Constants.COMPATIBILITY_MOVIEBOX_TV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction12x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22s
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction23x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference

/**
 * Class holding the TV player's remote-control handling. Unlike the short R8 names of the
 * rest of the app, `com.transsion.tvplayer` keeps its real class names in this build.
 */
private const val TV_PLAYER_CONTROLLER = "Lcom/transsion/tvplayer/TvPlayerController;"

/** Builds the SPEED options of the player settings panel, where the seek chips are added. */
private const val FULL_SCREEN_FRAGMENT = "Lcom/transsion/tvui/fragment/FullScreenFragment;"

/** Builds the SPEED chips list (`h1()`). */
private const val SPEED_OPTIONS_BUILDER = "h1"

/** Hands the SPEED chips to the panel (`D1()`). */
private const val SPEED_OPTIONS_SETTER = "D1"

/** Handles a settings-panel selection (`w1(SettingType, SettingOption)`). */
private const val HANDLE_SETTING_SELECTED = "w1"

/** Chip model (`SettingOption`). */
private const val SETTING_OPTION = "Lcom/transsion/tvplayer/p;"

/** Extension helper that compares the stored step with a preset. */
private const val PLAY_INFO = "Larpit/morphe/extension/movieboxtv/PlayInfo;"

/** Handles the "Seek step" entry and the preset selection. */
private const val SEEK_UI = "Larpit/morphe/extension/movieboxtv/SeekUi;"

/** Classes used to clamp the stored step. */
private const val MMKV = "Lcom/tencent/mmkv/MMKV;"
private const val MMKV_OPEN = "B"
private const val CONFIG_ID = "tv_player_config"
private const val MMKV_GET_INT = "getInt"
private const val MMKV_PUT_INT = "p"

/** Stock jump of one press (10 s in 1.2.3.1113.03), stored as a single `const-wide/16` literal. */
private const val STOCK_STEP_MS = 10_000L

/** Both seek sites of the controller: the D-pad branch and the media-key branch. */
private const val SEEK_SITE_COUNT = 2

private const val DEFAULT_STEP_SECONDS = 300
private const val MIN_STEP_SECONDS = 1
private const val MAX_STEP_SECONDS = 3600

/** `tv_player_config` key holding the jump distance in seconds. */
private const val SEEK_STEP_KEY = "seek_step_seconds"

/** Padding of the chip labels: the leading "Seek " marks the options this patch owns. */
private const val CHIP_PREFIX = "Seek "

/** Presets offered as chips in the SPEED tab: label suffix and value in seconds. */
private val CHIP_PRESETS = listOf(
    "30s" to 30,
    "1m" to 60,
    "5m" to 300,
    "10m" to 600,
    "30m" to 1800,
)

/**
 * Scratch registers used by the injected remote-key lookup. Both seek methods have
 * `.registers 16` (`n`) and `.registers 9` (`q`), and only `v0`-`v2` plus the parameters are
 * live at the replaced instruction, so `v3`, `v4` and `v5` are free in both.
 */
private const val TEMP_OBJECT = 3
private const val TEMP_STRING = 4
private const val TEMP_INT = 5

/** Register that receives the computed step; the seek arithmetic adds/subtracts it below. */
private const val STEP_REGISTER = 2

/** Registers used by the injected SPEED-panel chips; `v9`-`v15` are free after the loop. */
private const val CHIP_INSTANCE = 9
private const val CHIP_LABEL = 10
private const val CHIP_VALUE = 11
private const val CHIP_SELECTED = 12

/** Registers v13/v14/v15 are the extra/premium/locked ctor params of the chip. */
private const val CHIP_EXTRA = 13
private const val CHIP_PREMIUM = 14
private const val CHIP_LOCKED = 15

/** Register holding the MMKV-read (and clamped) seek step in the SPEED builder. */
private const val STORED_STEP = 2

/** Register holding the ArrayList that collects the SPEED chips (`v3` in `h1`). */
private const val SPEED_LIST = 3

private fun methodReference(
    definingClass: String,
    name: String,
    returnType: String,
    vararg parameters: String,
) = ImmutableMethodReference(definingClass, name, parameters.toList(), returnType)

private fun invoke(
    opcode: Opcode,
    reference: ImmutableMethodReference,
    vararg registers: Int,
): BuilderInstruction {
    val filled = IntArray(5) { registers.getOrElse(it) { 0 } }
    return BuilderInstruction35c(
        opcode,
        registers.size,
        filled[0],
        filled[1],
        filled[2],
        filled[3],
        filled[4],
        reference,
    )
}

private val MMKV_OPEN_REF = methodReference(MMKV, MMKV_OPEN, MMKV, "Ljava/lang/String;")
private val MMKV_GET_INT_REF =
    methodReference(MMKV, MMKV_GET_INT, "I", "Ljava/lang/String;", "I")
private val IS_SELECTED_REF = methodReference(PLAY_INFO, "isSelected", "Z", "I", "I")
private val MATH_MAX = methodReference("Ljava/lang/Math;", "max", "I", "I", "I")
private val MATH_MIN = methodReference("Ljava/lang/Math;", "min", "I", "I", "I")

/**
 * `long step = min(3600, max(1, MMKV("tv_player_config").getInt("seek_step_seconds", fallback))) * 1000`
 * as bytecode, leaving the result in [STEP_REGISTER] as a wide value.
 *
 * Real builder instructions (not smali text) are required: the seeking methods contain a
 * `packed-switch` whose payload offset is only recomputed when the mutable method is rebuilt
 * through dexlib2. Injecting parsed smali text leaves that offset stale and breaks the switch.
 */
private fun seekStepLookup(fallbackSeconds: Int): List<BuilderInstruction> = listOf(
    BuilderInstruction21c(Opcode.CONST_STRING, TEMP_STRING, ImmutableStringReference(CONFIG_ID)),
    invoke(Opcode.INVOKE_STATIC, MMKV_OPEN_REF, TEMP_STRING),
    BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, TEMP_OBJECT),
    BuilderInstruction21c(Opcode.CONST_STRING, TEMP_STRING, ImmutableStringReference(SEEK_STEP_KEY)),
    BuilderInstruction21s(Opcode.CONST_16, TEMP_INT, fallbackSeconds),
    invoke(Opcode.INVOKE_VIRTUAL, MMKV_GET_INT_REF, TEMP_OBJECT, TEMP_STRING, TEMP_INT),
    BuilderInstruction11x(Opcode.MOVE_RESULT, TEMP_OBJECT),
    BuilderInstruction11n(Opcode.CONST_4, TEMP_INT, MIN_STEP_SECONDS),
    invoke(Opcode.INVOKE_STATIC, MATH_MAX, TEMP_OBJECT, TEMP_INT),
    BuilderInstruction11x(Opcode.MOVE_RESULT, TEMP_OBJECT),
    BuilderInstruction21s(Opcode.CONST_16, TEMP_INT, MAX_STEP_SECONDS),
    invoke(Opcode.INVOKE_STATIC, MATH_MIN, TEMP_OBJECT, TEMP_INT),
    BuilderInstruction11x(Opcode.MOVE_RESULT, TEMP_OBJECT),
    BuilderInstruction21s(Opcode.CONST_16, TEMP_INT, 1000),
    BuilderInstruction12x(Opcode.MUL_INT_2ADDR, TEMP_OBJECT, TEMP_INT),
    BuilderInstruction12x(Opcode.INT_TO_LONG, STEP_REGISTER, TEMP_OBJECT),
    // Padding: keeps the block at an even number of code units. The seeking methods end in a
    // `packed-switch` payload, which must stay 4-byte (even code unit) aligned; a block of odd
    // length shifts the payload by two bytes and the switch loses its table.
    BuilderInstruction10x(Opcode.NOP),
)

private val SETTING_OPTION_CTOR = methodReference(
    SETTING_OPTION,
    "<init>",
    "V",
    "Ljava/lang/String;",
    "Ljava/lang/String;",
    "Z",
    "I",
    "Z",
    "Z",
)

private val COLLECTION_ADD = methodReference("Ljava/util/Collection;", "add", "Z", "Ljava/lang/Object;")

/**
 * Pre-reads `MMKV("tv_player_config").getInt("seek_step_seconds", fallback)`, clamps to
 * 1-3600 and leaves the value in [STORED_STEP]. The loop iterator register `v2` holds the
 * `Iterator` and is dead once the loop ends.
 */
private fun storedStepLookup(fallbackSeconds: Int): List<BuilderInstruction> = listOf(
    BuilderInstruction21c(Opcode.CONST_STRING, CHIP_INSTANCE, ImmutableStringReference(CONFIG_ID)),
    invoke(Opcode.INVOKE_STATIC, MMKV_OPEN_REF, CHIP_INSTANCE),
    BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, CHIP_INSTANCE),
    BuilderInstruction21c(Opcode.CONST_STRING, CHIP_INSTANCE + 1, ImmutableStringReference(SEEK_STEP_KEY)),
    BuilderInstruction21s(Opcode.CONST_16, CHIP_INSTANCE + 2, fallbackSeconds),
    invoke(Opcode.INVOKE_VIRTUAL, MMKV_GET_INT_REF, CHIP_INSTANCE, CHIP_INSTANCE + 1, CHIP_INSTANCE + 2),
    BuilderInstruction11x(Opcode.MOVE_RESULT, STORED_STEP),
    BuilderInstruction11n(Opcode.CONST_4, CHIP_INSTANCE + 2, MIN_STEP_SECONDS),
    invoke(Opcode.INVOKE_STATIC, MATH_MAX, STORED_STEP, CHIP_INSTANCE + 2),
    BuilderInstruction11x(Opcode.MOVE_RESULT, STORED_STEP),
    BuilderInstruction21s(Opcode.CONST_16, CHIP_INSTANCE + 2, MAX_STEP_SECONDS),
    invoke(Opcode.INVOKE_STATIC, MATH_MIN, STORED_STEP, CHIP_INSTANCE + 2),
    BuilderInstruction11x(Opcode.MOVE_RESULT, STORED_STEP),
)

/**
 * SettingOption("Seek <suffix>", "<seconds>", stored == seconds, -1, false, false) appended
 * to the SPEED ArrayList ([SPEED_LIST]), with the MMKV read already in [STORED_STEP].
 *
 * `CMPEQ_INT` computes `stored == seconds`; the Z ctor parameter is non-zero = selected.
 */
private fun speedTabChips(): List<BuilderInstruction> {
    val instructions = mutableListOf<BuilderInstruction>()
    for ((suffix, seconds) in CHIP_PRESETS) {
        instructions += BuilderInstruction21c(
            Opcode.NEW_INSTANCE,
            CHIP_INSTANCE,
            ImmutableTypeReference(SETTING_OPTION),
        )
        instructions += BuilderInstruction21c(
            Opcode.CONST_STRING,
            CHIP_LABEL,
            ImmutableStringReference(CHIP_PREFIX + suffix),
        )
        instructions += BuilderInstruction21c(
            Opcode.CONST_STRING,
            CHIP_VALUE,
            ImmutableStringReference(seconds.toString()),
        )
        instructions += BuilderInstruction21s(Opcode.CONST_16, CHIP_EXTRA, seconds)
        instructions += invoke(Opcode.INVOKE_STATIC, IS_SELECTED_REF, STORED_STEP, CHIP_EXTRA)
        instructions += BuilderInstruction11x(Opcode.MOVE_RESULT, CHIP_SELECTED)
        instructions += BuilderInstruction11n(Opcode.CONST_4, CHIP_EXTRA, -1)
        instructions += BuilderInstruction11n(Opcode.CONST_4, CHIP_PREMIUM, 0)
        instructions += BuilderInstruction11n(Opcode.CONST_4, CHIP_LOCKED, 0)
        instructions += BuilderInstruction3rc(
            Opcode.INVOKE_DIRECT_RANGE,
            CHIP_INSTANCE,
            7,
            SETTING_OPTION_CTOR,
        )
        instructions += invoke(Opcode.INVOKE_INTERFACE, COLLECTION_ADD, SPEED_LIST, CHIP_INSTANCE)
    }
    return instructions
}

/**
 * Stores the preset picked in SPEED into MMKV. Runs before the original SPEED code can
 * misread the value as a playback speed; other options branch to the original handler.
 */
private fun speedTabSelectionHook(): String =
    """
        invoke-virtual/range { p2 .. p2 }, $SETTING_OPTION->d()Ljava/lang/String;
        move-result-object v0
        const-string v1, "$CHIP_PREFIX"
        invoke-virtual { v0, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :morphe_seek_original

        invoke-virtual/range { p2 .. p2 }, $SETTING_OPTION->e()Ljava/lang/String;
        move-result-object v0
        invoke-static { v0 }, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
        move-result v0
        const/4 v1, 0x1
        invoke-static { v0, v1 }, Ljava/lang/Math;->max(II)I
        move-result v0
        const/16 v1, 0xE10
        invoke-static { v0, v1 }, Ljava/lang/Math;->min(II)I
        move-result v0
        const-string v1, "$CONFIG_ID"
        invoke-static { v1 }, $MMKV->$MMKV_OPEN(Ljava/lang/String;)$MMKV
        move-result-object v1
        const-string v2, "$SEEK_STEP_KEY"
        invoke-virtual { v1, v2, v0 }, $MMKV->$MMKV_PUT_INT(Ljava/lang/String;I)Z
        return-void

        :morphe_seek_original
    """.trimIndent()

/**
 * Makes the left/right jump user-configurable from inside the app.
 *
 * The stock 10 s jump is rewritten at both seek sites of `TvPlayerController` to read the
 * current step from MMKV (`tv_player_config` / `seek_step_seconds`, 1-3600 s), so a long movie
 * no longer needs dozens of presses.
 *
 * The step is chosen in the player, in the SPEED tab, which already carries selectable rows.
 * Preset chips (`Seek 30s/1m/5m/10m/30m`) are appended to that tab's own ArrayList in `h1()`
 * with the selected flag read from MMKV, and a selection starting with "Seek " is intercepted
 * at the top of `w1(...)` before it can be parsed as a speed multiplier, stored in MMKV and
 * the handler returns without touching playback.
 */
@Suppress("unused")
val customSeekStepPatch = bytecodePatch(
    name = "Custom seek step",
    description = "Lets the seek distance of the player's left/right keys be set inside the app. " +
        "Applies to the D-pad and to the media rewind/fast-forward keys, and adds " +
        "\"Seek 30s/1m/5m/10m/30m\" choices to the SPEED tab of the player settings panel.",
) {
    compatibleWith(COMPATIBILITY_MOVIEBOX_TV)

    val seekStepSeconds by intOption(
        key = "seekStepSeconds",
        default = DEFAULT_STEP_SECONDS,
        title = "Default seek step (seconds)",
        description = "Used until a step is chosen in the player settings panel. " +
            "Default $DEFAULT_STEP_SECONDS (5 minutes), allowed $MIN_STEP_SECONDS-$MAX_STEP_SECONDS.",
    )

    execute {
        val fallbackSeconds = (seekStepSeconds ?: DEFAULT_STEP_SECONDS)
            .coerceIn(MIN_STEP_SECONDS, MAX_STEP_SECONDS)

        // 1. The two seek sites of the remote handling.
        val controller = mutableClassDefBy(TV_PLAYER_CONTROLLER)
        var patched = 0
        for (method in controller.methods) {
            val methodInstructions = method.instructions
            for (index in methodInstructions.indices.reversed()) {
                val literal = methodInstructions[index] as? WideLiteralInstruction ?: continue
                if (literal.wideLiteral != STOCK_STEP_MS) continue

                val register = (literal as OneRegisterInstruction).registerA
                if (register != STEP_REGISTER) {
                    throw PatchException(
                        "Unexpected seek-step register v$register in " +
                            "${method.name}${method.parameterTypes.joinToString(",", "(", ")")}.",
                    )
                }

                // Single-instruction edits only: the list-based replace/add helpers of the
                // patcher leave the `packed-switch` payload offset of these methods stale
                // (the switch then points at garbage and the player keys stop working).
                seekStepLookup(fallbackSeconds).forEachIndexed { offset, instruction ->
                    if (offset == 0) {
                        method.replaceInstruction(index, instruction)
                    } else {
                        method.addInstruction(index + offset, instruction)
                    }
                }
                patched++
            }
        }

        if (patched != SEEK_SITE_COUNT) {
            throw PatchException(
                "Expected $SEEK_SITE_COUNT seek-step constants in $TV_PLAYER_CONTROLLER, " +
                    "found $patched.",
            )
        }

        // 2. Seek chips in the SPEED tab: wrap the stock list at its only caller.
        //
        // `h1()` builds the speed list and its loop jumps straight to the return label, so
        // appending chips at the return would place them after the jump target. Wrapping the
        // list in `D1()` (the method that hands it to `setOptions(SPEED, ...)`) keeps the
        // builder untouched and the chips reachable.
        val fragment = mutableClassDefBy(FULL_SCREEN_FRAGMENT)
        val speedOptionsSetter = fragment.methods.firstOrNull { method ->
            method.name == SPEED_OPTIONS_SETTER && method.returnType == "V" &&
                method.parameterTypes.isEmpty()
        } ?: throw PatchException(
            "SPEED options setter not found in $FULL_SCREEN_FRAGMENT.",
        )

        val setterInstructions = speedOptionsSetter.instructions
        val speedBuilderIndex = setterInstructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == FULL_SCREEN_FRAGMENT &&
                reference.name == SPEED_OPTIONS_BUILDER
        }
        if (speedBuilderIndex < 0) {
            throw PatchException("SPEED options builder call not found in $FULL_SCREEN_FRAGMENT.")
        }
        val speedListResult = setterInstructions.getOrNull(speedBuilderIndex + 1)
        val speedListRegister = (speedListResult as? OneRegisterInstruction)?.registerA
        if (speedListResult == null || speedListResult.opcode != Opcode.MOVE_RESULT_OBJECT ||
            speedListRegister == null
        ) {
            throw PatchException(
                "Unexpected SPEED options setter at the builder call: " +
                    "${speedListResult?.opcode} v$speedListRegister.",
            )
        }
        speedOptionsSetter.addInstructions(
            speedBuilderIndex + 2,
            """
                invoke-static { v$speedListRegister }, $PLAY_INFO->withSeekEntry(Ljava/util/List;)Ljava/util/List;
                move-result-object v$speedListRegister
            """.trimIndent(),
        )

        // 3. Selecting a seek chip stores the new step instead of changing the playback speed.
        val speedSelection = fragment.methods.firstOrNull { method ->
            method.name == HANDLE_SETTING_SELECTED && method.returnType == "V" &&
                method.parameterTypes.map { it.toString() } ==
                listOf(
                    "Lcom/transsion/tvplayer/TvPlayerSettingsPanel\$SettingType;",
                    "Lcom/transsion/tvplayer/p;",
                )
        } ?: throw PatchException(
            "Setting-selection handler not found in $FULL_SCREEN_FRAGMENT.",
        )

        speedSelection.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                move-object/from16 v1, p1
                move-object/from16 v2, p2
                invoke-static { v0, v1, v2 }, $SEEK_UI->handle(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :morphe_seek_original
                return-void
                :morphe_seek_original
            """.trimIndent(),
        )
    }
}
