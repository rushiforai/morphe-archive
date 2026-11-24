package software.santodan.extension.nuviomerged

import java.lang.reflect.Method
import java.lang.reflect.InvocationTargetException
import java.util.concurrent.ConcurrentHashMap
import kotlin.coroutines.intrinsics.COROUTINE_SUSPENDED
import kotlin.coroutines.resume
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import software.santodan.nuvio.NuvioNative

/** Native 1.1.1 card creation/resolution and immutable Home state publication, without provider refresh. */
object NuvioLocalHomeProjection {
    data class Settings(val home: Any, val profile: String, val dismissed: Set<String>, val unaired: Boolean, val sort: Any)
    data class Result(val item: Any?, val conclusive: Boolean)
    private val methods = ConcurrentHashMap<Pair<ClassLoader, String>, Method>()
    private fun type(c: Class<*>): String = when (c) {
        java.lang.Void.TYPE -> "V"; java.lang.Boolean.TYPE -> "Z"; java.lang.Integer.TYPE -> "I"
        java.lang.Long.TYPE -> "J"; java.lang.Float.TYPE -> "F"; java.lang.Double.TYPE -> "D"
        else -> if (c.isArray) c.name.replace('.', '/') else "L${c.name.replace('.', '/')};"
    }
    private fun method(loader: ClassLoader, reference: String): Method = methods.getOrPut(loader to reference) {
        val owner = reference.substring(1, reference.indexOf(';')).replace('/', '.')
        loader.loadClass(owner).declaredMethods.single { m ->
            "L${owner.replace('.', '/')};->${m.name}(${m.parameterTypes.joinToString("") { type(it) }})${type(m.returnType)}" == reference
        }.apply { isAccessible = true }
    }
    fun field(owner: Any, reference: String): Any? = owner.javaClass.classLoader
        .loadClass(reference.substring(1, reference.indexOf(';')).replace('/', '.'))
        .getDeclaredField(reference.substringAfter("->").substringBefore(':')).apply { isAccessible = true }.get(owner)
    @Suppress("UNCHECKED_CAST")
    fun settings(cycle: Any, profile: String): Settings {
        val snapshot = field(cycle, NuvioNative.REF_LOCAL_HOME_SNAPSHOT)!!
        return Settings(field(cycle, NuvioNative.REF_HOME_TRANSITION_OWNER)!!, profile,
            (field(snapshot, NuvioNative.REF_LOCAL_HOME_DISMISSED) as Set<String>).toSet(),
            field(snapshot, NuvioNative.REF_LOCAL_HOME_UNAIRED) as Boolean,
            field(snapshot, NuvioNative.REF_LOCAL_HOME_SORT)!!)
    }
    suspend fun resolve(settings: Settings, record: Any, completed: Boolean): Result {
        if (!completed) return Result(null, true) // Position-only updates never run metadata resolution.
        val loader = settings.home.javaClass.classLoader
        val debug = loader.loadClass(NuvioNative.REF_LOCAL_HOME_DEBUG_INIT.substring(1,
            NuvioNative.REF_LOCAL_HOME_DEBUG_INIT.indexOf(';')).replace('/', '.')).getDeclaredConstructor().newInstance()
        val result = suspendCancellableCoroutine<Any?> { completion ->
            try {
                val value = method(loader, NuvioNative.REF_LOCAL_HOME_RESOLVE).invoke(null,
                    settings.home, record, settings.unaired, debug, NuvioSourceContinuation(completion))
                if (value !== COROUTINE_SUSPENDED) completion.resume(value)
            } catch (error: InvocationTargetException) { completion.resumeWith(kotlin.Result.failure(error.cause ?: error)) }
        }
        if (result != null) return Result(result, true)
        // Native null also means unavailable metadata. Only a native validated finished-show result may remove the card.
        val id = record.javaClass.getMethod("getContentId").invoke(record).toString()
        val contentType = record.javaClass.getMethod("getContentType").invoke(record).toString()
        val meta = field(settings.home, NuvioNative.REF_LOCAL_HOME_META) as Map<*, *>
        val cached = synchronized(meta) { meta["$contentType:$id"] ?: meta["series:$id"] ?: meta["tv:$id"] }
        val finished = field(settings.home, NuvioNative.REF_LOCAL_HOME_FINISHED)!!
        val ids = (field(finished, NuvioNative.REF_LOCAL_HOME_FINISHED_FLOW) as StateFlow<*>).value as Set<*>
        return Result(null, cached != null && id in ids)
    }
    private fun partial(home: Any, record: Any, current: List<Any>, same: (Any) -> Boolean): Any {
        val loader = home.javaClass.classLoader
        val constructor = loader.loadClass(NuvioNative.HOME_PROGRESS_ITEM_NAME).declaredConstructors.single { c ->
            "${NuvioNative.HOME_PROGRESS_ITEM_TYPE}-><init>(${c.parameterTypes.joinToString("") { type(it) }})V" == NuvioNative.REF_LOCAL_HOME_PROGRESS_INIT
        }.apply { isAccessible = true }
        val existing = current.firstOrNull {
            if (it.javaClass.name != NuvioNative.HOME_PROGRESS_ITEM_NAME || !same(it)) false
            else {
                val previous = field(it, NuvioNative.REF_HOME_PROGRESS_RECORD)!!
                listOf("getSeason", "getEpisode").all { name ->
                    previous.javaClass.getMethod(name).invoke(previous) == record.javaClass.getMethod(name).invoke(record)
                }
            }
        }
        val args = arrayOf<Any?>(record, null, null, null, emptyList<Any>(), null, null, false, null, null, null)
        if (existing != null) for (i in 1..10)
            args[i] = existing.javaClass.getDeclaredField(('a'.code + i).toChar().toString()).apply { isAccessible = true }.get(existing)
        return constructor.newInstance(*args)
    }
    @Suppress("UNCHECKED_CAST")
    suspend fun publish(settings: Settings, record: Any, completed: Boolean, result: Result,
                        valid: () -> Boolean, same: (Any) -> Boolean,
                        dispatcher: CoroutineDispatcher = Dispatchers.Main.immediate,
                        published: (Any?) -> Unit = {}) = withContext(dispatcher) {
        if (!valid() || !result.conclusive) return@withContext
        val home = settings.home
        val loader = home.javaClass.classLoader
        val stateFlow = field(home, NuvioNative.REF_HOME_STATE_FLOW) as MutableStateFlow<Any>
        val id = record.javaClass.getMethod("getContentId").invoke(record).toString()
        repeat(16) {
            if (!valid()) return@withContext
            val old = stateFlow.value
            val current = (field(old, NuvioNative.REF_HOME_VISIBLE_ITEMS) as List<Any>) + (field(old, NuvioNative.REF_HOME_UPCOMING_ITEMS) as List<Any>)
            val replacement = if (!completed) partial(home, record, current, same) else result.item
            val rows = current.filterNot(same).toMutableList()
            if (replacement != null && id.trim() !in settings.dismissed) rows.add(replacement)
            val sorted = method(loader, NuvioNative.REF_LOCAL_HOME_SORT_ITEMS).invoke(null, rows, settings.sort)
            val split = method(loader, NuvioNative.REF_HOME_SPLIT).invoke(null, sorted, settings.sort) as Pair<*, *>
            val copy = method(loader, NuvioNative.REF_LOCAL_HOME_STATE_COPY)
            val args = Array<Any?>(copy.parameterCount) { index -> when (copy.parameterTypes[index]) {
                java.lang.Boolean.TYPE -> false; java.lang.Integer.TYPE -> 0; java.lang.Long.TYPE -> 0L
                java.lang.Float.TYPE -> 0f; else -> null
            } }
            args[0] = old; args[2] = split.first; args[3] = split.second
            args[args.size - 2] = -7; args[args.size - 1] = -1
            val next = copy.invoke(null, *args)
            if (stateFlow.compareAndSet(old, next)) { published(replacement); return@withContext }
        }
        error("Local Home update could not publish after concurrent state changes")
    }
}
