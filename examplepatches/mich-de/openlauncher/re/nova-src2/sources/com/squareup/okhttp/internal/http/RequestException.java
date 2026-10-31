package com.squareup.okhttp.internal.http;

import java.io.IOException;

/* loaded from: classes4.dex */
public final class RequestException extends Exception {
    @Override // java.lang.Throwable
    public final Throwable getCause() {
        return (IOException) super.getCause();
    }
}
