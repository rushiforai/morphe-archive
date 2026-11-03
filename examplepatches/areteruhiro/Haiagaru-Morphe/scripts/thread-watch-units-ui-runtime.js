function main(fn){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}})));}
function settle(){return new Promise(resolve=>setTimeout(resolve,600));}
let app,W,a,p,had,saved,checks=0;
function check(v,label){if(!v)throw Error(label);checks++;}
function plain(value){const S=Java.use('java.lang.String');return String(S.valueOf.overload('java.lang.Object').call(S,value));}
function panel(){
 let found;const Group=Java.use('android.view.ViewGroup'),Edit=Java.use('android.widget.EditText');
 Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch(d){if(!d.isShowing())return;const inputs={},all=[];function walk(v){if(Edit.class.isInstance(v)){const e=Java.retain(Java.cast(v,Edit));all.push(e);inputs[plain(e.getContentDescription())]=e;}if(Group.class.isInstance(v)){const g=Java.cast(v,Group);for(let i=0;i<g.getChildCount();i++)walk(g.getChildAt(i));}}const sf=d.getClass().getDeclaredField('spec');sf.setAccessible(true);const spec=sf.get(d),vf=spec.getClass().getDeclaredField('view');vf.setAccessible(true);const view=vf.get(spec);if(view)walk(Java.cast(view,Java.use('android.view.View')));if(inputs['確認間隔の日']&&inputs['確認間隔の時間']&&inputs['確認間隔の分'])found={dialog:Java.retain(d),inputs:['日','時間','分'].map(unit=>inputs['確認間隔の'+unit])};else if(all.length===3)found={dialog:Java.retain(d),inputs:all};},onComplete(){}});
 if(!found)throw Error('Interval day/hour/minute controls missing');return found;
}
rpc.exports={async test(){
 await main(()=>{app=Java.use('android.app.ActivityThread').currentApplication();if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.migration191242')throw Error('Isolated package required');W=Java.use('app.morphe.extension.chmate.ThreadWatch');a=Java.retain(Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null));p=app.getSharedPreferences('haiagaru_thread_watch_options',0);had=p.contains('minutes');saved=p.getInt('minutes',15);});
 try{
  await main(()=>{for(let i=0;i<12;i++){try{panel().dialog.dismiss();}catch(ignored){break;}}});await settle();
  for(const sample of [ ['0','0','1',1,'1分'],['1','0','0',1440,'1日'],['2','3','4',3064,'2日3時間4分'],['0','24','0',1440,'1日'],['7','0','0',10080,'7日'] ]){
   await main(()=>W.showInterval(a));await settle();
   await main(()=>{const ui=panel(),TV=Java.use('android.widget.TextView'),S=Java.use('java.lang.String');for(let i=0;i<3;i++)TV.setText.overload('java.lang.CharSequence').call(ui.inputs[i],S.$new(sample[i]));});await settle();
   await main(()=>{panel().dialog.getButton(-1).performClick();check(p.getInt('minutes',-1)===sample[3],'saved conversion '+sample[4]);check(String(W.intervalLabel(sample[3]))===sample[4],'human interval '+sample[4]);});await settle();
   await main(()=>W.showInterval(a));await settle();
   await main(()=>{const ui=panel(),n=sample[3],expected=[Math.floor(n/1440),Math.floor(n%1440/60),n%60];check(ui.inputs.every((v,i)=>plain(v.getText())===String(expected[i])),'restored normalized units '+sample[4]);ui.dialog.dismiss();});await settle();
  }
  for(const values of [['0','0','0'],['8','0','0'],['9999999999999999999999999','0','0']]){
   await main(()=>W.showInterval(a));await settle();
   await main(()=>{const ui=panel(),TV=Java.use('android.widget.TextView'),S=Java.use('java.lang.String'),before=p.getInt('minutes',-1);for(let i=0;i<3;i++)TV.setText.overload('java.lang.CharSequence').call(ui.inputs[i],S.$new(values[i]));ui.dialog.getButton(-1).performClick();check(ui.dialog.isShowing()&&p.getInt('minutes',-1)===before,'invalid duration retains dialog and saved value');ui.dialog.dismiss();});await settle();
  }
  return {checks,dayHourMinuteControls:true,settingsRestored:true};
 }finally{await main(()=>{try{panel().dialog.dismiss();}catch(ignored){}if(had)p.edit().putInt('minutes',saved).commit();else p.edit().remove('minutes').commit();W.schedule.overload('android.content.Context').call(W,app);});}
}};
