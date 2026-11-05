/* Production ordering against actual native menu classes. No preference mutations. */
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 try{
  const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
  if(!/\.haiagaru\.bindings(191|226|242)$/.test(pkg))throw Error('isolated bindings only');
  const version=pkg.slice(-3),type={'191':'o.m6fExternalSyntheticLambda0','226':'o.getStream','242':'o.TTPlayableLandingPageActivity10'}[version],C=Java.use(type),Menu=Java.use('android.view.Menu');
  let menu;
  for(const ctor of C.$new.overloads){const types=ctor.argumentTypes.map(t=>t.className);if(types.length===1&&types[0]==='android.content.Context'){menu=ctor.call(C,app);break;}if(types.length===2&&types[0]==='android.content.Context'){menu=ctor.call(C,app,null);break;}}
  if(!menu)throw Error('native constructor missing');menu=Java.cast(menu,Menu);
  const S=Java.use('app.morphe.extension.chmate.ResponseMenuSettings'),J=Java.use('org.json.JSONObject'),ids=[50,51,75,0x7e484a01,0x7e484b01,999,998],refs=[];
  for(const id of ids)refs.push(Java.retain(menu.add.overload('int','int','int','java.lang.CharSequence').call(menu,0,id,0,'fixture '+id)));
  const actual=()=>Array.from({length:menu.size()},(_,i)=>menu.getItem(i).getItemId()),check=(ok,label)=>{if(!ok)throw Error(label);checks.push(label);},checks=[];
  const order=[75,0x7e484b01,50,51,0x7e484a01],settings=J.$new(JSON.stringify({buttons:order.map(id=>({id,visible:true}))}));
  S.applySavedOrder(menu,settings);check(JSON.stringify(actual())===JSON.stringify([...order,999,998]),'native reply below added actions without saved shares');
  for(let i=0;i<ids.length;i++)check(Java.use('java.lang.System').identityHashCode(menu.findItem(ids[i]))===Java.use('java.lang.System').identityHashCode(refs[i]),'native item identity '+ids[i]);
  S.applySavedOrder(menu,settings);check(JSON.stringify(actual())===JSON.stringify([...order,999,998]),'repeated finalization stable');
  S.applySavedOrder(menu,J.$new('{}'));check(JSON.stringify(actual())===JSON.stringify([...order,999,998]),'missing settings preserve order');
  resolve({ok:true,version,checks:checks.length,labels:checks});
 }catch(e){reject(Error(String(e.stack||e)));}
})));}};
