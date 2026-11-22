/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic.misc.lyrics

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.nyandex.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.util.logging.Logger

private val logger = Logger.getLogger("YandexMusicLyricsFallback")

internal const val LRCLIB_EXTENSION =
    "Lapp/nyandex/extension/yandexmusic/lyrics/LrcLibLyrics;"
internal const val REMEMBER_TRACK_METHOD = "nyandexRememberLyricsTrack"
internal const val LRCLIB_METHOD = "nyandexLrcLibLyrics"
internal const val LYRICS_ENTRY_METHOD = "nyandexLyricsEntry"
private const val COROUTINE_SUSPENDED = "COROUTINE_SUSPENDED"
internal const val PREFETCH_NEXT_METHOD = "nyandexPrefetchNextLyrics"
internal const val CACHE_ROW_METHOD = "nyandexLyricsCacheRow"
private const val CACHE_ROW_TO_STRING = "TrackCacheRow(trackId="
private const val CACHE_TYPE_LABEL = ", cacheType="

/** Signing key of the lyrics request. Only the lyrics repository contains it. */
private const val LYRICS_SIGN_KEY = "p93jhgh689SBReK6ghtw62"
private const val TRACK_TO_STRING = "Track{id='"
private const val LYRICS_HTTP_API = "Lcom/yandex/music/shared/lyrics/LyricsHttpApi;"
private const val FILES_API = "Lcom/yandex/music/shared/lyrics/FilesApi;"
private const val KOTLIN_UNIT = "Lkotlin/Unit;"
private const val PARCELABLE = "Landroid/os/Parcelable;"

private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"
private const val LIST = "Ljava/util/List;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"

val lyricsFallbackPatch = patch(
    name = "Тексты песен из LRCLIB",
    description = "Получает тексты песен из LRCLIB. API текстов Яндекса не используется.",
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    extendWith("extensions/lrclib-lyrics.mpe")

    execute {
        val trackType = hookTrackConstructor()
        hookLyricsRepository()
        hookNextQueueItem(trackType)
        hookTrackCacheRow()
    }
}

/**
 * Remember title, duration and artists of every track model. The lyrics repository only
 * receives the track id, and it is called from several screens, so the constructor is the one
 * place that sees every track.
 *
 * Track model (`b0x` in 2026.11.2, `oqv` in 2026.11.1): `a` id, `c` title, `e` duration in
 * milliseconds, `f` artists (their `toString()` returns the artist name).
 *
 * The same helper marks every track as having text and synced lyrics. The track's lyrics
 * availability (`jqv` in 2026.11.1: two booleans from the server's `lyricsInfo`) decides whether
 * the player offers lyrics at all and in which format; with both set the app asks for LRC, and
 * LRCLIB answers for tracks Yandex has no lyrics for too.
 */
