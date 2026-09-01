package defpackage;

import java.security.spec.ECParameterSpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class grg {
    public static final grg c = new grg("NIST_P256", hkg.a);
    public static final grg d = new grg("NIST_P384", hkg.b);
    public static final grg e = new grg("NIST_P521", hkg.c);
    public final String a;
    public final ECParameterSpec b;

    public grg(String str, ECParameterSpec eCParameterSpec) {
        this.a = str;
        this.b = eCParameterSpec;
    }

    public final String toString() {
        return this.a;
    }
}
