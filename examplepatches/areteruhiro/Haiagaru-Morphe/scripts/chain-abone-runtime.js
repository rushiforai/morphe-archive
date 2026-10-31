// Clone native engines and use synthetic responses; never save NGs or replace the live DAT.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 const P='app.morphe.extension.chmate.',app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg)){reject(Error('verification app required'));return;}
 const old=pkg.endsWith('191'),mid=pkg.endsWith('226'),pref=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='hideChainedAbone',had=pref.contains(key),value=pref.getBoolean(key,false);
 const cfg=old?{owner:'o.m9ExternalSyntheticLambda1',row:'o.processAdDisplayErrorPostbackForUserError',source:'K',map:'N',cache:'am',enabled:'p',name:'n',normalized:'k',id:'h',body:'c',no:'o',anchors:'d',matcher:'ae',match:'a',chain:'b',method:'SE_',show:'A'}:
 mid?{owner:'o.listener',row:'o.BouncyCastleSocketAdapterCompanion',source:'J',map:'K',cache:'z',enabled:'r',name:'m',normalized:'n',id:'j',body:'d',no:'l',anchors:'a',matcher:'ae',match:'d',chain:'e',method:'d'}:
 {owner:'o.zzaW',row:'o.KeJ11',source:'a',map:'j',cache:'f',enabled:'i',name:'n',normalized:'a',id:'g',body:'h',no:'o',anchors:'b',matcher:'d',match:'c',chain:'e',method:'c'};
 function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f;}
 function get(o,n){return field(o,n).get(o);}
 function set(o,n,v){field(o,n).set(o,v);}
 let checks=0;function check(ok,text){if(!ok)throw Error(text);checks++;}
 try{
  let live;Java.choose(cfg.owner,{onMatch(o){if(!live)live=Java.retain(o);},onComplete(){}});if(!live)throw Error('native engine unavailable');
  const Unsafe=Java.use('sun.misc.Unsafe'),uf=Unsafe.class.getDeclaredField('theUnsafe');uf.setAccessible(true);const unsafe=Java.cast(uf.get(null),Unsafe),owner=unsafe.allocateInstance(live.getClass());
  for(const f of live.getClass().getDeclaredFields())if((f.getModifiers()&8)===0){f.setAccessible(true);f.set(owner,f.get(live));}
  const sourceType=field(live,cfg.source).getType(),source=sourceType.getDeclaredConstructor(Java.array('java.lang.Class',[])).newInstance(Java.array('java.lang.Object',[]));set(owner,cfg.source,source);
  const list=Java.cast(source,Java.use('java.util.List')),rows=[];
  for(let n=1;n<=5;n++){const r=unsafe.allocateInstance(Java.use(cfg.row).class);field(r,cfg.no).setInt(r,n);for(const k of [cfg.name,cfg.normalized])set(r,k,Java.use('java.lang.String').$new(n===1?'CHAIN_ROOT':'CHAIN_CHILD_'+n));set(r,cfg.id,Java.use('java.lang.String').$new('ChainAuditID'+n));set(r,cfg.body,Java.use('java.lang.String').$new('neutral fixture'));set(r,cfg.anchors,Java.array('int',n===2?[1]:n===3?[2]:[]));list.add(r);rows.push(r);}
  const matcherType=field(owner,cfg.matcher).getType(),Handler=Java.registerClass({name:'app.morphe.test.ChainHandler'+Date.now(),implements:[Java.use('java.lang.reflect.InvocationHandler')],methods:{invoke(receiver,method,args){const name=String(method.getName()),ret=String(method.getReturnType().getName());if(ret==='boolean'){const match=args&&args.length===1&&String(args[0])==='CHAIN_ROOT'&&(name===cfg.match||name===cfg.chain);return Java.use('java.lang.Boolean').valueOf(match);}if(ret==='int')return Java.use('java.lang.Integer').valueOf(0);return null;}}});
  const matcher=Java.use('java.lang.reflect.Proxy').newProxyInstance(matcherType.getClassLoader(),Java.array('java.lang.Class',[matcherType]),Handler.$new());set(owner,cfg.matcher,matcher);
  function freshMap(name){const type=field(owner,name).getType(),ctor=type.getDeclaredConstructor(Java.array('java.lang.Class',[]));ctor.setAccessible(true);const map=ctor.newInstance(Java.array('java.lang.Object',[]));set(owner,name,map);return map;}
  function number(map,n){return old?Java.cast(map,Java.use('android.util.SparseIntArray')).get(n,0):Java.cast(map,Java.use('java.util.Map')).containsKey(Java.use('java.lang.Integer').valueOf(n))?Java.cast(Java.cast(map,Java.use('java.util.Map')).get(Java.use('java.lang.Integer').valueOf(n)),Java.use('java.lang.Integer')).intValue():0;}
  field(owner,cfg.enabled).setBoolean(owner,true);const C=Java.use(P+'ChainAboneVisibility');
  let map=freshMap(cfg.map);freshMap(cfg.cache);pref.edit().putBoolean(key,false).commit();C.apply(owner);check(number(map,2)===0,'default/off preserves chain row');
  pref.edit().putBoolean(key,true).commit();C.apply(owner);check(number(map,1)===0,'direct NGName root preserved');check(number(map,2)===4096,'native child chain hidden');check(number(map,3)===4096,'native grandchild chain hidden');check(number(map,4)===0&&number(map,5)===0,'unrelated rows preserved');C.apply(owner);check(number(map,2)===4096,'repeat projection idempotent');
  if(old||mid){
   field(owner,old?'ar':'I').setBoolean(owner,false);
   function visible(show){field(owner,old?'A':'j').setBoolean(owner,show);const result=Java.use('java.util.ArrayList').$new(),nativeOwner=Java.cast(owner,Java.use(cfg.owner));
    nativeOwner[old?'a':'c'].overload('[L'+cfg.row+';','int','int','java.util.ArrayList').call(nativeOwner,Java.array(cfg.row,rows),0,4,result);
    const ids=[];for(const row of result.toArray()){const r=Java.use(P+'ExtraQuickFilters').rowResponse(row);if(r)ids.push(Java.use(P+'ExtraQuickFilters').number(r));}return ids;
   }
   const hidden=visible(false),shown=visible(true);check(!hidden.includes(2)&&!hidden.includes(3)&&hidden.includes(1),'native row builder removes child headers and space');check(shown.includes(1)&&shown.includes(2)&&shown.includes(3),'native Show hidden NG restores chain rows');
  }
  pref.edit().putBoolean(key,false).commit();map=freshMap(cfg.map);freshMap(cfg.cache);C.apply(owner);check(number(map,2)===0,'off after native rebuild restores row');
  pref.edit().putBoolean(key,true).commit();field(owner,cfg.enabled).setBoolean(owner,false);C.apply(owner);check(number(map,2)===0,'native NG disabled remains visible');
  check(list.size()===5&&String(get(rows[1],cfg.body))==='neutral fixture','source and body preserved');
  pref.edit().remove(key).commit();const H=Java.use(P+'Haiagaru');check(!H.hideChainedAbone(),'unset defaults OFF');
  const panel=H.settingsNG(H.toolbarActivity(null));let toggle;for(let i=0;i<panel.getChildCount();i++){const v=panel.getChildAt(i);if(Java.use('android.widget.Switch').class.isInstance(v)&&String(Java.cast(v,Java.use('android.widget.Switch')).getText())==='連鎖あぼーんを常に非表示')toggle=Java.cast(v,Java.use('android.widget.Switch'));}
  check(!!toggle&&!toggle.isChecked(),'NG settings switch initially OFF');toggle.setChecked(true);check(H.hideChainedAbone(),'settings switch persists ON');toggle.setChecked(false);check(!H.hideChainedAbone(),'settings switch persists OFF');
  resolve({version:old?'191':mid?'226':'242',checks,nativeChainOnly:true,savedNgUntouched:true});
 }catch(e){console.log('CHAIN_TEST_ERROR '+String(e.stack||e));reject(Error(String(e.stack||e)));}finally{const e=pref.edit();if(had)e.putBoolean(key,value);else e.remove(key);e.commit();}
})));}};
