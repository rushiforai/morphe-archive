package app.morphe.patches.tiktok.misc.theme

import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Document

/**
 * AMOLED rewrites resources, and on an APK merged from a split bundle Morphe's rewrite loses
 * about 1,400 resource files and TikTok crashes at launch, so the patch refuses such an APK.
 */
class AmoledMergedBundleTest {
    @Test
    fun `a whole APK keeps Play's splits meta-data and is patched`() {
        val manifest = parse(
            """
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.zhiliaoapp.musically">
              <application>
                <meta-data android:name="com.android.stamp.type" android:value="STAMP_TYPE_STANDALONE_APK"/>
                <meta-data android:name="com.android.vending.splits" android:resource="@xml/splits0"/>
              </application>
            </manifest>
            """.trimIndent(),
        )
        assertFalse(isMergedSplitBundle(manifest))
    }

    @Test
    fun `a merged bundle has lost that meta-data and is refused`() {
        // 46.7.3 and 46.8.3 carry no stamp at all and are whole APKs, so the stamp is not the tell.
        val manifest = parse(
            """
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.zhiliaoapp.musically">
              <application>
                <meta-data android:name="com.android.vending.derived.apk.id" android:value="1"/>
              </application>
            </manifest>
            """.trimIndent(),
        )
        assertTrue(isMergedSplitBundle(manifest))
        assertTrue(MERGED_BUNDLE_REFUSAL.contains("Nothing was changed"))
    }

    private fun parse(xml: String): Document =
        DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
            .newDocumentBuilder().parse(ByteArrayInputStream(xml.toByteArray()))
}
