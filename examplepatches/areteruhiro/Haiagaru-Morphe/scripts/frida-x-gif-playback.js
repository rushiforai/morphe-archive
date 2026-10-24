// Streams only the public GIF specified by the user; no account or posting operation.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 verification only');
    Java.scheduleOnMainThread(function(){
        const H=Java.use('app.morphe.extension.chmate.Haiagaru');
        if(!H.videoViewerEnabled()){console.log('SKIP internal player disabled');return;}
        const intent=Java.use('android.content.Intent').$new();
        intent.setClassName(app,'app.morphe.extension.chmate.VideoViewerActivity');
        intent.setData(Java.use('android.net.Uri').parse('https://video.twimg.com/tweet_video/G51IpxIXsAAZGU0.mp4'));
        intent.addFlags(0x10000000);app.startActivity(intent);
    });
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(function(){
        try{
            const H=Java.use('app.morphe.extension.chmate.Haiagaru'),activity=H.toolbarActivity(null);
            if(!activity||String(activity.getClass().getName())!=='app.morphe.extension.chmate.VideoViewerActivity')throw Error('Player not foreground');
            const f=activity.getClass().getDeclaredField('mediaPlayer');f.setAccessible(true);
            const value=f.get(activity);
            if(!value){
                const fallback=activity.getClass().getDeclaredField('gifFallback');fallback.setAccessible(true);
                const alternate=fallback.get(activity);if(!alternate)throw Error('No prepared player or GIF fallback');
                // Names t/D must be checked against this candidate's R8 mapping before each run.
                function read(name){const m=alternate.getClass().getMethod(name,Java.array('java.lang.Class',[]));m.setAccessible(true);return Number(m.invoke(alternate,Java.array('java.lang.Object',[])));}
                const state=read('t'),duration=read('getDuration'),loop=read('D'),position=read('getCurrentPosition');
                if(state!==3||duration<=0||loop!==1)throw Error('Fallback not ready state='+state+' duration='+duration);
                console.log('PASS independent GIF player durationMs='+duration+' positionMs='+position+' looping=true');
                const keep=Java.retain(alternate);
                setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
                    const m=keep.getClass().getMethod('getCurrentPosition',Java.array('java.lang.Class',[]));m.setAccessible(true);const next=Number(m.invoke(keep,Java.array('java.lang.Object',[])));
                    if(next===position)throw Error('GIF position did not advance');console.log('PASS GIF position advances '+position+' -> '+next);
                }catch(error){console.log('FAIL GIF advancement '+error.stack);}})),700);
                return;
            }
            const player=Java.cast(value,Java.use('android.media.MediaPlayer'));
            if(!player.isLooping()||player.getDuration()<=0||!player.isPlaying())throw Error('Not playing as looping GIF');
            console.log('PASS user GIF playing durationMs='+player.getDuration()+' positionMs='+player.getCurrentPosition()+' looping=true');
        }catch(e){console.log('FAIL PLAYBACK '+e.stack);}
    })),45000);
});
