// Seeds a reserved .invalid origin through a dummy jar. Does not access real cookies or send requests.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(!String(app.getPackageName()).endsWith('.resumefix242'))throw Error('242 verification only');
    const A=Java.use('app.morphe.extension.chmate.ExternalBoardAuth'),address='https://haiagaru-seed-test.invalid/';
    const url=A.parseUrl(address),cookieManager=Java.use('android.webkit.CookieManager').getInstance();
    const field=A.class.getDeclaredField('nativeJar');field.setAccessible(true);const saved=field.get(null);
    function cleanup(){field.set(null,saved);['countsession','securitykey'].forEach(n=>cookieManager.setCookie(address,n+'=; Path=/; Max-Age=0',null));}
    const Jar=Java.registerClass({name:'app.morphe.verification.SeedJar'+Date.now(),methods:{
        haiagaruNativeAuthCookies:{returnType:'java.util.List',argumentTypes:[url.$className],implementation:function(u){
            const list=Java.use('java.util.ArrayList').$new();
            list.add(A.parseCookie(u,'countsession=native-seed; Path=/; Secure'));
            list.add(A.parseCookie(u,'securitykey=native-sign; Path=/; Secure'));return list;
        }}
    }});
    const Ready=Java.registerClass({name:'app.morphe.verification.SeedReady'+Date.now(),implements:[Java.use('java.lang.Runnable')],methods:{run:function(){
        try{const result=String(cookieManager.getCookie(address));
            if(!result.includes('countsession=native-seed')||!result.includes('securitykey=native-sign'))throw Error('native identity not seeded');
            console.log('PASS native identity seeded before ready callback');
        }catch(e){console.log('FAIL SEED '+e.stack);}finally{cleanup();}
    }}});
    Java.scheduleOnMainThread(()=>{try{
        cookieManager.setAcceptCookie(true);A.rememberJar(Jar.$new());
        const activity=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
        A.prepareWebSession(activity,address,address+'auth',Ready.$new());
    }catch(e){console.log('FAIL SEED START '+e.stack);cleanup();}});
});
