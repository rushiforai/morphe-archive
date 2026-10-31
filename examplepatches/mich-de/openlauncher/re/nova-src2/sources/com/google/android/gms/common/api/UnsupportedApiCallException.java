package com.google.android.gms.common.api;

import com.google.android.gms.common.Feature;

/* loaded from: classes3.dex */
public final class UnsupportedApiCallException extends UnsupportedOperationException {

    /* renamed from: a, reason: collision with root package name */
    public final Feature f31814a;

    public UnsupportedApiCallException(Feature feature) {
        this.f31814a = feature;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return "Missing ".concat(String.valueOf(this.f31814a));
    }
}
