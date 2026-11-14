package app.hushmessenger.patches.controls

/**
 * Catalog-wide totals the tests check, kept in one place so a new control changes one file. They're set by hand on
 * purpose: a control that drops out or a hook set that changes size has to show up here as a failing test.
 */
internal object ExpectedTotals {
    /** Settings controls, each its own patch. */
    const val CONTROLS = 88
    /** Controls whose description sends people to HushMessenger settings > Controls. */
    const val DIRECTED_CONTROLS = 87
    /** Controls declared through controlPatch, whose injection HookInjectionReplayTest replays on the real builds. */
    const val REPLAYED_CONTROLS = 83
    /** Hook methods per 587 build, armv7 and the 347415280 family included. Three of them read the emoji drawer flag (586: seven). */
    const val HOOKS_587 = 279
    /** The complete synthetic discovery fixture, one method per expected hook. */
    const val DISCOVERY_FIXTURE_HOOKS = 265
}
