/* Real UI touch runner bridge; isolated subscription, no network. */
function main(fn){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}})));}
let app,a,W,M,p;
const url='https://fixture.invalid/test/read.cgi/manage/1790000997/';
rpc.exports={
 prepare(){return main(()=>{app=Java.use('android.app.ActivityThread').currentApplication();if(!/\.haiagaru\.bindings(191|226|242)$/.test(String(app.getPackageName())))throw Error('isolated only');W=Java.use('app.morphe.extension.chmate.ThreadWatch');M=Java.use('app.morphe.extension.chmate.ThreadWatchManagement');p=W.prefs(app);if(!p.getAll().isEmpty())throw Error('existing registrations');a=Java.retain(Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null));p.edit().putString(url,JSON.stringify({count:10,token:'manage',title:'WATCH_MANAGEMENT_FIXTURE',durationMinutes:1440,expiresAt:Date.now()+86400000})).commit();M.show(a);});},
 show(){return main(()=>M.show(a));},
 state(){return main(()=>p.contains(url)?JSON.parse(String(p.getString(url,'{}'))):null);},
 cleanup(){return main(()=>{Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch(d){if(d.isShowing())d.dismiss();},onComplete(){}});p.edit().remove(url).commit();W.schedule.overload('android.content.Context').call(W,app);});}
};
