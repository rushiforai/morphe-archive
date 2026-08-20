import { writeFile } from "node:fs/promises";
import path from "node:path";
import morpheChangelog from "@MorpheApp/changelog";

function withoutReleaseJson(pluginConfig) {
  return {
    ...pluginConfig,
    releaseJson: {
      ...(pluginConfig.releaseJson || {}),
      enabled: false,
    },
  };
}

export async function verifyConditions(pluginConfig, context) {
  await morpheChangelog.verifyConditions(withoutReleaseJson(pluginConfig), context);
}

export async function prepare(pluginConfig, context) {
  await morpheChangelog.prepare(withoutReleaseJson(pluginConfig), context);

  const downloadUrlTemplate = context.env.PROJECT_RELEASE_DOWNLOAD_URL_TEMPLATE;
  if (!downloadUrlTemplate) {
    throw new Error(
      "PROJECT_RELEASE_DOWNLOAD_URL_TEMPLATE is required to generate patches-bundle.json",
    );
  }

  const { notes, version } = context.nextRelease;
  const releaseJsonPath = path.resolve(
    context.cwd,
    pluginConfig.releaseJson?.path || "patches-bundle.json",
  );
  const releaseData = {
    created_at: new Date().toISOString().replace(/\.\d{3}Z$/, ""),
    description: notes.trim(),
    download_url: downloadUrlTemplate.replaceAll("{version}", version),
    signature_download_url: "",
    version,
  };

  await writeFile(releaseJsonPath, `${JSON.stringify(releaseData, null, 2)}\n`);
  context.logger.log("Create %s", releaseJsonPath);
}
