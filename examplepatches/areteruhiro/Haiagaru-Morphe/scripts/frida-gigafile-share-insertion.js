Java.perform(()=>Java.scheduleOnMainThread(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!String(app.getPackageName()).endsWith('.haiagaru.reporter242'))throw Error('Isolated 242 required');
 const G=Java.use('app.morphe.extension.chmate.GigaFilePosting');
 const body=Java.use('android.widget.EditText').$new(app);
 const T=Java.use('android.widget.TextView');
 const S=Java.use('java.lang.String');
 const set=value=>T.setText.overload('java.lang.CharSequence').call(body,S.$new(value));
 const url='https://34.gigafile.nu/0901-123456789abcdefg';
 const before='draft before';
 set(before+'draft after');body.setSelection(before.length);
 G.insertShare(body,url,'Q1w2');
 const actual=String(body.getText().toString());
 if(actual!==before+'\n'+url+'\nダウンロードパスワード：Q1w2\ndraft after')
   throw Error('Password or draft insertion mismatch');
 console.log('PASS success inserts only URL and password while preserving draft');
 set('');G.insertShare(body,url,'');
 if(String(body.getText().toString())!==url)throw Error('URL-only case mismatch');
 console.log('RESULT PASS posting insertion checks');
}));