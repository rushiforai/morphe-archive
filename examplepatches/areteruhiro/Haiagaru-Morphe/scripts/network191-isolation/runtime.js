rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{try{
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!String(app.getPackageName()).endsWith('settingsfix191'))throw Error('191 verification required');
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),P=Java.use('app.morphe.extension.chmate.NativeUpdatePolicy'),Call=Java.use('o.putFloat'),B=Java.use('o.r8lambda17vlhACr7B0IDgCdn1Q67LKhir8$setContentView'),client=Java.use('o.getCredentials').d();H.shouldHideAds(app);
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),keys=['fresh191UpdateConnection','update191TimeoutSeconds'],old=prefs.getAll();let checks=0;
 function check(ok,m){if(!ok)throw Error(m);checks++;}
 function field(o,k){const f=o.getClass().getDeclaredField(k);f.setAccessible(true);return f.get(o);}
 function make(path,method){const b=B.$new();b.b.overload('java.lang.String').call(b,'https://fixture.example.org'+path);const r=b.c.overload().call(b);if(method){const f=r.getClass().getDeclaredField('c');f.setAccessible(true);f.set(r,Java.use('java.lang.String').$new(method));}const c=Call.$new(client,r,false);P.configure191(c);return c;}
 try{
  prefs.edit().remove(keys[0]).remove(keys[1]).commit();check(H.fresh191UpdateConnection()&&H.update191TimeoutSeconds()===60,'new defaults avoid reuse and bound request');
  const global=field(field(client,'h'),'b'),one=make('/board/subject.txt'),two=make('/board/dat/1234567890.dat');
  check(!global.equals(field(one,'c'))&&!field(one,'c').equals(field(two,'c')),'each scoped Call owns a new pool');
  check(field(one,'a').equals(client)&&field(field(client,'h'),'b').equals(global),'shared client and global pool unchanged');
  check(Java.cast(field(field(one,'c'),'a'),Java.use('java.lang.Integer')).intValue()===0,'scoped pool has zero idle retention');
  check(Number(Java.cast(field(one,'l'),Java.use('o.StringUtils')).B_())===60000000000,'default native overall timeout is 60 seconds');
  check(global.equals(field(make('/image.jpg'),'c')),'image pool untouched');
  check(global.equals(field(make('/board/subject.txt','POST'),'c')),'posting pool untouched');
  prefs.edit().putBoolean(keys[0],false).putInt(keys[1],0).commit();const off=make('/board/subject.txt');
  check(global.equals(field(off,'c'))&&Number(Java.cast(field(off,'l'),Java.use('o.StringUtils')).B_())===0,'explicit OFF and unlimited settings preserved');
  resolve({checks});
 }finally{const e=prefs.edit();for(const k of keys){if(!old.containsKey(k))e.remove(k);else if(k===keys[0])e.putBoolean(k,Java.cast(old.get(k),Java.use('java.lang.Boolean')).booleanValue());else e.putInt(k,Java.cast(old.get(k),Java.use('java.lang.Integer')).intValue());}e.commit();}
 }catch(e){reject(Error(String(e.stack||e)));}}));}};
