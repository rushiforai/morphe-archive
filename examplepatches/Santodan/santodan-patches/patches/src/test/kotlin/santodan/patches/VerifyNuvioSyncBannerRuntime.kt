package santodan.patches

import java.io.File
import java.net.URLClassLoader
import java.nio.file.Files
import javax.tools.ToolProvider

/** Run the production bridge against the reviewed native ABI, with only Android scheduling stubbed. */
fun main(args: Array<String>) {
    val root = Files.createTempDirectory(File(args[1]).apply { mkdirs() }.toPath(), "native-banner-").toFile()
    val sources = mapOf(
        "android.app.Activity" to "package android.app; public class Activity {}",
        "android.os.Looper" to "package android.os; public class Looper {public static Looper getMainLooper(){return new Looper();}}",
        "android.os.Handler" to """package android.os; public class Handler {
            public Handler(Looper l){} public boolean post(Runnable r){r.run();return true;}
            public boolean postDelayed(Runnable r,long ms){return true;}
        }""",
        "android.os.SystemClock" to "package android.os; public class SystemClock {public static long uptimeMillis(){return 1000;}}",
        "android.util.Log" to "package android.util; public class Log {public static int e(String t,String m,Throwable e){throw new AssertionError(m,e);}}",
        "h1.n" to "package h1; public class n {}",
        "h1.k0" to "package h1; public class k0 extends n {}",
        "h1.h" to """package h1; public class h {
            public static Slot t(Object v){return new Slot(v);}
            public static class Slot {Object v;public Slot(Object o){v=o;}public Object getValue(){return v;}public void setValue(Object o){v=o;}}
        }""",
        "kotlin.jvm.functions.Function0" to "package kotlin.jvm.functions; public interface Function0 {Object invoke();}",
        "kotlin.Unit" to "package kotlin; public class Unit {public static final Unit INSTANCE=new Unit();}",
        "r1.s" to "package r1; public class s {}",
        "kb.l" to "package kb; public enum l {STABLE}",
        "lb.a" to """package lb; public class a {
            public String a,b,c,d,e,f;public Long g;
            public a(String a,String b,String c,String d,String e,String f,Long g){this.a=a;this.b=b;this.c=c;this.d=d;this.e=e;this.f=f;this.g=g;}
        }""",
        "kb.k0" to """package kb; public class k0 {
            public boolean a,c,d,g,h,k,m,n,o;public lb.a b,p;public Float e;public String f,i,j;public kb.l l;
            public k0(boolean a,lb.a b,boolean c,boolean d,Float e,String f,boolean g,boolean h,String i,String j,
                boolean k,kb.l l,boolean m,boolean n,boolean o,lb.a p){
                this.a=a;this.b=b;this.c=c;this.d=d;this.e=e;this.f=f;this.g=g;this.h=h;this.i=i;this.j=j;
                this.k=k;this.l=l;this.m=m;this.n=n;this.o=o;this.p=p;
            }
        }""",
        "u6.g" to """package u6; public class g {
            public static String d0(int id,h1.n c){return "native-text";}
            public static String e0(int id,Object[] args,h1.n c){return "native-format";}
        }""",
        "ma.r" to """package ma; public class r {public static int groups;
            public static String h(h1.k0 first,int key,int id,h1.k0 second,boolean end){groups++;return "native-group";}
        }""",
        "fb.uj" to """package fb; import kotlin.jvm.functions.Function0; public class uj {
            public static kb.k0 state;public static Object dismiss,content;public static int flags,calls;
            public static void i(kb.k0 s,Function0 a,Function0 b,Function0 c,Function0 d,Function0 e,Function0 f,r1.s x,h1.n n,int at){
                state=s;dismiss=a;content=x;flags=at;calls++;
            }
        }""",
        "fixture.Runner" to """package fixture;
            import software.santodan.extension.nuviomerged.NuvioSyncBanner;
            import kotlin.jvm.functions.Function0;
            public class Runner {
                static void check(boolean b){if(!b)throw new AssertionError();}
                public static void run()throws Exception{
                    // updateBannerEnabled/autoInstallEnabled are preferences, not an active update.
                    kb.k0 original=new kb.k0(false,null,false,false,null,null,false,false,null,null,true,kb.l.STABLE,true,true,true,null);
                    Function0 action=()->"original";r1.s content=new r1.s();h1.k0 composer=new h1.k0();
                    NuvioSyncBanner.host(original,action,action,action,action,action,action,content,composer,123);
                    check(fb.uj.state==original&&fb.uj.dismiss==action&&fb.uj.flags==123&&fb.uj.content==content);
                    int[] cancelled={0};
                    NuvioSyncBanner.update(new android.app.Activity(),"Fetching progress",1,3,true,false,()->cancelled[0]++);
                    NuvioSyncBanner.host(original,action,action,action,action,action,action,content,composer,123);
                    kb.k0 sync=fb.uj.state;
                    check(sync!=original&&sync.d&&sync.g&&sync.e>0.33f&&sync.e<0.34f);
                    check(sync.b.a.equals("Sync Progress  1/3")&&sync.b.d.equals("santodan-sync-progress"));
                    check(fb.uj.dismiss!=action&&((Function0)fb.uj.dismiss).invoke()==kotlin.Unit.INSTANCE);
                    check(cancelled[0]==1);
                    Object oldCancel=fb.uj.dismiss;
                    check(original.b==null&&!original.g&&original.k&&original.m);
                    NuvioSyncBanner.begin(sync);
                    check(!NuvioSyncBanner.hideClose(true));
                    check(!NuvioSyncBanner.timedClose(true));
                    check(NuvioSyncBanner.closeText(0,composer).equals("Cancel sync"));
                    check(NuvioSyncBanner.installed(false));
                    check(NuvioSyncBanner.groupText(composer,0,0x7f110d18,composer,false).equals("Fetching progress"));
                    check(ma.r.groups==1); // Original grouped lookup still executes; Compose groups stay balanced.
                    check(NuvioSyncBanner.formatted(0x7f110d12,new Object[]{33},composer).equals("Fetching progress"));
                    NuvioSyncBanner.end();
                    NuvioSyncBanner.begin(original);
                    check(NuvioSyncBanner.hideClose(true)&&!NuvioSyncBanner.hideClose(false));
                    check(NuvioSyncBanner.timedClose(true)&&!NuvioSyncBanner.timedClose(false));
                    check(NuvioSyncBanner.closeText(0,composer).equals("native-text"));
                    check(!NuvioSyncBanner.installed(false));
                    check(NuvioSyncBanner.installed(true));
                    check(NuvioSyncBanner.groupText(composer,0,0x7f110d18,composer,false).equals("native-group"));
                    check(NuvioSyncBanner.formatted(0x7f110d12,new Object[]{33},composer).equals("native-format"));
                    NuvioSyncBanner.end();
                    original.b=new lb.a("v1","real update","notes","app.apk","url","",null);original.g=true;
                    NuvioSyncBanner.host(original,action,action,action,action,action,action,content,composer,123);
                    check(fb.uj.state==original&&fb.uj.dismiss==action&&fb.uj.flags==123);
                    original.g=false;original.b=null;original.h=true;
                    NuvioSyncBanner.host(original,action,action,action,action,action,action,content,composer,123);
                    check(fb.uj.state==original); // Native permission dialog has priority.
                    original.h=false;
                    NuvioSyncBanner.update(new android.app.Activity(),"Provider failed",2,3,false,true);
                    ((Function0)oldCancel).invoke();check(cancelled[0]==1);
                    NuvioSyncBanner.host(original,action,action,action,action,action,action,content,composer,123);
                    check(fb.uj.state.i.equals("Provider failed"));
                    NuvioSyncBanner.begin(fb.uj.state);
                    check(NuvioSyncBanner.closeText(0,composer).equals("Close"));
                    NuvioSyncBanner.end();
                    NuvioSyncBanner.hide();
                    NuvioSyncBanner.host(original,action,action,action,action,action,action,content,composer,123);
                    check(fb.uj.state==original&&fb.uj.content==content);
                }
            }"""
    )
    val files = sources.map { (name, source) ->
        File(root, name.replace('.', '/') + ".java").apply { parentFile.mkdirs(); writeText(source) }
    } + File(args[0])
    val classes = File(root, "classes").apply { mkdirs() }
    check(ToolProvider.getSystemJavaCompiler().run(null, null, null, "--release", "11", "-d", classes.path,
        *files.map { it.path }.toTypedArray()) == 0)
    URLClassLoader(arrayOf(classes.toURI().toURL()), ClassLoader.getSystemClassLoader().parent).use {
        it.loadClass("fixture.Runner").getMethod("run").invoke(null)
    }
    println("PASS: native updater host receives sync state; native updates/permissions retain priority, callbacks/content are preserved, scoped labels retain Compose grouping, errors and hide work")
}
