package app.morphe.extension.prathxmpatches.discord

import android.app.Activity
import android.content.Context
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.delay
import kotlinx.coroutines.isActive
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import org.json.JSONObject
import timber.log.Timber
import java.net.HttpURLConnection
import java.net.URL
import java.util.concurrent.atomic.AtomicLong

data class DiscordUser(
    val id: String,
    val username: String,
    val name: String,
    val avatar: String?,
)

object DiscordRpcManager {
    private const val TAG = "DiscordSvc"

    @Volatile
    private var initialized: Boolean = false

    @Volatile
    private var _ready: Boolean = false

    @Volatile
    private var _authorized: Boolean = false

    @Volatile
    private var accessToken: String? = null

    @Volatile
    private var authorizeInProgress: Boolean = false

    @Volatile
    private var lastActivitySentAtMs: Long = 0L

    @Volatile
    private var lastActivity: ActivityPayload? = null

    @Volatile private var currentSongId: String? = null
    @Volatile private var currentIsPlaying: Boolean = false
    private val currentActivityId = AtomicLong(0L)
    @Volatile private var imageResolutionJob: Job? = null
    @Volatile private var currentActivityHadImages: Boolean = false
    private val reconnectMutex = Mutex()
    private const val RECONNECT_BASE_DELAY_MS = 1000L
    private const val RECONNECT_MAX_DELAY_MS = 64_000L
    private const val MAX_RECONNECT_ATTEMPTS = 7

    @Volatile
    private var reconnectAttempts: Int = 0

    @Volatile private var pendingActivity: DiscordActivity? = null
    @Volatile private var pendingSongId: String? = null
    @Volatile private var pendingIsPlaying: Boolean = true
    @Volatile private var pendingStatus: PresenceStatus = PresenceStatus.Online

    private val _accessTokenFlow = MutableStateFlow<String?>(null)
    val accessTokenFlow: StateFlow<String?> = _accessTokenFlow

    private val _connectionStatus = MutableStateFlow(Status.Disconnected)
    val connectionStatus: StateFlow<Status> = _connectionStatus

    private val _lastError = MutableStateFlow<String?>(null)
    val lastError: StateFlow<String?> = _lastError

    private val _currentUser = MutableStateFlow<DiscordUser?>(null)
    val currentUser: StateFlow<DiscordUser?> = _currentUser

    private val _settingsChanged = MutableStateFlow(0)
    val settingsChanged: StateFlow<Int> = _settingsChanged

    fun notifySettingsChanged() {
        Timber.tag(TAG).d("notifySettingsChanged: incrementing (count=%d), invalidating dedup", _settingsChanged.value + 1)
        _settingsChanged.value++
        currentSongId = null
        currentIsPlaying = false
    }

    enum class Status { Disconnected, Authorizing, Connected }

    fun getAccessToken(): String? = accessToken

    fun isInitialized(): Boolean = initialized

    fun isAuthorized(): Boolean = _authorized

    fun isReady(): Boolean = _ready

    fun isShowingSong(songId: String, isPlaying: Boolean): Boolean {
        if (currentSongId != songId || currentIsPlaying != isPlaying) {
            return false
        }
        if (lastActivity == null) {
            return false
        }
        // If the last activity had images to resolve but none were sent,
        // and no resolution is in progress, allow the caller to retry.
        if (currentActivityHadImages &&
            lastActivity?.largeImage == null && lastActivity?.smallImage == null &&
            (imageResolutionJob == null || imageResolutionJob?.isCompleted == true)
        ) {
            return false
        }
        return true
    }

    fun clearLastError() {
        _lastError.value = null
    }

