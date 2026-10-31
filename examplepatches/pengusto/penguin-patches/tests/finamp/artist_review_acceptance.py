#!/usr/bin/env python3
"""Verify count loading/error states in an installed, hash-pinned Manager APK."""
import argparse
import hashlib
import io
import json
from pathlib import Path
import re
import time
import zipfile

import android_acceptance as base
from build_native_payloads import ENGINE_SHA


def download_file_hashes(ui):
    """Read only the disposable app's downloaded WAV/PNG files, never its DBs."""
    if base.PACKAGE != 'com.unicornsonlsd.finamp':
        raise ValueError('Unexpected package for download persistence inspection')
    prefix = '/data/user/0/' + base.PACKAGE + '/files/'
    paths = []
    for folder, suffix in [('songs', 'wav'), ('images', 'png')]:
        files = ui.adb('shell', 'su', '0', 'find', prefix + folder, '-maxdepth', '1', '-type', 'f').splitlines()
        for path in files:
            name = path.removeprefix(prefix + folder + '/')
            if name == 'album_white.png':
                continue  # Copied UI placeholder, not a downloaded item.
            if not re.fullmatch(r'[0-9a-f-]+\.' + suffix, name):
                raise ValueError('Unexpected file in the synthetic download directory')
            paths.append(path)
    if not paths:
        return {}
    output = ui.adb('shell', 'su', '0', 'sha256sum', *sorted(paths))
    hashes = {}
    for line in output.splitlines():
        digest, path = line.split(None, 1)
        if path not in paths or not re.fullmatch('[0-9a-f]{64}', digest):
            raise ValueError('Malformed downloaded-file hash receipt')
        hashes[path.removeprefix(prefix)] = digest
    if len(hashes) != len(paths):
        raise ValueError('Incomplete downloaded-file inventory')
    return hashes


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adb', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--native-report', type=Path, required=True)
    parser.add_argument('--mask', type=int, choices=[i for i in range(128) if i & 4], required=True)
    parser.add_argument('--probe', choices=('count-states', 'performance', 'guest-warning'), default='count-states')
    args = parser.parse_args()
    ui = base.Android(out=args.out, adb=args.adb)
    result_path = ui.out / ('artist-' + args.probe + '.json')
    if result_path.exists():
        raise ValueError('Use a fresh acceptance output directory')
    installed = ui.installed()
    if not installed:
        raise ValueError('No installed Finamp APK')
    raw = ui.adb('exec-out', 'cat', installed['path'], binary=True)
    expected = json.loads(args.native_report.read_text())['masks'][str(args.mask)]
    sha = lambda data: hashlib.sha256(data).hexdigest()
    with zipfile.ZipFile(io.BytesIO(raw)) as archive:
        assert sha(archive.read('lib/arm64-v8a/libapp.so')) == expected['native_sha256']
        assert sha(archive.read('lib/arm64-v8a/libflutter.so')) == ENGINE_SHA
    scenario = base.Acceptance(ui, features=4)
    report = {'outcome': 'IN_PROGRESS', 'installed': installed, 'mask': args.mask,
              'native': expected, 'device': ui.identity, 'cases': {},
              'downloads_before': download_file_hashes(ui)}

    def wait_for(text, *, require_preview=False):
        deadline = time.monotonic() + 25
        while time.monotonic() < deadline:
            root, _ = ui.dump()
            if scenario.has(root, text) and (not require_preview or scenario.has(root, 'Top Tracks')):
                return root
            time.sleep(0.2)
        raise AssertionError('Expected installed-APK text absent: ' + text)

    def open_artist(mode):
        scenario.fixture.call('/_fixture/release', method='POST')
        ui.launch(restart=True)
        scenario.album()
        since = scenario.fixture.call('/_fixture/requests')['lastId']
        scenario.fixture.call('/_fixture/control', method='POST',
                              body={'mode': mode, 'scope': 'artist-count', 'holdTimeoutSeconds': 120})
        ui.tap('Z Lead (Artist)\nZ Lead')
        return since

    try:
        scenario.login(require_preserved=True)
        if args.probe == 'performance':
            scenario.performance()
            report['cases']['performance'] = scenario.results['performance']
            report['downloads_after'] = download_file_hashes(ui)
            assert all(report['downloads_after'].get(path) == digest
                       for path, digest in report['downloads_before'].items()), 'Existing downloaded media changed'
            report['outcome'] = 'PASS'
            print(json.dumps({'outcome': 'PASS', 'mask': args.mask, 'report': str(result_path)}))
            return
        if args.probe == 'guest-warning':
            scenario.home()
            ui.tap('Artists\nTab 3 of 6')
            if not scenario.has(ui.dump()[0], 'B Guest'):
                ui.tap('Performing Artists')
            ui.tap('B Guest')
            root = wait_for('6 Tracks', require_preview=True)
            assert scenario.has(root, '0 Albums')
            ui.capture('guest-header')
            since = scenario.fixture.call('/_fixture/requests')['lastId']
            root, _ = ui.dump()
            # The pinned APK exposes no label on Download or More. Their
            # left-to-right identity was verified in the raw header capture.
            header = []
            for node in root.iter('node'):
                if node.get('class') != 'android.widget.Button' or node.get('text') or node.get('content-desc'):
                    continue
                try:
                    bounds = ui.tap_bounds(node)
                except ValueError:
                    continue
                if 800 < bounds[0] < bounds[2] <= 1080 and 48 <= bounds[1] < bounds[3] <= 160:
                    header.append(bounds)
            header.sort()
            assert len(header) == 2 and header[1][2] == 1080, 'Ambiguous Download/More header controls'
            x, y, right, bottom = header[0]
            ui.adb('shell', 'input', 'tap', (x + right) // 2, (y + bottom) // 2)
            wait_for('Warning: You are about to download 6 tracks.')
            ui.capture('guest-download-warning')
            ui.tap('Cancel')
            logs = scenario.fixture.call('/_fixture/requests?since=' + str(since))
            assert not any(r.get('unboundedTrackQuery') for r in logs['requests'])
            base.write_json(ui.out / 'guest-warning-requests.json', logs)
            report['downloads_after'] = download_file_hashes(ui)
            assert all(report['downloads_after'].get(path) == digest
                       for path, digest in report['downloads_before'].items()), 'Existing downloaded media changed'
            report['cases']['guest-warning'] = {'tracks': 6, 'albums': 0, 'warning_tracks': 6,
                                               'dialog_cancelled': True, 'unbounded_enumeration': False}
            report['outcome'] = 'PASS'
            print(json.dumps({'outcome': 'PASS', 'mask': args.mask, 'report': str(result_path)}))
            return
        since = open_artist('hold')
        root = wait_for('Loading...')  # Exact English text in the compiled 1.0.1 APK.
        assert not scenario.has(root, '0 Tracks')
        album_before = ui.bounds(scenario.exact(root, '1 Album'))
        ui.capture('count-loading')
        pending = scenario.fixture.call('/_fixture/requests?since=' + str(since))
        assert pending['pending'] == 1
        assert not any(r.get('unboundedTrackQuery') for r in pending['requests'])
        assert any(r.get('artistTrackQuery') and r.get('status') == 200
                   and r['query'].get('limit') == ['5'] for r in pending['requests'])
        base.write_json(ui.out / 'count-pending-requests.json', pending)
        scenario.fixture.call('/_fixture/release', method='POST')
        preview_while_held = scenario.has(root, 'Top Tracks')
        root = wait_for('8 Tracks', require_preview=True)
        assert ui.bounds(scenario.exact(root, '1 Album')) == album_before
        ui.capture('count-resolved-with-preview')
        report['cases']['loading'] = {'preview_visible_while_held': preview_while_held,
                                      'preview_visible_after_release': True, 'album_row_stable': True,
                                      'pending_bounded_requests': 1, 'resolved_total': 8,
                                      'runtime_note': 'The release API isolate serializes requests; a held count can delay the second preview request.'}
        since = open_artist('reject')
        root = wait_for('Error loading items.', require_preview=True)
        assert scenario.has(root, 'Top Tracks') and not scenario.has(root, '0 Tracks')
        ui.capture('count-error-with-preview')
        failed = scenario.fixture.call('/_fixture/requests?since=' + str(since))
        assert any(r.get('artistCountQuery') and r.get('status') == 503 for r in failed['requests'])
        assert not any(r.get('unboundedTrackQuery') for r in failed['requests'])
        base.write_json(ui.out / 'count-error-requests.json', failed)
        report['cases']['error'] = {'preview_visible': True, 'false_zero_absent': True,
                                    'unbounded_fallback_absent': True}
        report['downloads_after'] = download_file_hashes(ui)
        assert all(report['downloads_after'].get(path) == digest
                   for path, digest in report['downloads_before'].items()), 'Existing downloaded media changed'
        report['outcome'] = 'PASS'
    except Exception as error:
        report.update(outcome='FAIL', error=str(error))
        raise
    finally:
        scenario.fixture.call('/_fixture/release', method='POST')
        base.write_json(result_path, report)
    print(json.dumps({'outcome': report['outcome'], 'mask': args.mask, 'report': str(result_path)}))


if __name__ == '__main__':
    main()
