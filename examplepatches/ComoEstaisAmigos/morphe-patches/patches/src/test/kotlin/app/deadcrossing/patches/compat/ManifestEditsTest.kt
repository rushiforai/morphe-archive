package app.deadcrossing.patches.compat

import app.deadcrossing.patches.mono.TELEMETRY_ACTIVITIES
import app.adebisi.patches.shared.namedElements
import app.adebisi.patches.shared.parseManifestXml
import app.adebisi.patches.shared.removeActivities
import app.adebisi.patches.shared.removeMetaData
import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class ManifestEditsTest {
    @Test
    fun `Youmi and telemetry activities drop and IAP stays`() {
        val document = parseManifestXml(STOCK)
        removeActivities(document, listOf(YOUMI_ACTIVITY) + TELEMETRY_ACTIVITIES.take(2))
        removeMetaData(document, YOUMI_META_KEYS)
        assertEquals(0, namedElements(document, "activity", listOf(YOUMI_ACTIVITY)).size)
        assertEquals(0, namedElements(document, "activity", TELEMETRY_ACTIVITIES.take(2)).size)
        assertEquals(0, namedElements(document, "meta-data", YOUMI_META_KEYS).size)
        assertEquals(1, namedElements(document, "activity", listOf("com.feelingtouch.unityandroid.UnityAndroidActivity")).size)
        assertEquals(1, namedElements(document, "meta-data", listOf("IAP_KEY")).size)
    }

    @Test
    fun `a missing Youmi activity is refused`() {
        assertFailsWith<PatchException> {
            removeActivities(parseManifestXml(NO_YOUMI), listOf(YOUMI_ACTIVITY))
        }
    }

    private companion object {
        const val STOCK = """
            <manifest package="com.feelingtouch.crossx">
              <application>
                <activity android:name="net.youmi.android.appoffers.YoumiOffersActivity"/>
                <activity android:name="com.aarki.AarkiOfferActivity"/>
                <activity android:name="com.apsalar.sdk.Activity"/>
                <activity android:name="com.feelingtouch.unityandroid.UnityAndroidActivity"/>
                <meta-data android:name="YOUMI_APP_ID" android:value="dead"/>
                <meta-data android:name="YOUMI_PASSWORD" android:value="dead"/>
                <meta-data android:name="IAP_KEY" android:value="keep"/>
              </application>
            </manifest>
        """
        const val NO_YOUMI = """
            <manifest package="com.feelingtouch.crossx">
              <application>
                <activity android:name="com.feelingtouch.unityandroid.UnityAndroidActivity"/>
              </application>
            </manifest>
        """
    }
}
