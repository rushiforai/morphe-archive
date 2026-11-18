#!/usr/bin/env python3
"""Fetch only SHA-256 locked Smali 2.5.2 assembly dependencies."""
from concurrent.futures import ThreadPoolExecutor
from hashlib import sha256
import json
from pathlib import Path
from urllib.request import urlretrieve

ROOT=Path(__file__).resolve().parents[1] / 'v2.0.0-dev.1'
locked=json.loads((ROOT/'tool-dependencies.lock.json').read_text())
required=[x for x in locked if x['path'].startswith('tools/assemble/') or x['path'] in ('tools/dexlib2.jar','tools/guava.jar')]
assert len(required)>=8,'Pinned Smali assembly graph unexpectedly incomplete'

def obtain(x):
    p=ROOT/x['path'];p.parent.mkdir(parents=True,exist_ok=True)
    if p.is_file() and sha256(p.read_bytes()).hexdigest()==x['sha256']:return
    temporary=p.with_name(p.name+'.download')
    urlretrieve(x['url'],temporary)
    if sha256(temporary.read_bytes()).hexdigest()!=x['sha256']:
        temporary.unlink(missing_ok=True)
        raise ValueError('Pinned source assembler mismatch: '+p.name)
    temporary.replace(p)

if __name__=='__main__':
    with ThreadPoolExecutor(max_workers=5) as pool:list(pool.map(obtain,required))
    print('PASS: pinned Smali 2.5.2 and dependencies',len(required))
