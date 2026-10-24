// Calls the same offscreen control listeners used by Compose; never presses the NG save button.
setTimeout(()=>Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=app.getPackageName().toString();
 if(!/\.haiagaru\.(?:settingsfix191|resumefix226|resumefix242)$/.test(pkg))throw Error('Verification app required');
 const args=Script.runtime;
 let activity=null,dialog=null,picker=null,checks=0;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function field(o,name){const f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(o);}
 function find(root,name){if(root.getClass().getName().toString()===name)return root;
  if(Java.use('android.view.ViewGroup').class.isInstance(root)){const g=Java.cast(root,Java.use('android.view.ViewGroup'));for(let i=0;i<g.getChildCount();i++){const f=find(g.getChildAt(i),name);if(f!==null)return f;}}return null;
 }
 function later(ms,fn){setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{fn();}catch(e){console.log('FAIL '+e.stack);}})),ms);}
 later(0,()=>Java.choose('app.morphe.extension.chmate.HaiagaruSettingsActivity',{onMatch:a=>{if(activity===null&&!a.isFinishing()){activity=Java.retain(a);
  Java.use('app.morphe.extension.chmate.WacchoiSuffixNg').confirm.overload('android.content.Context','java.lang.String','java.lang.String')
   .call(Java.use('app.morphe.extension.chmate.WacchoiSuffixNg'),a,'abcd-Ab12','android');}},onComplete:()=>check(activity!==null,'settings activity available')}));
 later(3500,()=>Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch:d=>{
  if(!d.isShowing())return;const spec=field(d,'spec'),root=field(spec,'view');if(root===null)return;
  const found=find(root,'app.morphe.extension.chmate.NgBoardScopePicker');if(found!==null){dialog=Java.retain(d);picker=Java.retain(found);}
 },onComplete:()=>{
  check(picker!==null,'board picker present in NGName dialog');
  const mode=Java.cast(field(picker,'mode'),Java.use('android.widget.Spinner'));
  check(mode.getSelectedItemPosition()===1,'source board starts as include-only');
  mode.setSelection(2);mode.getOnItemSelectedListener().onItemSelected(mode,null,2,mode.getItemIdAtPosition(2));
  const choose=Java.cast(field(picker,'choose'),Java.use('android.widget.Button'));
  check(choose.getText().toString().includes('除外する板')&&choose.getVisibility()===0,'exclude mode updates action visibility / text');
  choose.performClick();
 }}));
 later(6500,()=>{
  let selection=null;
  Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch:d=>{
   if(d.isShowing()&&field(field(d,'spec'),'title').toString()==='除外する板')selection=Java.retain(d);
  },onComplete:()=>{
   check(selection!==null,'board selection opens');
   const root=field(field(selection,'spec'),'view'),c=find(root,'android.widget.CheckBox');
   check(c!==null,'board toggle available');Java.cast(c,Java.use('android.widget.CheckBox')).performClick();
   selection.getButton(-2).performClick();
   const scope=Java.cast(picker,Java.use('app.morphe.extension.chmate.NgBoardScopePicker')).value();
   check(scope.toString().includes('android'),'cancel leaves previous board selection intact');
   dialog.getButton(-2).performClick();
   console.log('PASS '+checks+' NG scope action checks; no NG item written');
  }});
 });
}),1000);
