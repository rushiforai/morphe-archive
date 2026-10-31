rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
 const app=Java.use('android.app.ActivityThread').currentApplication(),Linear=Java.use('android.widget.LinearLayout'),Text=Java.use('android.widget.TextView'),StringClass=Java.use('java.lang.String'),Integer=Java.use('java.lang.Integer'),Buffer=Java.use('android.widget.TextView$BufferType');
 const root=Linear.$new(app),results=Linear.$new(app),title=Text.$new(app),checks=[];root.addView(results);results.addView(title);
 function text(value){title.setText.overload('java.lang.CharSequence','android.widget.TextView$BufferType').call(title,StringClass.$new(value),Buffer.NORMAL.value);}
 const type=Java.use('app.morphe.extension.chmate.ModelUiKt'),method=type.class.getDeclaredMethod('modelFingerprint',Java.array('java.lang.Class',[Java.use('android.view.View').class]));method.setAccessible(true);
 function hash(){return String(method.invoke(null,Java.array('java.lang.Object',[root])));}
 function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 text('first');const before=hash();text('second');check(hash()!==before,'normal text changes still detected');
 results.setTag.overload('int','java.lang.Object').call(results,0x48690c0a,Integer.valueOf(1));const tagged=hash();text('result body changed in synthetic fixture');check(hash()===tagged,'versioned results skip text walk');
 results.setTag.overload('int','java.lang.Object').call(results,0x48690c0a,Integer.valueOf(2));check(hash()!==tagged,'render revision triggers update');const revision=hash();results.addView(Text.$new(app));check(hash()!==revision,'result child count changes detected');
 results.setVisibility(8);const hidden=hash();results.setVisibility(0);check(hash()!==hidden,'result visibility changes detected');resolve({checks});
}catch(e){reject(Error(String(e.stack||e)));}})));}};
