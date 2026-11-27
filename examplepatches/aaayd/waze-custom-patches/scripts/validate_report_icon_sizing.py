"""Verify the standalone patch changes only its renderer, new images and build number."""
import hashlib
import json
import subprocess
import sys
import zipfile
from pathlib import Path
from validate_skins import compiled_version_code

root = Path(__file__).resolve().parents[1]
apk_path = root / 'build/waze-report-icon-sizing-validation.apk'
subprocess.run([sys.executable, str(root / 'scripts/validate_report_zoom.py'), str(apk_path)], check=True)
paths = (root / 'src/main/resources/iconpacks/alias-paths.txt').read_text().splitlines()
added = {'assets/res/skins/default/' + path for path in paths}
with zipfile.ZipFile(root / 'downloads/waze-arm64/base.apk') as original, \
     zipfile.ZipFile(apk_path) as patched, \
     zipfile.ZipFile(root / 'dist/waze-5.24.5.0-themes-moods-badges-arm64.apk') as working:
    assert compiled_version_code(patched.read('AndroidManifest.xml')) == 1030747
    checked = 0
    for path in original.namelist():
        if path.endswith('/') or not (path.startswith('assets/') or path.endswith('.dex')):
            continue
        assert original.read(path) == patched.read(path), f'Unexpected change: {path}'
        checked += 1
    new = set(patched.namelist()) - set(original.namelist())
    new = {path for path in new if not path.endswith('/') and (path.startswith('assets/') or path.endswith('.dex'))}
    assert new == added, new ^ added
    for path in added:
        expected = (root / 'src/main/resources/iconpacks/original_aliases' / Path(path).name).read_bytes()
        assert patched.read(path) == working.read(path) == expected
    assert patched.read('lib/arm64-v8a/libwaze.so') == working.read('lib/arm64-v8a/libwaze.so')
    dex_count = sum(path.endswith('.dex') for path in original.namelist())
result = dict(original_asset_and_dex_files_unchanged=checked, original_dex_unchanged=dex_count,
              sized_assets=len(added), matches_working_build=True, version_code=1030747)
(root / 'dist/validation-report-icon-sizing.json').write_text(json.dumps(result, indent=2))
patch = root / 'dist/waze-theme-selector-1.6.2.mpp'
(root / 'dist/SHA256SUMS-report-icon-sizing.txt').write_text(
    hashlib.sha256(patch.read_bytes()).hexdigest() + '  ' + patch.name + '\n')
print('PASS:', json.dumps(result))
