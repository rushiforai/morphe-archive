rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{try{
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());if(!/\.bindings(191|226|242)$/.test(pkg))throw Error('isolated test app required');const v=pkg.slice(-3),old=v==='191',mid=v==='226';
 const builderType=old?'o.o8':mid?'o.getFlexLinesInternal':'o.ComplianceOptions',markerType=old?'o.MediationServiceImplExternalSyntheticLambda1':mid?'o.BouncyCastleSocketAdapterCompanionfactory1':'o.KeJ13';
 const Builder=Java.use(builderType),Marker=Java.use(markerType),Pattern=Java.use('java.util.regex.Pattern'),Int=Java.use('java.lang.Integer'),Span=Java.use('android.text.SpannableString'),Bg=Java.use('android.text.style.BackgroundColorSpan');
 const mark=Marker.class.getDeclaredMethods().filter(m=>{const p=m.getParameterTypes();return p.length===5&&String(p[0].getName())==='java.util.regex.Matcher'&&String(m.getReturnType().getName())==='void';});if(mark.length!==1)throw Error('native marker ambiguous');mark[0].setAccessible(true);
 const result=Builder.class.getDeclaredMethods().find(m=>m.getParameterTypes().length===0&&String(m.getReturnType().getName())==='android.text.SpannableString');result.setAccessible(true);
 const source='1 name 11/03(火) 09:34:16.87 ID:abc\n本文03と火曜日';let checks=0;const check=(ok,label)=>{if(!ok)throw Error(label);checks++;};
 for(const [query,count] of [['火',1],['03',1],['11/03',0],['09:34',0],['0[39]',1],['abc',1]]){
  const b=Builder.$new(),f=Builder.class.getDeclaredFields().find(f=>String(f.getType().getName())==='java.lang.StringBuilder');f.setAccessible(true);Java.cast(f.get(b),Java.use('java.lang.StringBuilder')).append.overload('java.lang.String').call(Java.cast(f.get(b),Java.use('java.lang.StringBuilder')),source);
  mark[0].invoke(null,Java.array('java.lang.Object',[Pattern.compile(query).matcher(Java.use('java.lang.String').$new('')),b,Int.valueOf(-256),null,Int.valueOf(-1)]));
  const text=Java.cast(result.invoke(b,Java.array('java.lang.Object',[])),Span),spans=text.getSpans(0,source.length,Bg.class);check(String(text.toString())===source,'display text unchanged');check(spans.length===count,'native span count '+query);
  if(query!=='abc')for(const span of spans)check(text.getSpanStart(span)>source.indexOf('\n'),'date not highlighted in header '+query);
 }
 resolve({ok:true,version:v,checks,realNetworkRequests:0});
}catch(e){reject(Error(String(e.stack||e)));}}));}};
