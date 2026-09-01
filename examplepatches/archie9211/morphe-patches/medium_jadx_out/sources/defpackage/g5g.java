package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g5g extends o0g {
    public final m5g h;
    public final ujf i;
    public final qvg j;
    public final Integer k;

    public g5g(m5g m5gVar, ujf ujfVar, qvg qvgVar, Integer num) {
        this.h = m5gVar;
        this.i = ujfVar;
        this.j = qvgVar;
        this.k = num;
    }

    public static g5g L(d1g d1gVar, ujf ujfVar, Integer num) throws GeneralSecurityException {
        qvg qvgVarB;
        qvg qvgVar = (qvg) ujfVar.b;
        d1g d1gVar2 = d1g.r;
        if (d1gVar != d1gVar2 && num == null) {
            throw new GeneralSecurityException(ev6.x("For given Variant ", String.valueOf(d1gVar), " the value of idRequirement must be non-null"));
        }
        if (d1gVar == d1gVar2 && num != null) {
            ygf.l("For given Variant NO_PREFIX the value of idRequirement must be null");
            return null;
        }
        if (qvgVar.a.length != 32) {
            throw new GeneralSecurityException(b09.w(qvgVar.a.length, "XChaCha20Poly1305 key must be constructed with key of length 32 bytes, not "));
        }
        m5g m5gVar = new m5g(d1gVar);
        if (d1gVar == d1gVar2) {
            qvgVarB = mhg.a;
        } else if (d1gVar == d1g.q) {
            qvgVarB = mhg.a(num.intValue());
        } else {
            if (d1gVar != d1g.p) {
                ygf.f("Unknown Variant: ".concat(String.valueOf(d1gVar)));
                return null;
            }
            qvgVarB = mhg.b(num.intValue());
        }
        return new g5g(m5gVar, ujfVar, qvgVarB, num);
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
