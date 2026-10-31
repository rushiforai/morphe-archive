// Isolated native-engine clone. Never writes normal NGs, contacts GAS or changes DAT.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 const P='app.morphe.extension.chmate.',app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg)){reject(Error('verification package required'));return;}
 const old=pkg.endsWith('191'),mid=pkg.endsWith('226'),cfg=old?{owner:'o.m9ExternalSyntheticLambda1',row:'o.processAdDisplayErrorPostbackForUserError',source:'K',map:'N',enabled:'p',name:'n',date:'q',id:'h',no:'o'}:mid?{owner:'o.listener',row:'o.BouncyCastleSocketAdapterCompanion',source:'J',map:'K',enabled:'r',name:'m',date:'t',id:'j',no:'l'}:{owner:'o.zzaW',row:'o.KeJ11',source:'a',map:'j',enabled:'i',name:'n',date:'p',id:'g',no:'o'};
 const pref=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),keys=['edgeLevelObservedNg','edgeLevelThreshold','edgeLevelExceptions'],before={};for(const key of keys)before[key]={had:pref.contains(key),value:pref.getAll().get(key)};
 const C=Java.use(P+'EdgeLevelNg');function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f;}function get(o,n){return field(o,n).get(o);}function set(o,n,v){field(o,n).set(o,v);}
 let checks=0;function check(v,s){if(!v)throw Error(s);checks++;}
 let live;Java.choose(cfg.owner,{onMatch(o){if(!live)live=Java.retain(o);},onComplete(){}});
 const next=C.class.getDeclaredField('nextSync');next.setAccessible(true);const priorNext=next.getLong(null);next.setLong(null,Java.use('java.lang.Long').MAX_VALUE.value);
 try{
 const U=Java.use('sun.misc.Unsafe'),uf=U.class.getDeclaredField('theUnsafe');uf.setAccessible(true);const unsafe=Java.cast(uf.get(null),U),owner=unsafe.allocateInstance(live?live.getClass():Java.use(cfg.owner).class);if(live)for(const f of live.getClass().getDeclaredFields())if((f.getModifiers()&8)===0){f.setAccessible(true);f.set(owner,f.get(live));}
 const type=field(owner,cfg.source).getType(),ctor=type.getDeclaredConstructor(Java.array('java.lang.Class',[]));ctor.setAccessible(true);const source=ctor.newInstance(Java.array('java.lang.Object',[]));set(owner,cfg.source,source);const list=Java.cast(source,Java.use('java.util.List')),rows=[];
 const names=['</b>(L2 abcd-1234)<b>','</b>(L3 abcd-1234)<b>','名無し','</b>(L8 abcd-1234)<b>','名無し'];
 for(let i=0;i<5;i++){const r=unsafe.allocateInstance(Java.use(cfg.row).class);field(r,cfg.no).setInt(r,i+1);set(r,cfg.name,Java.use('java.lang.String').$new(names[i]));set(r,cfg.id,Java.use('java.lang.String').$new(i<3?'LowAudit1':i===3?'HighAudit':'UnknownId'));set(r,cfg.date,Java.use('java.lang.String').$new('2026/11/01(日) 00:00:0'+(i+1)+'.000'));list.add(r);rows.push(r);}
 const originsField=C.class.getDeclaredField('ORIGINS');originsField.setAccessible(true);const origins=Java.cast(originsField.get(null),Java.use('java.util.Map'));origins.put(rows[0],Java.use('java.lang.String').$new('https://bbs.eddibb.cc/test/read.cgi/liveedge/1793457978/'));
 function fresh(){const t=field(owner,cfg.map).getType(),c=t.getDeclaredConstructor(Java.array('java.lang.Class',[]));c.setAccessible(true);const map=c.newInstance(Java.array('java.lang.Object',[]));set(owner,cfg.map,map);return map;}
 function number(map,n){if(old)return Java.cast(map,Java.use('android.util.SparseIntArray')).get(n,0);const m=Java.cast(map,Java.use('java.util.Map')),v=m.get(Java.use('java.lang.Integer').valueOf(n));return v?Java.cast(v,Java.use('java.lang.Integer')).intValue():0;}
 field(owner,cfg.enabled).setBoolean(owner,true);pref.edit().putBoolean(keys[0],false).remove(keys[2]).commit();let map=fresh();C.apply(owner);check(number(map,1)===0,'default/off no flags');
 pref.edit().putBoolean(keys[0],true).putInt(keys[1],5).commit();C.apply(owner);check(number(map,1)===4104&&number(map,2)===4104&&number(map,3)===4104,'all same-day responses of observed low ID hidden');check(number(map,4)===0,'high level preserved');check(number(map,5)===0,'unknown ID preserved');
 pref.edit().putInt(keys[1],2).commit();map=fresh();C.apply(owner);check(number(map,1)===0,'newest level overrides older low level');
 pref.edit().putInt(keys[1],5).commit();set(rows[2],cfg.date,Java.use('java.lang.String').$new('2026/10/31(土) 00:00:03.000'));map=fresh();C.apply(owner);check(number(map,3)===0,'ID day isolation');
 const excluded=Java.use('java.util.HashSet').$new();excluded.add(Java.use('java.lang.String').$new('LowAudit1'));pref.edit().putStringSet(keys[2],excluded).commit();map=fresh();C.apply(owner);check(number(map,1)===0,'exclusion wins');
 pref.edit().remove(keys[2]).commit();field(owner,cfg.enabled).setBoolean(owner,false);map=fresh();C.apply(owner);check(number(map,1)===0,'native NG disabled respected');
 field(owner,cfg.enabled).setBoolean(owner,true);pref.edit().putBoolean(keys[0],false).commit();map=fresh();C.apply(owner);check(number(map,1)===0,'OFF and rebuild restores');
 check(list.size()===5&&String(get(rows[0],cfg.name))===names[0],'DAT/name unmodified');
 const activity=Java.use(P+'Haiagaru').toolbarActivity(null);Java.use(P+'EdgeLevelSettings').show(activity);check(true,'settings dialog created');
 resolve({version:old?'191':mid?'226':'242',checks,savedNgUntouched:true,networkDisabled:true});
 }catch(e){console.log('EDGE_TEST_ERROR '+String(e.stack||e));reject(Error(String(e.stack||e)));}finally{next.setLong(null,priorNext);const edit=pref.edit();for(const k of keys){if(!before[k].had){edit.remove(k);continue;}const v=before[k].value;if(k===keys[1])edit.putInt(k,Java.cast(v,Java.use('java.lang.Integer')).intValue());else if(k===keys[2])edit.putStringSet(k,Java.cast(v,Java.use('java.util.Set')));else edit.putBoolean(k,Java.cast(v,Java.use('java.lang.Boolean')).booleanValue());}edit.commit();}
})));}};