    private var scope: CoroutineScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)

    private val appId: String = BuildConfigProvider.appId

    private val auth: DiscordAuth = DiscordAuth()

    private var gateway: DiscordGateway = createGateway(scope)

    private fun createGateway(scope: CoroutineScope): DiscordGateway =
        DiscordGateway(
            appId = appId,
            tokenProvider = { "Bearer ${accessToken ?: ""}" },
            externalScope = scope,
        )

    private fun startEventCollection() {
        scope.launch {
            gateway.events.collect { event -> handleGatewayEvent(event) }
        }
    }

    fun init(context: Context) {
        if (Timber.forest().isEmpty()) {
            Timber.plant(Timber.DebugTree())
        }
        DiscordTokenStore.init(context.applicationContext)
        if (initialized && scope.isActive) {
            Timber.tag(TAG).i("init: already initialized and active, skipping")
            return
        }
        if (!scope.isActive) {
            Timber.tag(TAG).i("init: recreating scope after previous destroy")
            scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
            gateway = createGateway(scope)
        }
        initialized = true
        _connectionStatus.value = Status.Disconnected
        startEventCollection()
        Timber.tag(TAG).i("init: token store initialized, scheduling auto-rehydrate")

        scope.launch {
            val saved = DiscordTokenStore.retrieveSuspend()
            if (!saved.isNullOrEmpty()) {
                Timber.tag(TAG).i("init: found persisted token, reconnecting")
                reconnectWithToken(saved)
            } else {
                Timber.tag(TAG).i("init: no persisted token, waiting for explicit authorize")
            }
        }
    }

    fun authorize(activity: Activity, onComplete: (Boolean) -> Unit) {
        if (authorizeInProgress) {
            Timber.tag(TAG).w("authorize: already in progress, ignoring double-tap")
            scope.launch(Dispatchers.Main) { onComplete(false) }
            return
        }
        authorizeInProgress = true

        fun completeWith(success: Boolean) {
            scope.launch(Dispatchers.Main) { onComplete(success) }
        }

        if (_ready && _authorized) {
            Timber.tag(TAG).d("authorize: short-circuit — already ready and authorized")
            authorizeInProgress = false
            scope.launch(Dispatchers.Main) { onComplete(true) }
            return
        }
        if (_authorized) {
            Timber.tag(TAG).d("authorize: short-circuit — authorized but not ready, reconnecting")
            authorizeInProgress = false
            reconnectWithToken(accessToken ?: "")
            scope.launch(Dispatchers.Main) { onComplete(true) }
            return
        }

        _connectionStatus.value = Status.Authorizing
        _lastError.value = null

        scope.launch {
            try {
                val result = auth.authorize(activity)
                DiscordTokenStore.storeFull(
                    result.accessToken,
                    result.refreshToken,
                    result.expiresInSec,
                )
                accessToken = result.accessToken
                _accessTokenFlow.value = result.accessToken
                _authorized = true

                try {
                    reconnectMutex.withLock {
                        runCatching { gateway.close(4000, "re-authorizing") }
                        gateway.connect()
                        gateway.identify("Bearer ${result.accessToken}")
                    }
                    completeWith(true)
                } catch (e: Throwable) {
                    Timber.tag(TAG).e(e, "authorize: gateway connect/identify failed")
                    _lastError.value = "discord_error_loopback_timeout"
                    _connectionStatus.value = Status.Disconnected
                    _ready = false
                    _authorized = false
                    completeWith(false)
                }
            } catch (e: DiscordAuthException.UserCancelled) {
                Timber.tag(TAG).i("authorize: user cancelled")
                _lastError.value = "discord_error_loopback_timeout"
                _connectionStatus.value = Status.Disconnected
                completeWith(false)
            } catch (e: DiscordAuthException.StateMismatch) {
                Timber.tag(TAG).w(e, "authorize: state mismatch")
                _lastError.value = "discord_error_invalid_scope"
                _connectionStatus.value = Status.Disconnected
                completeWith(false)
            } catch (e: DiscordAuthException.NetworkFailure) {
                Timber.tag(TAG).e(e, "authorize: network failure")
                _lastError.value = "discord_error_loopback_timeout"
                _connectionStatus.value = Status.Disconnected
                completeWith(false)
            } catch (e: DiscordAuthException.NoBrowser) {
                Timber.tag(TAG).w(e, "authorize: no browser available")
                _lastError.value = "discord_error_no_browser"
                _connectionStatus.value = Status.Disconnected
                completeWith(false)
            } catch (e: DiscordAuthException.InvalidGrant) {
                Timber.tag(TAG).w(e, "authorize: invalid grant")
                _lastError.value = "discord_error_token_refresh_failed"
                _connectionStatus.value = Status.Disconnected
                completeWith(false)
            } catch (e: Throwable) {
                Timber.tag(TAG).e(e, "authorize: unexpected failure")
                _lastError.value = "discord_error_loopback_timeout"
                _connectionStatus.value = Status.Disconnected
                completeWith(false)
            } finally {
                authorizeInProgress = false
            }
        }
    }

    fun cancelAuthorize() {
        Timber.tag(TAG).i("cancelAuthorize: cancelling active authorization")
        auth.cancel()
    }

    fun fetchCurrentUser(token: String): DiscordUser? {
        return try {
            val url = URL("https://discord.com/api/v10/users/@me")
            val conn = url.openConnection() as HttpURLConnection
            conn.connectTimeout = 10_000
            conn.readTimeout = 10_000
            conn.requestMethod = "GET"
            conn.setRequestProperty("Authorization", "Bearer $token")
            conn.setRequestProperty("Accept", "application/json")

            val responseCode = conn.responseCode
            val responseBody = if (responseCode in 200..299) {
                conn.inputStream.bufferedReader().readText()
            } else {
                conn.errorStream?.bufferedReader()?.readText() ?: ""
            }
            conn.disconnect()

            if (responseCode !in 200..299) {
                Timber.tag(TAG).w("fetchCurrentUser: HTTP $responseCode body=$responseBody")
                return null
            }

            val json = JSONObject(responseBody)
            val id = json.getString("id")
            val username = json.getString("username")
            val name = json.optString("global_name", username)
            val avatarHash = json.optString("avatar")
            val avatar = if (avatarHash.isNotEmpty() && avatarHash != "null") {
                "https://cdn.discordapp.com/avatars/$id/$avatarHash.png"
            } else null

            DiscordUser(id, username, name, avatar)
        } catch (e: Exception) {
            Timber.tag(TAG).e(e, "fetchCurrentUser: exception")
            null
        }
    }

    fun setActivity(
        activity: DiscordActivity,
        songId: String? = null,
        isPlaying: Boolean = true,
        status: PresenceStatus = PresenceStatus.Online,
    ) {
        if (!_ready) {
            Timber.tag(TAG).w("setActivity: saving pending activity — not ready (name=%s)", activity.name)
            pendingActivity = activity
            pendingSongId = songId
            pendingIsPlaying = isPlaying
            pendingStatus = status
            return
        }

        pendingActivity = null

        val stateChanged = songId != currentSongId || isPlaying != currentIsPlaying ||
            activity.details != lastActivity?.details ||
            activity.state != lastActivity?.state ||
            (activity.largeImage != null && activity.largeImage != lastActivity?.largeImage) ||
            (activity.smallImage != null && activity.smallImage != lastActivity?.smallImage)

        val now = System.currentTimeMillis()
        if (!stateChanged &&
            lastActivitySentAtMs > 0L && (now - lastActivitySentAtMs) < 2_000L
        ) {
            Timber.tag(TAG).v("setActivity: debounced (<2s since last, stateChanged=%s)", stateChanged)
            return
        }

        currentSongId = songId
        currentIsPlaying = isPlaying
        val activityIdAtLaunch = currentActivityId.incrementAndGet()
        currentActivityHadImages = !activity.largeImage.isNullOrEmpty() || !activity.smallImage.isNullOrEmpty()

        val buttons = buildList {
            if (!activity.button1Label.isNullOrEmpty() && !activity.button1Url.isNullOrEmpty()) {
                val url = activity.button1Url
                if (url.startsWith("http") && !url.endsWith("v=") && !url.contains("{song.id}")) {
                    add(activity.button1Label to url)
                }
            }
            if (!activity.button2Label.isNullOrEmpty() && !activity.button2Url.isNullOrEmpty()) {
                val url = activity.button2Url
                if (url.startsWith("http") && !url.contains("{song.id}")) {
                    add(activity.button2Label to url)
                }
            }
        }

        imageResolutionJob?.cancel()

        val currentToken = accessToken
        val largeImageUrl = activity.largeImage
        val smallImageUrl = activity.smallImage

        if (currentToken == null || (largeImageUrl.isNullOrEmpty() && smallImageUrl.isNullOrEmpty())) {
            sendActivityPayload(activity, null, null, buttons, status)
            lastActivitySentAtMs = System.currentTimeMillis()
            return
        }

        imageResolutionJob = scope.launch {
            val tokenHeader = "Bearer $currentToken"
            android.util.Log.e("DiscordSvc", "setActivity: starting image resolution. largeImageUrl=$largeImageUrl, appId=$appId")
            
            val largeResolved = if (!largeImageUrl.isNullOrEmpty()) {
                DiscordExternalAssets.resolve(largeImageUrl, appId, tokenHeader)
            } else null
            val smallResolved = if (!smallImageUrl.isNullOrEmpty()) {
                DiscordExternalAssets.resolve(smallImageUrl, appId, tokenHeader)
            } else null

            android.util.Log.e("DiscordSvc", "setActivity: image resolution finished. largeResolved=$largeResolved, smallResolved=$smallResolved")

            if (activityIdAtLaunch != currentActivityId.get()) {
                Timber.tag(TAG).i(
                    "setActivity: stale image resolution (launched activityId=%d, current=%d), skipping send",
                    activityIdAtLaunch, currentActivityId.get()
                )
                return@launch
            }

            sendActivityPayload(activity, largeResolved, smallResolved, buttons, status)
            lastActivitySentAtMs = System.currentTimeMillis()
        }
    }

    private fun sendActivityPayload(
        activity: DiscordActivity,
        largeImage: String?,
        smallImage: String?,
        buttons: List<Pair<String, String>>,
        status: PresenceStatus
    ) {
        val payload = DiscordPresence.buildActivity(
            name = activity.name.orEmpty(),
            type = activityTypeToEnum(activity.activityType),
            details = activity.details,
            state = activity.state,
            largeImage = largeImage,
            largeText = activity.largeText,
            smallImage = smallImage,
            smallText = activity.smallText,
            startMs = activity.startTimestamp.takeIf { it > 0L },
            endMs = activity.endTimestamp?.takeIf { it > 0L },
            buttons = buttons,
        )

        lastActivity = payload

        try {
            val presenceJson = DiscordPresence.buildPresenceUpdate(
                status = status,
                activities = listOf(payload),
            )
            Timber.tag(TAG).i("setActivity: sending (type=%d, name=%s, details=%s, state=%s, songId=%s, largeImage=%s, buttons=%d)",
                activity.activityType, activity.name, activity.details, activity.state, currentSongId, largeImage, buttons.size)
            gateway.presenceUpdate(presenceJson)
        } catch (e: IllegalStateException) {
            Timber.tag(TAG).w(e, "setActivity: gateway not open")
        } catch (e: Throwable) {
            Timber.tag(TAG).e(e, "setActivity: send failed")
        }
    }

    fun clear() {
        pendingActivity = null
        if (!_ready) {
            Timber.tag(TAG).w("clear: skipping — not ready")
            return
        }
        if (lastActivity == null && currentSongId == null) {
            Timber.tag(TAG).d("clear: already cleared, skipping")
            return
        }
        lastActivity = null
        currentSongId = null
        currentIsPlaying = false
        currentActivityHadImages = false
        currentActivityId.incrementAndGet()
        imageResolutionJob?.cancel()
        try {
            gateway.presenceUpdate(
                DiscordPresence.buildPresenceUpdate(
                    status = PresenceStatus.Online,
                    activities = emptyList(),
                ),
            )
        } catch (e: IllegalStateException) {
            Timber.tag(TAG).w(e, "clear: gateway not open")
        } catch (e: Throwable) {
            Timber.tag(TAG).e(e, "clear: send failed")
        }
    }

    fun reconnectWithToken(token: String) {
        if (!initialized) {
            Timber.tag(TAG).w("reconnectWithToken: not initialized, ignoring")
            return
        }

        scope.launch {
            reconnectMutex.withLock {
                if ((_connectionStatus.value == Status.Connected || _connectionStatus.value == Status.Authorizing) && accessToken == token) {
                    Timber.tag(TAG).i("reconnectWithToken: already connected or connecting with this token, skipping")
                    return@withLock
                }
                accessToken = token
                _accessTokenFlow.value = token
                DiscordTokenStore.storeAccessToken(token)
                _connectionStatus.value = Status.Authorizing
                reconnectAttempts = 0
                try {
                    val refreshToken = DiscordTokenStore.getRefreshToken()
                    val expiresAt = DiscordTokenStore.getExpiresAt()
                    val nowSec = System.currentTimeMillis() / 1000L
                    val needsRefresh = !refreshToken.isNullOrEmpty() &&
                        expiresAt > 0L &&
                        (expiresAt - nowSec) < 3600L

                    Timber.tag(TAG).i(
                        "reconnectWithToken: hasRefreshToken=%s, expiresAt=%d, now=%d, needsRefresh=%s",
                        !refreshToken.isNullOrEmpty(),
                        expiresAt,
                        nowSec,
                        needsRefresh,
                    )

                    val tokenToUse = if (needsRefresh) {
                        refreshAccessToken() ?: token
                    } else {
                        token
                    }

                    performConnectAndAuth(tokenToUse, ReconnectAction.ReIdentify)
                } catch (e: Throwable) {
                    Timber.tag(TAG).e(e, "reconnectWithToken: failed")
                    _connectionStatus.value = Status.Disconnected
                }
            }
        }
    }

    private suspend fun refreshAccessToken(): String? {
        val refreshToken = DiscordTokenStore.getRefreshToken() ?: return null
        return try {
            val refreshed = auth.refresh(refreshToken)
            Timber.tag(TAG).i("refreshAccessToken: success")
            DiscordTokenStore.storeFull(
                refreshed.accessToken,
                refreshed.refreshToken,
                refreshed.expiresInSec,
            )
            accessToken = refreshed.accessToken
            _accessTokenFlow.value = refreshed.accessToken
            refreshed.accessToken
        } catch (e: DiscordAuthException.InvalidGrant) {
            Timber.tag(TAG).w(e, "refreshAccessToken: invalid grant, logging out")
            _lastError.value = "discord_error_token_refresh_failed"
            logout()
            null
        } catch (e: Throwable) {
            Timber.tag(TAG).e(e, "refreshAccessToken: failed")
            null
        }
    }

    private suspend fun performConnectAndAuth(token: String, action: ReconnectAction) {
        try {
            gateway.connect()
            when (action) {
                is ReconnectAction.Resume -> {
                    Timber.tag(TAG).i("performConnectAndAuth: sending RESUME")
                    gateway.resume(action.sessionId, action.seq, "Bearer $token")
                }
                else -> {
                    Timber.tag(TAG).i("performConnectAndAuth: sending IDENTIFY")
                    gateway.identify("Bearer $token")
                }
            }
        } catch (e: Throwable) {
            Timber.tag(TAG).e(e, "performConnectAndAuth: failed")
            _connectionStatus.value = Status.Disconnected
            
            val nextAction = if (action is ReconnectAction.Resume) {
                ReconnectAction.ReIdentify
            } else action
            
            scope.launch {
                handleReconnectAction(nextAction, 4000, "connect_failed")
            }
        }
    }

    private suspend fun handleReconnectAction(action: ReconnectAction, code: Int, reason: String) {
        reconnectMutex.withLock {
            val token = accessToken
            if (token == null) {
                Timber.tag(TAG).w("handleReconnectAction: no access token, cannot reconnect")
                _connectionStatus.value = Status.Disconnected
                return
            }

            when (action) {
                is ReconnectAction.SurfaceFatal -> {
                    Timber.tag(TAG).w("handleReconnectAction: SurfaceFatal for closeCode=%d, giving up", code)
                    _connectionStatus.value = Status.Disconnected
                }
                is ReconnectAction.RefreshAndReIdentify -> {
                    Timber.tag(TAG).w("handleReconnectAction: RefreshAndReIdentify, refreshing token")
                    _connectionStatus.value = Status.Authorizing
                    val refreshed = refreshAccessToken()
                    if (refreshed != null) {
                        performConnectAndAuth(refreshed, ReconnectAction.ReIdentify)
                    } else {
                        Timber.tag(TAG).e("handleReconnectAction: token refresh failed, giving up")
                        _connectionStatus.value = Status.Disconnected
                    }
                }
                is ReconnectAction.Resume,
                is ReconnectAction.ReIdentify -> {
                    if (reconnectAttempts >= MAX_RECONNECT_ATTEMPTS) {
                        Timber.tag(TAG).w("handleReconnectAction: max reconnect attempts reached (%d), giving up", MAX_RECONNECT_ATTEMPTS)
                        _lastError.value = "discord_error_loopback_timeout"
                        _connectionStatus.value = Status.Disconnected
                        return
                    }
                    reconnectAttempts++
                    val delayMs = if (code == 429) {
                        parseRetryAfter(reason).coerceAtLeast(60_000L)
                    } else {
                        reconnectDelayMs(reconnectAttempts)
                    }
                    Timber.tag(TAG).i("handleReconnectAction: reconnecting in %dms (attempt %d/%d, action=%s)",
                        delayMs, reconnectAttempts, MAX_RECONNECT_ATTEMPTS, action::class.simpleName)
                    
                    _connectionStatus.value = Status.Authorizing
                    delay(delayMs)
                    performConnectAndAuth(token, action)
                }
            }
        }
    }

    private fun reconnectDelayMs(attempt: Int): Long {
        val base = (RECONNECT_BASE_DELAY_MS * (1L shl (attempt - 1)))
            .coerceAtMost(RECONNECT_MAX_DELAY_MS)
        return applyJitter(base, 0.25)
    }

    private fun applyJitter(intervalMs: Long, ratio: Double): Long {
        if (intervalMs <= 0L) return intervalMs
        val delta = (intervalMs * ratio).toLong()
        if (delta <= 0L) return intervalMs
        val offset = java.lang.Math.abs(kotlin.random.Random.nextLong(delta + 1))
        val sign = if (kotlin.random.Random.nextBoolean()) -1L else 1L
        return intervalMs + sign * offset
    }

    private fun parseRetryAfter(reason: String): Long {
        val prefix = ";retry_after="
        val idx = reason.indexOf(prefix)
        if (idx < 0) return 60_000L
        val value = reason.substring(idx + prefix.length).trim()
        val seconds = value.substringBefore(';').substringBefore(',').toDoubleOrNull()
        return if (seconds != null) (seconds * 1000.0).toLong().coerceAtLeast(60_000L) else 60_000L
    }

    fun disconnect() {
        Timber.tag(TAG).i("disconnect: closing gateway, clearing ready/authorized")
        currentActivityId.incrementAndGet()
        imageResolutionJob?.cancel()
        pendingActivity = null
        runCatching { gateway.close(1000, "user disconnect") }
        _connectionStatus.value = Status.Disconnected
        _ready = false
        _authorized = false
        currentSongId = null
        currentIsPlaying = false
        currentActivityHadImages = false
    }

    fun destroy() {
        Timber.tag(TAG).i("destroy: cancelling scope and tearing down (initialized=%s)", initialized)
        currentActivityId.incrementAndGet()
        imageResolutionJob?.cancel()
        pendingActivity = null
        runCatching { gateway.close(1000, "destroy") }
        runCatching { gateway.closeHttp() }
        scope.cancel()
        _ready = false
        _authorized = false
        initialized = false
        _connectionStatus.value = Status.Disconnected
        lastActivity = null
        currentSongId = null
        currentIsPlaying = false
        currentActivityHadImages = false
    }

    fun logout() {
        Timber.tag(TAG).i("logout: clearing tokens and disconnecting")
        disconnect()
        accessToken = null
        _accessTokenFlow.value = null
        _currentUser.value = null
        DiscordTokenStore.clear()
        DiscordSuperProperties.reset()
        _lastError.value = null
        lastActivity = null
        currentActivityHadImages = false
        pendingActivity = null
    }

    private suspend fun handleGatewayEvent(event: GatewayEvent) {
        when (event) {
            is GatewayEvent.Ready -> {
                Timber.tag(TAG).i("gateway: READY (sessionId prefix=%s)", event.sessionId.take(8))
                _ready = true
                _authorized = true
                _connectionStatus.value = Status.Connected
                _lastError.value = null
                reconnectAttempts = 0
                
                pendingActivity?.let { activity ->
                    Timber.tag(TAG).i("gateway READY: sending pending activity (name=%s)", activity.name)
                    setActivity(activity, pendingSongId, pendingIsPlaying, pendingStatus)
                }

                val token = accessToken ?: return
                scope.launch {
                    val user = fetchCurrentUser(token)
                    _currentUser.value = user
                    if (user != null) {
                        Timber.tag(TAG).i("gateway READY: fetched user %s", user.username)
                    }
                }
            }
            is GatewayEvent.Resumed -> {
                Timber.tag(TAG).i("gateway: RESUMED")
                _ready = true
                _authorized = true
                _connectionStatus.value = Status.Connected
                _lastError.value = null
                reconnectAttempts = 0
                
                pendingActivity?.let { activity ->
                    Timber.tag(TAG).i("gateway RESUMED: sending pending activity (name=%s)", activity.name)
                    setActivity(activity, pendingSongId, pendingIsPlaying, pendingStatus)
                }
            }
            is GatewayEvent.Disconnected -> {
                Timber.tag(TAG).i("gateway: Disconnected (code=%d, remote=%s, reason=%s)",
                    event.code, event.remote, event.reason)
                _ready = false
                _authorized = false
                _connectionStatus.value = Status.Disconnected
                currentSongId = null
                currentIsPlaying = false
                imageResolutionJob?.cancel()
                imageResolutionJob = null

                if (event.code in setOf(4001, 4004) && event.reason.contains("max reconnect", ignoreCase = true)) {
                    _lastError.value = when (event.code) {
                        4004 -> "discord_error_token_refresh_failed"
                        4001 -> "discord_error_invalid_scope"
                        else -> _lastError.value
                    }
                    return
                }

                val gatewaySessionId = gateway.sessionId
                val gatewaySeq = gateway.currentSeq
                val action = DiscordReconnectStrategy.decide(
                    closeCode = event.code,
                    hadSession = !gatewaySessionId.isNullOrEmpty(),
                    seq = gatewaySeq,
                    sessionId = gatewaySessionId
                )

                scope.launch {
                    handleReconnectAction(action, event.code, event.reason)
                }
            }
            is GatewayEvent.InvalidSession -> {
                Timber.tag(TAG).w("gateway: InvalidSession (resumable=%s), closing WS to trigger reconnect", event.resumable)
                imageResolutionJob?.cancel()
                imageResolutionJob = null
            }
            is GatewayEvent.Hello -> Unit
            is GatewayEvent.HeartbeatAck -> Unit
            is GatewayEvent.TextDispatch -> {
                Timber.tag(TAG).v("gateway: TextDispatch op=%d t=%s", event.op, event.t)
            }
        }
    }

    private fun activityTypeToEnum(code: Int): ActivityType = when (code) {
        0 -> ActivityType.Playing
        1 -> ActivityType.Streaming
        2 -> ActivityType.Listening
        3 -> ActivityType.Watching
        4 -> ActivityType.Custom
        5 -> ActivityType.Competing
        else -> ActivityType.Listening
    }
}

private object BuildConfigProvider {
    val appId: String = DiscordDefaults.APP_ID
}
