rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 const P='app.morphe.extension.chmate.',app=Java.use('android.app.ActivityThread').currentApplication();if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.migration191242'){reject(Error('Isolated package required'));return;}
 const R=Java.use(P+'ReadingAuth'),E=Java.use(P+'ExternalBoardAuth'),U=Java.use(P+'ViewingUserAgent'),manager=Java.use('android.webkit.CookieManager').getInstance(),prefs=app.getSharedPreferences('haiagaru_reading_auth',0),had=prefs.contains('agent'),previous=prefs.getString('agent',null);
 const url='https://bbs.eddibb.cc/liveedge/subject.txt',agent='Mozilla/5.0 HaiagaruSessionFixture';let checks=0;
 function check(v,label){if(!v)throw Error(label);checks++;}
 const existing=manager.getCookie(url);if(existing&&String(existing).includes('cf_clearance=')){reject(Error('Existing browser session must be preserved'));return;}
 try{
  manager.setCookie.overload('java.lang.String','java.lang.String').call(manager,url,'cf_clearance=fixture-clearance; Path=/; Secure; Max-Age=60');manager.flush();
  R.complete(app,agent);check(String(R.agent(url,'GET'))===agent,'reading exact browser UA');
  check(R.agent(url,'POST')===null&&R.agent('https://other.invalid/a/subject.txt','GET')===null,'no posting or other host UA');
  const nativeUrl=E.parseUrl(url),list=Java.use('java.util.ArrayList').$new();list.add(E.parseCookie(nativeUrl,'countsession=native-identity'));
  const result=R.cookies(list,nativeUrl),values=Java.cast(result,Java.use('java.util.List'));let identity=false,clearance=false,privateLeak=false;
  for(let i=0;i<values.size();i++){const text=String(Java.use('java.lang.String').valueOf.overload('java.lang.Object').call(Java.use('java.lang.String'),values.get(i)));identity=identity||text.startsWith('countsession=native-identity');clearance=clearance||text.startsWith('cf_clearance=fixture-clearance');privateLeak=privateLeak||text.includes('private-browser');}
  check(identity&&clearance&&!privateLeak,'only clearance merged, native identity preserved');
  const conn=Java.cast(Java.use('java.net.URL').$new(url).openConnection(),Java.use('java.net.HttpURLConnection'));
  U.setRequestProperty(conn,'User-Agent','Monazilla/1.00 2chMate/fixture Dalvik/old');check(String(conn.getRequestProperty('User-Agent'))===agent,'native reading header exact browser UA');conn.disconnect();
  check(R.hasClearance(url),'clearance presence');R.clear(app);check(R.agent(url,'GET')===null,'unlink disables reading session');
  resolve({checks,networkRequests:0,temporaryCookieRemoved:true});
 }catch(e){reject(Error(String(e.stack||e)));}finally{manager.setCookie.overload('java.lang.String','java.lang.String').call(manager,url,'cf_clearance=; Path=/; Secure; Max-Age=0');manager.flush();if(had)prefs.edit().putString('agent',previous).commit();else prefs.edit().remove('agent').commit();}
})));}};
