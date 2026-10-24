// Two rendered size variants in a disposable settings Activity. No live checker request.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 test package required');
 Java.classFactory.loader=app.getClassLoader();
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),C=Java.use('app.morphe.extension.chmate.HissiMenuController'),UI=Java.use('app.morphe.extension.chmate.ToolScreenUi');
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='checkerHeaderPercent',had=p.contains(key),old=p.getInt(key,30);
 const Dialog=Java.use('app.morphe.extension.chmate.HaiagaruDialog'),show=Dialog.show.overload();
 show.implementation=function(){const f=this.getClass().getDeclaredField('spec');f.setAccessible(true);const spec=f.get(this),t=spec.getClass().getDeclaredField('title');t.setAccessible(true);if(String(t.get(spec))==='Haiagaruの初期設定')return;return show.call(this);};
 let activity,controller,web;
 const Intent=Java.use('android.content.Intent'),Linear=Java.use('android.widget.LinearLayout'),Text=Java.use('android.widget.TextView'),Params=Java.use('android.widget.LinearLayout$LayoutParams');
 Java.scheduleOnMainThread(()=>{const i=Intent.$new();i.setClassName(app,'app.morphe.extension.chmate.HaiagaruSettingsActivity');i.addFlags(0x10000000);app.startActivity(i);});
 function phase(percent,height){Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
  if(!activity)activity=Java.retain(H.toolbarActivity(null));
  if(!String(activity.getClass().getName()).endsWith('.HaiagaruSettingsActivity'))throw Error('Fixture Activity not foreground');
  if(web){web.destroy();controller.close();}
  p.edit().putInt(key,percent).commit();
  const root=Linear.$new(activity);root.setOrientation(1);root.setTag(0x48690b07,Java.use('java.lang.Boolean').TRUE.value);
  controller=Java.retain(C.$new(activity,Intent.$new(),true,null,null));web=Java.retain(Java.use('android.webkit.WebView').$new(activity));web.loadData('<html><body>ローカル表示検証</body></html>','text/html','UTF-8');
  const toolbar=controller.createViewerToolbar(web);controller.updateViewerToolbarHeight(toolbar,height);root.addView(toolbar);
  for(let i=0;i<35;i++){const t=Text.$new(activity);t.setText.overload('java.lang.CharSequence').call(t,Java.use('java.lang.String').$new('パネル検証 '+i));root.addView(t);}
  const Back=Java.registerClass({name:'app.morphe.extension.chmate.CheckerFixtureBack'+percent,implements:[Java.use('java.lang.Runnable')],methods:{run(){}}});
  root.addView(web,Params.$new(-1,0,1));activity.setContentView(UI.model(activity,'',root,Back.$new(),false));
  console.log('CHECKER_LAYOUT_PHASE percent='+percent+' toolbar='+height);
 }catch(e){console.log('FAIL '+e.stack);}}));}
 setTimeout(()=>phase(10,32),4000);setTimeout(()=>phase(60,56),45000);
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{show.implementation=null;const e=p.edit();if(had)e.putInt(key,old);else e.remove(key);e.commit();if(web)web.destroy();if(controller)controller.close();if(activity)activity.finish();console.log('CHECKER_LAYOUT_FIXTURE_COMPLETE preference restored');})),85000);
});
