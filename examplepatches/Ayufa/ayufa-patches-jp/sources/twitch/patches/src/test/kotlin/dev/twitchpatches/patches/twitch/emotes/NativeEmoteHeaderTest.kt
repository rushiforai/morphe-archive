package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.patch.PatchException
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Test

class NativeEmoteHeaderTest {
    private fun header(image: String = "tv.twitch.android.shared.ui.elements.image.SquareNetworkImageWidget",
        provider: String = "TextView", extra: String = "") = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
        ByteArrayInputStream(("<Scroll xmlns:android='http://schemas.android.com/apk/res/android'><FrameLayout>" +
            "<androidx.constraintlayout.widget.ConstraintLayout android:id='@id/emote_card_loaded_content'>" +
            "<$image android:id='@id/emote_icon'/><TextView android:id='@id/emote_name'/>" +
            "<$provider android:id='@id/emote_desc'/>$extra</androidx.constraintlayout.widget.ConstraintLayout>" +
            "</FrameLayout></Scroll>").toByteArray()))

    @Test fun acceptsOriginalHeaderWithUnrelatedActions() {
        validateNativeEmoteHeader(header(extra = "<Button android:id='@id/purchase'/>"))
    }
    @Test(expected = PatchException::class) fun rejectsChangedImageContract() {
        validateNativeEmoteHeader(header(image = "View"))
    }
    @Test(expected = PatchException::class) fun rejectsNonTextProvider() {
        validateNativeEmoteHeader(header(provider = "ImageView"))
    }
    @Test(expected = PatchException::class) fun rejectsDuplicateName() {
        validateNativeEmoteHeader(header(extra = "<TextView android:id='@id/emote_name'/>"))
    }
}
