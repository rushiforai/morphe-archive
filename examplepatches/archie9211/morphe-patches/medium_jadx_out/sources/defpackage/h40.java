package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h40 implements Serializable {
    public final String a;
    public final String b;
    public final boolean c;
    public final boolean d;

    public h40(String str, String str2, boolean z, boolean z2) {
        this.a = str;
        this.b = str2;
        this.c = z;
        this.d = z2;
    }

    private final Object readResolve() {
        return new i40(this.a, this.b, this.c, this.d);
    }
}
