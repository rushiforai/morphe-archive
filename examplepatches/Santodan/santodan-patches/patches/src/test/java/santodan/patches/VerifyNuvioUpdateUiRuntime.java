package santodan.patches;

import java.nio.file.*;
import java.net.URLClassLoader;
import java.util.*;
import javax.tools.ToolProvider;

/** Host Android API fixture; direct FileProvider bridge is checked separately against original DEX. */
public final class VerifyNuvioUpdateUiRuntime {
    public static void main(String[] args) throws Exception {
        Path root = Path.of(args[1]); Files.createDirectories(root);
        Map<String,String> files = Map.of(
            "android/content/Context.java", "package android.content; public class Context { public Intent launched; public boolean fail; public int count; public String getPackageName(){return \"com.nuvio.testing\";} public void startActivity(Intent i){if(fail)throw new IllegalStateException(); launched=i; count++;} }",
            "android/content/Intent.java", "package android.content; public class Intent { public static final String ACTION_VIEW=\"android.intent.action.VIEW\"; public static final int FLAG_ACTIVITY_NEW_TASK=0x10000000, FLAG_GRANT_READ_URI_PERMISSION=1; public String action,type; public int flags; public Intent(String a){action=a;} public Intent setDataAndType(android.net.Uri u,String t){type=t;return this;} public Intent addFlags(int f){flags|=f;return this;} }",
            "android/net/Uri.java", "package android.net; public class Uri {}",
            "android/os/SystemClock.java", "package android.os; public class SystemClock {public static long now=10; public static long elapsedRealtime(){return now;}}",
            "android/util/Log.java", "package android.util; public class Log {public static int i(String t,String m){return 0;} public static int w(String t,String m,Throwable e){return 0;}}",
            "Fixture.java", "import android.content.*; import android.os.SystemClock; import software.santodan.extension.nuvioupdate.UpdateInstall; import java.io.*; public class Fixture {static void check(boolean x){if(!x)throw new AssertionError();} public static void run(String path)throws Exception{ File file=new File(path); file.createNewFile(); Context c=new Context(); check(!UpdateInstall.open(c,file,true)&&c.count==0); check(!UpdateInstall.open(c,new File(path+\"missing\"),false)); check(UpdateInstall.open(c,file,false)&&c.count==1); check(c.launched.action.equals(Intent.ACTION_VIEW)&&c.launched.type.equals(\"application/vnd.android.package-archive\")&&c.launched.flags==0x10000001); check(UpdateInstall.open(c,file,false)&&c.count==1); SystemClock.now=3000; c.fail=true; check(!UpdateInstall.open(c,file,false)); c.fail=false; check(UpdateInstall.open(c,file,false)&&c.count==2);}}"
        );
        List<String> inputs = new ArrayList<>();
        for(var entry:files.entrySet()) { Path file=root.resolve(entry.getKey()); Files.createDirectories(file.getParent()); Files.writeString(file,entry.getValue()); inputs.add(file.toString()); }
        inputs.add(args[0]); inputs.addAll(List.of("--release","11","-d",root.toString()));
        if(ToolProvider.getSystemJavaCompiler().run(null,null,null,inputs.toArray(new String[0]))!=0) throw new AssertionError("Runtime fixture compilation failed");
        try(var loader=new URLClassLoader(new java.net.URL[]{root.toUri().toURL()},null)) {
            loader.loadClass("Fixture").getMethod("run",String.class).invoke(null,root.resolve("update.apk").toString());
        }
        System.out.println("PASS: foreground system installer action/MIME/read grant, native background fallback, missing file, duplicate taps, launch failure and retry");
    }
}
