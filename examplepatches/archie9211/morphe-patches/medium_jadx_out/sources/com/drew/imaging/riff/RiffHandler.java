package com.drew.imaging.riff;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public interface RiffHandler {
    void addError(String str);

    void processChunk(String str, byte[] bArr);

    boolean shouldAcceptChunk(String str);

    boolean shouldAcceptList(String str);

    boolean shouldAcceptRiffIdentifier(String str);
}
