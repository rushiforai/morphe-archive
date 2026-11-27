package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class AudioStreamTest {
    private static ProtoWire format(int itag, String mime, String url, long bitrate, long length) {
        ProtoWire f = new ProtoWire().setVarint(1, itag).setString(5, mime).setVarint(6, bitrate);
        if (url != null) f.setString(2, url);
        if (length > 0) f.setVarint(12, length);
        return f;
    }

    private static byte[] response(ProtoWire... formats) {
        ProtoWire streaming = new ProtoWire();
        for (ProtoWire f : formats) streaming.addMessage(3, f);
        return new ProtoWire().setMessage(4, streaming).toBytes();
    }

    @Test
    public void picksTheHighestBitrateAudioWithAUrl() {
        AudioStream.Pick p = AudioStream.best(response(
                format(137, "video/mp4", "v", 4_000_000, 9_000_000),
                format(140, "audio/mp4; codecs=\"mp4a.40.2\"", "a140", 130_000, 3_000_000),
                format(251, "audio/webm; codecs=\"opus\"", "a251", 150_000, 3_200_000),
                format(774, "audio/webm; codecs=\"opus\"", null, 260_000, 6_000_000))); // ciphered: no url
        assertEquals(251, p.itag);
        assertEquals("a251", p.url);
        assertEquals(3_200_000, p.length);
    }

    @Test
    public void noAudioNoPick() {
        assertNull(AudioStream.best(response(format(137, "video/mp4", "v", 4_000_000, 9_000_000))));
        assertNull(AudioStream.best(response(format(140, "audio/mp4", "a", 130_000, 0)))); // no length
        assertNull(AudioStream.best(new byte[0]));
    }
}
