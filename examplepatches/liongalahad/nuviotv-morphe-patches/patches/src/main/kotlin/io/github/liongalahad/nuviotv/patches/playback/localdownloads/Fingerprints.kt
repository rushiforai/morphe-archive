package io.github.liongalahad.nuviotv.patches.playback.localdownloads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val META = "Lcom/nuvio/tv/domain/model/Meta;"
internal const val VIDEO = "Lcom/nuvio/tv/domain/model/Video;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
private const val FUNCTION2 = "Lkotlin/jvm/functions/Function2;"
private const val FUNCTION3 = "Lkotlin/jvm/functions/Function3;"
private const val KOTLIN_FUNCTION = "Lkotlin/Function;"
private const val INTEGER = "Ljava/lang/Integer;"
private const val PLAYER_LISTENER = "Landroidx/media3/common/Player\$Listener;"

private fun Method.parameterNames() = parameterTypes.map(CharSequence::toString)
private fun Method.calls(predicate: (MethodReference) -> Boolean): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@any false
        predicate(reference)
    } == true

private fun Method.buildsComposableLambda() = calls { reference ->
    reference.definingClass == "Lo1/x;" && reference.name == "d" &&
        reference.parameterTypes.map(CharSequence::toString).let { parameters ->
            parameters.size == 3 && parameters[0] == "I" && parameters[1] == KOTLIN_FUNCTION
        }
}

internal object HeroContentFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 26 && p[0] == META && p[1] == VIDEO && p[2].endsWith("/NextToWatch;") &&
            p[3] == FUNCTION0 && p[4] == FUNCTION0 && p[25] == "I" &&
            method.calls { it.definingClass == META && it.name == "getApiType" }
    }
)

/** Detail action row containing Nuvio's Add to Library and movie Watched controls. */
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

internal object HeroOptionsDialogFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.parameterNames() == listOf(
            "Ljava/lang/String;", "Ljava/lang/String;", FUNCTION0, "Z", FUNCTION0,
            "Z", FUNCTION0, "Le1/m0;", "I"
        ) && method.buildsComposableLambda()
    }
)

internal object EpisodeOptionsDialogFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 20 && p[0] == VIDEO && p.slice(1..5) == List(5) { "Z" } &&
            p.slice(6..9) == List(4) { FUNCTION0 } && p[10] == "Z" &&
            p[11] == FUNCTION0 && p[12] == "Z" && p.slice(13..16) == List(4) { FUNCTION0 } &&
            p[17] == "Le1/m0;" && p[18] == "I" && p[19] == "I" &&
            method.implementation?.instructions?.any {
                (it as? WideLiteralInstruction)?.wideLiteral == 0x7f1104e9L
            } == true && method.buildsComposableLambda()
    }
)

/** Episode-card content lambda which draws Nuvio's watched badge over the thumbnail. */
internal object EpisodeCardContentFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"
    ),
    custom = { method, classDef ->
        method.name == "invoke" && FUNCTION3 in classDef.interfaces &&
            classDef.fields.count { it.type == VIDEO } == 1 &&
            method.calls { reference ->
                reference.returnType == "Lh2/f;" && reference.parameterTypes.isEmpty()
            }
    }
)

internal object ContinueOptionsDialogFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.parameterNames().let { p ->
            p.size == 9 && p[0].startsWith("L") &&
                p.drop(1) == listOf(
                    FUNCTION0, FUNCTION0, FUNCTION0, FUNCTION0, "Z", FUNCTION0, "Le1/m0;", "I"
                )
        } && method.implementation?.instructions?.any {
            (it as? WideLiteralInstruction)?.wideLiteral == 0x7f110377L
        } == true && method.buildsComposableLambda()
    }
)

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

internal object StreamScreenFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.parameterNames().let { p ->
            p.size == 6 && p[0].startsWith("L") && p.drop(1) == listOf(
                FUNCTION0, FUNCTION1, FUNCTION1, "Le1/m0;", "I"
            )
        }
    }
)

/** Coroutine used by Nuvio to retrieve addon subtitles for the selected title. */
internal object SubtitleWorkerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("Fetching subtitles for type=", "Subtitle fetch completed total="),
    custom = { method, classDef ->
        method.name == "invokeSuspend" && FUNCTION2 in classDef.interfaces &&
            classDef.methods.any { constructor ->
                constructor.name == "<init>" && constructor.parameterNames().let { p ->
                    p.size == 10 && p[1] == "Ljava/lang/String;" &&
                        p[2] == "Ljava/lang/String;" && p[3] == "Ljava/lang/String;" &&
                        p[4] == FUNCTION3 && p[5] == FUNCTION1 &&
                        p[6] == "Ljava/lang/String;" && p[7] == "Ljava/lang/Long;" &&
                        p[8] == "Ljava/lang/String;" &&
                        p[9] == "Lkotlin/coroutines/Continuation;"
                }
            }
    }
)

/** Captures Nuvio's active Compose navigation controller for direct local playback. */
internal object NuvioNavHostFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("navController"),
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 5 && p[1] == "Ljava/lang/String;" && p[2] == "Z" && p[4] == "I" &&
            method.calls { reference ->
                reference.returnType == "V" &&
                    reference.parameterTypes.map(CharSequence::toString).let { parameters ->
                        parameters.size == 11 && parameters[4] == FUNCTION1 &&
                            parameters[5] == FUNCTION1 && parameters[6] == FUNCTION1 &&
                            parameters[7] == FUNCTION1 && parameters[8] == FUNCTION1
                    }
            }
    }
)

internal object PlayerMediaSourceFactoryFingerprint : Fingerprint(
    returnType = "Landroidx/media3/exoplayer/source/MediaSource;",
    strings = listOf(
        "context", "url", "headers", "subtitleConfigurations", "responseHeaders",
        "application/x-mpegURL", "application/dash+xml"
    ),
    custom = { method, _ ->
        method.parameterNames() == listOf(
            "Landroid/content/Context;", "Ljava/lang/String;", "Ljava/util/Map;",
            "Ljava/util/List;", "Ljava/lang/String;", "Ljava/util/Map;", "Ljava/lang/String;",
            FUNCTION0, "Landroidx/media3/common/MediaMetadata;"
        )
    }
)

internal object FullscreenPlaybackStateListenerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I"),
    strings = listOf("exo_playback_state", "playbackState="),
    custom = { method, classDef ->
        method.name == "onPlaybackStateChanged" && PLAYER_LISTENER in classDef.interfaces
    }
)
