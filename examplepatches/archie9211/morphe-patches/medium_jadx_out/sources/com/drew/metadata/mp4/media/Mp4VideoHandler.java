package com.drew.metadata.mp4.media;

import com.drew.lang.SequentialReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.mp4.Mp4Context;
import com.drew.metadata.mp4.Mp4Dictionary;
import com.drew.metadata.mp4.Mp4Directory;
import com.drew.metadata.mp4.Mp4MediaHandler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Mp4VideoHandler extends Mp4MediaHandler<Mp4VideoDirectory> {
    public Mp4VideoHandler(Metadata metadata, Mp4Context mp4Context) {
        super(metadata, mp4Context);
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final Mp4Directory getDirectory() {
        return new Mp4VideoDirectory();
    }

    @Override // com.drew.metadata.mp4.Mp4MediaHandler
    public final String getMediaInformation() {
        return "vmhd";
    }

    @Override // com.drew.metadata.mp4.Mp4MediaHandler
    public final void processMediaInformation(SequentialReader sequentialReader) {
        sequentialReader.skip(4L);
        int uInt16 = sequentialReader.getUInt16();
        ((Mp4VideoDirectory) this.directory).setObjectArray(Mp4VideoDirectory.TAG_OPCOLOR, new int[]{sequentialReader.getUInt16(), sequentialReader.getUInt16(), sequentialReader.getUInt16()});
        ((Mp4VideoDirectory) this.directory).setInt(Mp4VideoDirectory.TAG_GRAPHICS_MODE, uInt16);
    }

    @Override // com.drew.metadata.mp4.Mp4MediaHandler
    public final void processSampleDescription(SequentialReader sequentialReader) {
        sequentialReader.skip(4L);
        sequentialReader.getUInt32();
        sequentialReader.getUInt32();
        String string = sequentialReader.getString(4);
        sequentialReader.skip(6L);
        sequentialReader.getUInt16();
        sequentialReader.getInt16();
        sequentialReader.getInt16();
        sequentialReader.getString(4);
        sequentialReader.getInt32();
        sequentialReader.getInt32();
        int uInt16 = sequentialReader.getUInt16();
        int uInt162 = sequentialReader.getUInt16();
        long uInt32 = sequentialReader.getUInt32();
        long uInt322 = sequentialReader.getUInt32();
        sequentialReader.skip(4L);
        sequentialReader.getUInt16();
        String string2 = sequentialReader.getString(32);
        int uInt163 = sequentialReader.getUInt16();
        sequentialReader.skip(2L);
        Mp4Dictionary.setLookup(Mp4VideoDirectory.TAG_COMPRESSION_TYPE, string, this.directory);
        ((Mp4VideoDirectory) this.directory).setInt(Mp4VideoDirectory.TAG_WIDTH, uInt16);
        ((Mp4VideoDirectory) this.directory).setInt(Mp4VideoDirectory.TAG_HEIGHT, uInt162);
        String strTrim = string2.trim();
        if (!strTrim.isEmpty()) {
            ((Mp4VideoDirectory) this.directory).setObject(208, strTrim);
        }
        ((Mp4VideoDirectory) this.directory).setInt(Mp4VideoDirectory.TAG_DEPTH, uInt163);
        ((Mp4VideoDirectory) this.directory).setDouble(Mp4VideoDirectory.TAG_HORIZONTAL_RESOLUTION, ((uInt32 & (-65536)) >> 16) + ((uInt32 & 65535) / Math.pow(2.0d, 4.0d)));
        ((Mp4VideoDirectory) this.directory).setDouble(Mp4VideoDirectory.TAG_VERTICAL_RESOLUTION, ((uInt322 & (-65536)) >> 16) + ((uInt322 & 65535) / Math.pow(2.0d, 4.0d)));
    }

    @Override // com.drew.metadata.mp4.Mp4MediaHandler
    public final void processTimeToSample(SequentialReader sequentialReader, Mp4Context mp4Context) {
        sequentialReader.skip(4L);
        long uInt32 = sequentialReader.getUInt32();
        float uInt322 = 0.0f;
        for (int i = 0; i < uInt32; i++) {
            uInt322 += sequentialReader.getUInt32();
            sequentialReader.skip(4L);
        }
        if (mp4Context.timeScale == null || mp4Context.duration == null) {
            return;
        }
        ((Mp4VideoDirectory) this.directory).setFloat(Mp4VideoDirectory.TAG_FRAME_RATE, r9.longValue() / (mp4Context.duration.longValue() / uInt322));
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final Mp4VideoDirectory getDirectory() {
        return new Mp4VideoDirectory();
    }
}
