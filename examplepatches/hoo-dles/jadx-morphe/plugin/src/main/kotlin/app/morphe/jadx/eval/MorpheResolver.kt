package app.morphe.jadx.eval

import app.morphe.jadx.Log
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.bytecodePatch
import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.runBlocking
import java.io.File
import java.util.UUID

object MorpheResolver {
    private lateinit var patcher: Patcher

    @OptIn(DelicateCoroutinesApi::class)
    fun init(
        sourceApk: File,
        temp: File,
    ) {
        val tempFilesPath = File(temp, UUID.randomUUID().toString())
        patcher = Patcher(
            PatcherConfig(
                sourceApk,
                tempFilesPath,
                null,
                temp.absolutePath,
            ),
        )

        GlobalScope.launch(Dispatchers.IO) {
            ScriptingHost.preload()
        }
    }

    fun matches(fingerprint: Fingerprint): List<Match> {
        var matches: List<Match> = emptyList()
        val tempPatch = bytecodePatch(
            name = "Temporary patch for searching fingerprint"
        ) {
            execute {
                matches = fingerprint.matchAllOrNull().orEmpty()
                if (matches.isNotEmpty()) Log.info { "Fingerprint matched ${matches.size} methods:${matches.joinToString { "\n\t${it.method.definingClass}->${it.method.getShortId()}" }}" }
                else Log.warn { "Fingerprint did not match any methods" }
            }
        }

        patcher.use {
            it += setOf(tempPatch)
            runBlocking {
                it().collect { result ->
                    result.exception?.let { ex ->
                        Log.error(ex) { "Application of temporary patch failed" }
                    }
                }
            }

            // Calling this method will clear the Fingerprints and patches, which is desirable for each evaluation.
            it.get()
        }

        return matches
    }
}
