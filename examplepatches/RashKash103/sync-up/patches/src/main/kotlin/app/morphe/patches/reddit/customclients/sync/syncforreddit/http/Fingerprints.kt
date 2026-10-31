package app.morphe.patches.reddit.customclients.sync.syncforreddit.http

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Sync bundles a modified Volley whose BasicNetwork issues okhttp3 calls directly, so every
 * Volley request goes through the client this method obtains. Volley is not obfuscated, which
 * makes it a more stable anchor than the client builders in OkHttpHelper, several of which are
 * near identical and only tell apart by register allocation.
 */
internal val volleyPerformRequestFingerprint = Fingerprint(
    definingClass = "Lcom/android/volley/toolbox/BasicNetwork;",
    name = "performRequest",
)

/**
 * Glide does not share Sync's Volley client. Its loader builds a plain OkHttpClient of its own
 * and keeps it in a static field, so image loads are only visible if that one is hooked too.
 * Matched on the source file, since the class itself is obfuscated.
 */
internal val glideClientFactoryFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    returnType = "Lokhttp3/Call${'$'}Factory;",
    parameters = listOf(),
    custom = { _, classDef -> classDef.sourceFile == "OkHttpUrlLoader.java" }
)

/**
 * Sync hands Glide a client of its own here rather than letting the Glide OkHttp integration
 * build one, so this is the client every image actually loads through. The class keeps its
 * name because Glide's generated code refers to it, which makes it a dependable anchor.
 */
internal val glideRegisterComponentsFingerprint = Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/YourAppGlideModule;",
    returnType = "V",
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it.getReference<MethodReference>()?.returnType == "Lokhttp3/OkHttpClient;"
        } == true
    }
)

internal const val OKHTTP_DATA_SOURCE_FACTORY =
    "Lcom/google/android/exoplayer2/ext/okhttp/OkHttpDataSource\$Factory;"

internal const val DEFAULT_DATA_SOURCE_FACTORY =
    "Lcom/google/android/exoplayer2/upstream/DefaultDataSource\$Factory;"

/**
 * Builds the data sources the video player reads through, and is the only place its client is
 * in reach. Videos are the one kind of media that reaches neither Volley nor Glide.
 */
internal val exoPlayerDataSourceFingerprint = Fingerprint(
    name = "<init>",
    parameters = listOf(),
    returnType = "V",
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            val reference = it.getReference<MethodReference>()
            reference?.definingClass == OKHTTP_DATA_SOURCE_FACTORY && reference.name == "<init>"
        } == true
    },
)

/** Sync's holder for the several clients it uses, each reached through a getter of its own. */
internal const val OKHTTP_HELPER_CLASS = "La8/a;"

internal val OKHTTP_HELPER_CLIENT_GETTERS = listOf("a", "b", "c", "d", "e")
