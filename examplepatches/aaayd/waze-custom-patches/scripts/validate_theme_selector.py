"""Validate every selectable palette with Waze's own Lua parser and renderer callbacks."""
import json
from pathlib import Path
from zipfile import ZipFile
from validate_skins import run_skin, compiled_version_code

root = Path(__file__).resolve().parents[1]
original = ZipFile(root / 'downloads/waze-arm64/base.apk')
patched = ZipFile(root / 'dist/waze-5.24.5.0-themes-moods-badges-arm64.apk')
v2 = ZipFile(root / 'dist/waze-5.24.5.0-google-colours-v2-arm64.apk')


class Choice:
    def __init__(self, name):
        self.name = name

    def read(self, path):
        if self.name != 'waze' and 'skin_values.' in path and ('editor.' not in path or self.name == 'oled'):
            path = path.replace('assets/res/skins/default/', f'assets/morphe/themes/{self.name}/')
        return patched.read(path)


assert compiled_version_code(patched.read('AndroidManifest.xml')) == 1030748
assert not any('/google_v1/' in path for path in patched.namelist()), 'Retired theme was packaged'
for path in original.namelist():
    if path.startswith('assets/'):
        assert original.read(path) == patched.read(path), f'Original asset changed: {path}'
report = {'original_assets_unchanged': True, 'version_code': 1030748, 'palettes': []}
for variant in ['', 'experiment/']:
    for mode in ['day', 'night']:
        for editor in ['', 'editor.']:
            stock = run_skin(original, variant, mode, editor)
            for name in ['waze', 'google_v2', 'oled']:
                result = run_skin(Choice(name), variant, mode, editor)
                assert result[0] == stock[0] and min(result[0]) > 0
                assert result[1] == stock[1], (name, result[1])
                assert result[4].keys() == stock[4].keys(), name
                reference = {'waze': original, 'google_v2': v2}.get(name)
                if reference:
                    assert result[4] == run_skin(reference, variant, mode, editor)[4], f'{name} changed from its released appearance'
                if name == 'oled':
                    baseline = run_skin(v2, variant, mode, editor)
                    for key, value in result[4].items():
                        if value != baseline[4][key]:
                            assert 'color' in key[-1] or key[-1] in {'map_background', 'missing'}, key
                        if 'traffic_' in key[-1]:
                            assert value == baseline[4][key], key
                    assert result[2].General.map_background == 0xff000000, result[2].General.map_background
                    if editor:
                        for road in ['Freeways','Primary','Secondary','Highways','Street','Private','Ramps']:
                            for key, value in stock[2][road].items():
                                if 'fill' in key:
                                    assert result[2][road][key] == value, (road,key)
                report['palettes'].append({'theme': name, 'mode': mode, 'variant': variant or 'default', 'editor': bool(editor), 'parser_counts': result[0]})
(root / 'dist/validation-theme-palettes.json').write_text(json.dumps(report, indent=2))
print('PASS: original APK assets untouched; all 24 palette/variant/editor combinations pass the Waze parser; Google Maps matches the released v2 skin; OLED background is black and traffic colours and editor road-class colours are preserved.')
