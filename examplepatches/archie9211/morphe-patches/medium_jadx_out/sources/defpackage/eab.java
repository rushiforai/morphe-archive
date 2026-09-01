package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class eab {
    public final kne a;

    public eab(kne kneVar) {
        this.a = kneVar;
    }

    public static bab a(hne hneVar, String str, boolean z, String str2, boolean z2, boolean z3) {
        boolean z4;
        boolean z5 = false;
        boolean z6 = true;
        if (!z3 || z) {
            z4 = true;
            z6 = false;
        } else {
            z4 = true;
        }
        if (z3 && z) {
            z5 = z4;
        }
        boolean z7 = !z2;
        return new bab(hneVar, str, z, new aab(str2, z6, z5, z7, z7));
    }
}
