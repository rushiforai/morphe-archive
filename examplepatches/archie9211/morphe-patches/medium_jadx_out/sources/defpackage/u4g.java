package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u4g extends o0g {
    public final a5g h;
    public final ujf i;
    public final qvg j;
    public final Integer k;

    public u4g(a5g a5gVar, ujf ujfVar, qvg qvgVar, Integer num) {
        this.h = a5gVar;
        this.i = ujfVar;
        this.j = qvgVar;
        this.k = num;
    }

    public static u4g L(a5g a5gVar, ujf ujfVar, Integer num) throws GeneralSecurityException {
        qvg qvgVarB;
        qvg qvgVar = (qvg) ujfVar.b;
        e1g e1gVar = a5gVar.a;
        e1g e1gVar2 = e1g.i;
        if (e1gVar != e1gVar2 && num == null) {
            throw new GeneralSecurityException(ev6.x("For given Variant ", String.valueOf(e1gVar), " the value of idRequirement must be non-null"));
        }
        if (e1gVar == e1gVar2 && num != null) {
            ygf.l("For given Variant NO_PREFIX the value of idRequirement must be null");
            return null;
        }
        if (qvgVar.a.length != 32) {
            throw new GeneralSecurityException(b09.w(qvgVar.a.length, "XAesGcmKey key must be constructed with key of length 32 bytes, not "));
        }
        if (e1gVar == e1gVar2) {
            qvgVarB = mhg.a;
        } else {
            if (e1gVar != e1g.h) {
                ygf.f("Unknown Variant: ".concat(String.valueOf(e1gVar)));
                return null;
            }
            qvgVarB = mhg.b(num.intValue());
        }
        return new u4g(a5gVar, ujfVar, qvgVarB, num);
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
