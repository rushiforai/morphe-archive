package app.haiagaru.tests.backupng;

import android.app.*;import android.content.*;import android.os.*;import java.io.*;import java.lang.reflect.*;import java.util.*;import java.util.zip.*;

/** Dedicated preference namespaces and cache files; never restore into user settings. */
public final class CanonicalBackupNgInstrumentation extends Instrumentation {
 private int checks;private Context app;private ClassLoader loader;private File root;private FixtureApplication fixture;
 private volatile Activity resumed;
 @Override public void callActivityOnResume(Activity activity){super.callActivityOnResume(activity);resumed=activity;}
 private <T>T ui(java.util.concurrent.Callable<T> task)throws Exception{java.util.concurrent.FutureTask<T> future=new java.util.concurrent.FutureTask<>(task);runOnMainSync(future);return future.get(10,java.util.concurrent.TimeUnit.SECONDS);}
 private static final String ORIGINAL="jp.co.airfront.android.a2chMate_preferences";
 private void ok(boolean value,String label){checks++;if(!value)throw new AssertionError(label);}
 private Method method(Class<?> c,String name,Class<?>...types)throws Exception{Method m=c.getDeclaredMethod(name,types);m.setAccessible(true);return m;}
 public static final class FixtureApplication extends Application {
  Context base;String prefix;final Set<String> stores=new HashSet<>();
  @Override public String getPackageName(){return base.getPackageName();}
  @Override public SharedPreferences getSharedPreferences(String name,int mode){stores.add(prefix+name);return base.getSharedPreferences(prefix+name,mode);}
 }
 private void write(File file,String text)throws Exception{file.getParentFile().mkdirs();try(OutputStream out=new FileOutputStream(file)){out.write(text.getBytes("UTF-8"));}}
 private void backup()throws Exception{
  Class<?> helper=loader.loadClass("app.morphe.extension.chmate.NativeBackupPreferences");fixture=new FixtureApplication();fixture.base=app;fixture.prefix="haiagaru.tests.backup."+System.nanoTime()+".";
  root=new File(app.getCacheDir(),fixture.prefix);String pkg=app.getPackageName();File physical=new File(new File(root,pkg),"shared_prefs"),runtime=new File(physical,pkg+"_preferences.xml");
  write(runtime,"<map><string name=\"test-marker\">canonical</string><int name=\"test-number\" value=\"42\"/></map>");
  File source=(File)method(helper,"exportFile",File.class,String.class).invoke(null,physical,ORIGINAL+".xml");ok(source.equals(runtime),"export reads actual renamed-package XML");
  File staging=new File(root,"prefs"),canonical=(File)method(helper,"exportFile",File.class,String.class).invoke(null,staging,ORIGINAL+".xml");ok(canonical.getName().equals(ORIGINAL+".xml"),"export staging uses canonical original filename");staging.mkdirs();try(InputStream in=new FileInputStream(source);OutputStream out=new FileOutputStream(canonical)){byte[] buffer=new byte[4096];int n;while((n=in.read(buffer))!=-1)out.write(buffer,0,n);}
  File zip=new File(root,"fixture.zip");try(ZipOutputStream out=new ZipOutputStream(new FileOutputStream(zip))){out.putNextEntry(new ZipEntry("prefs/"+canonical.getName()));try(InputStream in=new FileInputStream(canonical)){byte[] b=new byte[4096];int n;while((n=in.read(b))!=-1)out.write(b,0,n);}out.closeEntry();}
  try(ZipFile archive=new ZipFile(zip)){ok(archive.size()==1&&archive.getEntry("prefs/"+ORIGINAL+".xml")!=null,"ZIP contains only the common canonical preference entry");}
  SharedPreferences prefs=(SharedPreferences)method(helper,"preferences",Context.class,String.class,int.class).invoke(null,fixture,ORIGINAL,0);
  ok(fixture.stores.contains(fixture.prefix+pkg+"_preferences"),"restore maps canonical reference to active runtime store");
  boolean legacy=pkg.endsWith("191");
  if(!legacy){
   Class<?> type=loader.loadClass(pkg.endsWith("226")?"o.getUtf8":"jp.syoboi.a2chMate.feature.backupandrestore.BackupPreviewViewModel");Class<?> unsafeType=Class.forName("sun.misc.Unsafe");Field singleton=null;for(Field f:unsafeType.getDeclaredFields())if(Modifier.isStatic(f.getModifiers())&&f.getType()==unsafeType){singleton=f;break;}singleton.setAccessible(true);Object unsafe=singleton.get(null),model=unsafeType.getMethod("allocateInstance",Class.class).invoke(unsafe,type);
   for(Field f:type.getDeclaredFields())if(f.getType()==Application.class){f.setAccessible(true);f.set(model,fixture);}
   Method restore=method(type,"e",type,File.class);restore.invoke(null,model,staging);
   ok(prefs.getString("test-marker","").equals("canonical")&&prefs.getInt("test-number",0)==42,"native XML restore writes renamed-package store");
   File old=new File(staging,pkg+"_preferences.xml");write(old,"<map><string name=\"test-marker\">legacy</string></map>");restore.invoke(null,model,staging);ok(prefs.getString("test-marker","").equals("canonical"),"native restore prefers canonical name if both exist");
   ok(canonical.delete(),"only fixture canonical XML removed");restore.invoke(null,model,staging);ok(prefs.getString("test-marker","").equals("legacy"),"native restore accepts same-package historical backup name");
  }else{ok(((File)method(helper,"restoreFile",File.class,String.class).invoke(null,staging,ORIGINAL+".xml")).equals(canonical),"191 canonical restore path resolves without running its full data-restoration worker");}
  ok(runtime.exists(),"runtime source file was neither renamed nor deleted");
 }
 private void regex()throws Exception{
  Class<?> rules=loader.loadClass("app.morphe.extension.chmate.SharedNgRules$Rule");Constructor<?> ctor=rules.getDeclaredConstructor(String.class,String.class,String.class,String.class,String.class,int.class,boolean.class,int.class,int.class,boolean.class);ctor.setAccessible(true);
  String expression="左のネ|([チョンパヨ].*){5}",text="パッケージ名を変更したパッケージのバックアップ。元のパッケージ名と変更後のパッケージ名、別のパッケージ名を共通にする。";
  ok(java.util.regex.Pattern.compile(expression).matcher(text).find(),"reported false-positive regex is reproduced");
  Object rule=ctor.newInstance(String.join("",Collections.nCopies(64,"a")),"*","keyword",expression,"",1,false,1,1,true);
  ok(!(Boolean)method(rules,"expressionMatches",String.class).invoke(rule,text),"shared broad-regex rule does not hide backup discussion");
  Field flag=rules.getDeclaredField("overbroadKeyword");flag.setAccessible(true);ok(flag.getBoolean(rule),"UI can explain why automatic application was skipped");
  Class<?> index=loader.loadClass("app.morphe.extension.chmate.SharedNgIndex");Constructor<?> make=index.getDeclaredConstructor(List.class,int.class,Set.class,Set.class,int.class);make.setAccessible(true);Object cache=make.newInstance(Collections.singletonList(rule),1,Collections.emptySet(),Collections.emptySet(),255);
  ok(!(Boolean)method(index,"matches",String.class,String.class,String.class,String.class).invoke(cache,"5ch/all","id","name",text),"indexed native filtering uses the same skip policy");
  String live="(^|\\n)\\p{Extended_Pictographic}{6}|ゴミ|死期|ワッチョイ|ﾜｯﾁｮｲ|老害|信者|無能|ガイジ|コロコロ",post="ﾜｯﾁｮｲやIPのNGも「()」「-」や「ﾜｯﾁｮｲ」を対象外にしないと同じ事をされると思う";
  ok(java.util.regex.Pattern.compile(live).matcher(post).find(),"actual feed rule matches the fixed label on Android");
  Object liveRule=ctor.newInstance(String.join("",Collections.nCopies(64,"b")),"*","keyword",live,"",1,false,1,1,true);
  ok(!(Boolean)method(rules,"expressionMatches",String.class).invoke(liveRule,post),"actual live emoji/literal-alternative rule is skipped");
  for(String marker:new String[]{"-","\\(","\\)","ﾜｯﾁｮｲ","IP","[.:]"}){
   Object identity=ctor.newInstance(String.join("",Collections.nCopies(64,"c")),"*","name",marker,"",1,false,1,1,true);
   ok(!(Boolean)method(rules,"expressionMatches",String.class).invoke(identity,"(ﾜｯﾁｮｲ Ab12-Cd34 [192.0.2.1])"),"marker-only shared identity match ignored: "+marker);
  }
  Object real=ctor.newInstance(String.join("",Collections.nCopies(64,"d")),"*","name","192\\.0\\.2\\.1","",1,false,1,1,true);
  ok((Boolean)method(rules,"expressionMatches",String.class).invoke(real,"(ﾜｯﾁｮｲ Ab12-Cd34 [192.0.2.1])"),"real IPv4 value still matches");
 }
 private Object field(Object value,String name)throws Exception{Field f=value.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(value);}
 private void localEdits()throws Exception{
  Class<?> rules=loader.loadClass("app.morphe.extension.chmate.SharedNgRules$Rule"),edits=loader.loadClass("app.morphe.extension.chmate.SharedNgLocalEdits");
  Constructor<?> ctor=rules.getDeclaredConstructor(String.class,String.class,String.class,String.class,String.class,int.class,boolean.class,int.class,int.class,boolean.class);ctor.setAccessible(true);
  String id=String.join("",Collections.nCopies(64,"e")),other=String.join("",Collections.nCopies(64,"f")),store=fixture.prefix+"localedits";
  fixture.stores.add(store);SharedPreferences prefs=app.getSharedPreferences(store,0);Object original=ctor.newInstance(id,"*","keyword","元の配信条件","",1,false,1,1,false);
  Method save=method(edits,"save",SharedPreferences.class,rules,String.class,boolean.class),decode=method(edits,"decode",String.class),apply=method(edits,"apply",List.class,Map.class);
  save.invoke(null,prefs,original,"端末内だけの条件",false);String encoded=prefs.getString("localEditsV1","");Map<?,?> restored=(Map<?,?>)decode.invoke(null,encoded);
  ok(restored.size()==1,"local edit survives persistent JSON round trip");List<?> effective=(List<?>)apply.invoke(null,Collections.singletonList(original),restored);Object edited=effective.get(0);
  ok(field(edited,"value").equals("端末内だけの条件")&&(Boolean)field(edited,"locallyEdited"),"overlay carries edit marker");ok(field(original,"value").equals("元の配信条件"),"original feed rule remains unchanged");
  Class<?> index=loader.loadClass("app.morphe.extension.chmate.SharedNgIndex");Constructor<?> make=index.getDeclaredConstructor(List.class,int.class,Set.class,Set.class,int.class);make.setAccessible(true);Method match=method(index,"matches",String.class,String.class,String.class,String.class);
  Object cache=make.newInstance(effective,1,Collections.emptySet(),Collections.emptySet(),255);ok((Boolean)match.invoke(cache,"5ch/all","","","端末内だけの条件"),"local edited value participates in real indexed matching");ok(!(Boolean)match.invoke(cache,"5ch/all","","","元の配信条件"),"original matching value is replaced only locally");
  ok(!(Boolean)match.invoke(make.newInstance(effective,2,Collections.emptySet(),Collections.emptySet(),255),"5ch/all","","","端末内だけの条件"),"local edit preserves report threshold");
  ok(!(Boolean)match.invoke(make.newInstance(effective,1,Collections.singleton(id),Collections.emptySet(),255),"5ch/all","","","端末内だけの条件"),"local edit preserves excluded rule ID");
  Object refreshed=ctor.newInstance(id,"*","keyword","同期後の配信条件","",3,true,1,1,false);Object updated=((List<?>)apply.invoke(null,Collections.singletonList(refreshed),restored)).get(0);
  ok(field(updated,"value").equals("端末内だけの条件")&&field(updated,"votes").equals(3)&&(Boolean)field(updated,"revoked"),"sync retains local text but preserves latest votes and revocation");
  ok(!(Boolean)match.invoke(make.newInstance(Collections.singletonList(updated),1,Collections.emptySet(),Collections.emptySet(),255),"5ch/all","","","端末内だけの条件"),"revoked edited rule cannot become active");
  try{save.invoke(null,prefs,original,"broken[",true);throw new AssertionError("invalid regex accepted");}catch(InvocationTargetException expected){ok(expected.getCause() instanceof IllegalArgumentException,"invalid regex is rejected");}ok(encoded.equals(prefs.getString("localEditsV1","")),"validation failure does not overwrite saved edit");
  Object second=ctor.newInstance(other,"*","keyword","二つ目の配信条件","",1,false,1,1,false);save.invoke(null,prefs,second,"別の編集条件",false);method(edits,"reset",SharedPreferences.class,String.class).invoke(null,prefs,id);
  Map<?,?> after=(Map<?,?>)decode.invoke(null,prefs.getString("localEditsV1",""));ok(after.size()==1&&after.containsKey(other)&&!after.containsKey(id),"reset removes only the selected edit");ok(((List<?>)apply.invoke(null,Collections.singletonList(original),after)).get(0)==original,"reset resumes original feed condition");
  save.invoke(null,prefs,original,"ﾜｯﾁｮｲ",true);Object explicit=((List<?>)apply.invoke(null,Collections.singletonList(original),(Map<?,?>)decode.invoke(null,prefs.getString("localEditsV1","")))).get(0);
  ok((Boolean)method(rules,"expressionMatches",String.class).invoke(explicit,"ﾜｯﾁｮｲの説明"),"explicit local edit follows user input, independent of downloaded-rule safety policy");
  Constructor<?> full=rules.getDeclaredConstructor(String.class,String.class,String.class,String.class,String.class,int.class,boolean.class,int.class,int.class,boolean.class,List.class);full.setAccessible(true);
  String reporterA=String.join("",Collections.nCopies(64,"1")),reporterB=String.join("",Collections.nCopies(64,"2"));Object attributed=full.newInstance(id,"*","keyword","元の配信条件","",2,false,1,1,false,Arrays.asList(reporterA,reporterB));
  Class<?> policy=loader.loadClass("app.morphe.extension.chmate.SharedNgReporterPolicy");Method subtract=method(policy,"apply",List.class,Set.class);
  Map<?,?> saved=(Map<?,?>)decode.invoke(null,prefs.getString("localEditsV1","{}"));List<?> partial=(List<?>)apply.invoke(null,subtract.invoke(null,Collections.singletonList(attributed),Collections.singleton(reporterA)),saved);
  ok(partial.size()==1&&field(partial.get(0),"votes").equals(1)&&((List<?>)field(partial.get(0),"contributors")).equals(Collections.singletonList(reporterB)),"edited rule keeps only nonexcluded reporter votes");
  ok(((List<?>)apply.invoke(null,subtract.invoke(null,Collections.singletonList(attributed),new HashSet<>(Arrays.asList(reporterA,reporterB))),saved)).isEmpty(),"local edits cannot resurrect a rule whose reporters were all excluded");
  editorUi(original,rules,edits);
 }
 private android.view.View findView(android.view.View view,Class<?> type){if(type.isInstance(view))return view;if(view instanceof android.view.ViewGroup){android.view.ViewGroup group=(android.view.ViewGroup)view;for(int i=0;i<group.getChildCount();i++){android.view.View found=findView(group.getChildAt(i),type);if(found!=null)return found;}}return null;}
 private void editorUi(Object original,Class<?> ruleType,Class<?> edits)throws Exception{
  ok(resumed!=null,"foreground activity available for editor regression");Class<?> contentType=loader.loadClass("app.morphe.extension.chmate.SharedNgExceptions");
  Constructor<?> ctor=contentType.getDeclaredConstructor(Activity.class,List.class,Set.class);ctor.setAccessible(true);final android.app.AlertDialog[] parent=new android.app.AlertDialog[1],editor=new android.app.AlertDialog[1];final Object[] content=new Object[1];
  String before=app.getSharedPreferences("haiagaru.shared-ng",0).getString("localEditsV1","{}");
  try{
   ui(()->{content[0]=ctor.newInstance(resumed,Collections.singletonList(original),Collections.emptySet());parent[0]=new android.app.AlertDialog.Builder(resumed).setView((android.view.View)content[0]).create();parent[0].show();return null;});waitForIdleSync();
   ui(()->{android.widget.ListView list=(android.widget.ListView)((android.widget.LinearLayout)content[0]).getChildAt(2);ok(list.performItemClick(null,0,0),"native exception row remains toggleable");ok(list.isItemChecked(0),"exception selection is checked");ok(list.getOnItemLongClickListener()!=null,"long press editor action is installed");editor[0]=(android.app.AlertDialog)method(edits,"show",Activity.class,ruleType,Runnable.class).invoke(null,resumed,original,(Runnable)()->{});return null;});waitForIdleSync();
   ui(()->{ok(editor[0].isShowing(),"native local editor dialog is visible");android.widget.EditText input=(android.widget.EditText)findView(editor[0].getWindow().getDecorView(),android.widget.EditText.class);android.widget.CheckBox regex=(android.widget.CheckBox)findView(editor[0].getWindow().getDecorView(),android.widget.CheckBox.class);ok(input!=null&&regex!=null,"condition and regex controls exist");input.setText("broken[");regex.setChecked(true);ok(editor[0].getButton(-1).performClick(),"native save button responds");ok(editor[0].isShowing()&&input.getError()!=null,"invalid regex keeps editor open with an error");ok(before.equals(app.getSharedPreferences("haiagaru.shared-ng",0).getString("localEditsV1","{}")),"invalid editor save does not touch actual user edits");ok(editor[0].getButton(-2).performClick(),"editor cancellation returns to condition list");return null;});waitForIdleSync();ui(()->{ok(!editor[0].isShowing(),"cancel closes only editor");ok(parent[0].isShowing(),"condition list remains visible after cancel");method(contentType,"filter",String.class).invoke(content[0],"元の配信");ok(((Set<?>)method(contentType,"selection").invoke(content[0])).contains(field(original,"id")),"cancel and search preserve pending exclusions");return null;});
   android.graphics.Bitmap screenshot=getUiAutomation().takeScreenshot();if(screenshot!=null){try(FileOutputStream output=new FileOutputStream(new File(app.getExternalCacheDir(),"haiagaru-local-edit-validation.png"))){screenshot.compress(android.graphics.Bitmap.CompressFormat.PNG,100,output);}finally{screenshot.recycle();}}
  }finally{ui(()->{if(editor[0]!=null)editor[0].dismiss();if(parent[0]!=null)parent[0].dismiss();return null;});}
 }
 private void remove(File file)throws Exception{String base=root.getCanonicalPath(),path=file.getCanonicalPath();if(!path.equals(base)&&!path.startsWith(base+File.separator))throw new IOException("Fixture cleanup escaped root");if(file.isDirectory())for(File child:file.listFiles())remove(child);if(!file.delete())throw new IOException("Cannot delete fixture");}
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle result=new Bundle();int code=Activity.RESULT_CANCELED;try{app=getTargetContext();loader=app.getClassLoader();app.startActivity(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(2000);waitForIdleSync();backup();regex();localEdits();result.putString("result","PASS "+checks+" canonical backup/native restore/shared-NG/local-edit checks; user settings unchanged");code=Activity.RESULT_OK;}catch(Throwable error){result.putInt("checksCompleted",checks);result.putString("error",android.util.Log.getStackTraceString(error));}finally{try{if(fixture!=null)for(String store:fixture.stores)app.getSharedPreferences(store,0).edit().clear().commit();if(root!=null&&root.exists())remove(root);}catch(Exception error){code=Activity.RESULT_CANCELED;result.putString("cleanupError",error.toString());}}finish(code,result);}
}
