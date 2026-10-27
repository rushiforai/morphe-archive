// Uses a local decoder fixture in the verification package; restores autoplay preference.
Java.perform(function () {
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Verification package required');
    Java.classFactory.loader=app.getClassLoader();
    const A=Java.use('app.morphe.extension.chmate.VideoViewerActivity');
    const I=Java.use('android.content.Intent'),U=Java.use('android.net.Uri');
    A.load.implementation=function(){this.video.value.setVideoURI(U.parse('file:///data/user/0/'+app.getPackageName()+'/cache/haiagaru-hold-test.mp4'));};
    const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
    const had=prefs.contains('videoAutoplay'),saved=prefs.getBoolean('videoAutoplay',true);
    function restore(){const e=prefs.edit();if(had)e.putBoolean('videoAutoplay',saved);else e.remove('videoAutoplay');e.commit();}
    let viewer=null,count=0,down=0,x=0,y=0;
    function check(ok,label){if(!ok)throw Error(label);console.log('PASS '+label);count++;}
    function main(action){Java.perform(()=>Java.scheduleOnMainThread(()=>{try{action();}catch(error){console.log('FAIL '+error.stack);clearInterval(timer);restore();if(viewer){viewer.endHoldSpeed();viewer.finish();}}}));}
    function event(action){const e=Java.use('android.view.MotionEvent').obtain(down,Java.use('android.os.SystemClock').uptimeMillis(),action,x,y,0);viewer.dispatchTouchEvent(e);e.recycle();}
    Java.scheduleOnMainThread(()=>{
        prefs.edit().putBoolean('videoAutoplay',false).commit();
        app.startActivity(I.$new('android.intent.action.VIEW',U.parse('https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4')).setClass(app,A.class).addFlags(0x10000000));
    });
    let attempts=0;
    const timer=setInterval(()=>main(()=>{
        if(!viewer)Java.choose(A.$className,{onMatch(a){if(!a.isFinishing()&&!a.isDestroyed())viewer=Java.retain(a);},onComplete(){}});
        if(!viewer||!viewer.prepared.value){if(++attempts>=20){clearInterval(timer);throw Error('sample was not prepared');}return;}
        clearInterval(timer);
        check(viewer.video.value.getDuration()>0,'real MediaPlayer prepared');
        viewer.mediaPlayer.value.setLooping(true);
        check(!viewer.video.value.isPlaying(),'autoplay off waits for play');
        viewer.muteButton.value.performClick();check(viewer.muted.value,'mute button enables player mute');
        viewer.muteButton.value.performClick();check(!viewer.muted.value,'mute button restores audio');
        const controls=viewer.controls.value;controls.show(0);
        const controller=Java.cast(controls,Java.use('app.morphe.extension.chmate.HaiagaruMediaController'));
        const panel=controller.panel.value,cp=Java.array('int',[0,0]);panel.getLocationOnScreen(cp);
        check(viewer.isVideoToolbarTouch(Number(cp[0])+panel.getWidth()/2,Number(cp[1])+panel.getHeight()/2),'controller area excluded from surface gestures');
        check(controls.isShowing(),'controller remains visible');
        viewer.video.value.start();
        viewer.applyPlaybackSpeed.overload('float').call(viewer,1.25);
        controls.hide();
        check(viewer.holdSpeedIndicator.value.getVisibility()===8,'2x indicator is hidden before long press');
        const v=viewer.video.value,p=Java.array('int',[0,0]);v.getLocationOnScreen(p);
        x=Number(p[0])+v.getWidth()*.5;y=Number(p[1])+v.getHeight()*.55;
        down=Number(Java.use('android.os.SystemClock').uptimeMillis());event(0);
        setTimeout(()=>main(()=>{
            check(viewer.holdSpeedActive.value&&Math.abs(viewer.playbackSpeed.value-2)<.01,'surface long press holds 2x');
            check(viewer.holdSpeedIndicator.value.getVisibility()===0,'2x indicator is visible with controls hidden');
            const state=Java.use('android.os.Bundle').$new();viewer.onSaveInstanceState(state);
            check(Math.abs(state.getFloat('playbackSpeed')-1.25)<.01,'temporary 2x is not saved');
            event(1);
            check(!viewer.holdSpeedActive.value&&Math.abs(viewer.playbackSpeed.value-1.25)<.01,'release restores previous speed');
            check(viewer.holdSpeedIndicator.value.getVisibility()===8,'release hides 2x indicator');
            viewer.speedButton.value.performLongClick();
            check(Math.abs(viewer.playbackSpeed.value-1)<.01,'speed button long press resets to 1x');
            viewer.video.value.pause();viewer.applyPlaybackSpeed.overload('float').call(viewer,1.5);
            check(!viewer.video.value.isPlaying(),'speed change preserves paused state');
            viewer.beginHoldSpeed();viewer.touchControls.value.cancel();
            check(!viewer.holdSpeedActive.value&&Math.abs(viewer.playbackSpeed.value-1.5)<.01,'cancellation restores base speed');
            check(viewer.holdSpeedIndicator.value.getVisibility()===8,'cancellation hides 2x indicator');
            console.log('VIDEO_HOLD_RESET_COMPLETE '+count);restore();viewer.finish();
        }),800);
    }),1000);
});
