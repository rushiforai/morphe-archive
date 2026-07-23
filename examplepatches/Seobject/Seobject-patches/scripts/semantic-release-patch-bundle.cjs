const { spawn } = require("node:child_process");
const {
  access,
  readFile,
  readdir,
  writeFile,
} = require("node:fs/promises");
const { join } = require("node:path");

const repository = "Seobject/Seobject-patches";

function isExecutableMpp(filename) {
  return (
    filename.endsWith(".mpp") &&
    !filename.endsWith("-sources.mpp") &&
    !filename.endsWith("-javadoc.mpp")
  );
}

function runGradle(cwd, env, logger) {
  const command = process.platform === "win32" ? "gradlew.bat" : "./gradlew";
  const args = [
    "--no-build-cache",
    ":extensions:music:clean",
    ":patches:clean",
    ":patches:generatePatchesList",
    "-PnoProguard",
    "-x",
    ":patches:test",
  ];

  logger.log(`Building release bundle: ${command} ${args.join(" ")}`);

  return new Promise((resolve, reject) => {
    const child = spawn(command, args, {
      cwd,
      env,
      stdio: "inherit",
      shell: process.platform === "win32",
    });

    child.once("error", reject);
    child.once("close", (code, signal) => {
      if (code === 0) {
        resolve();
        return;
      }

      const reason = signal
        ? `signal ${signal}`
        : `exit code ${code}`;

      reject(new Error(`Release Gradle build failed with ${reason}`));
    });
  });
}

async function buildAndValidateBundle(
  cwd,
  env,
  version,
  logger,
) {
  await runGradle(cwd, env, logger);

  const libsDirectory = join(cwd, "patches", "build", "libs");
  const expectedFilename = `patches-${version}.mpp`;
  const executableMpps = (await readdir(libsDirectory))
    .filter(isExecutableMpp)
    .sort();

  if (
    executableMpps.length !== 1 ||
    executableMpps[0] !== expectedFilename
  ) {
    throw new Error(
      `Expected exactly ${expectedFilename} after the release build; ` +
        `found: ${executableMpps.join(", ") || "none"}`,
    );
  }

  await access(join(libsDirectory, expectedFilename));
  logger.log(`Validated release bundle ${expectedFilename}`);
  return expectedFilename;
}

async function updateReadmeVersion(cwd, tag) {
  const readmePath = join(cwd, "README.md");
  const readme = await readFile(readmePath, "utf8");
  const startMarker = "<!-- PATCHES_START -->";
  const endMarker = "<!-- PATCHES_END -->";
  const start = readme.indexOf(startMarker);
  const end = readme.indexOf(endMarker);

  if (start < 0 || end < 0 || end <= start) {
    throw new Error(
      "README patch-list markers are missing or out of order",
    );
  }

  const normalizedReadme = readme.replace(/\r\n?/g, "\n");
  const normalizedStart = normalizedReadme.indexOf(startMarker);
  const normalizedEnd = normalizedReadme.indexOf(endMarker);

  if (
    normalizedStart < 0 ||
    normalizedEnd < 0 ||
    normalizedEnd <= normalizedStart
  ) {
    throw new Error(
      "README patch-list markers are missing after newline normalization",
    );
  }

  const before = normalizedReadme.slice(
    0,
    normalizedStart + startMarker.length,
  );
  const block = normalizedReadme.slice(
    normalizedStart + startMarker.length,
    normalizedEnd,
  );
  const after = normalizedReadme.slice(normalizedEnd);
  const lines = block.split("\n");
  const summaryIndexes = [];

  lines.forEach((line, index) => {
    if (
      line.startsWith("> ") &&
      /\d+ patch(?:es)? total$/.test(line)
    ) {
      summaryIndexes.push(index);
    }
  });

  if (summaryIndexes.length !== 1) {
    throw new Error(
      `Expected exactly one README patch summary header; found ${summaryIndexes.length}`,
    );
  }

  const summaryIndex = summaryIndexes[0];
  const countMatch = lines[summaryIndex].match(
    /(\d+ patch(?:es)? total)$/,
  );

  if (!countMatch) {
    throw new Error("README patch count could not be read");
  }

  lines[summaryIndex] =
    `> **[${tag}](https://github.com/${repository}/releases/tag/${tag})**` +
    `&nbsp;&nbsp;&bull;&nbsp;&nbsp;${countMatch[1]}`;

  await writeFile(
    readmePath,
    `${before}${lines.join("\n")}${after}`,
    "utf8",
  );
}

module.exports = {
  async prepare(
    _pluginConfig,
    {
      branch,
      cwd,
      env,
      nextRelease,
      logger,
    },
  ) {
    const version = nextRelease.version;
    const tag = `v${version}`;
    const filename = await buildAndValidateBundle(
      cwd,
      env,
      version,
      logger,
    );
    await updateReadmeVersion(cwd, tag);
    const createdAt = new Date()
      .toISOString()
      .replace(/\.\d{3}Z$/, "");

    const manifest = {
      created_at: createdAt,
      description:
        (nextRelease.notes || "").trim() ||
        "Random QoL Patches",
      download_url:
        `https://github.com/${repository}/releases/download/` +
        `${tag}/${filename}`,
      signature_download_url: "N/A",
      version: tag,
    };

    const channel = branch.name === "main" ? "stable" : "dev";
    const manifestFiles = [
      "patch-bundle.json",
      `seobjects-random-patches-${channel}.json`,
    ];

    // The main-branch canonical URL is also the permanent combined feed.
    // A post-release workflow step updates it after dev releases.
    if (channel === "stable") {
      manifestFiles.push("seobjects-random-patches.json");
    }

    const serializedManifest =
      `${JSON.stringify(manifest, null, 2)}\n`;

    await Promise.all(
      manifestFiles.map((file) =>
        writeFile(
          join(cwd, file),
          serializedManifest,
          "utf8",
        ),
      ),
    );

    const patchListPath = join(cwd, "patches-list.json");
    const patchList = JSON.parse(
      await readFile(patchListPath, "utf8"),
    );

    if (
      !Array.isArray(patchList.patches) ||
      patchList.patches.length === 0
    ) {
      throw new Error(
        "Generated patches-list.json contains no patches",
      );
    }

    patchList.version = version;
    await writeFile(
      patchListPath,
      `${JSON.stringify(patchList, null, 2)}\n`,
      "utf8",
    );

    logger.log(
      `Updated ${channel} patch bundle metadata for ${tag}`,
    );
  },
};
