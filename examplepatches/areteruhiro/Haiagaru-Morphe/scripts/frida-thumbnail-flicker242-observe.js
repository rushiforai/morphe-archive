// Read-only, bounded observations. No heap scan, settings writes or network requests.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 verification app only');
 Java.classFactory.loader=app.getClassLoader();
 const I=Java.use('o.zzbes'),R=Java.use('o.zzbhe'),Log=Java.use('android.util.Log'),Exception=Java.use('java.lang.Exception');
 let changes=0,requeries=0,clears=0,attached=0,detached=0,binds=0,printed=0;
 const fields=I.class.getDeclaredFields();let bitmap;
 for(let n=0;n<fields.length;n++)if(String(fields[n].getType().getName())==='o.VN22'){bitmap=fields[n];bitmap.setAccessible(true);}
 function loaded(v){return bitmap.get(v)!==null;}
 function note(v,kind){if(printed++<16)console.log(kind+' view='+v.hashCode()+' visible='+v.isShown()+' loaded='+loaded(v)+' stack='+Log.getStackTraceString(Exception.$new()));}
 const url=I.setImageUrl.overload('java.lang.String','int','int');url.implementation=function(s,w,h){if(String(this.a.value)!==String(s)){changes++;if(this.isShown()&&this.n.value)note(this,'URL_CHANGE');}return url.call(this,s,w,h);};
 const retry=I.d.overload('boolean');retry.implementation=function(user){requeries++;if(this.isShown()&&loaded(this))note(this,'REQUERY user='+user);return retry.call(this,user);};
 const state=I.c.overload('o.zzbes$write');state.implementation=function(s){const name=String(Java.cast(s,Java.use('java.lang.Object')).getClass().getName());if(this.isShown()&&loaded(this)&&name!=='o.zzbes$write$RemoteActionCompatParcelizer'){clears++;note(this,'LOADED_TO_NONIMAGE '+name);}return state.call(this,s);};
 const bind=R.setImageLinks.overload('[Ljava.lang.CharSequence;','boolean','boolean');bind.implementation=function(a,b,c){binds++;return bind.call(this,a,b,c);};
 const attach=I.onAttachedToWindow;attach.implementation=function(){attached++;return attach.call(this);};
 const detach=I.onDetachedFromWindow;detach.implementation=function(){detached++;return detach.call(this);};
 console.log('FLICKER242_OBSERVER_READY no settings changes');
 const timer=setInterval(()=>console.log('COUNTS binds='+binds+' urls='+changes+' requeries='+requeries+' clears='+clears+' attach='+attached+' detach='+detached),4000);
 setTimeout(()=>{clearInterval(timer);console.log('FLICKER242_OBSERVER_DONE');},24000);
});
