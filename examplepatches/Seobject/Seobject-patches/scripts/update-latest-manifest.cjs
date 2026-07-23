const { readFile } = require("node:fs/promises");

const repository =
  process.env.GITHUB_REPOSITORY ||
  "Seobject/Seobject-patches";
const token = process.env.GITHUB_TOKEN;
const targetPath = "seobjects-random-patches.json";

if (!token) {
  throw new Error("GITHUB_TOKEN is required");
}

async function github(path, options = {}) {
  const response = await fetch(
    `https://api.github.com${path}`,
    {
      ...options,
      headers: {
        Accept: "application/vnd.github+json",
        Authorization: `Bearer ${token}`,
        "X-GitHub-Api-Version": "2022-11-28",
        ...options.headers,
      },
    },
  );

  if (!response.ok) {
    const error = new Error(
      `${response.status} ${response.statusText}: ` +
        `${await response.text()}`,
    );
    error.status = response.status;
    throw error;
  }

  return response.status === 204
    ? null
    : response.json();
}

function isExecutableMpp(asset) {
  return (
    asset.name.endsWith(".mpp") &&
    !asset.name.endsWith("-sources.mpp") &&
    !asset.name.endsWith("-javadoc.mpp")
  );
}

function selectReleaseAsset(release) {
  const version = release.tag_name.startsWith("v")
    ? release.tag_name.slice(1)
    : release.tag_name;
  const expectedName = `patches-${version}.mpp`;
  const executableAssets = release.assets
    .filter(isExecutableMpp)
    .sort((left, right) =>
      left.name.localeCompare(right.name),
    );

  if (
    executableAssets.length !== 1 ||
    executableAssets[0].name !== expectedName
  ) {
    throw new Error(
      `Release ${release.tag_name} must contain exactly ` +
        `${expectedName}; found: ` +
        `${executableAssets.map((asset) => asset.name).join(", ") || "none"}`,
    );
  }

  return executableAssets[0];
}

async function main() {
  const releases = await github(
    `/repos/${repository}/releases?per_page=100`,
  );
  const latestRelease = releases
    .filter(
      (release) =>
        !release.draft &&
        release.published_at,
    )
    .sort(
      (left, right) =>
        Date.parse(right.published_at) -
        Date.parse(left.published_at),
    )[0];

  if (!latestRelease) {
    console.log(
      "No published release found; combined feed unchanged",
    );
    return;
  }

  const asset = selectReleaseAsset(latestRelease);

  const apiManifest = {
    created_at: latestRelease.published_at.replace(
      /\.\d{3}Z$/,
      "",
    ),
    description:
      (latestRelease.body || "").trim() ||
      "Random QoL Patches",
    download_url: asset.browser_download_url,
    signature_download_url: "N/A",
    version: latestRelease.tag_name,
  };
  const branchManifest = JSON.parse(
    await readFile("patch-bundle.json", "utf8"),
  );
  const timestamp = (value) =>
    Date.parse(
      value.endsWith("Z") ? value : `${value}Z`,
    );
  const manifest =
    timestamp(branchManifest.created_at) >
    timestamp(apiManifest.created_at)
      ? branchManifest
      : apiManifest;
  const serialized =
    `${JSON.stringify(manifest, null, 2)}\n`;

  for (let attempt = 1; attempt <= 3; attempt += 1) {
    const current = await github(
      `/repos/${repository}/contents/` +
        `${targetPath}?ref=main`,
    );
    const currentText = Buffer.from(
      current.content,
      "base64",
    ).toString("utf8");

    if (currentText === serialized) {
      console.log(
        `Combined feed already points to ${manifest.version}`,
      );
      return;
    }

    try {
      await github(
        `/repos/${repository}/contents/${targetPath}`,
        {
          method: "PUT",
          body: JSON.stringify({
            message:
              "chore: update combined release feed to " +
              `${manifest.version} [skip ci]`,
            content:
              Buffer.from(serialized).toString("base64"),
            sha: current.sha,
            branch: "main",
          }),
        },
      );

      console.log(
        `Combined feed now points to ${manifest.version}`,
      );
      return;
    } catch (error) {
      if (error.status !== 409 || attempt === 3) {
        throw error;
      }

      console.log(
        "Combined feed changed concurrently; " +
        `retrying (${attempt}/3)`,
      );
    }
  }
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
