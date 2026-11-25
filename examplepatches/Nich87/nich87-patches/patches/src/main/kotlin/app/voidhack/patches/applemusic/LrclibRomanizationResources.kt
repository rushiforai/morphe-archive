package app.voidhack.patches.applemusic

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch

internal val lrclibRomanizationResources = resourcePatch {
    execute {
        listOf("CONTRIBUTORS.md", "LICENSE.md", "NOTICE.md").forEach { entry ->
            copyLyricsResource("kuromoji/META-INF/$entry", "assets/voidhack/lyrics/kuromoji/$entry")
        }
    }
}

private fun ResourcePatchContext.copyLyricsResource(source: String, target: String) {
    val resource = "/applemusic/lyrics/$source"
    checkNotNull(RomanizationResources::class.java.getResourceAsStream(resource)) {
        "Missing bundled pronunciation resource $resource."
    }.use { input ->
        this[target, false].outputStream().use { output -> input.copyTo(output) }
    }
}

private object RomanizationResources