private fun hookTrackConstructor(): String {
    val trackClass = classDefByStrings(TRACK_TO_STRING, StringComparisonType.EQUALS)
        .singleOrNull { it.interfaces.contains("Landroid/os/Parcelable;") }
        ?: throw PatchException("Track model was not found")
    val type = trackClass.type

    trackClass.requireField("a", STRING)
    trackClass.requireField("c", STRING)
    trackClass.requireField("e", "J")
    trackClass.requireField("f", LIST)

    // The lyrics availability: a Parcelable with exactly two boolean fields and a (ZZ) constructor.
    val availability = trackClass.fields.filter { field ->
        !AccessFlags.STATIC.isSet(field.accessFlags) && field.type.startsWith("L") &&
            !field.type.startsWith("Ljava/") && !field.type.startsWith("Landroid/")
    }.mapNotNull { field ->
        val classDef = runCatching { classDefBy(field.type) }.getOrNull() ?: return@mapNotNull null
        val instanceFields = classDef.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
        val isAvailability = classDef.interfaces.contains(PARCELABLE) &&
            instanceFields.size == 2 && instanceFields.all { it.type == "Z" } &&
            classDef.methods.any { it.name == "<init>" && it.parameterTypes.map(Any::toString) == listOf("Z", "Z") }
        field.takeIf { isAvailability }
    }.singleOrNull() ?: throw PatchException("Track lyrics availability field was not found")

    val mutableTrack = mutableClassDefBy(type)
    val constructor = mutableTrack.methods.singleOrNull { method ->
        method.name == "<init>" &&
            method.parameterTypes.size > 5 &&
            method.parameterTypes[0].toString() == STRING &&
            method.parameterTypes[2].toString() == STRING &&
            method.parameterTypes[4].toString() == "J" &&
            method.parameterTypes[5].toString() == LIST &&
            // The primary constructor; the Kotlin default-arguments overload delegates to it.
            method.instructionsList().any { instruction ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                instruction.opcode == Opcode.IPUT_OBJECT &&
                    field?.definingClass == type && field.name == "a"
            }
    } ?: throw PatchException("Track model constructor was not found")

    val remember = ImmutableMethod(
        type,
        REMEMBER_TRACK_METHOD,
        listOf(ImmutableMethodParameter(type, null, null)),
        "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(6),
    ).toMutable()
    remember.addInstructions(
        0,
        """
            iget-object v0, p0, $type->a:$STRING
            iget-object v1, p0, $type->c:$STRING
            iget-wide v2, p0, $type->e:J
            iget-object v4, p0, $type->f:$LIST
            invoke-static/range {v0 .. v4}, $LRCLIB_EXTENSION->rememberTrack($STRING${STRING}J$LIST)V
            new-instance v0, ${availability.type}
            const/4 v1, 0x1
            invoke-direct {v0, v1, v1}, ${availability.type}-><init>(ZZ)V
            iput-object v0, p0, $type->${availability.name}:${availability.type}
            return-void
        """,
    )
    mutableTrack.methods.add(remember)

    val returns = constructor.instructionsList().mapIndexedNotNull { index, instruction ->
        index.takeIf { instruction.opcode == Opcode.RETURN_VOID }
    }
    if (returns.isEmpty()) throw PatchException("Track model constructor has no return")
    if (constructor.writesRegister(constructor.thisRegister())) {
        throw PatchException("Track model constructor reuses the this register")
    }

    returns.asReversed().forEach { index ->
        constructor.addInstructions(
            index,
            "invoke-static/range {p0 .. p0}, $type->$REMEMBER_TRACK_METHOD($type)V",
        )
    }
    logger.info("Hooked track model $type (${returns.size} return(s), lyrics availability ${availability.name})")
    return type
}

/**
 * Prefetch the lyrics of the next queue item. The player's queue state (`btt` in 2026.11.2) is
 * an interface; a single static helper (`ns8.G(btt)` in 2026.11.2) returns its next item, a
 * playable interface (`lpn`) whose no-argument getter returns the track model or null. The
 * helper is used by the playback core (next-track preloading) as well as the player screen, so
 * it runs whenever the queue moves, in the background too.
 *
 * The helper is the only static method that takes a queue-state interface and returns a
 * playable interface, so it is found by types alone. Its result is handed to a new static
 * method on the track model that extracts the track id for the extension.
 */
