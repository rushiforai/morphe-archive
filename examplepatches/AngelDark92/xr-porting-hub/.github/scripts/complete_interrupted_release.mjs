#!/usr/bin/env node
/**
 * Finish a release that semantic-release tagged but could not annotate.
 *
 * semantic-release creates the release commit, pushes it, creates and pushes the
 * tag, and then pushes refs/notes/semantic-release-<tag>. GitHub can reject that
 * last, small push with "(missing necessary objects)" while the objects from the
 * preceding pushes are still replicating. semantic-release stops at that point,
 * before @semantic-release/github publishes, so the tag is left without a
 * release. The build produced by prepareCmd is already on disk.
 *
 * This script retries only the notes push, then runs the configured
 * @semantic-release/github publish hook with the notes recorded in the release
 * commit. It does not rebuild the bundle and does not rewrite pushed history.
 * Any other failure leaves the job failed.
 */

import { execFileSync } from "node:child_process";
import { appendFileSync, existsSync, readFileSync } from "node:fs";
import { createRequire } from "node:module";
import { relative, resolve } from "node:path";
import { setTimeout as sleep } from "node:timers/promises";
import { publish } from "@semantic-release/github";

const require = createRequire(import.meta.url);
const { resolveReleaseArtifact } = require("./resolve_release_artifact.cjs");

const TAG_PREFIX = "v";
const NOTE_PREFIX = "semantic-release";
const NOTE_AUTHOR = ["-c", "user.name=semantic-release-bot", "-c", "user.email=semantic-release-bot@martynus.net"];
const RETRY_DELAYS_MS = [5_000, 15_000, 30_000, 60_000];
const VISIBILITY_DELAYS_MS = [2_000, 5_000, 10_000, 15_000];

function fail(message) {
  // Throw instead of process.exit() so Actions can flush the ::error:: line;
  // the top-level catch prints it and sets a failing exit code.
  throw new Error(message);
}

function info(message) {
  console.log(message);
}

function gitResult(args) {
  try {
    const stdout = execFileSync("git", args, {
      encoding: "utf8",
      stdio: ["ignore", "pipe", "pipe"],
    }).trim();
    return { ok: true, stdout, stderr: "" };
  } catch (error) {
    return {
      ok: false,
      stdout: "",
      stderr: error.stderr ? String(error.stderr).trim() : String(error.message),
    };
  }
}

function git(args) {
  const result = gitResult(args);
  if (!result.ok) {
    throw new Error(`git ${args.join(" ")} failed: ${result.stderr}`);
  }
  return result.stdout;
}

function githubHeaders(token) {
  return {
    accept: "application/vnd.github+json",
    authorization: `Bearer ${token}`,
    "user-agent": "xr-porting-hub-release-recovery",
    "x-github-api-version": "2022-11-28",
  };
}

function apiUrl() {
  return (process.env.GITHUB_API_URL || "https://api.github.com").replace(/\/+$/, "");
}

async function waitForRemoteSha(ref, expectedSha, label) {
  let last = "ref not found";
  for (let attempt = 0; attempt <= VISIBILITY_DELAYS_MS.length; attempt += 1) {
    const result = gitResult(["ls-remote", "origin", ref]);
    if (result.ok && result.stdout) {
      const shas = new Set(
        result.stdout
          .split(/\r?\n/)
          .map((line) => line.split(/\s+/)[0])
          .filter(Boolean),
      );
      if (shas.has(expectedSha)) {
        return;
      }
      last = `found ${[...shas].join(", ")}`;
    } else {
      last = result.stderr || "ref not found";
    }
    if (attempt < VISIBILITY_DELAYS_MS.length) {
      await sleep(VISIBILITY_DELAYS_MS[attempt]);
    }
  }
  fail(`${label} did not become visible on origin (expected ${expectedSha}): ${last}`);
}

