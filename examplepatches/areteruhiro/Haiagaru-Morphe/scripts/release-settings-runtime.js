rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 let a;Java.choose('app.morphe.extension.chmate.HaiagaruSettingsActivity',{onMatch(x){if(!x.isFinishing())a=Java.retain(Java.cast(x,Java.use('android.app.Activity')));},onComplete(){Java.scheduleOnMainThread(()=>{try{
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),T=Java.use('android.widget.TextView'),G=Java.use('android.view.ViewGroup'),Sw=Java.use('android.widget.Switch');let checks=0;
 function check(ok,s){if(!ok)throw Error(s);checks++;}
 function find(root,text){if(T.class.isInstance(root)&&String(Java.cast(root,T).getText())===text)return root;if(G.class.isInstance(root)){const g=Java.cast(root,G);for(let i=0;i<g.getChildCount();i++){const v=find(g.getChildAt(i),text);if(v)return v;}}return null;}
 const display=H.settingsCategory(a,'DISPLAY');check(!!find(display,'板のスレ一覧で既読スレを上に'),'read-first entry exists');
 const prefs=a.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='readThreadsFirst',had=prefs.contains(key),saved=prefs.getBoolean(key,false),toggle=Java.cast(find(display,'板のスレ一覧で既読スレを上に'),Sw);
 try{toggle.setChecked(false);check(!Java.use('app.morphe.extension.chmate.ReadThreadsFirst').enabled(),'native setting follows OFF');check(!Java.cast(find(H.settingsCategory(a,'DISPLAY'),'板のスレ一覧で既読スレを上に'),Sw).isChecked(),'reopened UI follows OFF');}finally{const e=prefs.edit();if(had)e.putBoolean(key,saved);else e.remove(key);e.commit();}
 resolve({version:String(a.getPackageName()).slice(-3),checks});
 }catch(e){reject(Error(String(e.stack||e)));}});}});
}));}};