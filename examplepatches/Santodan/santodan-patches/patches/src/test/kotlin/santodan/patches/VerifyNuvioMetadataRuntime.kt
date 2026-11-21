package santodan.patches

import java.io.File
import java.net.URLClassLoader
import javax.tools.ToolProvider
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*

/** Real production flow bridge, with the native 1.1.0 ABI independently checked by the DEX verifier. */
object MetadataFixtureFlows {
    lateinit var loader: ClassLoader
    val requests = java.util.Collections.synchronizedList(mutableListOf<String>())
    lateinit var effectScope: CoroutineScope
    val effects = mutableMapOf<Any, Job>()
    @JvmStatic fun effect(composer: Any, key: Any, block: suspend CoroutineScope.() -> Unit) {
        effects.getOrPut(composer to key) { effectScope.launch(block = block) }
    }
    var failSelected = false
    var pause = false
    var entered = CompletableDeferred<Unit>()
    var release = CompletableDeferred<Unit>()
    @JvmStatic fun lookup(repo: Any, type: String, id: String, source: String?): Flow<Any> = flow {
        val addons = listOf("first", "selected").map { loader.loadClass("com.nuvio.tv.domain.model.Addon").getConstructor(String::class.java).newInstance(it) }
        val filtered = loader.loadClass("software.santodan.extension.nuviometadata.NuvioMetadataAddon")
            .getMethod("filterAddons", Any::class.java, List::class.java).invoke(null, repo, addons) as List<*>
        val url = filtered.firstOrNull()?.javaClass?.getMethod("getBaseUrl")?.invoke(filtered.first()) as String? ?: "missing"
        requests += "$url:$type:$id:${source ?: "none"}"
        if (pause) { entered.complete(Unit); release.await() }
        if (url == "missing" || (failSelected && url == "selected")) {
            emit(loader.loadClass("b9.p").getConstructor().newInstance())
        } else {
            val meta = loader.loadClass("com.nuvio.tv.domain.model.Meta").getConstructor(String::class.java).newInstance(url)
            emit(loader.loadClass("b9.r").getConstructor(Any::class.java).newInstance(meta))
        }
    }
}

