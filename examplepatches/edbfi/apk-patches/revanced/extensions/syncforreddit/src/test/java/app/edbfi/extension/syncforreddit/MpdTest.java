// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import static org.junit.Assert.assertEquals;

import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import javax.xml.parsers.DocumentBuilderFactory;
import org.junit.Test;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class MpdTest {
    private static List<Boolean> audioSets(String mpd) throws Exception {
        NodeList sets = DocumentBuilderFactory.newInstance().newDocumentBuilder()
                .parse(new ByteArrayInputStream(mpd.getBytes(StandardCharsets.UTF_8)))
                .getElementsByTagName("AdaptationSet");
        List<Boolean> result = new ArrayList<>();
        for (int i = 0; i < sets.getLength(); i++) result.add(Mpd.isAudio((Element) sets.item(i)));
        return result;
    }

    // The shape v.redd.it serves today: the audio files no longer have "audio" in lowercase.
    @Test
    public void readsContentType() throws Exception {
        String mpd = "<MPD><Period>"
                + "<AdaptationSet contentType=\"video\"><Representation bandwidth=\"1\"><BaseURL>CMAF_720.mp4</BaseURL>"
                + "</Representation></AdaptationSet>"
                + "<AdaptationSet contentType=\"audio\"><Representation bandwidth=\"1\"><BaseURL>CMAF_AUDIO_128.mp4</BaseURL>"
                + "</Representation></AdaptationSet>"
                + "</Period></MPD>";
        assertEquals(List.of(false, true), audioSets(mpd));
    }

    @Test
    public void readsMimeTypes() throws Exception {
        String mpd = "<MPD><Period>"
                + "<AdaptationSet mimeType=\"audio/mp4\"><Representation><BaseURL>a.mp4</BaseURL></Representation></AdaptationSet>"
                + "<AdaptationSet><Representation mimeType=\"video/mp4\"><BaseURL>audio_named.mp4</BaseURL></Representation>"
                + "</AdaptationSet>"
                + "</Period></MPD>";
        assertEquals(List.of(true, false), audioSets(mpd));
    }

    @Test
    public void fallsBackToFileNames() throws Exception {
        String mpd = "<MPD><Period>"
                + "<AdaptationSet><Representation><BaseURL>DASH_720.mp4</BaseURL></Representation></AdaptationSet>"
                + "<AdaptationSet><Representation><BaseURL>DASH_audio.mp4</BaseURL></Representation></AdaptationSet>"
                + "</Period></MPD>";
        assertEquals(List.of(false, true), audioSets(mpd));
    }
}
