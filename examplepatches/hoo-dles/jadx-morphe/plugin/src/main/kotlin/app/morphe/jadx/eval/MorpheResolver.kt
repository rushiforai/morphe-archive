package app.morphe.jadx.eval

import app.morphe.jadx.Log
import app.morphe.patcher.Fingerprint
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

/**
 * Snapshot of a fingerprint match.
 *
 * Patcher [app.morphe.patcher.Match] objects look up the matched class and method from the
 * patch context on every access, so they cannot be used after the patcher is closed.
 */
data class FingerprintMatch(
    val definingClass: String,
    val methodShortId: String,
    val firstInstructionIndex: Int?,
    // Only set if more than one instruction filter matched.
    val lastInstructionIndex: Int?,
)

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

    fun matches(fingerprint: Fingerprint): List<FingerprintMatch> {
        var matches: List<FingerprintMatch> = emptyList()
        val tempPatch = bytecodePatch(
            name = "Temporary patch for searching fingerprint"
        ) {
            execute {
                // Copy match data while the patch context is still open.
                matches = fingerprint.matchAllOrNull().orEmpty().map { match ->
                    val method = match.originalMethod
                    val instructionMatches = match.instructionMatchesOrNull
                    FingerprintMatch(
                        method.definingClass,
                        method.getShortId(),
                        instructionMatches?.firstOrNull()?.index,
                        instructionMatches?.takeIf { it.size > 1 }?.last()?.index,
                    )
                }
                if (matches.isNotEmpty()) Log.info { "Fingerprint matched ${matches.size} methods:${matches.joinToString { "\n\t${it.definingClass}->${it.methodShortId}" }}" }
                else Log.warn { "Fingerprint did not match any methods" }
            }
        }

        // New Patcher instance must be created on each evaluation
        val patcher = Patcher(
            PatcherConfig(
                this.sourceApk,
                this.temp
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
