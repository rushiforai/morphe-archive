# Random Episode

Patch ID: `random-episode`.

Adds `Morphe > Detail Page > Enable Per-Show Random Playback`, defaulting to On when no global preference has been stored. The global switch controls whether the feature is available without deleting any saved per-show choices.

On an eligible series detail page, short-press the shuffle action to make random playback persistent for that show. Its selected state indicates that the show is in random mode. When there is no in-progress episode, enabling it immediately changes Play to the selected random episode. That episode remains fixed while the same detail visit opens a trailer or source selection; returning Home ends the visit, and entering the detail page again selects another episode when alternatives exist. Disabling it immediately restores Nuvio's native oldest-unwatched Play target. An in-progress episode always keeps `Resume Sx Ey` and takes priority over random selection.

Long-press the shuffle action to open `Episodes included`, where the show can use `All` aired regular episodes or `Unwatched only`. Choosing either option also enables random playback when it was off; dismissing the dialog with Back changes neither setting. Partially watched episodes remain eligible in the latter mode. Both the toggle and episode pool are stored independently for every show.

With a show enabled, an incomplete Continue Watching card is the Resume source of truth: the detail label, normal Play and Play long-press all use that card's exact episode. Completed cards and stale native Resume values at the 90% threshold are ignored. If the user removes that Continue Watching session and Nuvio changes the detail action from Resume to Play Next, the patch discards its cached Resume authority; enabling random then shows Play with a random episode instead of restoring the removed session. Explicit episode clicks and Continue Watching resume the requested episode first, then continue randomly. Random playback uses Nuvio's native resume, progress, watched-state, Trakt and Simkl paths. The detail toggle and Continue Watching marker both use the same Material shuffle symbol. The marker is a 20 dp white circle with a dark foreground icon and native-style shadow, positioned at an 8 dp top-left inset.

When an enabled show has a Home `Next Up` card rather than an incomplete Resume card, the card displays one random episode for that Home visit. Recomposition, focus movement and ordinary Home redraws retain that episode; leaving through detail and returning to Home draws another when alternatives exist. The card action plays the exact displayed episode. Selection uses the show's independent `All` or `Unwatched only` pool, and an exhausted Unwatched-only card is omitted. This reuses Nuvio's already-loaded Home episode summary and performs no extra provider or metadata request. Resume cards are never randomized.

If Nuvio would normally classify that show's Next Up episode as an unreleased `Upcoming` card, enabling random rewrites it to an aired eligible episode before Home divides the sections. The random card therefore appears in Continue Watching and the false Upcoming entry disappears. Disabling random restores the original native Upcoming episode immediately, including after a cold Home reconstruction; the displayed random card is never moved into Upcoming.

`All` uses a shuffled bag so episodes do not repeat until the eligible pool is exhausted. `Unwatched only` excludes completed episodes and stops when no eligible unwatched episode remains. Movies, specials, invalid episode coordinates, future releases and shows without random mode enabled are unchanged.

## Credit

The original Random Episode settings and feature implementation were created by [**DeclanSC**](https://github.com/DeclanSC). This Morphe patch ports that work to NuvioTV 0.9.0-beta's current binary structure.
