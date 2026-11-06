package dev.twitchpatches.patches.twitch.ui

import dev.twitchpatches.patches.twitch.shared.parseResourceXml
import org.junit.Assert.*
import org.junit.Test
import org.w3c.dom.Element

class UiViewResourcesTest {
    @Test fun customViewsRetainIdsConstraintsVisibilityAndChildren() {
        val source = """
            <LinearLayout xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto">
                <FrameLayout android:id="@id/subscribe" android:visibility="gone" android:layout_width="0dp"
                    android:layout_weight="1" app:layout_constraintEnd_toEndOf="parent"><TextView android:text="Subscribe"/></FrameLayout>
                <ImageView android:id="@id/follow"/>
            </LinearLayout>
        """
        val types = mutableMapOf<String, String>()
        val document = parseResourceXml(rewriteUiLayout(source, mapOf("subscribe" to "classic_support_hide_subscribe"), types, "fixture"))
        val node = document.getElementsByTagName("dev.twitchpatches.extension.ui.views.FrameLayout").item(0) as Element
        assertEquals("@id/subscribe", node.getAttribute("android:id"))
        assertEquals("gone", node.getAttribute("android:visibility"))
        assertEquals("0dp", node.getAttribute("android:layout_width"))
        assertEquals("1", node.getAttribute("android:layout_weight"))
        assertEquals("parent", node.getAttribute("app:layout_constraintEnd_toEndOf"))
        assertEquals("twitchpatches_ui:classic_support_hide_subscribe", node.getAttribute("android:tag"))
        assertEquals(1, node.getElementsByTagName("TextView").length)
        assertEquals(1, document.getElementsByTagName("ImageView").length)
        assertEquals("android.widget.FrameLayout", types.values.single())
    }

    @Test fun missingAndDuplicateControlsFailBeforeBindingTheWrongElement() {
        val source = "<LinearLayout xmlns:android='http://schemas.android.com/apk/res/android'><ImageView android:id='@id/cast'/><ImageView android:id='@id/cast'/></LinearLayout>"
        for (id in listOf("cast", "missing")) assertThrows(Exception::class.java) {
            rewriteUiLayout(source, mapOf(id to "classic_controls_hide_cast"), mutableMapOf(), "fixture")
        }
    }

    @Test fun extensionHidingKeepsTheOriginalHeaderAndDivider() {
        val source = """
            <LinearLayout xmlns:android="http://schemas.android.com/apk/res/android" android:layout_height="wrap_content">
                <LinearLayout android:id="@id/header_container" android:layout_height="@dimen/header_height">
                    <FrameLayout android:id="@id/extension_button_container"/>
                </LinearLayout><View android:layout_height="1dp"/>
            </LinearLayout>
        """
        val types = mutableMapOf<String, String>()
        val child = rewriteUiLayout(source, mapOf("extension_button_container" to "hide_channel_extensions"), types, "chat_header")
        val result = parseResourceXml(child)
        assertEquals("LinearLayout", result.documentElement.tagName)
        assertFalse(result.documentElement.hasAttribute("android:tag"))
        assertEquals(1, result.getElementsByTagName("View").length)
        assertEquals("android.widget.FrameLayout", types.values.single())
    }

    @Test fun standaloneExtensionIconKeepsItsOverflowLabelInsideTheHiddenRoot() {
        val source = "<FrameLayout xmlns:android='http://schemas.android.com/apk/res/android'><TextView android:id='@id/more_extension_text'/></FrameLayout>"
        val result = parseResourceXml(rewriteUiRoot(source, "hide_channel_extensions", "FrameLayout", mutableMapOf(), "icon"))
        assertEquals("dev.twitchpatches.extension.ui.views.FrameLayout", result.documentElement.tagName)
        assertEquals("twitchpatches_ui:hide_channel_extensions", result.documentElement.getAttribute("android:tag"))
        assertEquals(1, result.getElementsByTagName("TextView").length)
    }
}
