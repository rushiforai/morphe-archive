package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

/** Export: a song's "Artist - Title" as a file name any folder takes. */
public class ExportNameTest {
    @Test
    public void unsafeCharactersGo() {
        assertEquals("AC_DC - Back In Black", ExportDownloadsPreference.fileName("AC/DC - Back In Black"));
        assertEquals("What_ - Who_ _ Why_", ExportDownloadsPreference.fileName("What? - Who* | Why\""));
        assertEquals("song", ExportDownloadsPreference.fileName("  "));
        assertEquals(150, ExportDownloadsPreference.fileName(new String(new char[300]).replace('\0', 'a')).length());
    }
}
