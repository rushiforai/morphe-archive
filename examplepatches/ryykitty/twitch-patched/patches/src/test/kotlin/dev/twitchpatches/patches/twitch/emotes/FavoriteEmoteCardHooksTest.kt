package dev.twitchpatches.patches.twitch.emotes

import dev.twitchpatches.patches.twitch.shared.parseResourceXml
import org.junit.Assert.*
import org.junit.Test
import org.w3c.dom.Document
import org.w3c.dom.Element

class FavoriteEmoteCardHooksTest {
    private val layout = """
        <androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
            xmlns:app="http://schemas.android.com/apk/res-auto">
            <ImageView android:id="@id/emote_icon"/>
            <TextView android:id="@id/emote_name" app:layout_constraintEnd_toEndOf="parent"/>
            <LinearLayout android:id="@id/subscribe_button">
                <ImageView android:id="@id/subscribe_button_icon" app:srcCompat="@drawable/star_selector" app:tint="@color/star"
                    android:contentDescription="@string/subscribe" android:layout_marginStart="@dimen/margin"/>
                <TextView android:id="@id/subscribe_button_text"/>
            </LinearLayout>
        </androidx.constraintlayout.widget.ConstraintLayout>
    """

    private fun element(document: Document, id: String): Element {
        val nodes = document.getElementsByTagName("*")
        return (0 until nodes.length).map { nodes.item(it) as Element }.single { it.getAttribute("android:id") == id }
    }

    @Test fun placesTheStarAtTheEndOfTheHeaderBesideTheEmote() {
        val document = parseResourceXml(layout)
        insertFavoriteEmoteStar(document)
        val star = element(document, "@+id/twitch_patches_favorite_emote_star")
        assertEquals("gone", star.getAttribute("android:visibility"))
        assertEquals("parent", star.getAttribute("app:layout_constraintEnd_toEndOf"))
        assertEquals("@id/emote_icon", star.getAttribute("app:layout_constraintTop_toTopOf"))
        assertEquals("@id/emote_icon", star.getAttribute("app:layout_constraintBottom_toBottomOf"))
        assertEquals(element(document, "@id/emote_name").parentNode, star.parentNode)
    }

    @Test fun theEmoteNameEndsAtTheStarSoItCannotOverlap() {
        val document = parseResourceXml(layout)
        insertFavoriteEmoteStar(document)
        val name = element(document, "@id/emote_name")
        assertEquals("@id/twitch_patches_favorite_emote_star", name.getAttribute("app:layout_constraintEnd_toStartOf"))
        assertFalse(name.hasAttribute("app:layout_constraintEnd_toEndOf"))
    }

    @Test fun theStarUsesTwitchsSubscribeSelectorWithoutItsLabelOrMargin() {
        val document = parseResourceXml(layout)
        insertFavoriteEmoteStar(document)
        val star = element(document, "@+id/twitch_patches_favorite_emote_star")
        assertEquals("@drawable/star_selector", star.getAttribute("app:srcCompat"))
        assertEquals("@color/star", star.getAttribute("app:tint"))
        assertFalse(star.hasAttribute("android:contentDescription"))
        assertFalse(star.hasAttribute("android:layout_marginStart"))
    }

    @Test fun failsClearlyWhenTheCardLayoutChanges() {
        val changed = parseResourceXml("""<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"><LinearLayout/></FrameLayout>""")
        assertThrows(Exception::class.java) { insertFavoriteEmoteStar(changed) }
    }
}
