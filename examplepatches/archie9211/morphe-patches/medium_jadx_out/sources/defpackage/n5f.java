package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n5f implements m5f {
    public final n73 b;

    public n5f() {
        this.b = Build.VERSION.SDK_INT >= 34 ? o73.a : jzb.c;
        d46.t(1, 2, 4, 8, 16, 32, 64, 128);
    }
}
