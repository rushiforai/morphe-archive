package app.sofatime

import android.app.Activity
import android.app.Dialog
import android.content.Context
import android.content.ContextWrapper
import android.graphics.Bitmap
import android.net.Uri
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.ViewGroup
import android.webkit.CookieManager
import android.webkit.WebResourceRequest
import android.webkit.WebView
import android.webkit.WebViewClient
import org.json.JSONObject
import java.io.BufferedReader
import java.io.InputStreamReader
import java.lang.reflect.Method
import java.net.HttpURLConnection
import java.net.URL
import java.util.UUID
import java.util.concurrent.atomic.AtomicBoolean
import java.util.zip.ZipFile

object GoogleSignInHelper {
    private const val TAG = "GoogleSignInHelper"
    private const val CLIENT_ID = "481632245518-stqia57m6le5qomp6mceodmrv5t0pbjv.apps.googleusercontent.com"
    private const val REDIRECT_URI = "https://tvsofa-3.firebaseapp.com/__/auth/handler"
    private const val API_KEY_P1 = "AIzaSyCConVG6aL3G"
    private const val API_KEY_P2 = "n4T3GCp7wAScdsNQLzqzPU"
    private val FIREBASE_API_KEY: String get() = API_KEY_P1 + API_KEY_P2

    @Volatile
    private var appContext: Context? = null

    private fun getActivity(context: Context?): Activity? {
        if (context == null) return getForegroundActivity()
        var cur: Context? = context
        while (cur is ContextWrapper) {
            if (cur is Activity) {
                return cur
            }
            cur = cur.baseContext
        }
        return getForegroundActivity()
    }

