package com.drew.metadata.mp4.media;

import com.drew.lang.SequentialReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.mp4.Mp4Context;
import com.drew.metadata.mp4.Mp4Dictionary;
import com.drew.metadata.mp4.Mp4Directory;
import com.drew.metadata.mp4.Mp4MediaHandler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Mp4SoundHandler extends Mp4MediaHandler<Mp4SoundDirectory> {
    public Mp4SoundHandler(Metadata metadata, Mp4Context mp4Context) {
        super(metadata, mp4Context);
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final Mp4Directory getDirectory() {
        return new Mp4SoundDirectory();
    }

    @Override // com.drew.metadata.mp4.Mp4MediaHandler
    public final String getMediaInformation() {
        return "smhd";
    }

    @Override // com.drew.metadata.mp4.Mp4MediaHandler
    public final void processMediaInformation(SequentialReader sequentialReader) {
        sequentialReader.skip(4L);
        short int16 = sequentialReader.getInt16();
        sequentialReader.skip(2L);
        ((Mp4SoundDirectory) this.directory).setDouble(305, ((double) ((-65536) & int16)) + (((double) (65535 & int16)) / Math.pow(2.0d, 4.0d)));
    }

    @Override // com.drew.metadata.mp4.Mp4MediaHandler
    public final void processSampleDescription(SequentialReader sequentialReader) {
        sequentialReader.skip(4L);
        sequentialReader.getUInt32();
        sequentialReader.getUInt32();
        String string = sequentialReader.getString(4);
        sequentialReader.skip(6L);
        sequentialReader.getUInt16();
        sequentialReader.skip(8L);
        int uInt16 = sequentialReader.getUInt16();
        short int16 = sequentialReader.getInt16();
        sequentialReader.skip(2L);
        sequentialReader.skip(2L);
        sequentialReader.getUInt32();
        Mp4Dictionary.setLookup(301, string, this.directory);
        ((Mp4SoundDirectory) this.directory).setInt(Mp4SoundDirectory.TAG_NUMBER_OF_CHANNELS, uInt16);
        ((Mp4SoundDirectory) this.directory).setInt(Mp4SoundDirectory.TAG_AUDIO_SAMPLE_SIZE, int16);
    }

    @Override // com.drew.metadata.mp4.Mp4MediaHandler
    public final void processTimeToSample(SequentialReader sequentialReader, Mp4Context mp4Context) {
        sequentialReader.skip(4L);
        sequentialReader.skip(sequentialReader.getUInt32() * 8);
        if (mp4Context.timeScale != null) {
            ((Mp4SoundDirectory) this.directory).setDouble(304, r5.longValue());
        }
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final Mp4SoundDirectory getDirectory() {
        return new Mp4SoundDirectory();
    }
}
