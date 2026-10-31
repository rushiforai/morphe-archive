package santodan.patches;

import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Consumer;
import javax.tools.ToolProvider;

/** Exercise the production renderer's callbacks, defaults, sizing and live theme reads. */
public final class VerifyNuvioBeta9TrackingDialogs {
    public static void main(String[] args) throws Exception {
        Path directory = Files.createTempDirectory(Path.of(args[1]), "tracking-dialogs-");
        Map<String,String> sources = new LinkedHashMap<>();
        sources.put("android.app.Application", "package android.app; public class Application { public String getPackageName(){return \"com.nuvio.tv\";} public Manager getPackageManager(){return new Manager();} public static class Manager { public Info getPackageInfo(String n,int f){return new Info();} } public static class Info { public String versionName=\"1.1.0-beta.9\"; } }");
        sources.put("android.app.ActivityThread", "package android.app; public class ActivityThread { public static Application currentApplication(){return new Application();} }");
        sources.put("kotlin.Unit", "package kotlin; public class Unit { public static final Unit INSTANCE=new Unit(); }");
        for (int arity : List.of(0,1,3)) sources.put("kotlin.jvm.functions.Function"+arity,
            "package kotlin.jvm.functions; public interface Function"+arity+" { Object invoke("+
                (arity==0?"":arity==1?"Object a":"Object a,Object b,Object c")+"); }");
        sources.put("r1.s", "package r1; public class s { public final Object body; public s(int key,Object body,boolean tracked){if(!tracked)throw new AssertionError();this.body=body;} }");
        sources.put("jb.e", "package jb; public class e { public long h=11,e=22; }");
        sources.put("jb.y0", "package jb; public class y0 { public static final Object a=new Object(); }");
        sources.put("g1.Composer", "package g1; public class Composer { public int group; public final jb.e colors=new jb.e(); public Object j(Object local){if(local!=jb.y0.a)throw new AssertionError();return colors;} public void d0(int key){group=key;} public void p(boolean insert){group=0;} }");
        sources.put("x1.q", "package x1; public class q { public float fraction,height; public long color; public q(){} public q(q a){fraction=a.fraction;height=a.height;color=a.color;} }");
        sources.put("x1.n", "package x1; public class n extends q { public static final n b=new n(); }");
        sources.put("androidx.compose.foundation.layout.b", "package androidx.compose.foundation.layout; public class b { public static x1.q f(x1.q base,float fraction){x1.q q=new x1.q(base);q.fraction=fraction;return q;} public static x1.q h(x1.q base,float height){x1.q q=new x1.q(base);q.height=height;return q;} }");
        sources.put("l0.g", "package l0; public class g { public static Object b(float radius){if(radius!=3f)throw new AssertionError();return new Object();} }");
        sources.put("y.m", "package y; public class m { public static x1.q g(x1.q base,long color,Object shape){if(shape==null)throw new AssertionError();x1.q q=new x1.q(base);q.color=color;return q;} }");
        sources.put("e0.b", "package e0; public class b { public static x1.q track; private static r1.s remembered; private static int group; public static void a(x1.q modifier,Object alignment,r1.s content,Object composer,int flags,int defaults){if(defaults!=2)throw new AssertionError(); int key=((g1.Composer)composer).group; if(track==null||track.fraction!=modifier.fraction||track.height!=modifier.height||track.color!=modifier.color||group!=key){remembered=content;group=key;} track=modifier;((kotlin.jvm.functions.Function3)remembered.body).invoke(null,composer,0);} }");
        sources.put("e0.q", "package e0; public class q { public static final java.util.List<x1.q> fills=new java.util.ArrayList<>();public static void a(x1.q modifier,Object composer,int flags){fills.add(modifier);} }");
        sources.put("gb.pd", "package gb; public class pd { public final Object id; public final String label; public pd(Object id,String label,String desc,String trailing,Object font,int defaults){if(defaults!=28)throw new AssertionError();this.id=id;this.label=label;} }");
        sources.put("gb.gd", "\n            package gb; import kotlin.jvm.functions.*; public class gd {\n                public static java.util.List<gb.pd> options; public static Object selected; public static Function1 select;\n                public static Function0 dismiss,click; public static boolean enabled,checked;\n                public static void j(String title,java.util.List<gb.pd> values,Object current,Function1 choose,Function0 close,String subtitle,float width,float height,Object composer,int flags,int defaults) {\n                    if(width!=520f||height!=320f||defaults!=32)throw new AssertionError(\"Invisible native picker\");\n                    options=values;selected=current;select=choose;dismiss=close;\n                }\n                public static void m(String title,String description,boolean value,Function0 action,Object modifier,Function0 focus,boolean active,Object icon,long tint,boolean alternate,Object composer,int flags,int defaults) {\n                    if(defaults!=944)throw new AssertionError(\"Native defaults overwrite disabled main-service row\");\n                    click=action;enabled=active;checked=value;\n                }\n            public static void g(String title,java.util.ArrayList<gb.pd> values,java.util.List<String> current,Function1 choose,Function0 close,String subtitle,float width,float height,Integer max,Object composer,int flags,int defaults) {\n if(width!=560f||height!=280f||max!=null||defaults!=0||!subtitle.contains(\"always included\"))throw new AssertionError(\"Native multi-choice layout changed\");\n options=values;selected=current;select=choose;dismiss=close;\n}\npublic static void e(Object alignment,r1.s body,Object composer,int flags,int defaults){if(defaults!=1)throw new AssertionError();((Function3)body.body).invoke(null,composer,0);}\npublic static void d(String title,Function0 action,boolean primary,boolean active,Object composer,int flags,int defaults){if(!active||primary||defaults!=0)throw new AssertionError();gb.ke.click=action;}\n}\n            ");
        sources.put("gb.ke", "package gb; public class ke { public static String label;public static kotlin.jvm.functions.Function0 click;public static void b(String text,x1.q modifier,Object tone,Object composer,int flags,int defaults){if(defaults!=6)throw new AssertionError();label=text;}public static void d(String title,kotlin.jvm.functions.Function0 action,x1.q modifier,kotlin.jvm.functions.Function0 focus,Object composer,int flags){click=action;} }");
        sources.put("na.y1", "\n            package na; public class y1 { public static kotlin.jvm.functions.Function0 dismiss;public static String subtitle;\n                public static void z(kotlin.jvm.functions.Function0 close,String title,String description,float width,int align,boolean suppress,boolean platform,Object brush,Object border,float stroke,float radius,float padding,float spacing,kotlin.jvm.functions.Function3 background,r1.s body,Object composer,int flags,int flags2,int defaults) {\n                    if(width!=560f||defaults!=16336||flags2!=24576||background!=null||brush!=null||border!=null)throw new AssertionError(\"Nuvio dialog defaults lost\");\n                    dismiss=close;subtitle=description;((kotlin.jvm.functions.Function3)body.body).invoke(null,composer,0);\n                }\n            }\n            ");
        List<String> compile = new ArrayList<>(List.of("-d", directory.toString()));
        for (var entry : sources.entrySet()) {
            Path file = directory.resolve(entry.getKey().replace('.','/')+".java");
            Files.createDirectories(file.getParent());Files.writeString(file,entry.getValue());compile.add(file.toString());
        }
        compile.add(args[0]);

        check(ToolProvider.getSystemJavaCompiler().run(null,null,null,compile.toArray(String[]::new))==0,"Fixture compilation failed");
        try (var loader = new URLClassLoader(new java.net.URL[]{directory.toUri().toURL()},ClassLoader.getPlatformClassLoader())) {
            Class<?> renderer=loader.loadClass("software.santodan.extension.nuviomerged.NuvioTrackingDialogs");
            Object composer=loader.loadClass("g1.Composer").getConstructor().newInstance();
            Class<?> rows=loader.loadClass("gb.gd"), buttons=loader.loadClass("gb.ke");
            AtomicInteger dismissed=new AtomicInteger();
            List<String> chosen=new ArrayList<>();
            renderer.getMethod("picker",Object.class,String.class,List.class,List.class,String.class,Consumer.class,Runnable.class)
                .invoke(null,composer,"Main tracking",List.of("NUVIO_SYNC","MDBLIST"),List.of("Nuvio Sync","MDBList"),"MDBLIST",(Consumer<String>)chosen::add,(Runnable)dismissed::incrementAndGet);
            check(rows.getField("selected").get(null).equals("MDBLIST"),"Main picker selection changed");
            List<?> options=(List<?>)rows.getField("options").get(null);
            check(options.size()==2&&options.get(1).getClass().getField("label").get(options.get(1)).equals("MDBList"),"Picker labels lost");
            loader.loadClass("kotlin.jvm.functions.Function1").getMethod("invoke",Object.class).invoke(rows.getField("select").get(null),"NUVIO_SYNC");
            check(chosen.equals(List.of("NUVIO_SYNC")),"Picker callback lost service identity");
            invokeClick(loader,rows.getField("dismiss").get(null));check(dismissed.get()==1,"Picker dismissal lost");
            List<Set<String>> saved = new ArrayList<>();
            renderer.getMethod("services",Object.class,List.class,List.class,List.class,String.class,Consumer.class,Runnable.class)
                .invoke(null,composer,List.of("NUVIO_SYNC","TRAKT","MDBLIST"),List.of("Nuvio Sync","Trakt","MDBList"),
                    List.of("NUVIO_SYNC","MDBLIST"),"MDBLIST",(Consumer<Set<String>>)saved::add,(Runnable)dismissed::incrementAndGet);
            List<?> optional=(List<?>)rows.getField("options").get(null);
            check(optional.size()==2&&optional.stream().noneMatch(option->{try{return option.getClass().getField("id").get(option).equals("MDBLIST");}catch(Exception error){throw new RuntimeException(error);}}),"Main service can be unchecked");
            loader.loadClass("kotlin.jvm.functions.Function1").getMethod("invoke",Object.class)
                .invoke(rows.getField("select").get(null),List.of("TRAKT","invalid"));
            check(saved.equals(List.of(Set.of("MDBLIST","TRAKT"))),"Save lost main service or included invalid identity");
            loader.loadClass("kotlin.jvm.functions.Function1").getMethod("invoke",Object.class)
                .invoke(rows.getField("select").get(null),List.of());
            check(saved.get(1).equals(Set.of("MDBLIST")),"Native Clear removes the main service");
            var progress=renderer.getMethod("progress",Object.class,int.class,int.class);
            var label=renderer.getMethod("label",Object.class,String.class);
            Consumer<Object> body=nested->{try {label.invoke(null,nested,"Fetching MDBList");progress.invoke(null,nested,3,4);}catch(Exception error){throw new RuntimeException(error);}};
            renderer.getMethod("dialog",Object.class,String.class,String.class,Runnable.class,Consumer.class)
                .invoke(null,composer,"Sync tracking progress",null,(Runnable)dismissed::incrementAndGet,body);
            check(buttons.getField("label").get(null).equals("Fetching MDBList"),"Sync status not rendered");
            checkBar(loader,0.75f,11L,22L);
            // The native BoxWithConstraints caches its content using only the track modifier.
            // Advance stages without changing the theme or track dimensions.
            for (int stage=1;stage<=5;stage++) {
                progress.invoke(null,composer,stage,5);checkBar(loader,stage/5f,11L,22L);
            }
            progress.invoke(null,composer,5,5);checkBar(loader,1f,11L,22L);
            Object colors=composer.getClass().getField("colors").get(composer);
            colors.getClass().getField("h").setLong(colors,33L);colors.getClass().getField("e").setLong(colors,44L);
            progress.invoke(null,composer,99,4);checkBar(loader,1f,33L,44L);
            List<?> fills=(List<?>)loader.loadClass("e0.q").getField("fills").get(null);int count=fills.size();
            progress.invoke(null,composer,0,0);check(fills.size()==count,"Zero progress renders a false fill");
            renderer.getMethod("action",Object.class,String.class,Runnable.class).invoke(null,composer,"Close",(Runnable)dismissed::incrementAndGet);
            invokeClick(loader,buttons.getField("click").get(null));invokeClick(loader,loader.loadClass("na.y1").getField("dismiss").get(null));
            check(dismissed.get()==3,"Native Close/back callbacks failed");
        }
        System.out.println("PASS: native tracking picker/dialog callbacks, multi-choice main-service protection, visible dimensions, progress updates and live theme colors");
    }
    private static void checkBar(ClassLoader loader,float fraction,long accent,long track)throws Exception {
        Object background=loader.loadClass("e0.b").getField("track").get(null);
        List<?> fills=(List<?>)loader.loadClass("e0.q").getField("fills").get(null);Object fill=fills.get(fills.size()-1);
        check(fill.getClass().getField("fraction").getFloat(fill)==fraction&&fill.getClass().getField("color").getLong(fill)==accent,"Progress fill ignores stage or active theme");
        check(background.getClass().getField("height").getFloat(background)==6f&&background.getClass().getField("color").getLong(background)==track,"Progress track ignores theme or native dimensions");
    }
    private static void invokeClick(ClassLoader loader,Object callback)throws Exception {loader.loadClass("kotlin.jvm.functions.Function0").getMethod("invoke").invoke(callback);}
    private static void check(boolean condition,String message){if(!condition)throw new AssertionError(message);}
}
