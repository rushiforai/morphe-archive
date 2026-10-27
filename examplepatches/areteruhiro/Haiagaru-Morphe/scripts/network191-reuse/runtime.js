// Loopback-only native transport fixture; no public requests or account data.
rpc.exports.get = function(url, close, patched) {
    return new Promise((resolve, reject) => Java.perform(() => {
        let response, prefs, existed, previous;
        const start = Date.now();
        try {
            if (!/^http:\/\/10\.0\.2\.2:\d+\//.test(url)) throw Error('Local fixture only');
            const client = Java.use('o.getCredentials').d();
            const builder = Java.use('o.r8lambda17vlhACr7B0IDgCdn1Q67LKhir8$setContentView').$new();
            builder.b.overload('java.lang.String').call(builder, url);
            const request = builder.c.overload().call(builder);
            if (patched) {
                const app=Java.use('android.app.ActivityThread').currentApplication();
                Java.use('app.morphe.extension.chmate.Haiagaru').shouldHideAds(app);
                prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
                existed=prefs.contains('fresh191UpdateConnection');previous=prefs.getBoolean('fresh191UpdateConnection',false);
                prefs.edit().putBoolean('fresh191UpdateConnection',close).commit();
            } else if (close) {
                const field = request.getClass().getDeclaredField('a'); field.setAccessible(true);
                const headers = Java.cast(field.get(request), Java.use('okhttp3.Headers'));
                const pairsField=headers.getClass().getDeclaredField('namesAndValues');pairsField.setAccessible(true);
                const pairs=Java.cast(pairsField.get(headers),Java.use('[Ljava.lang.String;'));
                const values=[];for(let n=0;n<pairs.length;n+=2)if(String(pairs[n]).toLowerCase()!=='connection')values.push(String(pairs[n]),String(pairs[n+1]));
                values.push('Connection','close');
                const changed=Java.use('okhttp3.Headers').$new(Java.array('java.lang.String',values));
                field.set(request, changed);
            }
            const call = Java.use('o.putFloat').$new(client, request, false);
            if (patched) Java.use('app.morphe.extension.chmate.NativeUpdatePolicy').configure191(call);
            response = call.e();
            const body = String(Java.cast(response.c.value, Java.use('o.sExternalSyntheticLambda2')).e());
            resolve({ok:body==='ok',elapsed:Date.now()-start});
        } catch (error) { resolve({ok:false,elapsed:Date.now()-start,error:error.$className||String(error)}); }
        finally {
            if (response) response.close();
            if(prefs){const editor=prefs.edit();if(existed)editor.putBoolean('fresh191UpdateConnection',previous);else editor.remove('fresh191UpdateConnection');editor.commit();}
        }
    }));
};

rpc.exports.policyCases=function(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),H=Java.use('app.morphe.extension.chmate.Haiagaru');H.shouldHideAds(app);
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='fresh191UpdateConnection',had=prefs.contains(key),old=prefs.getBoolean(key,false);
 const checks=[];
 try{
  prefs.edit().remove(key).commit();if(!H.fresh191UpdateConnection())throw Error('new option must default ON');checks.push('unset defaults ON');
  prefs.edit().putBoolean(key,false).commit();if(H.fresh191UpdateConnection())throw Error('explicit OFF not retained');checks.push('explicit OFF overrides default');
  const client=Java.use('o.getCredentials').d(),Policy=Java.use('app.morphe.extension.chmate.NativeUpdatePolicy');
  for(const enabled of [false,true])for(const pair of [
   ['GET','/board/subject.txt',true],['GET','/board/dat/1234567890.dat',true],
   ['GET','/test/read.cgi/board/1234567890/',true],['GET','/a.gif',false],['GET','/a.mp4',false],
   ['POST','/board/subject.txt',false],['POST','/test/bbs.cgi',false]]){
   prefs.edit().putBoolean(key,enabled).commit();
   const builder=Java.use('o.r8lambda17vlhACr7B0IDgCdn1Q67LKhir8$setContentView').$new();builder.b.overload('java.lang.String').call(builder,'https://fixture.example.org'+pair[1]);
   const request=builder.c.overload().call(builder),method=request.getClass().getDeclaredField('c');method.setAccessible(true);method.set(request,Java.use('java.lang.String').$new(pair[0]));
   const header=request.getClass().getDeclaredField('a');header.setAccessible(true);
   const initial=Java.cast(header.get(request),Java.use('okhttp3.Headers')),valuesField=initial.getClass().getDeclaredField('namesAndValues');valuesField.setAccessible(true);
   const before=Java.cast(valuesField.get(initial),Java.use('[Ljava.lang.String;')),snapshot=[];for(let i=0;i<before.length;i++)snapshot.push(String(before[i]));
   const call=Java.use('o.putFloat').$new(client,request,false);Policy.configure191(call);
   const callRequest=call.getClass().getDeclaredField('g');callRequest.setAccessible(true);const actual=callRequest.get(call);
   const after=Java.cast(header.get(actual),Java.use('okhttp3.Headers')),changed=String(after.get('Connection'))==='close';
   if(changed!==(enabled&&pair[2]))throw Error('scope mismatch '+enabled+' '+pair);
   if((!request.equals(actual))!==(enabled&&pair[2]))throw Error('request copy mismatch');
   const untouched=Java.cast(valuesField.get(initial),Java.use('[Ljava.lang.String;'));for(let i=0;i<untouched.length;i++)if(String(untouched[i])!==snapshot[i])throw Error('shared headers modified');
   checks.push(enabled+' '+pair[0]+' '+pair[1]);
  }
  resolve(checks);
 }catch(error){reject(Error(String(error.stack||error)));}
 finally{const edit=prefs.edit();if(had)edit.putBoolean(key,old);else edit.remove(key);edit.commit();}
}));};

