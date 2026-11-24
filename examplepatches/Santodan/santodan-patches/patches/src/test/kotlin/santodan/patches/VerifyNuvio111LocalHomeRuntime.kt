package santodan.patches

import kotlinx.coroutines.*
import software.santodan.extension.nuviomerged.NuvioLocalHomeUpdates
import software.santodan.extension.nuviomerged.NuvioLocalHomeProjection
import software.santodan.nuvio.NuvioNative
import java.nio.file.Files
import java.io.File
import java.net.URLClassLoader
import javax.tools.ToolProvider

private suspend fun localHomeScheduling() = coroutineScope {
    var profile = "p1"
    var enabled = true
    val started = CompletableDeferred<Unit>()
    val release = CompletableDeferred<Unit>()
    val published = mutableListOf<String>()
    var lookups = 0
    val worker = NuvioLocalHomeUpdates<String, String>(this,
        valid = { enabled && it == profile },
        resolve = { value ->
            if (value.startsWith("complete")) { lookups++; started.complete(Unit); release.await() }
            value
        }, publish = { _, result -> published.add(result) }, failure = { throw AssertionError(it) })
    worker.offer(profile, "partial-1", "position-1")
    withTimeout(2000) { while (published.isEmpty()) yield() }
    check(published == listOf("position-1") && lookups == 0)
    worker.offer(profile, "episode-8-complete", "complete-8")
    started.await()
    repeat(20) { worker.offer(profile, "episode-8-complete", "complete-8-more-position-$it") }
    release.complete(Unit)
    withTimeout(2000) { while (published.size < 2) yield() }
    check(lookups == 1 && published.last() == "complete-8") // Updated while playback is still active, with no sync trigger.
    profile = "p2"; worker.clear()
    worker.offer("p1", "foreign", "foreign")
    enabled = false; worker.offer("p2", "disabled", "disabled")
    yield(); check(published.size == 2)
    worker.close()

    var result: String? = null
    val oldStarted = CompletableDeferred<Unit>()
    val stale = NuvioLocalHomeUpdates<String, String>(this, { true },
        resolve = { if (it == "old") { oldStarted.complete(Unit); awaitCancellation() }; it },
        publish = { _, r -> result = r }, failure = { throw AssertionError(it) })
    stale.offer("p2", "old", "old"); oldStarted.await()
    stale.offer("p2", "rewatch", "new-partial")
    withTimeout(2000) { while (result == null) yield() }
    check(result == "new-partial"); stale.close()
    var failures = 0; var attempts = 0
    val timeout = NuvioLocalHomeUpdates<String, String>(this, { true },
        resolve = { attempts++; awaitCancellation() }, publish = { _, _ -> error("Timed out result published") },
        failure = { failures++ }, timeoutMs = 20)
    timeout.offer("p2", "timeout", "timeout")
    withTimeout(2000) { while (failures == 0) delay(1) }
    repeat(20) { timeout.offer("p2", "timeout", "timeout") }
    yield(); check(attempts == 1); timeout.close()
}

private fun descriptorTypes(ref: String): List<String> = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
    .findAll(ref.substringAfter('(').substringBefore(')')).map { it.value }.toList()
private fun javaType(type: String): String = when (type) {
    "Z" -> "boolean"; "I" -> "int"; "J" -> "long"; "F" -> "float"; "D" -> "double"
    else -> type.removePrefix("L").removeSuffix(";").replace('/', '.')
}