private fun hookNextQueueItem(trackType: String) {
    // Playable interfaces: interfaces with exactly one no-argument getter returning the track model.
    val playableGetters = mutableMapOf<String, String>()
    val interfaces = mutableMapOf<String, ClassDef>()
    classDefForEach { classDef ->
        if (!AccessFlags.INTERFACE.isSet(classDef.accessFlags)) return@classDefForEach
        interfaces[classDef.type] = classDef
        val getters = classDef.methods.filter { it.parameterTypes.isEmpty() && it.returnType == trackType }
        if (getters.size == 1) playableGetters[classDef.type] = getters.single().name
    }
    if (playableGetters.isEmpty()) throw PatchException("No playable interface returns $trackType")

    // Static (QueueState) -> Playable, where QueueState is an interface with a getter for the current playable.
    val candidates = mutableListOf<Pair<ClassDef, Method>>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            if (!AccessFlags.STATIC.isSet(method.accessFlags)) return@forEach
            if (method.parameterTypes.size != 1 || method.returnType !in playableGetters) return@forEach
            val queueState = interfaces[method.parameterTypes[0].toString()] ?: return@forEach
            if (queueState.methods.any { it.parameterTypes.isEmpty() && it.returnType == method.returnType }) {
                candidates += classDef to method
            }
        }
    }
    val (ownerClass, nextMethod) = candidates.singleOrNull()
        ?: throw PatchException("Expected one next-queue-item helper, found ${candidates.size}: " +
            candidates.joinToString { "${it.first.type}.${it.second.name}" })
    val playableType = nextMethod.returnType
    val getter = playableGetters.getValue(playableType)

    val mutableTrack = mutableClassDefBy(trackType)
    val helper = ImmutableMethod(
        trackType,
        PREFETCH_NEXT_METHOD,
        listOf(ImmutableMethodParameter(playableType, null, null)),
        "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(2),
    ).toMutable()
    helper.addInstructions(
        0,
        """
            :try_start
            if-eqz p0, :done
            invoke-interface {p0}, $playableType->$getter()$trackType
            move-result-object v0
            if-eqz v0, :done
            iget-object v0, v0, $trackType->a:$STRING
            invoke-static {v0}, $LRCLIB_EXTENSION->prefetch($STRING)V
            :try_end
            .catch Ljava/lang/Throwable; {:try_start .. :try_end} :done
            :done
            return-void
        """,
    )
    mutableTrack.methods.add(helper)

    val method = mutableClassDefBy(ownerClass.type).methods.single {
        it.name == nextMethod.name &&
            it.parameterTypes.map(Any::toString) == nextMethod.parameterTypes.map(Any::toString) &&
            it.returnType == nextMethod.returnType
    }
    val instructions = method.instructionsList()
    if (instructions.any { it.opcode.name.startsWith("IF_") || it.opcode.name.startsWith("GOTO") }) {
        throw PatchException("Next-queue-item helper ${ownerClass.type}.${method.name} has branches")
    }
    val returnIndex = instructions.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
    if (returnIndex < 0 || instructions.count { it.opcode == Opcode.RETURN_OBJECT } != 1) {
        throw PatchException("Next-queue-item helper does not have exactly one return")
    }
    val register = (instructions[returnIndex] as OneRegisterInstruction).registerA
    method.addInstructions(
        returnIndex,
        "invoke-static/range {v$register .. v$register}, $trackType->$PREFETCH_NEXT_METHOD($playableType)V",
    )
    logger.info(
        "Next-queue-item helper ${ownerClass.type}.${method.name} prefetches lyrics " +
            "(playable $playableType.$getter)",
    )
}

/**
 * Lyrics come only from LRCLIB. The lyrics repository (`h8j` in 2026.11.2, `yli` in 2026.11.1)
 * downloads lyrics in a suspend method `a(trackId, format, durationMs, continuation)`: it asks
 * the Yandex API for a signed download link, downloads the file and parses it with
 * `parser(trackInfo, info, format, content)`. The method now returns right away with the result
 * of a new static helper, so the Yandex lyrics API is never called. The helper builds the lyrics
 * from LRCLIB content with the app's own classes and parser, or returns the app's HTTP error
 * result (404) when LRCLIB has no lyrics or cannot be reached.
 *
 * The repository's lyric view report (`POST lyric-views`) is turned into a no-op that succeeds.
 */
