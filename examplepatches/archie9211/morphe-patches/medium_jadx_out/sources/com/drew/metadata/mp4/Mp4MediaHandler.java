package com.drew.metadata.mp4;

import com.drew.imaging.mp4.Mp4Handler;
import com.drew.lang.DateUtil;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.lang.SequentialReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.mp4.media.Mp4MediaDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class Mp4MediaHandler<T extends Mp4MediaDirectory> extends Mp4Handler<T> {
    public Mp4MediaHandler(Metadata metadata, Mp4Context mp4Context) {
        super(metadata);
        Long l = mp4Context.creationTime;
        if (l != null) {
            ((Mp4MediaDirectory) this.directory).setObject(101, DateUtil.get1Jan1904EpochDate(l.longValue()));
        }
        Long l2 = mp4Context.modificationTime;
        if (l2 != null) {
            ((Mp4MediaDirectory) this.directory).setObject(102, DateUtil.get1Jan1904EpochDate(l2.longValue()));
        }
        String str = mp4Context.language;
        if (str != null) {
            ((Mp4MediaDirectory) this.directory).setString(104, str);
        }
    }

    public abstract String getMediaInformation();

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final Mp4Handler<?> processBox(String str, byte[] bArr, long j, Mp4Context mp4Context) {
        if (bArr != null) {
            SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
            if (str.equals(getMediaInformation())) {
                processMediaInformation(sequentialByteArrayReader);
                return this;
            }
            if (str.equals("stsd")) {
                processSampleDescription(sequentialByteArrayReader);
                return this;
            }
            if (str.equals("stts")) {
                processTimeToSample(sequentialByteArrayReader, mp4Context);
            }
        }
        return this;
    }

    public abstract void processMediaInformation(SequentialReader sequentialReader);

    public abstract void processSampleDescription(SequentialReader sequentialReader);

    public abstract void processTimeToSample(SequentialReader sequentialReader, Mp4Context mp4Context);

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final boolean shouldAcceptBox(String str) {
        return str.equals(getMediaInformation()) || str.equals("stsd") || str.equals("stts");
    }

    @Override // com.drew.imaging.mp4.Mp4Handler
    public final boolean shouldAcceptContainer(String str) {
        return str.equals("stbl") || str.equals("minf");
    }
}