private suspend fun nativeLocalHomeProjection(directory: File) {
    val root = Files.createTempDirectory(directory.toPath(), "local-home-native-")
    val sources = linkedMapOf<String, String>()
    val types = descriptorTypes(NuvioNative.REF_LOCAL_HOME_STATE_COPY)
    for (type in types.filter { it.startsWith('L') && !it.startsWith("Ljava/") }.distinct()) {
        val name = javaType(type)
        sources[name] = "package ${name.substringBeforeLast('.')}; public class ${name.substringAfterLast('.')} {}"
    }
    sources["com.nuvio.tv.domain.model.ContinueWatchingSortMode"] = "package com.nuvio.tv.domain.model; public enum ContinueWatchingSortMode { RECENT, SPLIT_UPCOMING }"
    sources["com.nuvio.tv.domain.model.MDBListRatings"] = "package com.nuvio.tv.domain.model; public class MDBListRatings {}"
    sources["com.nuvio.tv.domain.model.WatchProgress"] = """package com.nuvio.tv.domain.model; public class WatchProgress {
        public final String id; public final int episode; public WatchProgress(String id,int episode){this.id=id;this.episode=episode;}
        public String getContentId(){return id;} public String getContentType(){return "series";}
        public Integer getSeason(){return 1;} public Integer getEpisode(){return episode;}}
    """
    sources["ya.t2"] = """package ya; public class t2 {
        public java.util.List a=new java.util.ArrayList(),b=new java.util.ArrayList(),c=new java.util.ArrayList();
        public Object untouched=new Object();
        public static t2 a(${types.mapIndexed { index, t -> "${javaType(t)} p$index" }.joinToString(",")}) {
            if(p${types.size-2}!=-7 || p${types.size-1}!=-1)throw new AssertionError("wrong copy masks");
            t2 n=new t2();n.a=p0.a;n.b=p2;n.c=p3;n.untouched=p0.untouched;return n;
        }}"""
    sources["ya.j9"] = "package ya;public class j9{public String a,b;public int episode;public j9(String id,String type,int ep){a=id;b=type;episode=ep;}}"
    sources["ya.e0"] = "package ya;public class e0{public j9 a;public e0(j9 info){a=info;}}"
    sources["ya.k0"] = "package ya;public class k0{}"
    sources["ya.d0"] = """package ya;public class d0{ public com.nuvio.tv.domain.model.WatchProgress a;
        public String b,c,f,g,i,j;public Float d;public java.util.List e;public boolean h;public com.nuvio.tv.domain.model.MDBListRatings k;
        public d0(com.nuvio.tv.domain.model.WatchProgress a,String b,String c,Float d,java.util.List e,String f,String g,boolean h,String i,String j,com.nuvio.tv.domain.model.MDBListRatings k){
        this.a=a;this.b=b;this.c=c;this.d=d;this.e=e;this.f=f;this.g=g;this.h=h;this.i=i;this.j=j;this.k=k;}}
    """
    sources["com.nuvio.tv.data.local.wc"] = """package com.nuvio.tv.data.local;public class wc{
        public kotlinx.coroutines.flow.StateFlow f=kotlinx.coroutines.flow.StateFlowKt.MutableStateFlow(java.util.Set.of("show"));}"""
    sources["ya.v3"] = """package ya;public class v3{
        public kotlinx.coroutines.flow.MutableStateFlow z=kotlinx.coroutines.flow.StateFlowKt.MutableStateFlow(new t2());
        public java.util.Map T0=new java.util.HashMap();public com.nuvio.tv.data.local.wc u=new com.nuvio.tv.data.local.wc();public int lookups;}
    """
    sources["ya.i0"] = """package ya;public class i0{public java.util.Set d=java.util.Set.of();public boolean e=false;
        public com.nuvio.tv.domain.model.ContinueWatchingSortMode g=com.nuvio.tv.domain.model.ContinueWatchingSortMode.RECENT;}"""
    sources["ya.y4"] = "package ya;public class y4{public v3 W;public Object V=new i0();public y4(v3 h){W=h;}}"
    sources["ya.k5"] = """package ya;public class k5{
        public static Object m(v3 home,com.nuvio.tv.domain.model.WatchProgress p,boolean unaired,k0 debug,kotlin.coroutines.jvm.internal.ContinuationImpl c){
            if(debug==null)throw new AssertionError("Native resolver context missing");
            home.lookups++;return p.episode==99?null:new e0(new j9(p.id,"series",p.episode+1));}
        public static java.util.List C(java.util.List items,com.nuvio.tv.domain.model.ContinueWatchingSortMode mode){return items;}
        public static kotlin.Pair D(java.util.List items,com.nuvio.tv.domain.model.ContinueWatchingSortMode mode){return new kotlin.Pair(items,java.util.List.of());}}
    """
    val files = sources.map { (name, text) -> root.resolve(name.replace('.', '/') + ".java").also { Files.createDirectories(it.parent); Files.write(it,text.toByteArray(Charsets.UTF_8)) }.toString() }
    val cp = System.getProperty("java.class.path")
    check(ToolProvider.getSystemJavaCompiler().run(null,null,null,"-classpath",cp,"-d",root.toString(),*files.toTypedArray()) == 0)
    val loader = object : URLClassLoader(arrayOf(root.toUri().toURL()), NuvioLocalHomeProjection::class.java.classLoader) {
        override fun loadClass(name: String, resolve: Boolean): Class<*> = synchronized(this) {
            (findLoadedClass(name) ?: if(name.startsWith("ya.") || name.startsWith("com.nuvio.tv.")) findClass(name) else super.loadClass(name,false)).also { if(resolve)resolveClass(it) }
        }
    }
    loader.use {
        val home = loader.loadClass("ya.v3").getConstructor().newInstance()
        val cycle = loader.loadClass("ya.y4").getConstructor(home.javaClass).newInstance(home)
        val settings = NuvioLocalHomeProjection.settings(cycle,"p1")
        var record = loader.loadClass("com.nuvio.tv.domain.model.WatchProgress").getConstructor(String::class.java,Int::class.javaPrimitiveType).newInstance("show",8)
        @Suppress("UNCHECKED_CAST") val state = home.javaClass.getField("z").get(home) as kotlinx.coroutines.flow.MutableStateFlow<Any>
        val original = state.value
        val other = loader.loadClass("ya.e0").getConstructor(loader.loadClass("ya.j9")).newInstance(loader.loadClass("ya.j9").getConstructor(String::class.java,String::class.java,Int::class.javaPrimitiveType).newInstance("other","series",4))
        original.javaClass.getField("b").set(original,listOf(other))
        fun same(item: Any): Boolean = when(item.javaClass.name) {
            "ya.d0" -> item.javaClass.getField("a").get(item).javaClass.getMethod("getContentId").invoke(item.javaClass.getField("a").get(item)) == "show"
            "ya.e0" -> item.javaClass.getField("a").get(item).let { info -> info.javaClass.getField("a").get(info) == "show" }
            else -> false
        }
        val partial = NuvioLocalHomeProjection.resolve(settings,record,false)
        check(home.javaClass.getField("lookups").get(home) == 0)
        NuvioLocalHomeProjection.publish(settings,record,false,partial,{true},::same,Dispatchers.Unconfined)
        check((state.value.javaClass.getField("b").get(state.value) as List<*>).any { it?.javaClass?.name == "ya.d0" })
        val episode8 = (state.value.javaClass.getField("b").get(state.value) as List<*>).last()!!
        episode8.javaClass.getField("b").set(episode8,"episode-8-thumbnail")
        record = record.javaClass.getConstructor(String::class.java,Int::class.javaPrimitiveType).newInstance("show",9)
        NuvioLocalHomeProjection.publish(settings,record,false,partial,{true},::same,Dispatchers.Unconfined)
        val episode9 = (state.value.javaClass.getField("b").get(state.value) as List<*>).last()!!
        check(episode9.javaClass.getField("b").get(episode9) == null) // Autoplay must not reuse another episode's metadata.
        val next = NuvioLocalHomeProjection.resolve(settings,record,true)
        NuvioLocalHomeProjection.publish(settings,record,true,next,{true},::same,Dispatchers.Unconfined)
        val rows = state.value.javaClass.getField("b").get(state.value) as List<*>
        check(rows.size == 2 && rows.first() === other && rows.last()?.javaClass?.name == "ya.e0")
        check(state.value.javaClass.getField("untouched").get(state.value) === original.javaClass.getField("untouched").get(original))
        val before = state.value
        NuvioLocalHomeProjection.publish(settings,record,false,partial,{false},::same,Dispatchers.Unconfined)
        check(state.value === before)
        val finished = record.javaClass.getConstructor(String::class.java,Int::class.javaPrimitiveType).newInstance("show",99)
        check(!NuvioLocalHomeProjection.resolve(settings,finished,true).conclusive) // Unknown metadata must not remove the card.
        (home.javaClass.getField("T0").get(home) as MutableMap<String,Any>)["series:show"] = Any()
        val conclusion = NuvioLocalHomeProjection.resolve(settings,finished,true)
        check(conclusion.conclusive && conclusion.item == null)
        NuvioLocalHomeProjection.publish(settings,finished,true,conclusion,{true},::same,Dispatchers.Unconfined)
        check((state.value.javaClass.getField("b").get(state.value) as List<*>).single() === other)
    }
}

fun main(args: Array<String>) = runBlocking {
    localHomeScheduling()
    File(args[0]).mkdirs(); nativeLocalHomeProjection(File(args[0]))
    println("PASS: local background progress/next-up publication, completion coalescing, no partial metadata work, profile/disabled/stale/timeout guards, native ABI and unrelated state preserved")
}
