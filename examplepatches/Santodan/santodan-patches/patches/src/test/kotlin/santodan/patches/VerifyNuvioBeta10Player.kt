package santodan.patches

import java.io.File
import java.net.URLClassLoader
import java.nio.file.Files
import javax.tools.ToolProvider
import software.santodan.extension.nuviostreams.engine.StreamTargets

/** Exercise the production readers with beta.10's actual class and field identities. */
fun main(args: Array<String>) {
    val directory = Files.createTempDirectory(File(args[0]).toPath(), "beta10-player-")
    val sources = mapOf(
        "bb.l4" to """package bb; public class l4 {
            public String a="tt1:3:1",g="2026-01-01";
            public int b=3,c=1; public boolean h=true; public Boolean i=true;
        }""",
        "bb.jl" to """package bb; public class jl {
            public String F0="tt1:2:9",m1=null,g="SERIES";
            public bb.l4 y1=new bb.l4(); public boolean a=true,b=false,c=false;
            public Object d=null;
        }""",
        "bb.gc" to """package bb; public class gc { public String T="TV"; }""",
        "bb.ml" to """package bb; public class ml { public bb.gc Y=new bb.gc(); }""",
        "q8.e" to """package q8; public class e { public Object B="profile",g3="streams"; }""",
    )
    val files = sources.map { (name, source) ->
        directory.resolve(name.replace('.', '/') + ".java").also {
            Files.createDirectories(it.parent)
            Files.write(it, source.toByteArray(Charsets.UTF_8))
        }.toString()
    }
    check(ToolProvider.getSystemJavaCompiler().run(null, null, null,
        "-d", directory.toString(), *files.toTypedArray()) == 0)
    URLClassLoader(arrayOf(directory.toUri().toURL())).use { loader ->
        val state = loader.loadClass("bb.jl").getConstructor().newInstance()
        fun snapshot() = StreamTargets.player(state, "profile", true, true, "TV")
        val ready = snapshot()
        check(ready.playing && ready.currentVideoId == "tt1:2:9")
        check(ready.next == StreamTargets.Media("series", "tt1:3:1", 3, 1))
        state.javaClass.getField("b").setBoolean(state, true)
        check(!snapshot().playing)
        state.javaClass.getField("b").setBoolean(state, false)
        state.javaClass.getField("m1").set(state, "playback failed")
        check(!snapshot().playing)
        state.javaClass.getField("m1").set(state, null)
        val next = state.javaClass.getField("y1").get(state)
        next.javaClass.getField("h").setBoolean(next, false)
        check(snapshot().next == null)
        val model = loader.loadClass("bb.ml").getConstructor().newInstance()
        val controller = StreamTargets.field(model, "Y")!!
        check(StreamTargets.field(controller, "T") == "TV")
        val component = loader.loadClass("q8.e").getConstructor().newInstance()
        check(StreamTargets.field(component, "B") == "profile")
        check(StreamTargets.field(component, "g3") == "streams")
    }
    println("PASS: beta.10 player IDs, cross-season target, buffering/errors, unaired rejection, controller and Hilt readers")
}
