package com.sarp.tiktokliquidglass

import android.annotation.SuppressLint
import android.content.Context
import android.content.SharedPreferences
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.util.Log
import org.json.JSONArray
import org.json.JSONObject
import java.io.IOException
import java.net.URL
import java.net.URLEncoder
import java.nio.charset.StandardCharsets
import java.time.Instant
import java.util.UUID
import java.util.concurrent.Executors
import javax.net.ssl.HttpsURLConnection

data class MergenSession(
    val uid: String,
    val username: String,
    val displayName: String,
    val email: String,
    val globalRole: String,
    val globalStatus: String,
    val idToken: String,
    val refreshToken: String,
    val deviceId: String
)

sealed class MergenAuthResult {
    data class Success(val session: MergenSession) : MergenAuthResult()
    data class Error(val message: String) : MergenAuthResult()
}

data class DeviceQuotaDecision(
    val allowed: Boolean,
    val reason: String,
    val activeCount: Int = 0,
    val maxDevices: Int = 0
)

/**
 * Zero-dependency pure HttpsURLConnection + org.json client connecting MergenV1
 * to the canonical MergenCore (`mergen-core`) identity & per-app device quota backend.
 */
object MergenCoreAuth {

    private const val TAG = "TikTokLiquidGlass"

    const val PROJECT_ID = "mergen-core"
    const val API_KEY = "AIzaSyCP4ZqFzkWKIHBCXE_NfJg_79gKRi0OL8I"
    const val PORTAL_URL = "https://mergen-core.web.app"
    const val AUTH_BASE_URL = "https://identitytoolkit.googleapis.com/v1"
    const val TOKEN_BASE_URL = "https://securetoken.googleapis.com/v1"
    const val FIRESTORE_BASE_URL =
        "https://firestore.googleapis.com/v1/projects/$PROJECT_ID/databases/(default)/documents"

    const val APP_ID = "mergenv1_tiktok"
    const val APP_NAME = "MergenV1"
    const val MAX_DEVICES = 2
    private const val ALLOW_SELF_DEVICE_RESET = true
    private const val PREFS_NAME = "mergencore_sdk_$APP_ID"
    private const val KEY_SESSION_JSON = "session_json"
    private const val KEY_FALLBACK_DEVICE_ID = "fallback_device_id"

    private val HANDLE_REGEX = Regex("^[a-z0-9_]{3,24}$")
    private val executor = Executors.newSingleThreadExecutor()
    private val mainHandler = Handler(Looper.getMainLooper())

    private fun prefs(context: Context): SharedPreferences =
        context.applicationContext.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

    @SuppressLint("HardwareIds")
    fun getAndroidDeviceId(context: Context): String {
        val appCtx = context.applicationContext
        val raw = try {
            Settings.Secure.getString(appCtx.contentResolver, Settings.Secure.ANDROID_ID)
        } catch (_: Throwable) {
            null
        }
        if (!raw.isNullOrBlank() && raw != "9774d56d682e549c") {
            return "AND-$raw"
        }
        val p = prefs(appCtx)
        val cached = p.getString(KEY_FALLBACK_DEVICE_ID, null)
        if (!cached.isNullOrBlank()) return cached
        val created = "AND-${UUID.randomUUID().toString().take(12)}"
        p.edit().putString(KEY_FALLBACK_DEVICE_ID, created).apply()
        return created
    }

    fun getCachedSession(context: Context): MergenSession? {
        val raw = prefs(context).getString(KEY_SESSION_JSON, null) ?: return null
        return try {
            val obj = JSONObject(raw)
            val uid = obj.optString("uid")
            val refresh = obj.optString("refreshToken")
            if (uid.isBlank() || refresh.isBlank()) return null
            MergenSession(
                uid = uid,
                username = obj.optString("username"),
                displayName = obj.optString("displayName"),
                email = obj.optString("email"),
                globalRole = obj.optString("globalRole", "member"),
                globalStatus = obj.optString("globalStatus", "active"),
                idToken = obj.optString("idToken"),
                refreshToken = refresh,
                deviceId = obj.optString("deviceId").ifBlank { getAndroidDeviceId(context) }
            )
        } catch (_: Throwable) {
            null
        }
    }

