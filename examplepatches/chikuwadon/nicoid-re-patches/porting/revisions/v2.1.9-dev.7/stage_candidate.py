#!/usr/bin/env python3
"""Build dev.7 from verified dev.6, using stable runtime dependencies and CI-proven patcher output."""
import argparse, hashlib, json, os, shutil, subprocess, sys, tempfile, struct, zlib
from copy import copy
from pathlib import Path
from zipfile import ZipFile
from datetime import datetime, timezone
BASE_SHA='44524586c98c4fdce3e614c542f8f49c55f3481093be9aea2f00dd5813823a18'
CI_MPP_SHA='302715a10c994f1dc12bb6549d0a5e093c6b365382262a722283b69280efd11f'
BASE='2.1.9-dev.6'; VERSION='2.1.9-dev.7'
FAMILY=('com/google/common/','com/google/thirdparty/','androidx/concurrent/futures/','androidx/exifinterface/')
HELPERS='nicoid/helpers.mpe'; EXTENSION='extensions/extension.mpe'; MANIFEST='META-INF/MANIFEST.MF'
def require(condition,message):
    if not condition:raise ValueError(message)
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def run(args):subprocess.run(list(map(str,args)),check=True)
def listing(root):return {p.relative_to(root).as_posix():p for p in root.rglob('*.smali')}
def replace_version(p):
    s=p.read_bytes();require(BASE.encode() in s,'Version anchor missing: '+str(p));p.write_bytes(s.replace(BASE.encode(),VERSION.encode()))
def dex_info(b):
    require(b.startswith(b'dex\n') and len(b)>=112,'bad DEX')
    require(struct.unpack_from('<I',b,32)[0]==len(b),'DEX size')
    require(hashlib.sha1(b[32:]).digest()==b[12:32],'DEX SHA1')
    require(zlib.adler32(b[12:])==struct.unpack_from('<I',b,8)[0],'DEX Adler32')
    return {'size':len(b),'classes':struct.unpack_from('<I',b,96)[0],'methods':struct.unpack_from('<I',b,88)[0],'fields':struct.unpack_from('<I',b,80)[0]}
