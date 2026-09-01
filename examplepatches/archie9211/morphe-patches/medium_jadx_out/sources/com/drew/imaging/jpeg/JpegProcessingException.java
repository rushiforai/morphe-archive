package com.drew.imaging.jpeg;

import com.drew.imaging.ImageProcessingException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class JpegProcessingException extends ImageProcessingException {
    private static final long serialVersionUID = -7870179776125450158L;

    public JpegProcessingException(String str) {
        super(str, null);
    }

    public JpegProcessingException(String str, Throwable th) {
        super(str, th);
    }

    public JpegProcessingException(Throwable th) {
        super(null, th);
    }
}
