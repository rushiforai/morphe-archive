package app.hushmessenger.patches.controls

/**
 * Catalog-wide totals the tests check, kept in one place so a new control changes one file. They're set by hand on
 * purpose: a control that drops out or a hook set that changes size has to show up here as a failing test.
 */
internal object ExpectedTotals {
    /** Settings controls, each its own patch. */
    const val CONTROLS = 37
    /** Controls whose description sends people to the home screen icon's Patch controls shortcut. */
    const val DIRECTED_CONTROLS = 36
    /** Hook methods per 580 build, and per 581 build, which reads the emoji drawer flag in eight places where 580 has two. */
    const val HOOKS_580 = 119
    const val HOOKS_581 = 125
    /** The complete synthetic discovery fixture, one method per expected hook. */
    const val DISCOVERY_FIXTURE_HOOKS = 119
}
