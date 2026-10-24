Java.perform(()=>{Java.scheduleOnMainThread(()=>{try{
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!String(app.getPackageName()).endsWith('.settingsfix191'))throw Error('Test package only');
 const C=Java.use('app.morphe.extension.chmate.NativeNgStore'),store=C.$new(app,'NAME');
 function field(n){const f=C.class.getDeclaredField(n);f.setAccessible(true);return f.get(store);}
 const args=Java.array('java.lang.Object',[]),snapshot=Java.cast(field('snapshot'),Java.use('java.lang.reflect.Method'));
 const raw=Java.cast(snapshot.invoke(field('store'),args),Java.use('java.util.ArrayList')),clean=Java.use('java.util.ArrayList').$new();let removed=0;
 for(let i=0;i<raw.size();i++){const item=raw.get(i);if(item===null||String(item).indexOf('__haiagaru_test_')>=0){removed++;continue;}clean.add(item);}
 if(removed>0){Java.cast(field('save'),Java.use('java.lang.reflect.Method')).invoke(field('store'),Java.array('java.lang.Object',[clean]));}
 console.log('PASS removed only null/test items: '+removed+'; preserved original items: '+clean.size());
 }catch(e){console.log('FAIL repair '+e.stack);}});});