private fun hookLyricsRepository() {
    val repository = classDefByStrings(LYRICS_SIGN_KEY).singleOrNull { candidate ->
        candidate.methods.any { it.references(LYRICS_HTTP_API, "a") && it.references(FILES_API, "a") }
    } ?: throw PatchException("Lyrics repository was not found")
    val mutableRepository = mutableClassDefBy(repository.type)

    val method = mutableRepository.methods.singleOrNull { candidate ->
        candidate.returnType == OBJECT &&
            candidate.parameterTypes.size == 4 &&
            candidate.parameterTypes[0].toString() == STRING &&
            candidate.parameterTypes[2].toString() == "Ljava/lang/Long;" &&
            candidate.references(LYRICS_HTTP_API, "a") &&
            candidate.references(FILES_API, "a")
    } ?: throw PatchException("Lyrics download method was not found")
    if (AccessFlags.STATIC.isSet(method.accessFlags)) throw PatchException("Lyrics download method is static")
    val instructions = method.instructionsList()
    val methodReferences = instructions.mapNotNull { it.methodReference() }.distinct()

    // parser(trackInfo, downloadInfo, format, content) -> lyrics, called once at the end.
    val parser = methodReferences.singleOrNull { reference ->
        reference.parameterTypes.size == 4 &&
            reference.parameterTypes[3].toString() == STRING &&
            reference.parameterTypes.take(3).all { it.toString().startsWith("L") } &&
            reference.returnType.startsWith("L") &&
            reference.returnType != OBJECT
    } ?: throw PatchException("Lyrics parser call was not found")
    val trackInfoType = parser.parameterTypes[0].toString()
    val infoType = parser.parameterTypes[1].toString()
    val formatType = parser.parameterTypes[2].toString()

    if (method.parameterTypes[1].toString() != formatType) {
        throw PatchException("Lyrics format type mismatch: ${method.parameterTypes[1]} != $formatType")
    }

    // The success wrapper is the only class built with a single Object argument.
    val successType = methodReferences
        .filter { it.name == "<init>" && it.parameterTypes.map(Any::toString) == listOf(OBJECT) }
        .map { it.definingClass }
        .distinct()
        .singleOrNull()
        ?: throw PatchException("Lyrics success result type was not found")

    // The HTTP error result: (code, message, url).
    val httpErrorType = methodReferences
        .filter { it.name == "<init>" && it.parameterTypes.map(Any::toString) == listOf("I", STRING, STRING) }
        .map { it.definingClass }
        .distinct()
        .singleOrNull()
        ?: throw PatchException("Lyrics HTTP error result type was not found")

    val infoClass = mutableClassDefBy(infoType)
    val infoConstructor = infoClass.methods.singleOrNull { it.name == "<init>" }
        ?: throw PatchException("Download info constructor was not found")
    val infoParameters = infoConstructor.parameterTypes.map(Any::toString)
    if (infoParameters.size != 5 ||
        infoParameters[0] != "I" || infoParameters[1] != STRING ||
        infoParameters[2] != STRING || infoParameters[3] != ARRAY_LIST
    ) {
        throw PatchException("Unexpected download info constructor: $infoParameters")
    }
    val majorType = infoParameters[4]
    mutableClassDefBy(majorType).methods.singleOrNull { candidate ->
        candidate.name == "<init>" &&
            candidate.parameterTypes.map(Any::toString) == listOf("I", STRING, STRING)
    } ?: throw PatchException("Lyrics major constructor (I, String, String) was not found in $majorType")

    mutableClassDefBy(trackInfoType).methods.singleOrNull { candidate ->
        candidate.name == "<init>" &&
            candidate.parameterTypes.map(Any::toString) == listOf(STRING, STRING, STRING)
    } ?: throw PatchException("Track info constructor (String, String, String) was not found")

    mutableClassDefBy(formatType).methods.singleOrNull { candidate ->
        candidate.name == "valueOf" && candidate.parameterTypes.map(Any::toString) == listOf(STRING)
    } ?: throw PatchException("$formatType.valueOf(String) was not found")

    // nyandexLrcLibLyrics(trackId, format): LRCLIB lyrics parsed by the app, or a 404 error result.
    // 17 registers, p0 = v15 and p1 = v16, so the extension call uses the range form.
    val repositoryType = repository.type
    val helper = ImmutableMethod(
        repositoryType,
        LRCLIB_METHOD,
        listOf(
            ImmutableMethodParameter(STRING, null, null),
            ImmutableMethodParameter(formatType, null, null),
        ),
        OBJECT,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(17),
    ).toMutable()
    helper.addInstructions(
        0,
        """
            :try_start
            invoke-static/range {p0 .. p1}, $LRCLIB_EXTENSION->lyrics($STRING$OBJECT)[$STRING
            move-result-object v0
            if-eqz v0, :none
            const/4 v1, 0x0
            aget-object v1, v0, v1
            invoke-static {v1}, $formatType->valueOf($STRING)$formatType
            move-result-object v1
            const/4 v2, 0x1
            aget-object v2, v0, v2
            new-instance v3, $trackInfoType
            const/4 v4, 0x0
            move-object/from16 v12, p0
            invoke-direct {v3, v12, v4, v4}, $trackInfoType-><init>($STRING$STRING$STRING)V
            const-string v4, "LRCLIB"
            new-instance v10, $majorType
            const/4 v6, 0x0
            invoke-direct {v10, v6, v4, v4}, $majorType-><init>(I$STRING$STRING)V
            new-instance v9, $ARRAY_LIST
            invoke-direct {v9}, $ARRAY_LIST-><init>()V
            const-string v7, "lrclib"
            const-string v8, "lrclib"
            new-instance v5, $infoType
            invoke-direct/range {v5 .. v10}, $infoType-><init>(I$STRING$STRING$ARRAY_LIST$majorType)V
            invoke-static {v3, v5, v1, v2}, ${parser.definingClass}->${parser.name}($trackInfoType$infoType$formatType$STRING)${parser.returnType}
            move-result-object v11
            new-instance v12, $successType
            invoke-direct {v12, v11}, $successType-><init>($OBJECT)V
            return-object v12
            :try_end
            .catch Ljava/lang/Throwable; {:try_start .. :try_end} :failed
            :failed
            :none
            new-instance v0, $httpErrorType
            const/16 v1, 0x194
            const-string v2, "LRCLIB"
            invoke-direct {v0, v1, v2, v2}, $httpErrorType-><init>(I$STRING$STRING)V
            return-object v0
        """,
    )
    mutableRepository.methods.add(helper)

    // The download method is a suspend function: (trackId, format, durationMs, continuation).
    // Callers on the main thread (the "Show lyrics" sheet) must not block, so the entry helper
    // either answers right away or lets the extension load in the background, returns the
    // COROUTINE_SUSPENDED marker and resumes the continuation later on the main thread.
    val suspended = instructions.firstNotNullOfOrNull { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { field ->
            instruction.opcode == Opcode.SGET_OBJECT &&
                runCatching { classDefBy(field.type).hasStringConstant(COROUTINE_SUSPENDED) }.getOrDefault(false)
        }
    } ?: throw PatchException("COROUTINE_SUSPENDED marker was not found in the lyrics download method")

    val entry = ImmutableMethod(
        repositoryType,
        LYRICS_ENTRY_METHOD,
        listOf(
            ImmutableMethodParameter(STRING, null, null),
            ImmutableMethodParameter(formatType, null, null),
            ImmutableMethodParameter(OBJECT, null, null),
        ),
        OBJECT,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(5),
    ).toMutable()
    entry.addInstructions(
        0,
        """
            const-class v0, $repositoryType
            invoke-static {p0, p1, p2, v0}, $LRCLIB_EXTENSION->lyricsAsync(${STRING}${OBJECT}${OBJECT}Ljava/lang/Class;)Z
            move-result v1
            if-eqz v1, :now
            sget-object v0, ${suspended.definingClass}->${suspended.name}:${suspended.type}
            return-object v0
            :now
            invoke-static {p0, p1}, $repositoryType->$LRCLIB_METHOD($STRING$formatType)$OBJECT
            move-result-object v0
            return-object v0
        """,
    )
    mutableRepository.methods.add(entry)

    // The download method returns the entry helper's result before any of its own code runs.
    // No branches here: labels inside snippets for existing methods break in Morphe Manager.
    val locals = method.implementation!!.registerCount - 5 // this, trackId, format, duration, continuation
    if (locals < 3) throw PatchException("Lyrics download method has too few registers ($locals)")
    method.addInstructions(
        0,
        """
            move-object/from16 v0, p1
            move-object/from16 v1, p2
            move-object/from16 v2, p4
            invoke-static {v0, v1, v2}, $repositoryType->$LYRICS_ENTRY_METHOD($STRING$formatType$OBJECT)$OBJECT
            move-result-object v0
            return-object v0
        """,
    )

    // Lyric view report: succeed with Unit without sending anything. Its request body
    // (LyricsViewsBodyRequestDto) is the only single-argument API call that does not take a String;
    // 2026.11.2 obfuscates the body class name.
    val views = mutableRepository.methods.singleOrNull { candidate ->
        candidate.returnType == OBJECT && candidate.instructionsList().any { instruction ->
            val reference = instruction.methodReference()
            reference?.definingClass == LYRICS_HTTP_API &&
                reference.parameterTypes.size == 1 && reference.parameterTypes[0].toString() != STRING
        }
    } ?: throw PatchException("Lyric views report method was not found")
    val unit = views.instructionsList().firstNotNullOfOrNull { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
            ?.takeIf { instruction.opcode == Opcode.SGET_OBJECT && it.type == KOTLIN_UNIT }
    } ?: throw PatchException("Unit instance was not found in the lyric views report")
    if (views.implementation!!.registerCount - views.parameterTypes.size - 1 < 2) {
        throw PatchException("Lyric views report has too few registers")
    }
    views.addInstructions(
        0,
        """
            sget-object v0, ${unit.definingClass}->${unit.name}:$KOTLIN_UNIT
            new-instance v1, $successType
            invoke-direct {v1, v0}, $successType-><init>($OBJECT)V
            return-object v1
        """,
    )

    logger.info(
        "Lyrics repository $repositoryType: ${method.name} uses LRCLIB only, ${views.name} report disabled " +
            "(parser ${parser.definingClass}.${parser.name}, info $infoType, format $formatType, " +
            "success $successType, http error $httpErrorType)",
    )
}