fun main(args: Array<String>) = runBlocking {
    val root = File(args[0], "metadata-runtime").apply { mkdirs() }
    val sources = linkedMapOf(
        "android.util.Log" to "public class Log { public static int e(String t,String m,Throwable e){throw new AssertionError(m,e);} }",
        "android.content.Context" to "public class Context {}",
        "com.nuvio.tv.data.remote.api.AddonApi" to "public interface AddonApi {}",
        "fa.a" to "public interface a {}",
        "v9.s" to "public class s {}",
        "b9.p" to "public class p {}",
        "b9.r" to "public class r { public final Object a; public r(Object v){a=v;} }",
        "com.nuvio.tv.domain.model.Addon" to "public class Addon { private final String url; public Addon(String s){url=s;} public String getBaseUrl(){return url;} }",
        "com.nuvio.tv.domain.model.Meta" to "public class Meta { private final String url; public Meta(String s){url=s;} public String getPoster(){return url+\"/poster\";} public String getLandscapePoster(){return url+\"/landscape\";} public String getBackground(){return url+\"/background\";} public String getLogo(){return url+\"/logo\";} }",
        "com.nuvio.tv.domain.model.MetaPreview" to "public class MetaPreview { private final String id; public MetaPreview(String v){id=v;} public String getId(){return id;} public String getApiType(){return \"series\";} }",
        "na.b2" to "public class b2 { public final com.nuvio.tv.domain.model.MetaPreview g; public b2(com.nuvio.tv.domain.model.MetaPreview p){g=p;} }",
        "g1.n" to "public interface n {}",
        "g1.k0" to "public class k0 implements n { public int depth; public void d0(int key){depth++;} public void p(boolean unused){depth--;if(depth<0)throw new AssertionError();} }",
        "g1.r1" to "public class r1 { private volatile Object value; public r1(Object v){value=v;} public Object getValue(){return value;} public void setValue(Object v){value=v;} }",
        "g1.h" to "public class h { public static r1 s(Object v){return new r1(v);} }",
        "g1.e0" to "public class e0 { public static void d(n composer,Object key,kotlin.jvm.functions.Function2 block){santodan.patches.MetadataFixtureFlows.effect(composer,key,block);} }",
        "com.nuvio.tv.domain.model.MDBListRatings" to "public class MDBListRatings {}",
        "kb.o" to "public class o {}",
        "ya.o1" to "public class o1 {}",
        "ya.f0" to "public class f0 {}",
        "ya.j9" to "public class j9 { public String a=\"title\",b=\"series\"; }",
        "ya.e0" to "public class e0 extends f0 { public final j9 a=new j9(); }",
        "ya.i9" to "public class i9 extends o1 { public final f0 g; public i9(f0 v){g=v;} }",
        "software.santodan.extension.nuviometadata.NuvioMetadataSettings" to "public class NuvioMetadataSettings { public static int profile=1; public static String url=\"\"; public static boolean cw=false,library=false; public static int currentProfile(){return profile;} public static String selectedAddon(int id){return url;} public static boolean continueWatching(int id){return cw;} public static boolean libraryPosters(int id){return library;} }",
        "ba.x2" to """public class x2 {
            public final android.content.Context a; public final com.nuvio.tv.data.remote.api.AddonApi b;
            public final fa.a c; public final v9.s d; public static int clones;
            public x2(android.content.Context a,com.nuvio.tv.data.remote.api.AddonApi b,fa.a c,v9.s d){this.a=a;this.b=b;this.c=c;this.d=d;clones++;}
            public kotlinx.coroutines.flow.Flow<Object> k(String type,String id,String source){return santodan.patches.MetadataFixtureFlows.lookup(this,type,id,source);}
            public kotlinx.coroutines.flow.Flow<Object> l(String type,String id){return santodan.patches.MetadataFixtureFlows.lookup(this,type,id,"primary");}
        }"""
    )
    // Constructor types and field positions match REF_METADATA_HERO and REF_METADATA_CARD.
    val heroTypes = List(21) { i -> when(i) { 4 -> "boolean"; 13 -> "kb.o"; 17 -> "com.nuvio.tv.domain.model.MDBListRatings"; 18 -> "java.util.List"; else -> "String" } }
    fun model(name: String, types: List<String>): String {
        val fields = types.indices.joinToString(" ") { "public final ${types[it]} ${'a'+it};" }
        val params = types.indices.joinToString(",") { "${types[it]} p$it" }
        val assign = types.indices.joinToString(" ") { "this.${'a'+it}=p$it;" }
        return "public class $name { $fields public $name($params){$assign} }"
    }
    sources["ya.q1"] = model("q1", heroTypes)
    sources["ya.m6"] = model("m6", listOf("String", "String", "String", "String", "ya.q1", "ya.o1", "com.nuvio.tv.domain.model.MetaPreview"))
    val files = sources.map { (name, body) -> File(root, name.replace('.', '/') + ".java").apply {
        parentFile!!.mkdirs(); writeText("package ${name.substringBeforeLast('.')}; $body")
    } }
    val compile = listOf("-classpath", System.getProperty("java.class.path"), "-d", root.absolutePath) + files.map { it.absolutePath }
    check(ToolProvider.getSystemJavaCompiler().run(null,null,null,*compile.toTypedArray()) == 0)
    val production = File(args[1])
    val child = object : URLClassLoader(arrayOf(root.toURI().toURL(), production.toURI().toURL()), MetadataFixtureFlows::class.java.classLoader) {
        override fun loadClass(name: String, resolve: Boolean): Class<*> {
            if (name in sources || name.startsWith("software.santodan.extension.nuviometadata.")) synchronized(this) {
                val result = findLoadedClass(name) ?: findClass(name)
                if (resolve) resolveClass(result)
                return result
            }
            return super.loadClass(name,resolve)
        }
    }
    child.use {
        MetadataFixtureFlows.loader = child
        MetadataFixtureFlows.effectScope = this
        val settings = child.loadClass("software.santodan.extension.nuviometadata.NuvioMetadataSettings")
        fun setting(name: String,value: Any) { settings.getField(name).set(null,value) }
        val bridge = child.loadClass("software.santodan.extension.nuviometadata.NuvioMetadataAddon")
        val repoType = child.loadClass("ba.x2")
        val repo = repoType.constructors.single().newInstance(null,null,null,null)
        bridge.getMethod("registerRepository", Any::class.java).invoke(null,repo)
        @Suppress("UNCHECKED_CAST")
        fun flow(name: String, id: String = "title"): Flow<Any> = when(name) {
            "all" -> bridge.getMethod(name, Any::class.java,String::class.java,String::class.java,String::class.java).invoke(null,repo,"series",id,"catalog")
            else -> bridge.getMethod(name, Any::class.java,String::class.java,String::class.java).invoke(null,repo,"series",id)
        } as Flow<Any>
        flow("all").first(); check(MetadataFixtureFlows.requests.last() == "first:series:title:catalog")
        check(repoType.getField("clones").getInt(null) == 1)
        setting("url","selected")
        flow("all").first(); check(MetadataFixtureFlows.requests.last() == "selected:series:title:none")
        flow("cwPrimary").first(); check(MetadataFixtureFlows.requests.last() == "first:series:title:primary")
        setting("cw",true)
        flow("cwPrimary").first(); check(MetadataFixtureFlows.requests.last() == "selected:series:title:none")
        val item = child.loadClass("ya.e0").getConstructor().newInstance()
        val cached = bridge.getMethod("cached",Any::class.java)
        val info = child.loadClass("ya.e0").getField("a").get(item)
        check(cached.invoke(null,info) === info)
        child.loadClass("ya.j9").getField("a").set(info,"not-fetched")
        check(cached.invoke(null,info) == null)
        child.loadClass("ya.j9").getField("a").set(info,"title")
        val imageMethod = bridge.getMethod("image", Any::class.java, Boolean::class.javaPrimitiveType)
        check(imageMethod.invoke(null,item,true) == "selected/poster")
        check(imageMethod.invoke(null,item,false) == "selected/landscape")
        val heroType = child.loadClass("ya.q1")
        val heroValues = Array<Any?>(21) { i -> if (i==4) false else if (i in listOf(13,17,18)) null else "native-$i" }
        val hero = heroType.constructors.single().newInstance(*heroValues)
        val payload = child.loadClass("ya.i9").constructors.single().newInstance(item)
        val cardType = child.loadClass("ya.m6")
        val card = cardType.constructors.single().newInstance("key","title","subtitle","old",hero,payload,null)
        val decorate = bridge.getMethod("decorate",Any::class.java,Boolean::class.javaPrimitiveType)
        val decorated = decorate.invoke(null,card,false)
        check(cardType.getField("d").get(decorated) == "selected/poster")
        check(cardType.getField("d").get(card) == "old")
        val decoratedHero = cardType.getField("e").get(decorated)
        check(heroType.getField("q").get(decoratedHero) == "selected/poster")
        check(heroType.getField("a").get(decoratedHero) == "native-0")
        fun retained(name: String, id: String = "title", original: String? = "native"): String? =
            bridge.getMethod(name, String::class.java, String::class.java, String::class.java)
                .invoke(null, id, "series", original) as String?
        val savedPoster = retained("retainedPoster")
        val savedBackground = retained("retainedBackground")
        val savedLogo = retained("retainedLogo")
        check(savedPoster == "selected/poster" && savedBackground == "selected/landscape" && savedLogo == "selected/logo")
        check(retained("retainedPoster", "unresolved") == "native")
        setting("profile",2); check(retained("retainedPoster") == "native")
        setting("profile",1); setting("url","first"); check(retained("retainedPoster") == "native")
        setting("url","selected"); setting("cw",false); check(retained("retainedPoster") == "native")
        setting("cw",true)
        val artworkMap = bridge.getDeclaredField("artwork").apply { isAccessible=true }.get(null) as MutableMap<*,*>
        artworkMap.clear()
        val requestsBeforeRestore = MetadataFixtureFlows.requests.size
        check(retained("retainedPoster", original=savedPoster) == savedPoster)
        check(retained("retainedBackground", original=savedBackground) == savedBackground)
        check(retained("retainedLogo", original=savedLogo) == savedLogo)
        check(MetadataFixtureFlows.requests.size == requestsBeforeRestore)
        check(cached.invoke(null,info) == null)
        setting("cw",false); check(imageMethod.invoke(null,item,true) == null); check(decorate.invoke(null,card,false) === card)
        MetadataFixtureFlows.failSelected=true
        flow("all","missing").first(); check(MetadataFixtureFlows.requests.last() == "first:series:missing:catalog")
        val beforeRetry = MetadataFixtureFlows.requests.size
        flow("all","missing").first()
        check(MetadataFixtureFlows.requests.size == beforeRetry + 1 && MetadataFixtureFlows.requests.last().startsWith("first:"))
        MetadataFixtureFlows.failSelected=false
        setting("profile",2); check(imageMethod.invoke(null,item,true) == null)
        setting("profile",1)
        val stale = flow("all")
        setting("profile",2); stale.first(); check(MetadataFixtureFlows.requests.last().startsWith("first:"))
        MetadataFixtureFlows.pause=true
        val pending = launch { flow("all").first() }
        MetadataFixtureFlows.entered.await(); pending.cancelAndJoin()
        check(pending.isCancelled)
        MetadataFixtureFlows.entered = CompletableDeferred()
        MetadataFixtureFlows.release = CompletableDeferred()
        val stalePending = launch { flow("all", "switched").first() }
        MetadataFixtureFlows.entered.await()
        setting("profile",3)
        MetadataFixtureFlows.release.complete(Unit)
        stalePending.join(); check(stalePending.isCancelled)
        MetadataFixtureFlows.pause=false
        // Library effects are independent of CW and never replace the native entry or image request.
        setting("profile",1); setting("cw",false)
        val composer = child.loadClass("g1.k0").getConstructor().newInstance()
        val previewType = child.loadClass("com.nuvio.tv.domain.model.MetaPreview")
        fun libraryCard(id: String) = child.loadClass("na.b2").constructors.single().newInstance(previewType.getConstructor(String::class.java).newInstance(id))
        val libraryPoster = bridge.getMethod("libraryPoster", Any::class.java, String::class.java, Any::class.java, Boolean::class.javaPrimitiveType)
        val libraryCard = libraryCard("library-only")
        val beforeLibrary = MetadataFixtureFlows.requests.size
        check(libraryPoster.invoke(null,libraryCard,"native-poster",composer,false) == "native-poster")
        check(MetadataFixtureFlows.requests.size == beforeLibrary && MetadataFixtureFlows.effects.isEmpty())
        setting("library",true)
        check(libraryPoster.invoke(null,libraryCard,"native-poster",composer,false) == "native-poster")
        withTimeout(3_000) { MetadataFixtureFlows.effects.values.toList().joinAll() }
        check(MetadataFixtureFlows.requests.last() == "selected:series:library-only:none")
        check(libraryPoster.invoke(null,libraryCard,"native-poster",composer,false) == "selected/poster")
        check(libraryPoster.invoke(null,libraryCard,"native-landscape",composer,true) == "selected/landscape")
        check(child.loadClass("g1.k0").getField("depth").getInt(composer) == 0)
        setting("library",false)
        check(libraryPoster.invoke(null,libraryCard,"native-poster",composer,false) == "native-poster")
        setting("library",true); setting("profile",2)
        check(libraryPoster.invoke(null,libraryCard,"native-poster",composer,false) == "native-poster")
        withTimeout(3_000) { MetadataFixtureFlows.effects.values.toList().joinAll() }
        setting("profile",1); MetadataFixtureFlows.failSelected=true
        val failedCard = libraryCard("library-failure")
        check(libraryPoster.invoke(null,failedCard,"native-fallback",composer,false) == "native-fallback")
        withTimeout(3_000) { MetadataFixtureFlows.effects.values.toList().joinAll() }
        check(libraryPoster.invoke(null,failedCard,"native-fallback",composer,false) == "native-fallback")
        MetadataFixtureFlows.failSelected=false
        MetadataFixtureFlows.pause=true; MetadataFixtureFlows.entered=CompletableDeferred(); MetadataFixtureFlows.release=CompletableDeferred()
        libraryPoster.invoke(null,libraryCard("disposed"),"native",composer,false)
        MetadataFixtureFlows.entered.await()
        MetadataFixtureFlows.effects.values.filter { it.isActive }.forEach { it.cancelAndJoin() }
        check((bridge.getDeclaredField("libraryQueued").apply { isAccessible=true }.get(null) as java.util.concurrent.atomic.AtomicInteger).get() == 0)
        MetadataFixtureFlows.pause=false
        repeat(8) { setting("profile",it+10); flow("all").first() }
        val map = bridge.getDeclaredField("repositories").apply { isAccessible=true }.get(null) as Map<*,*>
        check(map.size <= 4)
    }
    println("PASS: production routing, disabled/native paths, CW opt-in, URL-specific lookup, error fallback, profile/stale-flow isolation, cancellation, bounded repositories and immutable poster/landscape/hero decoration, independent library effects, initial/native fallback, redraw state and disposal cancellation")
}
