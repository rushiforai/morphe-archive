// Read-only diagnostics in the existing 226 verification app. No posts or settings writes.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix226')throw Error('226 verification app required');
 const FP=Java.use('app.morphe.extension.chmate.FilterPosition'),View=Java.use('android.view.View'),VG=Java.use('android.view.ViewGroup'),LV=Java.use('android.widget.ListView');
 function snapshot(list){try{const lv=Java.cast(list,LV),g=Java.cast(list,VG),child=g.getChildAt(0);return 'first='+lv.getFirstVisiblePosition()+' top='+(child?child.getTop():null)+' height='+(child?child.getHeight():null)+' count='+(lv.getAdapter()?lv.getAdapter().getCount():-1)+' children='+g.getChildCount();}catch(e){return String(e);}}
 const selection=LV.setSelectionFromTop.overload('int','int');selection.implementation=function(p,y){if(this.isShown())console.log('SELECTION '+p+','+y+' before '+snapshot(this)+' '+Java.use('android.util.Log').getStackTraceString(Java.use('java.lang.Exception').$new()));return selection.call(this,p,y);};
 const Pos=Java.use('app.morphe.extension.chmate.XPostPreviewPosition');Pos.beforeChange.implementation=function(body){console.log('PREVIEW_RESIZE '+body.getHeight()+' layout='+body.isLayoutRequested());return this.beforeChange(body);};
 let previous='',ticks=0;const timer=setInterval(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
 const f=FP.class.getDeclaredField('fragments');f.setAccessible(true);const refs=Java.cast(f.get(null),Java.use('java.util.List'));
 for(let i=0;i<refs.size();i++){const frag=Java.cast(refs.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!frag)continue;
 const m=frag.getClass().getMethod('getView',Java.array('java.lang.Class',[]));const root=m.invoke(frag,Java.array('java.lang.Object',[]));
 if(!root)continue;const list=FP.findList(Java.cast(root,View));if(list&&list.isShown()){const value=snapshot(list);if(value!==previous){console.log('VIEWPORT '+value);previous=value;}}}
 }catch(e){console.log('DIAG '+e);}if(++ticks>=600){clearInterval(timer);console.log('RELOAD_DIAGNOSTIC_COMPLETE');}})),100);
 console.log('RELOAD_DIAGNOSTIC_READY');
});