    private fun getForegroundActivity(): Activity? {
        try {
            val activityThreadClass = Class.forName("android.app.ActivityThread")
            val activityThread = activityThreadClass.getMethod("currentActivityThread").invoke(null)
            val mActivitiesField = activityThreadClass.getDeclaredField("mActivities")
            mActivitiesField.isAccessible = true
            val activities = mActivitiesField.get(activityThread) as? Map<*, *>
            if (activities != null) {
                for (activityRecord in activities.values) {
                    if (activityRecord == null) continue
                    val activityRecordClass = activityRecord.javaClass
                    val pausedField = activityRecordClass.getDeclaredField("paused")
                    pausedField.isAccessible = true
                    if (!pausedField.getBoolean(activityRecord)) {
                        val activityField = activityRecordClass.getDeclaredField("activity")
                        activityField.isAccessible = true
                        val activity = activityField.get(activityRecord) as? Activity
                        if (activity != null) {
                            return activity
                        }
                    }
                }
                for (activityRecord in activities.values) {
                    if (activityRecord == null) continue
                    val activityRecordClass = activityRecord.javaClass
                    val activityField = activityRecordClass.getDeclaredField("activity")
                    activityField.isAccessible = true
                    val activity = activityField.get(activityRecord) as? Activity
                    if (activity != null && !activity.isFinishing) {
                        return activity
                    }
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error fetching foreground activity", e)
        }
        return null
    }

    @JvmStatic
    fun startGoogleSignIn(context: Context?, continuationObj: Any?) {
        Log.d(TAG, "startGoogleSignIn called with Context: ${context?.javaClass?.name ?: "null"}, Continuation: ${continuationObj?.javaClass?.name ?: "null"}")

        if (context != null && appContext == null) {
            appContext = context.applicationContext
        }
        val activity = getActivity(context)
        if (activity == null || continuationObj == null) {
            Log.e(TAG, "Failed to resolve Activity or Continuation object")
            if (continuationObj != null) {
                resumeCoroutine(continuationObj, AtomicBoolean(false), "")
            }
            return
        }

        val resumed = AtomicBoolean(false)

        val showWebViewRunnable = Runnable {
            try {
                val dialog = Dialog(activity, android.R.style.Theme_Translucent_NoTitleBar_Fullscreen)
                val webView = WebView(activity)
                webView.layoutParams = ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
                )

                webView.settings.javaScriptEnabled = true
                webView.settings.domStorageEnabled = true
                @Suppress("DEPRECATION")
                webView.settings.databaseEnabled = true
                webView.settings.userAgentString =
                    "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36"

                val cookieManager = CookieManager.getInstance()
                cookieManager.setAcceptCookie(true)
                cookieManager.setAcceptThirdPartyCookies(webView, true)

                val nonce = UUID.randomUUID().toString()
                val authUrl = "https://accounts.google.com/o/oauth2/v2/auth?" +
                        "client_id=$CLIENT_ID" +
                        "&redirect_uri=${Uri.encode(REDIRECT_URI)}" +
                        "&response_type=${Uri.encode("id_token code")}" +
                        "&scope=${Uri.encode("openid email profile")}" +
                        "&nonce=$nonce"

                webView.webViewClient = object : WebViewClient() {
                    private var captured = false

                    private fun handleUrl(url: String?): Boolean {
                        if (captured || url == null) return false
                        Log.d(TAG, "Navigating: $url")

                        if (url.startsWith(REDIRECT_URI)) {
                            captured = true
                            val uri = Uri.parse(url)

                            var idToken: String? = null
                            if (url.contains("id_token=")) {
                                val start = url.indexOf("id_token=") + 9
                                var end = url.indexOf("&", start)
                                if (end == -1) end = url.length
                                idToken = url.substring(start, end)
                            }

                            val code = uri.getQueryParameter("code")

                            dialog.dismiss()

                            if (!idToken.isNullOrEmpty()) {
                                Log.d(TAG, "Captured direct Google ID Token!")
                                resumeCoroutine(continuationObj, resumed, idToken)
                            } else if (!code.isNullOrEmpty()) {
                                Log.d(TAG, "Captured Google Auth Code, exchanging via thread...")
                                Thread {
                                    try {
                                        val token = exchangeCodeForFirebaseToken(code)
                                        resumeCoroutine(continuationObj, resumed, token)
                                    } catch (e: Exception) {
                                        Log.e(TAG, "Exchange code failed", e)
                                        resumeCoroutine(continuationObj, resumed, "")
                                    }
                                }.start()
                            } else {
                                resumeCoroutine(continuationObj, resumed, "")
                            }

                            return true
                        }
                        return false
                    }

                    override fun shouldOverrideUrlLoading(view: WebView, request: WebResourceRequest): Boolean {
                        if (handleUrl(request.url.toString())) {
                            return true
                        }
                        return super.shouldOverrideUrlLoading(view, request)
                    }

                    @Suppress("DEPRECATION")
                    override fun shouldOverrideUrlLoading(view: WebView, url: String): Boolean {
                        if (handleUrl(url)) {
                            return true
                        }
                        return super.shouldOverrideUrlLoading(view, url)
                    }

                    override fun onPageStarted(view: WebView, url: String?, favicon: Bitmap?) {
                        if (handleUrl(url)) {
                            view.stopLoading()
                        } else {
                            super.onPageStarted(view, url, favicon)
                        }
                    }
                }

                dialog.setOnDismissListener {
                    resumeCoroutine(continuationObj, resumed, "")
                }

                dialog.setContentView(webView)
                dialog.show()
                webView.loadUrl(authUrl)

            } catch (e: Exception) {
                Log.e(TAG, "Error displaying WebView dialog", e)
                resumeCoroutine(continuationObj, resumed, "")
            }
        }

        if (Looper.myLooper() == Looper.getMainLooper()) {
            showWebViewRunnable.run()
        } else {
            Handler(Looper.getMainLooper()).post(showWebViewRunnable)
        }
    }

    private fun createResultObject(tokenOrError: String): Any {
        val isSuccess = tokenOrError.isNotEmpty()
        val valueToBox: Any? = if (isSuccess) {
            tokenOrError
        } else {
            val exception = IllegalStateException("Google sign-in failed or was cancelled.")
            val failureClass = ResultClasses.failureClass(appContext)
            if (failureClass != null) {
                try {
                    val ctor = failureClass.declaredConstructors.first { it.parameterTypes.size == 1 }
                    ctor.isAccessible = true
                    ctor.newInstance(exception)
                } catch (e: Exception) {
                    Log.e(TAG, "Failed to instantiate Result.Failure (${failureClass.name})", e)
                    null
                }
            } else {
                null
            }
        }

        val resultClass = ResultClasses.resultClass(appContext)
        val boxed: Any? = if (valueToBox != null && resultClass != null) {
            try {
                val ctor = resultClass.declaredConstructors.first { it.parameterTypes.size == 1 && it.parameterTypes[0] == Any::class.java }
                ctor.isAccessible = true
                ctor.newInstance(valueToBox)
            } catch (e: Exception) {
                Log.e(TAG, "Failed to instantiate Result (${resultClass.name})", e)
                null
            }
        } else {
            null
        }

        if (boxed != null) return boxed

        if (isSuccess) {
            Log.e(TAG, "Could not build a Result box; falling back to raw token")
            return tokenOrError
        }
        val successClass = ResultClasses.resultClass(appContext)
        if (successClass != null) {
            try {
                val ctor = successClass.declaredConstructors.first { it.parameterTypes.size == 1 && it.parameterTypes[0] == Any::class.java }
                ctor.isAccessible = true
                return ctor.newInstance(null)
            } catch (e: Exception) {
                Log.e(TAG, "Failed to build fallback success Result", e)
            }
        }
        return tokenOrError
    }

    private fun resumeCoroutine(continuationObj: Any, resumed: AtomicBoolean, result: String) {
        if (resumed.compareAndSet(false, true)) {
            Log.d(TAG, "Resuming coroutine with result token (length: ${result.length})")
            try {
                var target = continuationObj
                try {
                    val interceptedMethod = continuationObj.javaClass.getMethod("intercepted")
                    val intercepted = interceptedMethod.invoke(continuationObj)
                    if (intercepted != null) {
                        target = intercepted
                    }
                } catch (_: Exception) {
                }

                var resumeMethod: Method? = null
                for (m in target.javaClass.methods) {
                    if (m.name == "resumeWith" && m.parameterTypes.size == 1) {
                        resumeMethod = m
                        break
                    }
                }
                if (resumeMethod == null) {
                    var cur: Class<*>? = target.javaClass
                    while (cur != null && resumeMethod == null) {
                        for (m in cur.declaredMethods) {
                            if (m.name == "resumeWith" && m.parameterTypes.size == 1) {
                                m.isAccessible = true
                                resumeMethod = m
                                break
                            }
                        }
                        cur = cur.superclass
                    }
                }
                if (resumeMethod != null) {
                    val resultObject = createResultObject(result)
                    resumeMethod.invoke(target, resultObject)
                } else {
                    Log.e(TAG, "Could not find resumeWith method on ${target.javaClass.name}")
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error resuming coroutine via reflection", e)
            }
        }
    }


    private fun exchangeCodeForFirebaseToken(authCode: String): String {
        val requestUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithIdp?key=$FIREBASE_API_KEY"
        val url = URL(requestUrl)
        val conn = url.openConnection() as HttpURLConnection
        conn.requestMethod = "POST"
        conn.doOutput = true
        conn.setRequestProperty("Content-Type", "application/json")

        val body = JSONObject()
        val postBody = "code=$authCode&client_id=$CLIENT_ID&redirect_uri=$REDIRECT_URI"

        body.put("postBody", postBody)
        body.put("requestUri", REDIRECT_URI)
        body.put("returnSecureToken", true)

        val outputBytes = body.toString().toByteArray(Charsets.UTF_8)
        val os = conn.outputStream
        os.write(outputBytes)
        os.flush()
        os.close()

        val responseCode = conn.responseCode
        Log.d(TAG, "Firebase response code: $responseCode")

        val inputStream = if (responseCode == 200) conn.inputStream else conn.errorStream
        val reader = BufferedReader(InputStreamReader(inputStream))
        val responseStr = StringBuilder()
        var line: String?
        while (reader.readLine().also { line = it } != null) {
            responseStr.append(line)
        }
        reader.close()

        val jsonResponse = JSONObject(responseStr.toString())
        return if (jsonResponse.has("idToken")) {
            jsonResponse.getString("idToken")
        } else {
            Log.e(TAG, "idToken missing: $responseStr")
            ""
        }
    }

    private object ResultClasses {
        private data class Proto(val returnType: String, val params: List<String>)

        private class DexScan(private val data: ByteArray) {
            private fun u16(off: Int): Int =
                if (off in 0..(data.size - 2)) {
                    (data[off].toInt() and 0xFF) or ((data[off + 1].toInt() and 0xFF) shl 8)
                } else {
                    0xFFFF
                }

            private fun u32(off: Int): Int =
                (data[off].toInt() and 0xFF) or ((data[off + 1].toInt() and 0xFF) shl 8) or
                    ((data[off + 2].toInt() and 0xFF) shl 16) or ((data[off + 3].toInt() and 0xFF) shl 24)

            private fun safeU32(off: Int, max: Int = data.size): Int =
                if (off in 0..(max - 4)) u32(off) else -1

            private fun uleb128(start: Int): Pair<Int, Int> {
                var result = 0
                var shift = 0
                var off = start
                while (off < data.size) {
                    val b = data[off].toInt() and 0xFF
                    off++
                    result = result or ((b and 0x7F) shl shift)
                    if (b and 0x80 == 0) break
                    shift += 7
                }
                return result to off
            }

            private fun string(idx: Int): String {
                if (idx < 0 || idx >= stringIdsSize) return ""
                val off = safeU32(stringIdsOff + idx * 4)
                if (off < 0) return ""
                val (_, p) = uleb128(off)
                var i = p
                while (i < data.size && data[i].toInt() != 0) i++
                return String(data.copyOfRange(p, i), Charsets.UTF_8)
            }

            private fun type(idx: Int): String {
                if (idx < 0 || idx >= typeIdsSize) return ""
                return string(safeU32(typeIdsOff + idx * 4))
            }

            private fun proto(idx: Int): Proto {
                if (idx < 0 || protoIdsOff + idx * 12 > data.size - 12) return Proto("", emptyList())
                val base = protoIdsOff + idx * 12
                val returnType = type(safeU32(base + 4))
                val paramsOff = safeU32(base + 8)
                if (paramsOff <= 0 || paramsOff > data.size - 4) return Proto(returnType, emptyList())
                val size = u32(paramsOff)
                val params = if (paramsOff + 4 + size * 4 > data.size) {
                    emptyList()
                } else {
                    (0 until size).map { type(u32(paramsOff + 4 + it * 4)) }
                }
                return Proto(returnType, params)
            }

            private val stringIdsSize = u32(0x38)
            private val stringIdsOff = u32(0x3C)
            private val typeIdsSize = u32(0x40)
            private val typeIdsOff = u32(0x44)
            private val protoIdsOff = u32(0x4C)
            private val fieldIdsOff = u32(0x54)
            private val methodIdsOff = u32(0x5C)
            private val classDefsSize = u32(0x60)
            private val classDefsOff = u32(0x64)

            private fun fieldType(fieldIdx: Int): String =
                if (fieldIdx < 0 || fieldIdsOff + fieldIdx * 8 + 4 > data.size) "" else type(u16(fieldIdsOff + fieldIdx * 8 + 2))

            private fun methodProto(methodIdx: Int): Proto =
                if (methodIdx < 0 || methodIdsOff + methodIdx * 8 + 8 > data.size) Proto("", emptyList())
                else proto(u16(methodIdsOff + methodIdx * 8 + 2))

            private fun methodName(methodIdx: Int): String {
                if (methodIdx < 0 || methodIdsOff + methodIdx * 8 + 8 > data.size) return ""
                val nameIdx = u32(methodIdsOff + methodIdx * 8 + 4)
                return string(nameIdx)
            }

            fun findResultClasses(): Pair<String?, String?> {
                var resultClass: String? = null
                var failureClass: String? = null

                var cls = 0
                while (cls < classDefsSize) {
                    val defOff = classDefsOff + cls * 32
                    if (defOff < 0 || defOff + 28 > data.size) break
                    val classIdx = u32(defOff)
                    val superIdx = u32(defOff + 8)
                    val interfacesOff = u32(defOff + 12)
                    val classDataOff = u32(defOff + 24)

                    val superName = if (superIdx == -1) "" else type(superIdx)
                    var isSerializable = false
                    if (interfacesOff != 0 && interfacesOff > 0 && interfacesOff <= data.size - 4) {
                        val count = u32(interfacesOff)
                        var i = 0
                        while (i < count && interfacesOff + 4 + i * 2 + 2 <= data.size) {
                            if (type(u16(interfacesOff + 4 + i * 2)) == "Ljava/io/Serializable;") {
                                isSerializable = true
                                break
                            }
                            i++
                        }
                    }
                    if (superName != "Ljava/lang/Object;" || !isSerializable || classDataOff == 0 || classDataOff >= data.size) {
                        cls++
                        continue
                    }

                    val (staticFieldsSize, p1) = uleb128(classDataOff)
                    val (instanceFieldsSize, p2) = uleb128(p1)
                    val (directMethodsSize, p3) = uleb128(p2)
                    val (virtualMethodsSize, p4) = uleb128(p3)

                    var hasObjectField = false
                    var hasThrowableField = false
                    var i0 = p4
                    var fieldIdx = 0
                    var fieldsOk = true
                    var i = 0
                    while (i < staticFieldsSize && fieldsOk) {
                        if (i0 >= data.size) { fieldsOk = false; break }
                        val (diff, np1) = uleb128(i0)
                        val (flags, np2) = uleb128(np1)
                        i0 = np2
                        fieldIdx += diff
                        i++
                    }

                    fieldIdx = 0 // Reset for instance_fields list
                    i = 0
                    while (i < instanceFieldsSize && fieldsOk) {
                        if (i0 >= data.size) { fieldsOk = false; break }
                        val (diff, np1) = uleb128(i0)
                        val (flags, np2) = uleb128(np1)
                        i0 = np2
                        fieldIdx += diff
                        when (fieldType(fieldIdx)) {
                            "Ljava/lang/Object;" -> hasObjectField = true
                            "Ljava/lang/Throwable;" -> hasThrowableField = true
                        }
                        i++
                    }

                    var methodIdx = 0
                    i = 0
                    var directHasCtorThrowable = false
                    var directHasStaticThrowableOf = false
                    var m0 = i0 // Methods array starts right after fields arrays
                    var methodsOk = true
                    while (i < directMethodsSize && fieldsOk) {
                        if (m0 >= data.size) { methodsOk = false; break }
                        val (diff, np1) = uleb128(m0)
                        val (flags, np2) = uleb128(np1)
                        val (_, np3) = uleb128(np2)
                        m0 = np3
                        methodIdx += diff
                        val proto = methodProto(methodIdx)
                        val name = methodName(methodIdx)
                        if (name == "<init>" && proto.params.size == 1 && proto.params[0] == "Ljava/lang/Throwable;") {
                            directHasCtorThrowable = true
                        }
                        if (proto.params.size == 1 && proto.params[0] == "Ljava/lang/Object;" && proto.returnType == "Ljava/lang/Throwable;") {
                            directHasStaticThrowableOf = true
                        }
                        i++
                    }
                    methodIdx = 0
                    i = 0
                    var m1 = p4
                    while (i < virtualMethodsSize && methodsOk) {
                        if (m1 >= data.size) break
                        val (diff, np1) = uleb128(m1)
                        val (_, np2) = uleb128(np1)
                        val (_, np3) = uleb128(np2)
                        m1 = np3
                        methodIdx += diff
                        i++
                    }

                    val className = type(classIdx)
                        .removePrefix("L")
                        .removeSuffix(";")
                    if (hasObjectField && directHasStaticThrowableOf && staticFieldsSize == 0) {
                        resultClass = className
                    }
                    if (hasThrowableField && directHasCtorThrowable && staticFieldsSize == 0) {
                        failureClass = className
                    }
                    if (resultClass != null && failureClass != null) break
                    cls++
                }

                return resultClass to failureClass
            }
        }

        @Volatile
        private var cachedResult: Class<*>? = null
        @Volatile
        private var cachedFailure: Class<*>? = null
        @Volatile
        private var scanned = false

        private val KNOWN = listOf<Pair<String, String>>()

        fun resultClass(context: Context?): Class<*>? = resolve(context)?.first
        fun failureClass(context: Context?): Class<*>? = resolve(context)?.second

        private fun load(name: String, classLoader: ClassLoader? = null): Class<*>? = try {
            val cl = classLoader ?: appContext?.classLoader ?: GoogleSignInHelper::class.java.classLoader
            if (cl != null) cl.loadClass(name) else Class.forName(name)
        } catch (_: Throwable) {
            null
        }

        private fun hasCtor(cls: Class<*>, param: Class<*>): Boolean = try {
            val res = cls.declaredConstructors.any { it.parameterTypes.size == 1 && it.parameterTypes[0] == param }
            Log.d(TAG, "hasCtor for ${cls.name} with param ${param.name}: $res")
            res
        } catch (e: Throwable) {
            Log.e(TAG, "hasCtor threw exception", e)
            false
        }

        private fun resolve(context: Context?): Pair<Class<*>, Class<*>>? {
            cachedResult?.let { r -> cachedFailure?.let { f -> return r to f } }

            synchronized(this) {
                cachedResult?.let { r -> cachedFailure?.let { f -> return r to f } }

                for ((rn, fn) in KNOWN) {
                    val rc = try { load(rn) } catch (_: Throwable) { null }
                    val fc = try { load(fn) } catch (_: Throwable) { null }
                    val rcCtor = rc != null && try { hasCtor(rc, Any::class.java) } catch (_: Throwable) { false }
                    val fcCtor = fc != null && try { hasCtor(fc, Throwable::class.java) } catch (_: Throwable) { false }
                    Log.d(TAG, "KNOWN pair $rn/$fn: rc=${rc?.name} fc=${fc?.name} ctor=$rcCtor/$fcCtor")
                    if (rc != null && fc != null && rcCtor && fcCtor) {
                        cachedResult = rc
                        cachedFailure = fc
                        Log.i(TAG, "Resolved Result classes via KNOWN: ${rc.name} / ${fc.name}")
                        return rc to fc
                    }
                }

                if (!scanned) {
                    scanned = true
                    val sourceDir = try {
                        context?.applicationInfo?.sourceDir
                    } catch (_: Throwable) {
                        null
                    }
                    if (sourceDir != null) {
                        try {
                            val dexFiles = ZipFile(sourceDir).use { zip ->
                                zip.entries().asSequence()
                                    .filter { it.name.startsWith("classes") && it.name.endsWith(".dex") }
                                    .map { zip.getInputStream(it).readBytes() }
                                    .toList()
                            }
                            var foundResultClass: Class<*>? = null
                            var foundFailureClass: Class<*>? = null

                            for (dex in dexFiles) {
                                val found = DexScan(dex).findResultClasses()
                                Log.d(TAG, "DexScan returned: ${found.first} / ${found.second}")
                                if (found.first != null && foundResultClass == null) {
                                    val rc = load(found.first!!)
                                    val hasCtorRes = rc != null && hasCtor(rc, Any::class.java)
                                    Log.d(TAG, "loaded rc: ${rc?.name}, hasCtor: $hasCtorRes")
                                    if (hasCtorRes) foundResultClass = rc
                                }
                                if (found.second != null && foundFailureClass == null) {
                                    val fc = load(found.second!!)
                                    val hasCtorRes = fc != null && hasCtor(fc, Throwable::class.java)
                                    Log.d(TAG, "loaded fc: ${fc?.name}, hasCtor: $hasCtorRes")
                                    if (hasCtorRes) foundFailureClass = fc
                                }
                                if (foundResultClass != null && foundFailureClass != null) {
                                    cachedResult = foundResultClass
                                    cachedFailure = foundFailureClass
                                    Log.i(TAG, "Discovered obfuscated Result classes via DEX scan: ${foundResultClass.name} / ${foundFailureClass.name}")
                                    return foundResultClass to foundFailureClass
                                }
                            }
                        } catch (e: Exception) {
                            Log.e(TAG, "DEX scan failed", e)
                        }
                    }
                }

                val stdlibResult = load("kotlin.Result")
                val stdlibFailure = load("kotlin.Result\$Failure")
                if (stdlibResult != null && stdlibFailure != null &&
                    hasCtor(stdlibResult, Any::class.java) && hasCtor(stdlibFailure, Throwable::class.java)
                ) {
                    cachedResult = stdlibResult
                    cachedFailure = stdlibFailure
                    return stdlibResult to stdlibFailure
                }
                return null
            }
        }
    }
}


