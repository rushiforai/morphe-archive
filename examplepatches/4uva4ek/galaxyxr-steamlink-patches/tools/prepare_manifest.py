"""Generate a consistent Morphe update manifest from the built release artifact."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib, json, re, zipfile

root = Path(__file__).resolve().parents[1]
version = re.search(r'^version\s*=\s*(\S+)', (root/'gradle.properties').read_text(), re.M).group(1)
if not re.fullmatch(r'\d+\.\d+\.\d+(?:-[a-zA-Z0-9.]+)?', version):
    raise SystemExit('Invalid release version')
catalog = json.loads((root/'patches-list.json').read_text())
if catalog['version'] != version or len(catalog['patches']) != 8:
    raise SystemExit('Build the matching eight-patch catalog first')
artifact = root.parent / f'builds/galaxyxr-steamlink-patches/gradle/patches/libs/patches-{version}.mpp'
with zipfile.ZipFile(artifact) as bundle:
    manifest = bundle.read('META-INF/MANIFEST.MF').decode()
    if f'Version: {version}' not in manifest or 'classes.dex' not in bundle.namelist():
        raise SystemExit('Bundle version or Android DEX missing')
sha = hashlib.sha256(artifact.read_bytes()).hexdigest()
description = 'Eight existing 4uva4ek patches: controllers, Galaxy XR vendor driver and OpenXR BOOST. Exact beta 2.0.24/5002527 plus retained earlier builds. Host patching validated; beta gameplay not yet validated.'
# Custom sources are decoded as ReleaseAsset with LocalDateTimeSerializer.
# It requires an ISO local date-time, without Z or an offset (time is UTC).
data = dict(created_at=datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%S'),
            description=description,
            download_url=f'https://github.com/4uva4ek/galaxyxr-steamlink-patches/releases/download/v{version}/patches-{version}.mpp',
            signature_download_url='',version=version)
(root/'patches-bundle.json').write_text(json.dumps(data,indent=2)+'\n',encoding='utf-8',newline='\n')
(artifact.parent/'SHA256SUMS.txt').write_text(f'{sha}  {artifact.name}\n',encoding='utf-8',newline='\n')
print(f'{artifact.name}: {sha}')
