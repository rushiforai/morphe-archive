package santodan.patches

import java.io.File
import java.net.URLClassLoader
import java.nio.file.Files
import javax.tools.ToolProvider
import software.santodan.extension.nuviobuttons.ButtonLayout

/** Runs the production extension, including callbacks and persistence, against native-signature fixtures. */
fun main(args: Array<String>) {
    val root = Files.createTempDirectory(File(args[1]).apply { mkdirs() }.toPath(), "buttons-runtime-")
    val sources = mapOf(
        "fixture.Overloads" to """package fixture; public class Overloads {
            public void action(String value){} public void action(Integer value){}
        }""",
        "android.view.KeyEvent" to """package android.view; public class KeyEvent {
            public static final int ACTION_DOWN=0,ACTION_UP=1,KEYCODE_BACK=4,KEYCODE_DPAD_UP=19,KEYCODE_DPAD_DOWN=20,
                KEYCODE_DPAD_LEFT=21,KEYCODE_DPAD_RIGHT=22,KEYCODE_DPAD_CENTER=23,KEYCODE_ENTER=66,KEYCODE_NUMPAD_ENTER=160;
            int action,code,repeat;long down,time;boolean canceled;
            public KeyEvent(int a,int c,int r,long d,long t,boolean x){action=a;code=c;repeat=r;down=d;time=t;canceled=x;}
            public int getAction(){return action;}public int getKeyCode(){return code;}public int getRepeatCount(){return repeat;}
            public long getDownTime(){return down;}public long getEventTime(){return time;}public boolean isCanceled(){return canceled;}
        }""",
        "android.view.ViewConfiguration" to """package android.view; public class ViewConfiguration {public static int getLongPressTimeout(){return 500;}}""",
        "w1.Modifier" to """package w1; public class Modifier {public kotlin.jvm.functions.Function1 key;public Object focus; public float height; public Modifier copy(){Modifier m=new Modifier();m.key=key;m.focus=focus;m.height=height;return m;}}""",
        "w1.n" to """package w1; public class n {public static Modifier b=new Modifier();}""",
        "o2.b" to """package o2; public class b {public android.view.KeyEvent a;public b(android.view.KeyEvent e){a=e;}}""",
        "o2.d" to """package o2; public class d {public static w1.Modifier e(w1.Modifier m,kotlin.jvm.functions.Function1 f){m=m.copy();m.key=f;return m;}}""",
        "b2.a0" to """package b2; public class a0 {public int requests;}""",
        "b2.d" to """package b2; public class d {public static w1.Modifier d(w1.Modifier m,b2.a0 f){m=m.copy();m.focus=f;return m;}}""",
        "g.e" to """package g; public class e {public static int created;public static b2.a0 g(g1.k0 c){created++;b2.a0 focus=new b2.a0();c.o0(focus);return focus;}}""",
        "g1.e0" to """package g1; public class e0 {public static void d(Object composer,Object key,kotlin.jvm.functions.Function2 action){g1.k0 c=(g1.k0)composer;Object old=c.R();if(!key.equals(old)){c.o0(key);action.invoke(null,null);}}}""",
        "ab.i0" to """package ab; public class i0 implements kotlin.jvm.functions.Function2 {b2.a0 focus;
            public i0(int mode,b2.a0 f,kotlin.coroutines.Continuation c){if(mode!=4)throw new AssertionError();focus=f;}
            public Object invoke(Object a,Object b){focus.requests++;return kotlin.Unit.INSTANCE;} }""",
        "androidx.compose.foundation.layout.b" to """package androidx.compose.foundation.layout; public class b {public static w1.Modifier i(w1.Modifier m,float min,float max,int defaults){if(min!=0||max!=360||defaults!=1)throw new AssertionError();m=m.copy();m.height=max;return m;}}""",
        "d0.o1" to """package d0; public class o1 {public o1(float a,float b,float c,float d){}}""",
        "d0.i" to """package d0; public class i {public static Object g(float spacing){return new Object();}}""",
        "f0.i0" to """package f0; public class i0 {public static int scrolls,lastIndex;public void k(int index,int offset,boolean force){if(offset!=0||force)throw new AssertionError();scrolls++;lastIndex=index;}}""",
        "f0.m0" to """package f0; public class m0 {public static boolean fail;static class Factory {}static class Holder {f0.i0 state=new f0.i0();}
            public static f0.i0 b(int index,int offset,Object composer,int flags,int defaults){if(index<0||offset!=0||defaults!=2)throw new AssertionError();
                g1.k0 c=(g1.k0)composer;Object factory=c.R();if(factory==g1.m.a)c.o0(factory=new Factory());
                if(!(factory instanceof Factory))throw new ClassCastException("Initializer slot corrupted");
                if(fail)throw new IllegalStateException("List state initialization failure");
                Object holder=c.R();if(holder==g1.m.a)c.o0(holder=new Holder());return ((Holder)holder).state;}}""",
        "f0.i" to """package f0; public class i {Object composer;public i(Object c){composer=c;}
            public void q(int count,kotlin.jvm.functions.Function1 key,kotlin.jvm.functions.Function1 type,q1.t content){
                java.util.Set<Object> keys=new java.util.HashSet<>();
                for(int index=0;index<count;index++){Object id=key.invoke(index);if(!(id instanceof String)||!keys.add(id))throw new AssertionError("Unstable key");
                    if(type.invoke(index)!=null)throw new AssertionError();((kotlin.jvm.functions.Function4)content.content).invoke(null,index,composer,0);}}
        }""",
        "d7.a" to """package d7; public class a {public static long G(int value){throw new AssertionError("Unrelated beta.13 helper called as the list renderer");}
            public static void H(w1.Modifier modifier,f0.i0 state,Object padding,Object spacing,Object align,Object fling,boolean scroll,Object overscroll,kotlin.jvm.functions.Function1 items,Object composer,int flags,int defaults){
            if(modifier.height!=360||defaults!=488||!scroll||padding==null||spacing==null)throw new AssertionError("Non-scrolling list");items.invoke(new f0.i(composer));}}""",
        "android.content.SharedPreferences" to """package android.content;
            public class SharedPreferences {
                public java.util.Map<String,Object> values=new java.util.HashMap<>();
                public boolean getBoolean(String k,boolean d){return (Boolean)values.getOrDefault(k,d);}
                public String getString(String k,String d){return (String)values.getOrDefault(k,d);}
                public Editor edit(){return new Editor();}
                public class Editor { public Editor putBoolean(String k,boolean v){values.put(k,v);return this;}
                    public Editor putString(String k,String v){values.put(k,v);return this;} public void apply(){} }
            }""",
        "android.app.Application" to """package android.app; public class Application {
            public android.content.SharedPreferences prefs=new android.content.SharedPreferences();
            public android.content.SharedPreferences getSharedPreferences(String name,int mode){return prefs;}
        }""",
        "android.app.ActivityThread" to """package android.app; public class ActivityThread {
            public static Application app=new Application(); public static Application currentApplication(){return app;}
        }""",
        "android.util.Log" to """package android.util; public class Log {public static int e(String tag,String message,Throwable error){throw new AssertionError(message,error);}}""",
        "g1.m" to """package g1; public class m {public static final Object a=new Object();}""",
        "g1.k0" to """package g1; public class k0 {public int depth;String path="root";int cursor;
            java.util.Map<String,java.util.List<Object>> slots=new java.util.HashMap<>();java.util.ArrayDeque<String> paths=new java.util.ArrayDeque<>();
            java.util.ArrayDeque<Integer> cursors=new java.util.ArrayDeque<>();
            public void begin(){if(depth!=0)throw new AssertionError("Unbalanced groups");path="root";cursor=0;}
            public void d0(int key){depth++;paths.push(path);cursors.push(cursor);path+="/"+key;cursor=0;}
            public void p(boolean node){if(--depth<0)throw new AssertionError("Unbalanced groups");path=paths.pop();cursor=cursors.pop();}
            public Object R(){java.util.List<Object> values=slots.computeIfAbsent(path,k->new java.util.ArrayList<>());int at=cursor++;return at<values.size()?values.get(at):g1.m.a;}
            public void o0(Object value){if(cursor==0)throw new AssertionError("Remember write without reading a slot");
                java.util.List<Object> values=slots.computeIfAbsent(path,k->new java.util.ArrayList<>());while(values.size()<cursor)values.add(g1.m.a);values.set(cursor-1,value);}
        }""",
        "g1.State" to """package g1; public class State { private Object value; public State(Object value){this.value=value;} public Object getValue(){return value;} public void setValue(Object v){value=v;} }""",
        "g1.h" to """package g1; public class h { public static State s(Object v){return new State(v);} }""",
        "u.b0" to """package u; public interface b0 {}""",
        "u.a0" to """package u; public class a0 { public static int nativeCalls; public static void e(boolean visible,Object modifier,Object enter,Object exit,Object label,Object content,Object composer,int flags){nativeCalls++;} }""",
        "q1.t" to """package q1; public class t { public Object content; public t(int key,Object content,boolean tracked){this.content=content;} }""",
        "j2.e" to """package j2; public class e { public String name; public e(String n){name=n;} }""",
        "software.santodan.extension.nuviointro.NuvioIntroDb" to """package software.santodan.extension.nuviointro; public class NuvioIntroDb {
            public static Object settingsIcon(ClassLoader loader){return new j2.e("introdb");} }""",
        "j2.d" to """package j2; public class d {String name; public d(String n,float a,float b,float c,float d,long e,int f,boolean g,int h){name=n;}
            public static void a(d v,java.util.ArrayList p,int f,d2.a1 b){if(p.isEmpty())throw new AssertionError();} public e b(){return new e(name);} }""",
        "d2.a1" to """package d2; public class a1 {public a1(long c){}}""",
        "d2.z" to """package d2; public class z {public static long b=0L;}""",
        "io.sentry.d2" to """package io.sentry; public class d2 {public java.util.ArrayList b=new java.util.ArrayList(); public d2(int i){}
            public void o(float x,float y){b.add("move");} public void m(float x,float y){b.add("line");} public void e(){b.add("close");} }""",
        "a.PlayIcon" to """package a; public class PlayIcon {public static j2.e B(){return new j2.e("play");}}""",
        "k8.k" to """package k8; public class k {public static j2.e a,g;public static j2.e y(){return new j2.e("report");}public static j2.e B(){return new j2.e("external");}}""",
        "ya.o1" to """package ya; public class o1 {public static j2.e e(){return new j2.e("next");}}""",
        "ob.a" to """package ob; public class a {public static j2.e A(){return new j2.e("audio");}}""",
        "ya.u2" to """package ya; public class u2 {public static j2.e o(){return new j2.e("sources");}}""",
        "a.b" to """package a;public class b {public static j2.e a;public static j2.e r(){return new j2.e("party");}}""",
        "z0.b" to """package z0;public class b {public static j2.e b(){return new j2.e("speed");}}""",
        "k8.i" to """package k8; public class i {public static j2.e e;}""",
        "z0.d" to """package z0; public class d {public static j2.e b(){return new j2.e("info");}}""",
        "io.sentry.config.a" to """package io.sentry.config; public class a {public static j2.e u(){return new j2.e("play");}}""",
        "k8.g" to """package k8; public class g {public static j2.e b;}""",
        "na.f2" to """package na; public class f2 {public static void B(kotlin.jvm.functions.Function0 close,String title,String subtitle,float width,
            int color,boolean full,boolean scroll,Object shape,Object background,float a,float b,float c,float d,Object header,q1.t body,Object composer,int f,int g,int defaults){
                if(defaults!=10192||c!=16f||d!=8f)throw new AssertionError("Dialog spacing");
                gb.hd.picker=title;gb.hd.rows.clear();gb.hd.dismiss=close;((kotlin.jvm.functions.Function3)body.content).invoke(null,composer,0);
            } }""",
        "gb.qd" to """package gb; public class qd {public Object id; public String label; public qd(Object id,String label,String sub,String icon,Object meta,int flags){this.id=id;this.label=label;}}""",
        "gb.hd" to """package gb; import kotlin.jvm.functions.*; public class hd {
            public static Function0 toggle,dismiss; public static Function1 choose; public static String picker;
            public static java.util.Map<String,Function0> actions=new java.util.HashMap<>();
            public static java.util.Map<String,Function0> rows=new java.util.LinkedHashMap<>();
            public static java.util.Map<String,w1.Modifier> modifiers=new java.util.HashMap<>();
            public static void a(String title,String subtitle,String value,Function0 click,Object modifier,Function0 focused,boolean enabled,Object trailing,Object badge,long tint,Object icon,Integer raw,float size,long valueColor,Object composer,int f,int g,int defaults){
                if(icon==null || defaults!=15328 || ((w1.Modifier)modifier).key==null)throw new AssertionError("Missing icon/key handler");
                for(String id:software.santodan.extension.nuviobuttons.ButtonLayout.IDS)if(title.contains(software.santodan.extension.nuviobuttons.ButtonLayout.label(id))){rows.put(id,click);modifiers.put(id,(w1.Modifier)modifier);}}
            public static void m(String title,String description,boolean enabled,Function0 click,Object modifier,Function0 noop,boolean disabled,Object icon,long tint,boolean busy,Object composer,int flags,int defaults){toggle=click;}
            public static void e(Object alignment,q1.t content,Object composer,int flags,int defaults){((Function3)content.content).invoke(null,composer,0);}
            public static void d(String title,Function0 click,boolean busy,boolean enabled,Object composer,int flags,int defaults){actions.put(title,click);}
            public static void j(String title,java.util.List options,Object selected,Function1 select,Function0 close,String description,float width,float height,Object composer,int flags,int defaults){rows.clear();picker=title;choose=select;dismiss=close;}
            public static void action(String title){actions.get(title).invoke();} public static void select(String id){if(rows.containsKey(id))rows.get(id).invoke();else choose.invoke(id);}
            public static boolean key(String id,int action,int code,int repeat,long down,long time,boolean canceled){return (Boolean)modifiers.get(id).key.invoke(new o2.b(new android.view.KeyEvent(action,code,repeat,down,time,canceled)));}
        }""",
        "bb.vk" to """package bb; public class vk {
            public static java.util.List<Object[]> rendered=new java.util.ArrayList<>(); public static boolean fail;
            public static void c(Object icon,Object painter,Object label,Object click,Object focus,Object up,boolean enabled,Object down,Object focused,long tint,Object composer,int flags,int defaults){
                if(fail)throw new IllegalStateException("render failure"); rendered.add(new Object[]{label,focus,click,up,defaults});}
            public static void N(Object id,boolean show,Object click,boolean enabled,Object up,Object down,Object focused,Object composer,int flags){rendered.add(new Object[]{"report",null,click,up,0});}
        }""",
        "fixture.Player" to """package fixture; import software.santodan.extension.nuviobuttons.NuvioPlaybackButtons;
            public class Player {
                public static g1.k0 composer=new g1.k0(); public static boolean expanded,subtitles=true,report=true,intro,chapters,engine;
                public static void run(){bb.vk.rendered.clear();
                    NuvioPlaybackButtons.play(null,null,"play","play-click","play-focus","up",true,"down","focused",0L,composer,0,0);
                    if(subtitles)NuvioPlaybackButtons.subtitles(null,null,"subtitles","sub-click",null,"up",true,"down","focused",0L,composer,0,16);
                    if(chapters)NuvioPlaybackButtons.chapters(null,null,"chapters","chapters-click",null,"up",true,"down","focused",0L,composer,0,16);
                    NuvioPlaybackButtons.registerMore(new More());
                    NuvioPlaybackButtons.more(expanded,null,null,null,null,new Object(),composer,0);
                    if(intro) {
                        Object[] args={"intro-icon",null,"introdb","intro-click",null,"up",true,"down","focused",0L,composer,0,530};
                        if(!NuvioPlaybackButtons.collectIntroDb(args)) bb.vk.c(args[0],args[1],args[2],args[3],args[4],args[5],true,args[7],args[8],0L,composer,0,530);
                    }
                    NuvioPlaybackButtons.finish(null,null,"more","toggle",null,"up",true,"down","focused",0L,composer,0,16);
                }
                public static class More {
                    public Object invoke(Object scope,Object composer,Object flags){if(!(scope instanceof u.b0))throw new AssertionError();
                        if(engine)NuvioPlaybackButtons.engine(null,null,"engine","engine-click",null,"up",true,"down","focused",0L,composer,0,16);
                        NuvioPlaybackButtons.speed(null,null,"speed","speed-click",null,"up",true,"down","focused",0L,composer,0,16);
                        NuvioPlaybackButtons.info(null,null,"info","info-click","info-focus","up",true,"down","focused",0L,composer,0,0);
                        if(report)NuvioPlaybackButtons.report("report-id",false,"report-click",true,"report-up","down","focused",composer,0);
                        return null;
                    }
                }
            }"""
    )
    val files = sources.map { (name, source) -> root.resolve(name.replace('.', '/') + ".java").also {
        Files.createDirectories(it.parent); Files.write(it, source.toByteArray(Charsets.UTF_8))
    }.toString() }
    val production = File(args[0]).listFiles()!!.filter { it.extension == "java" }.map { it.absolutePath }
    check(ToolProvider.getSystemJavaCompiler().run(null, null, null, "-classpath", System.getProperty("java.class.path"),
        "-d", root.toString(), *(files + production).toTypedArray()) == 0)
    var introAvailable = false
    val isolated = object : URLClassLoader(arrayOf(root.toUri().toURL())) {
        override fun loadClass(name: String, resolve: Boolean): Class<*> {
            if (name == "software.santodan.extension.nuviointro.NuvioIntroDb" && !introAvailable) throw ClassNotFoundException(name)
            if (sources.keys.any { name == it || name.startsWith(it + "$" ) } ||
                name.startsWith("software.santodan.extension.nuviobuttons.NuvioPlaybackButtons") ||
                name.startsWith("software.santodan.extension.nuviobuttons.ButtonsUi") ||
                name.startsWith("software.santodan.extension.nuviobuttons.ButtonsIcons")) {
                synchronized(this) {
                    val type = findLoadedClass(name) ?: findClass(name)
                    if (resolve) resolveClass(type)
                    return type
                }
            }
            return super.loadClass(name, resolve)
        }
    }
    isolated.use { loader ->
        val runtime = loader.loadClass("software.santodan.extension.nuviobuttons.NuvioPlaybackButtons")
        val player = loader.loadClass("fixture.Player")
        val native = loader.loadClass("bb.vk")
        val ui = loader.loadClass("gb.hd")
        val layout = runtime.getDeclaredField("layout").apply { isAccessible = true }
        val frames = runtime.getDeclaredField("frames").apply { isAccessible = true }.get(null) as ThreadLocal<*>
        val composer = player.getField("composer").get(null)
        val lookup = runtime.getDeclaredMethod("method", Class::class.java, String::class.java, Int::class.javaPrimitiveType)
            .apply { isAccessible = true }
        val groupMethod = lookup.invoke(null, composer.javaClass, "d0", 1)
        repeat(1_000) { check(lookup.invoke(null, composer.javaClass, "d0", 1) === groupMethod) }
        check(runCatching { lookup.invoke(null, loader.loadClass("fixture.Overloads"), "action", 1) }
            .exceptionOrNull()?.cause is NoSuchMethodException)
        check(runCatching { lookup.invoke(null, composer.javaClass, "missing", 0) }
            .exceptionOrNull()?.cause is NoSuchMethodException)
        check(runCatching { lookup.invoke(null, loader.loadClass("d7.a"), "G", 12) }
            .exceptionOrNull()?.cause is NoSuchMethodException)
        check((lookup.invoke(null, loader.loadClass("d7.a"), "H", 12) as java.lang.reflect.Method).name == "H")
        fun rendered(): List<Array<*>> = (native.getField("rendered").get(null) as List<*>).map { it as Array<*> }
        fun run(): List<String> {
            player.getMethod("run").invoke(null)
            check(frames.get() == null && composer.javaClass.getField("depth").getInt(composer) == 0)
            return rendered().map { it[0] as String }
        }
        fun settings() {
            composer.javaClass.getMethod("begin").invoke(composer)
            runtime.getMethod("renderSettings", Any::class.java).invoke(null, composer)
            check(composer.javaClass.getField("depth").getInt(composer) == 0)
        }
        fun action(name: String) = ui.getMethod("action", String::class.java).invoke(null, name)
        fun select(id: String) = ui.getMethod("select", String::class.java).invoke(null, id)
        fun button(id: String) {
            check((ui.getField("rows").get(null) as Map<*, *>).containsKey(id))
            select(id); settings()
        }
        fun key(id: String, action: Int, code: Int, repeat: Int = 0, elapsed: Long = 0, canceled: Boolean = false): Boolean =
            ui.getMethod("key", String::class.java, Int::class.javaPrimitiveType, Int::class.javaPrimitiveType,
                Int::class.javaPrimitiveType, Long::class.javaPrimitiveType, Long::class.javaPrimitiveType, Boolean::class.javaPrimitiveType)
                .invoke(null, id, action, code, repeat, 1000L, 1000L + elapsed, canceled) as Boolean
        fun hold(id: String) {
            check(key(id, 0, 23)); check(key(id, 0, 23, 1, 600)); settings()
            check(key(id, 1, 23, elapsed = 650)); settings()
            check(runtime.getDeclaredField("moveDraft").apply { isAccessible = true }.get(null) != null)
        }
        fun move(id: String, code: Int, count: Int) {
            repeat(count) { check(key(id, 0, code, it)); settings(); check(key(id, 1, code)); }
        }
        fun drop(id: String) { check(key(id, 0, 23)); check(key(id, 1, 23, elapsed = 50)); settings() }
        check(run() == listOf("play", "subtitles", "more"))
        check(loader.loadClass("u.a0").getField("nativeCalls").getInt(null) == 1)
        check(rendered()[0][1] == "play-focus" && rendered()[0][2] == "play-click")
        settings(); (ui.getField("toggle").get(null) as kotlin.jvm.functions.Function0<*>).invoke()
        check((layout.get(null) as ButtonLayout).enabled)
        player.getField("chapters").setBoolean(null, true)
        player.getField("engine").setBoolean(null, true)
        check("chapters" in run() && "engine" !in run())
        player.getField("expanded").setBoolean(null, true)
        check("chapters" in run() && "engine" in run())
        player.getField("expanded").setBoolean(null, false)
        player.getField("chapters").setBoolean(null, false)
        player.getField("engine").setBoolean(null, false)

        settings(); action("Edit playback buttons"); settings()
        check(ui.getField("picker").get(null) == "Playback buttons")
        check((ui.getField("rows").get(null) as Map<*, *>).size == 14)
        val firstFocus = (ui.getField("modifiers").get(null) as Map<*, *>)["play"]!!.let { it.javaClass.getField("focus").get(it) }
        repeat(12) { settings() }
        val recomposedFocus = (ui.getField("modifiers").get(null) as Map<*, *>)["play"]!!.let { it.javaClass.getField("focus").get(it) }
        check(firstFocus === recomposedFocus && loader.loadClass("g.e").getField("created").getInt(null) == 1)
        loader.loadClass("f0.m0").getField("fail").setBoolean(null, true)
        check(runCatching { settings() }.isFailure && composer.javaClass.getField("depth").getInt(composer) == 0)
        loader.loadClass("f0.m0").getField("fail").setBoolean(null, false)
        settings()
        check(!(ui.getField("actions").get(null) as Map<*, *>).containsKey("Next buttons"))
        button("speed"); select("group"); settings()
        check(!(layout.get(null) as ButtonLayout).more.contains("speed"))
        check(run() == listOf("play", "subtitles", "speed", "more"))
        // Move the available optional control before Play, then hide/regroup it.
        val intro = runtime.getMethod("collectIntroDb", Array<Any>::class.java)
        check(intro.invoke(null, arrayOf<Any>()) == false) // No composition frame.
        val beforeIntro = layout.get(null) as ButtonLayout
        player.getField("intro").setBoolean(null, true)
        var introFirst = beforeIntro
        repeat(14) { introFirst = introFirst.change("introdb", "left") }
        layout.set(null, introFirst)
        check(run() == listOf("introdb", "play", "subtitles", "speed", "more"))
        check(rendered().first()[2] == "intro-click" && rendered().first()[1] == "play-focus")
        layout.set(null, (layout.get(null) as ButtonLayout).change("introdb", "group"))
        check(run() == listOf("play", "subtitles", "speed", "more"))
        player.getField("expanded").setBoolean(null, true)
        check(run() == listOf("play", "subtitles", "speed", "introdb", "info", "report", "more"))
        layout.set(null, (layout.get(null) as ButtonLayout).change("introdb", "visibility"))
        check(!run().contains("introdb"))
        player.getField("intro").setBoolean(null, false)
        player.getField("expanded").setBoolean(null, false)
        layout.set(null, beforeIntro)
        // Hold OK picks up the focused stable-key row; arrows scroll and change only the draft.
        hold("speed"); move("speed", 19, 8)
        check((ui.getField("rows").get(null) as Map<*, *>).keys.first() == "speed")
        check(loader.loadClass("f0.i0").getField("lastIndex").getInt(null) == 0)
        check(run() == listOf("play", "subtitles", "speed", "more"))
        drop("speed")
        check(run() == listOf("speed", "play", "subtitles", "more"))
        hold("speed"); move("speed", 20, 8)
        check(key("speed", 0, 4)); settings(); check(key("speed", 1, 4)); settings()
        check(run() == listOf("speed", "play", "subtitles", "more")) // Back discards the draft.
        hold("speed"); move("speed", 20, 8); drop("speed")
        check(run() == listOf("play", "subtitles", "speed", "more"))
        check(!key("speed", 0, 20)) // Normal arrows remain available to native scrolling/focus.
        check(key("speed", 0, 23)); check(key("speed", 1, 23, elapsed = 10, canceled = true)); settings()
        check(runtime.getDeclaredField("moveDraft").apply { isAccessible = true }.get(null) == null)
        // A remote without repeat events can still start moving on a held key's release.
        check(key("speed", 0, 66)); check(key("speed", 1, 66, elapsed = 650)); settings()
        check(runtime.getDeclaredField("moveDraft").apply { isAccessible = true }.get(null) != null)
        (ui.getField("dismiss").get(null) as kotlin.jvm.functions.Function0<*>).invoke(); settings()
        check(run() == listOf("play", "subtitles", "speed", "more"))
        // The optional entry and its filmstrip icon appear only when IntroDB is packaged.
        check(!(ui.getField("rows").get(null) as Map<*, *>).containsKey("introdb"))
        introAvailable = true
        settings()
        button("introdb")
        check(ui.getField("picker").get(null) == "Submit segment to IntroDB")
        select("back"); settings()
        // Reload from persisted preferences as if the process restarted.
        layout.set(null, null)
        check(run() == listOf("play", "subtitles", "speed", "more"))
        player.getField("expanded").setBoolean(null, true)
        check(run() == listOf("play", "subtitles", "speed", "info", "report", "more"))
        val saved = layout.get(null) as ButtonLayout
        layout.set(null, saved.change("subtitles", "group"))
        player.getField("expanded").setBoolean(null, false)
        check(run() == listOf("play", "speed", "more"))
        player.getField("expanded").setBoolean(null, true)
        check(run() == listOf("play", "speed", "subtitles", "info", "report", "more"))
        // Conditional primary controls are absent: temporary Play fallback appears exactly once.
        layout.set(null, ButtonLayout(true, "", "subtitles", "play,speed,info,report"))
        check(run() == listOf("play", "speed", "info", "report", "more"))
        layout.set(null, saved)
        layout.set(null, (layout.get(null) as ButtonLayout).change("play", "visibility").change("info", "visibility"))
        check(run() == listOf("subtitles", "speed", "report", "more"))
        check(rendered()[0][1] == "play-focus" && rendered().last()[1] == "info-focus")
        check(rendered().single { it[0] == "report" }[3] == "report-up")
        player.getField("subtitles").setBoolean(null, false)
        check(run() == listOf("speed", "report", "more"))
        // A rendering failure cannot keep a native callback/composer alive in the collector.
        native.getField("fail").setBoolean(null, true)
        check(runCatching { run() }.isFailure && frames.get() == null)
        native.getField("fail").setBoolean(null, false)
        settings(); action("Reset playback buttons"); settings()
        check(!(layout.get(null) as ButtonLayout).enabled)
        check(run() == listOf("play", "more"))
        player.getField("intro").setBoolean(null, true)
        check(run() == listOf("play", "introdb", "more")) // Disabled customization preserves the optional native action.
        check(composer.javaClass.getField("depth").getInt(composer) == 0)
    }
    println("PASS: remembered focus/list slots across recomposition and failure recovery, continuous icon list, long-press movement/scrolling/confirm/cancel, optional IntroDB, persistence and native playback/focus")
}
