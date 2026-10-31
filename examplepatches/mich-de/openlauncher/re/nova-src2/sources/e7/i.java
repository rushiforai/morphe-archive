package e7;

import aa.m0;
import android.content.Context;
import java.io.IOException;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class i implements d7.d {

    /* renamed from: a, reason: collision with root package name */
    public final Context f52232a;

    /* renamed from: b, reason: collision with root package name */
    public final String f52233b;

    /* renamed from: c, reason: collision with root package name */
    public final m0 f52234c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f52235d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f52236e;

    /* renamed from: f, reason: collision with root package name */
    public final a70.d f52237f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f52238g;

    public i(Context context, String str, m0 callback, boolean z11, boolean z12) {
        Intrinsics.g(context, "context");
        Intrinsics.g(callback, "callback");
        this.f52232a = context;
        this.f52233b = str;
        this.f52234c = callback;
        this.f52235d = z11;
        this.f52236e = z12;
        this.f52237f = LazyKt.a(new a3.e(this, 18));
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        a70.d dVar = this.f52237f;
        if (dVar.isInitialized()) {
            ((h) dVar.getValue()).close();
        }
    }

    @Override // d7.d
    public final d7.a getWritableDatabase() {
        return ((h) this.f52237f.getValue()).a(true);
    }

    @Override // d7.d
    public final void setWriteAheadLoggingEnabled(boolean z11) {
        a70.d dVar = this.f52237f;
        if (dVar.isInitialized()) {
            h sQLiteOpenHelper = (h) dVar.getValue();
            Intrinsics.g(sQLiteOpenHelper, "sQLiteOpenHelper");
            sQLiteOpenHelper.setWriteAheadLoggingEnabled(z11);
        }
        this.f52238g = z11;
    }
}
