package com.google.android.exoplayer2.upstream;

import b.c0;
import java.util.Map;

/* loaded from: classes3.dex */
public final class HttpDataSource$InvalidResponseCodeException extends HttpDataSource$HttpDataSourceException {

    /* renamed from: d, reason: collision with root package name */
    public final int f31596d;

    public HttpDataSource$InvalidResponseCodeException(int i5, DataSourceException dataSourceException, Map map) {
        super(2004, dataSourceException, c0.h(i5, "Response code: "));
        this.f31596d = i5;
    }
}
