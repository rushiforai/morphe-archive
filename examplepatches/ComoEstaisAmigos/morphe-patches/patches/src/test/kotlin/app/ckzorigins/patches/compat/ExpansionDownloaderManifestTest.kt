package app.ckzorigins.patches.compat

import app.adebisi.patches.shared.namedElements
import app.adebisi.patches.shared.parseManifestXml
import org.w3c.dom.Element
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class ExpansionDownloaderManifestTest {
    @Test
    fun `the launcher moves to Unity and the downloader components are gone`() {
        val document = parseManifestXml(STOCK)
        ExpansionDownloaderManifest.strip(document)

        assertEquals(0, namedElements(document, "activity", listOf(ExpansionDownloaderManifest.DOWNLOADER_ACTIVITY)).size)
        assertEquals(0, namedElements(document, "service", listOf(ExpansionDownloaderManifest.DOWNLOADER_SERVICE)).size)
        assertEquals(0, namedElements(document, "receiver", listOf(ExpansionDownloaderManifest.ALARM_RECEIVER)).size)

        val launcher = namedElements(document, "activity", listOf(ExpansionDownloaderManifest.UNITY_LAUNCHER)).single()
        assertTrue(hasLauncher(launcher))
        assertEquals("2", launcher.getAttribute("android:launchMode"))
        assertEquals(1, namedElements(document, "activity", listOf("com.unity3d.player.VideoPlayer")).size)
        assertEquals(1, namedElements(document, "receiver", listOf("com.flurry.android.InstallReceiver")).size)
    }

    @Test
    fun `a manifest without the downloader activity is refused`() {
        assertFailsWith<app.morphe.patcher.patch.PatchException> {
            ExpansionDownloaderManifest.strip(parseManifestXml(NO_DOWNLOADER))
        }
    }

    @Test
    fun `a Unity launcher that already has MAIN is refused`() {
        assertFailsWith<app.morphe.patcher.patch.PatchException> {
            ExpansionDownloaderManifest.strip(parseManifestXml(ALREADY_LAUNCHER))
        }
    }

    @Test
    fun `kept expansion types are Helpers and its log, and the emptied count matches stock`() {
        assertEquals(
            setOf(
                "Lcom/google/android/vending/expansion/downloader/Helpers;",
                "Lcom/google/android/vending/expansion/downloader/Helpers\$Log;",
            ),
            KEPT_EXPANSION_TYPES,
        )
        assertEquals(64, EMPTIED_EXPANSION_CLASSES)
        assertTrue(KEPT_EXPANSION_TYPES.all { it.startsWith(EXPANSION_PREFIX) })
    }

    private fun hasLauncher(activity: Element): Boolean {
        val filters = (0 until activity.childNodes.length).mapNotNull { i ->
            val node = activity.childNodes.item(i)
            if (node is Element && node.tagName == "intent-filter") node else null
        }
        return filters.any { filter ->
            val actions = childNames(filter, "action")
            val categories = childNames(filter, "category")
            ExpansionDownloaderManifest.ACTION_MAIN in actions &&
                ExpansionDownloaderManifest.CATEGORY_LAUNCHER in categories
        }
    }

    private fun childNames(parent: Element, tag: String): List<String> {
        val list = parent.childNodes
        return (0 until list.length).mapNotNull { i ->
            val node = list.item(i)
            if (node is Element && node.tagName == tag) node.getAttribute("android:name") else null
        }
    }

    private companion object {
        const val STOCK = """
            <manifest package="com.glu.ckzombies2">
              <application android:label="@string/app_name">
                <activity android:name="com.google.android.vending.expansion.downloader_impl.DownloaderActivity"
                    android:screenOrientation="0">
                  <intent-filter>
                    <action android:name="android.intent.action.MAIN"/>
                    <category android:name="android.intent.category.LAUNCHER"/>
                  </intent-filter>
                </activity>
                <activity android:name="com.glu.plugins.AUnityInstaller.UnityLauncherActivity"
                    android:launchMode="2"/>
                <activity android:name="com.unity3d.player.VideoPlayer"/>
                <service android:name="com.google.android.vending.expansion.downloader_impl.GDownloaderService"/>
                <receiver android:name="com.google.android.vending.expansion.downloader_impl.AlarmReceiver"/>
                <receiver android:name="com.flurry.android.InstallReceiver"/>
              </application>
            </manifest>
        """
        const val NO_DOWNLOADER = """
            <manifest package="com.glu.ckzombies2">
              <application>
                <activity android:name="com.glu.plugins.AUnityInstaller.UnityLauncherActivity"/>
                <service android:name="com.google.android.vending.expansion.downloader_impl.GDownloaderService"/>
                <receiver android:name="com.google.android.vending.expansion.downloader_impl.AlarmReceiver"/>
              </application>
            </manifest>
        """
        const val ALREADY_LAUNCHER = """
            <manifest package="com.glu.ckzombies2">
              <application>
                <activity android:name="com.google.android.vending.expansion.downloader_impl.DownloaderActivity">
                  <intent-filter>
                    <action android:name="android.intent.action.MAIN"/>
                    <category android:name="android.intent.category.LAUNCHER"/>
                  </intent-filter>
                </activity>
                <activity android:name="com.glu.plugins.AUnityInstaller.UnityLauncherActivity">
                  <intent-filter>
                    <action android:name="android.intent.action.MAIN"/>
                    <category android:name="android.intent.category.LAUNCHER"/>
                  </intent-filter>
                </activity>
                <service android:name="com.google.android.vending.expansion.downloader_impl.GDownloaderService"/>
                <receiver android:name="com.google.android.vending.expansion.downloader_impl.AlarmReceiver"/>
              </application>
            </manifest>
        """
    }
}
