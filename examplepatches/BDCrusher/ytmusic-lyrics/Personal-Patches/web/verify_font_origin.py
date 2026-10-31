from pathlib import Path
import urllib.request, hashlib, json
root=Path(__file__).resolve().parents[1]
url='https://cdn.fontshare.com/wf/NWBQYJIM7GCZ5XWD7D26ARB3VDY55ZRT/K63EV2KZIGKLE7RANQ2U42S6SVHU5RJ7/X6XYTKIVDUW7GZTZPZNN4EUM5KH54KHF.woff2'
with urllib.request.urlopen(url,timeout=30) as response:
    font=response.read()
asset=root/'patches/src/main/resources/bdcrusher-lyrics/Satoshi-Variable.woff2'
expected=hashlib.sha256(asset.read_bytes()).hexdigest()
observed=hashlib.sha256(font).hexdigest()
if observed!=expected:raise RuntimeError('Official font differs from the pinned extension font; review before replacing')
asset.write_bytes(font)
license_url='https://raw.githubusercontent.com/evanw/esbuild/v0.25.12/LICENSE.md'
with urllib.request.urlopen(license_url,timeout=30) as response:
    (root/'third-party-notices/esbuild-MIT.txt').write_bytes(response.read())
(root.parent/'Verification/font-origin.json').write_text(json.dumps({'url':url,'sha256':observed,'bytes':len(font),'matchesPinnedExtensionFont':True},indent=2),encoding='utf-8')
print('Official Fontshare download matches pinned font:',observed)