def stage(base,ci_mpp,libs,tools,output):
    require(sha(base)==BASE_SHA,'dev.6 input SHA mismatch')
    require(sha(ci_mpp)==CI_MPP_SHA,'CI toolchain MPP SHA mismatch')
    require(sha(libs/'SHA256SUMS')=='63fa5011e8c0a60597e2e0521758efcea41c4b231671d36680820594b3c9b7c1','Runtime dependency lock mismatch')
    for line in (libs/'SHA256SUMS').read_text().splitlines():
        digest,name=line.split(maxsplit=1);require(sha(libs/name.strip())==digest,'Dependency hash mismatch: '+name)
    for name,digest in {'assemble/baksmali.jar': '1ed236266d7dc4907aade0b19a34f77efac25342b63c8ace52e579039941b389', 'assemble/smali.jar': '136c5c4653d6531bd7b6f10f35f8691cb96432e727d30b4d5579826ee01e9419', 'assemble/util.jar': '4f580a9cff3ebb83cb3fd20bec88e37e4f183796ca652732992611620282daea', 'assemble/jcommander.jar': '156be736199c990321d9ff77090b199629cfc9865e2d6c13f7cd291bb1641817', 'assemble/antlr.jar': '5ac36c2acfb0a0f3d37dafe20b5b570f2643e2d000c648d44503c2738be643df', 'assemble/antlr-runtime.jar': 'ce3fc8ecb10f39e9a3cddcbb2ce350d272d9cd3d0b1e18e6fe73c3b9389c8734', 'assemble/stringtemplate.jar': 'f66ce72e965e5301cb0f020e54d2ba6ad76feb91b3cbfc30dbbf00c06a6df6d7', 'dexlib2.jar': '5a5c8982d8bd7d6e3bb1a0713049e3c78b719ec32b20f6b619885cec30a0dd61'}.items():
        require(sha(tools/name)==digest,'Smali tool hash mismatch: '+name)
    java=['java','-Xmx2g','-cp',os.pathsep.join([str(tools/'assemble/*'),str(tools/'dexlib2.jar'),str(libs/'guava-new.jar'),str(libs/'failureaccess-new.jar')])]
    output.parent.mkdir(parents=True,exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='nicoid-dev7-') as t, ZipFile(base) as b,ZipFile(ci_mpp) as ci:
        w=Path(t);require(b.testzip() is None and ci.testzip() is None,'bad input ZIP')
        require(b.namelist()==ci.namelist() or set(b.namelist())==set(ci.namelist()),'patch layout changed')
        # The CI build from Patcher 2.5.0 and Plugin 2.1.2 has exactly the same
        # patch entrypoint/class files and root Android DEX as the tested dev.6.
        # Adopt its manifest metadata, not its older app payload.
        require(all(b.read(n)==ci.read(n) for n in b.namelist() if n.endswith('.class') or n=='classes.dex'),'patch implementation changed')
        require(b'Patcher-Version: 2.5.0\r\n' in ci.read(MANIFEST),'CI Patcher version mismatch')
        version_manifest=ci.read(MANIFEST).replace(b'Version: 2.1.8\r\n',b'Version: 2.1.9-dev.7\r\n',1)
        require(b'Version: 2.1.9-dev.7\r\n' in version_manifest,'CI manifest version anchor missing')
        def disassemble(data,out):
            dex=w/(out.name+'.dex');dex.write_bytes(data);run(java+['org.jf.baksmali.Main','disassemble','--sequential-labels',dex,'-o',out])
        def assemble(folder):
            dex=w/(folder.name+'-built.dex');run(java+['org.jf.smali.Main','assemble','-a','28',folder,'-o',dex]);return dex.read_bytes()
        # Build only the dependency families known to be embedded. Annotation
        # experimental 1.6.0 is held: it introduces kotlin.enums calls absent
        # in the baseline payload. No new Kotlin runtime is injected.
        with ZipFile(libs/'exif-new.aar') as z:(w/'exif.jar').write_bytes(z.read('classes.jar'))
        d8out=w/'d8';d8out.mkdir()
        run(['java','-Xmx2g','-cp',libs/'r8.jar','com.android.tools.r8.D8','--release','--min-api','28','--lib',libs/'android.jar','--output',d8out,libs/'guava-new.jar',libs/'failureaccess-new.jar',libs/'concurrent-new.jar',w/'exif.jar'])
        # This is a single DEX, so no unobserved secondary DEX payload is discarded.
        require([p.name for p in d8out.glob('*.dex')]==['classes.dex'],'multiple output DEX files')
        h=w/'helpers';e=w/'extension';new=w/'new-libs'
        disassemble(b.read(HELPERS),h);disassemble(b.read(EXTENSION),e);disassemble((d8out/'classes.dex').read_bytes(),new)
        old=listing(h);nd=listing(new);remove={k for k in old if k.startswith(FAMILY)}
        require(len(remove)==2169,'unexpected baseline library class count')
        require(len(nd)==2268 and all(k.startswith(FAMILY) for k in nd),'unexpected new runtime class family or count')
        expected={k:p.read_bytes() for k,p in old.items() if k not in remove}
        for k in remove:old[k].unlink()
        for k,p in nd.items():
            dst=h/k;require(not dst.exists(),'class collision '+k);dst.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(p,dst)
        for k in ('e/e/a/ModernShorts.smali','e/e/a/PatchVersion237.smali'):
            replace_version(h/k);expected[k]=(h/k).read_bytes()
        ext_expected={k:p.read_bytes() for k,p in listing(e).items()};key='e/e/a/ModernShorts.smali';replace_version(e/key);ext_expected[key]=(e/key).read_bytes()
        updated_h=assemble(h);updated_e=assemble(e)
        h2=w/'verified-h';e2=w/'verified-e';disassemble(updated_h,h2);disassemble(updated_e,e2)
        expected.update({k:p.read_bytes() for k,p in nd.items()})
        actual={k:p.read_bytes() for k,p in listing(h2).items()};require(actual==expected,'unexpected helper smali change')
        require({k:p.read_bytes() for k,p in listing(e2).items()}==ext_expected,'unexpected extension smali change')
        assets={HELPERS:updated_h,EXTENSION:updated_e,MANIFEST:version_manifest}
        temp=output.with_name(output.name+'.tmp')
        try:
            with ZipFile(temp,'w') as z:
                for i in b.infolist():z.writestr(copy(i),assets.get(i.filename,b.read(i.filename)))
            with ZipFile(temp) as z:
                require(z.testzip() is None and z.namelist()==b.namelist(),'output ZIP integrity')
                require(all(z.read(n)==b.read(n) for n in b.namelist() if n not in assets),'unintended MPP member change')
                require(z.read('classes.dex')==ci.read('classes.dex'),'root DEX mismatch')
                details={n:dex_info(z.read(n)) for n in ['classes.dex',HELPERS,'nicoid/method-delta.dex',EXTENSION]}
                require(all(i['methods']<=65536 and i['fields']<=65536 for i in details.values()),'DEX identifier limits exceeded')
            temp.replace(output)
            print(json.dumps({'version':VERSION,'output':str(output),'sha256':sha(output),'size':output.stat().st_size,'root_matches_ci':True,'unchanged_nonlibrary_classes':len(expected)-len(nd)-2,'updated_runtime_classes':len(nd),'dex':details},indent=2))
        finally:temp.unlink(missing_ok=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--input',type=Path,required=True);p.add_argument('--ci-mpp',type=Path,required=True);p.add_argument('--libs',type=Path,required=True);p.add_argument('--tools',type=Path,required=True);p.add_argument('--output',type=Path,required=True);a=p.parse_args();stage(a.input,a.ci_mpp,a.libs,a.tools,a.output)
