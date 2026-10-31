package santodan.patches;

import java.net.*;
import java.nio.file.*;
import java.lang.reflect.*;
import java.util.*;
import javax.tools.ToolProvider;

/** Exercises production settings callbacks and modifier construction against both native layouts. */
public final class VerifyNuvioBeta9DateStyleRuntime {
    public static void main(String[] args) throws Exception {
        Path dir = Files.createTempDirectory(Path.of(args[1]), "date-label-style-");
        Map<String,String> sources = new LinkedHashMap<>();
        sources.put("android.content.Context", "package android.content; public class Context { public static final int MODE_PRIVATE=0; }");
        sources.put("android.content.SharedPreferences", "package android.content; public class SharedPreferences { public final java.util.Map<String,Object> values=new java.util.HashMap<>(); public int getInt(String k,int d){return (Integer)values.getOrDefault(k,d);} public long getLong(String k,long d){return (Long)values.getOrDefault(k,d);} public Editor edit(){return new Editor();} public class Editor { public Editor putInt(String k,int v){values.put(k,v);return this;} public Editor putLong(String k,long v){values.put(k,v);return this;} public Editor remove(String k){values.remove(k);return this;} public void apply(){} } }");
        sources.put("android.app.Application", "package android.app; public class Application extends android.content.Context { public static String version; public final java.util.Map<String,android.content.SharedPreferences> stores=new java.util.HashMap<>(); public android.content.SharedPreferences getSharedPreferences(String n,int m){return stores.computeIfAbsent(n,k->new android.content.SharedPreferences());} public String getPackageName(){return \"com.nuvio.tv\";} public Manager getPackageManager(){return new Manager();} public static class Manager { public Info getPackageInfo(String n,int f){return new Info();} } public static class Info { public String versionName=version; } }");
        sources.put("android.app.ActivityThread", "package android.app; public class ActivityThread { public static final Application APP=new Application(); public static Application currentApplication(){return APP;} }");
        sources.put("kotlin.Unit", "package kotlin; public class Unit { public static final Unit INSTANCE=new Unit(); }");
        for (int count : new int[]{0,1,3}) sources.put("kotlin.jvm.functions.Function"+count,
            "package kotlin.jvm.functions; public interface Function"+count+" { Object invoke("+(count==0?"":count==1?"Object a":"Object a,Object b,Object c")+"); }");
        sources.put("h1.h", "package h1; public class h { public static class State { public Object value; public State(Object v){value=v;} public Object getValue(){return value;} public void setValue(Object v){value=v;} } public static State s(Object v){return new State(v);} public Object j(Object key){return new y5.i2.Type();} }");
        sources.put("y5.i2", "package y5; public class i2 { public static final Object a=new Object(); public static class Type { public Object o=new i3.r0(); } }");
        sources.put("i3.r0", "package i3; public class r0 { public i3.h0 a=new i3.h0(); }");
        sources.put("i3.h0", "package i3; public class h0 { public long b=0x100000000L | (Float.floatToRawIntBits(11f)&0xffffffffL); }");
        sources.put("jb.l0", "package jb; public class l0 { public static final jb.m0 a=new jb.m0(); }");
        sources.put("jb.m0", "package jb; public class m0 { public float e=8f,d=4f; }");
        sources.put("e2.z", "package e2; public class z { public long a; public z(long value){a=value;} }");
        sources.put("r1.s", "package r1; public class s { public final Object body; public s(int key,Object body,boolean tracked){this.body=body;} }");
        sources.put("x1.q", "package x1; public interface q { q d(q other); }");
        sources.put("x1.n", "package x1; public class n implements q { public static final n b=new n(); public String alignment; public float inset,horizontal,vertical,layer; public long background; public q d(q other){layer=((v)other).layer;return this;} }");
        sources.put("x1.v", "package x1; public class v implements q { public float layer; public v(float v){layer=v;} public q d(q other){return this;} }");
        sources.put("x1.b", "package x1; public class b { public static final String a=\"a\",b=\"b\",c=\"c\",d=\"d\",e=\"e\",f=\"f\",g=\"g\",h=\"h\",i=\"i\"; }");
        sources.put("e0.v", "package e0; public class v { public static final v a=new v(); public x1.q a(x1.q modifier,String alignment){x1.n n=new x1.n();n.alignment=alignment;return n;} }");
        sources.put("e0.b", "package e0; public class b { public static x1.q u(x1.q m,float inset){((x1.n)m).inset=inset;return m;} public static x1.q v(x1.q m,float h,float v){((x1.n)m).horizontal=h;((x1.n)m).vertical=v;return m;} }");
        sources.put("b2.j", "package b2; public class j { public static x1.q b(x1.q m,Object shape){return m;} }");
        sources.put("y.m", "package y; public class m { public static x1.q g(x1.q m,long color,Object shape){((x1.n)m).background=color;return m;} }");
        sources.put("e2.i0", "package e2; public class i0 { public static final Object b=new Object(); }");
        for (String name : List.of("na.i1")) sources.put(name,"package na; public class "+name.substring(3)+" { public static final Object a=new Object(); }");
        sources.put("gb.ke", "package gb; public class ke { public static kotlin.jvm.functions.Function0 toggle; public static void a(String title,String desc,boolean expanded,kotlin.jvm.functions.Function0 t,Object modifier,Object icon,Object focus,kotlin.jvm.functions.Function0 noop,r1.s body,Object composer,int flags){toggle=t;if(expanded)((kotlin.jvm.functions.Function3)body.body).invoke(null,composer,0);} }");
        for (String name : List.of("gb.pd")) sources.put(name, "package gb; public class "+name.substring(3)+" { public final Object value; public "+name.substring(3)+"(Object value,String title,String desc,String trailing,Object font,int mask){if(mask!=28)throw new AssertionError();this.value=value;} }");
        String row = " { public static final java.util.List<kotlin.jvm.functions.Function0> clicks=new java.util.ArrayList<>(); public static java.util.List<?> options; public static Object selected; public static kotlin.jvm.functions.Function1 select; public static kotlin.jvm.functions.Function0 dismiss; public static void a(String title,String desc,String value,kotlin.jvm.functions.Function0 click,Object modifier,kotlin.jvm.functions.Function0 noop,boolean enabled,Object icon,Object titleIcon,long tint,Object leading,Integer raw,float size,long color,Object composer,int flags,int flags2,int defaults){if(defaults!=16336)throw new AssertionError();clicks.add(click);} public static void j(String title,java.util.List<?> values,Object current,kotlin.jvm.functions.Function1 choose,kotlin.jvm.functions.Function0 close,String subtitle,float width,float height,Object composer,int flags,int defaults){if(defaults!=32 || width!=420f || height!=320f)throw new AssertionError(\"Picker must have visible dimensions\");options=values;selected=current;select=choose;dismiss=close;} }";
        for (String name : List.of("gb.gd")) sources.put(name, "package gb; public class "+name.substring(3)+row);
        for (String name : List.of("gb.ic")) {
            String rows = name.endsWith("p3") ? "gb.gd" : "gb.gd";
            sources.put(name, "package gb; public class "+name.substring(3)+" { public static void c(String title,long color,boolean transparent,kotlin.jvm.functions.Function0 click,kotlin.jvm.functions.Function0 focus,boolean enabled,Object composer,int flags,int defaults){"+rows+".clicks.add(click);} public static void h(String title,int value,String text,int min,int max,int step,kotlin.jvm.functions.Function1 change,String subtitle,kotlin.jvm.functions.Function0 focus,boolean enabled,Object modifier,Object composer,int flags,int defaults){if(min!=50||max!=200||step!=10||!text.equals(value+\"%\"))throw new AssertionError();"+rows+".clicks.add(()->change.invoke(max));} public static void b(String title,java.util.List<?> colors,long selected,boolean transparent,kotlin.jvm.functions.Function1 select,kotlin.jvm.functions.Function0 dismiss,Object composer,int flags,int defaults){"+rows+".options=colors;"+rows+".select=select;"+rows+".dismiss=dismiss;} }");
        }
        List<String> compile = new ArrayList<>(List.of("-d", dir.toString()));
        for (var source : sources.entrySet()) { Path file=dir.resolve(source.getKey().replace('.','/')+".java");Files.createDirectories(file.getParent());Files.writeString(file,source.getValue());compile.add(file.toString()); }
        for (String file : List.of("DateLabelStyle.java","NuvioDateLabelStyle.java")) compile.add(Path.of(args[0],file).toString());
        check(ToolProvider.getSystemJavaCompiler().run(null,null,null,compile.toArray(String[]::new))==0,"Compile failed");
        for (String version : List.of("1.1.0-beta.9")) try (URLClassLoader loader=new URLClassLoader(new URL[]{dir.toUri().toURL()},ClassLoader.getPlatformClassLoader())) {
            loader.loadClass("android.app.Application").getField("version").set(null,version);
            Class<?> bridge=loader.loadClass("software.santodan.extension.nuviomenu.NuvioDateLabelStyle");
            Object composer=loader.loadClass("h1.h").getConstructor().newInstance();
            Object scope=loader.loadClass("e0.v").getField("a").get(null);
            Method build=bridge.getMethod("build",ClassLoader.class,Object.class,Object.class,String.class,String.class);
            Method render=bridge.getMethod("renderSettings",Object.class,String.class,String.class);
            String shape=version.endsWith("5")?"na.i1":"na.i1";
            String prefs="santodan_nuvio_airing_series";
            Class<?> rows=loader.loadClass(version.endsWith("5")?"gb.gd":"gb.gd");
            Class<?> function0=loader.loadClass("kotlin.jvm.functions.Function0"),function1=loader.loadClass("kotlin.jvm.functions.Function1");
            defaults((Object[])build.invoke(null,loader,scope,composer,shape,prefs));
            render.invoke(null,composer,prefs,"Appearance");
            List<?> clicks=(List<?>)rows.getField("clicks").get(null);
            check(clicks.isEmpty(),"Collapsed settings rendered controls");
            function0.getMethod("invoke").invoke(loader.loadClass("gb.ke").getField("toggle").get(null));
            for (int property=0;property<5;property++) {
                clicks.clear();render.invoke(null,composer,prefs,"Appearance");check(clicks.size()==6,"Missing controls or reset");
                function0.getMethod("invoke").invoke(clicks.get(property));
                if(property==1 || property==3) continue;
                clicks.clear();render.invoke(null,composer,prefs,"Appearance");
                List<?> options=(List<?>)rows.getField("options").get(null);
                if (property == 2 || property == 4) {
                    long[] expected = {0xffffffff00000000L,0xffd9d9d900000000L,0xffffff0000000000L,
                        0xff00ffff00000000L,0xff00ff0000000000L,0xffff00ff00000000L,
                        0xffff6b6b00000000L,0xffffa50000000000L,0xff90ee9000000000L};
                    int offset = property == 2 ? 1 : 0;
                    check(options.size()==expected.length+offset,"Color picker palette size differs");
                    if(offset==1)check(options.get(0).getClass().getField("a").getLong(options.get(0))==0L,"Missing transparent label choice");
                    for(int index=0;index<expected.length;index++) {
                        Object swatch=options.get(index+offset);
                        check(swatch.getClass().getField("a").getLong(swatch)==expected[index],"Label and font palettes differ from subtitle text colors");
                    }
                }
                Object option=options.get(options.size()-1);
                Object selected=property==0 ? option.getClass().getField("value").get(option) : option;
                function1.getMethod("invoke",Object.class).invoke(rows.getField("select").get(null),selected);
            }
            Object[] style=(Object[])build.invoke(null,loader,scope,composer,shape,prefs);
            check(style[0].getClass().getField("alignment").get(style[0]).equals("i"),"Position not applied");
            check(style[0].getClass().getField("horizontal").getFloat(style[0])==16f,"Label size not applied");
            check(style[0].getClass().getField("vertical").getFloat(style[0])==8f,"Vertical padding not applied");
            check(style[0].getClass().getField("background").getLong(style[0])==0xff90ee9000000000L,"Shared subtitle color palette not applied to label");
            check(style[1].equals(0xff90ee9000000000L),"Font color not applied");
            check(style[2].equals(0x100000000L | (Float.floatToRawIntBits(22f)&0xffffffffL)),"Font size not applied");
            Object translucent=loader.loadClass("e2.z").getConstructor(long.class).newInstance(0x8090ee9000000000L);
            function1.getMethod("invoke",Object.class).invoke(rows.getField("select").get(null),translucent);
            check(((Object[])build.invoke(null,loader,scope,composer,shape,prefs))[1].equals(0x8090ee9000000000L),"Native opacity selection was lost");
            function1.getMethod("invoke",Object.class).invoke(rows.getField("select").get(null),
                loader.loadClass("e2.z").getConstructor(long.class).newInstance(0xff90ee9000000000L));
            for (String other : List.of("santodan_nuvio_finale_dates","santodan_nuvio_movie_release_dates"))
                check(((Object[])build.invoke(null,loader,scope,composer,shape,other))[1].equals(style[1]),"Date patches did not share the selected style");
            Field states=bridge.getDeclaredField("STATES");states.setAccessible(true);((Map<?,?>)states.get(null)).clear();
            style=(Object[])build.invoke(null,loader,scope,composer,shape,prefs);
            check(style[1].equals(0xff90ee9000000000L),"Saved style did not survive state recreation");
            render.invoke(null,composer,prefs,"Appearance");function0.getMethod("invoke").invoke(loader.loadClass("gb.ke").getField("toggle").get(null));
            clicks.clear();render.invoke(null,composer,prefs,"Appearance");function0.getMethod("invoke").invoke(clicks.get(5));
            defaults((Object[])build.invoke(null,loader,scope,composer,shape,prefs));
            Class<?> model=loader.loadClass("software.santodan.extension.nuviomenu.DateLabelStyle");
            for(int property=0;property<5;property++) for(int invalid:new int[]{-1,999})
                check(model.getMethod("valid",int.class,int.class).invoke(null,property,invalid).equals(model.getMethod("defaultChoice",int.class).invoke(null,property)),"Invalid choice not sanitized");
            System.out.println("PASS: "+version+" native style controls, all five properties, transparent background, shared style, persistence, reset and invalid choices");
        }
    }
    private static void defaults(Object[] style)throws Exception {
        Object modifier=style[0];
        check(modifier.getClass().getField("alignment").get(modifier).equals("h"),"Default alignment changed");
        check(modifier.getClass().getField("horizontal").getFloat(modifier)==8f,"Native default padding changed");
        check(modifier.getClass().getField("background").getLong(modifier)==0xff1976d200000000L,"Default background changed");
        check(style[1].equals(0xffffffff00000000L),"Default foreground changed");
        check(style[2].equals(0x100000000L|(Float.floatToRawIntBits(11f)&0xffffffffL)),"Default font changed");
    }
    private static void check(boolean value,String message) { if(!value)throw new AssertionError(message); }
}