    fun isAuthenticated(context: Context): Boolean = getCachedSession(context) != null

    fun logout(context: Context) {
        prefs(context).edit().remove(KEY_SESSION_JSON).apply()
        MergenPrefs.notifyChanged()
    }

    fun loginAsync(
        context: Context,
        identifier: String,
        password: String,
        callback: (MergenAuthResult) -> Unit
    ) {
        val appCtx = context.applicationContext
        executor.execute {
            val result = loginBlocking(appCtx, identifier, password)
            mainHandler.post {
                if (result is MergenAuthResult.Success) {
                    MergenPrefs.notifyChanged()
                }
                callback(result)
            }
        }
    }

    fun restoreSessionAsync(context: Context) {
        val appCtx = context.applicationContext
        val cached = getCachedSession(appCtx) ?: return
        executor.execute {
            try {
                val formBody = "grant_type=refresh_token&refresh_token=${URLEncoder.encode(cached.refreshToken, "UTF-8")}"
                val tokResp = httpRequest(
                    url = "$TOKEN_BASE_URL/token?key=$API_KEY",
                    method = "POST",
                    contentType = "application/x-www-form-urlencoded",
                    body = formBody
                )
                if (tokResp.code in listOf(400, 401, 403)) {
                    Log.w(TAG, "MergenCore refresh token rejected (HTTP ${tokResp.code}); signing out.")
                    logout(appCtx)
                    return@execute
                }
                if (!tokResp.isSuccess) return@execute

                val tokJson = JSONObject(tokResp.body.ifBlank { "{}" })
                val idToken = tokJson.optString("id_token")
                val nextRefresh = tokJson.optString("refresh_token")
                if (idToken.isBlank() || nextRefresh.isBlank()) return@execute

                val userResp = httpRequest(
                    url = "$FIRESTORE_BASE_URL/users/${cached.uid}",
                    method = "GET",
                    bearerToken = idToken
                )
                if (userResp.code in listOf(401, 403, 404)) {
                    logout(appCtx)
                    return@execute
                }
                if (!userResp.isSuccess) return@execute

                val doc = decodeFirestoreDocument(JSONObject(userResp.body.ifBlank { "{}" }))
                val status = doc.optString("globalStatus", "active")
                if (status == "suspended" || status == "banned") {
                    logout(appCtx)
                    return@execute
                }

                val deviceId = getAndroidDeviceId(appCtx)
                val apps = doc.optJSONObject("apps")
                val appEntry = apps?.optJSONObject(APP_ID)
                if (appEntry != null) {
                    val appStatus = appEntry.optString("status", "active")
                    if (appStatus == "suspended" || appStatus == "banned") {
                        logout(appCtx)
                        return@execute
                    }
                    val devices = appEntry.optJSONObject("devices")
                    if (devices != null && !devices.has(deviceId)) {
                        Log.w(TAG, "Current device ($deviceId) was removed from MergenCore portal; locking MergenV1.")
                        logout(appCtx)
                        return@execute
                    }
                }

                val restored = MergenSession(
                    uid = cached.uid,
                    username = doc.optString("username", cached.username),
                    displayName = doc.optString("displayName", cached.displayName),
                    email = doc.optString("email", cached.email),
                    globalRole = doc.optString("globalRole", "member"),
                    globalStatus = status,
                    idToken = idToken,
                    refreshToken = nextRefresh,
                    deviceId = deviceId
                )
                saveSession(appCtx, restored)
            } catch (_: IOException) {
                // Keep cached session intact while offline.
            } catch (t: Throwable) {
                Log.w(TAG, "MergenCore background session check error", t)
            }
        }
    }

