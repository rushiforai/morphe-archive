package app.anghami.patches.player

import app.anghami.patches.player.LikeAnimIFingerprint
import app.anghami.patches.player.LikeAnimJFingerprint
import app.anghami.patches.player.LottieSetterFingerprint
import app.anghami.patches.player.ShareViewCtorFingerprint
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

/**
 * Player: normal-text share button.
 *
 * The share button is `AnimatedShareView`, which hardcodes white into two
 * `Paint`s in its constructor and draws the glyph itself. Straight-line
 * branch-free code at the end of `<init>` (v0-v1 dead before
 * `return-void`, no labels at all): resolve `primaryText`
 * (0x7f060598, theme text black day / light night) once, set both paints
 * unconditionally — normal text color in both modes, user call.
 *
 * (The like/save/download lotties need bytecode too: the
 * `app:lottie_colorFilter` XML attr only sticks to the FIRST composition —
 * every runtime animation swap (like-state, download progress) builds
 * fresh layers without it, leaving white glyphs in day mode. See
 * [LottieSetterFingerprint]: the accent filter is re-registered after
 * every set on the three player-scoped funnels. `app:tint` /
 * `ImageView.setColorFilter` stay no-ops on LottieDrawable — `S3/H`
 * just logs "Use addColorFilter instead." The download progress overlay
 * glyph is tinted separately via `backgroundTint` in the resource patch.)
 *
 * Label discipline (see fingerprints): inserted label references are only
 * correct at method index 0, so mid/end-method code must be branch-free.
 */
@Suppress("unused")
val playerActionIconsPatch = bytecodePatch(
    name = "Player: accent action icons",
    description = "Paints the share button with the normal theme text color (black day / white night) and keeps the like/download lotties on the primary accent (pink day / lime night, Monet dynamic) across animation swaps.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)
    category("Experimental")

    execute {
        // AnimatedShareView.<init> has .locals 5; v0-v1 are dead at the
        // end. Straight-line, no labels. primaryText id is stable
        // (res/values/public.xml).
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
                const v1, 0x7f060598
                invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I
                move-result v1
                iget-object v0, p0, Lcom/anghami/player/ui/AnimatedShareView;->k:Landroid/graphics/Paint;
                invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V
                iget-object v0, p0, Lcom/anghami/player/ui/AnimatedShareView;->l:Landroid/graphics/Paint;
                invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V
            """,
        )

        // Lottie re-tint: re-register the accent KeyPath("**") filter after
        // every animation set on the three player-scoped funnels (see
        // LottieSetterFingerprint). Branch-free, v0-v3 only (all dead at
        // each exit). j.c takes the view in p0, i.i/i.j in p1.
        val tintFor = { viewReg: String ->
            """
                move-object v0, $viewReg
                iget-object v1, v0, Lcom/airbnb/lottie/LottieAnimationView;->e:LS3/H;
                invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;
                move-result-object v2
                invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v2
                const v3, 0x7f06002f
                invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I
                move-result v2
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
