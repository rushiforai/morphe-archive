package com.google.android.exoplayer2.upstream;

import java.io.IOException;

/* loaded from: classes3.dex */
public class DataSourceException extends IOException {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f31593b = 0;

    /* renamed from: a, reason: collision with root package name */
    public final int f31594a;

    public DataSourceException(int i5) {
        this.f31594a = i5;
    }

    public DataSourceException(Exception exc, int i5) {
        super(exc);
        this.f31594a = i5;
    }

    public DataSourceException(String str, Exception exc, int i5) {
        super(str, exc);
        this.f31594a = i5;
    }
}
