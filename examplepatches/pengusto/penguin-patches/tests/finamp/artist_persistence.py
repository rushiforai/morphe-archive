#!/usr/bin/env python3
"""Inspect preserved synthetic data after one explicit same-key APK update."""
import argparse
import hashlib
import io
import json
from pathlib import Path
import zipfile

import android_acceptance as base
from artist_review_acceptance import download_file_hashes
from build_native_payloads import ENGINE_SHA, LIBRARY_SHA


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adb', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--native-report', type=Path, required=True)
    parser.add_argument('--mask', type=int, choices=range(128), required=True)
    parser.add_argument('--baseline-downloads', type=Path, required=True)
    parser.add_argument('--seed-metadata', action='store_true', help='Explicit one-time UI seed; never used during retention inspection')
    parser.add_argument('--expect-metadata', action='store_true')
    parser.add_argument('--aux-baseline', type=Path, help='Prior persistence receipt whose auxiliary box must survive byte for byte')
    args = parser.parse_args()
    if (args.seed_metadata or args.expect_metadata) and not args.mask & 2:
        parser.error('Metadata UI is available only with Song artist order selected')
    ui = base.Android(out=args.out, adb=args.adb)
    result = ui.out / 'persistence.json'
    if result.exists():
        raise ValueError('Use a fresh persistence output directory')
    installed = ui.installed()
    if not installed:
        raise ValueError('Finamp is not installed')
    raw = ui.adb('exec-out', 'cat', installed['path'], binary=True)
    expected = LIBRARY_SHA if args.mask == 0 else json.loads(args.native_report.read_text())['masks'][str(args.mask)]['native_sha256']
    with zipfile.ZipFile(io.BytesIO(raw)) as archive:
        assert hashlib.sha256(archive.read('lib/arm64-v8a/libapp.so')).hexdigest() == expected
        assert hashlib.sha256(archive.read('lib/arm64-v8a/libflutter.so')).hexdigest() == ENGINE_SHA
    baseline = json.loads(args.baseline_downloads.read_text())['files']
    assert len([name for name in baseline if name.startswith('songs/')]) == 8
    scenario = base.Acceptance(ui, features=args.mask & 7)
    report = {'outcome': 'IN_PROGRESS', 'mask': args.mask, 'installed': installed,
              'native_sha256': expected, 'device': ui.identity, 'metadata_seed_requested': args.seed_metadata}
    try:
        scenario.login(require_preserved=True)
        report['login'] = scenario.results['login']
        if args.seed_metadata:
            scenario.set_artist_mode('Metadata order')
            ui.launch(restart=True)
            scenario.login(require_preserved=True)
        scenario.settings()
        ui.scroll_to('Layout & Theme')
        ui.tap('Layout & Theme')
        ui.scroll_to('Theme')
        row = ui.find(ui.dump()[0], 'Theme')
        choices = [node.get('text') for node in row.iter('node')
                   if node.get('class') == 'android.widget.Button'
                   and node.get('text') in ('Follow system', 'Light', 'Dark')]
        assert choices == ['Dark'], 'Existing Dark theme was lost; refusing to repair it'
        ui.capture('preserved-dark-theme')
        report['theme'] = choices[0]
        if args.mask & 2:
            ui.scroll_to('Song artist order', contains=True)
            options = ('Album artists first', 'Metadata order', 'First credited artist first', 'Alphabetical')
            selected = []
            for _ in range(4):
                root, _ = ui.dump()
                for node in root.iter('node'):
                    if node.get('class') == 'android.widget.Button' and node.get('text') in options:
                        try:
                            ui.tap_bounds(node)  # Visibility validation only; no tap.
                            selected.append(node.get('text'))
                        except ValueError:
                            pass
                if selected:
                    break
                ui.scroll()
            assert len(selected) == 1, 'Missing or ambiguous artist-order selection'
            if args.expect_metadata or args.seed_metadata:
                assert selected == ['Metadata order'], 'Saved Metadata order was lost; refusing to repair it'
            report['artist_mode'] = selected[0]
            ui.capture('preserved-artist-mode')
            if args.expect_metadata or args.seed_metadata:
                report['actual_metadata_credits'] = base.FinalMatrix.credits(
                    scenario, 'B Guest, Z Lead, A Guest', 'preserved-metadata-credits')
        scenario.settings()
        ui.scroll_to('Downloads')
        ui.tap('Downloads')
        ui.scroll_to('Download Size Warning Cutoff', contains=True)
        row = ui.find(ui.dump()[0], 'Download Size Warning Cutoff', contains=True)
        fields = [node for node in row.iter('node') if node.get('class') == 'android.widget.EditText']
        assert len(fields) == 1 and fields[0].get('text') == '4', 'Existing warning cutoff changed'
        ui.capture('preserved-warning-cutoff')
        report['warning_cutoff'] = 4
        report['download_files'] = download_file_hashes(ui)
        assert all(report['download_files'].get(path) == digest for path, digest in baseline.items()), 'Original downloaded media changed'
        report['preserved_baseline_files'] = len(baseline)
        report['preserved_baseline_tracks'] = 8
        report['auxiliary_box'] = base.FinalMatrix.aux_file(ui)
        if args.aux_baseline:
            previous = json.loads(args.aux_baseline.read_text())['auxiliary_box']
            assert previous['present'] and report['auxiliary_box'] == previous, 'Saved auxiliary preference bytes changed'
        report['outcome'] = 'PASS'
    except Exception as error:
        report.update(outcome='FAIL', error=str(error))
        raise
    finally:
        base.write_json(result, report)
    print(json.dumps({'outcome': report['outcome'], 'mask': args.mask, 'report': str(result)}))


if __name__ == '__main__':
    main()
