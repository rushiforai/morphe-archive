#!/usr/bin/env python3
"""Build a local v1.10.0 candidate from the digest-verified official v1.9.12 MPP."""
from pathlib import Path
import argparse,subprocess,zipfile,shutil,hashlib,re,struct,os,json
ROOT=Path(__file__).resolve().parent
VERSION='1.10.0'
BASE='1f3418fe098ecf47f82e896c3ba19f5ea227cdc9de75665b5f36af394631b4f1'
def run(*cmd):subprocess.run(list(map(str,cmd)),check=True)
def body(text,signature,code):
 pattern=r'(^\.method [^\n]*'+re.escape(signature)+r'\n)[\s\S]*?^\.end method'
 result,n=re.subn(pattern,lambda m:m[1]+code+'\n.end method',text,count=1,flags=re.M)
 assert n==1,signature
 return result
def inject(text,signature,code):
 pattern=r'(^\.method [^\n]*'+re.escape(signature)+r'\n\s*\.registers \d+\n)'
 result,n=re.subn(pattern,lambda m:m[1]+code+'\n',text,count=1,flags=re.M)
 assert n==1,signature
 return result
def patch(h,n):
 def edit(root,path,fn):p=root/path;t=p.read_text();p.write_text(fn(t))
 edit(h,'e/e/a/CommentUi.smali',lambda t:inject(t,'apply(Ljava/lang/Object;Ljava/util/ArrayList;)V','    invoke-static {p0, p1}, Le/e/a/CommentContinuity118;->merge(Ljava/lang/Object;Ljava/util/ArrayList;)Ljava/util/ArrayList;\n    move-result-object p1'))
 edit(h,'e/e/a/CommentUi.smali',lambda t:t.replace('invoke-static {v0, v2}, Le/e/a/CommentUi;->invoke(Ljava/lang/Object;Ljava/lang/String;)V','invoke-static {v0}, Le/e/a/CommentContinuity118;->refresh(Ljava/lang/Object;)V'))
 # Advance the animation clock before either scrolling or fixed comments draw.
 for name in ['t','u']:
  p=n/('e/e/a/'+name+'.smali');t=p.read_text();call='    invoke-static {v1}, Le/e/a/CommentMotion;->frame(Ljava/lang/Object;)V';assert t.count(call)==1;t=t.replace(call,'');anchor='    invoke-static/range {p0 .. p2}, Le/e/a/CommentVisuals;->scrolling';assert t.count(anchor)==1;t=t.replace(anchor,'    invoke-static/range {p0 .. p0}, Le/e/a/CommentMotion;->frame(Ljava/lang/Object;)V\n\n'+anchor);p.write_text(t)
 p=h/'e/e/a/CommentVisuals.smali';t=p.read_text();start=t.index('    iget v15, v6, Le/e/a/CommentVisuals$State;->last:F');end=t.index('    iget v15, v6, Le/e/a/CommentVisuals$State;->rows:I',start);t=t[:start]+'    invoke-static {v1}, Le/e/a/CommentContinuity118;->reset(Ljava/lang/Object;)Z\n    move-result v15\n    if-nez v15, :cond_b0\n\n'+t[end:];p.write_text(t)
 edit(n,'com/sauzask/nicoid/NicoidDownloadCache.smali',lambda t:inject(t,'a(Landroid/os/Bundle;Ljava/lang/String;)V','    invoke-static {p1}, Le/e/a/CacheTitles117;->bundle(Ljava/lang/Object;)V'))
 edit(h,'e/e/a/ListActions.smali',lambda t:inject(t,'show(Ljava/lang/Object;Ljava/lang/Object;)V','    invoke-static/range {p0 .. p1}, Le/e/a/DownloadActions116;->complete(Ljava/lang/Object;Ljava/lang/Object;)V'))
 edit(h,'e/e/a/ModernControls.smali',lambda t:inject(t,'attach(Lcom/sauzask/nicoid/NicoidVideoFragment;)V','    invoke-static {p0}, Le/e/a/PlayerDownloads116;->attach(Ljava/lang/Object;)V'))
 edit(h,'e/e/a/ListActions.smali',lambda t:inject(t,'adjustHistoryMenu(Ljava/lang/Object;Landroid/view/Menu;)V','    invoke-static/range {p0 .. p1}, Le/e/a/DownloadUi115;->scheduleMenu(Ljava/lang/Object;Landroid/view/Menu;)V').replace('add-int/lit8 v11, v11, 0x2','add-int/lit8 v11, v11, 0x3'))
 edit(n,'com/sauzask/nicoid/NicoidSetting.smali',lambda t:inject(t,'onResume()V','    invoke-static {p0}, Le/e/a/DownloadUi115;->settings(Landroid/preference/PreferenceActivity;)V'))
 edit(n,'com/sauzask/nicoid/NicoidDownloadCache.smali',lambda t:inject(inject(inject(t,'b(Landroid/content/Intent;)V','    invoke-static {p0, p1}, Le/e/a/DownloadWorker115;->start(Ljava/lang/Object;Landroid/content/Intent;)Z\n    move-result v0\n    if-eqz v0, :native_cache115\n    return-void\n    :native_cache115'),'onStartCommand(Landroid/content/Intent;II)I','    invoke-static {p0, p1}, Le/e/a/DownloadWorker115;->command(Landroid/app/Service;Landroid/content/Intent;)Z\n    move-result v0\n    if-eqz v0, :native_command115\n    const/4 v0, 0x2\n    return v0\n    :native_command115'),'onDestroy()V','    invoke-static {p0}, Le/e/a/DownloadWorker115;->destroyed(Ljava/lang/Object;)V').replace('invoke-static {p0}, Le/e/a/CacheFolders;->workerReady(Landroid/content/Context;)Z','invoke-static {p0, p1}, Le/e/a/DownloadWorker115;->ready(Landroid/content/Context;Landroid/content/Intent;)Z'))
 edit(h,'e/e/a/ListActions.smali',lambda t:inject(t,'adjustHistoryMenu(Ljava/lang/Object;Landroid/view/Menu;)V','    invoke-static/range {p0 .. p1}, Le/e/a/ExistingMenu114;->install(Ljava/lang/Object;Landroid/view/Menu;)V'))
 edit(n,'com/sauzask/nicoid/NicoidVideoActivity.smali',lambda t:inject(t,'onBackPressed()V','    invoke-static {p0}, Le/e/a/PlaybackNavigation114;->back(Landroid/app/Activity;)Z\n    move-result v0\n    if-eqz v0, :native_back114\n    return-void\n    :native_back114'))
 edit(h,'e/e/a/PlaybackBar221.smali',lambda t:inject(t,'refresh()V','    invoke-static {}, Le/e/a/DirectBackground235;->refresh()V'))
 edit(h,'e/e/a/PlaybackTransfer221.smali',lambda t:inject(t,'restore(Ljava/lang/Object;Z)Z','    invoke-static {p0}, Le/e/a/PopupReturn244;->restore(Ljava/lang/Object;)Z\n    move-result v0\n    if-eqz v0, :legacy_restore1102\n    return v0\n    :legacy_restore1102'))
 edit(h,'e/e/a/RefreshDispatch.smali',lambda t:inject(t,'accept(Ljava/lang/Object;ZZ)V','    invoke-static {p0, p1, p2}, Le/e/a/FeedRefresh209;->accept(Ljava/lang/Object;ZZ)V'))
 edit(n,'com/sauzask/nicoid/NicoidVideoListActivity.smali',lambda t:t.replace('invoke-static {p0, v0}, Le/e/a/v0;->a(Landroid/content/Context;Ljava/lang/String;)V','invoke-static {p0, v0}, Le/e/a/TabSearch228;->edit(Landroid/app/Activity;Ljava/lang/String;)V'))
 edit(n,'com/sauzask/nicoid/NicoidActivity.smali',lambda t:inject(t,'onOptionsItemSelected(Landroid/view/MenuItem;)Z','    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I\n    move-result v0\n    const v1, 0x7f0f0119\n    if-ne v0, v1, :original_menu1102\n    invoke-static {p0}, Le/e/a/TabSearch228;->menu(Landroid/app/Activity;)Z\n    move-result v0\n    if-eqz v0, :original_menu1102\n    return v0\n    :original_menu1102'))
 edit(h,'e/e/a/PlaybackTransfer.smali',lambda t:body(t,'capture(Landroid/app/Activity;)Ljava/lang/Runnable;', '    .registers 2\n    invoke-static {p0}, Le/e/a/PlaybackHandoff110;->capture(Landroid/app/Activity;)Ljava/lang/Runnable;\n    move-result-object v0\n    return-object v0'))
 edit(h,'e/e/a/FilterUi110.smali',lambda t:body(t,'edit(Landroid/app/Activity;Lorg/json/JSONArray;Lorg/json/JSONObject;ILjava/lang/Runnable;)V','    .registers 5\n    invoke-static/range {p0 .. p4}, Le/e/a/FilterEditor110;->edit(Landroid/app/Activity;Lorg/json/JSONArray;Lorg/json/JSONObject;ILjava/lang/Runnable;)V\n    return-void'))
 edit(h,'e/e/a/ListActions.smali',lambda t:inject(inject(t,'addExtra(Landroid/view/Menu;Ljava/util/List;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Object;I)V','    invoke-static {p2, p3, p4}, Le/e/a/FilterEditor110;->prepare(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V'),'playback(Landroid/app/Activity;ZZ)V','    invoke-static {p0, p1, p2}, Le/e/a/TabPlayback110;->changed(Landroid/app/Activity;ZZ)V').replace('Le/e/a/ContentFilter;->confirmOwner(Landroid/content/Context;Ljava/lang/String;)V','Le/e/a/FilterEditor110;->confirm(Landroid/content/Context;Ljava/lang/String;)V'))
 for file in ['ModernSearch','ModernRanking']:
  edit(h,'e/e/a/'+file+'.smali',lambda t:t.replace('Le/e/a/ModernVideoOwner;->name(Lorg/json/JSONObject;)Ljava/lang/String;','Le/e/a/ContentFilter;->owner(Lorg/json/JSONObject;)Ljava/lang/String;'))
 edit(h,'e/e/a/ModernSearch.smali',lambda t:inject(t,'load(Le/e/a/e0;)V','    invoke-static {p0}, Le/e/a/SearchSnapshot110;->load(Ljava/lang/Object;)Z\n    move-result v0\n    if-eqz v0, :snapshot_fallback110\n    return-void\n    :snapshot_fallback110'))
 for root,file,signature,popup in [(n,'com/sauzask/nicoid/NicoidVideoFragment.smali','k(Z)Z',False),(n,'com/sauzask/nicoid/NicoidPopupViewService.smali','c(Z)Z',True)]:
  edit(root,file,lambda t:inject(t,signature,'    const/4 v0, '+('0x1' if popup else '0x0')+'\n    invoke-static {p0, p1, v0}, Le/e/a/TabPlayback110;->move(Ljava/lang/Object;ZZ)Z\n    move-result v0\n    if-eqz v0, :native_queue110\n    return v0\n    :native_queue110'))
 edit(n,'com/sauzask/nicoid/NicoidVideoFragment.smali',lambda t:inject(t,'a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;','    invoke-static/range {p0 .. p0}, Le/e/a/TabPlayback110;->request(Ljava/lang/Object;)V'))
 edit(n,'com/sauzask/nicoid/NicoidPopupViewService.smali',lambda t:t.replace('invoke-static/range {p0 .. p1}, Le/e/a/DirectBackground235;->begin(Ljava/lang/Object;Landroid/content/Intent;)V','invoke-static/range {p0 .. p1}, Le/e/a/DirectBackground235;->begin(Ljava/lang/Object;Landroid/content/Intent;)V\n    invoke-static/range {p0 .. p1}, Le/e/a/TabPlayback110;->begin(Ljava/lang/Object;Landroid/content/Intent;)V'))
 edit(n,'com/sauzask/nicoid/NicoidVideoFragment$n.smali',lambda t:t.replace('invoke-static {v0, v1}, Le/e/a/PlaybackTransfer221;->prepared(Ljava/lang/Object;Z)V','invoke-static {v0, v1}, Le/e/a/TabPlayback110;->attach(Ljava/lang/Object;Z)V\n\n    invoke-static {v0, v1}, Le/e/a/PlaybackTransfer221;->prepared(Ljava/lang/Object;Z)V'))
 edit(n,'com/sauzask/nicoid/NicoidPopupViewService$c.smali',lambda t:t.replace('invoke-static {v0}, Le/e/a/DirectBackground235;->prepared(Ljava/lang/Object;)V','const/4 v1, 0x1\n    invoke-static {v0, v1}, Le/e/a/TabPlayback110;->attach(Ljava/lang/Object;Z)V\n    invoke-static {v0}, Le/e/a/DirectBackground235;->prepared(Ljava/lang/Object;)V'))
 edit(n,'com/sauzask/nicoid/NicoidVideoActivity.smali',lambda t:inject(t,'onDestroy()V','    invoke-static {p0}, Le/e/a/CommentSafety110;->activity(Landroid/app/Activity;)V'))
 edit(n,'com/sauzask/nicoid/NicoidPopupViewService.smali',lambda t:inject(t,'a(Z)V','    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;\n    invoke-static {v0}, Le/e/a/CommentSafety110;->stop(Landroid/view/View;)V'))
 # Drain the same monitor held across lockCanvas/draw/unlock before Android releases the texture.
 p=n/'e/e/a/u.smali';t=p.read_text();assert 'onSurfaceTextureDestroyed(' not in t
 t=inject(t,'run()V','')
 t=t.replace('    monitor-enter p0\n\n    const/4 v7, 0x0','    monitor-enter p0\n    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;\n    move-result-object v7\n    iget-object v8, p0, Le/e/a/u;->t:Ljava/lang/Thread;\n    if-eq v7, v8, :current_worker110\n    monitor-exit p0\n    return-void\n    :current_worker110\n    const/4 v7, 0x0',1)
 t+='\n.method public declared-synchronized onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z\n    .registers 4\n    const/4 v0, 0x1\n    iput-boolean v0, p0, Le/e/a/u;->u:Z\n    iget-object v1, p0, Le/e/a/u;->t:Ljava/lang/Thread;\n    if-eqz v1, :drained110\n    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V\n    :drained110\n    const/4 v1, 0x0\n    iput-object v1, p0, Le/e/a/u;->t:Ljava/lang/Thread;\n    return v0\n.end method\n';p.write_text(t)
 edit(n,'com/sauzask/nicoid/NicoidActivity.smali',lambda t:inject(t,'dispatchTouchEvent(Landroid/view/MotionEvent;)Z','    invoke-static {p0, p1}, Le/e/a/GestureControls110;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z\n    move-result v0\n    if-eqz v0, :native_gesture110\n    return v0\n    :native_gesture110'))
 edit(h,'e/e/a/PlaylistPlayback.smali',lambda t:inject(t.replace('.registers 5\n','.registers 7\n',1),'attach(Landroid/app/Activity;Landroid/content/Intent;Ljava/util/ArrayList;IZ)V','    const-string v0, "nicoid_explicit_queue110"\n    const/4 v1, 0x1\n    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;'))
 edit(h,'e/e/a/PopupControls193.smali',lambda t:inject(t,'attach(Ljava/lang/Object;Landroid/view/View;)V','    invoke-static {p1, p0}, Le/e/a/QueueButtons110;->bind(Landroid/view/View;Ljava/lang/Object;)V'))
 edit(n,'com/sauzask/nicoid/NicoidSetting.smali',lambda t:t.replace('invoke-static {p0}, Le/e/a/NoMini;->settings(Landroid/preference/PreferenceActivity;)V','invoke-static {p0}, Le/e/a/NoMini;->settings(Landroid/preference/PreferenceActivity;)V\n    invoke-static {p0}, Le/e/a/GestureControls110;->settings(Landroid/preference/PreferenceActivity;)V'))
 # Resource identifiers of dynamically created views may be View.NO_ID (-1).
 for p in h.rglob('*.smali'):
  if p.name=='ResourceNames110.smali':continue
  t=p.read_text();t=re.sub(r'invoke-virtual (\{[^}]+\}), Landroid/content/res/Resources;->getResourceEntryName\(I\)Ljava/lang/String;',r'invoke-static \1, Le/e/a/ResourceNames110;->entry(Landroid/content/res/Resources;I)Ljava/lang/String;',t);p.write_text(t)
 # Exclude a standalone test runner; retain compatibility wrappers and migration code.
 for p in (h/'e/e/a').glob('CommentFollowRulesTest*.smali'):p.unlink()
