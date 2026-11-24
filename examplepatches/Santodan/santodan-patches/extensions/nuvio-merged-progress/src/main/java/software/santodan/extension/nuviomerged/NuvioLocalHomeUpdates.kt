package software.santodan.extension.nuviomerged

import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*

/** One conflated local playback projection; position writes cannot restart the same completed-episode lookup. */
class NuvioLocalHomeUpdates<T, R>(
    scope: CoroutineScope,
    private val valid: (String) -> Boolean,
    private val resolve: suspend (T) -> R,
    private val publish: suspend (T, R) -> Unit,
    private val failure: (Throwable) -> Unit,
    private val timeoutMs: Long = 10_000,
) {
    private data class Request<T>(val profile: String, val token: String, val value: T)
    private val requests = MutableStateFlow<Request<T>?>(null)
    @Volatile private var failedAt = Long.MIN_VALUE
    @Volatile private var failedToken: String? = null
    private val job = scope.launch {
        requests.collectLatest { request ->
            if (request == null) return@collectLatest
            try {
                if (!valid(request.profile)) return@collectLatest
                val result = withTimeout(timeoutMs) { resolve(request.value) }
                currentCoroutineContext().ensureActive()
                if (requests.value === request && valid(request.profile)) publish(request.value, result)
            } catch (error: CancellationException) {
                if (error !is TimeoutCancellationException) throw error
                failedToken = request.token; failedAt = System.nanoTime()
                failure(error)
            } catch (error: Exception) {
                failedToken = request.token; failedAt = System.nanoTime()
                failure(error)
            }
        }
    }
    @Synchronized fun offer(profile: String, token: String, value: T) {
        if (!valid(profile)) { clear(); return }
        val previous = requests.value
        if (previous?.profile == profile && previous.token == token) {
            if (failedToken != token || System.nanoTime() - failedAt < 30_000_000_000L) return
            requests.value = null
        }
        failedToken = null
        requests.value = Request(profile, token, value)
    }
    @Synchronized fun clear() { requests.value = null; failedToken = null }
    fun close() { clear(); job.cancel() }
}
