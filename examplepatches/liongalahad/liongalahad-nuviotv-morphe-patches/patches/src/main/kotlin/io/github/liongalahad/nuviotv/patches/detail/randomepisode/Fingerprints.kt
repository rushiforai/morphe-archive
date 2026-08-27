package io.github.liongalahad.nuviotv.patches.detail.randomepisode

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val META = "Lcom/nuvio/tv/domain/model/Meta;"
internal const val VIDEO = "Lcom/nuvio/tv/domain/model/Video;"
private const val NEXT_TO_WATCH = "Lcom/nuvio/tv/domain/model/NextToWatch;"
private const val MDB_RATINGS = "Lcom/nuvio/tv/domain/model/MDBListRatings;"
private const val WATCH_PROGRESS = "Lcom/nuvio/tv/domain/model/WatchProgress;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
internal const val INTEGER = "Ljava/lang/Integer;"

private fun Method.parameterNames() = parameterTypes.map(CharSequence::toString)

private fun Method.calls(predicate: (MethodReference) -> Boolean): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@any false
        predicate(reference)
    } == true

/** Public detail hero composable, identified by its model/callback shape. */
internal object HeroContentFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 26 && p[0] == META && p[1] == VIDEO && p[2] == NEXT_TO_WATCH &&
            p[3] == FUNCTION0 && p[4] == FUNCTION0 && p[5] == "Z" &&
            p[14] == MDB_RATINGS && p[16] == "Ljava/lang/Float;" && p[20] == "I" &&
            p[21] == FUNCTION0 && p[22] == FUNCTION0 && p[23] == FUNCTION0 && p[25] == "I" &&
            method.calls { it.definingClass == META && it.name == "getApiType" }
    }
)

/** Native circular action helper used by Play, Library and Watched. */
internal object HeroActionIconFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 13 && p[2] == "Ljava/lang/String;" && p[3] == FUNCTION0 &&
            p[4] == FUNCTION0 && p[5] == "Z" && p[6] == "Z" &&
            p[7] == "J" && p[8] == "J" && p[9] == FUNCTION0 &&
            p[11] == "I" && p[12] == "I"
    }
)

/** Generated hero-row lambda that calls the native circular action helper. */
internal object HeroActionRowFingerprint : Fingerprint(
    custom = { method, _ ->
        method.implementation?.instructions?.count { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@count false
            val p = reference.parameterTypes.map(CharSequence::toString)
            reference.returnType == "V" && p.size == 13 &&
                p[2] == "Ljava/lang/String;" && p[3] == FUNCTION0 &&
                p[4] == FUNCTION0 && p[5] == "Z" && p[6] == "Z" &&
                p[7] == "J" && p[8] == "J" && p[9] == FUNCTION0 &&
                p[11] == "I" && p[12] == "I"
        } == 2
    }
)

/** Detail content boundary that builds the hero manual-play dialog subtitle. */
internal object ManualPlayDialogFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.calls {
            it.definingClass == NEXT_TO_WATCH && it.name == "getDisplayText" &&
                it.returnType == "Ljava/lang/String;"
        } && method.calls { it.definingClass == META && it.name == "getName" }
    }
)

/** Stream route builder, before its Kotlin default-argument bridge. */
internal object StreamRouteFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    strings = listOf("stream/", "?poster=", "&manualSelection=", "&contentLanguage="),
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 19 && p.take(3) == listOf(
            "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"
        ) && p[6] == INTEGER && p[7] == INTEGER && p[13] == INTEGER &&
            p.slice(14..17) == listOf("Z", "Z", "Z", "Z")
    }
)

/** Series next-episode recomputation boundary. */
internal object RecomputeNextEpisodeFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("series", "tv", "other"),
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 2 && p[1] == "Z" &&
            method.calls { it.definingClass == VIDEO && it.name == "getReleased" } &&
            method.calls { reference ->
                reference.returnType == VIDEO &&
                    reference.parameterTypes.size == 3 &&
                    reference.parameterTypes.any { it.toString() == "Ljava/util/List;" }
            }
    }
)

/** Single persistence boundary for local and remote watch progress. */
internal object SaveWatchProgressFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 4 && p[1] == "J" && p[2] == "J" && p[3] == "Z" &&
            method.calls { it.definingClass == WATCH_PROGRESS && it.name == "<init>" }
    }
)

/** Central scrobble identity factory; returning null suppresses every provider. */
internal object BuildScrobbleItemFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    strings = listOf("movie"),
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 1 && p[0].startsWith("L") && method.returnType.startsWith("L") &&
            method.calls { reference ->
                reference.returnType == method.returnType &&
                    reference.parameterTypes.size == 8
            }
    }
)

/** Inline resume-progress load executed before player initialization. */
internal object LoadSavedProgressSuspendFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("loadSavedProgressSuspend: set pendingResumeProgress "),
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 4 && p[1] == INTEGER && p[2] == INTEGER &&
            p[3].endsWith("/ContinuationImpl;")
    }
)

/** Player-back navigation path that writes season/episode focus into Detail state. */
internal object ReturnFocusFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf(
        "detail/{itemId}/{itemType}?addonBaseUrl={addonBaseUrl}&returnFocusSeason=",
        "returnFocusSeason"
    ),
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 4 && method.implementation?.instructions?.count { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Lkotlin/text/StringsKt;" &&
                reference.name == "toIntOrNull" &&
                reference.returnType == INTEGER
        } == 2
    }
)

/** Background Trakt episode mapping warm-up used by playback scrobbling. */
internal object WarmTraktMappingFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(literal(12_000L)),
    strings = listOf("series", "tv"),
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 2 && p[1].endsWith("/ContinuationImpl;")
    }
)
