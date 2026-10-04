// Import an explicitly supplied, checked-out BTR tree. No runtime/network dependency.
const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');
const { execFileSync } = require('node:child_process');
const upstream = path.resolve(process.argv[2] || '');
if (!process.argv[2]) throw Error('Pass the BTR checkout path');
const root = path.resolve(__dirname, '..');
const files = ['src/range-core.js', 'src/cdn-resolver.js', 'src/idm-downloader.js', 'src/native-range-transport.js', 'src/settings-panel.js', 'src/runtime-notices.js', 'src/notification-view.js', 'src/bridge.js', 'user_scripts/adapter/storage-shim.js', 'user_scripts/adapter/loader.js', 'LICENSE'];
const commit = execFileSync('git', ['rev-parse', 'HEAD'], { cwd: upstream, encoding: 'utf8' }).trim();
const manifest = { repository: 'https://github.com/MrTangLuyao/Bilibili-thread-ripper', commit, files: {} };
for (const file of files) {
  const text = fs.readFileSync(path.join(upstream, file), 'utf8').replace(/\r\n/g, '\n');
  const target = path.join(root, 'vendor/btr', file);
  fs.mkdirSync(path.dirname(target), { recursive: true });
  fs.writeFileSync(target, text, 'utf8');
  manifest.files[file] = crypto.createHash('sha256').update(text).digest('hex');
}
fs.writeFileSync(path.join(root, 'vendor/btr/manifest.json'), JSON.stringify(manifest, null, 2) + '\n', 'utf8');
console.log(`Imported ${files.length} upstream files at ${commit}`);
