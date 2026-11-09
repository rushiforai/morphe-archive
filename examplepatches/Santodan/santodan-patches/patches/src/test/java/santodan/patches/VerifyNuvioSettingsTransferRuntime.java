package santodan.patches;

import java.net.*;
import java.nio.file.*;
import java.util.*;
import javax.tools.ToolProvider;

/** Exercises the real picker host and native action-row callbacks using Android host fixtures. */
public final class VerifyNuvioSettingsTransferRuntime {
    public static void main(String[] args) throws Exception {
        Path root = Path.of(args[1]); Files.createDirectories(root);
        Path directory = Files.createTempDirectory(root, "settings-transfer-");
        Map<String, String> sources = new LinkedHashMap<>();
        sources.put("android.os.Bundle", "package android.os; public class Bundle extends java.util.HashMap<String,Object> {public void putBoolean(String k,boolean v){put(k,v);} public boolean getBoolean(String k){return Boolean.TRUE.equals(get(k));}}");
        sources.put("android.net.Uri", "package android.net; public class Uri {}");
        sources.put("android.content.ComponentName", "package android.content; public class ComponentName {public final String name;public ComponentName(Context c,Class<?> t){name=t.getName();}}");
        sources.put("android.content.ActivityNotFoundException", "package android.content; public class ActivityNotFoundException extends RuntimeException {}");
        sources.put("android.content.pm.ApplicationInfo", "package android.content.pm; public class ApplicationInfo {public String dataDir;}");
        sources.put("android.content.pm.PackageManager", "package android.content.pm; public class PackageManager {public static boolean registered=true, missingLauncher=false; public static String lastPackage; public android.content.Intent getLeanbackLaunchIntentForPackage(String p){lastPackage=p;return missingLauncher?null:new android.content.Intent(\"launcher\");} public android.content.Intent getLaunchIntentForPackage(String p){lastPackage=p;return missingLauncher?null:new android.content.Intent(\"launcher\");} public static class NameNotFoundException extends Exception{} public Object getActivityInfo(android.content.ComponentName c,int flags)throws NameNotFoundException{if(!registered)throw new NameNotFoundException();return null;}}");
        sources.put("android.content.Intent",
            "package android.content; public class Intent {\n"
            + "    public static final String ACTION_CREATE_DOCUMENT=\"create\", ACTION_OPEN_DOCUMENT=\"open\", CATEGORY_OPENABLE=\"openable\", EXTRA_TITLE=\"title\";\n"
            + "    public static final int FLAG_ACTIVITY_NEW_TASK=1; public String action,type; public boolean exporting;public int previous;public Class<?> target;\n"
            + "    public Intent(String a){action=a;} public Intent(Context c,Class<?> t){target=t;}\n"
            + "    public Intent addCategory(String c){return this;} public Intent setType(String t){type=t;return this;}\n"
            + "    public Intent putExtra(String k,int v){previous=v;return this;} public int getIntExtra(String k,int d){return previous;} public android.content.ComponentName getComponent(){return new ComponentName(null,target==null?android.app.Activity.class:target);} public static Intent makeRestartActivityTask(ComponentName c){return new Intent(\"restart\");} public Intent putExtra(String k,String v){return this;} public Intent putExtra(String k,boolean v){exporting=v;return this;}\n"
            + "    public boolean getBooleanExtra(String k,boolean fallback){return exporting;} public Intent addFlags(int f){return this;}\n"
            + "    public android.net.Uri getData(){return new android.net.Uri();}\n"
            + "}\n");
        sources.put("android.content.DialogInterface", "package android.content; public interface DialogInterface {interface OnClickListener{void onClick(DialogInterface d,int w);} interface OnCancelListener{void onCancel(DialogInterface d);}}");
        sources.put("android.content.SharedPreferences",
            "package android.content; public class SharedPreferences {public static boolean failCommit;\n"
            + "    public final java.util.Map<String,Object> values=new java.util.HashMap<>(); public java.util.Map<String,?> getAll(){return new java.util.HashMap<>(values);}\n"
            + "    public Editor edit(){return new Editor();} public class Editor {\n"
            + "        private final java.util.Map<String,Object> updates=new java.util.HashMap<>();\n"
            + "        public Editor remove(String k){updates.put(k,null);return this;} public Editor putBoolean(String k,boolean v){updates.put(k,v);return this;}\n"
            + "        public Editor putInt(String k,int v){updates.put(k,v);return this;} public Editor putLong(String k,long v){updates.put(k,v);return this;}\n"
            + "        public Editor putString(String k,String v){updates.put(k,v);return this;} public Editor putStringSet(String k,java.util.Set<String> v){updates.put(k,new java.util.HashSet<>(v));return this;}\n"
            + "        public boolean commit(){updates.forEach((k,v)->{if(v==null)values.remove(k);else values.put(k,v);});return !failCommit;}\n"
            + "    }\n"
            + "}\n");
        sources.put("android.content.ContentResolver", "package android.content; public class ContentResolver {public static java.util.concurrent.CountDownLatch gate,started;public static byte[] input; public static java.io.ByteArrayOutputStream output; public java.io.InputStream openInputStream(android.net.Uri u){return new java.io.ByteArrayInputStream(input);} public java.io.OutputStream openOutputStream(android.net.Uri u,String mode){if(!mode.equals(\"wt\"))throw new AssertionError();if(gate!=null){started.countDown();try{gate.await(5,java.util.concurrent.TimeUnit.SECONDS);}catch(InterruptedException e){throw new RuntimeException(e);}}return output=new java.io.ByteArrayOutputStream();}}");
        sources.put("android.content.Context",
            "package android.content; public class Context {\n"
            + "    public static final java.util.Map<String,SharedPreferences> prefs=new java.util.HashMap<>(); public static Intent started; public static final String ACTIVITY_SERVICE=\"activity\"; public Object getSystemService(String name){return new android.app.ActivityManager();}\n"
            + "    public SharedPreferences getSharedPreferences(String name,int mode){return prefs.computeIfAbsent(name,k->new SharedPreferences());}\n"
            + "    public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}\n"
            + "    public android.content.pm.ApplicationInfo getApplicationInfo(){var i=new android.content.pm.ApplicationInfo();i.dataDir=System.getProperty(\"fixture.data\");return i;}\n"
            + "    public Context getApplicationContext(){return new android.app.Application();} public String getPackageName(){return \"com.nuviotv.santodan\";} public ContentResolver getContentResolver(){return new ContentResolver();} public void startActivity(Intent i){started=i;}\n"
            + "}\n");
        sources.put("android.app.ActivityManager", "package android.app;public class ActivityManager {public static class RunningAppProcessInfo {public int pid;public String processName;}public java.util.List<RunningAppProcessInfo> getRunningAppProcesses(){var p=new RunningAppProcessInfo();p.pid=android.os.Process.myPid();p.processName=\"com.nuviotv.santodan\"+(p.pid==200?\":santodan_restart\":\"\");return java.util.List.of(p);}}");
        sources.put("android.app.Application", "package android.app; public class Application extends android.content.Context {}");
        sources.put("android.app.ActivityThread", "package android.app; public class ActivityThread {public static Application currentApplication(){return new Application();}}");
        sources.put("android.widget.TextView", "package android.widget; public class TextView {public volatile String text;public TextView(android.content.Context c){} public void setTextSize(int v){} public void setPadding(int a,int b,int c,int d){} public void setText(String s){text=s;}}");
        sources.put("android.app.Activity",
            "package android.app; import android.content.*; public class Activity extends Context {\n"
            + "    public static final int RESULT_OK=-1; public Intent intent=new Intent(\"host\"),picker; public int request; public boolean finished;\n"
            + "    public static boolean missingPicker; public void onCreate(android.os.Bundle b){} public void onSaveInstanceState(android.os.Bundle b){}\n"
            + "    protected void onActivityResult(int r,int s,Intent i){} public Intent getIntent(){return intent;} public void setContentView(Object v){}\n"
            + "    public void startActivityForResult(Intent i,int r){if(missingPicker)throw new ActivityNotFoundException();picker=i;request=r;}\n"
            + "    public void runOnUiThread(Runnable r){r.run();} public boolean isFinishing(){return finished;} public boolean isDestroyed(){return false;}\n"
            + "    public void finish(){finished=true;}\n"
            + "}\n");
        sources.put("android.app.AlertDialog",
            "package android.app; import android.content.*; public class AlertDialog {\n"
            + "    public static volatile Builder shown; public static class Builder {\n"
            + "        public String message,title; public DialogInterface.OnClickListener positive,negative; public DialogInterface.OnCancelListener cancel;\n"
            + "        public Builder(Context c){} public Builder setTitle(String v){title=v;return this;} public Builder setMessage(String v){message=v;return this;}\n"
            + "        public Builder setPositiveButton(String s,DialogInterface.OnClickListener c){positive=c;return this;}\n"
            + "        public Builder setNegativeButton(String s,DialogInterface.OnClickListener c){negative=c;return this;}\n"
            + "        public Builder setOnCancelListener(DialogInterface.OnCancelListener c){cancel=c;return this;} public AlertDialog show(){shown=this;return new AlertDialog();}\n"
            + "    }\n"
            + "}\n");
        sources.put("w1.q", "package w1; public interface q {}");
        sources.put("j2.e", "package j2; public class e {}");
        sources.put("g1.n", "package g1; public class n {public int depth;public void d0(int key){depth++;}public void p(boolean ignored){if(--depth<0)throw new AssertionError();}}");
        sources.put("gb.hd",
            "package gb; import kotlin.jvm.functions.Function0; public class hd {\n"
            + "    public static final java.util.List<Function0> actions=new java.util.ArrayList<>(); public static final java.util.Map<String,Function0> buttons=new java.util.LinkedHashMap<>(); public static void d(String title,Function0 click,boolean primary,boolean enabled,g1.n co,int flags,int defaults){if(!enabled)throw new AssertionError();buttons.put(title,click);} public static void e(Object align,q1.t content,g1.n co,int flags,int defaults){if(defaults!=1)throw new AssertionError();content.render(co);}\n"
            + "    public static void a(String title,String description,String selected,Function0 click,w1.q modifier,Function0 info,boolean enabled,j2.e a,j2.e b,long c,j2.e d,Integer e,float f,long g,g1.n composer,int h,int i,int mask){\n"
            + "        if(info==null||mask!=16336||!enabled)throw new AssertionError(\"Native row defaults\");actions.add(click);\n"
            + "    }\n"
            + "}\n");
        sources.put("g1.r1", "package g1;public class r1 {public static Runnable onChange;private Object value;public r1(Object v){value=v;}public Object getValue(){return value;}public void setValue(Object v){value=v;if(onChange!=null)onChange.run();}}");
        sources.put("g1.h", "package g1;public class h {public static r1 s(Object value){return new r1(value);}}");
        sources.put("q1.t", "package q1;public class t {final Object content;public t(int key,Object c,boolean tracked){content=c;}public void render(Object co){((kotlin.jvm.functions.Function3)content).invoke(null,co,0);}}");
        sources.put("na.f2", "package na;import kotlin.jvm.functions.*;public class f2 {public static String title,message;public static Function0 dismiss;public static void B(Function0 d,String t,String m,float w,int a,boolean b,boolean c,Object brush,Object border,float e,float f,float g,float h,Object background,q1.t content,g1.n co,int i,int j,int defaults){if(w!=700f||defaults!=16336)throw new AssertionError();title=t;message=m;dismiss=d;gb.hd.buttons.clear();content.render(co);}}");
        sources.put("android.os.Process", "package android.os;public class Process {public static int pid=100;public static java.util.List<Integer> killed=new java.util.ArrayList<>();public static int myPid(){return pid;}public static void killProcess(int p){killed.add(p);}}");
        sources.put("fixture.Run",
            "package fixture;\n"
            + "import android.app.*; import android.content.*; import java.util.*;\n"
            + "import software.santodan.extension.nuviomenu.*;\n"
            + "public class Run {\n"
            + " static final String S=\"santodan_current_stream\";\n"
            + " static final g1.n composer=new g1.n();\n"
            + " static void check(boolean v){if(!v)throw new AssertionError();}\n"
            + " static void render()throws Exception{SettingsTransferActivity.renderSettings(composer);check(composer.depth==0);}\n"
            + " static void waitWork()throws Exception{\n"
            + "  for(int n=0;n<100;n++){Thread t=Thread.getAllStackTraces().keySet().stream().filter(x->x.getName().equals(\"SantodanSettingsTransfer\")).findFirst().orElse(null);if(t==null)return;t.join(100);}\n"
            + "  throw new AssertionError(\"Worker did not finish\");\n"
            + " }\n"
            + " static void result(SettingsTransferActivity host,int result,Intent i)throws Exception{var m=SettingsTransferActivity.class.getDeclaredMethod(\"onActivityResult\",int.class,int.class,Intent.class);m.setAccessible(true);m.invoke(host,host.request,result,i);}\n"
            + " static SettingsTransferActivity host(boolean exporting){var h=new SettingsTransferActivity();h.intent.putExtra(\"export\",exporting);h.onCreate(null);return h;}\n"
            + " public static void run()throws Exception{\n"
            + "  java.nio.file.Path data=java.nio.file.Files.createTempDirectory(\"settings-host-\");System.setProperty(\"fixture.data\",data.toString());\n"
            + "  var dir=java.nio.file.Files.createDirectory(data.resolve(\"shared_prefs\"));java.nio.file.Files.createFile(dir.resolve(\"santodan_preferred_addon_7.xml\"));\n"
            + "  new Application().getSharedPreferences(\"santodan_preferred_addon_7\",0).values.put(\"addon\",\"https://example.test/addon\");\n"
            + "  render();check(gb.hd.actions.size()==2);gb.hd.actions.get(0).invoke();check(Context.started.exporting);gb.hd.actions.get(1).invoke();check(!Context.started.exporting);\n"
            + "  var export=host(true);check(export.picker.action.equals(Intent.ACTION_CREATE_DOCUMENT));check(export.picker.type.equals(\"application/json\"));\n"
            + "  export.getSharedPreferences(S,0).values.put(\"enabled\",true);ContentResolver.gate=new java.util.concurrent.CountDownLatch(1);ContentResolver.started=new java.util.concurrent.CountDownLatch(1);result(export,Activity.RESULT_OK,new Intent(\"result\"));check(ContentResolver.started.await(5,java.util.concurrent.TimeUnit.SECONDS));render();check(na.f2.message.contains(\"Transferring\")&&gb.hd.buttons.isEmpty());na.f2.dismiss.invoke();render();check(gb.hd.buttons.isEmpty());ContentResolver.gate.countDown();waitWork();ContentResolver.gate=null;render();\n"
            + "  check(na.f2.message.contains(\"exported\"));check(gb.hd.buttons.containsKey(\"OK\"));gb.hd.buttons.get(\"OK\").invoke();\n"
            + "  String json=ContentResolver.output.toString(\"UTF-8\");check(PatchSettingsBackup.decode(json).get(S).get(\"enabled\").equals(true));\n"
            + "  check(PatchSettingsBackup.decode(json).get(\"santodan_preferred_addon_7\").get(\"addon\").equals(\"https://example.test/addon\"));\n"
            + "  export.getSharedPreferences(S,0).values.put(\"enabled\",false);export.getSharedPreferences(S,0).values.put(\"cache\",\"keep\");\n"
            + "  ContentResolver.input=json.getBytes(java.nio.charset.StandardCharsets.UTF_8);\n"
            + "  var canceled=host(false);result(canceled,Activity.RESULT_OK,new Intent(\"result\"));waitWork();render();check(na.f2.title.equals(\"Import patch settings?\"));\n"
            + "  check(canceled.getSharedPreferences(S,0).values.get(\"enabled\").equals(false));gb.hd.buttons.get(\"Cancel\").invoke();check(canceled.getSharedPreferences(S,0).values.get(\"enabled\").equals(false));\n"
            + "  var confirmed=host(false);result(confirmed,Activity.RESULT_OK,new Intent(\"result\"));waitWork();render();var importAction=gb.hd.buttons.get(\"Import\");importAction.invoke();waitWork();render();\n"
            + "  check(confirmed.getSharedPreferences(S,0).values.get(\"enabled\").equals(true));check(confirmed.getSharedPreferences(S,0).values.get(\"cache\").equals(\"keep\"));\n"
            + "  check(gb.hd.buttons.keySet().equals(new LinkedHashSet<>(List.of(\"Restart NuvioTV\",\"Later\"))));importAction.invoke();waitWork();render();check(gb.hd.buttons.containsKey(\"Restart NuvioTV\"));\n"
            + "  var oldIntent=Context.started;gb.hd.buttons.get(\"Later\").invoke();check(Context.started==oldIntent);check(android.os.Process.killed.isEmpty());\n"
            + "  // Confirm synchronously while the reader is still publishing its result.\n"
            + "  g1.r1.onChange=()->{try{render();if(\"Import patch settings?\".equals(na.f2.title)){g1.r1.onChange=null;gb.hd.buttons.get(\"Import\").invoke();}}catch(Exception error){throw new RuntimeException(error);}};\n"
            + "  var immediate=host(false);result(immediate,Activity.RESULT_OK,new Intent(\"result\"));waitWork();render();check(na.f2.title.equals(\"Patch settings imported\"));gb.hd.buttons.get(\"Later\").invoke();\n"
            + "  // Repeat the real confirmation flow, then request a full process restart.\n"
            + "  confirmed=host(false);result(confirmed,Activity.RESULT_OK,new Intent(\"result\"));waitWork();render();gb.hd.buttons.get(\"Import\").invoke();waitWork();render();\n"
            + "  gb.hd.buttons.get(\"Restart NuvioTV\").invoke();check(Context.started.target==SettingsRestartActivity.class);check(Context.started.previous==100);\n"
            + "  check(android.content.pm.PackageManager.lastPackage.equals(\"com.nuviotv.santodan\"));check(android.os.Process.killed.isEmpty());check(!SettingsRestartActivity.isRestartProcess(new Application()));\n"
            + "  android.os.Process.pid=200;check(SettingsRestartActivity.isRestartProcess(new Application()));var helper=new SettingsRestartActivity();helper.intent=Context.started;helper.onCreate(null);\n"
            + "  check(android.os.Process.killed.equals(List.of(100)));check(Context.started.action.equals(\"restart\"));check(helper.finished);android.os.Process.pid=100;\n"
            + "  // A failed save never offers Restart; a missing launcher does not kill the running app.\n"
            + "  ContentResolver.input=json.getBytes(java.nio.charset.StandardCharsets.UTF_8);var failed=host(false);result(failed,Activity.RESULT_OK,new Intent(\"result\"));waitWork();render();SharedPreferences.failCommit=true;gb.hd.buttons.get(\"Import\").invoke();waitWork();SharedPreferences.failCommit=false;render();check(na.f2.message.contains(\"Cannot save patch settings\")&&!gb.hd.buttons.containsKey(\"Restart NuvioTV\"));gb.hd.buttons.get(\"OK\").invoke();\n"
            + "  var noLauncher=host(false);result(noLauncher,Activity.RESULT_OK,new Intent(\"result\"));waitWork();render();gb.hd.buttons.get(\"Import\").invoke();waitWork();render();android.content.pm.PackageManager.missingLauncher=true;var previousLaunch=Context.started;gb.hd.buttons.get(\"Restart NuvioTV\").invoke();render();check(Context.started==previousLaunch&&na.f2.message.contains(\"launcher is unavailable\"));gb.hd.buttons.get(\"OK\").invoke();android.content.pm.PackageManager.missingLauncher=false;\n"
            + "  ContentResolver.input=\"{}\".getBytes();var invalid=host(false);result(invalid,Activity.RESULT_OK,new Intent(\"result\"));waitWork();render();check(na.f2.message.startsWith(\"Settings transfer failed:\"));gb.hd.buttons.get(\"OK\").invoke();\n"
            + "  ContentResolver.input=new byte[PatchSettingsBackup.MAX_BYTES+1];var oversized=host(false);result(oversized,Activity.RESULT_OK,new Intent(\"result\"));waitWork();render();check(na.f2.message.contains(\"larger than 1 MiB\"));gb.hd.buttons.get(\"OK\").invoke();\n"
            + "  var pickerCancel=host(false);result(pickerCancel,0,null);check(pickerCancel.finished);\n"
            + "  Activity.missingPicker=true;host(false);render();check(na.f2.message.contains(\"No file picker\"));gb.hd.buttons.get(\"OK\").invoke();Activity.missingPicker=false;\n"
            + "  var pending=host(false);var saved=new android.os.Bundle();pending.onSaveInstanceState(saved);var recreated=new SettingsTransferActivity();recreated.onCreate(saved);check(recreated.picker==null);\n"
            + "  saved.putBoolean(\"pickerPending\",false);recreated=new SettingsTransferActivity();recreated.onCreate(saved);render();check(na.f2.message.contains(\"recreated\"));gb.hd.buttons.get(\"OK\").invoke();\n"
            + "  check(AlertDialog.shown==null);\n"
            + "  var available=SettingsTransferActivity.class.getDeclaredField(\"available\");available.setAccessible(true);available.set(null,null);\n"
            + "  android.content.pm.PackageManager.registered=false;gb.hd.actions.clear();render();check(gb.hd.actions.isEmpty());\n"
            + "  System.out.println(\"PASS: native themed transfer confirmation/results/errors, Cancel/Later/Restart, committed settings, process restart and missing-picker handling; no platform dialogs\");\n"
            + " }\n"
            + "}");
        List<String> compile = new ArrayList<>(List.of("-classpath", System.getProperty("java.class.path"), "-d", directory.toString()));
        for (var source : sources.entrySet()) {
            Path file = directory.resolve(source.getKey().replace('.', '/') + ".java");
            Files.createDirectories(file.getParent()); Files.writeString(file, source.getValue()); compile.add(file.toString());
        }
        compile.add(args[0]);
        compile.add(Path.of(args[0]).resolveSibling("SettingsTransferUi.java").toString());
        compile.add(Path.of(args[0]).resolveSibling("SettingsRestartActivity.java").toString());
        if (ToolProvider.getSystemJavaCompiler().run(null, null, null, compile.toArray(String[]::new)) != 0)
            throw new AssertionError("Transfer fixture compilation failed");
        List<URL> urls = new ArrayList<>(); urls.add(directory.toUri().toURL());
        for (String entry : System.getProperty("java.class.path").split(java.util.regex.Pattern.quote(java.io.File.pathSeparator)))
            urls.add(Path.of(entry).toUri().toURL());
        try (URLClassLoader loader = new URLClassLoader(urls.toArray(URL[]::new), ClassLoader.getPlatformClassLoader())) {
            loader.loadClass("fixture.Run").getMethod("run").invoke(null);
        }
    }
}
