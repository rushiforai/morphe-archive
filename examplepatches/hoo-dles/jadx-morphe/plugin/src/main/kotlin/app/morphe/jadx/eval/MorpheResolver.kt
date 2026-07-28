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
    private lateinit var sourceApk: File
    private lateinit var temp: File

    @OptIn(DelicateCoroutinesApi::class)
    fun init(
        sourceApk: File,
        temp: File,
    ) {
        this.sourceApk = sourceApk
        // Add a random suffix to the temporary files path
        this.temp = File(temp, UUID.randomUUID().toString())

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

        // New Patcher instance must be created on each evaluation
        val patcher = Patcher(
            PatcherConfig(
                this.sourceApk,
                this.temp,
                null,
                this.temp.absolutePath,
            ),
        )

        patcher.use {
            it += setOf(tempPatch)
            runBlocking {
                it().collect { result ->
                    result.exception?.let { ex ->
                        Log.error(ex) { "Application of temporary patch failed" }
                    }
                }
            }
        }

        return matches
    }
}
