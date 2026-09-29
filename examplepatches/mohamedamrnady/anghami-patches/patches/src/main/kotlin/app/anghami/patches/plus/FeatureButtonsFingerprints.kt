package app.anghami.patches.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall

/**
 * Upsell feature-button targets (Anghami 8.0.28, verified in base.apk smali).
 *
 * Used by the "Hide upsell feature buttons" patch. Each hides through the
 * app's own visibility branch, so no empty cells or layout gaps remain:
 * - Player TRY SING ALONG + song-row karaoke buttons:
 *   `Account.isShowKaraokeUpsellButton()` (trivial getter on the server
 *   `showKaraokeUpsellButton` flag) feeds player/ui/l.Q0() (M0 container
 *   GONE) and y8/a.onCreateViewHolder -> F8/X(SongViewHolder).j(song)
 *   (row karaoke view GONE). The karaoke FEATURE (isCanUseKaraoke) is a
 *   separate gate, untouched.
 * - Player AI MIX switch + label: U0() shows G0/H0 only when the queue is
 *   automix-eligible AND `Account.showMixAIButtonPlayer` is true; the
 *   single iget is swapped to const/4 so the branch falls to GONE.
 * - Playlist AI MIX button: the client creates the automix_button section
 *   itself in Q.l(songSections), gated on the server flag
 *   Account.showMixAIButtonPlaylist() (sole reader; call sites are the P5/h
 *   playlist data path and k5/g feed sections). Forcing the flag false
 *   means the section is never created — no model, no gap, Epoxy-safe.
 *   Deliberately NOT removed in the S8/i Epoxy adapter funnel (model
 *   list-surgery at submit raced layout and crashed P5/b on 2026-09-28).
 */

object KaraokeUpsellButtonFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "isShowKaraokeUpsellButton",
    // NOTE: no accessFlags; class + name + signature pin it.
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/local/Account;->showKaraokeUpsellButton:Z"
        ),
    )
)

object PlayerAutomixSwitchFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/player/ui/l;",
    name = "U0",
    // NOTE: no accessFlags; single U0()V def in this class. The automix
    // eligibility call pins the right method.
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/odin/automix/a;",
            name = "a",
        ),
    )
)

object MixAIButtonPlaylistFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "showMixAIButtonPlaylist",
    // NOTE: no accessFlags; class + name + signature pin it. The body does
    // NOT read the field directly (it delegates via getBooleanAttribute +
    // a shared C2/d callable), so filter on that call instead — a field
    // filter matches nothing here and the hook silently lands nowhere.
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/ghost/local/Account;",
            name = "getBooleanAttribute",
        ),
    )
)
