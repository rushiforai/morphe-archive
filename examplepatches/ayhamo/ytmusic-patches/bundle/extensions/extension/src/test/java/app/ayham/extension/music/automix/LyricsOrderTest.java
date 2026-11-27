package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;

/** The user's PC extension lyrics order, in Morphe's provider ids (SungLyrics.PC_ORDER). */
public class LyricsOrderTest {
    @Test
    public void theOrderIsThePcExtensionsList() {
        List<String> on = new ArrayList<>(), off = new ArrayList<>();
        for (String t : SungLyrics.PC_ORDER.split(",")) {
            if (t.isEmpty()) continue;
            if (t.startsWith("-")) off.add(t.substring(1));
            else on.add(t);
        }
        assertEquals(Arrays.asList("LrcRed", "Unison", "bLyrics", "BiniLyrics", "Musixmatch", "LRCLIB", "Apple",
                "SimpMusic", "Captions", "Spotify", "Genius"), on);
        assertEquals(Arrays.asList("YTMusic", "QQ", "NetEase", "KuGou", "Luna", "PetitLyrics", "AMLL", "LunaBeat", "Lyricify",
                "Deezer", "RMM"), off);
    }
}
