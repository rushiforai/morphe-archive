package com.drew.metadata;

import com.drew.lang.CompoundException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class MetadataException extends CompoundException {
    private static final long serialVersionUID = 8612756143363919682L;

    public MetadataException(String str) {
        super(str, null);
    }

    public MetadataException(String str, Throwable th) {
        super(str, th);
    }

    public MetadataException(Throwable th) {
        super(null, th);
    }
}
