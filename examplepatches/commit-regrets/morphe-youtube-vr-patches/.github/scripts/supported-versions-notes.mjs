/**
 * semantic-release generateNotes plugin: appends the "Supported app versions" section to every
 * release's notes, stating plainly which YouTube VR builds this release patches -- the thing the
 * commit bullets only imply, and which releases that do not touch the version list never said.
 *
 * semantic-release concatenates every plugin's generateNotes output, and that concatenated text is
 * what lands in the GitHub release body, CHANGELOG.md, and patches-bundle.json's `description`
 * (which Morphe Desktop's "Patch notes" viewer renders) -- one plugin, all three places humans
 * read notes. It is wired in .releaserc.js directly after the release-notes-generator, so the
 * section sits at the bottom of the body.
 *
 * The versions are parsed from the checkout's Constants.kt (the single source, via
 * scripts/supported-versions.mjs) at generateNotes time, which is before `prepare`: the generated
 * patches-list.json would still be the previous release's file here, so it cannot be the source.
 */
import { CONSTANTS_FILE, parseTargets, renderSupportedVersionsSection, readSupportedVersionsFile } from '../../scripts/supported-versions.mjs';

export default {
  /**
   * `pluginConfig.file` overrides the Constants.kt path. Nothing in .releaserc.js sets it; it
   * exists so the test suite can run THIS module (the one the release runs) against a synthetic
   * Constants.kt instead of only the pure parser it wraps.
   */
  generateNotes: async (pluginConfig) =>
    renderSupportedVersionsSection(
      parseTargets(readSupportedVersionsFile(pluginConfig?.file ?? CONSTANTS_FILE))
    ),
};
