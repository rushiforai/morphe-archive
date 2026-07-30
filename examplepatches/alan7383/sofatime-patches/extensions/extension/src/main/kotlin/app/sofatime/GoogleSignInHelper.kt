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

object GoogleSignInHelper {
    private const val TAG = "GoogleSignInHelper"
    private const val CLIENT_ID = "481632245518-stqia57m6le5qomp6mceodmrv5t0pbjv.apps.googleusercontent.com"
    private const val REDIRECT_URI = "https://tvsofa-3.firebaseapp.com/__/auth/handler"
    private const val API_KEY_P1 = "AIzaSyCConVG6aL3G"
    private const val API_KEY_P2 = "n4T3GCp7wAScdsNQLzqzPU"
    private val FIREBASE_API_KEY: String get() = API_KEY_P1 + API_KEY_P2

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
        val valueToBox: Any = if (isSuccess) {
            tokenOrError
        } else {
            val exception = IllegalStateException("Google sign-in failed or was cancelled.")
            try {
                val gl5Class = Class.forName("gl5")
                val gl5Constructor = gl5Class.getDeclaredConstructor(Throwable::class.java)
                gl5Constructor.isAccessible = true
                gl5Constructor.newInstance(exception)
            } catch (e: Exception) {
                Log.e(TAG, "Failed to instantiate gl5", e)
                exception
            }
        }

        return try {
            val hl5Class = Class.forName("hl5")
            val hl5Constructor = hl5Class.getDeclaredConstructor(Any::class.java)
            hl5Constructor.isAccessible = true
            hl5Constructor.newInstance(valueToBox)
        } catch (e: Exception) {
            Log.e(TAG, "Failed to instantiate hl5", e)
            valueToBox
        }
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
}
