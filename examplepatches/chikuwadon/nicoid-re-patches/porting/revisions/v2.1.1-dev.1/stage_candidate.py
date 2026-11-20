#!/usr/bin/env python3
"""Build a NON-PUBLISHED v2.1.1-dev.1 MPP from reviewed v2.1.0-dev.28 bytecode.

All existing behavioral helper classes are preserved unless explicitly patched
by overlay.py. Two small new helper classes are compiled with Android SDK tools.
The user-tested native method-delta and resources are copied unchanged.
"""
from __future__ import annotations
import argparse
import io
import os
import shutil
import sys
import tarfile
from copy import copy
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile, ZIP_DEFLATED

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
APPROVED=ROOT/'porting/revisions/v2.1.0-release'
sys.path.insert(0,str(APPROVED))
from verify_dev28 import verify, verified_archive, safe_members, dex_check
from stage_verified import assemble, disassemble, run, semantics_equal, require
from overlay import patch

REVIEWED_VERSION='2.1.0-dev.28'
CANDIDATE_VERSION='2.1.1-dev.1'
VERSION_OWNERS={'e/e/a/PatchVersion237.smali':1,'e/e/a/ModernShorts.smali':2}
TOUCHED={Path(name) for name in ['e/e/a/BulkSelection.smali','e/e/a/LocalPlaylists$Page.smali',
         'e/e/a/AmbientLight$Layer.smali',*VERSION_OWNERS.keys()]}
BUNDLE_OVERRIDES={'nicoid/helpers.mpe','nicoid/method-delta.dex','nicoid/resources.zip'}


def android_tools():
    home=os.environ.get('ANDROID_HOME') or os.environ.get('ANDROID_SDK_ROOT')
    require(bool(home),'ANDROID_HOME / ANDROID_SDK_ROOT is required')
    sdk=Path(home)
    import re
    def platform_key(p):
        match=re.fullmatch(r'android-(\d+)(?:-ext(\d+))?',p.parent.name)
        return (int(match.group(1)),int(match.group(2) or 0)) if match else (0,0)
    platforms=sorted((p for p in (sdk/'platforms').glob('android-*/android.jar') if platform_key(p)[0]),key=platform_key)
    tools=sorted((sdk/'build-tools').glob('*/d8'),key=lambda p:tuple(int(q) for q in p.parent.name.split('.') if q.isdigit()))
    require(bool(platforms) and bool(tools),'Android SDK platform and D8 are required')
    return platforms[-1],tools[-1]


