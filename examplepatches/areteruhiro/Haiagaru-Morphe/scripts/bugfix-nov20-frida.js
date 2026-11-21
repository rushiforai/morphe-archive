/* Runtime checks for charset choice, touching URLs, HOME menu dispatch, heading color and history-row removal. */
rpc.exports={run(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(!/[.]reporter(191|226|242)$/.test(pkg)){reject('isolated reporter app required');return;}
 const loader=app.getClassLoader(),N=Java.ClassFactory.get(loader).use('app.morphe.extension.chmate.NotificationDatText'),U=Java.ClassFactory.get(loader).use('app.morphe.extension.chmate.PreviewUrls'),H=Java.ClassFactory.get(loader).use('app.morphe.extension.chmate.HomeThreadOrder'),D=Java.ClassFactory.get(loader).use('app.morphe.extension.chmate.DisplayNames'),Drop=Java.ClassFactory.get(loader).use('app.morphe.extension.chmate.HiddenDroppedThreads');
 const checks=[];function check(v,s){if(!v)throw Error(s);checks.push(s);console.log('PASS '+s);}
 try{
  const text='返信です。日本語の通知本文です。';
  for(const charset of ['UTF-8','MS932','EUC-JP']){
   const bytes=Java.use('java.lang.String').$new(text).getBytes(charset);
   const decoded=String(N.decode(bytes,charset));check(decoded===text,'notification DAT decoded as '+charset);
  }
  const extract=U.extract.overload('java.lang.CharSequence','int'),JString=Java.use('java.lang.String');
  const touching=Java.cast(extract.call(U,JString.$new('本文はこちらhttps://example.org/reply'),8),Java.use('java.util.List'));
  check(touching.size()===1&&String(touching.get(0))==='https://example.org/reply','link after Japanese text is extracted');
  check(extract.call(U,JString.$new('xhttps://example.org/reply'),8).isEmpty(),'ASCII word-embedded URL stays excluded');
  if(pkg.endsWith('reporter191')){
   const rows=Java.use('java.util.ArrayList').$new(),rowClass=loader.loadClass('o.onAdDisplayed$setIcon'),unsafeClass=Java.use('sun.misc.Unsafe'),unsafeField=unsafeClass.class.getDeclaredField('theUnsafe');unsafeField.setAccessible(true);const unsafe=Java.cast(unsafeField.get(null),unsafeClass),idField=rowClass.getDeclaredField('h');idField.setAccessible(true);
   const match=unsafe.allocateInstance(rowClass),keep=unsafe.allocateInstance(rowClass);idField.setLong(match,12345);idField.setLong(keep,67890);rows.add(match);rows.add(keep);
   const removed=Number(Drop.removeHistoryRows.overload('java.util.List','java.lang.String','long').call(Drop,rows,null,12345));
   check(removed===1&&rows.size()===1&&String(idField.getLong(rows.get(0)))==='67890','deleted history row is removed while unrelated row remains');
  }
  let activity;Java.choose('jp.syoboi.a2chMate.activity.HomeActivity',{onMatch(a){if(!activity&&!a.isFinishing())activity=Java.retain(a);},onComplete(){}});
  if(activity){const show=D.showKeywords.overload('android.app.Activity');let menuCalls=0;show.implementation=function(a){menuCalls++;};const handled=H.click.overload('java.lang.Object','int').call(H,activity,0x48690139);check(Boolean(handled)&&menuCalls===1,'HOME keyword-name menu reaches its action dispatcher');show.implementation=null;}
  else console.log('SKIP menu dispatch Activity unavailable while device is on keyguard');
  console.log('SETTINGS_CONTEXT_START');const context=Java.use('android.view.ContextThemeWrapper').$new(app,app.getTheme());console.log('SETTINGS_CONTEXT_OK');const root=Java.use('android.widget.LinearLayout').$new(context);root.setOrientation(1);
  const Sections=Java.ClassFactory.get(loader).use('app.morphe.extension.chmate.SettingsSections'),Category=Java.ClassFactory.get(loader).use('app.morphe.extension.chmate.SettingsSections$Category'),nav=Sections.$new(root,false),values=Category.values();
  for(let i=0;i<values.length;i++){nav.begin(values[i]);const label=Java.use('android.widget.TextView').$new(context);label.setText(Java.use('java.lang.String').$new('fixture'));root.addView(label);}
  console.log('SETTINGS_BUILD_START');nav.finish();console.log('SETTINGS_BUILD_OK');const sectionsField=Sections.class.getDeclaredField('sections');sectionsField.setAccessible(true);const sections=Java.cast(sectionsField.get(nav),Java.use('java.util.Map')).values().iterator();let categoryCount=0;
  const Foreground=Java.use('android.text.style.ForegroundColorSpan');
  while(sections.hasNext()){const section=sections.next(),cardField=section.getClass().getDeclaredField('card');cardField.setAccessible(true);const card=Java.cast(cardField.get(section),Java.use('android.widget.TextView')),value=card.getText(),spanned=Java.cast(value,Java.use('android.text.Spanned')),spans=spanned.getSpans(0,value.length(),Foreground.class);let heading=false;
   for(let i=0;i<spans.length;i++){const span=Java.cast(spans[i],Foreground);if(spanned.getSpanStart(span)===0&&spanned.getSpanEnd(span)>0){heading=true;check(span.getForegroundColor()!==0xffffffff,'category heading uses accent color');break;}}
   check(heading,'category heading has explicit accent span');categoryCount++;
  }
  check(categoryCount===values.length,'every settings category has consistent heading color');
  resolve({package:pkg,checks});
 }catch(e){console.log('BUGFIX_FAILURE '+String(e.stack||e));reject(String(e.stack||e));}
}));}};
