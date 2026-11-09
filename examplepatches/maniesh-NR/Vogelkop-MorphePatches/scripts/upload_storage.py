#!/usr/bin/env python3
"""Create the sandbox-storage prerelease and upload all durable assets.

The storage release holds big binaries that would rot in wiped sandboxes:
unpatched .apkm inputs, keystores, diagnostic and test builds. Marked as a
prerelease WITHOUT any .mpp asset, so Morphe Manager never mistakes it for
a patch-bundle release (Manager only considers releases that carry a .mpp
asset and match the source's channel).
"""
import json
import os
import sys
import time
import urllib.request

TOK = open('/tmp/my-project/.github_token').read().strip()
REPO = 'maniesh-NR/Vogelkop-MorphePatches'
API = f'https://api.github.com/repos/{REPO}'
UP = f'https://uploads.github.com/repos/{REPO}'
HDR = {
    'Authorization': f'Bearer {TOK}',
    'Accept': 'application/vnd.github+json',
    'User-Agent': 'vogelkop-scripts',
}


def req(url, method='GET', data=None, headers=None, ok=(200, 201)):
    h = dict(HDR)
    h.update(headers or {})
    r = urllib.request.Request(url, data=data, headers=h, method=method)
    with urllib.request.urlopen(r) as resp:
        raw = resp.read()
        if resp.status not in ok:
            raise SystemExit(f'{method} {url} -> {resp.status}')
        if raw and (resp.headers.get_content_type() == 'application/json'):
            return resp.status, json.loads(raw)
        return resp.status, raw


def upload(rid, path, name, ctype='application/octet-stream', attempts=5):
    for n in range(1, attempts + 1):
        try:
            data = open(path, 'rb').read()
            st, resp = req(
                f'{UP}/releases/{rid}/assets?name={name}', 'POST', data,
                {'Content-Type': ctype, 'Content-Length': str(len(data))})
            ok = isinstance(resp, dict) and resp.get('state') == 'uploaded'
            print(f'  uploaded {name} ({len(data)} bytes) ok={ok}', flush=True)
            return True
        except Exception as e:
            print(f'  upload {name} attempt {n}/{attempts} failed: {e}', flush=True)
            time.sleep(n * 3)
    return False


def main():
    tag = 'sandbox-storage'
    # find or create the storage release (prerelease, so the stable channel ignores it)
    st, rels = req(f'{API}/releases?per_page=100')
    rel = next((r for r in rels if r['tag_name'] == tag), None)
    if rel is None:
        body = ("Temporary durable storage for the patch development sandbox. "
                "Holds the unpatched .apkm inputs, keystores, diagnostic and test "
                "builds so hourly sandbox wipes stop losing work. "
                "**Wipe this release when the patches are declared working** "
                "(it contains the bundle signing key and the APK keystore; the "
                "repo is public). This release carries no .mpp and is marked "
                "prerelease, so Morphe Manager never offers it as a patch update.")
        st, rel = req(f'{API}/releases', 'POST',
                      json.dumps({'tag_name': tag, 'name': 'sandbox storage (temporary)',
                                  'body': body, 'draft': False, 'prerelease': True}).encode(),
                      {'Content-Type': 'application/json'})
        print(f'created release {tag} id={rel["id"]}')
    else:
        print(f'existing release {tag} id={rel["id"]}')

    rid = rel['id']
    have = {a['name'] for a in rel['assets']}

    assets = [
        ('morphe-signing.key', '/home/z/my-project/morphe-signing.key', 'text/plain'),
        ('morphe.keystore', '/tmp/my-project/bin/morphe-data/morphe.keystore', 'application/octet-stream'),
        ('opera-stable-103.3.5234.91185.apkm',
         '/tmp/my-project/inputs/com.opera.browser_103.3.5234.91185-1910312306_2dpi_25lang_19feat_284fb24c1822752cbfff41b1a37bdec2_apkmirror.com.apkm',
         'application/octet-stream'),
        ('opera-beta-104.0.5262.91143.apkm',
         '/tmp/my-project/inputs/com.opera.browser.beta_104.0.5262.91143-1910404306_2dpi_25lang_19feat_c2b59ea30fab5744c9b5462fed6dd891_apkmirror.com.apkm',
         'application/octet-stream'),
        ('opera-gx-3.3.18-199.apkm',
         '/tmp/my-project/inputs/com.opera.gx_3.3.18-199_4arch_6dpi_38ea3b83aee91626dd5322b49f94e10f_apkmirror.com.apkm',
         'application/octet-stream'),
        ('opera-beta-DIAG00-pure-rebuild.apk',
         '/tmp/my-project/download/beta-diagnostic/opera-beta-DIAG00-pure-rebuild.apk', 'application/vnd.android.package-archive'),
        ('opera-beta-DIAG1-sigonly-v123.apk',
         '/tmp/my-project/download/beta-diagnostic/opera-beta-DIAG1-sigonly-v123.apk', 'application/vnd.android.package-archive'),
        ('opera-beta-DIAG2-nosig.apk',
         '/tmp/my-project/download/beta-diagnostic/opera-beta-DIAG2-nosig.apk', 'application/vnd.android.package-archive'),
        ('patched-beta-diagnostic-v1.2.5.apk',
         '/tmp/my-project/download/patched-beta-diagnostic-v1.2.5.apk', 'application/vnd.android.package-archive'),
        ('opera-gx-3.3.18-v1.2.6-test.apk',
         '/tmp/gxtest/opera-gx-3.3.18-v1.2.6-test.apk', 'application/vnd.android.package-archive'),
        ('opera-beta-104.0.5262-v1.2.6-test.apk',
         '/tmp/gxtest/opera-beta-104.0.5262-v1.2.6-test.apk', 'application/vnd.android.package-archive'),
        ('Vogelkop-Opera-Stable-103.3-patched-v1.2.4-full.apk',
         '/tmp/my-project/download/Vogelkop-Opera-Stable-103.3-patched-v1.2.4-full.apk', 'application/vnd.android.package-archive'),
        ('Vogelkop-Opera-Stable-103.3-patched-v1.2.4-nospoof.apk',
         '/tmp/my-project/download/Vogelkop-Opera-Stable-103.3-patched-v1.2.4-nospoof.apk', 'application/vnd.android.package-archive'),
        ('morphe-desktop-all.jar', '/tmp/my-project/bin/morphe-desktop-all.jar', 'application/java-archive'),
    ]

    failed = []
    for name, path, ctype in assets:
        if name in have:
            print(f'  skip {name} (already uploaded)')
            continue
        if not os.path.exists(path):
            print(f'  MISSING on disk: {path}')
            failed.append(name)
            continue
        if not upload(rid, path, name, ctype):
            failed.append(name)

    if failed:
        print('FAILED:', failed)
        sys.exit(1)
    print('all storage assets uploaded')


if __name__ == '__main__':
    main()
