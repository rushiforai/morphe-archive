// Offline synthetic cookies only; never sends a request or changes real board cookies.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 const B=Java.use('app.morphe.extension.chmate.BoardCookies'),A=Java.use('app.morphe.extension.chmate.ExternalBoardAuth');
 const list=Java.use('java.util.ArrayList'),J=Java.use('java.lang.String');
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0), store=app.getSharedPreferences('haiagaru.board-cookies',0);
 const had=p.contains('boardCookiesEnabled'),old=p.getBoolean('boardCookiesEnabled',false);
 const host='https://board-cookie-fixture.invalid',a=host+'/alpha/',b=host+'/beta/';let count=0;
 const f=B.class.getDeclaredField('CURRENT');f.setAccessible(true);const local=Java.cast(f.get(null),Java.use('java.lang.ThreadLocal')),before=local.get();
 const Scope=Java.use('app.morphe.extension.chmate.BoardCookies$Scope');
 const jarField=A.class.getDeclaredField('nativeJar');jarField.setAccessible(true);const originalJarRef=jarField.get(null);
 function scope(board){local.set(Scope.$new(board));}
 function check(ok,label){if(!ok)throw Error(label);count++;console.log('PASS '+label);}
 function cookies(url,value){let result=list.$new();result.add(A.parseCookie(url,'sid='+value+'; Path=/; Max-Age=3600'));return result;}
 function value(items){if(items.size()===0)return '';return String(items.get(0)).split(';')[0];}
 try{
  B.initialize(app);p.edit().putBoolean('boardCookiesEnabled',true).commit();
  const url=A.parseUrl(host+'/alpha/test/bbs.cgi'),empty=list.$new();
  check(B.loadBoard(a,cookies(url,'legacy-shared'),url).size()===0,'first request does not auto-copy shared cookies');
  const selectedUrl=A.parseUrl(host+'/assigned/test/bbs.cgi'),selectedCookies=list.$new();
  selectedCookies.add(A.parseCookie(selectedUrl,'sid=selected-fixture; Domain=board-cookie-fixture.invalid; Path=/assigned/; Max-Age=3600'));
  const FakeJar=Java.registerClass({name:'app.morphe.extension.chmate.CookieJarFixture'+Date.now(),methods:{
   haiagaruNativeAuthCookies:[{returnType:'java.util.List',argumentTypes:[String(selectedUrl.getClass().getName())],implementation(){return selectedCookies;}}]}});
  A.rememberJar(FakeJar.$new());
  check(B.importShared(host+'/assigned/')===1,'select and import one URL-matching shared cookie');
  check(value(B.loadBoard(host+'/assigned/',empty,selectedUrl))==='sid=selected-fixture','selected cookie appears on assigned board');
  check(B.loadBoard(a,empty,url).size()===0,'selected cookie stays on assigned board only');
  jarField.set(null,originalJarRef);
  scope(a);check(B.save(A.parseUrl(host+'/alpha/test/bbs.cgi'),cookies(url,'alpha')),'save alpha');
  const betaUrl=A.parseUrl(host+'/beta/test/bbs.cgi');scope(b);check(B.save(betaUrl,cookies(betaUrl,'beta')),'save beta');
  scope(a);check(value(B.load(empty,A.parseUrl(host+'/alpha/test/bbs.cgi')))==='sid=alpha','same-host alpha isolated');
  scope(b);check(value(B.load(empty,betaUrl))==='sid=beta','same-host beta isolated');
  scope(a);B.clear(a);check(B.load(cookies(url,'shared'),A.parseUrl(host+'/alpha/test/bbs.cgi')).size()===0,'clear tombstone does not inherit shared cookies');
  check(B.save(url,cookies(url,'late')),'late response consumed');
  check(B.load(empty,A.parseUrl(host+'/alpha/test/bbs.cgi')).size()===0,'late response cannot restore deleted board');
  scope(b);check(value(B.load(empty,betaUrl))==='sid=beta','other board survives deletion');
  scope(a);const http=A.parseUrl('http://board-cookie-fixture.invalid/test/bbs.cgi');
  check(B.save(http,cookies(http,'http')),'HTTP save handled by partition');
  check(value(B.load(empty,http))==='sid=http','HTTP response saved outside shared jar');
  const expired=list.$new();expired.add(A.parseCookie(url,'sid=gone; Path=/; Max-Age=0'));B.save(url,expired);
  check(B.load(empty,url).size()===0,'expired cookie removes value');
  scope(a);B.save(url,cookies(url,'restore-alpha'));
  scope(b);B.save(url,cookies(url,'restore-beta'));
  const values={};[a,b].forEach(board=>{
   values['jar:'+board]={type:'string',value:String(store.getString('jar:'+board,'[]'))};
   values['revision:'+board]={type:'long',value:Number(store.getLong('revision:'+board,0))};
  });
  const snapshot=Java.use('org.json.JSONObject').$new(JSON.stringify({sourcePackage:String(app.getPackageName()),authentication:{preferences:{'haiagaru.board-cookies':values}}}));
  scope(a);B.save(url,cookies(url,'changed-alpha'));
  scope(b);B.save(url,cookies(url,'changed-beta'));
  const Secrets=Java.use('app.morphe.extension.chmate.HaiagaruBackupSecrets');
  Secrets.restore(app,snapshot,1024,false);
  check(B.save(url,cookies(url,'late-after-restore')),'pre-restore response consumed');
  scope(a);check(value(B.load(empty,url))==='sid=restore-alpha','backup restores alpha partition');
  scope(b);check(value(B.load(empty,url))==='sid=restore-beta','backup restores beta and rejects late response');
  Secrets.restore(app,snapshot,0,false);
  check(value(B.load(empty,url))==='sid=restore-beta','no AUTH flag leaves cookies unchanged');
  p.edit().putBoolean('boardCookiesEnabled',false).commit();
  check(!B.save(url,cookies(url,'off')),'OFF leaves native save active');
  check(value(B.load(cookies(url,'native'),url))==='sid=native','OFF preserves native load');
  console.log('BOARD_COOKIES_COMPLETE checks='+count);
 }catch(e){console.log('FAIL '+e.stack);}finally{
  if(before===null)local.remove();else local.set(before);
  jarField.set(null,originalJarRef);
  let edit=store.edit();[a,b,host+'/assigned/'].forEach(board=>{edit.remove('jar:'+board);edit.remove('revision:'+board);});edit.commit();
  edit=p.edit();if(had)edit.putBoolean('boardCookiesEnabled',old);else edit.remove('boardCookiesEnabled');edit.commit();
  console.log('BOARD_COOKIE_FIXTURE_RESTORED');
 }
});
