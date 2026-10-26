#!/usr/bin/env python3
"""Assert fail-closed patch options using synthetic values, never real credentials.
Usage: check_invalid_options.py DESKTOP_JAR BUNDLE ORIGINAL_APK OUTPUT_DIRECTORY
"""
from pathlib import Path
import json, subprocess, sys
cli, bundle, apk, out = map(Path, sys.argv[1:])
out.mkdir(parents=True, exist_ok=True)
base = {'client-id': 'AAAAAAAAAAAAAAAAAAAAAA', 'redirect-uri': 'penguin-test://callback',
        'user-agent': 'io.github.pengusto.infinity-test/8.3.4'}
cases = [('missing-client', 'client-id', None), ('blank-client', 'client-id', ''),
         ('blank-agent', 'user-agent', ''), ('missing-redirect', 'redirect-uri', None),
         ('query-redirect', 'redirect-uri', 'penguin-test://callback?code=value'),
         ('credential-redirect', 'redirect-uri', 'penguin-test://user:secret@callback'),
         ('web-redirect', 'redirect-uri', 'https://example.invalid/callback')]
for label, key, value in cases:
    options = dict(base)
    if value is None: options.pop(key)
    else: options[key] = value
    report = out / (label + '.json')
    cmd = ['java', '-jar', str(cli), 'patch', '--exclusive', '-p', str(bundle),
           '-e', 'Configure custom OAuth for Infinity+']
    for k, v in options.items(): cmd += ['-O', k + '=' + v]
    cmd += ['--unsigned', '-o', str(out / (label + '.apk')), '-r', str(report), str(apk)]
    result = subprocess.run(cmd, capture_output=True, text=True)
    assert result.returncode != 0, label + ' unexpectedly patched successfully'
    assert report.exists(), label + ' failed before the patch ran'
    data = json.loads(report.read_text())
    # Require a patch failure, not a transport/setup/CLI failure.
    assert 'Configure custom OAuth for Infinity+' in result.stdout + result.stderr, label
    assert 'failed' in (result.stdout + result.stderr).lower(), label
    print('PASS: rejects ' + label)