    private fun loginBlocking(context: Context, identifier: String, password: String): MergenAuthResult {
        return try {
            val trimmedPass = password
            require(trimmedPass.isNotEmpty()) {
                MergenStrings.t(context, "Parola boş olamaz.", "Password cannot be empty.")
            }
            val email = resolveEmail(context, identifier)

            val authBody = JSONObject().apply {
                put("email", email)
                put("password", trimmedPass)
                put("returnSecureToken", true)
            }.toString()

            val authResp = httpRequest(
                url = "$AUTH_BASE_URL/accounts:signInWithPassword?key=$API_KEY",
                method = "POST",
                contentType = "application/json; charset=utf-8",
                body = authBody
            )
            val authJson = try {
                JSONObject(authResp.body.ifBlank { "{}" })
            } catch (_: Throwable) {
                JSONObject()
            }
            if (!authResp.isSuccess) {
                val code = authJson.optJSONObject("error")?.optString("message")
                    ?: MergenStrings.t(context, "Giriş reddedildi.", "Sign in rejected.")
                return MergenAuthResult.Error(mapError(context, code))
            }

            val uid = authJson.getString("localId")
            val idToken = authJson.getString("idToken")
            val refreshToken = authJson.getString("refreshToken")

            val userResp = httpRequest(
                url = "$FIRESTORE_BASE_URL/users/$uid",
                method = "GET",
                bearerToken = idToken
            )
            if (!userResp.isSuccess) {
                return MergenAuthResult.Error(
                    MergenStrings.t(
                        context,
                        "MergenCore kullanıcı profili okunamadı (HTTP ${userResp.code}).",
                        "Failed to load MergenCore profile (HTTP ${userResp.code})."
                    )
                )
            }

            val userDoc = decodeFirestoreDocument(JSONObject(userResp.body.ifBlank { "{}" }))
            val globalStatus = userDoc.optString("globalStatus", "active")
            if (globalStatus == "suspended" || globalStatus == "banned") {
                return MergenAuthResult.Error(
                    MergenStrings.t(
                        context,
                        "Bu MergenCore hesabı askıya alınmıştır.",
                        "This MergenCore account is suspended."
                    )
                )
            }

            val deviceId = getAndroidDeviceId(context)
            val apps = userDoc.optJSONObject("apps") ?: JSONObject()
            val appEntry = apps.optJSONObject(APP_ID) ?: JSONObject().apply {
                put("appName", APP_NAME)
                put("status", "active")
                put("tier", userDoc.optString("globalRole", "member"))
                put("maxDevices", MAX_DEVICES)
                put("allowSelfDeviceReset", ALLOW_SELF_DEVICE_RESET)
                put("devices", JSONObject())
            }

            val appStatus = appEntry.optString("status", "active")
            if (appStatus == "suspended" || appStatus == "banned") {
                return MergenAuthResult.Error(
                    MergenStrings.t(
                        context,
                        "$APP_NAME erişiminiz askıya alınmıştır.",
                        "Your $APP_NAME access is suspended."
                    )
                )
            }

            val devices = appEntry.optJSONObject("devices") ?: JSONObject()
            val effectiveLimit = appEntry.optInt("maxDevices", MAX_DEVICES)
            val quota = enforceDevicePolicy(devices, deviceId, effectiveLimit)
            if (!quota.allowed) {
                return MergenAuthResult.Error(
                    MergenStrings.t(
                        context,
                        "Cihaz limiti (${quota.maxDevices}) doldu (${quota.activeCount}/${quota.maxDevices}). Eski cihazı $PORTAL_URL üzerinden kaldırın.",
                        "Device limit (${quota.maxDevices}) reached (${quota.activeCount}/${quota.maxDevices}). Remove an old device at $PORTAL_URL."
                    )
                )
            }

            val nowIso = Instant.now().toString()
            val prevDevice = devices.optJSONObject(deviceId)
            val mfg = Build.MANUFACTURER?.trim().orEmpty()
            val mdl = Build.MODEL?.trim().orEmpty()
            val modelName = when {
                mfg.isNotEmpty() && mdl.isNotEmpty() -> "$mfg $mdl"
                mfg.isNotEmpty() -> mfg
                mdl.isNotEmpty() -> mdl
                else -> MergenStrings.t(context, "Android Cihaz", "Android Device")
            }

            devices.put(
                deviceId,
                JSONObject().apply {
                    put("name", modelName)
                    put("platform", "Android SDK (API ${Build.VERSION.SDK_INT})")
                    put("lastSeen", nowIso)
                    put("registeredAt", prevDevice?.optString("registeredAt")?.ifBlank { nowIso } ?: nowIso)
                }
            )
            appEntry.put("appName", APP_NAME)
            appEntry.put("maxDevices", effectiveLimit)
            appEntry.put("devices", devices)
            apps.put(APP_ID, appEntry)

            val patchPayload = JSONObject().apply {
                put(
                    "fields",
                    JSONObject().apply {
                        put("apps", encodeFirestoreValue(apps))
                        put("lastLoginAt", encodeFirestoreValue(nowIso))
                    }
                )
            }.toString()

            // IMPORTANT: Android HttpsURLConnection rejects "PATCH" verb; use POST + X-HTTP-Method-Override.
            val patchResp = httpRequest(
                url = "$FIRESTORE_BASE_URL/users/$uid?updateMask.fieldPaths=apps&updateMask.fieldPaths=lastLoginAt",
                method = "POST",
                methodOverride = "PATCH",
                contentType = "application/json; charset=utf-8",
                bearerToken = idToken,
                body = patchPayload
            )
            if (!patchResp.isSuccess) {
                return MergenAuthResult.Error(
                    MergenStrings.t(
                        context,
                        "Cihaz oturumu kaydedilemedi (HTTP ${patchResp.code}).",
                        "Could not register device session (HTTP ${patchResp.code})."
                    )
                )
            }

            logActivityBestEffort(context, uid, idToken, modelName, nowIso)

            val session = MergenSession(
                uid = uid,
                username = userDoc.optString("username"),
                displayName = userDoc.optString("displayName"),
                email = userDoc.optString("email", email),
                globalRole = userDoc.optString("globalRole", "member"),
                globalStatus = globalStatus,
                idToken = idToken,
                refreshToken = refreshToken,
                deviceId = deviceId
            )
            saveSession(context, session)
            MergenAuthResult.Success(session)
        } catch (e: IllegalArgumentException) {
            MergenAuthResult.Error(
                e.message ?: MergenStrings.t(context, "Geçersiz giriş bilgisi.", "Invalid credentials.")
            )
        } catch (e: IOException) {
            MergenAuthResult.Error(
                MergenStrings.t(
                    context,
                    "Ağ bağlantısı kurulamadı. İnternetinizi kontrol edin.",
                    "Network connection failed. Check your internet."
                )
            )
        } catch (e: Throwable) {
            MergenAuthResult.Error(
                e.message ?: MergenStrings.t(context, "Beklenmeyen bağlantı hatası.", "Unexpected connection error.")
            )
        }
    }

