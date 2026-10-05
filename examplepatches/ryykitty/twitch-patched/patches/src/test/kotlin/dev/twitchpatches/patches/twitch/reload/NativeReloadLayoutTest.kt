package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.patch.PatchException
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Test
import org.w3c.dom.Element

class NativeReloadLayoutTest {
    private fun layout(body: String) = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
        ByteArrayInputStream(("<Layout xmlns:android='http://schemas.android.com/apk/res/android' " +
            "xmlns:app='http://schemas.android.com/apk/res-auto'>$body</Layout>").toByteArray()))

    @Test fun constraintChainKeepsRotationAndAddsVolumeSibling() {
        val document = layout("<ImageView android:id='@id/mute_button' android:padding='@dimen/control_padding' " +
            "app:layout_constraintEnd_toStartOf='@id/fullscreen_button'/><ImageView android:id='@id/fullscreen_button'/>")
        insertNativeReloadLayout(document, true)
        val nodes = document.getElementsByTagName("ImageView")
        val volume = nodes.item(0) as Element
        val reload = nodes.item(1) as Element
        val rotation = nodes.item(2) as Element
        assertEquals("@id/$RELOAD_VIEW_TAG", volume.getAttribute("app:layout_constraintEnd_toStartOf"))
        assertEquals("@id/fullscreen_button", reload.getAttribute("app:layout_constraintEnd_toStartOf"))
        assertEquals("@id/fullscreen_button", rotation.getAttribute("android:id"))
        assertEquals("@dimen/control_padding", reload.getAttribute("android:padding"))
        assertEquals("gone", reload.getAttribute("android:visibility"))
    }

    @Test fun linearLayoutPreservesOrderAndInsets() {
        val document = layout("<ImageView android:id='@id/mute_button' android:layout_marginLeft='@dimen/control_gap'/>" +
            "<ImageView android:id='@id/rotate_button'/>")
        insertNativeReloadLayout(document, false)
        val reload = document.getElementsByTagName("ImageView").item(1) as Element
        assertEquals(RELOAD_VIEW_TAG, reload.getAttribute("android:tag"))
        assertEquals("@dimen/control_gap", reload.getAttribute("android:layout_marginLeft"))
    }

    @Test(expected = PatchException::class) fun rejectsAmbiguousVolume() {
        insertNativeReloadLayout(layout("<ImageView android:id='@id/mute_button'/><ImageView android:id='@id/mute_button'/>"), false)
    }

    @Test(expected = PatchException::class) fun rejectsChangedConstraintAnchor() {
        insertNativeReloadLayout(layout("<ImageView android:id='@id/mute_button' app:layout_constraintEnd_toStartOf='parent'/>"), true)
    }
}
