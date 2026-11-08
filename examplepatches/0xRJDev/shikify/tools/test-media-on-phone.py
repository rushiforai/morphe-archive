#!/usr/bin/env python3
"""Run isolated Android checks; never install Boost, navigate it, or send Reddit actions."""
import argparse
import datetime
import os
from pathlib import Path
import shlex
import struct
import subprocess
import zipfile

ROOT=Path(__file__).resolve().parents[1]
ENV=os.environ.copy()
ENV['JAVA_HOME']=str(ROOT/'.work/toolchain/jdk-21.0.13+9')
ENV['PATH']=ENV['JAVA_HOME']+'/bin:'+ENV.get('PATH','')
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--serial')
parser.add_argument('--check',action='append',choices=['ArtVerify','RuntimeUiChecks','PredictiveBackChecks','MediaPreviewChecks','PolishChecks','StyleChecks','ThreadCardChecks','ScrollingChecks','FeedCardChecks','MaterialLoadingChecks','HomeAvatarChecks','DownloadControlsChecks','SurfaceChecks','OverlayBackChecks'])
parser.add_argument('--version',default='1.0.0')
parser.add_argument('--fixture',action='append',default=[],type=Path)
args=parser.parse_args()

def run(words,timeout=60):
    result=subprocess.run([str(word) for word in words],capture_output=True,text=True,timeout=timeout,env=ENV)
    if result.returncode: raise RuntimeError(result.stdout+result.stderr)
    return result.stdout+result.stderr

def runtime_classes(apk):
    names=set()
    with zipfile.ZipFile(apk) as archive:
        for entry in archive.namelist():
            if not (entry.startswith('classes') and entry.endswith('.dex')): continue
            dex=archive.read(entry)
            u32=lambda offset: struct.unpack_from('<I',dex,offset)[0]
            strings,types,definitions=u32(60),u32(68),u32(100)
            for index in range(u32(96)):
                type_id=u32(definitions+index*32)
                text_id=u32(types+type_id*4)
                offset=u32(strings+text_id*4)
                while dex[offset]&128: offset+=1
                offset+=1
                end=dex.index(b'\0',offset)
                name=dex[offset:end].decode('utf-8',errors='replace')
                if any(name.startswith('Lapp/morphe/extension/boost/'+family) for family in
                       ['CommentsChromeTweaks','GalleryBottomActionsTweaks','CommentSwipeActions','PredictiveBackTweaks','MediaPreviewTweaks','CommentLayoutTweaks','ViewerPolishTweaks','MaterialYouTweaks','CommentsScreenTweaks','ThreadPositionTweaks','FeedPillBlur','GlassRefraction','HeaderGradient','UnifiedChromeTweaks','MaterialLoading','HomeAvatarTweaks','Surface']):
                    names.add(name[1:-1].replace('/','.'))
    return sorted(names)

