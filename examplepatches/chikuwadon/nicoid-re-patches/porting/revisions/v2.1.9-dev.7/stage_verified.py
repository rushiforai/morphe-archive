#!/usr/bin/env python3
"""Rebuild the device-validated v2.1.9-dev.7 from immutable v2.1.8 and source diffs.

No local intermediate candidate or expired CI artifact is required. Verify every
runtime class and other member against the device-tested bundle. Reassembly
may change DEX byte layout; the normalized smali hashes must match exactly.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import struct
import subprocess
import tempfile
from urllib.request import urlopen
from zipfile import ZipFile, ZipInfo
import zlib

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
VERSION = '2.1.9-dev.7'
BASE_URL = 'https://github.com/chikuwadon/nicoid-re-patches/releases/download/v2.1.8/patches-2.1.8.mpp'
BASE_SHA = '8a1a2b226b08bec55d604136ce5cd4664943ede65ea99b9b548465e3fad230a4'
FAMILIES = ('com/google/common/', 'com/google/thirdparty/', 'androidx/concurrent/futures/', 'androidx/exifinterface/')
TOOL_PATHS = ('assemble/baksmali.jar','assemble/smali.jar','assemble/util.jar','assemble/jcommander.jar','assemble/antlr.jar','assemble/antlr-runtime.jar','assemble/stringtemplate.jar','dexlib2.jar')
EXPECTED_SMALI = {'helpers.mpe':(7688,'a5b10afe0e58a97b93ecb8a96c58fda21c58c18558646b2eb8b909cacdd1cc9c'), 'extension.mpe':(2015,'9bffb02db3220f4f0a2f2280de2fc4ee796f7ca81bbe1c7687975b054a9db661'), 'method-delta.dex':(160,'d63f4d221efb63c90c15f05c39ad51a66d886d6636ded868520fe46bd9845f36')}
MEMBERS = {'helpers.mpe':'nicoid/helpers.mpe','extension.mpe':'extensions/extension.mpe','method-delta.dex':'nicoid/method-delta.dex'}
MANIFEST = 'META-INF/MANIFEST.MF'


def require(ok, message):
    if not ok: raise ValueError(message)


def digest(b): return hashlib.sha256(b).hexdigest()


def verified_file(p, sha):
    require(p.is_file() and digest(p.read_bytes()) == sha, 'SHA-256 mismatch: ' + str(p))
    return p


def download(url, p, sha):
    if not p.exists():
        require(url.startswith('https://'), 'Insecure dependency URL')
        with urlopen(url, timeout=180) as r, p.open('wb') as f: shutil.copyfileobj(r, f)
    return verified_file(p, sha)


def run(*args, **kwargs): subprocess.run([str(x) for x in args], check=True, **kwargs)


def files(root): return {p.relative_to(root).as_posix():p for p in root.rglob('*.smali')}


def check_tree(root, name):
    actual = files(root)
    h = hashlib.sha256()
    for k, p in sorted(actual.items()): h.update(k.encode() + b'\0' + hashlib.sha256(p.read_bytes()).digest())
    require((len(actual), h.hexdigest()) == EXPECTED_SMALI[name], 'Runtime class inventory mismatch: ' + name)


def check_dex(data, name):
    require(data.startswith(b'dex\n') and len(data)>=112,'Invalid DEX: '+name)
    require(struct.unpack_from('<I',data,32)[0]==len(data),'DEX size mismatch: '+name)
    require(hashlib.sha1(data[32:]).digest()==data[12:32],'DEX SHA1 mismatch: '+name)
    require(zlib.adler32(data[12:])==struct.unpack_from('<I',data,8)[0],'DEX checksum mismatch: '+name)
    require(struct.unpack_from('<I',data,88)[0]<=65536 and struct.unpack_from('<I',data,80)[0]<=65536,'DEX ID limit: '+name)


def stage(compiled, output, base=None, libs=None, tools=None):
    lock = json.loads((HERE/'runtime-dependencies.lock.json').read_text())
    layout = json.loads((HERE/'approved-layout.json').read_text())
    approved = {x['name']:x for x in layout['members']}
    require(layout['mpp_sha256'] == 'ea951e84930b393130dff2381d2aa549ab41519ba557e15daa50b99239d68528', 'Wrong approved candidate')
    output.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='nicoid-v219-verified-') as t:
        work = Path(t)
        base = verified_file(base, BASE_SHA) if base else download(BASE_URL, work/'base.mpp', BASE_SHA)
        if libs is None:
            libs = work/'libs'; libs.mkdir()
            sdk = os.environ.get('ANDROID_HOME') or os.environ.get('ANDROID_SDK_ROOT')
            require(sdk, 'Android SDK path not set')
            jar = Path(sdk)/'platforms'/lock['sdk']['platform']/'android.jar'
            shutil.copyfile(verified_file(jar, lock['sdk']['sha256']), libs/'android.jar')
        verified_file(libs/'android.jar', lock['sdk']['sha256'])
        for a in lock['artifacts']: download(a['url'], libs/a['name'], a['sha256'])
        toolroot = ROOT/'porting/revisions/v2.0.0-dev.1'
        tools = tools or toolroot/'tools'
        if not all((tools/n).is_file() for n in TOOL_PATHS):
            run('python3', ROOT/'porting/revisions/v2.1.0-release/prepare_smali_tools.py')
        tool_lock = {x['path']:x['sha256'] for x in json.loads((toolroot/'tool-dependencies.lock.json').read_text())}
        classpath = os.pathsep.join([str(verified_file(tools/n,tool_lock['tools/'+n])) for n in TOOL_PATHS] + [str(libs/'guava-new.jar'),str(libs/'failureaccess-new.jar')])
        java = ['java','-Xmx2g','-cp',classpath]
        def disassemble(dex, dest): run(*java,'org.jf.baksmali.Main','disassemble','--sequential-labels',dex,'-o',dest)
        def assemble(folder,dex): run(*java,'org.jf.smali.Main','assemble','-a','28',folder,'-o',dex)
        with ZipFile(base) as old, ZipFile(compiled) as ci:
            require(old.testzip() is None and ci.testzip() is None, 'Invalid input ZIP')
            require(set(old.namelist()) == set(ci.namelist()) == set(approved), 'Unexpected MPP layout')
            # Recompile the Morphe root in CI; keep the approved APK payload.
            for n in approved:
                if n.endswith('.class') or n=='classes.dex' or n.endswith('.kotlin_module'):
                    require(digest(ci.read(n)) == approved[n]['sha256'], 'Fresh patch root differs: '+n)
            manifest = ci.read(MANIFEST)
            require(b'Patcher-Version: 2.5.0\r\n' in manifest, 'Unexpected patcher version')
            require(b'Version: 2.1.9-dev.7\r\n' in manifest or (digest(compiled.read_bytes()) == '302715a10c994f1dc12bb6549d0a5e093c6b365382262a722283b69280efd11f' and b'Version: 2.1.8\r\n' in manifest), 'Incorrect compiled version')
            # Only these four Android runtime families are changed. Pinned D8
            # uses the API 35 SDK and min-api 28 as in the approved build.
            with ZipFile(libs/'exif-new.aar') as z: (work/'exif.jar').write_bytes(z.read('classes.jar'))
            d8 = work/'d8'; d8.mkdir()
            run('java','-Xmx2g','-cp',libs/'r8.jar','com.android.tools.r8.D8','--release','--min-api','28','--lib',libs/'android.jar','--output',d8,libs/'guava-new.jar',libs/'failureaccess-new.jar',libs/'concurrent-new.jar',work/'exif.jar')
            require([p.name for p in d8.glob('*.dex')]==['classes.dex'], 'Unexpected multidex runtime')
            updated_libs = work/'new-libs'; disassemble(d8/'classes.dex',updated_libs)
            new = files(updated_libs)
            require(len(new)==2268 and all(k.startswith(FAMILIES) for k in new), 'Unexpected new library family')
            payload = {}
            for name, member in MEMBERS.items():
                dex = work/name; dex.write_bytes(old.read(member))
                smali = work/(name+'.smali'); disassemble(dex, smali)
                # Apply readable source differences, no fuzzy or partial matches.
                with (HERE/(name+'.diff')).open('rb') as patch:
                    run('patch','--batch','--forward','--fuzz=0','--no-backup-if-mismatch','-p1',stdin=patch,cwd=smali)
                if name=='helpers.mpe':
                    remove = {k:p for k,p in files(smali).items() if k.startswith(FAMILIES)}
                    require(len(remove)==2169,'Unexpected baseline library count')
                    for p in remove.values(): p.unlink()
                    for k,p in new.items():
                        dst=smali/k; require(not dst.exists(),'Library class collision'); dst.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(p,dst)
                check_tree(smali,name)
                rebuilt = work/(name+'.rebuilt')
                assemble(smali,rebuilt)
                check=work/(name+'.check');disassemble(rebuilt,check);check_tree(check,name)
                payload[member]=rebuilt.read_bytes()
                check_dex(payload[member],member)
            payload[MANIFEST]=(HERE/'approved-manifest.txt').read_bytes()
            require(b'Version: 2.1.9-dev.7\r\n' in payload[MANIFEST], 'Wrong approved manifest')
            temp=output.with_name(output.name+'.tmp')
            try:
                with ZipFile(temp,'w') as out:
                    for a in layout['members']:
                        n=a['name']; data=payload.get(n,old.read(n))
                        if n not in MEMBERS.values(): require(digest(data)==a['sha256'], 'Approved non-runtime member mismatch: '+n)
                        i=ZipInfo(n,tuple(a['date_time'])); i.compress_type=a['compress_type']; i.external_attr=a['external_attr']; i.internal_attr=a['internal_attr']; i.create_system=a['create_system']; i.create_version=a['create_version']; i.extract_version=a['extract_version']; i.extra=bytes.fromhex(a['extra']); i.comment=bytes.fromhex(a['comment']);out.writestr(i,data)
                with ZipFile(temp) as result:
                    require(result.testzip() is None,'Output CRC mismatch')
                temp.replace(output)
                print('PASS: every runtime smali class matches the device-tested candidate; all other members byte-identical')
                print('Device-tested SHA-256:',layout['mpp_sha256'])
                print('Rebuilt SHA-256:',digest(output.read_bytes()))
                print('Exact ZIP byte match:',digest(output.read_bytes())==layout['mpp_sha256'])
            finally: temp.unlink(missing_ok=True)


if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__)
    for n in ['compiled','output','base','libs','tools']:p.add_argument('--'+n,type=Path,required=n in ['compiled','output'])
    a=p.parse_args();stage(a.compiled.resolve(),a.output.resolve(),a.base and a.base.resolve(),a.libs and a.libs.resolve(),a.tools and a.tools.resolve())
