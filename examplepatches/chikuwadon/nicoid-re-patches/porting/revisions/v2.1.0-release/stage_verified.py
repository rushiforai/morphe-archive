#!/usr/bin/env python3
"""Assemble the reviewed dev.28 Smali into a stable 2.1.0 Morphe MPP.

Never publish the unmodified development MPP. All behavioral bytecode is built
from the supplied user-tested Smali, semantically compared with the reviewed
DEX, then only the three version literals are changed for stable release.
"""
from __future__ import annotations
import argparse
from copy import copy
import io
import os
import shutil
import subprocess
import sys
import tarfile
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile, ZIP_DEFLATED
from verify_dev28 import verified_archive, verify, safe_members, dex_check

VERSION = '2.1.0'
DEV_VERSION = '2.1.0-dev.28'
HELPER_VERSION_OWNERS = {
    Path('e/e/a/PatchVersion237.smali'): 1,
    Path('e/e/a/ModernShorts.smali'): 2,
}
TOOLS = ('assemble/*', 'dexlib2.jar', 'guava.jar')
OVERRIDES = ('nicoid/helpers.mpe','nicoid/method-delta.dex','nicoid/resources.zip')
FIX_MARKER = b'Missing original nicoid 6.49 APK entry'


def require(cond: bool,msg: str) -> None:
    if not cond:
        raise RuntimeError(msg)


def run(*args) -> None:
    print('$', ' '.join(map(str,args)),flush=True)
    subprocess.run([str(s) for s in args],check=True)


def disassemble(dex: Path, dest: Path, tools: Path) -> dict[Path,bytes]:
    cp = os.pathsep.join(str(tools / name) for name in TOOLS)
    run('java','-cp',cp,'org.jf.baksmali.Main','disassemble',dex,'-o',dest)
    return {p.relative_to(dest):p.read_bytes().replace(b'\r\n',b'\n') for p in dest.rglob('*.smali')}


def assemble(src: Path, dest: Path, tools: Path) -> None:
    cp = os.pathsep.join(str(tools / name) for name in TOOLS)
    run('java','-cp',cp,'org.jf.smali.Main','assemble','-a','28',src,'-o',dest)
    dex_check(dest.read_bytes(),dest.name)


def semantics_equal(actual: dict[Path,bytes],expected: dict[Path,bytes],label: str) -> None:
    require(actual.keys()==expected.keys(),f'{label}: class set differs, actual={len(actual)} expected={len(expected)}')
    modified=[str(path) for path in actual if actual[path]!=expected[path]]
    require(not modified, f'{label}: reassembled behavioral instructions differ: {modified[:12]} (total={len(modified)})')
    print(f'PASS: {label}: {len(actual)} byte-for-byte identical canonical Smali classes')