def new_helpers(tmp:Path, smali:Path, tools:Path, reference:dict):
    android,d8=android_tools()
    built=tmp/'new-classes';built.mkdir()
    java=[HERE/'AmbientPanelBlend211.java',HERE/'BulkMove211.java']
    run('javac','--release','8','-encoding','UTF-8','-cp',android,'-d',built,*java)
    classes=sorted(built.rglob('*.class'))
    require(classes,'No new helper classes compiled')
    dexdir=tmp/'new-dex';dexdir.mkdir()
    run(d8,'--min-api','28','--lib',android,'--output',dexdir,*classes)
    dex=dexdir/'classes.dex'
    require(dex.is_file(),'D8 did not emit classes.dex')
    extras=disassemble(dex,tmp/'new-smali',tools)
    require(len(extras)>=2,'Missing new helper classes')
    added=set()
    for name,data in extras.items():
        allowed=(name.parent==Path('e/e/a') and
                 name.parts[-1].startswith(('AmbientPanelBlend211','BulkMove211')))
        # D8 v37 emits a compile-time lambda annotation already shipped in v2.1.0.
        shared=Path('com/android/tools/r8/annotations/LambdaMethod.smali')
        allowed=allowed or name==shared
        require(allowed,'Unexpected compiled helper '+str(name))
        path=smali/name
        if name==shared and path.exists():
            require(name in reference,'Shared D8 annotation absent from approved DEX')
            continue
        require(not path.exists(),'New helper collides with approved baseline: '+str(name))
        path.parent.mkdir(parents=True,exist_ok=True)
        path.write_bytes(data)
        added.add(name)
    print('PASS: added',len(added),'compiled helper classes without replacing approved helper names')
    return added


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiled',required=True,type=Path)
    parser.add_argument('--output',required=True,type=Path)
    parser.add_argument('--tools',required=True,type=Path)
    args=parser.parse_args()
    require(args.output.resolve()!=args.compiled.resolve(),'Do not overwrite current Gradle build in place')
    require(CANDIDATE_VERSION in (ROOT/'gradle.properties').read_text(),
            'Gradle version must identify candidate '+CANDIDATE_VERSION)
    require(__import__('json').loads((ROOT/'patches-list.json').read_text())['version']=='2.1.0',
            'Approved release metadata must not change in dev')
    verify()
    with TemporaryDirectory(prefix='nicoid-v211-') as tmp_name:
        tmp=Path(tmp_name)
        with tarfile.open(fileobj=io.BytesIO(verified_archive()),mode='r:gz') as archive:
            safe_members(archive)
            archive.extractall(tmp,filter='data')
        smali=tmp/'helpers-smali'
        approved_mpp=tmp/'nicoid-re-v2.1.0-dev.28.mpp'
        with ZipFile(approved_mpp) as z:
            require(z.testzip() is None,'User-reviewed MPP ZIP invalid')
            approved_native=z.read('nicoid/method-delta.dex')
            approved_resources=z.read('nicoid/resources.zip')
            approved_ui=z.read('nicoid/ui-strings.txt')
            approved_hashes=z.read('nicoid/input-hashes.txt')
            original_helpers=z.read('nicoid/helpers.mpe')
        approved_dex=tmp/'approved.dex';approved_dex.write_bytes(original_helpers)
        reference=disassemble(approved_dex,tmp/'approved-smali',args.tools)
        require(len(reference)>=7434,'Approved helper class count is smaller than expected')
        for name,count in VERSION_OWNERS.items():
            file=smali/name;source=file.read_text()
            require(source.count(REVIEWED_VERSION)==count,'Unexpected version literal ownership: '+name)
            file.write_text(source.replace(REVIEWED_VERSION,CANDIDATE_VERSION))
        patch(smali)
        additions=new_helpers(tmp,smali,args.tools,reference)
        output_dex=tmp/'helpers-v211.dex'
        assemble(smali,output_dex,args.tools)
        checked=disassemble(output_dex,tmp/'candidate-smali',args.tools)
        require(checked.keys()==reference.keys()|additions,'Unexpected new or missing helper classes')
        unexpected=[str(p) for p in reference if p not in TOUCHED and checked[p]!=reference[p]]
        require(not unexpected,'Approved behavioral bytecode unexpectedly changed: '+str(unexpected[:8]))
        for p in TOUCHED:
            require(p in checked,'Missing overlay or version owner: '+str(p))
        require(CANDIDATE_VERSION.encode() in output_dex.read_bytes(),'Candidate version not embedded')
        require(REVIEWED_VERSION.encode() not in output_dex.read_bytes(),'Development baseline version remains in helper DEX')
        dex_check(output_dex.read_bytes(),'candidate helper DEX')
        with ZipFile(args.compiled) as compiled:
            require(compiled.testzip() is None,'Gradle-generated MPP is corrupt')
            require(b'Version: '+CANDIDATE_VERSION.encode() in compiled.read('META-INF/MANIFEST.MF'),
                    'Gradle bundle manifest has wrong development version')
            require(compiled.read('nicoid/input-hashes.txt')==approved_hashes,
                    'Source APK fingerprints changed unexpectedly')
            require(compiled.read('nicoid/ui-strings.txt')==approved_ui,
                    'UI string table differs from reviewed version')
            overrides={'nicoid/helpers.mpe':output_dex.read_bytes(),
                       'nicoid/method-delta.dex':approved_native,
                       'nicoid/resources.zip':approved_resources}
            args.output.parent.mkdir(parents=True,exist_ok=True)
            with ZipFile(args.output,'w',compression=ZIP_DEFLATED,compresslevel=9) as candidate:
                for entry in compiled.infolist():
                    candidate.writestr(copy(entry),overrides.get(entry.filename,compiled.read(entry.filename)))
        with ZipFile(args.output) as candidate,ZipFile(args.compiled) as compiled:
            require(candidate.testzip() is None,'Final candidate MPP invalid')
            for name,data in overrides.items():require(candidate.read(name)==data,'MPP override mismatch: '+name)
            for name in compiled.namelist():
                if name not in BUNDLE_OVERRIDES:
                    require(candidate.read(name)==compiled.read(name),'Non-overridden MPP file changed: '+name)
        import hashlib
        print('PASS: v2.1.1-dev.1 candidate MPP, preserved baseline except version, ambient and bulk-move hooks')
        print('SHA-256',hashlib.sha256(args.output.read_bytes()).hexdigest())

if __name__=='__main__':main()