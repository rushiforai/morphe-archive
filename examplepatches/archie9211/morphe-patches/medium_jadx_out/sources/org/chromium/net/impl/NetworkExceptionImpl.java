package org.chromium.net.impl;

import org.chromium.net.NetworkException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class NetworkExceptionImpl extends NetworkException {
    @Override // java.lang.Throwable
    public final String getMessage() {
        return super.getMessage() + ", ErrorCode=9, InternalErrorCode=-4, Retryable=false";
    }
}
