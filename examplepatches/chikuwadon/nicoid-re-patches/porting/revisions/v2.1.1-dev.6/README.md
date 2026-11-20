# nicoid Re v2.1.1-dev.6 — Mylist destinations and ambient card regression fix

## Diagnosed problems

- nicoid v6.49 classes.dex confirms i2.a(int, ArrayList DESTINATIONS, ArrayList SELECTED_VIDEOS, String source), with the x0 destination adapter drawing the FIRST ArrayList and native i2$c keeping that order
- dev.5 wrongly swapped these lists: regular Mylist folders were discarded and only the injected Watch Later destination remained
- dev.5 also restricted ambient backdrop wrapping to `darkBackground()`; native stateful backgrounds can look transparent when sampled outside the View, excluding black cards and even panels illuminated by dev.4

## Changes

- Correct both ArrayList roles in the destination chooser and authenticated native callback; retain source-folder filtering, Watch Later, and final confirmation after destination selection
- Restore ambient color composition on visible pager roots and all meaningful native background drawables, without classifying background color from a clone
- Composite light only in the BACKGROUND drawable stack, preserving foreground text, icons, and thumbnails
- Preserve the v2.1.0 Media3 baseline, existing preferences, defaults and all other reviewed hooks
- Source contract tests guard against accidental list-order and ambient-filter regressions

## Required physical device checks

1. In Mylist / Watch Later bulk selection, all actual destination Mylist folders and Watch Later appear; source folder excluded
2. After selecting a destination, confirmation shows the correct video count and folder; Cancel makes no changes; Move keeps data consistent after reload
3. Video info and comment tabs illuminate black cards in ambient mode with full-screen spread ON and OFF without painting over text or icons
4. Verify switching tabs, playback, Back, and ordinary playlists have no regression

Do not release to main, mutate issues, or treat CI success as real-device approval.
