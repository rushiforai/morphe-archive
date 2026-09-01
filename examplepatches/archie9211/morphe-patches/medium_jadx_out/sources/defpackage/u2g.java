package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u2g extends o0g {
    public final c3g h;
    public final ujf i;
    public final qvg j;
    public final Integer k;

    public u2g(c3g c3gVar, ujf ujfVar, qvg qvgVar, Integer num) {
        this.h = c3gVar;
        this.i = ujfVar;
        this.j = qvgVar;
        this.k = num;
    }

    public static u2g L(b3g b3gVar, ujf ujfVar, Integer num) throws GeneralSecurityException {
        qvg qvgVarB;
        qvg qvgVar = (qvg) ujfVar.b;
        b3g b3gVar2 = b3g.e;
        if (b3gVar != b3gVar2 && num == null) {
            throw new GeneralSecurityException(ev6.x("For given Variant ", String.valueOf(b3gVar), " the value of idRequirement must be non-null"));
        }
        if (b3gVar == b3gVar2 && num != null) {
            ygf.l("For given Variant NO_PREFIX the value of idRequirement must be null");
            return null;
        }
        if (qvgVar.a.length != 32) {
            throw new GeneralSecurityException(b09.w(qvgVar.a.length, "ChaCha20Poly1305 key must be constructed with key of length 32 bytes, not "));
        }
        c3g c3gVar = new c3g(b3gVar);
        if (b3gVar == b3gVar2) {
            qvgVarB = mhg.a;
        } else if (b3gVar == b3g.d) {
            qvgVarB = mhg.a(num.intValue());
        } else {
            if (b3gVar != b3g.c) {
                ygf.f("Unknown Variant: ".concat(String.valueOf(b3gVar)));
                return null;
            }
            qvgVarB = mhg.b(num.intValue());
        }
        return new u2g(c3gVar, ujfVar, qvgVarB, num);
    }

    @Override // defpackage.gr7
    public final /* synthetic */ bzf H() {
        return this.h;
    }

    @Override // defpackage.gr7
    public final Integer J() {
        return this.k;
    }

    @Override // defpackage.o0g
    public final qvg K() {
        return this.j;
    }
}
