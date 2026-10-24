// Dummy cookies at a reserved .invalid origin only. No network or posting.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(!String(app.getPackageName()).endsWith('.resumefix242'))throw Error('242 verification only');
    const Auth=Java.use('app.morphe.extension.chmate.ExternalBoardAuth');
    const address='https://haiagaru-identity-test.invalid/';
    const prefs=app.getSharedPreferences('haiagaru.external-board-auth',0);
    const key='enabled:https://haiagaru-identity-test.invalid',had=prefs.contains(key),old=prefs.getBoolean(key,false);
    const Cookie=Java.use('android.webkit.CookieManager').getInstance();
    const ArrayList=Java.use('java.util.ArrayList');let checks=0;
    function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
    function parse(value){return Auth.parseCookie(Auth.parseUrl(address),value);}
    function restore(){const e=prefs.edit();if(had)e.putBoolean(key,old);else e.remove(key);e.commit();
        ['countsession','securitykey','cf_clearance'].forEach(n=>Cookie.setCookie(address,n+'=; Path=/; Max-Age=0',null));}
    const Ready=Java.registerClass({name:'app.morphe.verification.IdentityCookieReady'+Date.now(),
        implements:[Java.use('android.webkit.ValueCallback')],methods:{onReceiveValue:function(){
            Java.scheduleOnMainThread(()=>{try{
                const native=ArrayList.$new();native.add(parse('countsession=native-session; Path=/; Secure'));
                native.add(parse('securitykey=native-signature; Path=/; Secure'));
                const merged=Auth.cookies(native,Auth.parseUrl(address));
                function has(list,text){for(let i=0;i<list.size();i++)if(String(list.get(i)).startsWith(text+';')||String(list.get(i))===text)return true;return false;}
                check(has(merged,'countsession=native-session'),'existing session preserved');
                check(has(merged,'securitykey=native-signature'),'matching signature preserved');
                check(!has(merged,'countsession=web-session'),'different WebView session not imported');
                check(has(merged,'cf_clearance=dummy-clearance'),'non-identity authentication cookie still merged');
                const partial=ArrayList.$new();partial.add(parse('countsession=native-session; Path=/; Secure'));
                check(!has(Auth.cookies(partial,Auth.parseUrl(address)),'securitykey=web-signature'),'never mixes half an identity pair');
                console.log('IDENTITY_COMPLETE checks='+checks);
            }catch(e){console.log('FAIL IDENTITY '+e.stack);}finally{restore();}});
        }}});
    Java.scheduleOnMainThread(()=>{
        Auth.initialize(app);prefs.edit().putBoolean(key,true).commit();
        Cookie.setAcceptCookie(true);
        Cookie.setCookie(address,'countsession=web-session; Path=/; Secure',null);
        Cookie.setCookie(address,'securitykey=web-signature; Path=/; Secure',null);
        Cookie.setCookie(address,'cf_clearance=dummy-clearance; Path=/; Secure',Ready.$new());
    });
});
