rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 let activity;
 Java.scheduleOnMainThread(()=>{try{const records=Java.cast(Java.use('android.app.ActivityThread').currentActivityThread().mActivities.value,Java.use('java.util.Map')).values().toArray();for(const record of records){const f=record.getClass().getDeclaredField('activity');f.setAccessible(true);const a=Java.cast(f.get(record),Java.use('android.app.Activity'));if(!a.isFinishing()&&!a.isDestroyed()&&(!activity||a.hasWindowFocus()))activity=Java.retain(a);}if(!activity){reject(Error('Visible Activity required'));return;}run();}catch(e){reject(Error(String(e.stack||e)));}});
 function run(){let dialog,view,root;const checks=[];
  function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
  function set(o,k,v){const f=o.getClass().getDeclaredField(k);f.setAccessible(true);f.set(o,v);}
  function string(value){return typeof value==='string'?value:String(Java.cast(value,Java.use('java.lang.Object')).toString());}
  try{
   const Unsafe=Java.use('sun.misc.Unsafe'),u=Unsafe.class.getDeclaredField('theUnsafe');u.setAccessible(true);const unsafe=Java.cast(u.get(null),Unsafe);
   const Ui=Java.use('app.morphe.extension.chmate.EddiArchiveSearchUi'),ui=unsafe.allocateInstance(Ui.class);
   set(ui,'activity',activity);set(ui,'controlTextSizes',Java.use('java.util.HashMap').$new());
   const field=Java.use('android.widget.EditText').$new(activity),method=Ui.class.getDeclaredMethod('dateControl',Java.array('java.lang.Class',[Java.use('android.widget.EditText').class,Java.use('java.lang.String').class]));method.setAccessible(true);
   const row=Java.cast(method.invoke(ui,Java.array('java.lang.Object',[field,Java.use('java.lang.String').$new('開始日')])),Java.use('android.widget.LinearLayout'));
   const choose=Java.cast(row.getChildAt(0),Java.use('android.widget.Button')),clear=Java.cast(row.getChildAt(1),Java.use('android.widget.Button'));
   check(string(choose.getText()).includes('未指定')&&!clear.isEnabled(),'empty date shown as unset');
   field.setText.overload('java.lang.CharSequence','android.widget.TextView$BufferType').call(field,Java.use('java.lang.String').$new('2026-10-29'),Java.use('android.widget.TextView$BufferType').EDITABLE.value);
   check(string(choose.getText()).includes('2026-10-29')&&clear.isEnabled(),'restored date updates calendar button');
   clear.performClick();check(string(field.getText())===''&&!clear.isEnabled(),'clear removes date constraint');
   check(choose.hasOnClickListeners(),'calendar selection action attached');
   resolve({checks,calendarVisualChecked:false});
  }catch(e){if(dialog)dialog.dismiss();if(view&&root)root.removeView(view);reject(Error(String(e.stack||e)));}
 }
}));}};
