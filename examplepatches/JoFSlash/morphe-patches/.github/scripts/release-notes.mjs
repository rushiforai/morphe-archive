// Semantic-release plugin: makes the release notes from the commits, like
// @semantic-release/release-notes-generator (and with its options).
//
// - The commits of the Booking.com and Google Health repositories that were merged into this one
//   (November 2026) are left out: they were released there already, and listing them again would
//   bury the release's own changes.
// - When .github/release-notes/v<version>.md exists, its hand-written text goes first, under the
//   generated heading, followed by the list of commits.
import { execFileSync } from "node:child_process";
import { readFile } from "node:fs/promises";
import path from "node:path";
import { generateNotes as generateFromCommits } from "@semantic-release/release-notes-generator";

// The last commit of each merged repository's own history.
const IMPORTED = /^build: Move the (Booking\.com|Google Health) patches into their own folders/;

function importedCommits(cwd) {
  const git = (...args) => execFileSync("git", args, { cwd, encoding: "utf8" });
  const tips = git("log", "--all", "--format=%H %s")
    .split("\n")
    .filter((line) => IMPORTED.test(line.slice(41)))
    .map((line) => line.slice(0, 40));
  if (tips.length === 0) return new Set();
  return new Set(git("rev-list", ...tips).split("\n").filter(Boolean));
}

export async function generateNotes(pluginConfig, context) {
  const imported = importedCommits(context.cwd);
  const commits = context.commits.filter((c) => !imported.has(c.hash));
  if (commits.length !== context.commits.length) {
    context.logger.log("Leaving out %d commits of the merged repositories", context.commits.length - commits.length);
  }
  const notes = await generateFromCommits(pluginConfig, { ...context, commits });
  const file = path.join(context.cwd, ".github", "release-notes", `v${context.nextRelease.version}.md`);
  let written;
  try {
    written = await readFile(file, "utf8");
  } catch {
    return notes;
  }
  context.logger.log("Using the release notes in %s", file);
  const [heading, ...rest] = notes.split("\n");
  const generated = rest.join("\n").trim();
  return `${heading}\n\n${written.replace(/\r\n/g, "\n").trim()}\n${generated ? `\n${generated}\n` : ""}`;
}
