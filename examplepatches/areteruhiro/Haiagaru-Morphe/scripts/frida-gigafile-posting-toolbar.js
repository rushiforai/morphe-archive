Java.perform(()=>Java.scheduleOnMainThread(()=>{
  const H=Java.use('app.morphe.extension.chmate.Haiagaru');
  const ref=H.class.getDeclaredField('resumedActivity');ref.setAccessible(true);
  const current=Java.cast(ref.get(null),Java.use('java.lang.ref.WeakReference')).get();
  if(!current)throw Error('no current activity');
  const act=Java.cast(current,Java.use('android.app.Activity'));
  const pkg=String(act.getPackageName()), version=pkg.slice(-3);
  if (!/\.haiagaru\.reporter(191|226|242)$/.test(pkg))throw Error('isolate');
  const old=version==='191',middle=version==='226';
  const holder=act.getWindow().getDecorView().findViewById(old?0x7f0a00c3:middle?0x7f090087:0x7f0900a9);
  if(!holder)throw Error('dialog toolbar missing in '+act.getClass().getName()+' '+version);
  function f(obj,n){for(let c=obj.getClass();c;c=c.getSuperclass()){try{let x=c.getDeclaredField(n);x.setAccessible(true);return x.get(obj);}catch(_){}}throw Error(n);}
  const state=f(holder,old||middle?'h':'settings');
  const rows=Java.cast(old?state:f(state,middle?'b':'a'),Java.use('java.util.List'));
  const ids=[];
  for (let i=0;i<rows.size();i++) {
    const item=rows.get(i);
    ids.push(Number(f(item,middle?'b':'c').toString()));
  }
  console.log('TOOLBAR '+version+' '+ids.join(','));
  const action=0x7e000049, image=ids.indexOf(18);
  const enabled = act.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0).getBoolean("showGigaFileUploadButton",false);
  if(enabled) {
    if(image<0||ids[image+1]!==action||ids.filter(v=>v===action).length!==1)throw Error('file/icon order');
    const visible = Java.cast(f(holder,old?'g':middle?'b':'d'),Java.use('java.util.List'));
    if(visible.size()<2)throw Error('Native toolbar did not build its buttons');
    if(act.getWindow().getDecorView().findViewWithTag('haiagaru.gigafile'))throw Error('old full-width button remains');
    console.log('PASS native dialog toolbar file icon follows image icon '+version);
  } else {
    if(ids.includes(action))throw Error('File icon shown while disabled');
    console.log('PASS native file icon hidden by default '+version);
  }
}));