package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pkg extends gr7 {
    public final jkg h;
    public final ujf i;

    public pkg(jkg jkgVar, ujf ujfVar) {
        this.h = jkgVar;
        this.i = ujfVar;
    }

    public static pkg K(jkg jkgVar, ujf ujfVar) throws GeneralSecurityException {
        if (jkgVar.a == ((qvg) ujfVar.b).a.length) {
            return new pkg(jkgVar, ujfVar);
        }
        ygf.l("Key size mismatch");
        return null;
    }

    @Override // defpackage.gr7
    public final bzf H() {
        return this.h;
    }

    @Override // defpackage.gr7
    public final Integer J() {
        return null;
    }
}
