"use strict";

const MARKER = "<!-- dap-release-branding:v1 -->";
const REPOSITORY = "johnneerdael/dutch-applications-patches";
const GUIDE = "https://morphe-patches.neerdael.nl/en/";

function renderNotes(notes, context) {
  if (notes.startsWith(`${MARKER}\n`)) return notes;

  const repository = context.env?.GITHUB_REPOSITORY || REPOSITORY;
  const { version, gitHead } = context.nextRelease;
  if (!/^[a-f0-9]{40}(?:[a-f0-9]{24})?$/i.test(gitHead || "")) {
    throw new Error("Release branding requires the full source commit, never a mutable ref.");
  }
  if (!/^[a-z0-9][a-z0-9_.-]*\/[a-z0-9][a-z0-9_.-]*$/i.test(repository)) {
    throw new Error("Release branding requires an owner/repository GitHub repository name.");
  }

  const prerelease = version.split("+", 1)[0].includes("-");
  const channel = prerelease ? "Development prerelease" : "Stable release";
  const banner = `https://raw.githubusercontent.com/${repository}/${gitHead}/docs/site/assets/brand/release-banner.png`;
  const source = `https://github.com/${repository}/commit/${gitHead}`;
  return [
    MARKER,
    `![Dutch App Patches. Dutch apps. Your choices.](${banner})`,
    "",
    `**${channel} · patch bundle v${version}.**`,
    "",
    `[Add to Morphe](https://morphe.software/add-source?github=${REPOSITORY}) · [User guide](${GUIDE})`,
    "",
    `Source: [${gitHead.slice(0, 12)}](${source}). Check each app's target versions in the user guide before patching.`,
    "",
    "---",
    "",
    notes,
  ].join("\n");
}

async function generateNotes(pluginConfig, context) {
  // semantic-release joins every generateNotes return. Delegate here instead of
  // adding a second generator that would return the previous notes a second time.
  // Regeneration after a prepare commit must start from commits, not nextRelease.notes.
  const generator = await import("@semantic-release/release-notes-generator");
  const notes = await generator.generateNotes(pluginConfig, context);
  return renderNotes(notes, context);
}

module.exports = { generateNotes, renderNotes };
