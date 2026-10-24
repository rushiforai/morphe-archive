// Local HTML only. Validate the actual Compose AndroidView bounds and touch scrolling.
Java.perform(function(){
    const T=Java.use('android.app.ActivityThread'),app=T.currentApplication(),pkg=String(app.getPackageName());
    if(!/\.haiagaru\.resumefix226$/.test(pkg))throw Error('Isolated 226 app required');
    const W=Java.use('android.webkit.WebView'),I=Java.use('android.content.Intent'),U=Java.use('android.net.Uri');
    const load=W.loadUrl.overload('java.lang.String');let active=null,web=null,checks=0,phase=0,done=false;
    const html='<html><body style="margin:0;background:white;color:black"><h1>LOCAL SCROLL TEST</h1>'+Array.from({length:150},(_,i)=>'<p style="height:45px">ROW '+i+'</p>').join('')+'</body></html>';
    load.implementation=function(url){this.loadDataWithBaseURL('https://fixture.invalid/',html,'text/html','UTF-8',null);};
    function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
    function main(delay,fn){setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(done)return;try{fn();}catch(e){console.log('FAIL '+e+'\n'+e.stack);cleanup();}})),delay);}
    function cleanup(){done=true;if(active&&!active.isFinishing())active.finish();load.implementation=null;}
    function launch(name,extras,data){const intent=I.$new();intent.setClassName(pkg,'app.morphe.extension.chmate.'+name);intent.addFlags(0x10000000);
        for(const pair of extras)intent.putExtra.overload('java.lang.String','java.lang.String').call(intent,pair[0],pair[1]);
        if(data)intent.setData(U.parse(data));app.startActivity(intent);}
    function find(name,field){
        const R=Java.use('android.app.ActivityThread$ActivityClientRecord'),A=Java.use('app.morphe.extension.chmate.'+name);
        for(const record of T.currentActivityThread().mActivities.value.values().toArray()){
            const a=Java.cast(record,R).activity.value;
            if(a&&String(a.getClass().getName())==='app.morphe.extension.chmate.'+name&&!a.isFinishing()){
                active=Java.retain(Java.cast(a,A));web=Java.retain(active[field].value);return;
            }
        }throw Error('Browser missing '+name);
    }
    function swipe(label){
        console.log('WEB_SIZE '+label+' '+web.getWidth()+'x'+web.getHeight()+' attached='+web.isAttachedToWindow()+' shown='+web.isShown());
        check(web.getHeight()>200&&web.getWidth()>100,label+' has a bounded visible browser viewport');
        check(web.canScrollVertically(1),label+' has content below the viewport');
        const loc=Java.array('int',[0,0]);web.getLocationOnScreen(loc);
        console.log('WEB_BOUNDS '+label+' '+loc[0]+','+loc[1]+' '+web.getWidth()+'x'+web.getHeight());
        const M=Java.use('android.view.MotionEvent'),clock=Java.use('android.os.SystemClock');
        const down=clock.uptimeMillis(),x=loc[0]+web.getWidth()/2,y=loc[1]+web.getHeight()*.8;
        function event(action,time,at){const e=M.obtain.overload('long','long','int','float','float','int').call(M,down,time,action,x,at,0);active.dispatchTouchEvent(e);e.recycle();}
        event(0,down,y);
        for(let i=1;i<=6;i++)event(2,Number(down)+16*i,y-web.getHeight()*.075*i);
        event(1,Number(down)+128,y-web.getHeight()*.45);
    }
    main(0,()=>launch('HissiMenuActivity',[],'haiagaru-hissi://hissi.org/read.php/android/20261020/fixture.html'));
    main(5000,()=>{find('HissiMenuActivity','viewerWebView');swipe('checker');});
    main(7000,()=>{check(web.getScrollY()>0,'checker scrolls from a real activity touch dispatch');web.scrollTo(0,0);active.finish();active=null;
        launch('ExternalBoardAuthActivity',[['board','https://fixture.invalid/board'],['auth','https://fixture.invalid/auth']],null);});
    main(12000,()=>{find('ExternalBoardAuthActivity','web');swipe('authentication');});
    main(14000,()=>{check(web.getScrollY()>0,'authentication scrolls from a real activity touch dispatch');console.log('PASS '+checks+' bounded browser/touch checks');cleanup();});
});
