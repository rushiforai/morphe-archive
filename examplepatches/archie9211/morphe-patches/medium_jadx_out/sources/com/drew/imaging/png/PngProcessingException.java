package com.drew.imaging.png;

import com.drew.imaging.ImageProcessingException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PngProcessingException extends ImageProcessingException {
    private static final long serialVersionUID = -687991554932005033L;

    public PngProcessingException(String str) {
        super(str, null);
    }

    public PngProcessingException(String str, Throwable th) {
        super(str, th);
    }

    public PngProcessingException(Throwable th) {
        super(null, th);
    }
}
