// Unsaved template editor. No rule/settings writes; dismiss after inspection.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),D=Java.use('app.morphe.extension.chmate.ProgrammableNgDialog'),C=Java.use('app.morphe.extension.chmate.ProgrammableNgController');let dialog;
 function field(o,k){const f=o.getClass().getDeclaredField(k);f.setAccessible(true);return f.get(o);}
 Java.scheduleOnMainThread(()=>{try{const rules=Java.use('java.util.ArrayList').$new();rules.add(C.templateRule(1));D.editRule(H.toolbarActivity(null),false,rules,0);}catch(e){console.log('FAIL '+e.stack);}});
 setTimeout(()=>Java.perform(()=>Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{
  onMatch(d){if(d.isShowing()&&String(field(field(d,'spec'),'title'))==='レス本文のキーワード')dialog=Java.retain(d);},
  onComplete(){Java.scheduleOnMainThread(()=>{try{
   if(!dialog)throw Error('Editor missing');const scroll=Java.cast(field(field(dialog,'spec'),'view'),Java.use('android.widget.ScrollView'));
   const content=Java.cast(scroll.getChildAt(0),Java.use('android.widget.LinearLayout')),TV=Java.use('android.widget.TextView');let paired=false,help=false;
   for(let i=0;i<content.getChildCount();i++){const v=content.getChildAt(i);if(TV.class.isInstance(v)){const text=String(Java.cast(v,TV).getText());if(text.includes('samePoster: true'))help=true;if(text==='判定式'&&i+1<content.getChildCount()&&Java.use('android.widget.EditText').class.isInstance(content.getChildAt(i+1)))paired=true;}}
   if(!help||!paired)throw Error('Script help/short label missing');
   dialog.getWindow().setLayout(Math.round(360*app.getResources().getDisplayMetrics().density.value),-2);
   console.log('NG_EDITOR_NARROW_READY separate-help=true short-label=true widthDp=360');
  }catch(e){console.log('FAIL '+e.stack);}});}
 })),2000);
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(dialog&&dialog.isShowing())dialog.dismiss();console.log('NG_EDITOR_DISMISSED_WITHOUT_SAVING');})),45000);
});
