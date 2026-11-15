package app.haiagaru.tests.integrated;
import android.app.*;import android.content.*;import android.os.*;import android.view.*;import android.widget.*;
import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;

/** Isolated synthetic state and UI; no public upload/post and no ordinary-app modifications. */
public final class IntegratedFixesInstrumentation extends Instrumentation {
 Activity host;Context app;ClassLoader loader;int checks;String version;SharedPreferences prefs;Map<String,?> before;
 void ok(boolean v,String label){if(!v)throw new AssertionError(label);checks++;}
 Method method(Class<?> c,String n,Class<?>...p)throws Exception{Method m=c.getDeclaredMethod(n,p);m.setAccessible(true);return m;}
 Field field(Class<?> c,String n)throws Exception{for(;c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(n);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(n);}
 <T>T main(Callable<T> fn)throws Exception{FutureTask<T> task=new FutureTask<>(fn);runOnMainSync(task);return task.get(15,TimeUnit.SECONDS);}
 Object alloc(Class<?> c)throws Exception{Class<?> u=Class.forName("sun.misc.Unsafe");return u.getMethod("allocateInstance",Class.class).invoke(field(u,"theUnsafe").get(null),c);}
 Class<?> load(String n)throws Exception{return loader.loadClass("app.morphe.extension.chmate."+n);}
 @Override public void onCreate(Bundle b){super.onCreate(b);start();}
 @Override public void onStart(){Bundle result=new Bundle();try{test();result.putString("result","PASS "+checks+" integrated settings/selection/media checks; uploads/posts=0");finish(Activity.RESULT_OK,result);}catch(Throwable e){result.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,result);}}
 void test()throws Exception{
  app=getTargetContext();ok(app.getPackageName().matches(".*\\.reporter(191|226|242)"),"isolated only");version=app.getPackageName().substring(app.getPackageName().length()-3);loader=app.getClassLoader();prefs=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);before=new HashMap<>(prefs.getAll());
  host=startActivitySync(new Intent().setClassName(app.getPackageName(),"app.morphe.extension.chmate.ToolbarIconsActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(500);
  try{main(()->{icons();selection();media();titleOptions();homeOrder();archiveMetadata();return null;});externalEditor();}finally{main(()->{if(host!=null)host.finish();return null;});restore(prefs,before);}
 }
 void icons()throws Exception{
  LinearLayout rows=(LinearLayout)field(host.getClass(),"rows").get(host);Class<?> section=load("SettingsSection");int groups=0;
  for(int i=0;i<rows.getChildCount();i++)if(section.isInstance(rows.getChildAt(i))){ViewGroup group=(ViewGroup)rows.getChildAt(i);groups++;ok(group.getChildCount()==3,"each icon owns preview/select/reset");ok(group.getChildAt(0) instanceof ImageView&&group.getChildAt(1) instanceof Button&&group.getChildAt(2) instanceof Button,"icon group ordering");}
  ok(groups==13,"13 existing icon identities preserved");
  Class<?> links=load("PostingSettingLinks");Menu postingMenu=new PopupMenu(host,new View(host)).getMenu();
  int[] nativeIds=version.equals("191")?new int[]{0x7f080204,0x7f080275}:version.equals("226")?new int[]{0x7f09017b,0x7f0902f7}:new int[]{0x7f09017e,0x7f090301};
  // The actual native editor menu boundary is covered separately; its item identifiers vary by APK.
  prefs.edit().putBoolean("showPostingSettingLinks",false).commit();method(links,"addPostingMenu",Object.class,Menu.class).invoke(null,host,postingMenu);ok(postingMenu.findItem(0x48690134)==null,"setting links hidden when disabled/nonposting menu");
  Class<?> stock=load("StockChmatePosting");prefs.edit().remove("stockPostingAlways").commit();ok(!(Boolean)method(stock,"normalClick",Object.class,int.class).invoke(null,null,2),"always stock initial OFF");prefs.edit().putBoolean("stockPostingAlways",true).commit();ok(!(Boolean)method(stock,"normalClick",Object.class,int.class).invoke(null,null,3),"other toolbar action unchanged");
  Class<?> model=load("ModelUiKt");FrameLayout root=new FrameLayout(host);ScrollView scroll=new ScrollView(host);LinearLayout form=new LinearLayout(host);form.addView(new TextView(host));scroll.addView(form);root.addView(scroll,new FrameLayout.LayoutParams(-1,-1));
  method(model,"prepareNativeSurfaces",ViewGroup.class).invoke(null,root);ok(root.getChildAt(0)==scroll,"ordinary scroll list never mounted as native surface");
 }
 void selection()throws Exception{
  String owner=version.equals("191")?"o.r8lambdaDC40CispcBM3LVwPP01tT_FjLc":version.equals("226")?"o.setCornerTopRightRadius":"o.zzbhp";
  android.content.res.XmlResourceParser xml=host.getResources().getLayout(android.R.layout.simple_list_item_1);while(xml.next()!=org.xmlpull.v1.XmlPullParser.START_TAG){}
  TextView body=(TextView)loader.loadClass(owner).getConstructor(Context.class,android.util.AttributeSet.class).newInstance(new ContextThemeWrapper(host,android.R.style.Theme_Material),android.util.Xml.asAttributeSet(xml));xml.close();body.setText("選択対象の本文");
  Class<?> policy=load("DirectBodySelection");Method wrap=method(policy,"longClickListener",Object.class,View.OnLongClickListener.class);final int[] calls={0};View.OnLongClickListener original=v->{calls[0]++;return true;};Object listener=wrap.invoke(null,body,original);
  for(int i=0;i<10000;i++)if(listener!=wrap.invoke(null,body,listener))throw new AssertionError("listener wrapping grew");ok(true,"10000 rebinds keep one wrapper");
  prefs.edit().putBoolean("directBodySelection",false).commit();ok(((View.OnLongClickListener)listener).onLongClick(body)&&calls[0]==1,"native listener called once");
  prefs.edit().putBoolean("directBodySelection",true).commit();ok((Boolean)method(policy,"prepare",Object.class).invoke(null,body),"selection preparation succeeds without recursion");
  body.setOnLongClickListener((View.OnLongClickListener)listener);ok(!((View.OnLongClickListener)listener).onLongClick(body),"body selection bypasses native response popup");
  prefs.edit().putBoolean("directBodySelection",false).commit();ok(!(Boolean)method(policy,"prepare",Object.class).invoke(null,body),"selection OFF restores native state");
 }
 void media()throws Exception{
  prefs.edit().putInt("urlVideoFetchMode",1).putBoolean("videoPreviewFour",false).putBoolean("videoPreviewFourEnabled",false).commit();
  if(!version.equals("242"))return;
  Class<?> row=loader.loadClass("o.KeJ11"),albums=load("ImgurAlbumAttachments"),entry=load("ImgurAlbumAttachments$Entry");Object model=alloc(row);
  field(row,"h").set(model,"https://imgur.com/a/HaiagaruFixture");String url="https://i.imgur.com/HaiagaruFixture.mp4",poster="https://i.imgur.com/HaiagaruFixture.jpg";
  Map cache=(Map)field(albums,"CACHE").get(null);Object previous=cache.get("HaiagaruFixture");Constructor<?> ctor=entry.getDeclaredConstructor();ctor.setAccessible(true);Object e=ctor.newInstance();field(entry,"images").set(e,new String[]{url});cache.put("HaiagaruFixture",e);
  Map posters=(Map)field(load("XMediaAttachments"),"POSTERS").get(null);Object oldPoster=posters.put(url,poster);
  try{
   Method projection=method(row,"i");field(row,"c").set(model,new String[]{"https://imgur.com/a/HaiagaruFixture"});
   CharSequence[] initial=(CharSequence[])projection.invoke(model);ok(initial.length>0,"cached native URL branch expands album");
   String[] first=(String[])field(row,"c").get(model);ok(Arrays.asList(first).contains(url),"resolved video URL cached");
   for(int i=0;i<30;i++){field(row,"z").set(model,null);CharSequence[] value=(CharSequence[])projection.invoke(model);ok(value.length==initial.length,"cached projection survives refresh "+i);}
  }finally{if(previous==null)cache.remove("HaiagaruFixture");else cache.put("HaiagaruFixture",previous);if(oldPoster==null)posters.remove(url);else posters.put(url,oldPoster);}
 }
 public static final class TitleFixture {
 final Activity activity;final Bundle args=new Bundle();TitleFixture(Activity a,Object url){activity=a;args.putSerializable("unused","fixture");args.putParcelable("threadUrl",(android.os.Parcelable)url);}
 public Activity getActivity(){return activity;}public Bundle getArguments(){return args;}
 }
 String labels(View v){String text=v instanceof TextView?((TextView)v).getText().toString()+"|":"";if(v instanceof ViewGroup){ViewGroup group=(ViewGroup)v;for(int i=0;i<group.getChildCount();i++)text+=labels(group.getChildAt(i));}return text;}
 void titleOptions()throws Exception{
  Class<?> actions=load("ThreadTitleActions");for(String name:new String[]{"SHOW_REFRESH","SHOW_WATCH","SHOW_AUTH"}){String key=(String)field(actions,name).get(null);prefs.edit().remove(key).commit();ok((Boolean)method(load("FeatureSwitches"),"enabled",String.class,boolean.class).invoke(null,key,true),"title action default ON");prefs.edit().putBoolean(key,false).commit();ok(!(Boolean)method(load("FeatureSwitches"),"enabled",String.class,boolean.class).invoke(null,key,true),"title action independently OFF");}
  if(!version.equals("191"))return; // Modern native entries are exercised via the actual Compose menu.
  Class<?> urlType=loader.loadClass("jp.syoboi.a2chMate.client.BBSUrlInfo");Object info=version.equals("191")?urlType.getConstructor(String.class,String.class,Long.class,int.class,Integer.class,String.class).newInstance("bbs.eddibb.cc","liveedge",9999999999L,0,null,null):alloc(urlType);
  if(!version.equals("191")){field(urlType,version.equals("226")?"g":"f").set(info,"bbs.eddibb.cc");field(urlType,version.equals("226")?"f":"g").set(info,"liveedge");field(urlType,version.equals("226")?"c":"e").set(info,9999999999L);}
  TitleFixture fragment=new TitleFixture(host,info);Method content=method(actions,"content",Object.class,Activity.class,View.class);
  for(int mask=0;mask<8;mask++){prefs.edit().putBoolean("titleMenuShowRefresh",(mask&1)!=0).putBoolean("titleMenuShowWatch",(mask&2)!=0).putBoolean("titleMenuShowAuth",(mask&4)!=0).commit();ScrollView original=new ScrollView(host);LinearLayout nativeList=new LinearLayout(host);nativeList.setOrientation(LinearLayout.VERTICAL);original.addView(nativeList);LinearLayout grid=new LinearLayout(host);nativeList.addView(grid);Class<?> nativeButton=loader.loadClass("o.r8lambdaFP1taOY2C0VNHH09jrpf0HpwLqQ");for(int col=0;col<2;col++){LinearLayout column=new LinearLayout(host);column.setOrientation(LinearLayout.VERTICAL);grid.addView(column);column.addView((View)nativeButton.getConstructor(Context.class,android.util.AttributeSet.class).newInstance(host,null));}View result=(View)content.invoke(null,fragment,host,original);ok(result==original,"keeps native root and appends actions inside its scroll content");ok(nativeList.getChildCount()==1,"no footer next to native grid");String shown=labels(grid);ok(shown.contains("更新対象に含む")==((mask&1)!=0),"refresh visibility "+mask);ok(shown.contains("このスレの新着通知")==((mask&2)!=0),"watch visibility "+mask);ok(shown.contains("エッヂの閲覧認証")==((mask&4)!=0),"auth visibility "+mask);if(mask==0)ok(result==original,"all OFF preserves original root without extra controls");}
 }
 void externalEditor()throws Exception{
  Activity editor=startActivitySync(new Intent().setClassName(app.getPackageName(),"app.morphe.extension.chmate.ExternalBoardEditorActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
  try{
   for(int i=0;i<100&&(Boolean)main(()->field(editor.getClass(),"busy").get(editor));i++)Thread.sleep(50);
   main(()->{Class<?> board=load("ExternalBoardEditorActivity$Board");Constructor<?> ctor=board.getDeclaredConstructor(long.class,String.class,String.class,String.class);ctor.setAccessible(true);List loaded=(List)field(editor.getClass(),"loadedBoards").get(editor);loaded.clear();for(int i=0;i<5000;i++)loaded.add(ctor.newInstance(-1L,"fixture"+i,"fixture board "+i,"https://example.invalid/test/"));
    long start=SystemClock.uptimeMillis();method(editor.getClass(),"renderBoards").invoke(editor);ok(SystemClock.uptimeMillis()-start<1000,"5000 boards filtered within one second without eager Views");ListView list=(ListView)field(editor.getClass(),"list").get(editor);ok(list.getAdapter().getCount()==5000,"all external boards available lazily");
    EditText query=(EditText)field(editor.getClass(),"search").get(editor);query.setText("fixture board 4999");method(editor.getClass(),"renderBoards").invoke(editor);ok(list.getAdapter().getCount()==1,"large external list search");Object entry=loaded.get(4999);method(editor.getClass(),"edit",board).invoke(editor,entry);Object first=field(editor.getClass(),"editDialog").get(editor);method(editor.getClass(),"edit",board).invoke(editor,entry);ok(first==field(editor.getClass(),"editDialog").get(editor),"repeated edit retains one dialog");((android.app.Dialog)first).dismiss();ok(field(editor.getClass(),"editDialog").get(editor)==null,"cancel closes editor without saving");return null;});
  }finally{main(()->{editor.finish();return null;});}
 }
 void archiveMetadata()throws Exception{
  SharedPreferences metadata=app.getSharedPreferences("haiagaru.edge-reporters",0);String original=metadata.getString("8999999999",null);try{
   Class<?> history=load("EdgeReporterHistory");method(history,"rememberArchive",long.class,String.class,String.class).invoke(null,8999999999L,"Haiagaru archive fixture","[Abcd1234★]");
   ok("[Abcd1234★]".equals(method(history,"archiveSuffix",long.class).invoke(null,8999999999L)),"archive suffix immediately visible before async flush");
   ok(((String)history.getMethod("displayTitle",long.class,String.class).invoke(null,8999999999L,"fixture")).endsWith("[Abcd1234★]"),"archive thread identity restores reporter");
  }finally{Object writer=field(load("EdgeReporterHistory"),"writes").get(null);if(writer!=null)method(writer.getClass(),"flush").invoke(writer);if(original==null)metadata.edit().remove("8999999999").commit();else metadata.edit().putString("8999999999",original).commit();}
 }
 void homeOrder()throws Exception{
  Class<?> policy=load("HomeThreadOrder");SharedPreferences orderPrefs=app.getSharedPreferences("haiagaru.home-thread-order",0);Map<String,?> saved=new HashMap<>(orderPrefs.getAll());
  try{
   orderPrefs.edit().clear().commit();Class<?> boardClass=loader.loadClass(version.equals("191")?"jp.syoboi.a2chMate.client.BBSUrlInfo$BoardID":"jp.syoboi.a2chMate.client.BoardID");Constructor<?> bc=boardClass.getDeclaredConstructor(String.class,String.class,String.class,String.class);bc.setAccessible(true);
   Object board=bc.newInstance("example.invalid","test","http://example.invalid/test/","test");Class<?> rowClass=loader.loadClass(version.equals("191")?"o.onAdDisplayed$setIcon":version.equals("226")?"o.Yy2$open":"o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ");
   ArrayList<Object> rows=new ArrayList<>();ArrayList<String> keys=new ArrayList<>();
   for(int n=1;n<=3;n++){Object row=alloc(rowClass);field(rowClass,version.equals("191")?"g":version.equals("226")?"b":"e").set(row,board);field(rowClass,version.equals("191")?"h":version.equals("226")?"g":"b").setLong(row,n);field(rowClass,version.equals("191")?"e":version.equals("226")?"k":"m").set(row,"fixture "+n);rows.add(row);keys.add((String)method(policy,"key",Object.class).invoke(null,row));}
   Method apply=method(policy,"apply",List.class,int.class);Object owner=new Object();method(policy,"selected",Object.class,int.class).invoke(null,owner,102);
   ok(apply.invoke(null,rows,102)==rows,"default HOME keeps native list");ArrayList<String> reversed=new ArrayList<>(keys);Collections.reverse(reversed);orderPrefs.edit().putString("order:102",new org.json.JSONArray(reversed).toString()).commit();
   List<?> sorted=(List<?>)apply.invoke(null,rows,102);ok(sorted.get(0)==rows.get(2)&&sorted.get(2)==rows.get(0),"manual up/down applied");ok(rows.get(0)!=sorted.get(0),"native source unchanged");
   orderPrefs.edit().putStringSet("pins:102",new HashSet<>(Arrays.asList(keys.get(0)))).commit();sorted=(List<?>)apply.invoke(null,rows,102);ok(sorted.get(0)==rows.get(0),"pin rises above saved order");
   orderPrefs.edit().remove("pins:102").commit();method(policy,"selected",Object.class,int.class).invoke(null,owner,108);ok(apply.invoke(null,rows,108)==rows,"favorites order independent");
   method(policy,"selected",Object.class,int.class).invoke(null,owner,109);ok(apply.invoke(null,rows,109)==rows,"refresh-target order independent");
   method(policy,"selected",Object.class,int.class).invoke(null,owner,102);ok(((List<?>)apply.invoke(null,rows,102)).get(0)==rows.get(2),"switching back restores saved order");
   orderPrefs.edit().remove("order:102").commit();ok(apply.invoke(null,rows,102)==rows,"reset restores native order");ok(apply.invoke(null,rows,104)==rows,"posted list unchanged");
  }finally{restore(orderPrefs,saved);}
 }
 static void restore(SharedPreferences p,Map<String,?> all){SharedPreferences.Editor e=p.edit().clear();for(Map.Entry<String,?> r:all.entrySet()){Object v=r.getValue();String k=r.getKey();if(v instanceof Boolean)e.putBoolean(k,(Boolean)v);else if(v instanceof Integer)e.putInt(k,(Integer)v);else if(v instanceof Long)e.putLong(k,(Long)v);else if(v instanceof Float)e.putFloat(k,(Float)v);else if(v instanceof String)e.putString(k,(String)v);else if(v instanceof Set)e.putStringSet(k,(Set<String>)v);}e.commit();}
}