/**
 * Load the lyrics of downloaded tracks. The app's track cache row (`i1x` in 2026.11.2,
 * `TrackCacheRow` in its toString) is built when a track is cached or downloaded and whenever the
 * cache database is read. Its constructor hands the track id and the cache type enum
 * (TemporaryCache, AutoCache, SmartCache, PermanentStrong, PermanentWeak) to the extension.
 *
 * Both fields are taken from toString: the field read right after the "TrackCacheRow(trackId="
 * and ", cacheType=" labels. The track id is a small class with one String field.
 */
private fun hookTrackCacheRow() {
    val row = classDefByStrings(CACHE_ROW_TO_STRING).singleOrNull { candidate ->
        candidate.methods.any { it.name == "toString" && it.hasStringConstant(CACHE_ROW_TO_STRING) }
    } ?: throw PatchException("Track cache row was not found")
    val toString = row.methods.single { it.name == "toString" && it.parameterTypes.isEmpty() }
    val idField = toString.fieldAfterString(CACHE_ROW_TO_STRING, row.type)
        ?: throw PatchException("Track cache row id field was not found")
    val typeField = toString.fieldAfterString(CACHE_TYPE_LABEL, row.type)
        ?: throw PatchException("Track cache row type field was not found")

    val idClass = classDefBy(idField.type)
    val idString = idClass.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == STRING }
        .singleOrNull() ?: throw PatchException("Track id class ${idField.type} has no single String field")
    val typeClass = classDefBy(typeField.type)
    if (typeClass.fields.none { it.name == "PermanentStrong" } && !typeClass.hasStringConstant("PermanentStrong")) {
        throw PatchException("Track cache type ${typeField.type} is not the cache type enum")
    }

    val mutableRow = mutableClassDefBy(row.type)
    val helper = ImmutableMethod(
        row.type,
        CACHE_ROW_METHOD,
        listOf(ImmutableMethodParameter(row.type, null, null)),
        "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(3),
    ).toMutable()
    helper.addInstructions(
        0,
        """
            :try_start
            iget-object v0, p0, ${row.type}->${idField.name}:${idField.type}
            if-eqz v0, :done
            iget-object v0, v0, ${idField.type}->${idString.name}:$STRING
            iget-object v1, p0, ${row.type}->${typeField.name}:${typeField.type}
            invoke-static {v0, v1}, $LRCLIB_EXTENSION->cacheRow($STRING$OBJECT)V
            :try_end
            .catch Ljava/lang/Throwable; {:try_start .. :try_end} :done
            :done
            return-void
        """,
    )
    mutableRow.methods.add(helper)

    var hooked = 0
    mutableRow.methods.filter { it.name == "<init>" && it != helper }.forEach { constructor ->
        val instructions = constructor.instructionsList()
        // Only the constructor that sets the fields; a delegating one would report the row twice.
        val setsId = instructions.any { instruction ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.IPUT_OBJECT && field?.definingClass == row.type && field.name == idField.name
        }
        if (!setsId) return@forEach
        if (constructor.writesRegister(constructor.thisRegister())) {
            throw PatchException("Track cache row constructor reuses the this register")
        }
        instructions.mapIndexedNotNull { index, instruction -> index.takeIf { instruction.opcode == Opcode.RETURN_VOID } }
            .asReversed()
            .forEach { index ->
                constructor.addInstructions(index, "invoke-static/range {p0 .. p0}, ${row.type}->$CACHE_ROW_METHOD(${row.type})V")
            }
        hooked++
    }
    if (hooked != 1) throw PatchException("Expected one track cache row constructor, hooked $hooked")
    logger.info("Track cache row ${row.type}: id ${idField.name}.${idString.name}, type ${typeField.name}")
}

