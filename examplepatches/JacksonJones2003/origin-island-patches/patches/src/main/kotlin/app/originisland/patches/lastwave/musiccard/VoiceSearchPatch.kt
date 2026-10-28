package app.originisland.patches.lastwave.musiccard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException

private const val MEDIA_SESSION_CALLBACK_CLASS = "Landroid/media/session/MediaSession\$Callback;"
private const val SEARCH_PARAMETERS = "Ljava/lang/String;Landroid/os/Bundle;"

/**
 * Android Auto asks for a song by voice by preparing it from the search, then playing.
 * LastWave ignores the preparing, so it plays what it had before, and the song is prepared
 * by playing it from the search instead.
 */
internal fun BytecodePatchContext.addLastWaveVoiceSearch() {
    val callbacks = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.superclass == MEDIA_SESSION_CALLBACK_CLASS) callbacks += classDef.type
    }

    var patched = false
    callbacks.forEach { type ->
        val callback = mutableClassDefBy(type)
        fun isSearch(name: String) = callback.methods.any {
            it.name == name && it.parameterTypes.joinToString("") == SEARCH_PARAMETERS && it.returnType == "V"
        }
        if (!isSearch("onPlayFromSearch") || !isSearch("onPrepareFromSearch")) return@forEach

        callback.methods.single {
            it.name == "onPrepareFromSearch" && it.parameterTypes.joinToString("") == SEARCH_PARAMETERS
        }.addInstructions(
            0,
            """
                invoke-virtual { p0, p1, p2 }, $type->onPlayFromSearch($SEARCH_PARAMETERS)V
                return-void
            """
        )
        patched = true
    }

    if (!patched) throw PatchException("Could not find how LastWave plays from a search")
}
