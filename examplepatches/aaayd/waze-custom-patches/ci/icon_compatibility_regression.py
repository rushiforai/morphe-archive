"""Patch altered APK fixtures to verify per-image fallback and schema rejection."""
import argparse
import copy
import io
import json
import subprocess
import zipfile
from pathlib import Path

from PIL import Image
from native_icons import read_package


def main():
    parser = argparse.ArgumentParser()
    for name in ('input', 'bundle', 'desktop', 'java', 'work'):
        parser.add_argument('--' + name, type=Path, required=True)
    args = parser.parse_args()
    args.work.mkdir(parents=True, exist_ok=True)
    _, base = read_package(args.input)
    prefix = 'assets/res/skins/default/'
    with zipfile.ZipFile(io.BytesIO(base)) as original, zipfile.ZipFile(args.bundle) as bundle:
        manifest = bundle.read('iconpacks/paths.txt').decode().splitlines()
        present = [p for p in manifest if prefix + p in original.namelist()]
        if len(present) < 25:
            raise ValueError('Insufficient original icon fixture coverage')
        missing, changed = present[:2]
        new = 'alert_icons/icon_unmapped_regression.png'
        png = io.BytesIO()
        Image.new('RGBA', (7, 9)).save(png, format='PNG')
        for case in ('partial', 'missing-schema'):
            source = args.work / (case + '-input.apk')
            output = args.work / (case + '-output.apk')
            report = args.work / (case + '.json')
            with zipfile.ZipFile(source, 'w', compression=zipfile.ZIP_DEFLATED) as archive:
                for entry in original.infolist():
                    if entry.filename.startswith('META-INF/') or entry.filename == prefix + missing:
                        continue
                    if case == 'missing-schema' and entry.filename in {prefix + p for p in manifest}:
                        continue
                    archive.writestr(copy.copy(entry), png.getvalue() if entry.filename == prefix + changed else original.read(entry))
                archive.writestr(prefix + new, png.getvalue())
            command = [args.java, '-Xmx4g', '-jar', args.desktop, 'patch', '--unsigned', '--bytecode-mode', 'STRIP_SAFE',
                       '--force', '--exclusive', '-e', 'Selectable report icon packs', '-p', args.bundle,
                       '-o', output, '-r', report, '-t', args.work / (case + '-scratch'), source]
            with (args.work / (case + '.log')).open('w', encoding='utf-8') as log:
                status = subprocess.run([str(x) for x in command], stdout=log, stderr=subprocess.STDOUT, timeout=900).returncode
            log = (args.work / (case + '.log')).read_text(encoding='utf-8')
            if case == 'partial':
                if status or not output.exists():
                    raise AssertionError('One changed/missing icon broke the patch; see ' + str(args.work))
                with zipfile.ZipFile(output) as patched:
                    selected = patched.read('assets/morphe/iconpacks/paths.txt').decode().splitlines()
                    warnings = patched.read('assets/morphe/compatibility/icon-pack.txt').decode()
                    fallback = patched.read('assets/morphe/iconpacks/fallback-paths.txt').decode().splitlines()
                    assert changed in fallback and new in fallback and missing not in fallback
                    assert all(p not in selected for p in (missing, changed, new))
                    assert all(p in warnings and p in log for p in (missing, changed, new))
                    assert all(p in selected for p in present[2:])
                    assert patched.read(prefix + changed) == png.getvalue()
                    assert patched.read(prefix + new) == png.getvalue()
                    assert prefix + missing not in patched.namelist()
                result = json.loads(report.read_text())
                assert not result['failedPatches'] and all(s['success'] for s in result['patchingSteps'])
            elif status == 0 or 'Waze report artwork schema is not recognised' not in log:
                raise AssertionError('Missing icon schema did not fail for the expected reason')
            for artifact in (source, output):
                if artifact.resolve().is_relative_to(args.work.resolve()) and artifact.is_file():
                    artifact.unlink()
            print('PASS icon compatibility fixture: ' + case, flush=True)


if __name__ == '__main__':
    main()
