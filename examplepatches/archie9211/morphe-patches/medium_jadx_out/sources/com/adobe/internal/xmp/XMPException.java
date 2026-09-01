package com.adobe.internal.xmp;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class XMPException extends Exception {
    public final int a;

    public XMPException(String str, int i) {
        super(str);
        this.a = i;
    }

    public XMPException(String str, int i, Exception exc) {
        super(str, exc);
        this.a = i;
    }
}
