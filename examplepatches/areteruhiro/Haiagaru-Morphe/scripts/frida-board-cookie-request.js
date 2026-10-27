rpc.exports.run=function(){return new Promise((resolve,reject)=>Java.perform(()=>{
 try{
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 const profile=pkg.endsWith('settingsfix191')?{form:'o.oExternalSyntheticLambda1',bytes:'o.r8lambdaGZC8a_4Sth8OENyznWf4FMVcU0$RemoteActionCompatParcelizer$IconCompatParcelizer'}:pkg.endsWith('resumefix226')?{form:'o.zzfv',bytes:'o.zzdB$ComponentActivity$write'}:pkg.endsWith('resumefix242')?{form:'o.zzcvg',bytes:'o.zzcvw$IconCompatParcelizer$RemoteActionCompatParcelizer'}:null;
 if(!profile)throw Error('Verification package only');Java.classFactory.loader=app.getClassLoader();
 const loader=Java.use('dalvik.system.DexClassLoader').$new('/data/local/tmp/haiagaru-cookie-request.dex',String(app.getCodeCacheDir().getAbsolutePath()),null,app.getClassLoader().getParent());
 const B=Java.ClassFactory.get(loader).use('app.morphe.extension.chmate.BoardCookieRequest'),list=Java.use('java.util.ArrayList'),J=Java.use('java.lang.String'),checks=[];
 function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 function values(items){const result=list.$new();items.forEach(x=>result.add(J.$new(x)));return result;}
 const form=Java.use(profile.form),names=values(['bbs','MESSAGE']);
 for(const board of ['android','liveedge']){const body=form.$new(names,values([board,'bbs']));check(String(B.formBoard(body))===board,'native '+board+' form, MESSAGE=bbs');}
 check(B.formBoard(form.$new(values(['bbs','board']),values(['android','liveedge'])))===null,'conflicting native board fields use fallback');
 const old191=pkg.endsWith('settingsfix191'),Body=Java.use(profile.bytes),payload=J.$new(old191?'bbs=android':'bbs=wrong&bbs=android&board=wrong').getBytes('ISO-8859-1');
 const ctor=Array.from(Body.class.getDeclaredConstructors()).find(c=>c.getParameterTypes().length===4);ctor.setAccessible(true);
 const body=ctor.newInstance(Java.array('java.lang.Object',[null,Java.use('java.lang.Integer').valueOf(11),payload,Java.use('java.lang.Integer').valueOf(old191?0:10)]));
 check(String(B.formBoard(body))==='android','native byte-array uses sent slice only');
 check(B.formBoard(null)===null,'missing body falls back without error');
 const Native=Java.use('app.morphe.extension.chmate.BoardCookies'),prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
 const flag='boardCookiesEnabled',had=prefs.contains(flag),old=prefs.getBoolean(flag,false);
 const unsafeClass=Java.use('sun.misc.Unsafe');let unsafe;
 for(const f of unsafeClass.class.getDeclaredFields())if(Java.use('java.lang.reflect.Modifier').isStatic(f.getModifiers())&&f.getType().equals(unsafeClass.class)){f.setAccessible(true);unsafe=Java.cast(f.get(null),unsafeClass);break;}
 if(!unsafe)throw Error('Offline request allocator unavailable');
 const requestType=pkg.endsWith('settingsfix191')?'o.r8lambda17vlhACr7B0IDgCdn1Q67LKhir8':pkg.endsWith('resumefix226')?'o.zzdA':'o.zzcvq';
 const bodyField=pkg.endsWith('settingsfix191')?'e':pkg.endsWith('resumefix226')?'b':'d',urlField=pkg.endsWith('resumefix226')?'h':'f';
 const request=unsafe.allocateInstance(Java.use(requestType).class),Auth=Java.use('app.morphe.extension.chmate.ExternalBoardAuth');
 function set(name,value){const f=request.getClass().getDeclaredField(name);f.setAccessible(true);f.set(request,value);}
 const threadField=Native.class.getDeclaredField('CURRENT');threadField.setAccessible(true);const local=Java.cast(threadField.get(null),Java.use('java.lang.ThreadLocal')),before=local.get();
 const shared=values(['legacy-cookie-fixture']);let wanted=null;
 try{
  Native.initialize(app);prefs.edit().putBoolean(flag,true).commit();set(urlField,Auth.parseUrl('https://egg.5ch.io/test/bbs.cgi'));
  Native.requestFromChain.implementation=function(){return Java.retain(request);};
  Native.nativeIntercept.implementation=function(){
   check(Native.active()===(wanted!==null),'native delegate scope: '+wanted);
   if(wanted===null){check(Native.load(shared,Auth.parseUrl('https://egg.5ch.io/test/bbs.cgi')).equals(shared),'unknown target keeps original cookie list');check(!Native.save(null,shared),'unknown target keeps native cookie save');}
   else{const scope=local.get(),f=scope.getClass().getDeclaredField('board');f.setAccessible(true);check(String(f.get(scope))===wanted,'correct outgoing board scope');}
   return null;
  };
  wanted='https://egg.5ch.io/android/';set(bodyField,form.$new(names,values(['android','bbs'])));Native.intercept(null,null);check(local.get()===before,'known target restores prior scope');
  wanted=null;set(bodyField,null);Native.intercept(null,null);check(local.get()===before,'unknown target restores prior scope');
  // A nested request must not inherit another board's active cookie partition.
  const Scope=Java.use('app.morphe.extension.chmate.BoardCookies$Scope'),outer=Scope.$new('https://bbs.eddibb.cc/liveedge/');local.set(outer);Native.intercept(null,null);check(local.get().equals(outer),'fallback restores outer edge scope');
  prefs.edit().putBoolean(flag,false).commit();Native.intercept(null,null);check(local.get().equals(outer),'OFF restores caller scope');
 }finally{
  Native.requestFromChain.implementation=null;Native.nativeIntercept.implementation=null;
  if(before===null)local.remove();else local.set(before);const edit=prefs.edit();if(had)edit.putBoolean(flag,old);else edit.remove(flag);edit.commit();
 }
 resolve({package:pkg,checks:checks.length,passed:checks});
 }catch(e){reject(Error(String(e.stack||e)));}
}));};
