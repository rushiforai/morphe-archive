// Ephemeral local HTML containing only the user's public MP4. No login/session or JS bridge.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 test only');
    let web=null,dialog=null;
    const Result=Java.registerClass({name:'app.morphe.extension.chmate.test.GifWebResult',implements:[Java.use('android.webkit.ValueCallback')],methods:{onReceiveValue(value){console.log('WEB_VIDEO '+value);}}});
    Java.scheduleOnMainThread(function(){
        const a=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);if(!a)throw Error('No activity');
        web=Java.retain(Java.use('android.webkit.WebView').$new(a));
        web.getSettings().setJavaScriptEnabled(true);web.getSettings().setMediaPlaybackRequiresUserGesture(false);
        web.getSettings().setAllowFileAccess(false);web.getSettings().setAllowContentAccess(false);
        dialog=Java.retain(Java.use('android.app.Dialog').$new(a));dialog.setContentView(web);dialog.show();
        dialog.getWindow().setLayout(-1,800);
        web.loadDataWithBaseURL('https://haiagaru.invalid/','<html><body style="margin:0;background:black"><video crossorigin="anonymous" autoplay muted loop playsinline style="width:100%;height:100%" src="https://video.twimg.com/tweet_video/G51IpxIXsAAZGU0.mp4"></video></body></html>','text/html','UTF-8',null);
    });
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(web)web.evaluateJavascript("JSON.stringify((()=>{const v=document.querySelector('video');return {ready:v.readyState,width:v.videoWidth,duration:v.duration,error:v.error&&v.error.code,paused:v.paused,time:v.currentTime}})())",Result.$new());})),20000);
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(dialog)dialog.dismiss();if(web){web.stopLoading();web.destroy();}console.log('WEB_DIAGNOSTIC_CLOSED');})),24000);
});
