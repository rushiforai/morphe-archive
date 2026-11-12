/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.VideoDetails;

public class DownloadedModelsTest {
    private static final String SONG = "dQw4w9WgXcQ";
    private static final String OTHER = "9bZkp7q19f0";

    /** Shaped like Music's row wrapper: the protobuf next to unrelated state. */
    private static final class RowWrapper {
        private final VideoDetails proto;
        private final Object state = new Object();
        private final String label = "state";

        RowWrapper(VideoDetails proto) {
            this.proto = proto;
        }
    }

    private static class BaseWrapper {
        private final VideoDetails inherited;

        BaseWrapper(VideoDetails inherited) {
            this.inherited = inherited;
        }
    }

    private static final class DerivedWrapper extends BaseWrapper {
        private final VideoDetails own;

        DerivedWrapper(VideoDetails inherited, VideoDetails own) {
            super(inherited);
            this.own = own;
        }
    }

    private static VideoDetails details(String videoId) {
        return VideoDetails.newBuilder().setVideoId(videoId).setTitle("A title").build();
    }

    @Test public void aProtobufModelSerializesAsItself() {
        VideoDetails model = details(SONG);

        assertArrayEquals(model.toByteArray(), DownloadedModels.serialize(model));
    }

    @Test public void aWrapperSerializesTheProtobufItHolds() {
        byte[] bytes = DownloadedModels.serialize(new RowWrapper(details(SONG)));

        assertNotNull(bytes);
        assertEquals(Collections.singletonList(SONG), DownloadedRegistry.candidateIds(bytes, 5));
    }

    @Test public void aWrapperIsMatchedLikeAnyOtherModel() {
        DownloadedRegistry registry = new DownloadedRegistry();
        registry.addAll(Collections.singletonList(SONG));

        assertEquals(SONG, registry.findDownloaded(DownloadedModels.serialize(new RowWrapper(details(SONG)))));
        assertNull(registry.findDownloaded(DownloadedModels.serialize(new RowWrapper(details(OTHER)))));
    }

    @Test public void protobufFieldsOfSuperclassesCount() {
        byte[] bytes = DownloadedModels.serialize(new DerivedWrapper(details(OTHER), details(SONG)));

        assertNotNull(bytes);
        assertEquals(Arrays.asList(SONG, OTHER), DownloadedRegistry.candidateIds(bytes, 5));
    }

    @Test public void modelsWithoutProtobufAreNotSerialized() {
        assertNull(DownloadedModels.serialize(null));
        assertNull(DownloadedModels.serialize("a plain string"));
        assertNull(DownloadedModels.serialize(new Object()));
        assertNull(DownloadedModels.serialize(new RowWrapper(null)));
    }
}
