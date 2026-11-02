#!/usr/bin/env python3
"""Checks candidate payload wiring and preservation. Not an Android runtime verifier."""
from pathlib import Path
import re,zipfile,hashlib,json,struct,sys
r=Path(__file__).resolve().parent
base=Path(sys.argv[1]);output=Path(sys.argv[2]);stage=r/'stage';checks=0
def check(ok,message):
 global checks
 assert ok,message
 checks+=1
with zipfile.ZipFile(base) as a,zipfile.ZipFile(output) as b:
 check(b.testzip() is None,'ZIP integrity')
 check(set(a.namelist())==set(b.namelist()),'MPP entry layout')
 for item in a.namelist():
  if item.startswith('nicoid/') and item not in ['nicoid/helpers.mpe','nicoid/method-delta.dex']:
   check(a.read(item)==b.read(item),'Preserve '+item)
 check(b'1.10.0' in b.read('META-INF/MANIFEST.MF'),'manifest version')
 for entry in ['classes.dex','nicoid/helpers.mpe','nicoid/method-delta.dex']:
  data=b.read(entry)
  check(data[:4]==b'dex\n','DEX header '+entry)
  check(struct.unpack_from('<I',data,32)[0]==len(data),'DEX size '+entry)
  check(hashlib.sha1(data[32:]).digest()==data[12:32],'DEX signature '+entry)
 # JVM metadata must agree with executor DEX and the UI version.
 jvm=[b.read(n) for n in b.namelist() if n.endswith('.class')]
 check(not any(b'1.9.12' in d for d in jvm),'No stale JVM version')
# Native field declarations cannot be dropped by the merge executor.
if not (r/'native').exists():
 with zipfile.ZipFile(r/'native-baseline.zip') as baseline: baseline.extractall(r/'native')
for f in (stage/'native').rglob('*.smali'):
 original=r/'native'/f.relative_to(stage/'native')
 if original.exists():
  fields=lambda t:set(re.findall(r'^\.field[^\n]*',t,re.M))
  check(fields(f.read_text())==fields(original.read_text()),'Native field preservation '+f.name)
# All calls to newly compiled helper methods resolve to that exact method descriptor.
compiled={re.search(r'^\.class.* (L[^ ]+;)$',f.read_text(),re.M)[1] for f in (stage/'compiled').rglob('*.smali')}
helpers={}
supers={}
for f in (stage/'helpers').rglob('*.smali'):
 t=f.read_text();c=re.search(r'^\.class.* (L[^ ]+;)$',t,re.M)[1]
 supers[c]=re.search(r'^\.super ([^\n]+)',t,re.M)[1]
 helpers[c]=set(re.findall(r'^\.method[^\n]* ([^ ]+\([^\n]+)$',t,re.M))
def resolves(c,method):
 if method in helpers.get(c,set()):return True
 parent=supers.get(c)
 if parent in helpers:return resolves(parent,method)
 return parent is not None and not parent.startswith('Le/e/a/')
for root in ['helpers','native']:
 for f in (stage/root).rglob('*.smali'):
  for target,method in re.findall(r'invoke-[^\n]+, (Le/e/a/[^;]+;)->([^\n]+)',f.read_text()):
   if target in compiled:
    check(resolves(target,method),f'Unresolved {target}->{method} in {f.name}')
def contains(root,file,fragment):check(fragment in (stage/root/file).read_text(),str(file)+' '+fragment)
for helper in ['TabPlayback110','SearchSnapshot110','FilterEditor110','GestureControls110','PlaybackHandoff110','ResourceNames110']:
 check((stage/'helpers/e/e/a'/f'{helper}.smali').exists(),'Include '+helper)
