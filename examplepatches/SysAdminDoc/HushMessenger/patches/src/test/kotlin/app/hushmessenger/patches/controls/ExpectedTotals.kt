package app.hushmessenger.patches.controls

/**
 * Catalog-wide totals the tests check, kept in one place so a new control changes one file. They're set by hand on
 * purpose: a control that drops out or a hook set that changes size has to show up here as a failing test.
 */
internal object ExpectedTotals {
    /** Settings controls, each its own patch. */
    const val CONTROLS = 83
    /** Controls whose description sends people to HushMessenger settings > Controls. */
    const val DIRECTED_CONTROLS = 82
    /** Controls declared through controlPatch, whose injection HookInjectionReplayTest replays on the real builds. */
    const val REPLAYED_CONTROLS = 78
    /** Hook methods per 586 build. Seven of them read the emoji drawer flag and one the search icon flag (585: six and five). */
    const val HOOKS_586 = 265
    /**
     * Hook methods in 347215273, 347215275 and 347215277. Their Redex pass inlined the emoji drawer flag into one reader
     * and split the Roboto font lookup into three.
     */
    const val HOOKS_586_FAMILY_B = 261
    /** The complete synthetic discovery fixture, one method per expected hook. */
    const val DISCOVERY_FIXTURE_HOOKS = 254
}
