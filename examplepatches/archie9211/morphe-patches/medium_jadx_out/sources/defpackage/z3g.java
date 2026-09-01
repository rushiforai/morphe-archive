package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z3g extends o0g {
    public final x3g h;
    public final qvg i;
    public final Integer j;

    public z3g(x3g x3gVar, qvg qvgVar, Integer num) {
        this.h = x3gVar;
        this.i = qvgVar;
        this.j = num;
    }

    public static z3g L(x3g x3gVar, Integer num) throws GeneralSecurityException {
        qvg qvgVarB;
        d1g d1gVar = x3gVar.a;
        if (d1gVar == d1g.o) {
            if (num != null) {
                ygf.l("For given Variant NO_PREFIX the value of idRequirement must be null");
                return null;
            }
            qvgVarB = mhg.a;
        } else {
            if (d1gVar != d1g.n) {
                throw new GeneralSecurityException("Unknown Variant: ".concat(String.valueOf(d1gVar)));
            }
            if (num == null) {
                ygf.l("For given Variant TINK the value of idRequirement must be non-null");
                return null;
            }
            qvgVarB = mhg.b(num.intValue());
        }
        return new z3g(x3gVar, qvgVarB, num);
    }

    @Override // defpackage.gr7
    public final /* synthetic */ bzf H() {
        return this.h;
    }

    @Override // defpackage.gr7
    public final Integer J() {
        return this.j;
    }

    @Override // defpackage.o0g
    public final qvg K() {
        return this.i;
    }
}
