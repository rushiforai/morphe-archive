package santodan.patches;

import java.net.*;
import java.nio.file.*;
import java.lang.reflect.*;
import java.util.*;
import javax.tools.ToolProvider;

/** Exercises production settings callbacks and modifier construction against both native layouts. */
public final class VerifyNuvioBeta13DateStyleRuntime {
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
        sources.put("g1.h", "package g1; public class h { public long T=17; public boolean S=true; public int groups,nodes,reuses; public static class State { public Object value; public State(Object v){value=v;} public Object getValue(){return value;} public void setValue(Object v){value=v;} } public static State s(Object v){return new State(v);} public boolean landscape; public Object j(Object key){if(key==na.c4.a)return landscape;return new y5.j2.Type();} public void d0(int key){groups++;} public void p(boolean node){if(node)nodes--;else groups--;if(groups<0||nodes<0)throw new AssertionError(\"Unbalanced Compose groups\");} public Object l(){return new Object();} public void h0(){nodes++;} public void k(Object factory){} public void r0(){reuses++;} public static void F(Object composer,Object value,Object setter){} public static void y(Object composer,Object init){} }");
        sources.put("y5.j2", "package y5; public class j2 { public static final Object a=new Object(); public static class Type { public Object o=new h3.s0(); } }");
        sources.put("h3.s0", "package h3; public class s0 { public h3.i0 a=new h3.i0(); }");
        sources.put("h3.i0", "package h3; public class i0 { public long b=0x100000000L | (Float.floatToRawIntBits(11f)&0xffffffffL); }");
        sources.put("jb.l0", "package jb; public class l0 { public static final jb.m0 a=new jb.m0(); }");
        sources.put("jb.m0", "package jb; public class m0 { public float e=8f,d=4f; }");
        sources.put("d2.z", "package d2; public class z { public long a; public z(long value){a=value;} }");
        sources.put("q1.t", "package q1; public class t { public final Object body; public t(int key,Object body,boolean tracked){this.body=body;} }");
        sources.put("w1.q", "package w1; public interface q { q d(q other); }");
        sources.put("w1.n", "package w1; public class n implements q { public static final n b=new n(); public String alignment; public float inset,horizontal,vertical,layer; public long background; public q d(q other){layer=((v)other).layer;return this;} }");
        sources.put("w1.v", "package w1; public class v implements q { public float layer; public v(float v){layer=v;} public q d(q other){return this;} }");
        sources.put("w1.b", "package w1; public class b { public static final String a=\"a\",b=\"b\",c=\"c\",d=\"d\",e=\"e\",f=\"f\",g=\"g\",h=\"h\",i=\"i\"; }");
        sources.put("d0.v", "package d0; public class v { public static final v a=new v(); public w1.q a(w1.q modifier,String alignment){w1.n n=new w1.n();n.alignment=alignment;return n;} }");
        sources.put("d0.b", "package d0; public class b { public static w1.q u(w1.q m,float inset){((w1.n)m).inset=inset;return m;} public static w1.q v(w1.q m,float h,float v){((w1.n)m).horizontal=h;((w1.n)m).vertical=v;return m;} }");
        sources.put("a2.j", "package a2; public class j { public static w1.q b(w1.q m,Object shape){return m;} }");
        sources.put("x.m", "package x; public class m { public static w1.q g(w1.q m,long color,Object shape){((w1.n)m).background=color;return m;} }");
        sources.put("d2.i0", "package d2; public class i0 { public static final Object b=new Object(); }");
        for (String name : List.of("na.p1")) sources.put(name,"package na; public class "+name.substring(3)+" { public static final Object a=new Object(); }");
        sources.put("gb.me", "package gb; public class me { public static kotlin.jvm.functions.Function0 toggle; public static void a(String title,String desc,boolean expanded,kotlin.jvm.functions.Function0 t,Object modifier,Object icon,Object focus,kotlin.jvm.functions.Function0 noop,q1.t body,Object composer,int flags){toggle=t;if(expanded)((kotlin.jvm.functions.Function3)body.body).invoke(null,composer,0);} }");
        for (String name : List.of("gb.qd")) sources.put(name, "package gb; public class "+name.substring(3)+" { public final Object value; public "+name.substring(3)+"(Object value,String title,String desc,String trailing,Object font,int mask){if(mask!=28)throw new AssertionError();this.value=value;} }");
        String row = " { public static final java.util.List<kotlin.jvm.functions.Function0> clicks=new java.util.ArrayList<>(); public static java.util.List<?> options; public static kotlin.jvm.functions.Function0 previewToggle; public static String previewMode; public static void d(String text,kotlin.jvm.functions.Function0 click,boolean primary,boolean enabled,Object composer,int flags,int defaults){if(primary||!enabled)throw new AssertionError(\"Preview button disabled\");previewToggle=click;previewMode=text;} public static Object selected; public static kotlin.jvm.functions.Function1 select; public static kotlin.jvm.functions.Function0 dismiss; public static void a(String title,String desc,String value,kotlin.jvm.functions.Function0 click,Object modifier,kotlin.jvm.functions.Function0 noop,boolean enabled,Object icon,Object titleIcon,long tint,Object leading,Integer raw,float size,long color,Object composer,int flags,int flags2,int defaults){if(defaults!=16336)throw new AssertionError();clicks.add(click);} public static void j(String title,java.util.List<?> values,Object current,kotlin.jvm.functions.Function1 choose,kotlin.jvm.functions.Function0 close,String subtitle,float width,float height,Object composer,int flags,int defaults){if(defaults!=32 || width!=420f || height!=320f)throw new AssertionError(\"Picker must have visible dimensions\");options=values;selected=current;select=choose;dismiss=close;} }";
        for (String name : List.of("gb.hd")) sources.put(name, "package gb; public class "+name.substring(3)+row);
        sources.put("gb.jc", "package gb; public class jc { public static g1.h.State opacity; public static final java.util.List<kotlin.jvm.functions.Function0> swatches=new java.util.ArrayList<>(); public static final java.util.List<String> labels=new java.util.ArrayList<>(); public static final java.util.List<Long> drawn=new java.util.ArrayList<>(); public static void c(String title,long color,boolean transparent,kotlin.jvm.functions.Function0 click,kotlin.jvm.functions.Function0 focus,boolean enabled,Object composer,int flags,int defaults){gb.hd.clicks.add(click);} public static void j(String title,int value,String text,int min,int max,int step,kotlin.jvm.functions.Function1 change,String subtitle,kotlin.jvm.functions.Function0 focus,boolean enabled,Object modifier,Object composer,int flags,int defaults){if(min!=50||max!=200||step!=10||!text.equals(value+\"%\"))throw new AssertionError();gb.hd.clicks.add(()->change.invoke(max));} public static void a(long color,boolean selected,boolean transparent,kotlin.jvm.functions.Function0 original,w1.q modifier,g1.h composer,int flags)throws Exception{if(software.santodan.extension.nuviomenu.NuvioDateLabelStyle.renderLabeledSwatch(color,selected,transparent,original,modifier,composer,flags))return;Object click=software.santodan.extension.nuviomenu.NuvioDateLabelStyle.colorSwatchClick(color,selected,transparent,original);if(click!=original)throw new AssertionError(\"Inner native callback replaced\");drawn.add(color);swatches.add((kotlin.jvm.functions.Function0)click);labels.add(software.santodan.extension.nuviomenu.NuvioDateLabelStyle.colorSwatchLabel(color,\"native label\"));} public static void b(String title,java.util.List<?> colors,long selected,boolean transparent,kotlin.jvm.functions.Function1 select,kotlin.jvm.functions.Function0 dismiss,Object composer,int flags,int defaults)throws Exception{opacity=new g1.h.State(Math.round((selected>>>56)*100f/255f));software.santodan.extension.nuviomenu.NuvioDateLabelStyle.bindColorOpacity(opacity);gb.hd.options=colors;gb.hd.selected=new d2.z(selected);gb.hd.select=select;gb.hd.dismiss=dismiss;swatches.clear();labels.clear();drawn.clear();for(Object item:colors){d2.z color=(d2.z)item;kotlin.jvm.functions.Function0 original=()->{gb.hd.selected=color;return kotlin.Unit.INSTANCE;};a(color.a,false,color.a==0,original,w1.n.b,(g1.h)composer,0);}} }");
        sources.put("com.nuvio.tv.domain.model.CustomThemeColors", "package com.nuvio.tv.domain.model; public class CustomThemeColors { public final int first,second,third; public CustomThemeColors(int a,int b,int c){if(a<0||a>0xffffff||b<0||b>0xffffff||c<0||c>0xffffff)throw new IllegalArgumentException(\"Failed requirement.\");first=a;second=b;third=c;} public int getFirst(){return first;} }");
        sources.put("gb.x0", "package gb; public class x0 { public static com.nuvio.tv.domain.model.CustomThemeColors initial; public static kotlin.jvm.functions.Function1 save; public static kotlin.jvm.functions.Function0 dismiss; public static void a(com.nuvio.tv.domain.model.CustomThemeColors colors,boolean gradient,kotlin.jvm.functions.Function1 onSave,kotlin.jvm.functions.Function0 onDismiss,g1.h composer,int flags)throws Exception{if(gradient || colors.first!=colors.second || colors.first!=colors.third)throw new AssertionError();initial=colors;save=onSave;dismiss=onDismiss;software.santodan.extension.nuviomenu.NuvioDateLabelStyle.renderEditorPreview(colors,w1.n.b,composer,flags);} }");
        sources.put("androidx.compose.foundation.layout.b", "package androidx.compose.foundation.layout; public class b { public static float width,height; public static w1.q q(w1.q modifier,float value){width=value;return modifier;} public static w1.q h(w1.q modifier,float value){height=value;return modifier;} public static w1.q j(w1.q modifier,float value){throw new AssertionError(\"requiredSize is not height\");} public static w1.q d(w1.q modifier,float fill){if(fill!=1f)throw new AssertionError();return modifier;} }");
        sources.put("d0.i", "package d0; public class i { public static Object g(float spacing){return spacing;} }");
        sources.put("d0.y", "package d0; public class y { public static Object a(Object spacing,Object alignment,Object composer,int flags){if(!(alignment instanceof w1.g))throw new AssertionError();return new Object();} }");
        sources.put("d0.q", "package d0; public class q { public static Object d(Object alignment,boolean propagate){if(propagate)throw new AssertionError();return new Object();} }");
        sources.put("w1.g", "package w1; public class g { public float bias; public g(float bias){this.bias=bias;if(bias!=0)throw new AssertionError();} }");
        sources.put("w2.i", "package w2; public class i { public static final Object b=new Object(),f=new Object(),e=new Object(),g=new Object(),h=new Object(),d=new Object(); }");
        sources.put("w1.a", "package w1; public class a { public static q c(Object composer,q modifier){return modifier;} }");
        sources.put("y5.h2", "package y5; public class h2 { public static final java.util.List<String> texts=new java.util.ArrayList<>(); public static long background,foreground,font; public static void b(String text,w1.q modifier,long color,long size,Object weight,Object family,long spacing,Object decoration,long height,int overflow,boolean wrap,int max,int min,Object layout,Object style,Object composer,int flags,int flags2,int defaults){if(defaults!=65520)throw new AssertionError();texts.add(text);if(text.equals(\"15-Nov\")){background=((w1.n)modifier).background;foreground=color;font=size;}} }");
        sources.put("na.c4", "package na; public class c4 { public static final Object a=new Object(); }");
        sources.put("u2.l", "package u2; public class l { public static final Object a=new Object(); }");
        sources.put("com.nuvio.tv.domain.model.ContentType", "package com.nuvio.tv.domain.model; public enum ContentType { MOVIE,SERIES }");
        sources.put("com.nuvio.tv.domain.model.MetaPreview", "package com.nuvio.tv.domain.model; public class MetaPreview { public String id,name,poster,landscape,background; public ContentType type; public MetaPreview(String id,ContentType type,String poster,String landscape,String background){this.id=id;this.type=type;this.name=id;this.poster=poster;this.landscape=landscape;this.background=background;} public String getId(){return id;} public ContentType getType(){return type;} public String getName(){return name;} public String getPoster(){return poster;} public String getLandscapePoster(){return landscape;} public String getBackground(){return background;} }");
        sources.put("gb.cj", "package gb; public class cj { public static String image; public static float width,height; public static void a(Object model,String title,w1.q modifier,Object alignment,Object scale,float alpha,g1.h composer,int flags,int defaults){if(scale!=u2.l.a||alpha!=1f||defaults!=0)throw new AssertionError(\"Native image defaults changed\");image=(String)model;width=androidx.compose.foundation.layout.b.width;height=androidx.compose.foundation.layout.b.height;} }");
        List<String> compile = new ArrayList<>(List.of("-d", dir.toString()));
        for (var source : sources.entrySet()) { Path file=dir.resolve(source.getKey().replace('.','/')+".java");Files.createDirectories(file.getParent());Files.writeString(file,source.getValue());compile.add(file.toString()); }
        for (String file : List.of("DateLabelStyle.java","NuvioDateLabelStyle.java")) compile.add(Path.of(args[0],file).toString());
        check(ToolProvider.getSystemJavaCompiler().run(null,null,null,compile.toArray(String[]::new))==0,"Compile failed");
        for (String version : List.of("1.1.0-beta.13")) try (URLClassLoader loader=new URLClassLoader(new URL[]{dir.toUri().toURL()},ClassLoader.getPlatformClassLoader())) {
            loader.loadClass("android.app.Application").getField("version").set(null,version);
            Class<?> bridge=loader.loadClass("software.santodan.extension.nuviomenu.NuvioDateLabelStyle");
            Object composer=loader.loadClass("g1.h").getConstructor().newInstance();
            Object scope=loader.loadClass("d0.v").getField("a").get(null);
            Method build=bridge.getMethod("build",ClassLoader.class,Object.class,Object.class,String.class,String.class);
            Method render=bridge.getMethod("renderSettings",Object.class,String.class,String.class);
            Class<?> meta=loader.loadClass("com.nuvio.tv.domain.model.MetaPreview"),contentType=loader.loadClass("com.nuvio.tv.domain.model.ContentType");
            Constructor<?> metadata=meta.getConstructor(String.class,contentType,String.class,String.class,String.class);
            Method capture=bridge.getMethod("rememberPreviewMovie",Object.class);
            for(int index=0;index<3;index++)capture.invoke(null,metadata.newInstance("movie"+index,contentType.getField("MOVIE").get(null),"https://example.test/"+index+"-poster",index==2?null:"https://example.test/"+index+"-landscape","https://example.test/"+index+"-landscape"));
            capture.invoke(null,metadata.newInstance("series",contentType.getField("SERIES").get(null),"bad-series-poster","bad-series-landscape",null));
            capture.invoke(null,metadata.newInstance("no-art",contentType.getField("MOVIE").get(null),"placeholder://empty",null,null));
            capture.invoke(null,metadata.newInstance("movie0",contentType.getField("MOVIE").get(null),"duplicate-poster","duplicate-landscape",null));
            Field pool=bridge.getDeclaredField("PREVIEW_MOVIES");pool.setAccessible(true);
            check(((List<?>)pool.get(null)).size()==3,"Preview pool accepted a series, placeholder or duplicate");
            String shape=version.endsWith("5")?"na.p1":"na.p1";
            String prefs="santodan_nuvio_airing_series";
            Class<?> rows=loader.loadClass(version.endsWith("5")?"gb.hd":"gb.hd");
            Class<?> function0=loader.loadClass("kotlin.jvm.functions.Function0"),function1=loader.loadClass("kotlin.jvm.functions.Function1");
            defaults((Object[])build.invoke(null,loader,scope,composer,shape,prefs));
            render.invoke(null,composer,prefs,"Appearance");
            List<?> clicks=(List<?>)rows.getField("clicks").get(null);
            check(clicks.isEmpty(),"Collapsed settings rendered controls");
            function0.getMethod("invoke").invoke(loader.loadClass("gb.me").getField("toggle").get(null));
            for (int property=0;property<5;property++) {
                clicks.clear();render.invoke(null,composer,prefs,"Appearance");check(clicks.size()==6,"Missing controls or reset");
                function0.getMethod("invoke").invoke(clicks.get(property));
                if(property==1 || property==3) continue;
                clicks.clear();render.invoke(null,composer,prefs,"Appearance");
                List<?> options=(List<?>)rows.getField("options").get(null);
                if (property == 2 || property == 4) {
                    long marker=bridge.getField("CUSTOM_SWATCH").getLong(null);
                    long[] expected = property==2 ? new long[]{marker,0xffffffff00000000L,0xffd9d9d900000000L,0xffffff0000000000L,0xff00ffff00000000L,0xff00ff0000000000L,0xffff00ff00000000L,0xffff6b6b00000000L,0xffffa50000000000L,0xff90ee9000000000L}
                        : new long[]{marker,0xffd9d9d900000000L,0xffffff0000000000L,0xff00ffff00000000L,0xff00ff0000000000L,0xffff00ff00000000L,0xffff6b6b00000000L,0xffffa50000000000L,0xff90ee9000000000L};
                    check(options.size()==expected.length,"Original palette size changed");
                    for(int index=0;index<expected.length;index++)
                        check(options.get(index).getClass().getField("a").getLong(options.get(index))==expected[index],"Swatch besides the first changed");
                    Class<?> nativePicker=loader.loadClass("gb.jc"), editor=loader.loadClass("gb.x0");
                    check(((List<?>)nativePicker.getField("labels").get(null)).get(0).equals("Custom"),"First swatch lacks Custom label");
                    long current=property==2?0xff1976d200000000L:0xffffffff00000000L;
                    check(((List<?>)nativePicker.getField("drawn").get(null)).get(0).equals(current),"Custom swatch does not display its real color");
                    Class<?> textUi=loader.loadClass("y5.h2");
                    List<?> visible=(List<?>)textUi.getField("texts").get(null);
                    for(String label:List.of("Custom","Light gray","Yellow","Cyan","Green","Magenta","Coral","Orange","Light green"))check(visible.contains(label),"Missing visible color label: "+label);
                    check(bridge.getMethod("editorSaveResource",int.class).invoke(null,0x7f1103d8).equals(0x7f1103d8),"Changed the normal theme Save button");
                    Object opacity=nativePicker.getField("opacity").get(null);
                    opacity.getClass().getMethod("setValue",Object.class).invoke(opacity,50);
                    function0.getMethod("invoke").invoke(((List<?>)nativePicker.getField("swatches").get(null)).get(0));
                    render.invoke(null,composer,prefs,"Appearance");
                    Object initial=editor.getField("initial").get(null);
                    Class<?> images=loader.loadClass("gb.cj");
                    String poster=(String)images.getField("image").get(null);
                    check(poster.startsWith("https://example.test/") && poster.endsWith("-poster"),"Portrait preview did not select movie artwork");
                    check(images.getField("width").getFloat(null)==144f && images.getField("height").getFloat(null)==216f,"Portrait cover aspect ratio changed");
                    check(bridge.getMethod("editorSaveResource",int.class).invoke(null,0x7f1103d8).equals(0x7f11006c),"Label editor must say Apply");
                    Object live=initial.getClass().getConstructor(int.class,int.class,int.class).newInstance(0xabcdef,0xabcdef,0xabcdef);
                    bridge.getMethod("renderEditorPreview",Object.class,Object.class,Object.class,int.class).invoke(null,live,loader.loadClass("w1.n").getField("b").get(null),composer,0);
                    check(textUi.getField("background").getLong(null)==(property==2?0x80abcdef00000000L:0xff90ee9000000000L),"Preview does not use live background and saved label color");
                    check(textUi.getField("foreground").getLong(null)==(property==4?0x80abcdef00000000L:0xffffffff00000000L),"Preview does not use live font color and saved font color");
                    check(images.getField("image").get(null).equals(poster),"Random movie changed during color editing");
                    check(rows.getField("previewMode").get(null).equals("Switch to Card"),"Missing Poster-to-Card button");
                    function0.getMethod("invoke").invoke(rows.getField("previewToggle").get(null));
                    bridge.getMethod("renderEditorPreview",Object.class,Object.class,Object.class,int.class).invoke(null,live,loader.loadClass("w1.n").getField("b").get(null),composer,0);
                    check(images.getField("image").get(null).equals(poster.replace("-poster","-landscape")),"Preview Card button did not select the same movie's landscape artwork");
                    check(images.getField("width").getFloat(null)==256f && images.getField("height").getFloat(null)==144f,"Card cover aspect ratio changed");
                    check(rows.getField("previewMode").get(null).equals("Switch to Poster"),"Missing Card-to-Poster button");
                    composer.getClass().getField("landscape").setBoolean(composer,true);
                    bridge.getMethod("renderEditorPreview",Object.class,Object.class,Object.class,int.class).invoke(null,live,loader.loadClass("w1.n").getField("b").get(null),composer,0);
                    check(images.getField("width").getFloat(null)==256f,"App preference changed the independent preview mode");
                    function0.getMethod("invoke").invoke(rows.getField("previewToggle").get(null));
                    bridge.getMethod("renderEditorPreview",Object.class,Object.class,Object.class,int.class).invoke(null,live,loader.loadClass("w1.n").getField("b").get(null),composer,0);
                    check(images.getField("image").get(null).equals(poster),"Poster button changed the sample movie");
                    check(images.getField("width").getFloat(null)==144f && images.getField("height").getFloat(null)==216f,"Poster button did not restore portrait dimensions");
                    check(visible.contains("Label preview") && visible.contains("15-Nov") && !visible.contains("Focused Item"),"Theme sample was not replaced by a date label");
                    check(composer.getClass().getField("groups").getInt(composer)==0 && composer.getClass().getField("nodes").getInt(composer)==0,"Unbalanced preview or swatch nodes");
                    check(initial.getClass().getField("first").getInt(initial)==(property==2?0x1976d2:0xffffff),"Custom editor received wrong RGB");
                    function0.getMethod("invoke").invoke(editor.getField("dismiss").get(null));
                    render.invoke(null,composer,prefs,"Appearance");
                    defaultsColor((Object[])build.invoke(null,loader,scope,composer,shape,prefs),property);
                    function0.getMethod("invoke").invoke(((List<?>)nativePicker.getField("swatches").get(null)).get(0));
                    render.invoke(null,composer,prefs,"Appearance");
                    Object custom=loader.loadClass("com.nuvio.tv.domain.model.CustomThemeColors").getConstructor(int.class,int.class,int.class).newInstance(0x123456,0x123456,0x123456);
                    function1.getMethod("invoke",Object.class).invoke(editor.getField("save").get(null),custom);
                    render.invoke(null,composer,prefs,"Appearance");
                    defaultsColor((Object[])build.invoke(null,loader,scope,composer,shape,prefs),property);
                    check(((List<?>)nativePicker.getField("drawn").get(null)).get(0).equals(0x8012345600000000L),"Custom swatch lost opacity after Apply in the editor");
                    Object restoredOpacity=nativePicker.getField("opacity").get(null);
                    check(restoredOpacity.getClass().getMethod("getValue").invoke(restoredOpacity).equals(50),"Custom Apply reset opacity to 100%");
                    // The old dialog's Apply commits custom RGB together with its native opacity.
                    Object translucent=loader.loadClass("d2.z").getConstructor(long.class).newInstance((marker&0x00ffffff00000000L)|0x8000000000000000L);
                    function1.getMethod("invoke",Object.class).invoke(rows.getField("select").get(null),translucent);
                    Object[] applied=(Object[])build.invoke(null,loader,scope,composer,shape,prefs);
                    long actual=property==2?applied[0].getClass().getField("background").getLong(applied[0]):((Number)applied[1]).longValue();
                    check(actual==0x8012345600000000L,"Native Apply lost custom RGB or opacity");
                    // Saved custom RGB must seed the editor on reopening, without alpha in the model.
                    clicks.clear();render.invoke(null,composer,prefs,"Appearance");
                    function0.getMethod("invoke").invoke(clicks.get(property));render.invoke(null,composer,prefs,"Appearance");
                    function0.getMethod("invoke").invoke(((List<?>)nativePicker.getField("swatches").get(null)).get(0));
                    render.invoke(null,composer,prefs,"Appearance");
                    check(editor.getField("initial").get(null).getClass().getField("first").getInt(editor.getField("initial").get(null))==0x123456,"Saved custom RGB was not restored");
                    function0.getMethod("invoke").invoke(editor.getField("dismiss").get(null));render.invoke(null,composer,prefs,"Appearance");

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
            Object translucent=loader.loadClass("d2.z").getConstructor(long.class).newInstance(0x8090ee9000000000L);
            function1.getMethod("invoke",Object.class).invoke(rows.getField("select").get(null),translucent);
            check(((Object[])build.invoke(null,loader,scope,composer,shape,prefs))[1].equals(0x8090ee9000000000L),"Native opacity selection was lost");
            function1.getMethod("invoke",Object.class).invoke(rows.getField("select").get(null),
                loader.loadClass("d2.z").getConstructor(long.class).newInstance(0xff90ee9000000000L));
            for (String other : List.of("santodan_nuvio_finale_dates","santodan_nuvio_movie_release_dates"))
                check(((Object[])build.invoke(null,loader,scope,composer,shape,other))[1].equals(style[1]),"Date patches did not share the selected style");
            Field states=bridge.getDeclaredField("STATES");states.setAccessible(true);((Map<?,?>)states.get(null)).clear();
            style=(Object[])build.invoke(null,loader,scope,composer,shape,prefs);
            check(style[1].equals(0xff90ee9000000000L),"Saved style did not survive state recreation");
            render.invoke(null,composer,prefs,"Appearance");function0.getMethod("invoke").invoke(loader.loadClass("gb.me").getField("toggle").get(null));
            clicks.clear();render.invoke(null,composer,prefs,"Appearance");function0.getMethod("invoke").invoke(clicks.get(5));
            defaults((Object[])build.invoke(null,loader,scope,composer,shape,prefs));
            for(int property:new int[]{2,4}) for(int opacityPercent:new int[]{0,30,100}) {
                clicks.clear();render.invoke(null,composer,prefs,"Appearance");
                function0.getMethod("invoke").invoke(clicks.get(property));render.invoke(null,composer,prefs,"Appearance");
                Class<?> picker=loader.loadClass("gb.jc"),editorUi=loader.loadClass("gb.x0"),text=loader.loadClass("y5.h2");
                Object pending=picker.getField("opacity").get(null);
                pending.getClass().getMethod("setValue",Object.class).invoke(pending,opacityPercent);
                function0.getMethod("invoke").invoke(((List<?>)picker.getField("swatches").get(null)).get(0));
                render.invoke(null,composer,prefs,"Appearance");
                int expectedAlpha=Math.round(opacityPercent*255f/100f);
                long preview=text.getField(property==2?"background":"foreground").getLong(null);
                check((preview>>>56)==expectedAlpha,"Custom preview ignored pending opacity "+opacityPercent);
                Class<?> customModel=loader.loadClass("com.nuvio.tv.domain.model.CustomThemeColors");
                Object customValue=customModel.getConstructor(int.class,int.class,int.class).newInstance(0x123456,0x123456,0x123456);
                function1.getMethod("invoke",Object.class).invoke(editorUi.getField("save").get(null),customValue);
                render.invoke(null,composer,prefs,"Appearance");
                Object restored=picker.getField("opacity").get(null);
                check(restored.getClass().getMethod("getValue").invoke(restored).equals(opacityPercent),"Editor Apply reset opacity "+opacityPercent);
                function1.getMethod("invoke",Object.class).invoke(rows.getField("select").get(null),rows.getField("selected").get(null));
                Object[] applied=(Object[])build.invoke(null,loader,scope,composer,shape,prefs);
                long result=property==2?applied[0].getClass().getField("background").getLong(applied[0]):((Number)applied[1]).longValue();
                check(result==(((long)expectedAlpha<<56)|0x0012345600000000L),"Native Apply lost custom opacity "+opacityPercent);
            }
            Class<?> model=loader.loadClass("software.santodan.extension.nuviomenu.DateLabelStyle");
            for(int property=0;property<5;property++) for(int invalid:new int[]{-1,999})
                check(model.getMethod("valid",int.class,int.class).invoke(null,property,invalid).equals(model.getMethod("defaultChoice",int.class).invoke(null,property)),"Invalid choice not sanitized");
            capture.invoke(null,metadata.newInstance("portrait-only",contentType.getField("MOVIE").get(null),"https://example.test/only-poster",null,null));
            String[] fallback=(String[])((List<?>)pool.get(null)).get(3);
            check(fallback[2].equals(fallback[3]),"Poster-only catalog did not retain the native landscape image fallback");
            for(int index=3;index<50;index++)capture.invoke(null,metadata.newInstance("movie"+index,contentType.getField("MOVIE").get(null),"https://example.test/"+index+"-poster","https://example.test/"+index+"-landscape",null));
            check(((List<?>)pool.get(null)).size()==24,"Preview artwork pool is not bounded");
            System.out.println("PASS: "+version+" random cached movie cover, independent Poster/Card button unaffected by app layout settings, stable movie during edits, bounded artwork pool, live label preview and existing color controls");
        }
    }
    private static void defaultsColor(Object[] style,int property)throws Exception {
        long actual=property==2?style[0].getClass().getField("background").getLong(style[0]):((Number)style[1]).longValue();
        check(actual==(property==2?0xff1976d200000000L:0xffffffff00000000L),"Editor changed preferences before native Apply or on Cancel");
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
