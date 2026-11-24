const { APKMirrorDownloader } = require('apkmirror-downloader');
const path = require('node:path');
const fs = require('node:fs');

async function main() {
  const [org, repo, version, type, outDir] = process.argv.slice(2);
  if (!org || !repo) {
    console.error('Usage: node apkmirror_runner.cjs <org> <repo> [version] [type] [outDir]');
    process.exit(1);
  }

  const resolvedOutDir = path.resolve(outDir || '.');
  fs.mkdirSync(resolvedOutDir, { recursive: true });

  const downloader = new APKMirrorDownloader({ outDir: resolvedOutDir });
  const options = {
    version: version || 'latest',
    type: type || 'apk',
    dpi: '*',
    arch: 'universal',
    fallbackArch: 'arm64-v8a',
    overwrite: true,
  };

  const result = await downloader.download({ org, repo }, options);
  console.log(JSON.stringify(result));
}

main().catch((err) => {
  console.error(err?.message || String(err));
  process.exit(1);
});