for file,hook in [('com/sauzask/nicoid/NicoidActivity.smali','GestureControls110;->touch'),('com/sauzask/nicoid/NicoidSetting.smali','GestureControls110;->settings'),('com/sauzask/nicoid/NicoidVideoFragment$n.smali','TabPlayback110;->attach'),('com/sauzask/nicoid/NicoidPopupViewService$c.smali','TabPlayback110;->attach'),('com/sauzask/nicoid/NicoidPopupViewService.smali','TabPlayback110;->begin'),('e/e/a/u.smali',':current_worker110'),('e/e/a/u.smali','declared-synchronized onSurfaceTextureDestroyed')]:contains('native',file,hook)
for file,hook in [('PlaybackTransfer','PlaybackHandoff110;->capture'),('ModernSearch','SearchSnapshot110;->load'),('FilterUi110','FilterEditor110;->edit'),('ListActions','FilterEditor110;->confirm'),('PlaylistPlayback','nicoid_explicit_queue110')]:contains('helpers','e/e/a/'+file+'.smali',hook)
check(not list((stage/'helpers/e/e/a').glob('CommentFollowRulesTest*.smali')),'No bundled test runner')
for wrapper in ['TabRecovery244','PlaybackTransfer221','AppSwitchGuard','CommentTransfer245','TabPager233']:
 check((stage/'helpers/e/e/a'/f'{wrapper}.smali').exists(),'Preserved compatibility '+wrapper)
# Five parameters plus two fresh scratch registers; must not overwrite the Intent.
text=(stage/'helpers/e/e/a/PlaylistPlayback.smali').read_text()
check(bool(re.search(r'attach\(Landroid/app/Activity;Landroid/content/Intent;Ljava/util/ArrayList;IZ\)V\n    .registers 7',text)),'Explicit queue hook register allocation')
# Follow-up regressions: all paths must reach the revised production helpers.
contains('helpers','e/e/a/RefreshDispatch.smali','FeedRefresh209;->accept')
contains('helpers','e/e/a/PlaybackBar221.smali','DirectBackground235;->refresh')
contains('helpers','e/e/a/PlaybackTransfer221.smali','PopupReturn244;->restore')
contains('native','com/sauzask/nicoid/NicoidActivity.smali','TabSearch228;->menu')
contains('native','com/sauzask/nicoid/NicoidVideoListActivity.smali','TabSearch228;->edit')
contains('helpers','e/e/a/GestureControls110.smali','gesture_sensitivity')
contains('helpers','e/e/a/GestureControls110.smali','righttab')
contains('helpers','e/e/a/GestureControls110.smali','lefttab')
check('スナップショット検索を使用' not in (stage/'helpers/e/e/a/SearchSnapshot110.smali').read_text(),'No duplicated snapshot explanation')
check('話題の動画順' not in (stage/'helpers/e/e/a/SearchSnapshot110.smali').read_text(),'Sort caption matches existing menu')
contains('helpers','e/e/a/DirectBackground235$State.smali','PlaybackPanels113;->claim')
contains('helpers','e/e/a/MiniSession225$Session.smali','PlaybackPanels113;->claim')
contains('helpers','e/e/a/GestureControls110.smali','gesture_defaults_v3')
contains('helpers','e/e/a/GestureControls110$Trace.smali','Landroid/text/StaticLayout$Builder;')
contains('helpers','e/e/a/VideoOutput227.smali','PENDING:Ljava/util/WeakHashMap;')
contains('helpers','e/e/a/SavedTabs227.smali','TabOrder113;->afterRemoval')
# Existing native menu only; restoration must preserve the browsing route.
contains('helpers','e/e/a/ListActions.smali','ExistingMenu114;->install')
contains('native','com/sauzask/nicoid/NicoidVideoActivity.smali','PlaybackNavigation114;->back')
contains('helpers','e/e/a/PopupReturn244.smali','PlaybackNavigation114;->launch')
contains('helpers','e/e/a/MiniSession225$Session.smali','PlaybackNavigation114;->mark')
contains('helpers','e/e/a/SearchSnapshot110.smali','NumericInput114;->configure')
check(not list((stage/'helpers/e/e/a').glob('PersistentMenu113*.smali')),'No additional custom menu')
check('PersistentMenu113' not in (stage/'native/com/sauzask/nicoid/NicoidActivity.smali').read_text(),'No additional menu hook')
for name in ['DirectBackground235$State','VideoOutput227']:
 check('setRendererEnabled' not in (stage/'helpers/e/e/a'/f'{name}.smali').read_text(),'No renderer switch on reparent '+name)
