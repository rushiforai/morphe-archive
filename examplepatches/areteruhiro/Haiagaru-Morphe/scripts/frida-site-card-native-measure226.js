// Real 226 adapter and response 458. Simulates the 1.11.3 hidden-row gate, then
// compares current warm binding. Memory-only metadata; restores preferences/cache.
Java.perform(function(){
 const compareOld=false; // Optimized release: validate native behavior without a partial old-code emulation.
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix226')throw Error('226 verification app required');
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),FP=Java.use('app.morphe.extension.chmate.FilterPosition');
 const Cards=Java.use('app.morphe.extension.chmate.SiteCards'),Entry=Java.use('app.morphe.extension.chmate.SiteCards$Entry'),Data=Java.use('app.morphe.extension.chmate.SiteCardMetadata$Data');
 const View=Java.use('android.view.View'),VG=Java.use('android.view.ViewGroup'),TV=Java.use('android.widget.TextView'),LV=Java.use('android.widget.ListView');
 const prefs=H.preferences(app),keys=['siteCardsEnabled','siteCardImages'],saved=keys.map(k=>({k,had:prefs.contains(k),v:prefs.getBoolean(k,false)}));
 function field(o,n){for(let c=o.getClass();c;c=c.getSuperclass())try{const f=c.getDeclaredField(n);f.setAccessible(true);return f.get(o);}catch(e){}return null;}
 function body(v){if(TV.class.isInstance(v)&&String(Java.cast(v,TV).getText()).includes('/issues/244823'))return Java.cast(v,TV);if(VG.class.isInstance(v)){const g=Java.cast(v,VG);for(let i=0;i<g.getChildCount();i++){const found=body(g.getChildAt(i));if(found)return found;}}return null;}
 let oldGate=false;const onBound=Cards.onBound.overload('java.lang.Object');onBound.implementation=function(o){if(oldGate&&TV.class.isInstance(o)&&!Java.cast(o,TV).isShown())return;return onBound.call(this,o);};
 const getView=Java.use('o.listener').getView.overload('int','android.view.View','android.view.ViewGroup');
 getView.implementation=function(p,v,parent){const row=getView.call(this,p,v,parent);if(oldGate){const text=body(row);if(text)text.setText.overload('java.lang.CharSequence').call(text,Cards.strip(text.getText()));}return row;};
 Java.scheduleOnMainThread(()=>{let cache,dialog,deferred=false;const prior=[];let checks=0;
 function check(ok,s){if(!ok)throw Error(s);checks++;console.log('PASS '+s);}
 function cleanup(){oldGate=false;onBound.implementation=null;getView.implementation=null;if(dialog)dialog.dismiss();if(cache)prior.forEach(p=>{if(p.value)cache.put(p.url,p.value);else cache.remove(p.url);});const editor=prefs.edit();saved.forEach(s=>{if(s.had)editor.putBoolean(s.k,s.v);else editor.remove(s.k);});editor.commit();console.log('NATIVE_MEASURE_STATE_RESTORED');}
 function later(fn){setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{fn();}catch(e){console.log('FAIL '+e.stack);cleanup();}})),450);}
 try{
 const f=FP.class.getDeclaredField('fragments');f.setAccessible(true);const refs=Java.cast(f.get(null),Java.use('java.util.List'));let list;
 for(let i=0;i<refs.size();i++){const fragment=Java.cast(refs.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!fragment)continue;const root=fragment.getClass().getMethod('getView',Java.array('java.lang.Class',[])).invoke(fragment,Java.array('java.lang.Object',[]));if(!root)continue;const candidate=FP.findList(Java.cast(root,View));if(candidate&&candidate.isShown()&&LV.class.isInstance(candidate))list=Java.cast(candidate,LV);}
 check(!!list,'visible native 226 response ListView');const adapter=Java.cast(list.getAdapter(),Java.use('o.listener'));let index=-1;
 for(let i=0;i<adapter.getCount();i++){const row=adapter.getItem(i),post=field(row,'j');if(post){const no=field(post,'l');if(no&&String(no)==='458'){const probe=adapter.getView(i,null,list);if(body(probe)){index=i;break;}}}}
 check(index>=0,'reported AdGuard response 458 present');
 prefs.edit().putBoolean(keys[0],true).putBoolean(keys[1],false).commit();
 const cf=Cards.class.getDeclaredField('CACHE');cf.setAccessible(true);cache=Java.cast(cf.get(null),Java.use('java.util.Map'));
 for(const id of ['244823','244900']){const url='https://github.com/AdguardTeam/AdguardFilters/issues/'+id;prior.push({url,value:cache.get(url)});const e=Entry.$new();e.data.value=Data.$new(url,'REGRESSION '+id,'Native measurement regression without network','','GitHub');e.expiry.value=Date.now()+60000;e.imageTried.value=true;cache.put(url,e);}
 const width=list.getMeasuredWidth()-list.getPaddingLeft()-list.getPaddingRight();function measure(v){v.forceLayout();v.measure(1073741824|width,0);return v.getMeasuredHeight();}
 oldGate=true;const old=adapter.getView(index,null,list),before=measure(old),oldBody=body(old);
 if(compareOld)check(!String(oldBody.getText()).includes('REGRESSION'),'1.11.3 hidden-row gate omits cached cards');
 // This is precisely what the native position restorer measures with getView(index,null,list).
 oldGate=false;const fixed=adapter.getView(index,null,list),height=measure(fixed),fixedBody=body(fixed);
 check(String(fixedBody.getText()).includes('REGRESSION 244823')&&String(fixedBody.getText()).includes('REGRESSION 244900'),'current hidden-row binding includes both cached cards');
 if(compareOld)check(height>before,'REPRODUCED original native measurement underestimates card row height');
 console.log('HEIGHT old='+before+' fixed='+height+' delta='+(height-before)+' index='+index+' width='+width);
 const once=String(fixedBody.getText());Cards.onBound(fixedBody);check(String(fixedBody.getText())===once,'warm rebind does not duplicate cards');check(measure(fixed)===height,'repeated native measurement retains height');
 // Run the actual native bottom-anchor capture/restore in a temporary, narrow-height
 // viewport. No fragment scroll callback is attached, so native read state is untouched.
 const test=LV.$new(list.getContext());test.setAdapter(adapter);test.setSelectionFromTop(index,-100);
 dialog=Java.use('android.app.Dialog').$new(list.getContext());dialog.setContentView(test);dialog.show();dialog.getWindow().setLayout(width,300);
 deferred=true;
 function point(){const first=test.getChildAt(0);return {position:test.getFirstVisiblePosition(),top:first?first.getTop():0};}
 const Capture=Java.use('o.MessageInflaterKt$RemoteActionCompatParcelizer'),restore=Java.use('o.MessageInflaterKt');
 later(()=>{test.setSelectionFromTop(index,-100);later(()=>{
  const before=point(),anchor=Capture.b.overload('android.widget.ListView','int').call(Capture,test,1000);console.log('NATIVE_ANCHOR '+anchor+' BEFORE '+JSON.stringify(before));
  oldGate=true;restore.a.overload('android.widget.ListView','int').call(Java.cast(anchor,restore),test,1000);
  later(()=>{const broken=point();if(compareOld)check(broken.position!==before.position||broken.top!==before.top,'REPRODUCED native restore moves viewport with hidden-row cards missing');console.log('OLD_RESTORED '+JSON.stringify(broken));
   oldGate=false;test.setSelectionFromTop(index,-100);later(()=>{
    const fixedBefore=point(),fixedAnchor=Capture.b.overload('android.widget.ListView','int').call(Capture,test,1000);
    restore.a.overload('android.widget.ListView','int').call(Java.cast(fixedAnchor,restore),test,1000);
    later(()=>{const after=point();console.log('FIXED_RESTORED '+JSON.stringify(after));check(after.position===fixedBefore.position&&after.top===fixedBefore.top,'current native restore retains exact row and pixel offset');console.log('SITE_CARD_NATIVE_226_COMPLETE '+checks+' checks');cleanup();});
   });
  });
 });});
 }catch(e){console.log('FAIL '+e.stack);}finally{if(!deferred)cleanup();}
 });
});