    private fun resolveEmail(context: Context, identifier: String): String {
        val trimmed = identifier.trim()
        require(trimmed.isNotEmpty()) {
            MergenStrings.t(
                context,
                "Kullanıcı adı veya e-posta adresi boş olamaz.",
                "Username or email cannot be empty."
            )
        }
        if (trimmed.contains("@") && !trimmed.startsWith("@")) return trimmed

        val handle = normalizeHandle(trimmed)
        require(isValidHandle(handle)) {
            MergenStrings.t(context, "Geçersiz @kullaniciadi biçimi.", "Invalid @username format.")
        }

        val resp = httpRequest(
            url = "$FIRESTORE_BASE_URL/usernames/$handle",
            method = "GET"
        )
        require(resp.isSuccess) {
            MergenStrings.t(context, "@$handle kullanıcısı bulunamadı.", "User @$handle not found.")
        }
        val doc = decodeFirestoreDocument(JSONObject(resp.body.ifBlank { "{}" }))
        val email = doc.optString("email")
        require(email.isNotBlank()) {
            MergenStrings.t(context, "@$handle için e-posta kaydı eksik.", "Missing email record for @$handle.")
        }
        return email
    }

    private fun logActivityBestEffort(
        context: Context,
        uid: String,
        idToken: String,
        modelName: String,
        nowIso: String
    ) {
        try {
            val evId = "${System.currentTimeMillis()}-${UUID.randomUUID().toString().take(6)}"
            val detailText = MergenStrings.t(
                context,
                "$APP_NAME mobil girişi ($modelName).",
                "$APP_NAME mobile login ($modelName)."
            )
            val payload = JSONObject().apply {
                put(
                    "fields",
                    JSONObject().apply {
                        put("type", encodeFirestoreValue("APP_LOGIN"))
                        put("appId", encodeFirestoreValue(APP_ID))
                        put("platform", encodeFirestoreValue("Android"))
                        put("detail", encodeFirestoreValue(detailText))
                        put("timestamp", encodeFirestoreValue(nowIso))
                    }
                )
            }.toString()
            httpRequest(
                url = "$FIRESTORE_BASE_URL/users/$uid/activity?documentId=$evId",
                method = "POST",
                contentType = "application/json; charset=utf-8",
                bearerToken = idToken,
                body = payload
            )
        } catch (_: Throwable) {
        }
    }

