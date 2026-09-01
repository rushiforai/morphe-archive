package com.user.patches.medium

import android.app.Activity
import android.app.Application
import android.content.Intent
import android.net.Uri
import android.os.Bundle

object ActivityTracker : Application.ActivityLifecycleCallbacks {
    var currentActivity: Activity? = null

    @JvmStatic
    fun register(app: Application) {
        app.registerActivityLifecycleCallbacks(this)
    }

    override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) {}
    override fun onActivityStarted(activity: Activity) {}
    override fun onActivityResumed(activity: Activity) {
        currentActivity = activity
    }
    override fun onActivityPaused(activity: Activity) {
        if (currentActivity == activity) {
            currentActivity = null
        }
    }
    override fun onActivityStopped(activity: Activity) {}
    override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle) {}
    override fun onActivityDestroyed(activity: Activity) {}
}

object FreediumInterceptor {
    @JvmStatic
    var mirrorUrl: String = "https://freedium-mirror.cfd/"

    @JvmStatic
    fun checkAndRedirect(data: Any?) {
        if (data == null) return
        try {
            val getPostMethod = data.javaClass.getMethod("getPost")
            val post = getPostMethod.invoke(data) ?: return
            
            val getFullPostDataMethod = post.javaClass.getMethod("getFullPostData")
            val fullPostData = getFullPostDataMethod.invoke(post) ?: return
            
            val getPostMetaDataMethod = fullPostData.javaClass.getMethod("getPostMetaData")
            val postMetaData = getPostMetaDataMethod.invoke(fullPostData) ?: return
            
            val isLockedMethod = postMetaData.javaClass.getMethod("isLocked")
            val isLocked = isLockedMethod.invoke(postMetaData) as? Boolean ?: false
            
            if (isLocked) {
                val mediumUrlMethod = postMetaData.javaClass.getMethod("getMediumUrl")
                val mediumUrl = mediumUrlMethod.invoke(postMetaData) as String
                
                val activity = ActivityTracker.currentActivity ?: return
                
                val urlPrefix = if (mirrorUrl.isBlank()) "https://freedium-mirror.cfd/" else mirrorUrl
                val url = if (urlPrefix.endsWith("/")) urlPrefix + mediumUrl else urlPrefix + "/" + mediumUrl
                
                val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
                intent.setClassName(activity, "com.medium.android.donkey.read.web.ExternalWebViewActivity")
                activity.startActivity(intent)
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    @JvmStatic
    fun injectCSS(webView: android.webkit.WebView?, url: String?) {
        if (webView == null || url == null) return
        try {
            if (url.contains("freedium")) {
                val css = "header, nav, .freedium-header, [class*='navbar'] { display: none !important; }"
                val js = "var style = document.createElement('style'); style.innerHTML = '$css'; document.head.appendChild(style);"
                webView.evaluateJavascript(js, null)
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
}
