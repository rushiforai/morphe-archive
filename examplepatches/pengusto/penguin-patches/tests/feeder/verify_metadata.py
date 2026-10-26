#!/usr/bin/env python3
"""Check generated metadata and Desktop inventory against the exact Android MPP."""
import argparse
import json
import re
import subprocess
import zipfile
from pathlib import Path

p = argparse.ArgumentParser(description=__doc__)
for name in ('java', 'desktop', 'mpp', 'metadata', 'artifacts'):
    p.add_argument('--' + name, type=Path, required=True)
p.add_argument('--expected-version', required=True)
a = p.parse_args(); a.artifacts.mkdir(parents=True, exist_ok=True)
data = json.loads(a.metadata.read_text())
with zipfile.ZipFile(a.mpp) as z:
    assert 'classes.dex' in z.namelist(), 'Android patch DEX missing; run buildAndroid before generation'
    version = re.search(r'^Version: (.+)$', z.read('META-INF/MANIFEST.MF').decode(), re.M)[1].strip()
assert data['version'] == version == a.expected_version
assert len(data['patches']) == 12
apps = {c['packageName'] for patch in data['patches'] for c in patch['compatiblePackages']}
assert len(apps) == 9
tasks = [patch for patch in data['patches'] if patch['name'] == 'Zoom article images']
assert len(tasks) == 1 and tasks[0]['compatiblePackages'][0]['packageName'] == 'com.nononsenseapps.feeder'
assert [v['version'] for v in tasks[0]['compatiblePackages'][0]['targets']] == ['2.25.0']
proc = subprocess.run([str(a.java), '-jar', str(a.desktop), 'list-patches', '--patches', str(a.mpp), '-p', '-v', '-o'],
                      capture_output=True, text=True, check=True)
text = proc.stdout + proc.stderr
(a.artifacts / 'morphe-overview.txt').write_text(text)
assert sorted(re.findall(r'^Name: (.+)$', text, re.M)) == sorted(patch['name'] for patch in data['patches'])
assert set(re.findall(r'Package name: (.+)$', text, re.M)) == apps
assert '2.25.0' in text and 'Feeder' in text
print('PASS: exact Android MPP, generated version, 12 patches / 9 apps and Desktop inventory agree')
