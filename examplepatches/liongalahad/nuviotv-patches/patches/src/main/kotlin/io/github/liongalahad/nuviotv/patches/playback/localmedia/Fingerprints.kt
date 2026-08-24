package io.github.liongalahad.nuviotv.patches.playback.localmedia

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
private const val FUNCTION2 = "Lkotlin/jvm/functions/Function2;"
private const val FUNCTION3 = "Lkotlin/jvm/functions/Function3;"
private const val FUNCTION4 = "Lkotlin/jvm/functions/Function4;"
private const val PLAYER_LISTENER = "Landroidx/media3/common/Player\$Listener;"

internal var libraryModeEnumType: String? = null
internal var libraryModeLabelOwner: String? = null

private fun Method.parameterNames() = parameterTypes.map(CharSequence::toString)

private fun Method.calls(predicate: (MethodReference) -> Boolean): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@any false
        predicate(reference)
    } == true

/** Native TV Button shape used by Storage, independent of its R8 owner and method name. */
internal fun MethodReference.isNativeStorageTvButtonReference(): Boolean {
    val p = parameterTypes.map(CharSequence::toString)
    return returnType == "V" && p.size == 11 &&
        p[0] == FUNCTION0 && p[1].startsWith("L") &&
        p.slice(2..6).all { it.startsWith("L") } &&
        p[7] == FUNCTION3 && p[8].startsWith("L") &&
        p[9] == "I" && p[10] == "I"
}

/** Existing Saved/Cloud row, identified by enum-entry iteration and the TV Button call. */
internal object LibraryViewModeRowFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 6 && p[2] == FUNCTION1 && p[3] == FUNCTION2 && p[5] == "I" &&
            method.implementation?.instructions?.any { instruction ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                field?.type == "Lkotlin/enums/EnumEntries;"
            } == true &&
            method.calls { reference ->
                val parameters = reference.parameterTypes.map(CharSequence::toString)
                reference.returnType == "V" && parameters.size == 13 &&
                    parameters[0] == FUNCTION0 && parameters[8] == FUNCTION3 &&
                    parameters.takeLast(3) == listOf("I", "I", "I")
            }
    }
)

/** Generated Button-content lambda that maps the two native view modes to labels. */
internal object LibraryViewModeLabelFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    custom = { method, classDef ->
        method.name == "invoke" && FUNCTION3 in classDef.interfaces &&
            classDef.type == libraryModeLabelOwner &&
            libraryModeEnumType?.let { expectedType ->
                method.implementation?.instructions?.any { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == expectedType
                } == true
            } == true &&
            method.calls { it.name == "ordinal" && it.returnType == "I" } &&
            method.calls { reference ->
                reference.returnType == "V" &&
                    reference.parameterTypes.map(CharSequence::toString).let { parameters ->
                        parameters.size == 19 && parameters.firstOrNull() == "Ljava/lang/String;" &&
                            parameters.takeLast(3) == listOf("I", "I", "I")
                    }
            }
    }
)

/** Existing Library lazy-grid content builder, branched after the shared title and selector. */
internal object LibraryGridContentFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    custom = { method, classDef ->
        method.name == "invoke" && FUNCTION1 in classDef.interfaces &&
            libraryModeEnumType?.let { expectedType ->
                method.implementation?.instructions?.any { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == expectedType
                } == true
            } == true
            && method.calls { reference ->
                reference.definingClass == "Lf0/h;" && reference.name == "p" &&
                    reference.parameterTypes.size == 5
            }
    }
)

/** Native Library source badge, which normally renders TRAKT, SIMKL, or NUVIO. */
internal object LibrarySourceLabelFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    strings = listOf("TRAKT", "SIMKL", "NUVIO"),
    custom = { method, classDef ->
        method.name == "invoke" && FUNCTION3 in classDef.interfaces
    }
)

/** Shared Cloud search label lambda whose native placeholder string is substituted for Storage. */
internal object CloudSearchLabelFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
    custom = { method, classDef ->
        method.name == "invoke" && FUNCTION2 in classDef.interfaces &&
            method.implementation?.instructions?.any { instruction ->
                (instruction as? WideLiteralInstruction)?.wideLiteral == 0x7f1101f5L
            } == true
    }
)

/** Native empty/status row used by the Library grid. */
internal object NativeLibraryEmptyStateFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.parameterNames().let { p ->
            p.size == 8 && p[0] == "Ljava/lang/String;" &&
                p[1] == "Ljava/lang/String;" && p[2] == "Lh2/f;" &&
                p[3].startsWith("L") && p[4] == "F" &&
                p[5].startsWith("L") && p[6] == "I" && p[7] == "I"
        }
    }
)

