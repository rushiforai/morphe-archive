/* Exercise the real injected wrapper's exception handler, without entering native I/O. */
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());if(!/\.haiagaru\.bindings(191|226|242)$/.test(pkg))throw Error('isolated bindings only');
 const v=pkg.slice(-3),C=Java.use(v==='191'?'o.getLabel':v==='226'?'o.OpenJSSEPlatformCompanion':'o.getHostAppName'),N=Java.use('app.morphe.extension.chmate.ThreadWatchNative'),U=Java.use('sun.misc.Unsafe'),f=U.class.getDeclaredField('theUnsafe');f.setAccessible(true);const unsafe=Java.cast(f.get(null),U),receiver=unsafe.allocateInstance(C.class),clone=Array.from(C.class.getDeclaredMethods()).find(m=>String(m.getName())==='haiagaruNativeReplyDownload');
 const name=v==='191'?'b':v==='226'?'d':'e',method=C.class.getDeclaredMethod(name,clone.getParameterTypes());method.setAccessible(true);let entered=0,threw=false,errorText="";
 C.haiagaruNativeReplyDownload.implementation=function(){entered++;throw Java.use('java.io.IOException').$new('controlled before native I/O');};
 try{
  const values=v==='226'?[Java.array('java.lang.Object',[receiver,null,Java.use('java.lang.Boolean').FALSE.value,null])]:Array.from(clone.getParameterTypes()).map(t=>String(t.getName())==='boolean'?Java.use('java.lang.Boolean').FALSE.value:null);
  try{if(v==='226')C.d.overload('[Ljava.lang.Object;').call(C,Java.array('java.lang.Object',[receiver,null,Java.use('java.lang.Boolean').FALSE.value,null]));else method.invoke(receiver,Java.array('java.lang.Object',values));}catch(e){threw=true;errorText=String(e);}
  if(!threw||entered!==1)throw Error('controlled native exception missing: '+entered+' '+errorText);
  const current=N.class.getDeclaredField('CURRENT');current.setAccessible(true);const local=Java.cast(current.get(null),Java.use('java.lang.ThreadLocal')),stack=Java.cast(local.get(),Java.use('java.util.ArrayDeque'));if(stack.size()!==0)throw Error('native notification scope leaked after exception');local.remove();
  resolve({ok:true,version:v,controlledNativeThrows:entered,scopeAfterException:0,realNetworkRequests:0});
 }catch(e){reject(Error(String(e.stack||e)));}finally{C.haiagaruNativeReplyDownload.implementation=null;}
}));}};
