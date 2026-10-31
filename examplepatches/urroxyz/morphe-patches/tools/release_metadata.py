#!/usr/bin/env python3
"""Validate the curated Android bundle and generate standard source metadata."""
from pathlib import Path
import datetime, hashlib, json, zipfile
r=Path(__file__).resolve().parents[1]
version=next(line.split('=',1)[1].strip() for line in (r/'gradle.properties').read_text().splitlines() if line.strip().startswith('version'))
artifact=r/f'patches/build/libs/patches-{version}.mpp'
catalog=json.loads((r/'patches-list.json').read_text())
expected={'Dark mode','Bike mode','Physical Activity spoof [TRANSMITTER]','Physical Activity spoof [RECEIVER]','Personal Maps API key','Custom weather sources','ClipCascade sync','Better translate UX'}
assert catalog['version']==version
assert len(catalog['patches'])==8 and {p['name'] for p in catalog['patches']}==expected
with zipfile.ZipFile(artifact) as z:
 assert z.testzip() is None
 manifest=z.read('META-INF/MANIFEST.MF').decode()
 assert '\nName: Urro\n' in manifest.replace('\r\n','\n'), 'Wrong source branding'
 assert '\nVersion: '+version+'\n' in manifest.replace('\r\n','\n')
 assert z.read('extensions/extension.mpe')[:4]==b'dex\n', 'Android extension DEX missing'
 assert z.read('extensions/activity-spoof.mpe')[:4]==b'dex\n', 'Activity extension DEX missing'
 assert z.read('extensions/gboard.mpe')[:4]==b'dex\n', 'Gboard extension DEX missing'
 assert z.read('classes.dex')[:4]==b'dex\n', 'Manager patch DEX missing; run buildAndroid last'
 assert not any('youtubemusic' in n.lower() or 'lyrics' in n.lower() for n in z.namelist())
# Morphe Manager parses created_at as a kotlinx LocalDateTime: UTC, no offset, no fraction.
created_at=datetime.datetime.now(datetime.timezone.utc).strftime('%Y-%m-%dT%H:%M:%S')
import re
assert re.fullmatch(r'\d{4}-\d\d-\d\dT\d\d:\d\d:\d\d',created_at),created_at
metadata={'created_at':created_at,'description':'Amazon dark mode, Transit Bike mode and activity transmission, universal activity receiver, Niagara custom weather sources, and Gboard clipboard/translation tools.','download_url':f'https://github.com/urroxyz/morphe-patches/releases/download/v{version}/{artifact.name}','signature_download_url':'','version':version}
for endpoint in ('patches-bundle.json','amazon/patches-bundle.json'):
 # Both supported source URLs point to the same bundle.
 (r/endpoint).parent.mkdir(exist_ok=True)
 (r/endpoint).write_text(json.dumps(metadata,indent=2)+'\n')
# Manager looks for the PNG next to each JSON endpoint.
(r/'amazon/patches-bundle.png').write_bytes((r/'patches-bundle.png').read_bytes())
(r/'SHA256SUMS.txt').write_text(hashlib.sha256(artifact.read_bytes()).hexdigest()+'  '+artifact.name+'\n')
print('PASS: exactly the eight curated patches; Android DEX and extension present; release metadata generated')
