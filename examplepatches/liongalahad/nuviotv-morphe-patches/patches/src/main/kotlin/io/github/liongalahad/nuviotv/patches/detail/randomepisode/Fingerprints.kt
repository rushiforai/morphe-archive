package io.github.liongalahad.nuviotv.patches.detail.randomepisode

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val META = "Lcom/nuvio/tv/domain/model/Meta;"
internal const val VIDEO = "Lcom/nuvio/tv/domain/model/Video;"
internal const val NEXT_TO_WATCH = "Lcom/nuvio/tv/domain/model/NextToWatch;"
private const val MDB_RATINGS = "Lcom/nuvio/tv/domain/model/MDBListRatings;"
private const val WATCH_PROGRESS = "Lcom/nuvio/tv/domain/model/WatchProgress;"
private const val CONTINUE_WATCHING_CARD_STYLE =
    "Lcom/nuvio/tv/domain/model/ContinueWatchingCardStyle;"
private const val CARD_DEPTH_STYLE = "Lcom/nuvio/tv/domain/model/CardDepthStyle;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val FUNCTION3 = "Lkotlin/jvm/functions/Function3;"
private const val FUNCTION2 = "Lkotlin/jvm/functions/Function2;"
private const val COMPOSER = "Lf1/p;"
internal const val INTEGER = "Ljava/lang/Integer;"

private fun Method.parameterNames() = parameterTypes.map(CharSequence::toString)

private fun Method.calls(predicate: (MethodReference) -> Boolean): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@any false
        predicate(reference)
    } == true

private fun MethodReference.isContinueWatchingImage(): Boolean =
    returnType == "V" && parameterTypes.map(CharSequence::toString).let { p ->
        p.size == 15 && p[1] == "Ljava/lang/String;" && p[6] == FUNCTION1 &&
            p[7] == FUNCTION1 && p[10] == "F" && p[11] == COMPOSER &&
            p.slice(12..14) == listOf("I", "I", "I")
    }

private fun MethodReference.isContinueWatchingWide(): Boolean =
    returnType == "V" && parameterTypes.map(CharSequence::toString).let { p ->
        p.size == 21 && p[1] == "Ljava/lang/String;" && p[2] == "Z" &&
            p.slice(4..5) == listOf("F", "F") && p[7] == CARD_DEPTH_STYLE &&
            p[14] == "J" && p[15] == "Z" && p[16] == "F" && p[17] == "Z" &&
            p[18] == FUNCTION0 && p[19] == COMPOSER && p[20] == "I"
    }

private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"

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

/** Detail content boundary containing Meta and Nuvio's merged watched-episode set. */
internal object MetaDetailsContentFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size > 90 && p[2] == META && p[13] == "Ljava/util/Map;" &&
            p[14] == "Ljava/util/Set;" &&
            method.calls { it.definingClass == META && it.name == "getVideos" }
    }
)

/** Home destination boundary used to end a detail-page random-selection visit. */
internal object HomeContentFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("onNavigateToDetail", "movie", "series", "tv", "anime", "local"),
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 9 && p[1] == FUNCTION3 &&
            p.slice(2..4) == listOf(FUNCTION1, FUNCTION1, FUNCTION1) &&
            p[5] == FUNCTION3 && p[6] == FUNCTION2 && p[7] == COMPOSER && p[8] == "I"
    }
)

/** Home's already-loaded per-show episode summary constructor. */
internal object HomeCatalogSummaryFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("id", "name", "genres", "videos"),
    custom = { method, _ ->
        method.name == "<init>" && method.parameterNames() == listOf(
            "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;",
            "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;",
            "Ljava/util/List;", "Ljava/lang/String;", "Ljava/lang/Float;",
            "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/ArrayList;"
        )
    }
)

/** Native boundary that separates ordinary Continue Watching items from future releases. */
internal object SplitUpcomingFingerprint : Fingerprint(
    returnType = "Lkotlin/Pair;",
    strings = listOf("items", "mode"),
    custom = { method, _ ->
        method.parameterNames() == listOf(
            "Ljava/util/List;",
            "Lcom/nuvio/tv/domain/model/ContinueWatchingSortMode;"
        ) && method.implementation?.instructions?.count { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@count false
            reference.definingClass == "Lkotlin/TuplesKt;" &&
                reference.name == "to" && reference.returnType == "Lkotlin/Pair;"
        } == 2
    }
)

/** Immutable Home state model that owns the two lists rendered by the section rows. */
internal object HomeStateFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("catalogRows", "continueWatchingItems", "upcomingItems", "homeRows"),
    custom = { method, _ ->
        val p = method.parameterNames()
        method.name == "<init>" && p.size > 45 &&
            p.take(3) == listOf(
                "Ljava/util/List;", "Ljava/util/List;", "Ljava/util/List;"
            ) && p.last() == "Ljava/util/List;"
    }
)

/** Public Continue Watching card, anchored by its exact card-style and resource shape. */
internal object ContinueWatchingCardFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(literal(0x7f1103a0L), literal(0x7f1103a2L)),
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 16 && p[1] == FUNCTION0 && p[2] == FUNCTION0 &&
            p.slice(4..5) == listOf("F", "F") && p.slice(6..7) == listOf("Z", "Z") &&
            p[8] == CONTINUE_WATCHING_CARD_STYLE && p[9] == "Z" && p[10] == "F" &&
            p[12] == COMPOSER && p.slice(13..15) == listOf("I", "I", "I")
    }
)

/** Card content lambda that owns the ordinary card/poster artwork Box. */
internal object ContinueWatchingArtworkFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    custom = { method, classDef ->
        method.name == "invoke" && FUNCTION3 in classDef.interfaces &&
            method.calls(MethodReference::isContinueWatchingImage) &&
            method.calls { reference ->
                reference.returnType == "V" &&
                    reference.parameterTypes.map(CharSequence::toString).let { p ->
                        p.size == 21 && p[7] == CARD_DEPTH_STYLE && p[14] == "J" &&
                            p[18] == FUNCTION0 && p[19] == COMPOSER && p[20] == "I"
                    }
            }
    }
)

/** Wide Continue Watching artwork/content composable. */
internal object ContinueWatchingWideFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 21 && p[1] == "Ljava/lang/String;" && p[2] == "Z" &&
            p.slice(4..5) == listOf("F", "F") && p[7] == CARD_DEPTH_STYLE &&
            p[14] == "J" && p[15] == "Z" && p[16] == "F" && p[17] == "Z" &&
            p[18] == FUNCTION0 && p[19] == COMPOSER && p[20] == "I" &&
            method.calls(MethodReference::isContinueWatchingImage)
    }
)

/** Restart lambda retained by Compose when wide Continue Watching content recomposes alone. */
internal object ContinueWatchingWideRestartFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
    custom = { method, classDef ->
        method.name == "invoke" && FUNCTION2 in classDef.interfaces &&
            method.calls(MethodReference::isContinueWatchingWide)
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
        p.size == 21 && p[19] == INTEGER && p[20] == "I" && p.take(3) == listOf(
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
