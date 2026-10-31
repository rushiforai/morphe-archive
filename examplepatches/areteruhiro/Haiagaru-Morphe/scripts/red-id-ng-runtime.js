// Thread-local overlay integration, with native models. Never writes native NG storage.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),Auto=Java.use('app.morphe.extension.chmate.RedIdAutoNg');
 const old={on:p.getBoolean('autoNgRedIds',false),hasOn:p.contains('autoNgRedIds'),ex:String(p.getString('autoNgRedIdExclusions','')),hasEx:p.contains('autoNgRedIdExclusions')};
 const version=String(app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName.value),cfg=version.includes('191')?['o.processAdDisplayErrorPostbackForUserError','h','g','e','o']:version.includes('226')?['o.BouncyCastleSocketAdapterCompanion','j','h','e','l']:['o.KeJ11','g','m','b','o'];
 const Store=Java.use('app.morphe.extension.chmate.NativeNgStore'),Entry=Java.use('app.morphe.extension.chmate.NativeNgStore$Entry'),store=Store.$new(app,'ID');let before,checks=[],result,error;
 function signature(){const entries=store.entries(),out=[];for(let i=0;i<entries.size();i++){const x=Java.cast(entries.get(i),Entry);out.push(String(x.pattern.value)+'|'+String(x.board.value)+'|'+x.flags.value+'|'+x.timestamp.value);}return JSON.stringify(out);}
 function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 function field(o,k){const f=o.getClass().getDeclaredField(k);f.setAccessible(true);return f;}
 try{
  before=signature();const Unsafe=Java.use('sun.misc.Unsafe'),uf=Unsafe.class.getDeclaredField('theUnsafe');uf.setAccessible(true);const unsafe=Java.cast(uf.get(null),Unsafe),row=unsafe.allocateInstance(Java.use(cfg[0]).class),group=unsafe.allocateInstance(field(row,cfg[2]).getType());
  field(row,cfg[2]).set(row,group);field(row,cfg[1]).set(row,Java.use('java.lang.String').$new('AuditId0'));field(row,cfg[4]).setInt(row,42);field(group,cfg[3]).setShort(group,8);
  p.edit().putBoolean('autoNgRedIds',false).putString('autoNgRedIdExclusions','').commit();check(Auto.merge(row,512)===512,'OFF preserves original flags');
  p.edit().putBoolean('autoNgRedIds',true).commit();field(group,cfg[3]).setShort(group,7);check(Auto.merge(row,512)===512,'below native frequent-ID level stays visible');
  field(group,cfg[3]).setShort(group,8);check(Auto.merge(row,512)===(512|0x1008),'native red level adds transparent NG overlay');
  p.edit().putString('autoNgRedIdExclusions','ID:AuditId0').commit();check(Auto.merge(row,512)===512,'excluded ID stays visible');
  p.edit().putString('autoNgRedIdExclusions','AuditId').commit();check(Auto.merge(row,512)===(512|0x1008),'exclusions require complete ID');
  p.edit().putString('autoNgRedIdExclusions','').commit();field(group,cfg[3]).setShort(group,1);check(Auto.merge(row,512)===512,'same ID in a low-count thread stays visible');
  field(group,cfg[3]).setShort(group,8);check(Auto.merge(row,512)===(512|0x1008),'reopening frequent-ID thread reapplies overlay');
  if(version.includes('242')){const rows=Java.use('java.util.ArrayList').$new(),original=Java.use('java.util.LinkedHashMap').$new(),Integer=Java.use('java.lang.Integer');rows.add(row);original.put(Integer.valueOf(42),Integer.valueOf(512));const map=Auto.modernFlags(rows,original);check(Java.cast(map.get(Integer.valueOf(42)),Integer).intValue()===(512|0x1008),'242 flag map applies visibility');check(Java.cast(original.get(Integer.valueOf(42)),Integer).intValue()===512,'242 native source map untouched');p.edit().putBoolean('autoNgRedIds',false).commit();const off=Auto.modernFlags(rows,original);check(Java.cast(off.get(Integer.valueOf(42)),Integer).intValue()===512,'242 OFF returns native visibility');}
  check(signature()===before,'native NGID snapshot unchanged');result={version,checks,nativeNgWrites:false};
 }catch(e){error=Error(String(e.stack||e));}finally{const edit=p.edit();if(old.hasOn)edit.putBoolean('autoNgRedIds',old.on);else edit.remove('autoNgRedIds');if(old.hasEx)edit.putString('autoNgRedIdExclusions',old.ex);else edit.remove('autoNgRedIdExclusions');edit.commit();}
 if(error)reject(error);else resolve(result);
})));}};
