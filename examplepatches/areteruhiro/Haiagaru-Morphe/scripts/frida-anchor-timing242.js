// Observe only native dispatch and popup show. User-specified 348 -> 14; no model changes.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!String(app.getPackageName()).endsWith('.resumefix242'))throw Error('Test package only');
 const Clock=Java.use('android.os.SystemClock');let released=0;
 const Body=Java.use('o.zzbhp'),dispatch=Body.dispatchTouchEvent.overload('android.view.MotionEvent');
 dispatch.implementation=function(event){const begin=Clock.uptimeMillis(),action=event.getActionMasked();if(action===1)released=begin;
  const result=dispatch.call(this,event);if(action===1)console.log('NATIVE_ANCHOR_UP_DISPATCH_MS '+(Clock.uptimeMillis()-begin));return result;};
 const Popup=Java.use('android.widget.PopupWindow');
 for(const name of ['showAtLocation','showAsDropDown'])for(const method of Popup[name].overloads){method.implementation=function(){const result=method.apply(this,arguments);if(released&&Clock.uptimeMillis()-released<5000)console.log('ANCHOR_POPUP_SHOW_MS '+(Clock.uptimeMillis()-released));return result;};}
 console.log('ANCHOR_TIMING_READY');
});
