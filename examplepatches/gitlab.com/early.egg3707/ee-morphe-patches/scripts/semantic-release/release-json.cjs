const fs = require("node:fs");
const path = require("node:path");

function parseRepositoryPath(repositoryUrl) {
  if (!repositoryUrl) return null;

  const normalized = repositoryUrl.trim().replace(/^git\+/, "").replace(/\.git$/, "");

  const sshMatch = normalized.match(/^git@gitlab\.com:(.+)$/i);
  if (sshMatch) return sshMatch[1];

  const sshUrlMatch = normalized.match(/^ssh:\/\/git@gitlab\.com\/(.+)$/i);
  if (sshUrlMatch) return sshUrlMatch[1];

  const httpsMatch = normalized.match(/^https?:\/\/gitlab\.com\/(.+)$/i);
  if (httpsMatch) return httpsMatch[1];

  // Handles authenticated URLs from CI, e.g.
  // https://gitlab-ci-token:<token>@gitlab.com/group/project(.git)
  const httpsAuthMatch = normalized.match(/^https?:\/\/[^@/]+@gitlab\.com\/(.+)$/i);
  if (httpsAuthMatch) return httpsAuthMatch[1];

  // Fallback URL parser to support encoded paths and future URL variants.
  try {
    const parsed = new URL(normalized);
    if (parsed.hostname.toLowerCase() === "gitlab.com") {
      return decodeURIComponent(parsed.pathname.replace(/^\/+/, ""));
    }
  } catch {
    // Ignore parse errors and fall through to null.
  }

  return null;
}

function getGitLabBaseUrl(repositoryUrl) {
  const repositoryPath = parseRepositoryPath(repositoryUrl);
  if (!repositoryPath) {
    throw new Error(
      `Unable to derive a GitLab project path from repositoryUrl: ${repositoryUrl || "<missing>"}`
    );
  }

  return `https://gitlab.com/${repositoryPath}`;
}

function formatCreatedAt(date = new Date()) {
  return date.toISOString().replace(/\.\d{3}Z$/, "");
}

async function prepare(pluginConfig, context) {
  const outputPath = pluginConfig?.path || "patches-bundle.json";
  const cwd = context.cwd || process.cwd();
  const version = context?.nextRelease?.version;
  const notes = context?.nextRelease?.notes || "";
  const repositoryUrl = context?.options?.repositoryUrl;

  if (!version) {
    throw new Error("Missing nextRelease.version in semantic-release context.");
  }

  const gitLabBaseUrl = getGitLabBaseUrl(repositoryUrl);
  const releaseTag = `v${version}`;
  const fileBaseName = `patches-${version}.mpp`;

  const bundleJson = {
    created_at: formatCreatedAt(),
    description: notes,
    download_url: `${gitLabBaseUrl}/-/releases/${releaseTag}/downloads/${fileBaseName}`,
    signature_download_url: `${gitLabBaseUrl}/-/releases/${releaseTag}/downloads/${fileBaseName}.asc`,
    version,
  };

  const absoluteOutputPath = path.resolve(cwd, outputPath);
  fs.writeFileSync(absoluteOutputPath, `${JSON.stringify(bundleJson, null, 2)}\n`, "utf8");
  context.logger.log(`Wrote ${path.relative(cwd, absoluteOutputPath)} for release ${releaseTag}.`);
}

module.exports = { prepare };
