// Construct requests and fake connections only. Never connects, posts, authenticates or uploads.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 const version=pkg.endsWith('.settingsfix191')?'191':pkg.endsWith('.resumefix226')?'226':pkg.endsWith('.resumefix242')?'242':null;
 if(!version)throw Error('Existing verification package only');
 const profile={
  '191':{request:'o.r8lambda17vlhACr7B0IDgCdn1Q67LKhir8',url:'o.r8lambdaDTvcCbM00GfL6vhIvhD78yZ0Us',headers:'a'},
  '226':{request:'o.zzdA',url:'o.zzgb',headers:'a'},
  '242':{request:'o.zzcvq',url:'o.zzcvl',headers:'b'}
 }[version];
 const P=Java.use('app.morphe.extension.chmate.ViewingUserAgent'),J=Java.use('java.lang.String'),ReflectArray=Java.use('java.lang.reflect.Array');
 const Modifier=Java.use('java.lang.reflect.Modifier');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
 const hadFlag=prefs.contains('replaceUserAgent'),oldFlag=prefs.getBoolean('replaceUserAgent',false),hadAgent=prefs.contains('userAgent'),oldAgent=prefs.getString('userAgent',null);
 const before=Java.use('java.lang.System').getProperty('http.agent');let count=0;
 function text(value){return String(J.valueOf.overload('java.lang.Object').call(J,value));}
 function check(value,label){if(!value)throw Error(label);count++;console.log('PASS '+label);}
 function field(type,name){const f=type.getDeclaredField(name);f.setAccessible(true);return f;}
 const noClasses=Java.array('java.lang.Class',[]),noArgs=Java.array('java.lang.Object',[]);
 function parseUrl(url){
  const cls=Java.use(profile.url).class;
  const args=Java.array('java.lang.Object',[J.$new(url)]);
  function parse(type,receiver,staticOnly){for(const method of type.getDeclaredMethods()){
   const p=method.getParameterTypes();if(p.length!==1||!p[0].equals(J.class)||!method.getReturnType().equals(cls))continue;
   if(staticOnly&&!Modifier.isStatic(method.getModifiers()))continue;
   try{method.setAccessible(true);const value=method.invoke(receiver,args);if(value)return value;}catch(ignored){}
  }return null;}
  let value=parse(cls,null,true);if(value)return value;
  for(const f of cls.getDeclaredFields())if(Modifier.isStatic(f.getModifiers())&&!f.getType().isPrimitive()){
   f.setAccessible(true);const receiver=f.get(null);if(receiver){value=parse(receiver.getClass(),receiver,false);if(value)return value;}}
  throw Error('Native URL parser not found');
 }
 function headerObject(){
  const cls=Java.use('okhttp3.Headers').class;
  const array=ReflectArray.newInstance.overload('java.lang.Class','int').call(ReflectArray,J.class,4);
  ['User-Agent','Native-Original','Cookie','FixtureOnly'].forEach((v,i)=>ReflectArray.set(array,i,J.$new(v)));
  const ctor=cls.getDeclaredConstructor(Java.array('java.lang.Class',[Java.use('[Ljava.lang.String;').class]));ctor.setAccessible(true);
  return ctor.newInstance(Java.array('java.lang.Object',[array]));
 }
 function header(headers,name){
  const pairs=field(headers.getClass(),'namesAndValues').get(headers);
  for(let i=0;i<ReflectArray.getLength(pairs);i+=2)if(text(ReflectArray.get(pairs,i)).toLowerCase()===name.toLowerCase())return text(ReflectArray.get(pairs,i+1));return null;
 }
 function request(url,method,headers){
  const cls=Java.use(profile.request).class,urlObj=parseUrl(url);
  // Prefer the native Builder constructor; convenience POST constructors may
  // reject an intentionally body-less offline fixture before reaching headers.
  const constructors=Array.from(cls.getDeclaredConstructors()).sort((a,b)=>a.getParameterTypes().length-b.getParameterTypes().length);
  for(const ctor of constructors){
   const params=ctor.getParameterTypes();ctor.setAccessible(true);
   if(params.some(p=>p.isPrimitive()))continue;
   if(params.some(p=>String(p.getName())==='okhttp3.Headers')){
    const args=params.map(p=>String(p.getName())===profile.url?urlObj:p.equals(J.class)?J.$new(method):String(p.getName())==='okhttp3.Headers'?headers:String(p.getName())==='java.util.Map'?Java.use('java.util.Collections').emptyMap():null);
    return ctor.newInstance(Java.array('java.lang.Object',args));
   }
   if(params.length===1){
    const type=params[0],empty=type.getDeclaredConstructor(noClasses);empty.setAccessible(true);const builder=empty.newInstance(noArgs);
    for(const f of type.getDeclaredFields()){
     if(Modifier.isStatic(f.getModifiers()))continue;f.setAccessible(true);
     if(String(f.getType().getName())===profile.url)f.set(builder,urlObj);
     else if(f.getType().equals(J.class))f.set(builder,J.$new(method));
     else if(f.getType().getName().startsWith('okhttp3.Headers$')){
      for(const convert of headers.getClass().getDeclaredMethods())if(convert.getParameterTypes().length===0&&convert.getReturnType().equals(f.getType())){
       convert.setAccessible(true);f.set(builder,convert.invoke(headers,noArgs));break;}
     }
    }
    return ctor.newInstance(Java.array('java.lang.Object',[builder]));
   }
  }throw Error('Native Request constructor not found');
 }
 function requestHeader(url,method){const result=request(url,method,headerObject());return header(field(result.getClass(),profile.headers).get(result),'User-Agent');}
 try{
  prefs.edit().putBoolean('replaceUserAgent',true).putString('userAgent','Viewing-UA-Fixture').commit();
  const read='https://bbs.example.invalid/android/subject.txt',post='https://bbs.example.invalid/test/bbs.cgi';
  check(requestHeader(read,'GET')==='Viewing-UA-Fixture','native GET applies viewing UA');
  check(requestHeader(post,'POST')==='Native-Original','native posting UA unchanged');
  check(requestHeader(read,'POST')==='Native-Original','native POST to read-looking path unchanged');
  check(requestHeader('https://imgw.syoboi.jp/3/image','POST')==='Native-Original','upload UA unchanged');
  check(requestHeader('https://bbs.example.invalid/auth-code','GET')==='Native-Original','authentication UA unchanged');
  const shared=headerObject();request(read,'GET',shared);check(header(shared,'User-Agent')==='Native-Original','shared headers not mutated');
  const Fake=Java.registerClass({name:'org.haiagaru.test.ViewingUaConnection'+Date.now(),superClass:Java.use('java.net.HttpURLConnection'),methods:{
   $init:[{returnType:'void',argumentTypes:['java.net.URL'],implementation(url){this.$super.$init(url);}}],
   connect(){},disconnect(){},usingProxy(){return false;}}});
  const URL=Java.use('java.net.URL');
  const get=Fake.$new(URL.$new(read));get.setRequestProperty('User-Agent','Native-Original');P.prepare(get);
  check(text(get.getRequestProperty('User-Agent'))==='Viewing-UA-Fixture','java.net read UA applied');
  const write=Fake.$new(URL.$new(post));write.setRequestMethod('POST');P.setRequestProperty(write,'User-Agent','Native-Original');P.prepare(write);
  check(text(write.getRequestProperty('User-Agent'))==='Native-Original','java.net posting UA unchanged');
  const output=Fake.$new(URL.$new(read));output.setDoOutput(true);P.setRequestProperty(output,'User-Agent','Native-Original');P.prepare(output);
  check(text(output.getRequestProperty('User-Agent'))==='Native-Original','implicit output request unchanged');
  prefs.edit().putBoolean('replaceUserAgent',false).commit();
  check(requestHeader(read,'GET')==='Native-Original','OFF preserves native UA');
  check(text(Java.use('java.lang.System').getProperty('http.agent'))===text(before),'process-wide http.agent unchanged');
  console.log('VIEWING_UA_COMPLETE '+version+' checks='+count);
 }catch(error){console.log('FAIL '+error.stack);}finally{
  const edit=prefs.edit();if(hadFlag)edit.putBoolean('replaceUserAgent',oldFlag);else edit.remove('replaceUserAgent');
  if(hadAgent)edit.putString('userAgent',oldAgent);else edit.remove('userAgent');edit.commit();console.log('UA_PREFERENCES_RESTORED');
 }
});
