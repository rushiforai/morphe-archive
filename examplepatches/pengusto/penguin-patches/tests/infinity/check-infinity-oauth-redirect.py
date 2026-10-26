#!/usr/bin/env python3
"""Check the manifest and AuthTab contracts in the built APK, without tokens.
Usage: check-infinity-oauth-redirect.py APK DECODED_APK AAPT REDIRECT_URI
"""
import re,sys,subprocess
from pathlib import Path
from urllib.parse import urlsplit
apk,decoded,aapt,redirect=sys.argv[1:]
uri=urlsplit(redirect)
assert uri.scheme and uri.hostname
manifest=subprocess.check_output([aapt,'dump','xmltree',apk,'AndroidManifest.xml'],text=True)
i=manifest.index('LoginChromeCustomTabActivity')
block=manifest[i:manifest.index('      E: activity',i)]
assert f'="{uri.scheme}"' in block,'Browser callback scheme does not match OAuth'
assert f'="{uri.hostname}"' in block,'Browser callback authority does not match OAuth'
if uri.path:assert f'="{uri.path}"' in block
if uri.port:assert f'="{uri.port}"' in block
f=next(Path(decoded).glob('smali*/ml/docilealligator/infinityforreddit/activities/AppAuthLoginActivity.smali'))
s=f.read_text();i=s.index('androidx.browser.auth.extra.REDIRECT_SCHEME');fragment=s[i:i+220]
assert f'"{uri.scheme}"' in fragment,'AuthTab redirect scheme does not match OAuth'
print('PASS: browser callback and AuthTab scheme both match configured OAuth redirect')

remaining = []
for path in Path(decoded).glob('smali*/**/*.smali'):
    if '/app/morphe/extension/' not in str(path) and '"infinity://localhost"' in path.read_text():
        remaining.append(str(path.relative_to(decoded)))
assert not remaining, 'Unpatched OAuth redirect literals in app code: ' + ', '.join(remaining)
print('PASS: no original redirect remains in app token-exchange helpers')
