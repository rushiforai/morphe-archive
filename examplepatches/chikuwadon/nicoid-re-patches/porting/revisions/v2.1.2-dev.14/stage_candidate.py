#!/usr/bin/env python3
"""Build a NON-PUBLISHED v2.1.2-dev.14 MPP from reviewed v2.1.0-dev.28 bytecode.

All existing behavioral helper classes are preserved unless explicitly patched
by overlay.py. New narrowly scoped helper classes are compiled with Android SDK tools.
The native method delta has scoped folder and player-menu hooks.
The approved v2.1.0 Media3 resources are copied unchanged.
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
BASE=HERE.parent/'v2.1.2-dev.12'
ROOT=HERE.parents[2]
APPROVED=ROOT/'porting/revisions/v2.1.0-release'
sys.path.insert(0,str(APPROVED))
from verify_dev28 import verify, verified_archive, safe_members, dex_check
from stage_verified import assemble, disassemble, run, semantics_equal, require
from overlay import patch, patch_native

REVIEWED_VERSION='2.1.0-dev.28'
CANDIDATE_VERSION='2.1.2-dev.14'
VERSION_OWNERS={'e/e/a/PatchVersion237.smali':1,'e/e/a/ModernShorts.smali':2}
TOUCHED={Path(name) for name in ['e/e/a/BulkSelection.smali','e/e/a/LocalPlaylists$Page.smali',
         'e/e/a/AmbientLight$Layer.smali', 'e/e/a/AmbientLight.smali',
         'e/e/a/PopupControl222.smali', 'e/e/a/PopupControls193.smali',
         'e/e/a/AppResume253.smali', 'e/e/a/PopupReturn244.smali', 'e/e/a/MiniSession225$Session.smali', 'e/e/a/DirectBackground235$State.smali', 'e/e/a/PlaybackTransfer221.smali', 'e/e/a/MiniSession225.smali', 'e/e/a/Media3VideoPlayer.smali', 'e/e/a/ModernPlayback.smali', 'e/e/a/ModernRelated.smali', 'e/e/a/PageCache.smali', 'e/e/a/PlayerTheme.smali', 'e/e/a/PlayerDownloads116.smali', 'e/e/a/SettingsCategories241.smali',
         'e/e/a/SettingsBackup.smali','e/e/a/SettingsBackup$Picker.smali','e/e/a/SettingsBackupData.smali',
         'e/e/a/AppSwitchGuard.smali', 'e/e/a/ThemeChoice.smali', 'e/e/a/UiTheme191.smali', 'e/e/a/Revision201$MenuWatch.smali', 'e/e/a/MultiTabs227.smali',
         'e/e/a/MultiTabs227$TabBadge.smali', 'e/e/a/MultiTabs227$Host.smali',
         'e/e/a/MultiTabs227$1.smali', 'e/e/a/TabRoutes228.smali',
         *VERSION_OWNERS.keys()]}
TOUCHED_NATIVE={Path('com/sauzask/nicoid/NicoidMylistGroupActivity$a.smali'),
               Path('com/sauzask/nicoid/NicoidMylistGroupActivity$b.smali'),
               Path('com/sauzask/nicoid/NicoidVideoListActivity.smali'),Path('e/e/a/i2.smali'),
               Path('com/sauzask/nicoid/NicoidVideoPlayerMenuFragment.smali')}
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
    java=[BASE/name for name in ('AmbientCard217.java','TabFolderNav214.java',
                                'TabSymbols213.java','BulkMove211.java','MoveConfirm212.java','NativeMylistMove215.java','SearchResponse212.java','ResumeModes272.java','MiniGhost272.java','ResumeGuard273.java','PopupSwitch274.java', 'Media3Diagnostics276.java')]
    java.append(HERE/'PlaylistBackup213.java')
    run('javac','--release','8','-encoding','UTF-8','-cp',android,'-d',built,*java)
    classes=sorted(built.rglob('*.class'))
    require(classes,'No new helper classes compiled')
    dexdir=tmp/'new-dex';dexdir.mkdir()
    run(d8,'--min-api','28','--lib',android,'--output',dexdir,*classes)
    dex=dexdir/'classes.dex'
    require(dex.is_file(),'D8 did not emit classes.dex')
    extras=disassemble(dex,tmp/'new-smali',tools)
    require(len(extras)>=4,'Missing new helper classes')
    added=set()
    for name,data in extras.items():
        allowed=(name.parent==Path('e/e/a') and
                 name.parts[-1].startswith(('AmbientCard217','TabFolderNav214','TabSymbols213',
                                           'BulkMove211','MoveConfirm212','NativeMylistMove215','SearchResponse212','ResumeModes272','MiniGhost272','ResumeGuard273','PopupSwitch274','Media3Diagnostics276','PlaylistBackup213')))
        # D8 v37 creates a compile-time lambda annotation already in 2.1.0.
        shared=Path('com/android/tools/r8/annotations/LambdaMethod.smali')
        require(allowed or name==shared,'Unexpected compiled helper '+str(name))
        path=smali/name
        if name==shared and path.exists():
            require(name in reference,'Shared D8 annotation absent from approved DEX')
            continue
        require(not path.exists(),'Helper name collides with approved Media3 baseline: '+str(name))
        path.parent.mkdir(parents=True,exist_ok=True)
        path.write_bytes(data)
        added.add(name)
    print('PASS: added',len(added),'v2.1.2-dev.14 helper classes without overriding approved names')
    return added



def verify_dev8_contracts():
    # Guard against swapping the two original nicoid 6.49 i2.a ArrayLists.
    picker=(BASE/'NativeMylistMove215.java').read_text()
    require('ArrayList<?> destinations,' in picker and 'ArrayList<?> selected,String source' in picker,
            'Original Mylist destinations and selected items swapped')
    require('c.newInstance(owner,2,selected,choices,source,listDialog)' in picker,
            'Native i2$c constructor argument order regressed')
    require('executeOriginal(owner,eligible,selectionSnapshot,sourceId,index,chooser[0])' in picker,
            'Post-confirm Mylist move argument order regressed')
    ambient=(BASE/'AmbientCard217.java').read_text()
    require('PorterDuff.Mode.SRC_ATOP' in ambient and 'paintLight(canvas' in ambient,
            'Expected masked reuse of the reviewed page glow')

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiled',required=True,type=Path)
    parser.add_argument('--output',required=True,type=Path)
    parser.add_argument('--tools',required=True,type=Path)
    args=parser.parse_args()
    require(args.output.resolve()!=args.compiled.resolve(),'Do not overwrite current Gradle build in place')
    require(CANDIDATE_VERSION in (ROOT/'gradle.properties').read_text(),
            'Gradle version must identify candidate '+CANDIDATE_VERSION)
    require(__import__('json').loads((ROOT/'patches-list.json').read_text())['version']=='2.1.1',
            'Approved v2.1.1 release metadata must remain stable during development')
    verify_dev8_contracts()
    verify()
    with TemporaryDirectory(prefix='nicoid-v212-' ) as tmp_name:
        tmp=Path(tmp_name)
        with tarfile.open(fileobj=io.BytesIO(verified_archive()),mode='r:gz') as archive:
            safe_members(archive)
            archive.extractall(tmp,filter='data')
        smali=tmp/'helpers-smali'
        native_smali=tmp/'native-delta-smali'
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
        patch_native(native_smali,smali)
        original_native_path=tmp/'approved-method-delta.dex'
        original_native_path.write_bytes(approved_native)
        native_reference=disassemble(original_native_path,tmp/'native-ref',args.tools)
        output_native=tmp/'method-delta-v212.dex'
        assemble(native_smali,output_native,args.tools)
        native_checked=disassemble(output_native,tmp/'native-checked',args.tools)
        require(native_checked.keys()==native_reference.keys(),
                'Unexpected native delta class set')
        require('NativeMylistMove215;->show' in native_checked[Path('e/e/a/i2.smali')].decode(),
                'Missing native Mylist move entry point')
        menu = Path('com/sauzask/nicoid/NicoidVideoPlayerMenuFragment.smali')
        require('AmbientCard217;->registerMenu(Landroid/view/View;)V' in native_checked[menu].decode(),
                'Missing native menu-creation ambient hook')
        unexpected_native=[str(p) for p in native_reference
                           if p not in TOUCHED_NATIVE and native_checked[p]!=native_reference[p]]
        require(not unexpected_native,'Unexpected native bytecode changes: '+str(unexpected_native[:8]))
        for name in TOUCHED_NATIVE:
            require(name in native_checked and native_checked[name]!=native_reference[name],
                    'Missing required native Mylist navigation hook '+str(name))
        print('PASS: Mylist tap, long-press and Back hooks; all other native classes preserved')
        additions=new_helpers(tmp,smali,args.tools,reference)
        output_dex=tmp/'helpers-v212.dex'
        assemble(smali,output_dex,args.tools)
        checked=disassemble(output_dex,tmp/'candidate-smali',args.tools)
        require(checked.keys()==reference.keys()|additions,'Unexpected new or missing helper classes')
        unexpected=[str(p) for p in reference if p not in TOUCHED and checked[p]!=reference[p]]
        require(not unexpected,'Approved behavioral bytecode unexpectedly changed: '+str(unexpected[:8]))
        for p in TOUCHED:
            require(p in checked,'Missing overlay or version owner: '+str(p))
        require(CANDIDATE_VERSION.encode() in output_dex.read_bytes(),'Candidate version not embedded')
        require(REVIEWED_VERSION.encode() not in output_dex.read_bytes(),'Development baseline version remains in helper DEX')
        # Unlike earlier source-only tests, inspect the assembled MPP's actual
        # helper bytecode. Every native/UI call site must be present in the DEX.
        for name, invocation in (
            ('e/e/a/AppResume253.smali','ResumeGuard273;->capture'),
            ('e/e/a/AppResume253.smali','ResumeGuard273;->matches'),
            ('e/e/a/SettingsCategories241.smali','ResumeModes272;->reparent'),
            ('e/e/a/MultiTabs227$1.smali','AppSwitchGuard;->track'),
            ('e/e/a/MiniSession225$Session.smali','MiniGhost272;->afterRelease'),
            ('e/e/a/DirectBackground235$State.smali','MiniGhost272;->afterRelease'),
            ('e/e/a/AmbientLight$Layer.smali','AmbientCard217;->update'),
             ('e/e/a/ThemeChoice.smali','AmbientCard217;->themedColor'),
             ('e/e/a/UiTheme191.smali','AmbientCard217;->themedColor'),
             ('e/e/a/AppSwitchGuard.smali','PopupSwitch274;->delay'),
             ('e/e/a/Media3VideoPlayer.smali','Media3Diagnostics276;->onStart'),
             ('e/e/a/Media3VideoPlayer.smali','Media3Diagnostics276;->onPause'),
             ('e/e/a/Media3VideoPlayer.smali','Media3Diagnostics276;->onEvents'),
             ('e/e/a/Media3VideoPlayer.smali','Media3Diagnostics276;->onError'),
             ('e/e/a/Media3VideoPlayer.smali','Media3Diagnostics276;->onPlayIntentChange'),
        ):
            require(invocation in checked[Path(name)].decode(),
                    'Required runtime call missing from assembled MPP: '+name+' '+invocation)
        for owner in ('MiniSession225$Session', 'DirectBackground235$State'):
            close = checked[Path('e/e/a') / (owner + '.smali')].decode().split('.method close(Z)V', 1)[1].split('.end method', 1)[0]
            require('MiniGhost272;->schedule(Ljava/lang/Object;Z)V' in close,
                    'Mini-player close must forward the stop/transfer intent')
        menu_watch = checked[Path('e/e/a/Revision201$MenuWatch.smali')].decode()
        watch = menu_watch.split('.method public onPreDraw()Z', 1)[1].split('.end method', 1)[0]
        require(all('AmbientCard217;->' + call in watch for call in ('original(', 'themedBackground(', 'themedColor(')) and
                'Landroid/view/View;->setBackground' not in watch,
                'Native menu pre-draw still overwrites ambient background')
        layer = checked[Path('e/e/a/AmbientLight$Layer.smali')].decode()
        normal = layer.split('.method installNormalExterior(', 1)[1].split('.end method', 1)[0]
        require('->installPageGlow(' not in normal and '->installDetailPlanes(' not in normal,
                'Legacy page backgrounds still compete with the pager compositor')
        require(normal.count('AmbientCard217;->update') == 2 and
                normal.index('normal centered portrait/letterbox') < normal.rindex('AmbientCard217;->update'),
                'Normal pager glow must use the corrected exterior video rectangle')
        for name in ('ResumeGuard273.smali','ResumeModes272.smali','MiniGhost272.smali','AmbientCard217.smali','PopupSwitch274.smali','Media3Diagnostics276.smali','PlaylistBackup213.smali'):
            require(Path('e/e/a')/name in checked,'New runtime helper missing from assembled MPP: '+name)
        print('PASS: v2.1.2-dev.14 assembled DEX runtime call graph')
        backup=checked[Path('e/e/a/SettingsBackup.smali')].decode()
        picker=checked[Path('e/e/a/SettingsBackup$Picker.smali')].decode()
        require(all(k in backup for k in ('nicoid_local_playlists_v1','nicoid_video_title_overrides'))
                and '->setSummary(' in backup
                and all('PlaylistBackup213;->'+p in picker for p in ('snapshot','prepareImport','validate','restore'))
                and 'save_playback_position' in backup
                and 'save_playback_position' in checked[Path('e/e/a/SettingsBackupData.smali')].decode()
                and 'getSharedPreferences' in checked[Path('e/e/a/PlaylistBackup213.smali')].decode(),
                'Playlist backup runtime hook missing')
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
                       'nicoid/method-delta.dex':output_native.read_bytes(),
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
        print('PASS: v2.1.2-dev.14 candidate MPP, preserving approved v2.1.1 behavior plus paused-handoff and seek-control guards')
        print('SHA-256',hashlib.sha256(args.output.read_bytes()).hexdigest())

if __name__=='__main__':main()