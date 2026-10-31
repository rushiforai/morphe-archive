package com.fyber.inneractive.sdk.network;

import java.io.FilterInputStream;
import java.net.HttpURLConnection;
import java.util.Map;

/* loaded from: classes.dex */
public final class j extends l {

    /* renamed from: g, reason: collision with root package name */
    public final HttpURLConnection f28728g;

    public j(HttpURLConnection httpURLConnection, int i5, FilterInputStream filterInputStream, Map map, String str) {
        this.f28728g = httpURLConnection;
        this.f28733a = i5;
        this.f28735c = filterInputStream;
        this.f28736d = map;
        this.f28737e = str;
    }

    @Override // com.fyber.inneractive.sdk.network.l
    public final void a() {
        try {
            HttpURLConnection httpURLConnection = this.f28728g;
            if (httpURLConnection != null) {
                httpURLConnection.disconnect();
            }
        } catch (Throwable unused) {
        }
        super.a();
    }
}