# Download integration, ordinary numeric IME, and retained output preservation.
contains('helpers','e/e/a/ListActions.smali','DownloadUi115;->scheduleMenu')
contains('helpers','e/e/a/ListActions.smali','DownloadActions116;->complete')
contains('helpers','e/e/a/ModernControls.smali','PlayerDownloads116;->attach')
contains('native','com/sauzask/nicoid/NicoidSetting.smali','DownloadUi115;->settings')
contains('native','com/sauzask/nicoid/NicoidDownloadCache.smali','DownloadWorker115;->start')
contains('native','com/sauzask/nicoid/NicoidDownloadCache.smali','DownloadWorker115;->ready')
contains('native','com/sauzask/nicoid/NicoidDownloadCache.smali','DownloadWorker115;->command')
contains('native','com/sauzask/nicoid/NicoidDownloadCache.smali','DownloadWorker115;->destroyed')
contains('helpers','e/e/a/DownloadJobs115.smali','Landroid/provider/DocumentsContract;->renameDocument')
contains('helpers','e/e/a/Mp4Transfer115.smali','Landroid/media/MediaMuxer;->writeSampleData')
check('TYPE_NUMBER_VARIATION_PASSWORD' not in (r/'src/e/e/a/NumericInput114.java').read_text(),'Ordinary numeric input without password variation')
check('if(!reused)' in (r/'src/e/e/a/VideoOutput227.java').read_text(),'No surface reassignment for retained output')
# Finalized normal/long-press action list and late-created native player menu.
contains('helpers','e/e/a/DownloadActions116.smali','videourl')
contains('helpers','e/e/a/DownloadActions116.smali','ListActions;->ACTIONS')
contains('helpers','e/e/a/PlayerDownloads116.smali','Landroid/widget/ListView;->addFooterView')
contains('helpers','e/e/a/PlayerDownloads116.smali','addOnGlobalLayoutListener')
check('DownloadUi115;->videoMenu' not in (stage/'helpers/e/e/a/ListActions.smali').read_text(),'No uploader-field download hook')
# 1.10.0 audit: actual sample-bearing tracks, cache metadata, lifecycle cleanup.
contains('helpers','e/e/a/Mp4Transfer115.smali','FragmentedMp4117;->isFragmented')
contains('helpers','e/e/a/Mp4Transfer115.smali','FragmentMux117;->mux')
contains('helpers','e/e/a/DownloadUi115.smali','CacheTitles117;->title')
contains('native','com/sauzask/nicoid/NicoidDownloadCache.smali','CacheTitles117;->bundle')
contains('helpers','e/e/a/MultiTabs227$1.smali','GestureControls110;->dispose')
check('.class public' in (stage/'helpers/e/e/a/CacheTitles117.smali').read_text(),'Cache metadata hook publicly accessible')
check('putExtra("title",title)' not in (r/'src/e/e/a/DownloadActions116.java').read_text(),'Unprepared cache request does not masquerade as prepared metadata')
# Saved-file reconciliation, shared tabs and comment continuity wiring.
contains('helpers','e/e/a/DownloadUi115.smali','Ui110$Tabs;-><init>')
contains('helpers','e/e/a/DownloadUi115.smali','Ui110$Swipe;-><init>')
contains('helpers','e/e/a/DownloadUi115.smali','setOnItemLongClickListener')
contains('helpers','e/e/a/DownloadFiles118.smali','buildChildDocumentsUriUsingTree')
contains('helpers','e/e/a/DownloadFiles118.smali','getExtras')
contains('helpers','e/e/a/CommentUi.smali','CommentContinuity118;->merge')
contains('helpers','e/e/a/CommentUi.smali','CommentContinuity118;->refresh')
contains('helpers','e/e/a/CommentVisuals.smali','CommentContinuity118;->reset')
check('0x42480000    # 50.0f' not in (stage/'helpers/e/e/a/CommentVisuals.smali').read_text(),'Draw stall does not reset lanes')
for name in ['t','u']:
 t=(stage/('native/e/e/a/'+name+'.smali')).read_text()
 check(t.count('CommentMotion;->frame')==1,'One clock sample before rendering '+name)
 check(t.index('CommentMotion;->frame')<t.index('CommentVisuals;->scrolling'),'Clock precedes scrolling '+name)
result={'checks':checks,'sha256':hashlib.sha256(output.read_bytes()).hexdigest(),'bytes':output.stat().st_size,'android_device_tested':False}
(r/'verification-result.json').write_text(json.dumps(result,indent=2))
print(json.dumps(result))
