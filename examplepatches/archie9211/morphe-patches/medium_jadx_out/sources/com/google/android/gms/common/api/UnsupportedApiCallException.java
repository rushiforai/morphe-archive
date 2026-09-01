package com.google.android.gms.common.api;

import defpackage.da4;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class UnsupportedApiCallException extends UnsupportedOperationException {
    public final da4 a;

    public UnsupportedApiCallException(da4 da4Var) {
        this.a = da4Var;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return "Missing ".concat(String.valueOf(this.a));
    }
}
