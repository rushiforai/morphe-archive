package io.github.sabopura.morphe.patches.twitch.ui

import app.morphe.patcher.patch.PatchException
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test
import org.w3c.dom.Document
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory

class PlayerMenuButtonTest {
    private fun layout(views: String): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
        """<ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
            xmlns:app="http://schemas.android.com/apk/res-auto">$views</ConstraintLayout>""".byteInputStream(),
    )

    private fun Document.view(id: String): Element {
        val nodes = getElementsByTagName("*")
        return (0 until nodes.length).map { nodes.item(it) as Element }
            .single { it.getAttribute("android:id").substringAfter('/') == id }
    }

    private fun Document.order() = documentElement.childNodes.let { nodes ->
        (0 until nodes.length).mapNotNull { (nodes.item(it) as? Element)?.getAttribute("android:id")?.substringAfter('/') }
    }

    private val share = """android:layout_width="@dimen/size" android:layout_height="@dimen/size"
        android:padding="@dimen/pad" app:layout_constraintTop_toTopOf="parent""""

    /** The live player's controls: each button only points at the one to its right. */
    @Test fun sitsLeftOfShareAndTakesTheCastButtonsPlace() {
        val document = layout("""
            <MediaRouteButton android:id="@id/cast_button" app:layout_constraintEnd_toStartOf="@id/share_button"/>
            <ImageView android:id="@id/share_button" $share app:layout_constraintEnd_toStartOf="@id/settings_button"/>
            <ImageView android:id="@id/settings_button"/>
        """)
        addPlayerMenuButton(document, "live")
        val button = document.view("sabopura_player_menu")
        assertEquals(listOf("cast_button", "sabopura_player_menu", "share_button", "settings_button"), document.order())
        assertEquals("sabopura_player_menu", document.view("cast_button").getAttribute("app:layout_constraintEnd_toStartOf").substringAfter('/'))
        assertEquals("share_button", button.getAttribute("app:layout_constraintEnd_toStartOf").substringAfter('/'))
        assertEquals("", button.getAttribute("app:layout_constraintStart_toEndOf"))
        assertEquals("@dimen/size", button.getAttribute("android:layout_width"))
        assertEquals("@dimen/pad", button.getAttribute("android:padding"))
    }

    /** The VOD and clip player's controls are a chain: every button points both ways. */
    @Test fun joinsAChainInBothDirections() {
        val document = layout("""
            <MediaRouteButton android:id="@id/media_route_button" app:layout_constraintEnd_toStartOf="@id/share_button"/>
            <ImageView android:id="@id/share_button" $share app:layout_constraintStart_toEndOf="@id/media_route_button"
                app:layout_constraintEnd_toStartOf="@id/settings_button"/>
            <ImageView android:id="@id/settings_button" app:layout_constraintStart_toEndOf="@id/share_button"/>
        """)
        addPlayerMenuButton(document, "vod")
        val button = document.view("sabopura_player_menu")
        assertEquals("media_route_button", button.getAttribute("app:layout_constraintStart_toEndOf").substringAfter('/'))
        assertEquals("share_button", button.getAttribute("app:layout_constraintEnd_toStartOf").substringAfter('/'))
        assertEquals("sabopura_player_menu",
            document.view("share_button").getAttribute("app:layout_constraintStart_toEndOf").substringAfter('/'))
        assertEquals("sabopura_player_menu",
            document.view("media_route_button").getAttribute("app:layout_constraintEnd_toStartOf").substringAfter('/'))
        assertEquals("share_button", document.view("settings_button").getAttribute("app:layout_constraintStart_toEndOf").substringAfter('/'))
    }

    @Test fun addsTheButtonOnce() {
        val document = layout("""<ImageView android:id="@id/share_button" $share/>""")
        addPlayerMenuButton(document, "live")
        addPlayerMenuButton(document, "live")
        assertEquals(listOf("sabopura_player_menu", "share_button"), document.order())
    }

    @Test fun aLayoutWithoutShareIsReported() {
        assertThrows(PatchException::class.java) { addPlayerMenuButton(layout("""<ImageView android:id="@id/other"/>"""), "live") }
    }
}
