package app.anghami.patches.player

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall

/**
 * Player theme-background targets (Anghami 8.0.28, verified in base.apk smali).
 *
 * Used by the "Player theme background" patch.
 *
 * Cover-art tint — `com.anghami.player.ui.l.L0()V` (PlayerFragment, the
 * `SongViewHolder` sibling that owns `layout_player`) is the ONE place the
 * player's background is coloured from the current song:
 *
 *   Song.hexColor  (server-supplied per-song hex, `Song.smali:310`)
 *     -> g9/i.s(Context, k9/g, String hexColor, int default, callback)
 *        (`g9/i.smali:1016`) which either `Color.parseColor`s it or, when
 *        it is empty, extracts the dominant colour from the cover bitmap
 *        (`g9/i.f` -> `g9/h`, the "Falling back to default grayDark"
 *        error path) and then runs
 *        `view.setBackgroundColor(colour)`
 *        (`g9/i.smali:3557-3570`) on `p0` = `player/ui/d.e` — the inflated
 *        `layout_player` root.
 *     -> the disposable is stored in `player/ui/l.n`.
 *
 * `L0()` has 3 call sites (`l.smali:1447 / 4250 / 7002`) and is the only
 * caller of `g9/i.s` in the player; the other caller is `V5/c` (an
 * unrelated `app/base/r` screen), which is why the hook is placed here
 * rather than in `g9/i.s` itself.
 *
 * The patch removes ONLY the `g9/i.s(...)` call + its `move-result-object`
 * and substitutes `const/4 v0, 0x0`, so `player/ui/l.n` is set to null
 * (its `if-eqz` dispose guard already handles that) and the rest of
 * `L0()` — the TimeSpentTracker bookkeeping after `:cond_1` — still runs.
 */
object PlayerCoverTintFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/player/ui/l;",
    name = "L0",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lg9/i;",
            name = "s",
        ),
        fieldAccess(
            smali = "Lcom/anghami/player/ui/l;->n:Lvd/b;"
        ),
    )
)

/**
 * Queue-row white-text target (Anghami 8.0.28, verified in base.apk smali).
 *
 * Used by the "Player: readable queue in day mode" patch.
 *
 * The queue list (`fragment_player_feed`'s `recycler_view`, rows are
 * `item_row.xml` bound through `RowModel\$RowViewHolder`) reuses the app's
 * generic song-row machinery, including its dark-surface support: the
 * player feed adapter (`S8/i`, flag `.p=true` set by `playerfeed/c.a0`)
 * propagates `ModelConfiguration.isInverseColors=true` into every queue
 * `SongRowModel`, and `RowModel\$RowViewHolder.inverseColors()` then paints
 * title + subtitle `@color/white` plus white action icons. That was
 * correct when the player background was always the dark cover color, but
 * with the cover tint removed the day-mode player background is light, so
 * unselected rows render white-on-light-grey and are unreadable (the
 * selected row keeps its white card + dark text and stays fine).
 *
 * The patch prepends a uiMode night check that returns early in day mode,
 * so rows keep their theme colors (`primaryText`/`secondaryText`, dark in
 * day mode); night mode falls through to the original white-text path,
 * which is still correct on the dark player background. Prepending at
 * index 0 is register-safe: `.locals 3` means v0-v2 are all dead at
 * method entry.
 *
 * Scope note: holders with their own `inverseColors()` override
 * (mastheads, library links, free-user/grid queue cards, store carousels)
 * do NOT route through this method and are untouched. What changes in day
 * mode is exactly the set of plain-`RowModel` rows bound with the inverse
 * flag — overwhelmingly the player queue, which is the screen this patch
 * exists for. If some other day-mode screen ever shows plain rows on a
 * dark surface with the flag set, those rows would go dark-on-dark; no
 * such screen is known (all other inverse users bring dark image/card
 * backgrounds with dedicated holders).
 */
object QueueRowInverseFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/base/RowModel\$RowViewHolder;",
    name = "inverseColors",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/model/adapter/base/RowModel\$RowViewHolder;->titleTextView:Landroid/widget/TextView;"
        ),
        methodCall(
            definingClass = "Landroid/widget/TextView;",
            name = "setTextColor",
        ),
    )
)