/** Library empty-state content lambda that selects the native bookmark icon. */
internal object NativeLibraryEmptyContentFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    custom = { method, classDef ->
        method.name == "invoke" && FUNCTION3 in classDef.interfaces &&
            method.implementation?.instructions?.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                val librarySourceMode = "Lcom/nuvio/tv/domain/model/LibrarySourceMode;"
                when (reference) {
                    is TypeReference -> reference.type == librarySourceMode
                    is FieldReference -> reference.definingClass == librarySourceMode ||
                        reference.type == librarySourceMode
                    is MethodReference -> reference.definingClass == librarySourceMode ||
                        reference.returnType == librarySourceMode ||
                        reference.parameterTypes.any { it.toString() == librarySourceMode }
                    else -> false
                }
            } == true &&
            method.calls { reference ->
                reference.returnType == "V" &&
                    reference.parameterTypes.map(CharSequence::toString).let { p ->
                        p.size == 8 && p[0] == "Ljava/lang/String;" &&
                            p[1] == "Ljava/lang/String;" && p[2] == "Lh2/f;" &&
                            p[4] == "F" && p[6] == "I" && p[7] == "I"
                    }
            } &&
            method.calls { it.returnType == "Lh2/f;" && it.parameterTypes.isEmpty() }
    }
)

/** Root Nuvio navigation host, identified without relying on its obfuscated owner. */
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

/** Media3 source factory boundary where local sidecars join Nuvio's existing list. */
internal object PlayerMediaSourceFactoryFingerprint : Fingerprint(
    returnType = "Landroidx/media3/exoplayer/source/MediaSource;",
    strings = listOf(
        "context", "url", "headers", "subtitleConfigurations", "responseHeaders",
        "application/x-mpegURL", "application/dash+xml"
    ),
    custom = { method, _ ->
        method.parameterNames() == listOf(
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map;",
            "Ljava/util/List;",
            "Ljava/lang/String;",
            "Ljava/util/Map;",
            "Ljava/lang/String;",
            FUNCTION0,
            "Landroidx/media3/common/MediaMetadata;"
        )
    }
)

/** Full-screen ExoPlayer listener that publishes Nuvio's PlayerViewModel playback state. */
internal object FullscreenPlaybackStateListenerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I"),
    strings = listOf("exo_playback_state", "playbackState="),
    custom = { method, classDef ->
        method.name == "onPlaybackStateChanged" && PLAYER_LISTENER in classDef.interfaces
    }
)

/** Main activity key boundary used only to distinguish TV select click from long press. */
internal object MainActivityKeyEventFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/view/KeyEvent;"),
    custom = { method, classDef ->
        classDef.type == "Lcom/nuvio/tv/MainActivity;" && method.name == "dispatchKeyEvent"
    }
)

/** Compose's Android Dialog wrapper, identified structurally across split and universal builds. */
internal object ComposeDialogTouchEventFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
    custom = { method, classDef ->
        method.name == "onTouchEvent" &&
            classDef.fields.any { it.type == FUNCTION0 } &&
            classDef.methods.any {
                it.name == "onKeyUp" && it.returnType == "Z" &&
                    it.parameterNames() == listOf("I", "Landroid/view/KeyEvent;")
            } &&
            classDef.methods.any {
                it.name == "cancel" && it.returnType == "V" && it.parameterTypes.isEmpty()
            }
    }
)

/** Native Cloud/Storage card composable reused by the injected Storage grid. */
internal object CloudStorageCardFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val p = method.parameterNames()
        p.size == 5 && p[0].startsWith("L") && p[1] == "Z" &&
            p[2] == FUNCTION0 && p[3].startsWith("L") && p[4] == "I" &&
            method.calls(MethodReference::isNativeStorageTvButtonReference)
    }
)

/** Lazy file-row content used by the native Cloud/Storage folder dialog. */
internal object CloudStorageFileRowsFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"
    ),
    custom = { method, classDef ->
        method.name == "invoke" && FUNCTION4 in classDef.interfaces &&
            classDef.fields.count { it.type == "I" } == 1 &&
            classDef.fields.count { it.type == "Ljava/util/List;" } == 1 &&
            method.calls { reference ->
                reference.definingClass == "Ljava/util/ArrayList;" &&
                    reference.name == "get" && reference.returnType == "Ljava/lang/Object;"
            } &&
            method.calls(MethodReference::isNativeStorageTvButtonReference)
    }
)

/** TV Button implementation receiving the modifier prepared by the two Storage row hooks. */
internal object NativeStorageTvButtonFingerprint : Fingerprint(
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
