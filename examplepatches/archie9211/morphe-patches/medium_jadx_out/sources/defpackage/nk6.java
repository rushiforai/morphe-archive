package defpackage;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nk6 {
    public final zg7 a;

    public nk6() {
        zg7 zg7Var = new zg7(25, false);
        zg7Var.b = new HashMap();
        this.a = zg7Var;
    }

    public final void a(String str, boolean z) {
        ((HashMap) this.a.b).put(str, Boolean.toString(z));
    }
}
