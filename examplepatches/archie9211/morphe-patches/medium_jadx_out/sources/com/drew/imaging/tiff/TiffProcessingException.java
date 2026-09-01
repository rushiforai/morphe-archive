package com.drew.imaging.tiff;

import com.drew.imaging.ImageProcessingException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class TiffProcessingException extends ImageProcessingException {
    private static final long serialVersionUID = -1658134119488001891L;

    public TiffProcessingException(String str) {
        super(str, null);
    }

    public TiffProcessingException(String str, Throwable th) {
        super(str, th);
    }

    public TiffProcessingException(Throwable th) {
        super(null, th);
    }
}
