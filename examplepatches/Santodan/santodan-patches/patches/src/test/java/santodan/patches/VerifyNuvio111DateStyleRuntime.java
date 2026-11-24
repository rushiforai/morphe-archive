package santodan.patches;

import java.net.*;
import java.nio.file.*;
import java.lang.reflect.*;
import java.util.*;
import javax.tools.ToolProvider;

/** Exercises production settings callbacks and modifier construction against the reviewed 1.1.1 layout. */
public final class VerifyNuvio111DateStyleRuntime {
    static Map<String,String> fixtures() {
        Map<String,String> sources = new LinkedHashMap<>();
        sources.put("android.content.Context", "package android.content; public class Context { public static final int MODE_PRIVATE=0; }");
        sources.put("android.content.SharedPreferences", "package android.content; public class SharedPreferences { public final java.util.Map<String,Object> values=new java.util.HashMap<>(); public int getInt(String k,int d){return (Integer)values.getOrDefault(k,d);} public long getLong(String k,long d){return (Long)values.getOrDefault(k,d);} public Editor edit(){return new Editor();} public class Editor { public Editor putInt(String k,int v){values.put(k,v);return this;} public Editor putLong(String k,long v){values.put(k,v);return this;} public Editor remove(String k){values.remove(k);return this;} public void apply(){} } }");
        sources.put("android.app.Application", "package android.app; public class Application extends android.content.Context { public static String version; public final java.util.Map<String,android.content.SharedPreferences> stores=new java.util.HashMap<>(); public android.content.SharedPreferences getSharedPreferences(String n,int m){return stores.computeIfAbsent(n,k->new android.content.SharedPreferences());} public String getPackageName(){return \"com.nuvio.tv\";} public Manager getPackageManager(){return new Manager();} public static class Manager { public Info getPackageInfo(String n,int f){return new Info();} } public static class Info { public String versionName=version; } }");
        sources.put("android.app.ActivityThread", "package android.app; public class ActivityThread { public static final Application APP=new Application(); public static Application currentApplication(){return APP;} }");
        sources.put("kotlin.Unit", "package kotlin; public class Unit { public static final Unit INSTANCE=new Unit(); }");
        for (int count : new int[]{0,1,3}) sources.put("kotlin.jvm.functions.Function"+count,
            "package kotlin.jvm.functions; public interface Function"+count+" { Object invoke("+(count==0?"":count==1?"Object a":"Object a,Object b,Object c")+"); }");
        sources.put("g1.h", "package g1; public class h { public long T=17; public boolean S=true; public int groups,nodes,reuses; public final java.util.Stack<Integer> keys=new java.util.Stack<>(); public int key(){return keys.isEmpty()?0:keys.peek();} public static class State { public Object value; public State(Object v){value=v;} public Object getValue(){return value;} public void setValue(Object v){value=v;} } public static State s(Object v){return new State(v);} public boolean landscape; public Object j(Object key){if(key==na.c4.a)return landscape;return new y5.j2.Type();} public void d0(int key){groups++;keys.push(key);} public void p(boolean node){if(node)nodes--;else {groups--;keys.pop();}if(groups<0||nodes<0)throw new AssertionError(\"Unbalanced Compose groups\");} public Object l(){return new Object();} public void h0(){nodes++;} public void k(Object factory){} public void r0(){reuses++;} public static void F(Object composer,Object value,Object setter){} public static void y(Object composer,Object init){} }");
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
        sources.put("w1.b", "package w1; public class b { public static final w1.h j=new w1.h(0f); public static final String a=\"a\",b=\"b\",c=\"c\",d=\"d\",e=\"e\",f=\"f\",g=\"g\",h=\"h\",i=\"i\"; }");
        sources.put("d0.v", "package d0; public class v { public static final v a=new v(); public w1.q a(w1.q modifier,String alignment){w1.n n=new w1.n();n.alignment=alignment;return n;} }");
        sources.put("d0.b", "package d0; public class b { public static w1.q u(w1.q m,float inset){((w1.n)m).inset=inset;return m;} public static w1.q v(w1.q m,float h,float v){((w1.n)m).horizontal=h;((w1.n)m).vertical=v;return m;} }");
        sources.put("a2.j", "package a2; public class j { public static w1.q b(w1.q m,Object shape){return m;} }");
        sources.put("x.m", "package x; public class m { public static k2 r(Object composer){return new k2();} public static w1.q s(w1.q m,k2 state,boolean vertical){if(!vertical)throw new AssertionError();return m;} public static w1.q g(w1.q m,long color,Object shape){((w1.n)m).background=color;return m;} }");
        sources.put("x.k2", "package x; public class k2 {} ");
        sources.put("d2.i0", "package d2; public class i0 { public static final Object b=new Object(); }");
        for (String name : List.of("na.p1")) sources.put(name,"package na; public class "+name.substring(3)+" { public static final Object a=new Object(); }");
        sources.put("gb.me", "package gb; public class me { public static kotlin.jvm.functions.Function0 toggle; public static void a(String title,String desc,boolean expanded,kotlin.jvm.functions.Function0 t,Object modifier,Object icon,Object focus,kotlin.jvm.functions.Function0 noop,q1.t body,Object composer,int flags){throw new AssertionError(\"Date appearance must not be collapsible\");} }");
        for (String name : List.of("gb.qd")) sources.put(name, "package gb; public class "+name.substring(3)+" { public final Object value; public "+name.substring(3)+"(Object value,String title,String desc,String trailing,Object font,int mask){if(mask!=28)throw new AssertionError();this.value=value;} }");
        String row = " { public static final java.util.List<kotlin.jvm.functions.Function0> clicks=new java.util.ArrayList<>(); public static java.util.List<?> options; public static final java.util.Map<String,kotlin.jvm.functions.Function0> actions=new java.util.HashMap<>(); public static kotlin.jvm.functions.Function0 previewToggle; public static String previewMode; public static void d(String text,kotlin.jvm.functions.Function0 click,boolean primary,boolean enabled,Object composer,int flags,int defaults){if(text.equals(\"Text\")||text.equals(\"Label\")){if(!gb.x0.inHeader||gb.x0.rowLayouts!=1)throw new AssertionError(\"Target button outside top row\");gb.x0.headerButtons.add(text);}if(gb.x0.inPreview&&!text.startsWith(\"Switch to\"))throw new AssertionError(\"Editing action rendered inside preview\");if(primary||!enabled)throw new AssertionError(\"Preview button disabled\");if(gb.x0.inControls)gb.x0.controlOrder.add(text);actions.put(text,click);if(text.startsWith(\"Switch to\")){previewToggle=click;previewMode=text;}} public static Object selected; public static kotlin.jvm.functions.Function1 select; public static kotlin.jvm.functions.Function0 dismiss; public static void a(String title,String desc,String value,kotlin.jvm.functions.Function0 click,Object modifier,kotlin.jvm.functions.Function0 noop,boolean enabled,Object icon,Object titleIcon,long tint,Object leading,Integer raw,float size,long color,Object composer,int flags,int flags2,int defaults){if(defaults!=16336)throw new AssertionError();clicks.add(click);} public static void j(String title,java.util.List<?> values,Object current,kotlin.jvm.functions.Function1 choose,kotlin.jvm.functions.Function0 close,String subtitle,float width,float height,Object composer,int flags,int defaults){if(defaults!=32 || width!=420f || height!=320f)throw new AssertionError(\"Picker must have visible dimensions\");options=values;selected=current;select=choose;dismiss=close;} }";
        for (String name : List.of("gb.hd")) sources.put(name, "package gb; public class "+name.substring(3)+row);
        sources.put("gb.jc", "package gb; public class jc { public static g1.h.State opacity; public static final java.util.Map<String,kotlin.jvm.functions.Function1> changes=new java.util.HashMap<>(); public static final java.util.Map<String,Integer> values=new java.util.HashMap<>(); public static final java.util.List<kotlin.jvm.functions.Function0> swatches=new java.util.ArrayList<>(); public static final java.util.List<String> labels=new java.util.ArrayList<>(); public static final java.util.List<Long> drawn=new java.util.ArrayList<>(); public static void c(String title,long color,boolean transparent,kotlin.jvm.functions.Function0 click,kotlin.jvm.functions.Function0 focus,boolean enabled,Object composer,int flags,int defaults){gb.hd.clicks.add(click);} public static void j(String title,int value,String text,int min,int max,int step,kotlin.jvm.functions.Function1 change,String subtitle,kotlin.jvm.functions.Function0 focus,boolean enabled,Object modifier,Object composer,int flags,int defaults){if(gb.x0.inPreview)throw new AssertionError(\"Slider rendered inside preview\");if(!enabled||defaults!=128||!text.equals(value+\"%\"))throw new AssertionError();if(title.endsWith(\"opacity\")){if(min!=0||max!=100||step!=1)throw new AssertionError();}else if(min!=50||max!=200||step!=10)throw new AssertionError();if(gb.x0.inControls)gb.x0.controlOrder.add(title);changes.put(title,change);values.put(title,value);} public static void a(long color,boolean selected,boolean transparent,kotlin.jvm.functions.Function0 original,w1.q modifier,g1.h composer,int flags)throws Exception{if(software.santodan.extension.nuviomenu.NuvioDateLabelStyle.renderLabeledSwatch(color,selected,transparent,original,modifier,composer,flags))return;Object click=software.santodan.extension.nuviomenu.NuvioDateLabelStyle.colorSwatchClick(color,selected,transparent,original);if(click!=original)throw new AssertionError(\"Inner native callback replaced\");drawn.add(color);swatches.add((kotlin.jvm.functions.Function0)click);labels.add(software.santodan.extension.nuviomenu.NuvioDateLabelStyle.colorSwatchLabel(color,\"native label\"));} public static void b(String title,java.util.List<?> colors,long selected,boolean transparent,kotlin.jvm.functions.Function1 select,kotlin.jvm.functions.Function0 dismiss,Object composer,int flags,int defaults)throws Exception{opacity=new g1.h.State(Math.round((selected>>>56)*100f/255f));software.santodan.extension.nuviomenu.NuvioDateLabelStyle.bindColorOpacity(opacity);gb.hd.options=colors;gb.hd.selected=new d2.z(selected);gb.hd.select=select;gb.hd.dismiss=dismiss;swatches.clear();labels.clear();drawn.clear();for(Object item:colors){d2.z color=(d2.z)item;kotlin.jvm.functions.Function0 original=()->{gb.hd.selected=color;return kotlin.Unit.INSTANCE;};a(color.a,false,color.a==0,original,w1.n.b,(g1.h)composer,0);}} }");
        sources.put("com.nuvio.tv.domain.model.CustomThemeColors", "package com.nuvio.tv.domain.model; public class CustomThemeColors { public final int first,second,third; public CustomThemeColors(int a,int b,int c){if(a<0||a>0xffffff||b<0||b>0xffffff||c<0||c>0xffffff)throw new IllegalArgumentException(\"Failed requirement.\");first=a;second=b;third=c;} public int getFirst(){return first;} }");
        sources.put("gb.x0", "package gb; public class x0 { public static com.nuvio.tv.domain.model.CustomThemeColors initial; public static kotlin.jvm.functions.Function1 save; public static kotlin.jvm.functions.Function0 dismiss; public static int key; public static g1.h current; public static boolean inPreview,inHeader,inControls; public static final java.util.List<String> controlOrder=new java.util.ArrayList<>(); public static int rowLayouts; public static final java.util.List<String> headerButtons=new java.util.ArrayList<>(); public static void draw()throws Exception{inHeader=true;rowLayouts=0;headerButtons.clear();software.santodan.extension.nuviomenu.NuvioDateLabelStyle.renderEditorTargetRow(initial,current);inHeader=false;if(rowLayouts!=1||!headerButtons.equals(java.util.List.of(\"Text\",\"Label\")))throw new AssertionError(\"Top selector must be one horizontal Text/Label row\");inControls=true;controlOrder.clear();software.santodan.extension.nuviomenu.NuvioDateLabelStyle.renderEditorControls(initial,current);inControls=false;if(controlOrder.size()!=4||!controlOrder.get(0).endsWith(\"opacity\")||!controlOrder.get(1).endsWith(\"size\"))throw new AssertionError(\"Opacity and size must be first below picker\");inPreview=true;try{software.santodan.extension.nuviomenu.NuvioDateLabelStyle.renderEditorPreview(initial,w1.n.b,current,0);}finally{inPreview=false;}} public static void edit(int rgb)throws Exception{initial=new com.nuvio.tv.domain.model.CustomThemeColors(rgb,rgb,rgb);draw();} public static void a(com.nuvio.tv.domain.model.CustomThemeColors colors,boolean gradient,kotlin.jvm.functions.Function1 onSave,kotlin.jvm.functions.Function0 onDismiss,g1.h composer,int flags)throws Exception{if(gradient || colors.first!=colors.second || colors.first!=colors.third)throw new AssertionError();if(key!=composer.key()){initial=colors;key=composer.key();}current=composer;save=onSave;dismiss=onDismiss;draw();} }");
        sources.put("androidx.compose.foundation.layout.b", "package androidx.compose.foundation.layout; public class b { public static float width,height; public static w1.q q(w1.q modifier,float value){width=value;return modifier;} public static w1.q h(w1.q modifier,float value){height=value;return modifier;} public static w1.q j(w1.q modifier,float value){throw new AssertionError(\"requiredSize is not height\");} public static w1.q d(w1.q modifier,float fill){if(fill!=1f)throw new AssertionError();return modifier;} }");
        sources.put("d0.i", "package d0; public class i { public static Object g(float spacing){return spacing;} }");
        sources.put("w1.h", "package w1; public class h { public h(float bias){} }");
        sources.put("d0.v1", "package d0; public class v1 { public static Object a(Object spacing,Object alignment,Object composer,int flags){if(!(alignment instanceof w1.h)||!gb.x0.inHeader)throw new AssertionError();gb.x0.rowLayouts++;return new Object();} }");
        sources.put("d0.y", "package d0; public class y { public static Object a(Object spacing,Object alignment,Object composer,int flags){if(!(alignment instanceof w1.g))throw new AssertionError();return new Object();} }");
        sources.put("d0.q", "package d0; public class q { public static Object d(Object alignment,boolean propagate){if(propagate)throw new AssertionError();return new Object();} }");
        sources.put("w1.g", "package w1; public class g { public float bias; public g(float bias){this.bias=bias;if(bias!=0)throw new AssertionError();} }");
        sources.put("w2.i", "package w2; public class i { public static final Object b=new Object(),f=new Object(),e=new Object(),g=new Object(),h=new Object(),d=new Object(); }");
        sources.put("w1.a", "package w1; public class a { public static q c(Object composer,q modifier){return modifier;} }");
        sources.put("y5.h2", "package y5; public class h2 { public static final java.util.List<String> texts=new java.util.ArrayList<>(); public static long background,foreground,font; public static float horizontal; public static void b(String text,w1.q modifier,long color,long size,Object weight,Object family,long spacing,Object decoration,long height,int overflow,boolean wrap,int max,int min,Object layout,Object style,Object composer,int flags,int flags2,int defaults){if(defaults!=65520)throw new AssertionError();texts.add(text);if(text.equals(\"15-Nov\")){horizontal=((w1.n)modifier).horizontal;background=((w1.n)modifier).background;foreground=color;font=size;}} }");
        sources.put("na.c4", "package na; public class c4 { public static final Object a=new Object(); }");
        sources.put("u2.l", "package u2; public class l { public static final Object a=new Object(); }");
        sources.put("com.nuvio.tv.domain.model.ContentType", "package com.nuvio.tv.domain.model; public enum ContentType { MOVIE,SERIES }");
        sources.put("com.nuvio.tv.domain.model.MetaPreview", "package com.nuvio.tv.domain.model; public class MetaPreview { public String id,name,poster,landscape,background; public ContentType type; public MetaPreview(String id,ContentType type,String poster,String landscape,String background){this.id=id;this.type=type;this.name=id;this.poster=poster;this.landscape=landscape;this.background=background;} public String getId(){return id;} public ContentType getType(){return type;} public String getName(){return name;} public String getPoster(){return poster;} public String getLandscapePoster(){return landscape;} public String getBackground(){return background;} }");
        sources.put("gb.cj", "package gb; public class cj { public static String image; public static float width,height; public static void a(Object model,String title,w1.q modifier,Object alignment,Object scale,float alpha,g1.h composer,int flags,int defaults){if(scale!=u2.l.a||alpha!=1f||defaults!=0)throw new AssertionError(\"Native image defaults changed\");image=(String)model;width=androidx.compose.foundation.layout.b.width;height=androidx.compose.foundation.layout.b.height;} }");
        return sources;
    }
    public static void main(String[] args) throws Exception {
        Path dir = Files.createTempDirectory(Path.of(args[1]), "date-label-style-");
        Map<String,String> sources = fixtures();
        List<String> compile = new ArrayList<>(List.of("-d", dir.toString()));
        for (var source : sources.entrySet()) { Path file=dir.resolve(source.getKey().replace('.','/')+".java");Files.createDirectories(file.getParent());Files.writeString(file,source.getValue());compile.add(file.toString()); }
        for (String file : List.of("DateLabelStyle.java","NuvioDateLabelStyle.java")) compile.add(Path.of(args[0],file).toString());
        check(ToolProvider.getSystemJavaCompiler().run(null,null,null,compile.toArray(String[]::new))==0,"Compile failed");
        for (String version : List.of("1.1.1")) try (URLClassLoader loader=new URLClassLoader(new URL[]{dir.toUri().toURL()},ClassLoader.getPlatformClassLoader())) {
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
            check(clicks.size()==1,"Appearance must be one clickable row");
            Class<?> editor=loader.loadClass("gb.x0"),sliders=loader.loadClass("gb.jc"),text=loader.loadClass("y5.h2");
            Map<String,Object> actions=(Map<String,Object>)rows.getField("actions").get(null);
            Map<String,Object> changes=(Map<String,Object>)sliders.getField("changes").get(null);
            Map<String,Integer> values=(Map<String,Integer>)sliders.getField("values").get(null);
            Method invoke0=function0.getMethod("invoke"),invoke1=function1.getMethod("invoke",Object.class);
            Method edit=editor.getMethod("edit",int.class);
            // One menu, both targets, one shared draft and one Apply.
            invoke0.invoke(clicks.get(0));render.invoke(null,composer,prefs,"Appearance");
            check(actions.containsKey("Text")&&actions.containsKey("Label"),"Missing in-menu target selector");
            edit.invoke(null,0x112233);invoke1.invoke(changes.get("Label opacity"),30);invoke1.invoke(changes.get("Label size"),160);edit.invoke(null,0x112233);
            Class<?> images=loader.loadClass("gb.cj");String poster=(String)images.getField("image").get(null);
            invoke0.invoke(actions.get("Text"));render.invoke(null,composer,prefs,"Appearance");
            check(editor.getField("initial").get(null).getClass().getField("first").getInt(editor.getField("initial").get(null))==0xffffff,"Text inherited label RGB");
            edit.invoke(null,0xabcdef);invoke1.invoke(changes.get("Font opacity"),50);invoke1.invoke(changes.get("Font size"),120);edit.invoke(null,0xabcdef);
            invoke0.invoke(actions.get("Label"));render.invoke(null,composer,prefs,"Appearance");
            check(editor.getField("initial").get(null).getClass().getField("first").getInt(editor.getField("initial").get(null))==0x112233,"Switching targets lost label RGB");
            check(values.get("Label size")==160&&values.get("Label opacity")==30,"Switching targets lost label controls");
            check(text.getField("background").getLong(null)==0x4d11223300000000L&&text.getField("foreground").getLong(null)==0x80abcdef00000000L,"Preview does not combine both drafts");
            check(images.getField("image").get(null).equals(poster),"Switching targets changed sample movie");
            invoke0.invoke(actions.get("Label position"));render.invoke(null,composer,prefs,"Appearance");
            List<?> options=(List<?>)rows.getField("options").get(null);Object last=options.get(options.size()-1);
            invoke1.invoke(rows.getField("select").get(null),last.getClass().getField("value").get(last));render.invoke(null,composer,prefs,"Appearance");
            defaults((Object[])build.invoke(null,loader,scope,composer,shape,prefs));
            // Cancel must discard both targets and position, including the native remembered model.
            invoke0.invoke(editor.getField("dismiss").get(null));
            clicks.clear();render.invoke(null,composer,prefs,"Appearance");invoke0.invoke(clicks.get(0));render.invoke(null,composer,prefs,"Appearance");
            check(editor.getField("initial").get(null).getClass().getField("first").getInt(editor.getField("initial").get(null))==0x1976d2,"Reopening reused canceled native RGB state");
            check(values.get("Label size")==100&&values.get("Label opacity")==100,"Cancel retained label controls");
            invoke0.invoke(actions.get("Text"));render.invoke(null,composer,prefs,"Appearance");
            check(values.get("Font size")==100&&values.get("Font opacity")==100,"Cancel retained text controls");
            invoke0.invoke(editor.getField("dismiss").get(null));
            for(int opacityPercent:new int[]{0,30,50,100}) {
                clicks.clear();render.invoke(null,composer,prefs,"Appearance");invoke0.invoke(clicks.get(0));render.invoke(null,composer,prefs,"Appearance");
                edit.invoke(null,0x123456);invoke1.invoke(changes.get("Label opacity"),opacityPercent);invoke1.invoke(changes.get("Label size"),160);edit.invoke(null,0x123456);
                long expected=((long)Math.round(opacityPercent*255f/100f)<<56)|0x0012345600000000L;
                check(text.getField("background").getLong(null)==expected&&text.getField("horizontal").getFloat(null)==12.8f,"Live label preview mismatch");
                invoke0.invoke(actions.get("Text"));render.invoke(null,composer,prefs,"Appearance");
                edit.invoke(null,0xabcdef);invoke1.invoke(changes.get("Font opacity"),opacityPercent);invoke1.invoke(changes.get("Font size"),120);edit.invoke(null,0xabcdef);
                long expectedText=((long)Math.round(opacityPercent*255f/100f)<<56)|0x00abcdef00000000L;
                check(text.getField("foreground").getLong(null)==expectedText,"Live text preview mismatch");
                invoke0.invoke(actions.get("Label position"));render.invoke(null,composer,prefs,"Appearance");
                options=(List<?>)rows.getField("options").get(null);last=options.get(options.size()-1);invoke1.invoke(rows.getField("select").get(null),last.getClass().getField("value").get(last));render.invoke(null,composer,prefs,"Appearance");
                invoke0.invoke(rows.getField("previewToggle").get(null));edit.invoke(null,0xabcdef);check(images.getField("width").getFloat(null)==256f,"Card switch failed");
                invoke0.invoke(rows.getField("previewToggle").get(null));edit.invoke(null,0xabcdef);check(images.getField("width").getFloat(null)==144f,"Poster switch failed");
                check(bridge.getMethod("editorSaveResource",int.class).invoke(null,0x7f1103d8).equals(0x7f11006c),"Editor must say Apply");
                invoke1.invoke(editor.getField("save").get(null),editor.getField("initial").get(null));
                Object[] applied=(Object[])build.invoke(null,loader,scope,composer,shape,prefs);
                check(applied[0].getClass().getField("background").getLong(applied[0])==expected&&applied[1].equals(expectedText),"Apply did not save both targets");
                check(applied[0].getClass().getField("alignment").get(applied[0]).equals("i"),"Position not applied");
                check(composer.getClass().getField("groups").getInt(composer)==0&&composer.getClass().getField("nodes").getInt(composer)==0,"Unbalanced editor groups");
                check(bridge.getMethod("editorSaveResource",int.class).invoke(null,0x7f1103d8).equals(0x7f1103d8),"Theme button changed outside editor");
            }
            Field states=bridge.getDeclaredField("STATES");states.setAccessible(true);((Map<?,?>)states.get(null)).clear();
            Object[] restored=(Object[])build.invoke(null,loader,scope,composer,shape,prefs);check(restored[1].equals(0xffabcdef00000000L),"Saved appearance lost on state recreation");
            clicks.clear();render.invoke(null,composer,prefs,"Appearance");invoke0.invoke(clicks.get(0));render.invoke(null,composer,prefs,"Appearance");
            invoke0.invoke(actions.get("Reset appearance"));render.invoke(null,composer,prefs,"Appearance");
            check(editor.getField("initial").get(null).getClass().getField("first").getInt(editor.getField("initial").get(null))==0x1976d2,"Reset did not replace native RGB state");
            check(values.get("Label size")==100&&values.get("Label opacity")==100,"Reset did not clear draft controls");
            check(((Object[])build.invoke(null,loader,scope,composer,shape,prefs))[1].equals(0xffabcdef00000000L),"Reset persisted before Apply");
            invoke1.invoke(editor.getField("save").get(null),editor.getField("initial").get(null));defaults((Object[])build.invoke(null,loader,scope,composer,shape,prefs));
            int controlCount=changes.size();
            bridge.getMethod("renderEditorControls",Object.class,Object.class).invoke(null,null,composer);
            bridge.getMethod("renderEditorTargetRow",Object.class,Object.class).invoke(null,null,composer);
            check(changes.size()==controlCount,"Ordinary theme editing gained date-label controls");
            Class<?> model=loader.loadClass("software.santodan.extension.nuviomenu.DateLabelStyle");
            for(int property=0;property<5;property++) for(int invalid:new int[]{-1,999})
                check(model.getMethod("valid",int.class,int.class).invoke(null,property,invalid).equals(model.getMethod("defaultChoice",int.class).invoke(null,property)),"Invalid choice not sanitized");
            capture.invoke(null,metadata.newInstance("portrait-only",contentType.getField("MOVIE").get(null),"https://example.test/only-poster",null,null));
            String[] fallback=(String[])((List<?>)pool.get(null)).get(3);
            check(fallback[2].equals(fallback[3]),"Poster-only catalog did not retain the native landscape image fallback");
            for(int index=3;index<50;index++)capture.invoke(null,metadata.newInstance("movie"+index,contentType.getField("MOVIE").get(null),"https://example.test/"+index+"-poster","https://example.test/"+index+"-landscape",null));
            check(((List<?>)pool.get(null)).size()==24,"Preview artwork pool is not bounded");
            System.out.println("PASS: "+version+" top horizontal Text/Label selector before editor controls, per-target RGB/opacity/size restore, Apply/Cancel and isolated preview");
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
