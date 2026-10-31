// In-memory synthetic models only; no native NG save or network request.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),saved={has:prefs.contains('urlGifFetchMode'),mode:prefs.getInt('urlGifFetchMode',2)};
 const G=Java.use('app.morphe.extension.chmate.GifAutoFetch'),F=Java.use('app.morphe.extension.chmate.NativeFields'),Map=Java.use('java.util.Map'),Set=Java.use('java.util.Set');let models,posters,posterUrls,a,b,sentinel;const checks=[];
 const url='https://audit.example/optimization-a.gif',other='https://audit.example/optimization-b.gif',poster='http://127.0.0.1/audit-a.jpg',posterB='http://127.0.0.1/audit-b.jpg';
 function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 function staticValue(type,key){const field=type.class.getDeclaredField(key);field.setAccessible(true);return field.get(null);}
 function objectField(o,key){return F.find(o.getClass(),key);}
 function restore(){const e=prefs.edit();if(saved.has)e.putInt('urlGifFetchMode',saved.mode);else e.remove('urlGifFetchMode');e.commit();if(models){if(a)models.remove(a);if(b)models.remove(b);}if(posters){posters.remove(Java.use('java.lang.String').$new(url));posters.remove(Java.use('java.lang.String').$new(other));}if(posterUrls){posterUrls.remove(Java.use('java.lang.String').$new(poster));posterUrls.remove(Java.use('java.lang.String').$new(posterB));}}
 function finish(error){try{restore();if(error)reject(Error(String(error.stack||error)));else resolve({checks,networkRequests:false,nativeNgWrites:false});}catch(e){reject(Error('Restore: '+e));}}
 try{
  prefs.edit().putInt('urlGifFetchMode',0).commit();models=Java.cast(staticValue(G,'MODELS'),Map);posters=Java.cast(staticValue(G,'POSTERS'),Map);posterUrls=Java.cast(staticValue(G,'POSTER_URLS'),Set);
  posters.put(Java.use('java.lang.String').$new(url),Java.use('java.lang.String').$new(poster));posters.put(Java.use('java.lang.String').$new(other),Java.use('java.lang.String').$new(posterB));posterUrls.add(Java.use('java.lang.String').$new(poster));posterUrls.add(Java.use('java.lang.String').$new(posterB));
  const version=String(app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName.value),model=version.includes('191')?'o.processAdDisplayErrorPostbackForUserError':version.includes('226')?'o.BouncyCastleSocketAdapterCompanion':'o.KeJ11';
  const U=Java.use('sun.misc.Unsafe'),uf=U.class.getDeclaredField('theUnsafe');uf.setAccessible(true);const unsafe=Java.cast(uf.get(null),U);a=unsafe.allocateInstance(Java.use(model).class);b=unsafe.allocateInstance(Java.use(model).class);const number=version.includes('226')?'l':'o';F.find(a.getClass(),number).setInt(a,10001);F.find(b.getClass(),number).setInt(b,10002);
  const array=Java.array('java.lang.String',[url]),arrayB=Java.array('java.lang.String',[other]);
  check(G.project(a,url,array).length===2,'GIF projects poster plus original');G.project(b,other,arrayB);
  sentinel=Java.use('java.lang.reflect.Array').newInstance(Java.use('java.lang.CharSequence').class,1);Java.use('java.lang.reflect.Array').set(sentinel,0,Java.use('java.lang.String').$new('sentinel'));
  const fields=F.all(a.getClass());let fieldName;
  for(let i=0;i<fields.size();i++){const f=Java.cast(fields.get(i),Java.use('java.lang.reflect.Field'));if(String(f.getType().getName())==='[Ljava.lang.CharSequence;'&&!Java.use('java.lang.reflect.Modifier').isStatic(f.getModifiers())){fieldName=String(f.getName());F.find(a.getClass(),fieldName).set(a,sentinel);F.find(b.getClass(),fieldName).set(b,sentinel);}}
  check(fieldName!==undefined,'native text caches located');
  G.queueChange(url);G.queueChange(url);G.flushChanges();
  check(objectField(a,fieldName).get(a)===null,'completed GIF clears matching model');check(objectField(b,fieldName).get(b)!==null,'unrelated GIF model keeps native cache');
  prefs.edit().putInt('urlGifFetchMode',2).commit();const projected=G.project(a,url,Java.array('java.lang.String',[poster,url]));check(projected.length===1&&String(projected[0])===url,'turning poster OFF strips generated poster');
  const Gate=Java.use('app.morphe.extension.chmate.MediaAttemptGate'),gate=Gate.$new(128,60000);let accepted=0;for(let i=0;i<128;i++){if(gate.begin('f'+i,0))accepted++;gate.finish('f'+i,false,1);}check(accepted===128,'accept bounded failure history');check(!gate.begin('next',60000),'cooldown retained');check(gate.begin('next',60001),'expired full history admits new GIF');
  // Prevent the queued delayed callback retaining synthetic cache invalidation until after restore.
  G.flushChanges();finish();
 }catch(e){finish(e);}
})));}};
