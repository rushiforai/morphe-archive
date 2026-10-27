// Prototype only the initial reset guard; URL changes and all other states stay native.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Verification app only');
 Java.classFactory.loader=app.getClassLoader();const I=Java.use('o.zzbes');let current=null,skipped=0;
 const fs=I.class.getDeclaredFields();let bitmap,user;
 for(let i=0;i<fs.length;i++){if(String(fs[i].getType().getName())==='o.VN22'){bitmap=fs[i];bitmap.setAccessible(true);}if(String(fs[i].getName())==='mDownloadByUser'){user=fs[i];user.setAccessible(true);}}
 const state=I.c.overload('o.zzbes$write'),retry=I.d.overload('boolean');
 retry.implementation=function(value){const previous=current;current=this.hashCode();try{return retry.call(this,value);}finally{current=previous;}};
 const start=I.f.overload('o.zzbes');start.implementation=function(view){const previous=current;current=view.hashCode();try{return start.call(this,view);}finally{current=previous;}};
 state.implementation=function(s){const name=String(Java.cast(s,Java.use('java.lang.Object')).getClass().getName());if(current===this.hashCode()&&!user.getBoolean(this)&&bitmap.get(this)&&(name==='o.zzbes$write$ComponentActivity'||name==='o.zzbes$write$write')){skipped++;console.log('KEEP_LOADED_IMAGE '+skipped);return;}return state.call(this,s);};
 console.log('REQUERY_GUARD_READY');
 const setBitmap=I.b.overload('o.VN22');let logs=0;
 setBitmap.implementation=function(value){if(value===null&&bitmap.get(this)&&logs++<5)console.log('BITMAP_CLEAR '+Java.use('android.util.Log').getStackTraceString(Java.use('java.lang.Exception').$new()));return setBitmap.call(this,value);};
});