    private fun saveSession(context: Context, session: MergenSession) {
        val obj = JSONObject().apply {
            put("uid", session.uid)
            put("username", session.username)
            put("displayName", session.displayName)
            put("email", session.email)
            put("globalRole", session.globalRole)
            put("globalStatus", session.globalStatus)
            put("idToken", session.idToken)
            put("refreshToken", session.refreshToken)
            put("deviceId", session.deviceId)
        }
        prefs(context).edit().putString(KEY_SESSION_JSON, obj.toString()).apply()
    }

    private fun mapError(context: Context, code: String): String = when {
        code.contains("INVALID_LOGIN_CREDENTIALS") ||
            code.contains("INVALID_PASSWORD") ||
            code.contains("EMAIL_NOT_FOUND") ->
            MergenStrings.t(
                context,
                "Kullanıcı adı/e-posta veya parola hatalı.",
                "Incorrect username/email or password."
            )
        code.contains("USER_DISABLED") ->
            MergenStrings.t(context, "Bu hesap devre dışı bırakılmıştır.", "This account is disabled.")
        code.contains("TOO_MANY_ATTEMPTS") ->
            MergenStrings.t(
                context,
                "Çok fazla hatalı deneme. Lütfen biraz bekleyin.",
                "Too many failed attempts. Please wait a moment."
            )
        else -> code
    }

    fun normalizeHandle(raw: String): String =
        raw.trim().removePrefix("@").lowercase().replace(Regex("[^a-z0-9_]"), "")

    fun isValidHandle(handle: String): Boolean = HANDLE_REGEX.matches(handle)

    fun enforceDevicePolicy(
        existingDevices: JSONObject?,
        currentDeviceId: String,
        maxDevices: Int
    ): DeviceQuotaDecision {
        val devices = existingDevices ?: JSONObject()
        if (devices.has(currentDeviceId)) {
            return DeviceQuotaDecision(true, "existing_device", devices.length(), maxDevices)
        }
        if (maxDevices <= 0) {
            return DeviceQuotaDecision(true, "unlimited", devices.length(), maxDevices)
        }
        val count = devices.length()
        return if (count < maxDevices) {
            DeviceQuotaDecision(true, "slot_available", count, maxDevices)
        } else {
            DeviceQuotaDecision(false, "quota_exceeded", count, maxDevices)
        }
    }

