package santodan.patches;

import java.net.*;
import java.nio.file.*;
import java.lang.reflect.*;
import java.util.*;
import javax.tools.ToolProvider;

/** Exercises production editor sessions/callbacks; native input ABI is checked against the original APK separately. */
public final class VerifyNuvioLabelsRuntime {
    static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
    static ClassLoader loader; static Object composer; static Class<?> editor,rows,styles;
    static Object call(Class<?> type,String name,Object... args)throws Exception{
        Method m=Arrays.stream(type.getDeclaredMethods()).filter(x->x.getName().equals(name)&&x.getParameterCount()==args.length).findFirst().orElseThrow();m.setAccessible(true);return m.invoke(null,args);
    }
    static void invoke(Object fn,Object...args)throws Exception{
        Method m=Arrays.stream(fn.getClass().getMethods()).filter(x->x.getName().equals("invoke")&&x.getParameterCount()==args.length).findFirst().orElseThrow();m.invoke(fn,args);
    }
    static Object field(Class<?> c,String n)throws Exception{return c.getField(n).get(null);}
    static void render()throws Exception{call(editor,"renderSettings",composer);}
    static void action(String title)throws Exception{invoke(((Map<?,?>)field(rows,"actions")).get(title));render();}
    static void selectLabel(String id)throws Exception{
        Class<?> dropdown=loader.loadClass("fb.a");
        Object option=((List<?>)field(dropdown,"options")).stream().filter(x->{try{return x.getClass().getField("b").get(x).equals(id);}catch(Exception e){throw new RuntimeException(e);}}).findFirst().orElseThrow();
        invoke(field(dropdown,"choose"),option);render();
    }
    static void copy(String source,String part)throws Exception{action("Copy from another label");invoke(field(rows,"select"),source);render();invoke(field(rows,"select"),part);render();}
    static Map<String,Object> prefs;
    public static void main(String[] args)throws Exception{
        Path out=Files.createTempDirectory(Path.of(args[1]),"label-editor-");
        Map<String,String> sources=VerifyNuvio111DateStyleRuntime.fixtures();
        sources.put("androidx.compose.ui.platform.AndroidCompositionLocals_androidKt","package androidx.compose.ui.platform; public class AndroidCompositionLocals_androidKt {public static final Object a=new Object();}");
        sources.put("g1.h",sources.get("g1.h").replace("public long T=17;","public final android.content.res.Configuration viewport=new android.content.res.Configuration();public long T=17;").replace("if(key==na.c4.a)","if(key==androidx.compose.ui.platform.AndroidCompositionLocals_androidKt.a)return viewport;if(key==na.c4.a)"));
        sources.put("android.util.Log","package android.util; public class Log {public static int d(String t,String m){return 0;}}");
        sources.put("jb.x0","package jb; public class x0 {public static final Object a=new Object();}");
        sources.put("jb.e","package jb; public class e {public long a=0xff20202000000000L,l=0xffffffff00000000L;}");
        sources.put("g1.h",sources.get("g1.h").replace("if(key==na.c4.a)","if(key==jb.x0.a)return new jb.e();if(key==na.c4.a)"));
        sources.put("d2.z",sources.get("d2.z").replace("public long a;","public static long b(long color,float alpha){return (color&0x00ffffff00000000L)|((long)Math.round(alpha*255)<<56);}public long a;"));
        sources.put("android.content.SharedPreferences","\n            package android.content; public class SharedPreferences {\n            public final java.util.Map<String,Object> values=new java.util.HashMap<>();\n            public java.util.Map<String,?> getAll(){return new java.util.HashMap<>(values);} public boolean contains(String k){return values.containsKey(k);}\n            public int getInt(String k,int d){return (Integer)values.getOrDefault(k,d);} public long getLong(String k,long d){return (Long)values.getOrDefault(k,d);}\n            public String getString(String k,String d){return (String)values.getOrDefault(k,d);} public boolean getBoolean(String k,boolean d){return (Boolean)values.getOrDefault(k,d);}\n            public Editor edit(){return new Editor();} public class Editor { public Editor putInt(String k,int v){values.put(k,v);return this;} public Editor putLong(String k,long v){values.put(k,v);return this;} public Editor putString(String k,String v){values.put(k,v);return this;} public Editor putBoolean(String k,boolean v){values.put(k,v);return this;} public Editor remove(String k){values.remove(k);return this;} public void apply(){} } }\n            ");
        sources.put("android.content.res.Configuration","package android.content.res; public class Configuration {public int screenWidthDp=960,screenHeightDp=540;public java.util.Locale locale=java.util.Locale.ENGLISH;}");
        String app=sources.get("android.app.Application");
        app=app.replace("public String getPackageName()", "public final android.content.res.Resources resources=new android.content.res.Resources(); public android.content.res.Resources getResources(){return resources;} public String getString(int id){return resources.getString(id);} public String getPackageName()");
        sources.put("android.app.Application",app);
        sources.put("android.content.res.Resources","\n            package android.content.res; public class Resources {\n            public static class Configuration extends android.content.res.Configuration {} public final Configuration config=new Configuration(); public Configuration getConfiguration(){return config;}\n            public String getQuantityString(int id,int n){return \"Airs in %d days\";}\n            public String getString(int id){return switch(id){case 0x7f1103ed -> config.locale.equals(java.util.Locale.FRENCH)?\"Nouvelle saison\":\"New Season\";case 0x7f1103eb,0x7f1103ec -> \"New Episode\";case 0x7f1103ee,0x7f1103ef -> \"Next Up\";case 0x7f1103f2 -> \"Upcoming\";case 0x7f1103f1 -> \"Resume\";case 0x7f1103f0 -> \"%d%% watched\";case 0x7f1103e9,0x7f1103ea -> \"%s left\";case 0x7f1103e3,0x7f1103e4 -> \"Airs today\";case 0x7f1103e5,0x7f1103e6 -> \"Airs tomorrow\";default -> \"Airs %s\";};} }\n            ");
        String row=sources.get("gb.hd").replace("if(!gb.x0.inHeader||gb.x0.rowLayouts!=1)","if(false)").replace("width!=420f || height!=320f","width!=480f || height<180f||androidx.compose.foundation.layout.b.height>360f");
        row=row.replace("clicks.add(click);", "clicks.add(click);actions.put(title,click);");
        row=row.replace("public static Object selected;", "public static kotlin.jvm.functions.Function0 toggle; public static void m(String title,String desc,boolean checked,kotlin.jvm.functions.Function0 click,Object modifier,kotlin.jvm.functions.Function0 noop,boolean enabled,Object icon,long tint,boolean divider,Object composer,int flags,int defaults){toggle=click;} public static Object selected;");
        sources.put("gb.hd",row);
        sources.put("fb.d","package fb; public class d {public final String a,b; public d(String label,String value){a=label;b=value;}}");
        sources.put("fb.a","package fb; public class a {public static java.util.List<?> options;public static kotlin.jvm.functions.Function1 choose;public static String selected;public static void b(Object modifier,String title,String display,String value,boolean expanded,java.util.List<?> values,kotlin.jvm.functions.Function1 expand,kotlin.jvm.functions.Function1 select,boolean enabled,Object composer,int flags){if(androidx.compose.foundation.layout.b.width<200f||androidx.compose.foundation.layout.b.width>300f)throw new AssertionError(\"Selector escaped left panel\");if(fixture.Layout.phase!=0)throw new AssertionError(\"Header must remain outside scrolling controls\");fixture.Layout.phase=1;options=values;choose=select;selected=value;}}");
        sources.put("x.m",sources.get("x.m").replace("if(!vertical)","if(fixture.Layout.phase!=1)throw new AssertionError(\"Scroll must start below the selectors\");fixture.Layout.phase=2;if(!vertical)"));
        sources.put("fixture.Layout","package fixture; public class Layout {public static int phase;}");
        sources.put("d0.b0","package d0; public class b0 {public static final b0 a=new b0();public static w1.q a(b0 scope,w1.q modifier){if(fixture.Layout.phase!=1)throw new AssertionError();return modifier;}}");
        sources.put("d0.v1","package d0; public class v1 {public static Object a(Object spacing,Object alignment,Object composer,int flags){return new Object();}}");
        sources.put("gb.jg","package gb; public class jg {public static int rgb;public static kotlin.jvm.functions.Function1 change;public static void b(int color,int index,kotlin.jvm.functions.Function1 onChange,Object focus,Object modifier,Object composer,int flags){if(index!=0||focus==null||fixture.Layout.phase!=2)throw new AssertionError();fixture.Layout.phase=3;rgb=color;change=onChange;}public static void edit(int color){change.invoke(color);}}");
        sources.put("y5.h2",sources.get("y5.h2").replace("text.equals(\"15-Nov\")","modifier!=w1.n.b"));
        // Keep input rendering separate: actual native field constructors/branches are original-DEX validated.
        sources.put("software.santodan.extension.nuviomenu.NuvioLabelTextInput","package software.santodan.extension.nuviomenu; public final class NuvioLabelTextInput {public static Object text;static void render(Object c,Object t,Object f,Object s){text=t;}} ");
        String nativeSource=Files.readString(Path.of(args[0],"NuvioLabelStyles.java")).replace("boolean available() { return false; }","boolean available() { return true; }");
        sources.put("software.santodan.extension.nuviomenu.NuvioLabelStyles",nativeSource);
        sources.put("androidx.compose.ui.focus.h","package androidx.compose.ui.focus; public class h {}");
        // Focus requester raw name from shared contract (no rendering mocked through it).
        String focus=software.santodan.nuvio.NuvioNative.FOCUS_REQUESTER_NAME;
        sources.put(focus,"package "+focus.substring(0,focus.lastIndexOf('.'))+"; public class "+focus.substring(focus.lastIndexOf('.')+1)+" {}");
        sources.put("na.f2","package na; public class f2 {public static void B(kotlin.jvm.functions.Function0 close,String title,String description,float width,int p,boolean a,boolean b,Object c,Object d,float e,float f,float g,float h,Object extra,q1.t body,Object composer,int flags,int flags2,int defaults){if(title.isEmpty())fixture.Layout.phase=0;if(title.isEmpty()&&(width!=((g1.h)composer).viewport.screenWidthDp-48f||defaults!=14224||b||g!=16f))throw new AssertionError(\"Main editor must disable platform width and use explicit padding\");((kotlin.jvm.functions.Function3)body.body).invoke(null,composer,0);}}");
        List<String> compile=new ArrayList<>(List.of("-d",out.toString()));
        for(var entry:sources.entrySet()){Path file=out.resolve(entry.getKey().replace('.','/')+".java");Files.createDirectories(file.getParent());Files.writeString(file,entry.getValue());compile.add(file.toString());}
        for(String name:List.of("DateLabelStyle.java","NuvioDateLabelStyle.java","LabelCustomization.java","NuvioLabelsEditor.java"))compile.add(Path.of(args[0],name).toString());
        check(ToolProvider.getSystemJavaCompiler().run(null,null,null,compile.toArray(String[]::new))==0,"Fixture compile failed");
        try(URLClassLoader child=new URLClassLoader(new URL[]{out.toUri().toURL()},ClassLoader.getPlatformClassLoader())){
            loader=child;child.loadClass("android.app.Application").getField("version").set(null,"1.1.1");
            editor=child.loadClass("software.santodan.extension.nuviomenu.NuvioLabelsEditor");styles=child.loadClass("software.santodan.extension.nuviomenu.NuvioLabelStyles");rows=child.loadClass("gb.hd");composer=child.loadClass("g1.h").getConstructor().newInstance();
            Object store=call(styles,"prefs");prefs=(Map<String,Object>)store.getClass().getField("values").get(store);
            // Disabled settings preserve exact native values, including float bit patterns.
            call(styles,"begin","New Season");check(call(styles,"text","New Season").equals("New Season"),"Disabled caption changed");float raw=Float.intBitsToFloat(0x3f812345);check(Float.floatToRawIntBits((Float)call(styles,"padding",raw))==Float.floatToRawIntBits(raw),"Native padding rounded");call(styles,"end");
            render();invoke(field(rows,"toggle"));render();check(Boolean.TRUE.equals(prefs.get("enabled")),"Enable toggle failed");
            Object application=child.loadClass("android.app.ActivityThread").getField("APP").get(null);
            Object appResources=application.getClass().getMethod("getResources").invoke(application);
            Object appConfiguration=appResources.getClass().getMethod("getConfiguration").invoke(appResources);
            appConfiguration.getClass().getField("screenWidthDp").setInt(appConfiguration,480);
            appConfiguration.getClass().getField("screenHeightDp").setInt(appConfiguration,960);
            action("Label customization");
            Class<?> sizing=child.loadClass("androidx.compose.foundation.layout.b");
            float posterHeight=sizing.getField("height").getFloat(null),posterWidth=sizing.getField("width").getFloat(null);
            check(posterHeight>216f&&Math.abs(posterWidth/posterHeight-2f/3f)<0.001f,"Poster must grow to fit its panel without distortion");
            Class<?> nativeEditor=child.loadClass("gb.jg");Class<?> sliders=child.loadClass("gb.jc");
            call(nativeEditor,"edit",0x112233);render();action("Text");call(nativeEditor,"edit",0xaabbcc);render();
            invoke(((Map<?,?>)field(sliders,"changes")).get("Font size"),80);render();
            selectLabel("next_up");call(nativeEditor,"edit",0x123456);render();selectLabel("new_season");
            check(((Number)field(nativeEditor,"rgb")).intValue()==0xaabbcc,"Text draft lost on dropdown switch");
            action("Label text");
            Object textState=field(child.loadClass("software.santodan.extension.nuviomenu.NuvioLabelTextInput"),"text");
            textState.getClass().getMethod("setValue",Object.class).invoke(textState,"bad\ncaption");action("Apply text");
            check(((List<?>)field(child.loadClass("y5.h2"),"texts")).contains("Use up to 80 characters on one line"),"Invalid caption silently accepted");
            textState.getClass().getMethod("setValue",Object.class).invoke(textState,"S+");action("Apply text");
            selectLabel("next_up");copy("new_season","TEXT");
            action("Label");check(((Number)field(sliders,"values").getClass().getMethod("get",Object.class).invoke(field(sliders,"values"),"Label size")).intValue()==100,"Text copy changed label size");
            copy("new_season","LABEL");
            action("Apply");
            check(prefs.get("label_new_season:background_color").equals(0xff11223300000000L),"Background not saved");
            check(prefs.get("label_new_season:foreground_color").equals(0xffaabbcc00000000L),"Text not saved");
            check(prefs.get("label_next_up:foreground_color").equals(0xffaabbcc00000000L),"Text copy failed");
            check(prefs.get("label_next_up:background_color").equals(0xff11223300000000L),"Label copy failed");
            call(styles,"begin","Next Up");check(call(styles,"text","Next Up").equals("S+"),"Copied caption missing");check(call(styles,"text","8.3").equals("8.3"),"Rating score overwritten");call(styles,"end");
            action("Label customization");action("Reset label");selectLabel("next_up");copy("new_season","ALL");action("Cancel");
            check(prefs.containsKey("label_new_season:background_color"),"Cancel persisted reset");
            action("Label customization");action("Reset label");action("Apply");
            check(!prefs.containsKey("label_new_season:background_color")&&prefs.containsKey("label_next_up:background_color"),"Reset touched another label");
            check(((Map<?,?>)call(styles,"labels")).containsKey("remaining_count")&&((Map<?,?>)call(styles,"labels")).containsKey("date_label"),"Dependent badges missing from selector");
            Object[] countArgs={"8",child.loadClass("w1.n").getField("b").get(null),0xffffffff00000000L,0L,null,null,0L,null,0L,0,false,0,0,null,child.loadClass("h3.s0").getConstructor().newInstance(),composer,0,0,65528};
            prefs.put("label_remaining_count:text","{value} left");prefs.put("label_remaining_count:font_size_percent",150);call(styles,"invalidate");
            Object[] customized=(Object[])call(styles,"applyAdded","remaining_count",composer,(Object)countArgs);
            check(customized[0].equals("8 left")&&((Integer)customized[18]&8)==0,"Count caption/font defaults not customized");
            prefs.put("label_remaining_count:background_color",0x8012345600000000L);prefs.put("label_remaining_count:size_percent",150);prefs.put("label_remaining_count:position",8);call(styles,"invalidate");
            customized=(Object[])call(styles,"applyAdded","remaining_count",composer,(Object)countArgs);
            check(customized[1].getClass().getField("background").getLong(customized[1])==0x8012345600000000L,"Count background not applied");
            check(customized[1].getClass().getField("horizontal").getFloat(customized[1])==12f,"Count padding not scaled");
            countArgs[0]="7";check(((Object[])call(styles,"applyAdded","remaining_count",composer,(Object)countArgs))[0].equals("7 left"),"Remaining count stopped updating");
            prefs.put("enabled",false);check(call(styles,"applyAdded","remaining_count",composer,(Object)countArgs)==countArgs,"Disabled added badge changed native arguments");prefs.put("enabled",true);
            prefs.put("label_date_label:text","On {value}");prefs.put("label_date_label:foreground_color",0xff01020300000000L);call(styles,"invalidate");
            countArgs[0]="15-Nov";Object[] dateArgs=(Object[])call(styles,"applyAdded","date_label",composer,(Object)countArgs);
            check(dateArgs[0].equals("On 15-Nov")&&dateArgs[2].equals(0xff01020300000000L),"Date entry did not customize native label");
            Object appForDates=child.loadClass("android.app.ActivityThread").getField("APP").get(null);
            Object legacyStore=appForDates.getClass().getMethod("getSharedPreferences",String.class,int.class).invoke(appForDates,"santodan_nuvio_date_label_style",0);
            Map<String,Object> legacy=(Map<String,Object>)legacyStore.getClass().getField("values").get(legacyStore);
            legacy.put("date_label_background_color",0x8055667700000000L);legacy.put("date_label_size_percent",120);legacy.put("unmanaged",42);
            prefs.remove("label_date_label:text");prefs.remove("label_date_label:foreground_color");call(styles,"invalidate");
            Object migrated=call(styles,"draft","date_label");
            check(migrated.getClass().getMethod("color",boolean.class).invoke(migrated,true).equals(0x8055667700000000L),"Existing date appearance not loaded into shared editor");
            check(migrated.getClass().getMethod("size",boolean.class).invoke(migrated,true).equals(120),"Existing date size lost");
            migrated.getClass().getMethod("reset").invoke(migrated);call(styles,"save",List.of(migrated));
            check(!legacy.containsKey("date_label_background_color")&&legacy.get("unmanaged").equals(42),"Date reset failed to clear legacy overrides or removed unrelated settings");
            // Discovered badge registry: no writes while disabled, bounded, and evicts only uncustomized discoveries.
            java.util.function.Supplier<Long> names=()->prefs.keySet().stream().filter(k->k.startsWith("name_")).count();
            java.util.function.Function<String,String> idOf=title->{try{return ((Map<String,String>)call(styles,"labels")).entrySet().stream().filter(e->e.getValue().equals(title)).map(Map.Entry::getKey).findFirst().orElse(null);}catch(Exception e){throw new RuntimeException(e);}};
            prefs.put("enabled",false);long before=names.get();
            call(styles,"beginMetadata","Quiet tag");call(styles,"end");call(styles,"beginMetadata","Quiet tag");call(styles,"end");
            check(names.get()==before,"Disabled label discovery wrote preferences");check(idOf.apply("Metadata: Quiet tag")!=null,"Disabled discovery not listed for the editor");
            prefs.put("enabled",true);
            call(styles,"beginMetadata","Kept tag");call(styles,"end");String kept=idOf.apply("Metadata: Kept tag");
            check(kept!=null&&prefs.containsKey("name_"+kept),"Enabled discovery not persisted");
            prefs.put("label_"+kept+":text","KT");call(styles,"invalidate");
            var maxField=styles.getDeclaredField("MAX_LABELS");maxField.setAccessible(true);int max=maxField.getInt(null);
            for(int i=0;i<max+40;i++){call(styles,"beginMetadata","Stream tag "+i);call(styles,"end");}
            Map<String,String> registry=(Map<String,String>)call(styles,"labels");
            check(registry.size()<=max&&names.get()<=max,"Label registry exceeded its bound");
            check(registry.containsKey(kept)&&prefs.containsKey("name_"+kept),"Customized discovered label was evicted");
            check(registry.containsKey("new_season")&&registry.containsKey("date_label"),"Built-in label evicted");
            check(idOf.apply("Metadata: Stream tag "+(max+39))!=null,"Full registry refused a new badge instead of evicting");
            check(idOf.apply("Metadata: Stream tag 0")==null&&!prefs.containsKey("name_"+idOf.apply("Metadata: Stream tag 0")),"Oldest uncustomized discovery not evicted");
            call(styles,"beginMetadata","Kept tag");check(call(styles,"text","Kept tag").equals("KT"),"Customized discovered label lost its override");call(styles,"end");
            prefs.remove("label_"+kept+":text");call(styles,"invalidate");
            // Localised aliases rebuild without changing stable per-label settings.
            Object appObject=child.loadClass("android.app.ActivityThread").getField("APP").get(null);Object resources=appObject.getClass().getMethod("getResources").invoke(appObject);Object config=resources.getClass().getMethod("getConfiguration").invoke(resources);config.getClass().getField("locale").set(config,Locale.FRENCH);
            call(styles,"begin","Nouvelle saison");check(call(styles,"foreground",0xff01020300000000L).equals(0xff01020300000000L),"Reset did not restore translated native style");call(styles,"end");
            Object activityConfiguration=composer.getClass().getField("viewport").get(composer);
            activityConfiguration.getClass().getField("screenWidthDp").setInt(activityConfiguration,800);activityConfiguration.getClass().getField("screenHeightDp").setInt(activityConfiguration,480);
            action("Label customization");action("Cancel");
            check(((Number)composer.getClass().getField("groups").get(composer)).intValue()==0,"Unbalanced editor Compose groups");
        }
        System.out.println("PASS: one-row dropdown and Text/Label controls, weighted scrolling customization below, enlarged right preview, native RGB picker, horizontal targets, sliders outside preview, per-label drafts, copy Text/Label/All, Apply/Cancel, isolated reset, locale and disabled identity");
    }
}
