rpc.exports.test=()=>new Promise(resolve=>Java.perform(()=>{
 let prefs,oldNumbered,hadNumbered,oldNg,hadNg;
 try{
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!/\.haiagaru\.reporter(?:191|226|242)$/.test(String(app.getPackageName())))throw Error('Isolated reporter only');
 prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);hadNumbered=prefs.contains('countNewArrivalResponseNumbers');oldNumbered=prefs.getBoolean('countNewArrivalResponseNumbers',true);hadNg=prefs.contains('excludeHiddenNgNewArrivals');oldNg=prefs.getBoolean('excludeHiddenNgNewArrivals',false);prefs.edit().putBoolean('countNewArrivalResponseNumbers',true).putBoolean('excludeHiddenNgNewArrivals',false).commit();
 const Row=Java.registerClass({name:'app.haiagaru.test.ArrivalPerf'+Date.now(),fields:{o:'int'},methods:{$init:[{returnType:'void',argumentTypes:['int'],implementation:function(n){this.$super.$init();this.o.value=n;}}]}});
 const List=Java.use('java.util.ArrayList'),N=Java.use('app.morphe.extension.chmate.NewArrivalNumbers'),System=Java.use('java.lang.System'),owner=Java.use('java.lang.Object').$new();
 const before=List.$new();for(let i=1;i<=10000;i++)before.add(Row.$new(i));
 const after=List.$new.overload('java.util.Collection').call(List,before);for(let i=10001;i<=10003;i++)after.add(Row.$new(i));
 const b=N.before.overload('java.lang.Object','java.util.Collection'),a=N.after.overload('java.lang.Object','java.util.Collection'),c=N.count.overload('java.lang.Object','int','int');
 const once=()=>{b.call(N,owner,before);a.call(N,owner,after);let value=c.call(N,owner,10000,10003);if(value!==3)throw Error('incorrect count '+value);};
 for(let i=0;i<5;i++)once();let ms=[];for(let i=0;i<25;i++){let start=Number(System.nanoTime());once();ms.push((Number(System.nanoTime())-start)/1e6);}ms.sort((x,y)=>x-y);
 b.call(N,owner,before);a.call(N,owner,after);const snapshot=Java.cast(N.SNAPSHOTS.value,Java.use('java.util.Map')).get(owner);let retained=-1,fieldName='';for(const name of ['added','current'])try{const f=snapshot.getClass().getDeclaredField(name);f.setAccessible(true);retained=Java.cast(f.get(snapshot),Java.use('java.util.Set')).size();fieldName=name;break;}catch(e){}
 c.call(N,owner,10000,10003);
 resolve({rows:10000,newRows:3,rounds:25,medianMs:ms[12],p90Ms:ms[22],retainedNumbers:retained,snapshotField:fieldName});
 }catch(e){resolve({error:String(e)});}finally{if(prefs){let edit=prefs.edit();if(hadNumbered)edit.putBoolean('countNewArrivalResponseNumbers',oldNumbered);else edit.remove('countNewArrivalResponseNumbers');if(hadNg)edit.putBoolean('excludeHiddenNgNewArrivals',oldNg);else edit.remove('excludeHiddenNgNewArrivals');edit.commit();}}
}));