private fun ClassDef.hasStringConstant(value: String): Boolean = methods.any { it.hasStringConstant(value) }


private fun Method.hasStringConstant(value: String): Boolean =
    implementation?.instructions?.any { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == value
    } == true

/** The first instance field of [owner] read after the string constant [label]. */
private fun Method.fieldAfterString(label: String, owner: String): FieldReference? {
    val instructions = implementation?.instructions?.toList() ?: return null
    val start = instructions.indexOfFirst { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == label
    }
    if (start < 0) return null
    return instructions.drop(start + 1).firstNotNullOfOrNull { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
            ?.takeIf { instruction.opcode == Opcode.IGET_OBJECT && it.definingClass == owner }
    }
}

private fun ClassDef.requireField(name: String, type: String) {
    if (fields.none { it.name == name && it.type == type }) {
        throw PatchException("${this.type} has no field $name:$type")
    }
}

private fun Method.references(definingClass: String, name: String): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = instruction.methodReference()
        reference?.definingClass == definingClass && reference.name == name
    } == true

private fun Instruction.methodReference(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun MutableMethod.instructionsList(): List<Instruction> =
    implementation?.instructions?.toList() ?: emptyList()

private fun MutableMethod.thisRegister(): Int {
    val implementation = implementation ?: throw PatchException("$name has no implementation")
    val parameterRegisters = parameterTypes.sumOf { type ->
        val t = type.toString()
        if (t == "J" || t == "D") 2 else 1
    }
    return implementation.registerCount - parameterRegisters - 1
}

private fun MutableMethod.writesRegister(register: Int): Boolean =
    instructionsList().any { instruction ->
        instruction.opcode.setsRegister() &&
            when (instruction) {
                is OneRegisterInstruction -> instruction.registerA == register
                else -> false
            }
    }
