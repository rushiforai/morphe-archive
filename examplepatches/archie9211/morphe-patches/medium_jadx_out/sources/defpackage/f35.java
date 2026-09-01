package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f35 implements v2d {
    public final Context a;
    public final String b;
    public final ad c;
    public final boolean d;
    public final boolean e;
    public final w5d f;
    public boolean g;

    public f35(Context context, String str, ad adVar, boolean z, boolean z2) {
        adVar.getClass();
        this.a = context;
        this.b = str;
        this.c = adVar;
        this.d = z;
        this.e = z2;
        this.f = new w5d(new em4(4, this));
    }

    @Override // defpackage.v2d
    public final z25 Z() {
        return ((e35) this.f.getValue()).f(true);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        w5d w5dVar = this.f;
        if (w5dVar.a()) {
            ((e35) w5dVar.getValue()).close();
        }
    }

    @Override // defpackage.v2d
    public final String getDatabaseName() {
        return this.b;
    }

    @Override // defpackage.v2d
    public final void setWriteAheadLoggingEnabled(boolean z) {
        w5d w5dVar = this.f;
        if (w5dVar.a()) {
            ((e35) w5dVar.getValue()).setWriteAheadLoggingEnabled(z);
        }
        this.g = z;
    }
}