def main() -> None:
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiled',type=Path,help='Current Gradle-compiled 2.1.0 MPP')
    parser.add_argument('--output',type=Path)
    parser.add_argument('--source-only',action='store_true',help='Only prove reviewed sources and stable version-only changes')
    parser.add_argument('--tools',type=Path,required=True,help='Pinned smali 2.5.2 jar directory')
    args=parser.parse_args()
    if not args.source_only:
        require(args.compiled is not None and args.output is not None,'--compiled and --output are required')
        require(args.compiled.resolve()!=args.output.resolve(),'Do not overwrite Gradle compiled MPP during verification')
    verify()
    with TemporaryDirectory(prefix='nicoid-v210-approved-') as temporary:
        t=Path(temporary)
        with tarfile.open(fileobj=io.BytesIO(verified_archive()),mode='r:gz') as tf:
            safe_members(tf)
            tf.extractall(t,filter='data')
        original_mpp=t/'nicoid-re-v2.1.0-dev.28.mpp'
        for name in ('helpers','native'):
            src=t/('helpers-smali' if name=='helpers' else 'native-delta-smali')
            rebuilt=t/f'{name}-dev28.dex'
            assemble(src,rebuilt,args.tools)
            with ZipFile(original_mpp) as approved:
                reference=approved.read('nicoid/'+('helpers.mpe' if name=='helpers' else 'method-delta.dex'))
            reference_path=t/f'{name}-reference.dex';reference_path.write_bytes(reference)
            semantics_equal(disassemble(rebuilt,t/f'{name}-rebuilt-smali',args.tools),
                            disassemble(reference_path,t/f'{name}-approved-smali',args.tools),
                            name+' dev.28 source-to-DEX comparison')
        helper=t/'helpers-smali'
        for owner,count in HELPER_VERSION_OWNERS.items():
            file=helper/owner
            s=file.read_text(encoding='utf-8')
            require(s.count(DEV_VERSION)==count,'Unexpected version ownership in '+str(owner))
            file.write_text(s.replace(DEV_VERSION,VERSION),encoding='utf-8')
        stable_dex=t/'helpers-stable.dex'
        assemble(helper,stable_dex,args.tools)
        actual=disassemble(stable_dex,t/'helpers-stable-smali',args.tools)
        reference=disassemble(t/'helpers-reference.dex',t/'helpers-version-reference-smali',args.tools)
        require(actual.keys()==reference.keys(),'Stable rebuild changed the complete class set')
        changed={p for p in actual if actual[p]!=reference[p]}
        require(changed==set(HELPER_VERSION_OWNERS),'Unexpected stable DEX behavioral class modification: '+str(changed))
        for p in changed:
            require(actual[p].replace(VERSION.encode(),DEV_VERSION.encode())==reference[p],
                    'Stable DEX introduced differences beyond the version string: '+str(p))
        require(DEV_VERSION.encode() not in stable_dex.read_bytes(),'Development version remains in official helper DEX')
        if args.source_only:
            print('PASS: v2.1.0 Smali reviewed; stable helper changes are version-only')
            return
        with ZipFile(args.compiled) as compiled, ZipFile(original_mpp) as reviewed:
            require(compiled.testzip() is None,'Gradle MPP is corrupt')
            require(b'Version: '+VERSION.encode()+b'\r\n' in compiled.read('META-INF/MANIFEST.MF'),
                    'Gradle MPP must declare stable 2.1.0')
            require(b'Version: '+DEV_VERSION.encode()+b'\r\n' in reviewed.read('META-INF/MANIFEST.MF'),
                    'Approved MPP must remain dev28')
            require(all(x in compiled.namelist() and x in reviewed.namelist() for x in OVERRIDES),
                    'Missing required Morphe payload in current Gradle or reviewed MPP')
            require(compiled.read('nicoid/ui-strings.txt')==reviewed.read('nicoid/ui-strings.txt'),
                    'UI strings differ from reviewed artifact')
            require(compiled.read('nicoid/input-hashes.txt')==reviewed.read('nicoid/input-hashes.txt'),
                    'Original APK fingerprint requirements differ')
            code=[x for x in compiled.namelist() if x.endswith(('.class','.dex','.jar')) and not x.startswith('nicoid/')]
            require(any(FIX_MARKER in compiled.read(x) for x in code),
                    'Gradle build lost the current Morphe patch and manifest guard')
            # Use *current* Kotlin patch classes and extension code, but the
            # reviewed dev28 Smali-derived native payload and exact resources.
            overrides={
                'nicoid/helpers.mpe':stable_dex.read_bytes(),
                'nicoid/method-delta.dex':(t/'native-dev28.dex').read_bytes(),
                'nicoid/resources.zip':reviewed.read('nicoid/resources.zip'),
            }
            args.output.parent.mkdir(parents=True,exist_ok=True)
            with ZipFile(args.output,'w',compression=ZIP_DEFLATED,compresslevel=9) as stable:
                for entry in compiled.infolist():
                    stable.writestr(copy(entry),overrides.get(entry.filename,compiled.read(entry.filename)))
            with ZipFile(args.output) as stable:
                require(stable.testzip() is None,'Staged MPP failed ZIP integrity')
                require(b'Version: 2.1.0\r\n' in stable.read('META-INF/MANIFEST.MF'),'Official manifest not stable')
                for path,data in overrides.items():require(stable.read(path)==data,'Staged payload mismatch: '+path)
                for path in compiled.namelist():
                    if path not in overrides:require(stable.read(path)==compiled.read(path),'Other Gradle code changed: '+path)
                target=Path('patches/src/main/resources/nicoid')
                if target.exists():
                    for path,data in overrides.items():
                        (target/Path(path).name).write_bytes(data)
                print('PASS: stable v2.1.0 MPP from canonical Gradle code + reviewed Smali sources')
    import hashlib
    print('Staged MPP SHA-256',hashlib.sha256(args.output.read_bytes()).hexdigest())

if __name__=='__main__':main()