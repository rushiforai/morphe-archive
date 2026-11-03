rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 const P='app.morphe.extension.chmate.',H=Java.use(P+'Haiagaru'),a=H.toolbarActivity(null),Group=Java.use('android.view.ViewGroup'),Edit=Java.use('android.widget.EditText');let view;
 function walk(v){if(Edit.class.isInstance(v)&&v.isShown())view=Java.cast(v,Edit);if(Group.class.isInstance(v)){const g=Java.cast(v,Group);for(let i=0;i<g.getChildCount();i++)walk(g.getChildAt(i));}}
 walk(a.getWindow().getDecorView());if(!view){reject(Error('Open native thread search first'));return;}
 const E=Java.use(P+'EmojiFontFallback'),field=E.class.getDeclaredField('renderMode');field.setAccessible(true);const mode=field.get(null);
 if(String(mode)!=='all'){reject(Error('Actual APK must use emojiMode=all'));return;}
 const TV=Java.use('android.widget.TextView'),Str=Java.use('java.lang.String'),Text=Java.use('android.text.TextUtils');
 TV.setText.overload('java.lang.CharSequence').call(view,Str.$new(''));view.requestFocus();
 const connection=view.onCreateInputConnection(Java.use('android.view.inputmethod.EditorInfo').$new());if(!connection){reject(Error('Native input connection unavailable'));return;}
 let checks=0;
 function next(value,expected){connection.commitText(Str.$new(value),1);setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
   E.applyToRow(a.getWindow().getDecorView());const actual=String(Text.substring(view.getText(),0,view.length()));
   if(actual!==expected||view.getSelectionStart()!==expected.length||view.getSelectionEnd()!==expected.length)throw Error('Search changed text/cursor '+actual+' cursor='+view.getSelectionStart());checks++;
   if(checks===1)next('b','ab');else if(checks===2)next('あ','abあ');else if(checks===3)next('😀','abあ😀');else {TV.setText.overload('java.lang.CharSequence').call(view,Str.$new(''));resolve({checks,mode:'all',nativeInputConnection:true,delayedSearchCallbacks:true,view:String(view.getClass().getName())});}
  }catch(e){reject(Error(String(e.stack||e)));}})),800);}
 next('a','a');
})));}};