remote=None
adb=None
try:
    devices=[line.split()[0] for line in run(['adb','devices']).splitlines()[1:]
             if len(line.split())>=2 and line.split()[1]=='device']
    serial=args.serial or (devices[0] if len(devices)==1 else None)
    if serial not in devices: raise RuntimeError('Connect an authorized phone, or specify --serial when more than one is connected.')
    adb=['adb','-s',serial]
    def shell(words): return run(adb+['shell',shlex.join([str(word) for word in words])])
    sdk=ROOT/'.work/android-sdk'
    java=ROOT/'.work/toolchain/jdk-21.0.13+9/bin/javac'
    work=ROOT/'.work'/('media-phone-'+args.version)
    classes=work/'classes'; classes.mkdir(parents=True,exist_ok=True)
    run([java,'--release','17','-cp',sdk/'platforms/android-36/android.jar','-d',classes]+
        [ROOT/'tools'/name for name in ['RuntimeUiChecks.java','PredictiveBackChecks.java','MediaPreviewChecks.java','PolishChecks.java','StyleChecks.java','ThreadCardChecks.java','ScrollingChecks.java','FeedCardChecks.java','MaterialLoadingChecks.java','HomeAvatarChecks.java','DownloadControlsChecks.java','SurfaceChecks.java','OverlayBackChecks.java','ArtVerify.java']])
    checks=work/'checks.jar'
    run([sdk/'build-tools/36.0.0/d8','--min-api','24','--lib',sdk/'platforms/android-36/android.jar',
         '--output',checks]+list(classes.glob('*.class')))
    apks=[ROOT/'output/boost-1.14.3-chrome-unsigned.apk']+[path.resolve() for path in args.fixture]
    if not all(path.is_file() for path in apks): raise RuntimeError('An APK fixture is missing; build it first.')
    remote='/data/local/tmp/boost-media-'+datetime.datetime.now().strftime('%Y%m%d%H%M%S%f')
    shell(['mkdir','-p',remote+'/cache'])
    run(adb+['push',checks,remote+'/checks.jar']); shell(['chmod','444',remote+'/checks.jar'])
    original_names=['androidx.swiperefreshlayout.widget.SwipeRefreshLayout','us','com.pnikosis.materialishprogress.ProgressWheel','com.rubenmayayo.reddit.ui.submissions.subreddit.MainActivity$d','com.rubenmayayo.reddit.MyApplication','ll','com.rubenmayayo.reddit.ui.comments.CommentsActivity',
        'com.rubenmayayo.reddit.ui.comments.CommentsFragment','com.rubenmayayo.reddit.ui.comments.CommentsFragment$m','com.rubenmayayo.reddit.ui.fragments.k$a','com.rubenmayayo.reddit.ui.fragments.m$a','ht0','com.rubenmayayo.reddit.ui.profile.UserContributionListFragment$f','com.rubenmayayo.reddit.ui.adapters.CommentViewHolder',
        'com.rubenmayayo.reddit.ui.adapters.LoadMoreViewHolder','com.rubenmayayo.reddit.ui.adapters.SubmissionViewHolder',
        'com.rubenmayayo.reddit.ui.submissions.subreddit.SubmissionsActivity','com.rubenmayayo.reddit.ui.activities.a',
        'com.rubenmayayo.reddit.ui.activities.GalleryActivity','com.rubenmayayo.reddit.ui.activities.MediaVideoActivity','com.rubenmayayo.reddit.ui.activities.MediaImageActivity','com.rubenmayayo.reddit.ui.fragments.imagemodel.ImageModelFragment']
    for index,apk in enumerate(apks):
        target=remote+'/candidate-'+str(index)+'.apk'
        run(adb+['push',apk,target]); shell(['chmod','444',target])
        for name in (args.check or ['ArtVerify','RuntimeUiChecks','PredictiveBackChecks','MediaPreviewChecks','PolishChecks','StyleChecks','ThreadCardChecks','ScrollingChecks','FeedCardChecks','MaterialLoadingChecks','HomeAvatarChecks','DownloadControlsChecks','SurfaceChecks','OverlayBackChecks']):
            names=original_names+runtime_classes(apk) if name=='ArtVerify' else []
            cmd='CLASSPATH='+remote+'/checks.jar '+shlex.join(['app_process','-Xmx192m','/system/bin',name,target,remote+'/cache']+([remote] if name in ['StyleChecks','ThreadCardChecks','ScrollingChecks','FeedCardChecks','MaterialLoadingChecks','HomeAvatarChecks','DownloadControlsChecks','SurfaceChecks','OverlayBackChecks'] else [])+names)
            result=subprocess.run(adb+['shell',cmd],capture_output=True,text=True,timeout=60)
            log=result.stdout+result.stderr
            (ROOT/'output'/f'{name}-{args.version}-fixture-{index}.log').write_text(log)
            if result.returncode or (name=='ArtVerify' and log.count('ART PASS:')!=len(names)) or (name!='ArtVerify' and 'CHECKS PASSED:' not in log):
                raise RuntimeError(f"{name}, fixture {index}, exit {result.returncode}:\n"+log)
            print(f'PASS {name}: fixture {index} ({apk.name})',flush=True)
            previews={'StyleChecks':['comment-preview.png','card-preview.png'],
                      'ThreadCardChecks':['thread-cards-preview.png'],
                      'FeedCardChecks':['feed-card-preview.png','feed-narrow-preview.png'],
                      'MaterialLoadingChecks':['material-loading-preview.png'],
                      'HomeAvatarChecks':['home-avatar-preview.png'],
                      'SurfaceChecks':['surface-dim-preview.png','feed-blur-preview.png'],
                      'OverlayBackChecks':['media-overlay-progress.png'],
                      'DownloadControlsChecks':['download-controls-preview.png']}
            if name in previews:
                for preview in previews[name]:
                    run(adb+['pull',remote+'/'+preview,ROOT/'output'/f'{args.version}-fixture-{index}-{preview}'])
except (RuntimeError,OSError,subprocess.TimeoutExpired) as error:
    parser.exit(1,str(error)+'\n')
finally:
    if remote and adb:
        subprocess.run(adb+['shell',shlex.join(['rm','-rf',remote])],capture_output=True,timeout=30)
