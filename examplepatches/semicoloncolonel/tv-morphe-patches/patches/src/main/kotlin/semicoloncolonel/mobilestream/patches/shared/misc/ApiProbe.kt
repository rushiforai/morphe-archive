package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.patch.BytecodePatchContext

// ─────────────────────────────────────────────────────────────────────────────
// Checks that an app still has the library methods an extension class calls.
//
// An extension class that calls a library method by name (OkHttp, for
// example) is compiled against the library's public API. If an app's build
// renames or strips one of those methods, the patch still applies, and the
// call fails only at run time. A patch checks the methods first and leaves
// the hook out, or fails, instead.
//
// Each entry is "Lpkg/Class;->name(Params)Return". The method may be
// declared on the class, a superclass, or an interface it implements.
// ─────────────────────────────────────────────────────────────────────────────

internal fun BytecodePatchContext.missingMethods(methods: List<String>): List<String> =
    methods.filterNot { hasMethod(it) }

private fun BytecodePatchContext.hasMethod(reference: String): Boolean {
    val type = reference.substringBefore("->")
    val rest = reference.substringAfter("->")
    val name = rest.substringBefore('(')
    val parameters = rest.substringAfter('(').substringBefore(')')
    val returnType = rest.substringAfter(')')
    val seen = mutableSetOf<String>()
    val queue = ArrayDeque(listOf(type))
    while (queue.isNotEmpty()) {
        val current = queue.removeFirst()
        if (!seen.add(current)) continue
        val classDef = classDefByOrNull(current) ?: continue
        if (classDef.methods.any {
                it.name == name && it.returnType == returnType &&
                    it.parameterTypes.joinToString("") { p -> p.toString() } == parameters
            }
        ) {
            return true
        }
        classDef.superclass?.let(queue::add)
        queue.addAll(classDef.interfaces)
    }
    return false
}

/** The OkHttp calls of TrackerBlocker's interceptor. */
internal val OKHTTP_INTERCEPTOR_API = listOf(
    "Lokhttp3/OkHttpClient\$Builder;->interceptors()Ljava/util/List;",
    "Lokhttp3/Interceptor\$Chain;->request()Lokhttp3/Request;",
    "Lokhttp3/Interceptor\$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;",
    "Lokhttp3/Request;->url()Lokhttp3/HttpUrl;",
    "Lokhttp3/HttpUrl;->host()Ljava/lang/String;",
)

/** The OkHttp and okio calls of an interceptor that rewrites response bodies. */
internal val OKHTTP_BODY_REWRITE_API = OKHTTP_INTERCEPTOR_API + listOf(
    "Lokhttp3/Request;->body()Lokhttp3/RequestBody;",
    "Lokhttp3/RequestBody;->contentLength()J",
    "Lokhttp3/RequestBody;->writeTo(Lokio/BufferedSink;)V",
    "Lokhttp3/Response;->body()Lokhttp3/ResponseBody;",
    "Lokhttp3/Response;->isSuccessful()Z",
    "Lokhttp3/Response;->newBuilder()Lokhttp3/Response\$Builder;",
    "Lokhttp3/Response\$Builder;->body(Lokhttp3/ResponseBody;)Lokhttp3/Response\$Builder;",
    "Lokhttp3/Response\$Builder;->build()Lokhttp3/Response;",
    "Lokhttp3/ResponseBody;->contentType()Lokhttp3/MediaType;",
    "Lokhttp3/ResponseBody;->string()Ljava/lang/String;",
    "Lokhttp3/ResponseBody;->create(Ljava/lang/String;Lokhttp3/MediaType;)Lokhttp3/ResponseBody;",
    "Lokio/Buffer;-><init>()V",
    "Lokio/Buffer;->readUtf8()Ljava/lang/String;",
)

/**
 * The OkHttp calls of an interceptor that rewrites JSON responses from one
 * API: the body-rewrite calls, plus matching the URL path, skipping
 * still-compressed bodies, and dropping the stale Content-Length.
 */
internal val OKHTTP_JSON_FILTER_API = OKHTTP_BODY_REWRITE_API + listOf(
    "Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;",
    "Lokhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;",
    "Lokhttp3/Response\$Builder;->removeHeader(Ljava/lang/String;)Lokhttp3/Response\$Builder;",
)
