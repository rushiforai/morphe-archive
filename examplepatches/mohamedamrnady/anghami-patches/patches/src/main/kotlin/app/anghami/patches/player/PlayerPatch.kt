package app.anghami.patches.player

import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31i
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private const val NIGHT_GATE_HOLDER = "Lcom/anghami/player/ui/l;"
private const val NIGHT_TEXT_FIELD = "playerNightText"
private const val NIGHT_BG_FIELD = "playerNightBg"
private const val NIGHT_HL_FIELD = "playerNightHl"
private const val NIGHT_RM_FIELD = "playerNightRm"
private const val NIGHT_WASH_FIELD = "playerNightWash"

/**
 * Player theme (single toggle): all player bytecode work in one patch.
 *
 * Night mode only. In day (light) mode the player is stock: the cover-art
 * tint runs untouched and every chrome/queue/highlight color below keeps
 * its stock value — the original player experience. At night the patch
 * removes the tint and recolors the player with the primary accent. It
 * `dependsOn` the "Player theme background" resource patch, whose day
 * roles resolve to the stock dark-player values, so the shared layouts
 * render stock in day and themed at night with no layout branching.
 * (A single Patch object cannot cover both dex and resources:
 * morphe-patcher 1.14.1 exposes only `bytecodePatch` / `resourcePatch` /
 * `rawResourcePatch`, and `BytecodePatchContext` has no resource access.)
 *
 * How the night-gating works (no mid-method branches anywhere):
 *
 * - Cover-art tint (`player/ui/l.L0()`): an index-0 uiMode prepend. Day
 *   jumps over the stub to the stock tint path; night falls into the stub,
 *   which disposes the old tint, clears the cell and returns before the
 *   `g9/i.s(...)` call. Hooked in
 *   `L0()`, not in `g9/i.s`, because `g9/i.s` has a second caller
 *   (`V5/c`) that must keep its theming; ad pages (`F8/n`, `F8/Y`) force
 *   their own black root and are untouched. Lesson: `invoke-static/range`
 *   is dex format 3rc, not 35c — match via `ReferenceInstruction`, never
 *   a 35c cast.
 * - Pill/highlight consts (`playerfeed/c.m0`, `setSongHighlight`,
 *   `removeSongHighlight`): the stock color IDs are replaced with `sget`s
 *   of static int fields on the player fragment. Each hosting method
 *   computes day/night at entry (label-free uiMode arithmetic, registers
 *   dead at index 0) and `sput`s the right ID, so the mid-method swap is
 *   a single branch-free instruction. The highlight wash keeps its
 *   getColor-stripping shape, but the zeroed const is now a mode-aware
 *   color int (stock wash in day, transparent at night).
 * - Action icons (`AnimatedShareView.<init>`, lottie funnels
 *   `player/ui/j.c`, `player/ui/i.i/j`): the appended blocks resolve the
 *   night color and select white in day with branch-free arithmetic
 *   (day white is the literal -0x1, no second lookup), so the appends
 *   stay label-free at the method exits.
 * - Queue rows: stock in both modes (white inverse rows on the dark
 *   backgrounds). No hooks.
 *
 * Label discipline (Morphe bug that cost a device round trip): inserted
 * label references assemble to chunk-relative offsets — correct only at
 * method index 0, silently corrupt anywhere else (proven with `dexdump`:
 * a branch at dex pc `0x39C` targeted `0x1D`, `VerifyError` on launch).
 * The L0 stub is the only inserted branch and sits at index 0; everything
 * else is branch-free. All touched methods were validated with `dexdump`
 * before install.
 */
