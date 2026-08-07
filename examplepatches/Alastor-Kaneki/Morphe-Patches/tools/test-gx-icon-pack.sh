#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PATCH="$ROOT/patches/src/main/kotlin/dev/alastorkaneki/morphe/patches/operagx/GxIconPackPatch.kt"
REGISTRY="$ROOT/extensions/extension/src/main/java/dev/alastorkaneki/morphe/extension/operagx/icons/GxIconPackRegistry.java"
INDEX="$ROOT/patches/src/main/resources/gx-icon-pack/index.txt"
ARCHIVE_DIR="$ROOT/patches/src/main/resources/gx-icon-pack"
DOWNLOADER="$ROOT/patches/src/main/kotlin/dev/alastorkaneki/morphe/patches/operagx/DownloadGxModsPatch.kt"

if ! compgen -G "$ARCHIVE_DIR/gx-icon-pack-*.zip" >/dev/null; then
    python3 "$ROOT/tools/prepare-gx-icon-pack.py"
fi

python3 - "$PATCH" "$REGISTRY" "$INDEX" "$ARCHIVE_DIR" "$DOWNLOADER" <<'PY'
import re
import sys
import zipfile
from pathlib import Path

patch, registry, index, archive_dir, downloader = map(Path, sys.argv[1:])
for path in (patch, registry, index, downloader):
    if not path.is_file():
        raise SystemExit(f"missing required file: {path}")
if not archive_dir.is_dir():
    raise SystemExit(f"missing archive directory: {archive_dir}")

patch_text = patch.read_text()
registry_text = registry.read_text()
downloader_text = downloader.read_text()

if 'dependsOn(downloadGxModsAsFilesPatch)' in patch_text or 'dependsOn(gxIconPackPatch)' in downloader_text:
    raise SystemExit('GX icon pack and GX downloader patches must remain independent')
if 'name = "GX icon pack"' not in patch_text:
    raise SystemExit('standalone GX icon patch declaration missing')
if 'name = "Download GX mods as files"' not in downloader_text:
    raise SystemExit('GX downloader declaration changed unexpectedly')
if 'gx_icon_pack_index' not in registry_text or '/gx-icon-pack/index.txt' not in patch_text:
    raise SystemExit('shared GX icon index wiring is missing')

rows = []
for line in index.read_text().splitlines():
    if not line.strip():
        continue
    parts = line.split('|')
    if len(parts) != 3:
        raise SystemExit(f'invalid index row: {line}')
    name, resource, group = parts
    if not name or not group or not re.fullmatch(r'gxip_[a-z0-9_]+', resource):
        raise SystemExit(f'invalid index values: {line}')
    rows.append((name, resource, group))

resources = [resource for _, resource, _ in rows]
if len(rows) != 56 or len(set(resources)) != 56:
    raise SystemExit(f'expected 56 unique indexed icons, got {len(set(resources))}')

zipped = []
archives = sorted(archive_dir.glob('gx-icon-pack-*.zip'))
if len(archives) != 4:
    raise SystemExit(f'expected 4 icon archives, got {len(archives)}')
for archive in archives:
    with zipfile.ZipFile(archive) as zf:
        zipped.extend(zf.namelist())
zipped = sorted(zipped)
if any(not re.fullmatch(r'gxip_[a-z0-9_]+\.png', name) for name in zipped):
    raise SystemExit('archive contains an invalid Android resource name')

expected = sorted(name + '.png' for name in resources)
if zipped != expected:
    raise SystemExit('archive resources differ from index resources')

print('GX icon pack: 56 independent launcher aliases and resources verified')
PY