rpc.exports.settingsToggle=function(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 let prefs,had,old;
 try{
  const app=Java.use('android.app.ActivityThread').currentApplication(),H=Java.use('app.morphe.extension.chmate.Haiagaru');
  prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);had=prefs.contains('fresh191UpdateConnection');old=prefs.getBoolean('fresh191UpdateConnection',true);
  const thread=Java.use('android.app.ActivityThread').currentActivityThread(),entries=thread.mActivities.value.values().toArray();let activity;
  for(const record of entries){const f=record.getClass().getDeclaredField('activity');f.setAccessible(true);const a=Java.cast(f.get(record),Java.use('android.app.Activity'));if(!a.isFinishing())activity=a;}
  if(!activity)throw Error('No activity');
  const root=H.settingsCategory(activity,'ADVANCED'),Group=Java.use('android.view.ViewGroup'),Switch=Java.use('android.widget.Switch');let found;
  function walk(v){if(Switch.class.isInstance(v)){const s=Java.cast(v,Switch);if(String(s.getText())==='191の板・スレ取得で接続を再利用しない')found=s;}if(Group.class.isInstance(v)){const group=Java.cast(v,Group);for(let i=0;i<group.getChildCount();i++)walk(group.getChildAt(i));}}
  walk(root);if(!found)throw Error('191 connection toggle missing');
  const current=H.fresh191UpdateConnection();if(found.isChecked()!==current)throw Error('toggle differs from runtime');
  found.performClick();if(H.fresh191UpdateConnection()===current)throw Error('OFF/ON not saved');
  found.performClick();if(H.fresh191UpdateConnection()!==current)throw Error('second click not saved');
  resolve('PASS real settings toggle visible, saved on click, and restored on second click');
 }catch(error){reject(Error(String(error.stack||error)));}
 finally{if(prefs){const editor=prefs.edit();if(had)editor.putBoolean('fresh191UpdateConnection',old);else editor.remove('fresh191UpdateConnection');editor.commit();}}
})));};
