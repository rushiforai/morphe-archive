const { execFile } = require("node:child_process");
const { readFile } = require("node:fs/promises");
const { join } = require("node:path");
const { promisify } = require("node:util");

const execFileAsync = promisify(execFile);

const compatibilityRelativePath = [
  "patches",
  "src",
  "main",
  "kotlin",
  "app",
  "seobject",
  "patches",
  "music",
  "Compatibility.kt",
].join("/");

function compareVersionParts(left, right) {
  const leftParts = left.split(".").map(Number);
  const rightParts = right.split(".").map(Number);
  const length = Math.max(
    leftParts.length,
    rightParts.length,
  );

  for (let index = 0; index < length; index += 1) {
    const leftPart = leftParts[index] || 0;
    const rightPart = rightParts[index] || 0;

    if (leftPart !== rightPart) {
      return leftPart - rightPart;
    }
  }

  return 0;
}

function readSupportedVersions(source) {
  const versions = [];
  const pattern =
    /AppTarget\s*\(\s*version\s*=\s*"([^"]+)"/g;

  for (
    let match = pattern.exec(source);
    match;
    match = pattern.exec(source)
  ) {
    versions.push(match[1]);
  }

  return [...new Set(versions)]
    .sort(compareVersionParts);
}

function formatVersionList(versions) {
  if (versions.length === 1) {
    return versions[0];
  }

  if (versions.length === 2) {
    return `${versions[0]} and ${versions[1]}`;
  }

  return (
    `${versions.slice(0, -1).join(", ")} and ` +
    versions[versions.length - 1]
  );
}

async function readPreviousCompatibility(
  cwd,
  gitTag,
) {
  if (!gitTag) {
    return "";
  }

  try {
    const { stdout } = await execFileAsync(
      "git",
      [
        "-C",
        cwd,
        "show",
        `${gitTag}:${compatibilityRelativePath}`,
      ],
      {
        encoding: "utf8",
        maxBuffer: 1024 * 1024,
      },
    );

    return stdout;
  } catch (error) {
    if (
      error &&
      typeof error.stderr === "string" &&
      (
        error.stderr.includes("does not exist") ||
        error.stderr.includes("exists on disk, but not in")
      )
    ) {
      return "";
    }

    throw error;
  }
}

function addFeatureNote(notes, subject) {
  const bullet = `* ${subject}`;
  const normalized = (notes || "")
    .replace(/\r\n?/g, "\n")
    .trim();

  if (normalized.includes(bullet)) {
    return normalized;
  }

  const featureHeading = /^### Features\s*$/m;

  if (featureHeading.test(normalized)) {
    return normalized.replace(
      featureHeading,
      (heading) => `${heading}\n\n${bullet}`,
    );
  }

  if (!normalized) {
    return `### Features\n\n${bullet}`;
  }

  return `### Features\n\n${bullet}\n\n${normalized}`;
}

module.exports = {
  async prepare(
    _pluginConfig,
    {
      branch,
      cwd,
      lastRelease,
      nextRelease,
      logger,
    },
  ) {
    const currentSource = await readFile(
      join(cwd, compatibilityRelativePath),
      "utf8",
    );
    const previousSource =
      await readPreviousCompatibility(
        cwd,
        lastRelease.gitTag,
      );

    const currentVersions =
      readSupportedVersions(currentSource);
    const previousVersions = new Set(
      readSupportedVersions(previousSource),
    );
    const addedVersions = currentVersions.filter(
      (version) => !previousVersions.has(version),
    );

    if (addedVersions.length === 0) {
      logger.log(
        "No new YouTube Music AppTarget versions for release notes",
      );
      return;
    }

    let subject;

    if (branch.name === "dev") {
      subject =
        "add experimental YouTube Music " +
        `${formatVersionList(addedVersions)} support`;
    } else if (branch.name === "main") {
      subject =
        "add YouTube Music " +
        `${formatVersionList(addedVersions)} support`;
    } else {
      throw new Error(
        `Unsupported semantic-release branch: ${branch.name}`,
      );
    }

    nextRelease.notes = addFeatureNote(
      nextRelease.notes,
      subject,
    );

    logger.log(
      `Added compatibility release note: ${subject}`,
    );
  },
};
