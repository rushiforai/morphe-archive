rpc.exports.test=function(){
 return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
  try {
   const B=Java.use('app.morphe.extension.chmate.BackgroundPostingUi');
   const K=Java.use('app.morphe.extension.chmate.BackgroundPostingUi$Binding');
   const Fragment=Java.use('androidx.fragment.app.Fragment');
   const Activity=Java.use('android.app.Activity');
   const Edit=Java.use('android.widget.EditText');
   const Text=Java.use('android.widget.TextView');
   const Buffer=Java.use('android.widget.TextView$BufferType');
   const Utils=Java.use('android.text.TextUtils');const S=Java.use('java.lang.String');
   const app=Java.use('android.app.ActivityThread').currentApplication();
   const ctor=K.class.getDeclaredConstructors()[0];ctor.setAccessible(true);
   const mapField=B.class.getDeclaredField('BINDINGS');mapField.setAccessible(true);const map=Java.cast(mapField.get(null),Java.use('java.util.Map'));
   function text(body,value){body.setText.overload('java.lang.CharSequence','android.widget.TextView$BufferType').call(body,S.$new(value),Buffer.EDITABLE.value);}
   function runCase(hidden,thread,target,value){
    const frag=Fragment.$new(),activity=Activity.$new(),body=Edit.$new(app);
    text(body,value);
    const args=Java.array('java.lang.Object',[frag,activity,null,S.$new('0.8.10.242 dev'),thread===null?null:S.$new(thread),S.$new(target),body]);
    const binding=Java.cast(ctor.newInstance(args),K);
    function field(name){const f=K.class.getDeclaredField(name);f.setAccessible(true);return f;}
    field('submittedBody').set(binding,S.$new(value));field('hidden').setBoolean(binding,hidden);map.put(frag,binding);
    B.nativePosted.overload('java.lang.Object').call(B,frag);
    return {body,frag,binding};
   }
   const disabled=runCase(false,null,'https://bbs.eddibb.cc/liveedge/1795235718','edge reply');
   send({off:disabled.body.getText().toString()});const offCleared=Utils.isEmpty(disabled.body.getText());
   const enabled=runCase(true,'https://bbs.eddibb.cc/test/read.cgi/liveedge/1795235718/','https://bbs.eddibb.cc/test/read.cgi/liveedge/1795235718/','edge reply');
   const onCleared=Utils.isEmpty(enabled.body.getText());
   const edited=runCase(false,null,'https://bbs.eddibb.cc/liveedge/1795235718','old text');
   text(edited.body,'new text');B.nativePosted.overload('java.lang.Object').call(B,edited.frag);
   const newerTextPreserved=Utils.equals(edited.body.getText(),S.$new('new text'));
   const other=runCase(false,null,'https://egg.5ch.io/test/read.cgi/android/1795235718/','other board reply');
   send({other:other.body.getText().toString()});const otherBoardPreserved=Utils.equals(other.body.getText(),S.$new('other board reply'));
   resolve({returnOriginalScreenOffClears:offCleared,returnOriginalScreenOnClears:onCleared,newlyTypedTextPreserved:newerTextPreserved,otherBoardUnchanged:otherBoardPreserved});
  }catch(e){resolve({error:String(e.stack||e)});}
 })));
};