@Suppress("unused")
val playerPatch = bytecodePatch(
    name = "Player theme",
    description = "Night-only player theme: removes the cover-art tint and paints the now-playing row, pills and action icons with the primary accent at night; day mode keeps the stock tinted player. Pulls in 'Player theme background' resources.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)
    category("Experimental")
    dependsOn(playerThemePatch)

    execute {
        // --- 0. Night-gate cells (must exist before any sput/sget refs). ---
        val holder = mutableClassDefBy(NIGHT_GATE_HOLDER)
        for (name in listOf(
            NIGHT_TEXT_FIELD,
            NIGHT_BG_FIELD,
            NIGHT_HL_FIELD,
            NIGHT_RM_FIELD,
            NIGHT_WASH_FIELD,
        )) {
            check(holder.staticFields.none { it.name == name }) {
                "night-gate field $name already present on $NIGHT_GATE_HOLDER"
            }
            holder.staticFields.add(
                MutableField(
                    ImmutableField(
                        NIGHT_GATE_HOLDER,
                        name,
                        "I",
                        0x9, // PUBLIC | STATIC
                        null,
                        emptyList(),
                        emptySet(),
                    ),
                ),
            )
        }

        // --- 1. Cover-art tint: night-only removal in PlayerFragment.L0. ---
        // Day (uiMode != night) jumps over the stub to the stock tint path
        // (cond_0 block + g9/i.s range-invoke intact); night falls into the
        // stub, which clears the cell and returns. v0-v1 are dead at entry
        // (.locals 6); p0 is preserved. NOTE: if-nez jumps when NONZERO,
        // if-eqz jumps when ZERO — the null guard below must use if-eqz.
        PlayerCoverTintFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/anghami/player/ui/d;->e:Landroid/view/View;
                invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
                move-result-object v0
                iget v0, v0, Landroid/content/res/Configuration;->uiMode:I
                and-int/lit8 v0, v0, 0x30
                const/16 v1, 0x20
                if-ne v0, v1, :player_day_stock
                iget-object v0, p0, Lcom/anghami/player/ui/l;->n:Lvd/b;
                if-eqz v0, :player_night_clear
                invoke-interface {v0}, Lvd/b;->dispose()V
                :player_night_clear
                const/4 v0, 0x0
                iput-object v0, p0, Lcom/anghami/player/ui/l;->n:Lvd/b;
                return-void
                :player_day_stock
            """,
        )

        // --- 2. Queue rows: stock in both modes (no hooks). ---
        // Both backgrounds are dark again (day tint, night theme), so the
        // stock white inverse rows read correctly everywhere.

        // --- 3. Accent now-playing + pills (night-gated const swaps). ---
        // m0 (.locals 7): v0-v2 dead at entry. isDay via branch-free
        // arithmetic (1 day, 0 night); IDs picked as NIGHT + isDay * DIFF.
        QueuePillColorsFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
                move-result-object v0
                iget v0, v0, Landroid/content/res/Configuration;->uiMode:I
                and-int/lit8 v0, v0, 0x30
                xor-int/lit8 v1, v0, 0x20
                neg-int v0, v1
                or-int v0, v0, v1
                ushr-int/lit8 v0, v0, 0x1f
                const v1, 0x7f060598
                const v2, -0x39a
                mul-int v2, v0, v2
                add-int v1, v1, v2
                sput v1, Lcom/anghami/player/ui/l;->playerNightText:I
                const v1, 0x7f060679
                const v2, -0x633
                mul-int v2, v0, v2
                add-int v1, v1, v2
                sput v1, Lcom/anghami/player/ui/l;->playerNightBg:I
            """,
        )
        // Pills: white -> nightText (primaryText at night, white in day),
        // grey wash -> nightBg (theme bg at night, black_20 in day).
        val m0 = QueuePillColorsFingerprint.method
        val m0Insns = m0.implementation!!.instructions
        val whiteConsts = m0Insns.mapIndexedNotNull { index, ins ->
            if (ins.opcode == Opcode.CONST &&
                (ins as? Instruction31i)?.narrowLiteral == 0x7f0601fe
            ) {
                index
            } else {
                null
            }
        }
        check(whiteConsts.size == 1) {
            "expected exactly 1 white const in playerfeed/c.m0, found ${whiteConsts.size}"
        }
        m0.replaceInstructions(
            whiteConsts[0],
            "sget v1, $NIGHT_GATE_HOLDER->$NIGHT_TEXT_FIELD:I",
        )
        val pillBgConsts = m0.implementation!!.instructions.mapIndexedNotNull { index, ins ->
            if (ins.opcode == Opcode.CONST &&
                (ins as? Instruction31i)?.narrowLiteral == 0x7f060046
            ) {
                index
            } else {
                null
            }
        }
        check(pillBgConsts.size == 1) {
            "expected exactly 1 black_20 const in playerfeed/c.m0, found ${pillBgConsts.size}"
        }
        m0.replaceInstructions(
            pillBgConsts[0],
            "sget v0, $NIGHT_GATE_HOLDER->$NIGHT_BG_FIELD:I",
        )

        // Now-playing (.locals 3): v0-v2 dead at entry. Same label-free
        // gate; the wash cell holds the resolved color int (stock wash in
        // day, transparent at night), so the getColor-stripping below stays
        // valid in both modes.
        SongHighlightFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Lcom/anghami/model/adapter/base/ConfigurableModelWithHolder;->getContext()Landroid/content/Context;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
                move-result-object v0
                iget v0, v0, Landroid/content/res/Configuration;->uiMode:I
                and-int/lit8 v0, v0, 0x30
                xor-int/lit8 v1, v0, 0x20
                neg-int v0, v1
                or-int v0, v0, v1
                ushr-int/lit8 v0, v0, 0x1f
                const v1, 0x7f06002f
                const v2, 0xe8
                mul-int v2, v0, v2
                add-int v1, v1, v2
                sput v1, Lcom/anghami/player/ui/l;->playerNightHl:I
                const v1, 0x7f06060b
                invoke-direct {p0, v1}, Lcom/anghami/model/adapter/SongRowModel;->getColor(I)I
                move-result v1
                mul-int v1, v1, v0
                sput v1, Lcom/anghami/player/ui/l;->playerNightWash:I
            """,
        )
        // Now-playing: dark_3 -> nightHl (app_color at night, dark_3 day).
        val hl = SongHighlightFingerprint.method
        val hlInsns = hl.implementation!!.instructions
        val darkConsts = hlInsns.mapIndexedNotNull { index, ins ->
            if (ins.opcode == Opcode.CONST &&
                (ins as? Instruction31i)?.narrowLiteral == 0x7f060117
            ) {
                index
            } else {
                null
            }
        }
        check(darkConsts.size == 1) {
            "expected exactly 1 dark_3 const in setSongHighlight, found ${darkConsts.size}"
        }
        hl.replaceInstructions(
            darkConsts[0],
            "sget v1, $NIGHT_GATE_HOLDER->$NIGHT_HL_FIELD:I",
        )

        // Unselected rows (.locals 4): v0-v2 dead at entry. app_color ->
        // nightRm (primaryText at night, app_color in day).
        RemoveHighlightFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Lcom/anghami/model/adapter/base/ConfigurableModelWithHolder;->getContext()Landroid/content/Context;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
                move-result-object v0
                iget v0, v0, Landroid/content/res/Configuration;->uiMode:I
                and-int/lit8 v0, v0, 0x30
                xor-int/lit8 v1, v0, 0x20
                neg-int v0, v1
                or-int v0, v0, v1
                ushr-int/lit8 v0, v0, 0x1f
                const v1, 0x7f060598
                const v2, -0x569
                mul-int v2, v0, v2
                add-int v1, v1, v2
                sput v1, Lcom/anghami/player/ui/l;->playerNightRm:I
            """,
        )
        val rm = RemoveHighlightFingerprint.method
        val rmInsns = rm.implementation!!.instructions
        val appConsts = rmInsns.mapIndexedNotNull { index, ins ->
            if (ins.opcode == Opcode.CONST &&
                (ins as? Instruction31i)?.narrowLiteral == 0x7f06002f
            ) {
                index
            } else {
                null
            }
        }
        check(appConsts.size == 1) {
            "expected exactly 1 app_color const in removeSongHighlight, found ${appConsts.size}"
        }
        rm.replaceInstructions(
            appConsts[0],
            "sget v2, $NIGHT_GATE_HOLDER->$NIGHT_RM_FIELD:I",
        )

        // Equalizer: nothing to do. `setBarColor(I)` resolves the id
        // itself via `ContextCompat.getColor` (proven by the
        // `NotFoundException` a resolved color caused), so the gated swap
        // above already gives it accent bars at night and stock bars in
        // day. Just assert the call site.
        val barCalls = hlInsns.mapIndexedNotNull { index, ins ->
            val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
            if (ref?.definingClass == "Lcom/anghami/ui/view/EqualizerView;" &&
                ref.name == "setBarColor"
            ) {
                index
            } else {
                null
            }
        }
        check(barCalls.size == 1) {
            "expected exactly 1 EqualizerView.setBarColor in setSongHighlight, found ${barCalls.size}"
        }

        // Highlight wash: song_row_highlight_color -> nightWash int.
        // Sequence: const v1, <wash>; getColor; move-result v1;
        // setBackgroundColor. Zero the resolve in both modes (the cell
        // already holds the right int) and load the cell instead. The
        // entry prepend above contains its own wash-id const for the day
        // resolve, so the scan requires the stock setBackgroundColor tail
        // (INVOKE_VIRTUAL) to pick the stock site.
        val washConsts = hl.implementation!!.instructions.mapIndexedNotNull { index, ins ->
            if (ins.opcode == Opcode.CONST &&
                (ins as? Instruction31i)?.narrowLiteral == 0x7f06060b
            ) {
                index
            } else {
                null
            }
        }
        val washStock = washConsts.filter { index ->
            val insns = hl.implementation!!.instructions
            index + 3 < insns.size && insns[index + 3].opcode == Opcode.INVOKE_VIRTUAL
        }
        check(washStock.size == 1) {
            "expected exactly 1 stock highlight-wash const in setSongHighlight, found ${washStock.size} (all wash consts: $washConsts)"
        }
        val washIndex = washStock[0]
        val afterWash = hl.implementation!!.instructions
        check(afterWash[washIndex + 1].opcode == Opcode.INVOKE_DIRECT &&
            afterWash[washIndex + 2].opcode == Opcode.MOVE_RESULT) {
            "expected getColor + move-result after wash const, found " +
                "${afterWash[washIndex + 1].opcode} / ${afterWash[washIndex + 2].opcode}"
        }
        hl.removeInstruction(washIndex + 2)
        hl.removeInstruction(washIndex + 1)
        hl.replaceInstructions(
            washIndex,
            "sget v1, $NIGHT_GATE_HOLDER->$NIGHT_WASH_FIELD:I",
        )

        // --- 4. Action icons (branch-free appends at exits). ---
        // AnimatedShareView.<init> has .locals 5; v0-v2 are dead at the
        // end. Straight-line, no labels. Day paints resolve to white
        // (-0x1, the stock hardcoded value); night resolves primaryText.
        val ctor = ShareViewCtorFingerprint.method
        val ctorInsns = ctor.implementation!!.instructions
        check(ctorInsns.last().opcode == Opcode.RETURN_VOID) {
            "AnimatedShareView.<init> does not end with return-void; refusing to append"
        }
        ctor.addInstructions(
            ctorInsns.size - 1,
            """
                invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v0
                move-object v2, v0
                invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
                move-result-object v0
                iget v0, v0, Landroid/content/res/Configuration;->uiMode:I
                and-int/lit8 v0, v0, 0x30
                xor-int/lit8 v1, v0, 0x20
                neg-int v0, v1
                or-int v0, v0, v1
                ushr-int/lit8 v0, v0, 0x1f
                const v1, 0x7f060598
                invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getColor(I)I
                move-result v1
                const v2, -0x1
                sub-int v2, v2, v1
                mul-int v2, v2, v0
                add-int v1, v1, v2
                iget-object v0, p0, Lcom/anghami/player/ui/AnimatedShareView;->k:Landroid/graphics/Paint;
                invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V
                iget-object v0, p0, Lcom/anghami/player/ui/AnimatedShareView;->l:Landroid/graphics/Paint;
                invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V
            """,
        )

        // Lottie re-tint: re-register the KeyPath("**") filter after every
        // animation set on the three player-scoped funnels (see
        // LottieSetterFingerprint). Branch-free, v0-v3 only (all dead at
        // each exit, per the proven appends). Night filter is the accent;
        // day resolves to white (-0x1 literal, no second lookup).
        // j.c takes the view in p0, i.i/i.j in p1.
        val tintFor = { viewReg: String ->
            """
                move-object v0, $viewReg
                iget-object v1, v0, Lcom/airbnb/lottie/LottieAnimationView;->e:LS3/H;
                invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v0
                move-object v2, v0
                invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
                move-result-object v0
                iget v0, v0, Landroid/content/res/Configuration;->uiMode:I
                and-int/lit8 v0, v0, 0x30
                xor-int/lit8 v3, v0, 0x20
                neg-int v0, v3
                or-int v0, v0, v3
                ushr-int/lit8 v0, v0, 0x1f
                const v3, 0x7f06002f
                invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I
                move-result v3
                const v2, -0x1
                sub-int v2, v2, v3
                mul-int v2, v2, v0
                add-int v2, v3, v2
                sget-object v3, Landroid/graphics/PorterDuff${'$'}Mode;->SRC_ATOP:Landroid/graphics/PorterDuff${'$'}Mode;
                new-instance v0, LS3/V;
                invoke-direct {v0, v2, v3}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff${'$'}Mode;)V
                new-instance v2, Lcom/bugsnag/android/X;
                invoke-direct {v2, v0}, Lcom/bugsnag/android/X;-><init>(LS3/V;)V
                const-string v0, "**"
                filled-new-array {v0}, [Ljava/lang/String;
                move-result-object v0
                new-instance v3, LY3/e;
                invoke-direct {v3, v0}, LY3/e;-><init>([Ljava/lang/String;)V
                sget-object v0, LS3/N;->F:Landroid/graphics/ColorFilter;
                invoke-virtual {v1, v3, v0, v2}, LS3/H;->a(LY3/e;Landroid/graphics/ColorFilter;Lcom/bugsnag/android/X;)V
            """
        }
        val jSetter = LottieSetterFingerprint.method
        val jReturns = jSetter.implementation!!.instructions.mapIndexedNotNull { index, ins ->
            if (ins.opcode == Opcode.RETURN_VOID) index else null
        }
        check(jReturns.size == 1) {
            "expected exactly 1 return in player/ui/j.c, found ${jReturns.size}"
        }
        jSetter.addInstructions(jReturns[0], tintFor("p0"))

        for (fp in listOf(LikeAnimIFingerprint, LikeAnimJFingerprint)) {
            val m = fp.method
            val returns = m.implementation!!.instructions.mapIndexedNotNull { index, ins ->
                if (ins.opcode == Opcode.RETURN_VOID) index else null
            }
            check(returns.size == 2) {
                "expected exactly 2 returns in like-anim ${m}, found ${returns.size}"
            }
            // Descending so the lower index stays valid.
            for (index in returns.sortedDescending()) {
                m.addInstructions(index, tintFor("p1"))
            }
        }
    }
}
