package io.github.liongalahad.nuviotv.patches.ratings.ratingsvisibility

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val META = "Lcom/nuvio/tv/domain/model/Meta;"
private const val META_PREVIEW = "Lcom/nuvio/tv/domain/model/MetaPreview;"
private const val VIDEO = "Lcom/nuvio/tv/domain/model/Video;"
private const val WATCH_PROGRESS = "Lcom/nuvio/tv/domain/model/WatchProgress;"

private fun Method.parameterNames() = parameterTypes.map(CharSequence::toString)

private fun Method.calls(definingClass: String, name: String): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@any false
        reference.definingClass == definingClass && reference.name == name
    } == true

/** Central standard-rating accessors used across home, collection and detail consumers. */
internal object MetaPreviewRatingGetterFingerprint : Fingerprint(
    returnType = "Ljava/lang/Float;",
    parameters = emptyList(),
    custom = { method, classDef -> classDef.type == META_PREVIEW && method.name == "getImdbRating" }
)

internal object MetaRatingGetterFingerprint : Fingerprint(
    returnType = "Ljava/lang/Float;",
    parameters = emptyList(),
    custom = { method, classDef -> classDef.type == META && method.name == "getImdbRating" }
)

/** Modern Continue Watching and Upcoming mapper, whose ratings do not use MetaPreview. */
internal object ModernContinueWatchingRatingFingerprint : Fingerprint(
    filters = listOf(literal(0x7f11034d)),
    custom = { method, _ ->
        val parameters = method.parameterNames()
        method.returnType != "V" && parameters.size == 5 &&
            parameters.last() == "Landroid/content/Context;" &&
            method.calls(WATCH_PROGRESS, "getContentType") &&
            method.calls(WATCH_PROGRESS, "getName")
    }
)

/** Detail hero metadata row; its existing hide flag preserves MDBList precedence. */
internal object DetailMetaInfoRatingFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(methodCall(definingClass = META, name = "getImdbRating", returnType = "Ljava/lang/Float;")),
    custom = { method, _ ->
        val parameters = method.parameterNames()
        parameters.take(4) == listOf(META, "Z", "Z", "Ljava/lang/Float;") &&
            method.calls(META, "getAgeRating") && method.calls(META, "getGenres")
    }
)

/** Episode card renderer with the already-computed watched state beside its rating argument. */
internal object EpisodeCardRatingFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val parameters = method.parameterNames()
        parameters.take(5) == listOf(VIDEO, WATCH_PROGRESS, "Ljava/lang/Double;", "Z", "Z") &&
            method.calls(VIDEO, "getRuntime") && method.calls(VIDEO, "getOverview")
    }
)

/** Episode ratings tab renderer, gated off completely in Hide mode. */
internal object EpisodeRatingsSectionFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(literal(0x7f11086c)),
    custom = { method, _ ->
        val parameters = method.parameterNames()
        parameters.size >= 10 && parameters[0] == "Ljava/util/List;" &&
            parameters[1] == "Ljava/util/Map;" && parameters[2] == "Z" &&
            method.calls(VIDEO, "getSeason") && method.calls(VIDEO, "getEpisode")
    }
)

internal object MetaDetailsContentFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(literal(0x7f11045f)),
    custom = { method, _ ->
        val parameters = method.parameterNames()
        parameters.size > 90 && parameters[1] == META &&
            parameters[12] == "Ljava/util/Map;" &&
            parameters[13] == "Ljava/util/Set;" &&
            parameters[23] == "Ljava/util/Map;"
    }
)
