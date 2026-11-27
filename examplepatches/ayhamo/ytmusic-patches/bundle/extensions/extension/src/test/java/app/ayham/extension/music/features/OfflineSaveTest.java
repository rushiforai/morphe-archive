package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class OfflineSaveTest {
    @Test
    public void aSavedSongIsNamedByItsVideoDetails() {
        byte[] saved = new ProtoWire()
                .setMessage(11, new ProtoWire().setString(1, "bi7ad9Kk62o"))
                .setMessage(14, new ProtoWire().setVarint(5, 3))
                .toBytes();
        assertEquals("bi7ad9Kk62o", OfflineSave.savedVideoId(saved));
    }

    @Test
    public void aResponseWithoutAnOfflineStateIsNotASave() {
        byte[] played = new ProtoWire().setMessage(11, new ProtoWire().setString(1, "bi7ad9Kk62o")).toBytes();
        assertNull(OfflineSave.savedVideoId(played));
        assertNull(OfflineSave.savedVideoId(new ProtoWire().setMessage(14, new ProtoWire()).toBytes()));
    }
}
