package io.github.liongalahad.nuviotv.patches.playback.localdownloads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val META = "Lcom/nuvio/tv/domain/model/Meta;"
internal const val VIDEO = "Lcom/nuvio/tv/domain/model/Video;"
private const val STREAM = "Lcom/nuvio/tv/domain/model/Stream;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
private const val FUNCTION2 = "Lkotlin/jvm/functions/Function2;"
private const val FUNCTION3 = "Lkotlin/jvm/functions/Function3;"
private const val KOTLIN_FUNCTION = "Lkotlin/Function;"
private const val INTEGER = "Ljava/lang/Integer;"
private const val PLAYER_LISTENER = "Landroidx/media3/common/Player\$Listener;"
private const val COMPOSER = "Lf1/p;"
private const val EPISODE_OPTIONS_STYLE =
    "Lcom/nuvio/tv/domain/model/EpisodeOptionsOverlayStyle;"

private fun Method.parameterNames() = parameterTypes.map(CharSequence::toString)
private fun Method.calls(predicate: (MethodReference) -> Boolean): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@any false
        predicate(reference)
    } == true

private fun Method.buildsComposableLambda() = calls { reference ->
    reference.definingClass == "Lp1/x;" && reference.name == "d" &&
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
            "Z", FUNCTION0, COMPOSER, "I", "I"
        ) && method.buildsComposableLambda()
    }
)

internal object EpisodeOptionsDialogFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 23 && p[0] == VIDEO && p[1] == "Ljava/lang/Double;" &&
            p.slice(2..3) == List(2) { "Z" } && p[4] == EPISODE_OPTIONS_STYLE &&
            p.slice(5..8) == List(4) { "Z" } && p.slice(9..12) == List(4) { FUNCTION0 } &&
            p[13] == "Z" && p[14] == FUNCTION0 && p[15] == "Z" &&
            p.slice(16..19) == List(4) { FUNCTION0 } && p[20] == COMPOSER &&
            p[21] == "I" && p[22] == "I" &&
            method.implementation?.instructions?.any {
                (it as? WideLiteralInstruction)?.wideLiteral == 0x7f110798L
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
                reference.returnType == "Li2/f;" && reference.parameterTypes.isEmpty()
            }
    }
)

internal object ContinueOptionsDialogFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.parameterNames().let { p ->
            p.size == 9 && p[0].startsWith("L") &&
                p.drop(1) == listOf(
                    FUNCTION0, FUNCTION0, FUNCTION0, FUNCTION0, "Z", FUNCTION0, COMPOSER, "I"
                )
        } && method.implementation?.instructions?.any {
            (it as? WideLiteralInstruction)?.wideLiteral == 0x7f11039aL
        } == true && method.buildsComposableLambda()
    }
)

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

internal object StreamScreenFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.parameterNames().let { p ->
            p.size == 9 && p[0].startsWith("L") && p.drop(1) == listOf(
                "Z", "Z", FUNCTION0, FUNCTION0, FUNCTION1, FUNCTION1, COMPOSER, "I"
            )
        }
    }
)

/** A source row in the ordinary and explicit-download stream pickers. */
internal object SourceCardFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.parameterNames().let { p ->
            p.size == 11 && p[0] == STREAM && p[1] == "Z" && p[2] == "Z" &&
                p[3].startsWith("L") && p[4] == "Z" && p[5] == FUNCTION0 &&
                p[6].startsWith("L") && p[7] == FUNCTION1 && p[8] == FUNCTION0 &&
                p[9].startsWith("L") && p[10] == "I"
        } && method.calls { reference ->
            reference.returnType == "V" &&
                reference.parameterTypes.map(CharSequence::toString).let { p ->
                    p.size == 11 && p[0] == FUNCTION0 && p[1].startsWith("L") &&
                        p.slice(2..6).all { it.startsWith("L") } &&
                        p[7] == FUNCTION3 && p[8].startsWith("L") &&
                        p[9] == "I" && p[10] == "I"
                }
        }
    }
)

/** Native TV Button receiving the source row's modifier. */
internal object NativeSourceTvButtonFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.parameterNames().let { p ->
            p.size == 11 && p[0] == FUNCTION0 && p[1].startsWith("L") &&
                p.slice(2..6).all { it.startsWith("L") } &&
                p[7] == FUNCTION3 && p[8].startsWith("L") &&
                p[9] == "I" && p[10] == "I"
        }
    }
)

/** Defaultable native TV Button used by the resumed-episode options dialog. */
internal object NativeDefaultableTvButtonFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.parameterNames().let { p ->
            p.size == 13 && p[0] == FUNCTION0 && p[1].startsWith("L") &&
                p[2] == "Z" && p[3].startsWith("L") && p[4].startsWith("L") &&
                p[5].startsWith("L") && p[6].startsWith("L") && p[7].startsWith("L") &&
                p[8] == FUNCTION3 && p[9].startsWith("L") &&
                p[10] == "I" && p[11] == "I" && p[12] == "I"
        }
    }
)

/** Native text composable used inside the patch-owned TV Button label. */
internal object NativeTextFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.parameterNames().let { p ->
            p.size == 19 && p[0] == "Ljava/lang/String;" && p[1].startsWith("L") &&
                p[2] == "J" && p[3] == "J" && p[6] == "J" && p[8] == "J" &&
                p[9] == "I" && p[10] == "Z" && p[11] == "I" && p[12] == "I" &&
                p[13] == FUNCTION1 && p[15].startsWith("L") &&
                p[16] == "I" && p[17] == "I" && p[18] == "I"
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
