package app.ckzorigins.patches.compat

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Play's APK expansion downloader is the launcher, a background service, and an alarm
 * receiver. The OBB is inside the APK, so none of them should run. The MAIN/LAUNCHER
 * filter moves to [UNITY_LAUNCHER], which is what `DownloaderActivity.finishOnCreate`
 * starts once `OBB_ENABLED` is false.
 */
internal object ExpansionDownloaderManifest {
    const val DOWNLOADER_ACTIVITY =
        "com.google.android.vending.expansion.downloader_impl.DownloaderActivity"
    const val DOWNLOADER_SERVICE =
        "com.google.android.vending.expansion.downloader_impl.GDownloaderService"
    const val ALARM_RECEIVER =
        "com.google.android.vending.expansion.downloader_impl.AlarmReceiver"
    const val UNITY_LAUNCHER =
        "com.glu.plugins.AUnityInstaller.UnityLauncherActivity"
    const val ACTION_MAIN = "android.intent.action.MAIN"
    const val CATEGORY_LAUNCHER = "android.intent.category.LAUNCHER"

    fun strip(document: Document) {
        val downloader = named(document, "activity", DOWNLOADER_ACTIVITY).singleOrNull()
            ?: throw PatchException("AndroidManifest.xml has no DownloaderActivity")
        val service = named(document, "service", DOWNLOADER_SERVICE).singleOrNull()
            ?: throw PatchException("AndroidManifest.xml has no GDownloaderService")
        val alarm = named(document, "receiver", ALARM_RECEIVER).singleOrNull()
            ?: throw PatchException("AndroidManifest.xml has no expansion AlarmReceiver")
        val launcher = named(document, "activity", UNITY_LAUNCHER).singleOrNull()
            ?: throw PatchException("AndroidManifest.xml has no UnityLauncherActivity")

        if (hasLauncherFilter(launcher)) {
            throw PatchException("UnityLauncherActivity already has MAIN/LAUNCHER")
        }
        val filter = launcherFilter(downloader)
            ?: throw PatchException("DownloaderActivity is not the launcher")

        launcher.appendChild(filter)
        downloader.parentNode.removeChild(downloader)
        service.parentNode.removeChild(service)
        alarm.parentNode.removeChild(alarm)
    }

    private fun named(document: Document, tag: String, name: String): List<Element> {
        val list = document.getElementsByTagName(tag)
        return (0 until list.length).map { list.item(it) as Element }
            .filter { it.getAttribute("android:name") == name }
    }

    private fun launcherFilter(activity: Element): Element? {
        val filters = childElements(activity, "intent-filter")
        val matches = filters.filter(::isLauncherFilter)
        return matches.singleOrNull()
    }

    private fun hasLauncherFilter(activity: Element) =
        childElements(activity, "intent-filter").any(::isLauncherFilter)

    private fun isLauncherFilter(filter: Element): Boolean {
        val actions = childElements(filter, "action").map { it.getAttribute("android:name") }
        val categories = childElements(filter, "category").map { it.getAttribute("android:name") }
        return ACTION_MAIN in actions && CATEGORY_LAUNCHER in categories
    }

    private fun childElements(parent: Element, tag: String): List<Element> {
        val list = parent.childNodes
        return (0 until list.length).mapNotNull { i ->
            val node = list.item(i)
            if (node is Element && node.tagName == tag) node else null
        }
    }
}
