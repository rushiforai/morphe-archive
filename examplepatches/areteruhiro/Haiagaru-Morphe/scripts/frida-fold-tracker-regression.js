// Real WindowManager adapter on a non-folding emulator; does not change layout preferences.
Java.perform(function(){
    const T=Java.use('android.app.ActivityThread'),app=T.currentApplication(),pkg=String(app.getPackageName());
    if(!/\.haiagaru\.resumefix226$/.test(pkg))throw Error('Isolated 226 app required');
    const tracker=Java.use('app.morphe.extension.chmate.FoldWindowTracker');
    const prefs=Java.use('android.preference.PreferenceManager').getDefaultSharedPreferences(app);
    const original=prefs.getBoolean('enableTabletHome2',false);
    const Counter=Java.registerClass({name:'app.morphe.test.FoldCounter'+Date.now(),implements:[Java.use('java.lang.Runnable')],fields:{calls:'int'},methods:{run:function(){this.calls.value++;}}});
    const counter=Counter.$new();let active=null;
    Java.scheduleOnMainThread(function(){
        const R=Java.use('android.app.ActivityThread$ActivityClientRecord');
        for(const record of T.currentActivityThread().mActivities.value.values().toArray()){
            const a=Java.cast(record,R).activity.value;if(a&&!a.isFinishing()&&a.hasWindowFocus()){active=Java.retain(a);break;}
        }
        if(active===null)throw Error('Foreground activity required');
        tracker.start(active,counter);console.log('WINDOW_TRACKER_STARTED');
    });
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
        try{
            if(active===null)throw Error('No tracker activity');
            if(counter.calls.value<1)throw Error('No WindowLayoutInfo delivered');
            if(tracker.tablet(active)!==null)throw Error('Ordinary emulator must not be inferred to be a foldable');
            if(prefs.getBoolean('enableTabletHome2',false)!==original)throw Error('Manual native layout changed');
            console.log('PASS actual WindowLayoutInfo received, unknown/non-foldable keeps manual layout');
        }catch(e){console.log('FAIL '+e+'\n'+e.stack);}finally{
            if(active!==null){tracker.stop(active);if(tracker.sessions.value.containsKey(active))console.log('FAIL tracker not released');else console.log('PASS window tracker cancels on stop');}
        }
    })),3000);
});