def jvm(data):
 count=struct.unpack_from('>H',data,8)[0];out=bytearray(data[:10]);at=10;index=1;sizes={3:4,4:4,5:8,6:8,7:2,8:2,9:4,10:4,11:4,12:4,15:3,16:2,17:4,18:4,19:2,20:2}
 while index<count:
  tag=data[at];out.append(tag);at+=1
  if tag==1:
   length=struct.unpack_from('>H',data,at)[0];at+=2;value=data[at:at+length];at+=length;value=value.replace(b'1.9.12',VERSION.encode());out.extend(struct.pack('>H',len(value)));out.extend(value)
  else:
   length=sizes[tag];out.extend(data[at:at+length]);at+=length
   if tag in [5,6]:index+=1
  index+=1
 out.extend(data[at:]);return bytes(out)
def main():
 p=argparse.ArgumentParser();p.add_argument('--base',type=Path,required=True);p.add_argument('--tools',type=Path,required=True);p.add_argument('--output',type=Path,required=True);a=p.parse_args();tools=a.tools.resolve();base=a.base.resolve();out=a.output.resolve();assert hashlib.sha256(base.read_bytes()).hexdigest()==BASE
 work=ROOT/'stage';shutil.rmtree(work,ignore_errors=True);work.mkdir();cp=str(tools/'*')
 with zipfile.ZipFile(base) as z:
  for name,entry in [('helpers','nicoid/helpers.mpe'),('native','nicoid/method-delta.dex'),('executor','classes.dex')]:
   (work/(name+'.dex')).write_bytes(z.read(entry));run('java','-cp',cp,'org.jf.baksmali.Main','d',work/(name+'.dex'),'-o',work/name)
 run('java','-jar',tools/'ecj.jar','-1.8','-warn:none','-encoding','UTF-8','-cp',str(tools/'android.jar')+os.pathsep+str(tools/'helpers.jar'),'-d',work/'classes',*sorted((ROOT/'src/e/e/a').glob('*.java')))
 with zipfile.ZipFile(work/'revision.jar','w') as z:
  for f in (work/'classes').rglob('*.class'):z.write(f,f.relative_to(work/'classes'))
 (work/'d8').mkdir();run('java','-cp',tools/'r8.jar','com.android.tools.r8.D8','--min-api','28','--lib',tools/'android.jar','--lib',Path(shutil.which('java')).resolve().parents[1],'--classpath',tools/'helpers.jar','--output',work/'d8',work/'revision.jar')
 run('java','-cp',cp,'org.jf.baksmali.Main','d',work/'d8/classes.dex','-o',work/'compiled')
 for source in (ROOT/'src/e/e/a').glob('*.java'):
  for old in (work/'helpers/e/e/a').glob(source.stem+'*.smali'):
   if old.stem==source.stem or old.stem.startswith(source.stem+'$'):old.unlink()
 shutil.copytree(work/'compiled',work/'helpers',dirs_exist_ok=True);patch(work/'helpers',work/'native')
 for name in ['helpers','executor']:
  for f in (work/name).rglob('*.smali'):f.write_text(f.read_text().replace('"1.9.12"','"'+VERSION+'"').replace('v1.9.12 @chikuwadon','v'+VERSION+' @chikuwadon'))
 changes={}
 for name,entry in [('helpers','nicoid/helpers.mpe'),('native','nicoid/method-delta.dex'),('executor','classes.dex')]:run('java','-cp',cp,'org.jf.smali.Main','a','-j','1',work/name,'-o',work/(name+'-final.dex'));changes[entry]=(work/(name+'-final.dex')).read_bytes()
 out.parent.mkdir(parents=True,exist_ok=True)
 temporary=out.with_suffix('.tmp')
 with zipfile.ZipFile(base) as src,zipfile.ZipFile(temporary,'w',zipfile.ZIP_DEFLATED) as dst:
  for entry in src.infolist():
   data=changes.get(entry.filename,src.read(entry.filename))
   if entry.filename.endswith('.class'):data=jvm(data)
   if entry.filename=='META-INF/MANIFEST.MF':data=data.replace(b'Version: 1.9.12',('Version: '+VERSION).encode())
   dst.writestr(entry,data)
 temporary.replace(out)
 with zipfile.ZipFile(out) as z:assert z.testzip() is None
 result={'mpp':str(out),'sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'bytes':out.stat().st_size,'version':VERSION};(ROOT/'build-result.json').write_text(json.dumps(result,indent=2));print(json.dumps(result))
if __name__=='__main__':main()
