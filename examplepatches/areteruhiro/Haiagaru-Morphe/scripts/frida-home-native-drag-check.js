rpc.exports.test=()=>new Promise(resolve=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
const H=Java.use('app.morphe.extension.chmate.HomeThreadOrder'),D=Java.use('app.morphe.extension.chmate.HomeThreadDrag');
const f=H.class.getDeclaredField('latest');f.setAccessible(true);const map=Java.cast(f.get(null),Java.use('java.util.Map'));const keys=map.keySet().toArray();const modes=[];for(let i=0;i<keys.length;i++)modes.push(Java.cast(keys[i],Java.use('java.lang.Integer')).intValue());
const L=Java.use('java.util.ArrayList');const a=L.$new(),b=L.$new(),item=Java.use('java.lang.Object').$new();a.add(item);b.add(item);
const same=D.class.getDeclaredMethod('sameRows',Java.array('java.lang.Class',[Java.use('java.util.List').class,Java.use('java.util.List').class]));same.setAccessible(true);function match(){return Java.cast(same.invoke(null,Java.array('java.lang.Object',[a,b])),Java.use('java.lang.Boolean')).booleanValue();}
const stable=match();b.add(item);const changed=!match();
let fixture=null;Java.choose('jp.syoboi.a2chMate.activity.TabletHomeActivity',{onMatch(activity){if(fixture!==null)return;const Frame=Java.use('android.widget.FrameLayout'),List=Java.use('android.widget.ListView'),V=Java.use('android.view.View');const root=Frame.$new(activity),list=List.$new(activity);root.addView(list);
const ctor=D.class.getDeclaredConstructors()[0];ctor.setAccessible(true);const wrapper=Java.cast(ctor.newInstance(Java.array('java.lang.Object',[activity,null,root,list,Java.use('java.lang.Integer').valueOf(102)])),D);
const parent=Frame.$new(activity);parent.addView(wrapper);wrapper.addView(root);
const Motion=Java.use('android.view.MotionEvent'),Clock=Java.use('android.os.SystemClock');let t=Clock.uptimeMillis();let down=Motion.obtain(t,t,0,20,20,0),cancel=Motion.obtain(t,t+1,3,20,20,0);wrapper.dispatchTouchEvent(down);wrapper.dispatchTouchEvent(cancel);down.recycle();cancel.recycle();
const field=D.class.getDeclaredField('dragging');field.setAccessible(true);fixture=!field.getBoolean(wrapper);
const selected=D.class.getDeclaredField('selectedKey');selected.setAccessible(true);selected.set(wrapper,Java.use('java.lang.String').$new('haiagaru-fixture-pin-only'));
const update=D.class.getDeclaredMethod('updatePin',Java.array('java.lang.Class',[]));update.setAccessible(true);update.invoke(wrapper,Java.array('java.lang.Object',[]));
const buttonField=D.class.getDeclaredField('pin');buttonField.setAccessible(true);const button=Java.cast(buttonField.get(wrapper),Java.use('android.widget.Button'));
const prefs=activity.getSharedPreferences('haiagaru.home-thread-order',0);const previous=Java.use('java.util.HashSet').$new(prefs.getStringSet('pins:102',Java.use('java.util.Collections').emptySet()));const existed=prefs.contains('pins:102');
try{button.performClick();var pinAdded=prefs.getStringSet('pins:102',Java.use('java.util.Collections').emptySet()).contains('haiagaru-fixture-pin-only');button.performClick();var pinRemoved=!prefs.getStringSet('pins:102',Java.use('java.util.Collections').emptySet()).contains('haiagaru-fixture-pin-only');
field.setBoolean(wrapper,true);const move=Motion.obtain(t,t+2,2,20,120,0);wrapper.dispatchTouchEvent(move);move.recycle();const fy=D.class.getDeclaredField('y');fy.setAccessible(true);var followsPointer=fy.getFloat(wrapper)===120;const stop=Motion.obtain(t,t+3,3,20,120,0);wrapper.dispatchTouchEvent(stop);stop.recycle();
fixture={cancelLeavesNoDrag:fixture,pinAdded,pinRemoved,followsPointer};
}finally{const edit=prefs.edit();if(existed)edit.putStringSet('pins:102',previous);else edit.remove('pins:102');edit.commit();parent.removeView(wrapper);}
},onComplete(){resolve({stableSnapshotAccepted:stable,changedSnapshotRejected:changed,cancelLeavesNoDrag:fixture,modes});}});
}catch(e){resolve({error:String(e.stack||e)});}})));
