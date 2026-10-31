package app.ytvr.patches.sponsorblock

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.ytvr.patches.shared.Constants.COMPATIBILITY_YOUTUBE_VR

/**
 * The "Patch settings" hub and the SponsorBlock settings screen: the *resource* half of the
 * SponsorBlock patch, split out because of how Morphe patcher 2.x hosts decode resources.
 *
 * Patcher 2.x added hosts that decode resources **on request** (Desktop 2.x: "Decoding resources
 * on request, N files can be decoded") -- nothing exists under the decode tree until a resource
 * patch asks for it, and the final encode still compiles every decoded or edited file. A
 * *bytecode* patch reaching into the tree the way this bundle used to therefore finds an empty
 * directory there: measured 2026-10-30 on Desktop 1.20.0, where SponsorBlock failed with
 * "no settings preferences XML" on a real 1.88.10 run. [decode] below is the sanctioned trigger;
 * on a host that decoded everything up front (Manager 2.2.0 logs "Decoding all resources") it is
 * a no-op, so one code path serves both.
 *
 * The bytecode half ([sponsorBlockPatch], via [dependsOn]) mines the dead framework screen's xml
 * resource id and resolves the per-category behaviours -- the two things only bytecode access
 * produces -- and passes them through [PatchSettingsState]. Its own kdoc and
 * docs/INTERNALS.md carry the full history, including why the settings screens are XML edits at
 * all (R8 renames the androidx members; XML attributes carry no names).
 */
@Suppress("unused")
val patchSettingsPatch = resourcePatch(
    name = "Patch settings",
    description = "Builds the in-headset \"Patch settings\" hub and the SponsorBlock settings " +
        "screen. The resource half of the SponsorBlock patch, which mines what this patch " +
        "restructures the XML with.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_VR)
    dependsOn(sponsorBlockPatch)

    execute {
        val sbId = PatchSettingsState.screenXmlId ?: throw PatchException(
            "Patch settings: the SponsorBlock patch published no settings screen xml id -- " +
                "its execute did not run",
        )
        val behaviours = PatchSettingsState.behaviours ?: throw PatchException(
            "Patch settings: the SponsorBlock patch published no category behaviours",
        )

        // The decoded files this patch edits. The returned paths feed straight into `get`, which
        // hands out the real files under the patcher's decode tree -- where they already are,
        // because `decode` materialized them.
        val xmlPaths = decode("**/res/xml/*", "**/res/values/*")
        val resDirs = xmlPaths
            .map { get(it).parentFile.parentFile }
            .distinctBy { it.absolutePath }
            .sortedBy { it.absolutePath }
        if (resDirs.isEmpty()) {
            throw PatchException(
                "Patch settings: the app has no decodable res/xml files -- the settings screens " +
                    "would have nowhere to be written",
            )
        }
        restructureSettingsXmls(resDirs, sbId, behaviours)
        PatchSettingsState.restructured = true
    }
}
