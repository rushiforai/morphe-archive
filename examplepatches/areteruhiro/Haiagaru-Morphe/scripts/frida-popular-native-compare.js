// Compare native selected tree count with the added counter; restore filter/settings.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!/jp\.co\.airfront\.android\.a2chMate\.haiagaru\.(resumefix242|popularfix242)$/.test(String(app.getPackageName())))throw Error('242 verification only');
 const E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
 const keys=['popularReplyDirect','popularReplyPopup'],saved=keys.map(k=>({k,had:prefs.contains(k),v:prefs.getBoolean(k,false)}));let adapter=null,changed=false;
 function field(o,k){const f=o.getClass().getDeclaredField(k);f.setAccessible(true);return f.get(o);}
 function call(name,args,types){const m=E.class.getDeclaredMethod(name,Java.array('java.lang.Class',types));m.setAccessible(true);return m.invoke(null,Java.array('java.lang.Object',args));}
 const O=Java.use('java.lang.Object').class;
 Java.scheduleOnMainThread(function(){try{
  Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch:d=>{if(d.isShowing())d.dismiss();},onComplete:function(){}});
  const f=E.class.getDeclaredField('OWNERS');f.setAccessible(true);const owners=Java.cast(f.get(null),Java.use('java.util.List'));
  for(let i=owners.size()-1;i>=0;i--){const owner=Java.cast(owners.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!owner)continue;
   const view=owner.getClass().getMethod('getView',Java.array('java.lang.Class',[])).invoke(owner,Java.array('java.lang.Object',[]));if(!view||!Java.cast(view,Java.use('android.view.View')).isShown())continue;
   adapter=Java.retain(call('adapter',[owner],[O]));const flags=call('selected',[adapter],[O]);if(Java.use('java.lang.reflect.Array').getBoolean(flags,0))throw Error('Native popular filter already active; do not change it');
   prefs.edit().putBoolean(keys[0],false).putBoolean(keys[1],false).commit();call('toggle',[adapter,Java.use('java.lang.Integer').valueOf(0)],[O,Java.use('java.lang.Integer').TYPE.value]);changed=true;console.log('NATIVE_POPULAR_SELECTED_FOR_COMPARISON');return;
  }throw Error('No visible response owner');
 }catch(e){console.log('FAIL '+e.stack);}});
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(function(){try{
  if(!adapter)throw Error('No adapter');const model=field(adapter,'k'),flow=field(model,'w');const value=flow.getClass().getMethod('d',Java.array('java.lang.Class',[])).invoke(flow,Java.array('java.lang.Object',[]));const text=String(value);console.log('SELECTED_NATIVE_STATE='+text);
  const f=E.class.getDeclaredField('STATES');f.setAccessible(true);const state=Java.cast(f.get(null),Java.use('java.util.Map')).get(adapter);const count=Java.use('java.lang.reflect.Array').getInt(field(state,'counts'),0);console.log('ADDED_POPULAR_COUNT='+count);
  const context=Java.cast(field(adapter,'e'),Java.use('android.content.Context')),P=Java.use('app.morphe.extension.chmate.PopularReplies'),N=Java.use('app.morphe.extension.chmate.PopularNativeRows');
  const source=P.fullList(field(adapter,'o')),snapshot=N.find(source);console.log('AT_COMPARE direct='+P.directFor(context)+' popup='+P.enabledFor(context)+' flat='+field(snapshot,'flat')+' failure='+field(state,'failure'));
  console.log('SNAPSHOT_SELECTION='+Java.cast(snapshot.getClass().getDeclaredMethod('selected',Java.array('java.lang.Class',[Java.use('java.lang.Integer').TYPE.value])).invoke(snapshot,Java.array('java.lang.Object',[Java.use('java.lang.Integer').valueOf(3)])),Java.use('java.util.Set')).size());
  const match=/popular=FilterBarState\(selected=true, count=(\d+)\)/.exec(text);if(!match||Number(match[1])!==count)throw Error('Native/additional count mismatch');console.log('PASS actual native standard count matches added counter: '+count);
  prefs.edit().putBoolean(keys[0],true).putBoolean(keys[1],false).commit();E.refreshPopularity();
  const directCount=Java.use('java.lang.reflect.Array').getInt(field(state,'counts'),0),applied=field(state,'appliedSnapshot');
  const rendered=Java.cast(field(applied,'b'),Java.use('java.util.List'));let shown=0;
  for(let i=0;i<rendered.size();i++)if(call('rowResponse',[rendered.get(i)],[O])!==null)shown++;
  console.log('DIRECT_INLINE_COUNT='+directCount+' renderedRows='+shown);
  if(directCount<=0||directCount>=count||shown!==directCount)throw Error('Direct mode with popup OFF did not change inline results');console.log('PASS direct mode with popup OFF filters inline results independently');
 }catch(e){console.log('FAIL '+e.stack);}finally{
  if(adapter&&changed)call('toggle',[adapter,Java.use('java.lang.Integer').valueOf(0)],[O,Java.use('java.lang.Integer').TYPE.value]);
  const e=prefs.edit();saved.forEach(s=>{if(s.had)e.putBoolean(s.k,s.v);else e.remove(s.k);});e.commit();E.refreshPopularity();console.log('NATIVE_FILTER_AND_PREFERENCES_RESTORED');
 }})),4000);
});
