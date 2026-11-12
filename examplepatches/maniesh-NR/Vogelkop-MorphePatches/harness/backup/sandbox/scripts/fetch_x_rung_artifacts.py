#!/usr/bin/env python3
"""Fetch X-rung build artifacts from the sandbox-storage prerelease.

Downloads (into /home/z/my-project/work/dl/):
  - C1-morphe-v130-nospoof-v123.apk   (substrate)
  - morphe.keystore                   (signing key)
  - W-rung-rebuilt-classes3.dex       (W2 patched dex — X-rung base)
  - W-RUNG-SHA256SUMS.txt, C-SHA256SUMS.txt

Verifies every file against the fetched sums files where covered.
"""
import hashlib
import os
import sys
import urllib.request

REPO = 'maniesh-NR/Vogelkop-MorphePatches'
TAG = 'sandbox-storage'
DL = '/home/z/my-project/work/dl'
TOKEN = '/home/z/my-project/.vault/github.token'

WANT = [
    'C1-morphe-v130-nospoof-v123.apk',
    'morphe.keystore',
    'W-rung-rebuilt-classes3.dex',
    'W-RUNG-SHA256SUMS.txt',
    'C-SHA256SUMS.txt',
]


def token():
    return open(TOKEN).read().strip()


def api(url):
    req = urllib.request.Request(
        url, headers={'Authorization': f'Bearer {token()}',
                      'Accept': 'application/vnd.github+json',
                      'User-Agent': 'vogelkop-harness'})
    with urllib.request.urlopen(req) as r:
        return r.read()


def main():
    os.makedirs(DL, exist_ok=True)
    rel = api(f'https://api.github.com/repos/{REPO}/releases/tags/{TAG}')
    import json
    assets = {a['name']: a for a in json.loads(rel)['assets']}
    for name in WANT:
        a = assets.get(name)
        if not a:
            sys.exit(f'missing asset: {name}')
        url = a['url']  # asset API url -> binary with Accept: octet-stream
        dest = os.path.join(DL, name)
        if os.path.isfile(dest) and os.path.getsize(dest) == a['size']:
            print(f'have   {name} ({a["size"]:,} B)')
            continue
        print(f'fetch  {name} ({a["size"]:,} B) ...')
        req = urllib.request.Request(
            url, headers={'Authorization': f'Bearer {token()}',
                          'Accept': 'application/octet-stream',
                          'User-Agent': 'vogelkop-harness'})
        with urllib.request.urlopen(req) as r, open(dest + '.part', 'wb') as f:
            while True:
                chunk = r.read(1 << 20)
                if not chunk:
                    break
                f.write(chunk)
        os.rename(dest + '.part', dest)
        print(f'  ok    {name}')
    # verify hashes from the sums files that cover our files
    covered = {}
    for sums in ('W-RUNG-SHA256SUMS.txt', 'C-SHA256SUMS.txt'):
        with open(os.path.join(DL, sums)) as f:
            for line in f:
                parts = line.split()
                if len(parts) == 2:
                    covered[parts[1]] = parts[0]
    ok = True
    for name in WANT:
        if name in covered:
            h = hashlib.sha256(
                open(os.path.join(DL, name), 'rb').read()).hexdigest()
            mark = 'OK ' if h == covered[name] else 'BAD'
            if h != covered[name]:
                ok = False
            print(f'{mark}  {name}  {h[:16]}...')
    if not ok:
        sys.exit('hash mismatch')
    print('all verified')


if __name__ == '__main__':
    main()