    private data class HttpResp(val code: Int, val body: String) {
        val isSuccess: Boolean get() = code in 200..299
    }

    private fun httpRequest(
        url: String,
        method: String,
        methodOverride: String? = null,
        contentType: String? = null,
        bearerToken: String? = null,
        body: String? = null
    ): HttpResp {
        val conn = (URL(url).openConnection() as HttpsURLConnection).apply {
            requestMethod = method
            connectTimeout = 15_000
            readTimeout = 20_000
            useCaches = false
            setRequestProperty("Accept", "application/json")
            if (methodOverride != null) {
                setRequestProperty("X-HTTP-Method-Override", methodOverride)
            }
            if (bearerToken != null) {
                setRequestProperty("Authorization", "Bearer $bearerToken")
            }
            if (contentType != null) {
                setRequestProperty("Content-Type", contentType)
            }
            if (body != null) {
                doOutput = true
            }
        }
        return try {
            if (body != null) {
                conn.outputStream.use { os ->
                    os.write(body.toByteArray(StandardCharsets.UTF_8))
                }
            }
            val code = conn.responseCode
            val stream = if (code in 200..299) conn.inputStream else conn.errorStream
            val text = stream?.bufferedReader(StandardCharsets.UTF_8)?.use { it.readText() } ?: ""
            HttpResp(code, text)
        } finally {
            conn.disconnect()
        }
    }

    private fun encodeFirestoreValue(value: Any?): JSONObject = when (value) {
        null -> JSONObject().put("nullValue", JSONObject.NULL)
        is Boolean -> JSONObject().put("booleanValue", value)
        is Int, is Long -> JSONObject().put("integerValue", value.toString())
        is Double, is Float -> JSONObject().put("doubleValue", (value as Number).toDouble())
        is JSONObject -> {
            val fields = JSONObject()
            val keys = value.keys()
            while (keys.hasNext()) {
                val k = keys.next()
                fields.put(k, encodeFirestoreValue(value.opt(k)))
            }
            JSONObject().put("mapValue", JSONObject().put("fields", fields))
        }
        is JSONArray -> {
            val arr = JSONArray()
            for (i in 0 until value.length()) arr.put(encodeFirestoreValue(value.opt(i)))
            JSONObject().put("arrayValue", JSONObject().put("values", arr))
        }
        else -> JSONObject().put("stringValue", value.toString())
    }

    private fun decodeFirestoreValue(valObj: JSONObject?): Any? {
        if (valObj == null) return null
        return when {
            valObj.has("stringValue") -> valObj.getString("stringValue")
            valObj.has("booleanValue") -> valObj.getBoolean("booleanValue")
            valObj.has("integerValue") -> valObj.getString("integerValue").toLongOrNull() ?: 0L
            valObj.has("doubleValue") -> valObj.getDouble("doubleValue")
            valObj.has("mapValue") -> {
                val fields = valObj.optJSONObject("mapValue")?.optJSONObject("fields")
                val out = JSONObject()
                if (fields != null) {
                    val keys = fields.keys()
                    while (keys.hasNext()) {
                        val k = keys.next()
                        out.put(k, decodeFirestoreValue(fields.optJSONObject(k)))
                    }
                }
                out
            }
            valObj.has("arrayValue") -> {
                val vals = valObj.optJSONObject("arrayValue")?.optJSONArray("values")
                val out = JSONArray()
                if (vals != null) {
                    for (i in 0 until vals.length()) {
                        out.put(decodeFirestoreValue(vals.optJSONObject(i)))
                    }
                }
                out
            }
            else -> JSONObject.NULL
        }
    }

    private fun decodeFirestoreDocument(doc: JSONObject): JSONObject {
        val fields = doc.optJSONObject("fields") ?: return JSONObject()
        val out = JSONObject()
        val keys = fields.keys()
        while (keys.hasNext()) {
            val k = keys.next()
            out.put(k, decodeFirestoreValue(fields.optJSONObject(k)))
        }
        return out
    }
}
