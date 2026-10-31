rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 try{
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/^jp[.]co[.]airfront[.]android[.]a2chMate[.]haiagaru[.](settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('verification package required');
 const S=Java.use('app.morphe.extension.chmate.SharedNg');
 const prefs=app.getSharedPreferences('haiagaru.shared-ng',0);
 if(prefs.getBoolean('githubFeed',false))throw Error('GAS must be default');
 if(!String(S.feedEndpoint()).endsWith('?action=reviewed'))throw Error('direct route missing');
 const before=Date.now();S.sync(true);
 if(Number(prefs.getLong('lastSync',0))<before)throw Error('live direct sync failed');
 if(prefs.getInt('failures',0)!==0)throw Error('sync failure counter');
 const field=S.class.getDeclaredField('status');field.setAccessible(true);
 resolve({defaultGas:true,liveDirectSync:true,status:String(field.get(null)),personalUploadsInvoked:false});
 }catch(e){reject(String(e));}
}));}};
