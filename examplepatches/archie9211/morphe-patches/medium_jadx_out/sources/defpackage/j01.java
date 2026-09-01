package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j01 implements l01 {
    public final boolean b;
    public final boolean c;
    public final boolean d;
    public final boolean e;
    public final boolean f;

    public j01() {
        int i = Build.VERSION.SDK_INT;
        this.b = i >= 24;
        this.c = i >= 26;
        this.d = i >= 28;
        this.e = i >= 29;
        this.f = i >= 33;
    }
}
