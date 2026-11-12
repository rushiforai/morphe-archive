#!/usr/bin/env python3
"""Vogelkop harness — upload big sandbox artifacts to the 'sandbox-storage'
prerelease.

The storage release holds binaries that must not go into git (this repo is
public and GitHub blocks files > 100 MiB): unpatched .apkm inputs, keystores,
diagnostic and test builds. It is marked prerelease WITHOUT any .mpp asset,
so Morphe Manager never offers it as a patch bundle.

This replaces the older scripts/upload_storage.py flow, which had stale paths
from the previous /tmp/my-project sandbox layout.

Usage:
  storage_upload.py [--clobber] FILE [FILE ...]

Token: $VOGELKOP_TOKEN_FILE or /home/z/my-project/.vault/github.token
       (fallback: the uploaded 'Vogelkop access key.txt')
"""
import json
import os
import sys
import time
import urllib.request

REPO = 'maniesh-NR/Vogelkop-MorphePatches'
TAG = 'sandbox-storage'
BODY = ("Temporary durable storage for the patch development sandbox. Holds the "
        "unpatched .apkm inputs, keystores, diagnostic and test builds so sandbox "
        "wipes stop losing work. **Wipe this release when the patches are declared "
        "working** (it contains the bundle signing key and the APK keystore; the "
        "repo is public). This release carries no .mpp and is marked prerelease, "
        "so Morphe Manager never offers it as a patch update.")


def token():
    paths = [
        os.environ.get('VOGELKOP_TOKEN_FILE', ''),
        '/home/z/my-project/.vault/github.token',
        '/home/z/my-project/upload/Vogelkop access key.txt',
    ]
    for p in paths:
        if p and os.path.isfile(p):
            return open(p).read().strip()
    raise SystemExit('no token found (looked at .vault/github.token and the upload key)')


def req(url, method='GET', data=None, headers=None, ok=(200, 201, 204)):
    h = {'Authorization': f'Bearer {token()}',
         'Accept': 'application/vnd.github+json',
         'User-Agent': 'vogelkop-harness'}
    h.update(headers or {})
    r = urllib.request.Request(url, data=data, headers=h, method=method)
    with urllib.request.urlopen(r) as resp:
        raw = resp.read()
        if resp.status not in ok:
            raise SystemExit(f'{method} {url} -> {resp.status}')
        if raw and resp.headers.get_content_type() == 'application/json':
            return json.loads(raw)
        return raw


def main():
    args = sys.argv[1:]
    clobber = '--clobber' in args
    files = [a for a in args if not a.startswith('--')]
    if not files:
        raise SystemExit(__doc__)

    api = f'https://api.github.com/repos/{REPO}'
    rel = next((r for r in req(f'{api}/releases?per_page=100')
                if r['tag_name'] == TAG), None)
    if rel is None:
        rel = req(f'{api}/releases', 'POST',
                  json.dumps({'tag_name': TAG, 'name': 'sandbox storage (temporary)',
                              'body': BODY, 'draft': False,
                              'prerelease': True}).encode(),
                  {'Content-Type': 'application/json'})
        print(f'created release {TAG} id={rel["id"]}')
    rid = rel['id']
    have = {a['name']: a['id'] for a in rel['assets']}

    failed = []
    for path in files:
        name = os.path.basename(path)
        if name in have:
            if clobber:
                req(f'{api}/releases/assets/{have[name]}', 'DELETE')
                print(f'  deleted existing {name}')
            else:
                print(f'  skip {name} (already uploaded; use --clobber to replace)')
                continue
        data = open(path, 'rb').read()
        for attempt in range(1, 6):
            try:
                resp = req(f'https://uploads.github.com/repos/{REPO}/releases/'
                           f'{rid}/assets?name={name}', 'POST', data,
                           {'Content-Type': 'application/octet-stream',
                            'Content-Length': str(len(data))})
                ok = isinstance(resp, dict) and resp.get('state') == 'uploaded'
                print(f'  uploaded {name} ({len(data)} bytes) ok={ok}', flush=True)
                break
            except Exception as e:
                print(f'  upload {name} attempt {attempt}/5 failed: {e}', flush=True)
                time.sleep(attempt * 3)
        else:
            failed.append(name)

    if failed:
        raise SystemExit(f'FAILED: {failed}')
    print('all storage assets uploaded')


if __name__ == '__main__':
    main()
