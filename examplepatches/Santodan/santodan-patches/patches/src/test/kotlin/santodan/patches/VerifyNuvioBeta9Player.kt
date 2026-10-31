package santodan.patches

import java.io.File
import java.net.URLClassLoader
import java.nio.file.Files
import javax.tools.ToolProvider
import software.santodan.extension.nuviostreams.engine.StreamTargets

/** Exercise the production readers with beta.9's actual class and field identities. */
fun main(args: Array<String>) {
    val directory = Files.createTempDirectory(File(args[0]).toPath(), "beta9-player-")
    val sources = mapOf(
        "bb.k4" to """package bb; public class k4 {
            public String a="tt1:3:1",g="2026-01-01";
            public int b=3,c=1; public boolean h=true; public Boolean i=true;
        }""",
        "bb.el" to """package bb; public class el {
            public String C0="tt1:2:9",j1=null,g="SERIES";
            public bb.k4 v1=new bb.k4(); public boolean a=true,b=false,c=false;
            public Object d=null;
        }""",
        "bb.bc" to """package bb; public class bc { public String T="TV"; }""",
        "bb.hl" to """package bb; public class hl { public bb.bc Y=new bb.bc(); }""",
        "q8.e" to """package q8; public class e { public Object B="profile",e3="streams"; }""",
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
        val state = loader.loadClass("bb.el").getConstructor().newInstance()
        fun snapshot() = StreamTargets.player(state, "profile", true, true, "TV")
        val ready = snapshot()
        check(ready.playing && ready.currentVideoId == "tt1:2:9")
        check(ready.next == StreamTargets.Media("series", "tt1:3:1", 3, 1))
        state.javaClass.getField("b").setBoolean(state, true)
        check(!snapshot().playing)
        state.javaClass.getField("b").setBoolean(state, false)
        state.javaClass.getField("j1").set(state, "playback failed")
        check(!snapshot().playing)
        state.javaClass.getField("j1").set(state, null)
        val next = state.javaClass.getField("v1").get(state)
        next.javaClass.getField("h").setBoolean(next, false)
        check(snapshot().next == null)
        val model = loader.loadClass("bb.hl").getConstructor().newInstance()
        val controller = StreamTargets.field(model, "Y")!!
        check(StreamTargets.field(controller, "T") == "TV")
        val component = loader.loadClass("q8.e").getConstructor().newInstance()
        check(StreamTargets.field(component, "B") == "profile")
        check(StreamTargets.field(component, "e3") == "streams")
    }
    println("PASS: beta.9 player IDs, cross-season target, buffering/errors, unaired rejection, controller and Hilt readers")
}
