package app.hushmessenger.patches.controls

/**
 * Catalog-wide totals the tests check, kept in one place so a new control changes one file. They're set by hand on
 * purpose: a control that drops out or a hook set that changes size has to show up here as a failing test.
 */
internal object ExpectedTotals {
    /** Settings controls, each its own patch. */
    const val CONTROLS = 59
    /** Controls whose description sends people to HushMessenger settings > Controls. */
    const val DIRECTED_CONTROLS = 58
    /** Controls declared through controlPatch, whose injection HookInjectionReplayTest replays on the real builds. */
    const val REPLAYED_CONTROLS = 54
    /** Hook methods per 584 build. Four of them read the emoji drawer flag. */
    const val HOOKS_584 = 199
    /** The complete synthetic discovery fixture, one method per expected hook. */
    const val DISCOVERY_FIXTURE_HOOKS = 192
}
