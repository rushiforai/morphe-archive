// Real Activity/Intent boundaries, not a mock router. Closes only the new test tab each time.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();
 try{Java.use('app.morphe.extension.chmate.Haiagaru');}catch(error){
  let found=false;for(const loader of Java.enumerateClassLoadersSync())try{Java.ClassFactory.get(loader).use('app.morphe.extension.chmate.Haiagaru');Java.classFactory.loader=loader;found=true;break;}catch(ignored){}
  if(!found)throw error;
 }
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),T=Java.use('app.morphe.extension.chmate.NativeToolTabs'),Intent=Java.use('android.content.Intent'),Uri=Java.use('android.net.Uri');
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
 const keys=['nativeToolTabs','nativeToolTabHissi','nativeToolTabChecker','nativeToolTabSearch','nativeToolTabWacchoi','dedicatedViewerEnabled','hissiCheckerMode'];
 const saved=keys.map(k=>({k,had:p.contains(k),value:k==='hissiCheckerMode'?p.getInt(k,0):p.getBoolean(k,false)}));
 const choices=app.getSharedPreferences('haiagaru_checker_choice',0),choiceKey='egg.5ch.io/android',hadChoice=choices.contains(choiceKey),oldChoice=choices.getBoolean(choiceKey,false);
 let host,active,checks=0;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function run(fn){Java.perform(()=>Java.scheduleOnMainThread(()=>{try{fn();}catch(e){console.log('FAIL '+e.stack);}}));}
 function find(view){if(String(view.getContentDescription())==='このタブを閉じる')return view;const G=Java.use('android.view.ViewGroup');if(G.class.isInstance(view)){const g=Java.cast(view,G);for(let i=0;i<g.getChildCount();i++){const r=find(g.getChildAt(i));if(r)return r;}}return null;}
 function launch(query,upper){
  const name=upper?'app.morphe.extension.chmate.HissiWacchoiSearchActivity':'app.morphe.extension.chmate.HissiMenuActivity';
  const i=Intent.$new(host,Java.use(name).class).putExtra('haiagaru.wacchoi.query',query).putExtra('haiagaru.wacchoi.host','egg.5ch.io').putExtra('haiagaru.wacchoi.board','android');
  if(upper)i.putExtra('app.morphe.extension.chmate.WACCHOI_HALF','upper');else i.putExtra('haiagaru.wacchoi.search',true);
  return i;
 }
 function inspect(tool,query){Java.perform(()=>Java.choose('app.morphe.extension.chmate.NativeToolFragment',{onMatch(f){const b=Java.cast(f,Java.use('androidx.fragment.app.Fragment'));if(b.isResumed()&&b.getArguments()&&String(b.getArguments().getString('_data'))==='haiagaru-tool://'+tool)active=Java.retain(b);},onComplete(){run(()=>{
  check(!!active,'entry created native '+tool+' tab');const args=active.getArguments(),state=JSON.parse(String(args.getString('android.intent.extra.TEXT'))),i=Intent.parseUri(state.launch,1);
  if(query)check(String(i.getStringExtra('haiagaru.wacchoi.query'))===query,'query preserved '+query);
  if(query)check(String(i.getStringExtra('haiagaru.wacchoi.board'))==='android','source board retained');
  const root=Java.cast(active.getView(),Java.use('android.view.ViewGroup')),header=root.getChildAt(0),content=root.getChildAt(1),close=find(root);
  check(!!close&&close.getBackground()===null,'close hit target has no background');
  check(content.getTop()>=header.getBottom()&&header.getHeight()>0,'close header does not overlap content');
  check(close.performClick(),'actual outlined close click');active=null;
 });}}));}
 run(()=>{host=Java.retain(H.toolbarActivity(null));check(host&&String(host.getClass().getName())==='jp.syoboi.a2chMate.activity.TabletHomeActivity','foreground native tablet');
  const e=p.edit();keys.forEach(k=>{if(k==='hissiCheckerMode')e.putInt(k,1);else e.putBoolean(k,true);});e.commit();
  const wrapped=Java.use('android.view.ContextThemeWrapper').$new(host,16973931);
  p.edit().putBoolean('nativeToolTabs',false).putBoolean('nativeToolTabSearch',false).commit();
  check(!T.openSearch(wrapped,launch('abcd-',true)),'individual screen OFF retains standalone path');
  p.edit().putBoolean('nativeToolTabSearch',true).commit();
  check(!T.open(host,'settings'),'master OFF retains separate settings');
  check(T.openSearch(wrapped,launch('abcd-',true)),'master OFF wrapped menu opens upper search in thread tab column');
 });
 setTimeout(()=>inspect('search','abcd-'),6000);
 setTimeout(()=>run(()=>{host.startActivity(launch('-EFGH',false));console.log('LOWER_ACTIVITY_LAUNCHED');}),9000);
 setTimeout(()=>inspect('search','-EFGH'),15000);
 setTimeout(()=>run(()=>{host.startActivity(launch('abcd-EFGH',false));console.log('FULL_ACTIVITY_LAUNCHED');}),18000);
 setTimeout(()=>inspect('wacchoi','abcd-EFGH'),26000);
 setTimeout(()=>run(()=>{const i=Intent.$new('android.intent.action.VIEW',Uri.parse('haiagaru-hissi://hissi.org/read.php/android/?haiagaru_host=egg.5ch.io&haiagaru_id=TEST'));Java.use('app.morphe.extension.chmate.HissiMenuCompatibility').prepareExternalIntent(i);host.startActivity(i);console.log('NATIVE_ID_ACTION_VIEW_LAUNCHED');}),29000);
 setTimeout(()=>inspect('hissi',null),36000);
 setTimeout(()=>run(()=>{if(active)T.closeCurrentTab(host,active);const e=p.edit();saved.forEach(s=>{if(!s.had)e.remove(s.k);else if(s.k==='hissiCheckerMode')e.putInt(s.k,s.value);else e.putBoolean(s.k,s.value);});e.commit();const restore=choices.edit();if(hadChoice)restore.putBoolean(choiceKey,oldChoice);else restore.remove(choiceKey);restore.commit();console.log('LONGPRESS_TAB_ENTRY_COMPLETE checks='+checks+' preferences restored');}),40000);
});
