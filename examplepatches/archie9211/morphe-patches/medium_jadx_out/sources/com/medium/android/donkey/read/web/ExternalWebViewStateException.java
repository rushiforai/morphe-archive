package com.medium.android.donkey.read.web;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Lcom/medium/android/donkey/read/web/ExternalWebViewStateException;", "Ljava/lang/IllegalStateException;", "Lkotlin/IllegalStateException;", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ExternalWebViewStateException extends IllegalStateException {
    public final String a;

    public ExternalWebViewStateException(String str) {
        super(str);
        this.a = str;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return this.a;
    }
}
