package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class ArtistArtTest {

    @Test
    public void cleanKeepsTheArtistOfYtsSubtitle() {
        assertEquals("Sabrina Carpenter", ArtistArt.clean("Sabrina Carpenter • Short n' Sweet • 2024"));
        assertEquals("Sabrina Carpenter", ArtistArt.clean("Sabrina Carpenter"));
    }

    @Test
    public void cleanDropsTopic() {
        assertEquals("Adele", ArtistArt.clean("Adele - Topic"));
        assertEquals("Adele", ArtistArt.clean("Adele - topic • 25 • 2015"));
    }

    @Test
    public void cleanTakesTheFirstOfSeveralArtists() {
        assertEquals("The Weeknd", ArtistArt.clean("The Weeknd, Lily Rose Depp & Ramsey"));
        assertEquals("Dua Lipa", ArtistArt.clean("Dua Lipa & Elton John"));
        assertEquals("Calvin Harris", ArtistArt.clean("Calvin Harris feat. Rihanna"));
        assertEquals("Calvin Harris", ArtistArt.clean("Calvin Harris ft Rihanna"));
        assertEquals("Fred again..", ArtistArt.clean("Fred again.. x Skrillex"));
    }

    @Test
    public void nameKeepsTheWholeCredit() {
        assertEquals("Earth, Wind & Fire", ArtistArt.name("Earth, Wind & Fire • Gratitude • 1975"));
        assertEquals("Lil Nas X & Jack Harlow", ArtistArt.name("Lil Nas X & Jack Harlow - Topic"));
        assertEquals("Earth", ArtistArt.clean("Earth, Wind & Fire • Gratitude • 1975"));
        assertEquals("", ArtistArt.name(""));
    }

    @Test
    public void cleanOfNothingIsEmpty() {
        assertEquals("", ArtistArt.clean(""));
        assertEquals("", ArtistArt.clean("  "));
    }
}
