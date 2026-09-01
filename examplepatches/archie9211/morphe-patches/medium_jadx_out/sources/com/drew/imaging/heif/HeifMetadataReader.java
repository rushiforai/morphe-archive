package com.drew.imaging.heif;

import com.drew.metadata.Metadata;
import com.drew.metadata.heif.HeifBoxHandler;
import java.io.InputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class HeifMetadataReader {
    public static Metadata readMetadata(InputStream inputStream) {
        Metadata metadata = new Metadata();
        new HeifReader().extract(inputStream, new HeifBoxHandler(metadata));
        return metadata;
    }
}