/**
 * Queue-row bind target (Anghami 8.0.28, verified in base.apk smali).
 *
 * The `inverseColors()` no-op (see above) only covers the Epoxy
 * `inverseColorsOnce()` path. The white is repainted on EVERY bind by
 * `RowModel._bind` (computes the `textColor` field also re-applied by
 * `setNotPlaying()`), `SongRowModel.removeSongHighlight()` (title/
 * subtitle/icons after `super._bind` — this is what kept UNSELECTED rows
 * white while the current-song row used fixed `setSongHighlight()`
 * colors), `updatePlayState()` (equalizer) and `getImageConfiguration()`
 * (dark placeholder). All of them read the same model field, and
 * `SongRowModel._bind` calls `super` first, so forcing the field to false
 * once at the entry of `RowModel._bind` in day mode fixes every
 * downstream read on that instance (night leaves it untouched).
 * Prepended at index 0 with a single register (v0, dead at entry):
 * mid-method label references assemble to chunk-relative offsets (Morphe
 * bug that crashed h0 with VerifyError), so no mid-method branches.
 */
object RowModelBindFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/base/RowModel;",
    name = "_bind",
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/base/RowModel\$RowViewHolder;"),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/model/adapter/base/ConfigurableModelWithHolder;->isInverseColors:Z"
        ),
    )
)

/**
 * Player song-update target (Anghami 8.0.28, verified in base.apk smali).
 *
 * `com.anghami.player.ui.l.U0()` runs on every song/state update and owns
 * the like/save/download visibility block (`l.smali:4040-4130`, fields
 * `v`/`x`/`z`) plus the like-state sync (`i.g()`). Currently UNUSED by
 * any patch (the lottie tint moved to the `app:lottie_colorFilter`
 * resource attr after `setColorFilter` proved a no-op on
 * LottieDrawable); kept as a documented hook for per-song player work.
 */
object PlayerSongUpdateFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/player/ui/l;",
    name = "U0",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/player/ui/l;->v:Lcom/airbnb/lottie/LottieAnimationView;"
        ),
        fieldAccess(
            smali = "Lcom/anghami/player/ui/l;->z:Lcom/airbnb/lottie/LottieAnimationView;"
        ),
    )
)

/**
 * Day-mode action-icon targets (Anghami 8.0.28, verified in base.apk).
 *
 * - Like/save/download are `LottieAnimationView`s (fields `v`/`x`/`z`),
 *   tinted via the `app:lottie_colorFilter` resource attr (ctor registers
 *   a persistent KeyPath("**") filter; `app:tint`/`setColorFilter` are
 *   no-ops because `S3/H.setColorFilter` just logs "Use addColorFilter
 *   instead."). State is carried by animation file + visibility, never
 *   by color, so tinting is state-safe.
 * - Share is `AnimatedShareView`, which hardcodes white (`-0x1`) into two
 *   `Paint`s in its constructor (`k` line/arrow paint,
 *   `l` fill paint; the ONLY `setColor` calls in the class) and draws the
 *   glyph itself in `onDraw`: hooked branch-free at the end of `<init>`
 *   (`primaryText` resolved once, both paints set unconditionally).
 */
object ShareViewCtorFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/player/ui/AnimatedShareView;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;"),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/player/ui/AnimatedShareView;->k:Landroid/graphics/Paint;"
        ),
        methodCall(
            definingClass = "Landroid/graphics/Paint;",
            name = "setColor",
        ),
    )
)

/**
 * Lottie re-tint funnels (Anghami 8.0.28, verified in base.apk smali).
 *
 * The `app:lottie_colorFilter` XML attr only sticks to the FIRST
 * composition: `LottieAnimationView.<init>` registers the KeyPath("**")
 * filter on the drawable (`LottieAnimationView.smali:792-805`, queued in
 * `S3/H.g` while no composition is loaded), but every later
 * `setComposition` builds fresh layers without it. The player swaps
 * animations on every state change, so like/download render white
 * (invisible in day mode) in steady state:
 *
 * - `com.anghami.player.ui.j.c(view, comp, resId)` (static): the download
 *   funnel — called only from the download controller (`e`, `e$b`) with
 *   preloaded compositions (synchronous `setComposition`).
 * - `com.anghami.player.ui.i.i(view)` / `j(view)`: the like/save funnel —
 *   sync `setComposition` when the preloaded comp (`e`/`g` fields) exists,
 *   async `setAnimation(String)` first load.
 *
 * All three are player-scoped (no karaoke/onboarding lottie passes
 * through them), so no view-id gating is needed. Appends are branch-free
 * (Morphe label rule) before every `return-void`, re-registering the
 * accent filter exactly like the ctor does (PorterDuff SRC_ATOP KeyPath
 * "**" via `LS3/V` + `bugsnag/android/X` + `S3/H.a`). Register-safe: only
 * v0-v3 are touched and all are dead at each exit (locals + dead params).
 */
object LottieSetterFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/player/ui/j;",
    name = "c",
    returnType = "V",
    parameters = listOf(
        "Lcom/airbnb/lottie/LottieAnimationView;",
        "LS3/j;",
        "I",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/airbnb/lottie/LottieAnimationView;",
            name = "setAnimation",
        ),
        methodCall(
            definingClass = "Lcom/airbnb/lottie/LottieAnimationView;",
            name = "setProgress",
        ),
    )
)

object LikeAnimIFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/player/ui/i;",
    name = "i",
    returnType = "V",
    parameters = listOf("Lcom/airbnb/lottie/LottieAnimationView;"),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/player/ui/i;->e:LS3/j;"
        ),
        methodCall(
            definingClass = "Lcom/airbnb/lottie/LottieAnimationView;",
            name = "setComposition",
        ),
    )
)

object LikeAnimJFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/player/ui/i;",
    name = "j",
    returnType = "V",
    parameters = listOf("Lcom/airbnb/lottie/LottieAnimationView;"),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/player/ui/i;->g:LS3/j;"
        ),
        methodCall(
            definingClass = "Lcom/airbnb/lottie/LottieAnimationView;",
            name = "setComposition",
        ),
    )
)
/**
 * Queue pill-colors target (Anghami 8.0.28, verified in base.apk smali).
 *
 * `com.anghami.app.playerfeed.c.m0(c$d, Bundle)` (onViewHolderCreated)
 * overwrites BOTH pill buttons' `AnghamiButton.b` models AFTER inflation
 * with `g(bg=black_20_transparent, text=white, border=null, icon)` and
 * calls `d()` — which is why the XML `app:textColor` never survived
 * (white text on the light day background; border=null means "don't touch
 * the stroke", so the XML border is what you see). The `const white`
 * feeds both the text int and the icon tint and the `const
 * black_20_transparent` feeds the wash background, so two const swaps
 * (white → primaryText, wash → window_background_color) fix text + icons + bg
 * in both modes. No labels, no branches.
 */
object QueuePillColorsFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/app/playerfeed/c;",
    name = "m0",
    returnType = "V",
    parameters = listOf("Lcom/anghami/app/playerfeed/c\$d;", "Landroid/os/Bundle;"),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/pablo/anghami_ui/AnghamiButton;->b:Ln8/g;"
        ),
        methodCall(
            definingClass = "Lcom/anghami/pablo/anghami_ui/AnghamiButton;",
            name = "d",
        ),
    )
)

/**
 * Now-playing highlight target (Anghami 8.0.28, verified in base.apk).
 *
 * `SongRowModel.setSongHighlight()` paints the playing row: title +
 * subtitle via `getColor(dark_3)` (near-black — invisible on the dark
 * night player), drag/delete icons via `setIconTintResource(dark_3)`,
 * equalizer via `setBarColor(dark_3)` (res id; it self-resolves via
 * `ContextCompat`), video badge via `getColor(dark_3)` tint, and the row
 * wash via `getColor(song_row_highlight_color)` (`#b3ffffff` — the ugly
 * light-grey band in night mode). One shared `const v1, 0x7f060117`, so
 * a single const swap to `app_color` recolors everything to the primary
 * accent in both modes; the wash is zeroed to transparent.
 */
object SongHighlightFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/SongRowModel;",
    name = "setSongHighlight",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/model/adapter/SongRowModel;->shouldHighlightRow:Z"
        ),
        methodCall(
            definingClass = "Lcom/anghami/ui/view/EqualizerView;",
            name = "setBarColor",
        ),
    )
)

/**
 * Unselected-row target (Anghami 8.0.28, verified in base.apk smali).
 *
 * `SongRowModel.removeSongHighlight()` repaints highlight-capable but
 * currently-unselected rows: title via `getColor(app_color)` when NOT
 * inverse (pink title on white day background), white when inverse
 * (night). One shared `const v2, 0x7f06002f` also feeds the drag/delete
 * icon tints via `move v1,v2`, so a single const swap to `primaryText`
 * returns unselected titles + icons to theme text in day mode while ONLY
 * the playing row (setSongHighlight) carries the accent. Night keeps
 * stock white; subtitle (`secondaryText`), equalizer
 * (`equalizer_bar_app_color`) and video badge (`grey_75_to_91`) stay.
 */
object RemoveHighlightFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/SongRowModel;",
    name = "removeSongHighlight",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/model/adapter/SongRowModel;->shouldHighlightRow:Z"
        ),
        methodCall(
            definingClass = "Lcom/anghami/ui/view/EqualizerView;",
            name = "setBarColor",
        ),
    )
)
