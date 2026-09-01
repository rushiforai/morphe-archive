package com.drew.metadata.mp4.media;

import com.drew.lang.SequentialReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.mp4.Mp4Context;
import com.drew.metadata.mp4.Mp4Directory;
import com.drew.metadata.mp4.Mp4MediaHandler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Mp4MetaHandler extends Mp4MediaHandler<Mp4MetaDirectory> {
    public Mp4MetaHandler(Metadata metadata, Mp4Context mp4Context) {
        super(metadata, mp4Context);
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final Mp4Directory getDirectory() {
        return new Mp4MetaDirectory();
    }

    @Override // com.drew.metadata.mp4.Mp4MediaHandler
    public final String getMediaInformation() {
        return "nmhd";
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final Mp4MetaDirectory getDirectory() {
        return new Mp4MetaDirectory();
    }

    @Override // com.drew.metadata.mp4.Mp4MediaHandler
    public final void processMediaInformation(SequentialReader sequentialReader) {
    }

    @Override // com.drew.metadata.mp4.Mp4MediaHandler
    public final void processSampleDescription(SequentialReader sequentialReader) {
    }

    @Override // com.drew.metadata.mp4.Mp4MediaHandler
    public final void processTimeToSample(SequentialReader sequentialReader, Mp4Context mp4Context) {
    }
}
