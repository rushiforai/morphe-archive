package app.ytvr.patches.sponsorblock

/**
 * What [sponsorBlockPatch] mines and [patchSettingsPatch] consumes.
 *
 * The settings screens' XML restructuring has to run in a *resource* patch since Morphe patcher
 * 2.x: hosts like Desktop 2.x decode resources on request, so nothing exists under the decode
 * tree until a resource patch asks for it, and a bytecode patch reaching into the tree -- how
 * this used to work -- finds nothing (measured 2026-10-30). The resource half therefore lives in
 * [patchSettingsPatch], and the two halves pass state here: the bytecode patch mines the dead
 * framework screen's xml resource id and resolves the per-category behaviours from its options,
 * both of which only bytecode access can produce.
 *
 * [dependsOn][app.morphe.patcher.patch.PatchBuilder.dependsOn] orders the pair, so a null here
 * means the dependency did not run -- which the resource patch reports rather than guessing.
 */
internal object PatchSettingsState {
    /** The dead framework screen's `res/xml` resource id, mined from the app's bytecode. */
    var screenXmlId: Int? = null

    /** The per-category behaviour tokens, resolved from the SponsorBlock patch's options. */
    var behaviours: Map<String, String>? = null

    /**
     * Set by [patchSettingsPatch] once the settings screens' XML is actually restructured.
     * SponsorBlock's finalize reads it as the disable-coupling guard: its hub wiring points at
     * screens only this flag proves were filled, so a run where the Patch settings patch was
     * disabled or failed must not ship silently degraded.
     */
    var restructured: Boolean = false
}