async function main() {
  const branchName = process.env.GITHUB_REF_NAME || "";
  const repository = process.env.GITHUB_REPOSITORY || "";
  const token = process.env.GH_TOKEN || process.env.GITHUB_TOKEN || "";

  if (!repository) {
    fail("GITHUB_REPOSITORY is not set.");
  }
  if (!token) {
    fail("GITHUB_TOKEN is not set.");
  }
  if (branchName !== "main" && branchName !== "dev") {
    fail(`Unsupported release branch "${branchName}"; only main and dev release.`);
  }

  const configPath = resolve(process.cwd(), ".releaserc");
  const config = JSON.parse(readFileSync(configPath, "utf8"));
  const branchEntry = (config.branches || []).find(
    (branch) => (typeof branch === "string" ? branch : branch.name) === branchName,
  );
  if (!branchEntry) {
    fail(`Branch ${branchName} is not configured in .releaserc.`);
  }
  const branchOptions = typeof branchEntry === "string" ? { name: branchEntry } : branchEntry;
  // Matches semantic-release's branch normalization: the first release branch
  // has no channel, prerelease branches default to their name.
  const channel = branchOptions.channel === undefined
    ? (branchOptions.prerelease ? branchOptions.name : null)
    : branchOptions.channel;

  const githubEntry = (config.plugins || []).find(
    (plugin) => Array.isArray(plugin) && plugin[0] === "@semantic-release/github",
  );
  if (!githubEntry) {
    fail("@semantic-release/github is not configured in .releaserc.");
  }

  const head = git(["rev-parse", "HEAD"]);
  const tags = git(["tag", "--points-at", "HEAD", "--list", `${TAG_PREFIX}*`])
    .split(/\r?\n/)
    .filter(Boolean);
  if (tags.length !== 1) {
    fail(
      `Expected exactly one ${TAG_PREFIX} tag at HEAD, found ${tags.length}. ` +
        "The release did not reach the tag/notes step, so it is not recoverable here.",
    );
  }
  const tag = tags[0];
  const version = tag.slice(TAG_PREFIX.length);

  if (branchName === "main" && version.includes("-")) {
    fail(`Tag ${tag} is a prerelease but this run is on main.`);
  }
  if (branchName === "dev" && !version.includes("-dev.")) {
    fail(`Tag ${tag} is not a dev prerelease but this run is on dev.`);
  }

  const subject = git(["log", "-1", "--format=%s", "HEAD"]);
  const expectedSubject = `chore: Release ${tag} [skip ci]`;
  if (subject !== expectedSubject) {
    fail(`HEAD is "${subject}", not the release commit "${expectedSubject}".`);
  }

  const message = git(["log", "-1", "--format=%B", "HEAD"]);
  const firstBreak = message.indexOf("\n");
  const notes = (firstBreak >= 0 ? message.slice(firstBreak + 1) : "").trim();
  if (!notes || !notes.includes(version)) {
    fail(`The release commit has no usable notes for ${version}.`);
  }

  await waitForRemoteSha(`refs/tags/${tag}`, head, `Remote tag ${tag}`);

  const releaseUrl = `${apiUrl()}/repos/${repository}/releases/tags/${encodeURIComponent(tag)}`;
  const existing = await fetch(releaseUrl, { headers: githubHeaders(token) });
  if (existing.status === 200) {
    const existingRelease = await existing.json();
    if (!existingRelease.draft) {
      fail(`A GitHub release for ${tag} already exists; the original failure is not the notes push.`);
    }
    // A draft from an interrupted @semantic-release/github publish is not public
    // and would block this attempt; remove it and publish a fresh release.
    info(`Deleting interrupted draft release ${existingRelease.id} for ${tag}.`);
    const deleted = await fetch(`${apiUrl()}/repos/${repository}/releases/${existingRelease.id}`, {
      method: "DELETE",
      headers: githubHeaders(token),
    });
    if (!deleted.ok) {
      fail(`Could not delete draft release ${existingRelease.id}: HTTP ${deleted.status}.`);
    }
  } else if (existing.status !== 404) {
    fail(`GitHub release lookup for ${tag} returned HTTP ${existing.status}.`);
  }

  let assetPath;
  try {
    assetPath = resolveReleaseArtifact(process.cwd(), version);
  } catch (error) {
    fail(`The prepared release asset could not be resolved: ${error.message}`);
  }
  // The resolved path is outside the checkout; the plugin's glob takes a path
  // relative to the workspace, so convert it without duplicating the layout.
  const assetForPlugin = relative(process.cwd(), assetPath).split("\\").join("/");
  const assets = [assetForPlugin];
  const ascPath = `${assetPath}.asc`;
  if (existsSync(ascPath)) {
    assets.push(`${assetForPlugin}.asc`);
  }
  info(`Using release asset ${assetPath}.`);

  const noteName = `${NOTE_PREFIX}-${tag}`;
  const notesRef = `refs/notes/${noteName}`;
  const currentNote = gitResult(["notes", "--ref", noteName, "show", tag]);
  if (currentNote.ok) {
    let parsed;
    try {
      parsed = JSON.parse(currentNote.stdout);
    } catch {
      fail(`The existing channel note for ${tag} is not valid JSON; refusing to overwrite it.`);
    }
    if (!Array.isArray(parsed.channels) || !parsed.channels.some((value) => value === channel)) {
      fail(`The existing channel note ${currentNote.stdout} does not carry channel ${channel}; refusing to overwrite it.`);
    }
    info(`Keeping existing channel note ${currentNote.stdout}.`);
  } else {
    const expectedNote = JSON.stringify({ channels: [channel] });
    info(`Writing channel note ${expectedNote} for ${tag}.`);
    const written = gitResult([...NOTE_AUTHOR, "notes", "--ref", noteName, "add", "-f", "-m", expectedNote, tag]);
    if (!written.ok) {
      fail(`Could not write the channel note: ${written.stderr}`);
    }
  }

  const localNoteSha = git(["rev-parse", notesRef]);
  let lastPushError = "";
  for (let attempt = 0; attempt <= RETRY_DELAYS_MS.length; attempt += 1) {
    const pushed = gitResult(["push", "--no-thin", "origin", notesRef]);
    if (pushed.ok) {
      lastPushError = "";
      break;
    }
    lastPushError = pushed.stderr;
    if (attempt < RETRY_DELAYS_MS.length) {
      info(
        `Notes push attempt ${attempt + 1} failed; retrying in ${RETRY_DELAYS_MS[attempt] / 1000}s ` +
          "(GitHub object visibility can lag a few seconds).",
      );
      await sleep(RETRY_DELAYS_MS[attempt]);
    }
  }
  if (lastPushError) {
    fail(`Notes push was rejected after ${RETRY_DELAYS_MS.length + 1} attempts: ${lastPushError}`);
  }
  await waitForRemoteSha(notesRef, localNoteSha, `Remote ${notesRef}`);
  info(`Pushed ${notesRef} (${localNoteSha}).`);

  const pluginConfig = { ...(githubEntry[1] || {}), assets };
  const context = {
    cwd: process.cwd(),
    env: process.env,
    options: { repositoryUrl: `https://github.com/${repository}` },
    branch: {
      name: branchName,
      channel,
      main: branchName === "main",
      type: branchName === "main" ? "release" : "prerelease",
      prerelease: branchName !== "main",
    },
    nextRelease: {
      version,
      gitTag: tag,
      name: tag,
      notes,
      channel,
      gitHead: head,
    },
    logger: {
      log: (...args) => console.log(...args),
      error: (...args) => console.error(...args),
    },
  };

  let release;
  try {
    release = await publish(pluginConfig, context);
  } catch (error) {
    // @semantic-release/github creates a draft, uploads assets, then publishes it.
    // Remove a draft left by a failed upload so a later run is not blocked by it.
    try {
      const draftLookup = await fetch(releaseUrl, { headers: githubHeaders(token) });
      if (draftLookup.status === 200) {
        const draft = await draftLookup.json();
        if (draft.draft) {
          const deleted = await fetch(`${apiUrl()}/repos/${repository}/releases/${draft.id}`, {
            method: "DELETE",
            headers: githubHeaders(token),
          });
          info(
            deleted.ok
              ? `Deleted draft release ${draft.id} for ${tag}.`
              : `Could not delete draft release ${draft.id}: HTTP ${deleted.status}.`,
          );
        }
      }
    } catch (cleanupError) {
      info(`Could not inspect the failed release for a draft: ${cleanupError.message}`);
    }
    throw error;
  }
  info(`Published GitHub release ${release.url}`);

  const verified = await fetch(releaseUrl, { headers: githubHeaders(token) });
  if (verified.status !== 200) {
    fail(`The published release for ${tag} is not readable (HTTP ${verified.status}).`);
  }
  const publishedRelease = await verified.json();
  const assetName = `patches-${version}.mpp`;
  const uploaded = (publishedRelease.assets || []).find((asset) => asset.name === assetName);
  if (!uploaded || uploaded.state !== "uploaded" || !(uploaded.size > 0)) {
    fail(`Release ${tag} exists but ${assetName} was not uploaded.`);
  }
  info(`Verified ${assetName} (${uploaded.size} bytes).`);

  if (process.env.GITHUB_OUTPUT) {
    appendFileSync(
      process.env.GITHUB_OUTPUT,
      `new_release_published=true\nnew_release_version=${version}\nnew_release_git_tag=${tag}\n`,
    );
  }

  if (branchName === "main") {
    // @cleyrop-org/semantic-release-backmerge normally merges main into dev as a
    // success hook. The notes push fails before that hook, so restore the same
    // result when dev is still an ancestor of the release commit.
    const fetched = gitResult(["fetch", "origin", "main", "dev"]);
    if (!fetched.ok) {
      fail(`Could not fetch main/dev for the back-merge: ${fetched.stderr}`);
    }
    const devSha = git(["rev-parse", "refs/remotes/origin/dev"]);
    const ancestor = gitResult(["merge-base", "--is-ancestor", devSha, head]);
    if (!ancestor.ok) {
      fail("dev has diverged from main; back-merge it manually.");
    }
    const backmerge = gitResult(["push", "origin", `${head}:refs/heads/dev`]);
    if (!backmerge.ok) {
      fail(`Could not fast-forward dev after the stable release: ${backmerge.stderr}`);
    }
    info(`Fast-forwarded dev to ${head} after the stable release.`);
  }
}

main().catch((error) => {
  console.error(`::error::${error instanceof Error ? error.message : String(error)}`);
  process.exitCode = 1;
});
