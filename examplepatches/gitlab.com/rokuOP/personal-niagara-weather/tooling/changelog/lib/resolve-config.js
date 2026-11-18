export default function resolveConfig({changelogFile, changelogTitle, releaseJson = {}}) {
  return {
    changelogFile: changelogFile ?? 'CHANGELOG.md',
    changelogTitle,

    releaseJson: {
      enabled: releaseJson.enabled !== false,

      path: releaseJson.path ?? 'release.json',

      downloadUrlTemplate:
        releaseJson.downloadUrlTemplate ??
        'https://github.com/${owner}/${repo}/releases/download/v${version}/app-release-${version}.apk',

      signatureUrlTemplate:
        releaseJson.signatureUrlTemplate ??
        'https://github.com/${owner}/${repo}/releases/download/v${version}/app-release-${version}.apk.asc',

      publicKeyPath: releaseJson.publicKeyPath,
    },
  };
}
