// Isolated emulator regression. No NG writes; every modified preference is restored.
Java.perform(function () {
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 verification package required');
    let checks=0;
    function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
    const Parser=Java.use('app.morphe.extension.chmate.XMediaAttachments');
    try {
        const id='1989826585013424339';
        check(String(Java.use('app.morphe.extension.chmate.XEmbedToken').forPost(id))==='4tn8322i7gi','public embed token');
        const json=Java.use('app.morphe.extension.chmate.XPostMetadata').fetch(id);
        check(json!==null,'Android public GIF metadata fetch');
        const urls=Parser.fromJson(json,id);
        check(Array.from(urls).some(s=>String(s)==='https://video.twimg.com/tweet_video/G51IpxIXsAAZGU0.mp4'),'GIF MP4 extracted');
        const fallback=JSON.stringify({id_str:id,video:{poster:'https://pbs.twimg.com/tweet_video_thumb/G51IpxIXsAAZGU0.jpg',variants:[{type:'video/mp4',src:'https://video.twimg.com/tweet_video/G51IpxIXsAAZGU0.mp4'}]}});
        check(Parser.fromJson(fallback,id).length===2,'root video fallback poster and MP4');
        check(Parser.fromJson(fallback,'123').length===0,'unrelated post ID rejected');
    } catch(e){console.log('FAIL GIF '+e.stack);}
    Java.openClassFile('/data/local/tmp/haiagaru-history-context-tests.dex').load();
    // Fixture marshals native adapter work to the UI itself, so do not run it on main.
    try{console.log(Java.use('app.morphe.extension.chmate.DroppedThreadsAndroidTest').run(app));}catch(e){console.log('FAIL HISTORY '+e.stack);}
    Java.scheduleOnMainThread(function(){
        try{
            const activity=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
            check(activity!==null,'resumed native activity');
            console.log(Java.use('app.morphe.extension.chmate.HistoryMenuAndroidTest').run(activity));
            console.log('PASS '+checks+' GIF/menu checks');
        }catch(e){console.log('FAIL MENU '+e.stack);}
    });
});
