"""Prepare pinned, integrity-checked web dependencies without running npm lifecycle scripts."""
from pathlib import Path
import base64, hashlib, io, json, shutil, tarfile, urllib.request
root = Path(__file__).resolve().parents[1]
(root / 'web/src').mkdir(parents=True, exist_ok=True)
home = root.parent
research = home / 'Research/Better-Lyrics'
dest = root / 'web/node_modules'
dest.mkdir(parents=True, exist_ok=True)
for name, source in [('core', 'core-1.16.11'), ('parsers', 'parsers-0.4.0')]:
    target = dest / '@braccato' / name
    if not target.exists():
        shutil.copytree(research / 'Packages' / source, target)
for source in (research / 'Packages/node_modules').iterdir():
    target = dest / source.name
    if source.is_dir() and not target.exists():
        shutil.copytree(source, target)
tools = root / 'web/tools/esbuild'
if not (tools / 'esbuild.exe').exists():
    with urllib.request.urlopen('https://registry.npmjs.org/@esbuild/win32-x64/0.25.12') as f:
        metadata = json.load(f)
    with urllib.request.urlopen(metadata['dist']['tarball']) as f:
        content = f.read()
    expected = metadata['dist']['integrity'].removeprefix('sha512-')
    assert base64.b64encode(hashlib.sha512(content).digest()).decode() == expected
    tools.mkdir(parents=True, exist_ok=True)
    with tarfile.open(fileobj=io.BytesIO(content), mode='r:gz') as archive:
        for name in ('package/esbuild.exe', 'package/README.md'):
            (tools / Path(name).name).write_bytes(archive.extractfile(name).read())
    (tools / 'registry.json').write_text(json.dumps(metadata, indent=2), encoding='utf-8')
# Keep the original GPL provider decoding algorithm, adapting only its host interfaces.
upstream = research / 'Sources/better-lyrics-272d7c16c9e8/src/modules/lyrics/providers'
shutil.copy2(upstream.parent / 'lyricParseUtils.ts', root / 'web/src/lyric-parse-utils.ts')
source = (upstream / 'unified.ts').read_text(encoding='utf-8')
start = source.index('async function processStreamData(')
end = source.index('\n/**\n * Unified provider entry point.', start)
body = source[start:end].replace('async function processStreamData', 'export async function processStreamData', 1)
ttml = (upstream / 'ttmlSource.ts').read_text(encoding='utf-8')
ttml = ttml[ttml.index('interface FillTtmlOptions'):]
header = '''// Adapted 2026-10-21 by BDCrusher from Better Lyrics 272d7c16c9e8 (GPL-3.0).
// Original decoding is retained; browser cache/waiter integration is supplied by this host.
import { LRCParser, lrcFixers, parseLRC, parseQRC, PlainParser, QRCParser, parseTTMLContent, TTMLParser } from '@braccato/parsers';
type LyricSourceKey = string;
type LyricSourceResult = any;
type ProviderParameters = any;
type UnisonData = any;
const HOMEPAGE_DOMAIN = 'betterlyrics.org';
const HOMEPAGE_URL = 'https://betterlyrics.org';
const logCore = (..._args: any[]) => {};
const resolveWaiter = (..._args: any[]) => {};
'''
(root / 'web/src/upstream-providers.ts').write_text(header + ttml + '\n' + body, encoding='utf-8')
styles = dest / '@braccato/core/dist/styles'
assets = root / 'patches/src/main/resources/bdcrusher-lyrics'
assets.mkdir(parents=True, exist_ok=True)
for item in styles.glob('*.css'):
    shutil.copy2(item, assets / item.name)
font = research / 'Sources/better-lyrics-272d7c16c9e8/public/fonts/Satoshi-Variable.woff2'
shutil.copy2(font, assets / font.name)
licenses = root / 'third-party-notices'
licenses.mkdir(exist_ok=True)
shutil.copy2(research / 'Packages/core-1.16.11/dist/LICENSE', licenses / 'Braccato-core-MIT.txt')
shutil.copy2(research / 'Sources/better-lyrics-272d7c16c9e8/LICENSE', licenses / 'Better-Lyrics-GPL-3.0.txt')
shutil.copy2(research / 'Packages/parsers-0.4.0/LICENSE', licenses / 'Braccato-parsers-MIT.txt')
shutil.copy2(research / 'Sources/better-lyrics-272d7c16c9e8/public/fonts/NOTICE.txt', licenses / 'Fonts-NOTICE.txt')
for package in dest.rglob('package.json'):
    folder=package.parent
    for notice in folder.glob('*'):
        if notice.is_file() and notice.name.lower().startswith(('license','licence','notice','copying')):
            label=folder.relative_to(dest).as_posix().replace('/','_')+'-'+notice.name
            shutil.copy2(notice,licenses/label)
print('Pinned Braccato 1.16.11 / parsers 0.4.0 and esbuild 0.25.12 prepared')
