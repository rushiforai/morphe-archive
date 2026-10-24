Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!app.getPackageName().toString().includes('191'))throw Error('191 verification app required');
 const B=Java.use('app.morphe.extension.chmate.BrowsingHistory');
 B.applyLegacy.implementation=function(f,m){console.log('applyLegacy mode='+m+' '+f);return this.applyLegacy(f,m);};
 const F=Java.use('o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk');
 F.a.overload('int','boolean').implementation=function(m,b){console.log('native a mode='+m);return this.a(m,b);};
 function dump(f){
  console.log('HOME '+f);
  const fields=f.getClass().getDeclaredFields();
  for(let i=0;i<fields.length;i++){const q=fields[i];if(q.getType().getName().toString()==='int'){q.setAccessible(true);console.log('int '+q.getName()+'='+q.getInt(f));}}
  try{const e=f.getClass().getDeclaredField('e');e.setAccessible(true);const a=e.get(f);
   console.log('adapter '+a);if(a!==null)for(const k of ['g','i','j']){const q=a.getClass().getDeclaredField(k);q.setAccessible(true);console.log(k+'='+q.get(a));}
  }catch(e){console.log(e);}
 }
 Java.choose('o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk',{onMatch:dump,onComplete:function(){console.log('DONE');}});
});
