package com.drew.imaging;

import com.drew.lang.CompoundException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ImageProcessingException extends CompoundException {
    private static final long serialVersionUID = -9115669182209912676L;

    public ImageProcessingException(String str) {
        super(str, null);
    }

    public ImageProcessingException(String str, Throwable th) {
        super(str, th);
    }

    public ImageProcessingException(Throwable th) {
        super(null, th);
    }
}
