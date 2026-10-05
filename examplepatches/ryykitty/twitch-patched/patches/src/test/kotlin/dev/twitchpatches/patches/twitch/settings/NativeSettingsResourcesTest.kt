package dev.twitchpatches.patches.twitch.settings

import app.morphe.patcher.patch.PatchException
import org.junit.Assert.assertThrows
import org.junit.Test

class NativeSettingsResourcesTest {
    private fun layout(body: String): String =
        """<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android">$body</LinearLayout>"""

    @Test fun `accepts one typed view and native include`() {
        validateSettingsLayout(layout("""<TextView android:id="@+id/title"/><include layout="@layout/footer"/>"""),
            mapOf("title" to "TextView"), setOf("footer"))
    }

    @Test fun `rejects missing duplicate or changed view type`() {
        for (body in listOf("", """<TextView android:id="@id/title"/><TextView android:id="@id/title"/>""",
            """<ImageView android:id="@id/title"/>""")) {
            assertThrows(PatchException::class.java) {
                validateSettingsLayout(layout(body), mapOf("title" to "TextView"))
            }
        }
    }

    @Test fun `rejects missing or duplicated include`() {
        for (body in listOf("", """<include layout="@layout/footer"/><include layout="@layout/footer"/>""")) {
            assertThrows(PatchException::class.java) { validateSettingsLayout(layout(body), emptyMap(), setOf("footer")) }
        }
    }

    @Test fun `does not confuse resources with identical names across types`() {
        val source = """<resources><public type="color" name="shared"/></resources>"""
        validateSettingsSymbols(source, setOf("color" to "shared"))
        assertThrows(PatchException::class.java) { validateSettingsSymbols(source, setOf("font" to "shared")) }
    }
}
