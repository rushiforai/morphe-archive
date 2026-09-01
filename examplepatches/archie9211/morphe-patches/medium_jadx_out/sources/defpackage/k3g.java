package defpackage;

import java.nio.ByteBuffer;
import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k3g extends o0g {
    public final l3g h;
    public final qvg i;
    public final Integer j;

    public k3g(l3g l3gVar, qvg qvgVar, Integer num) {
        this.h = l3gVar;
        this.i = qvgVar;
        this.j = num;
    }

    public static k3g L(l3g l3gVar, Integer num) throws GeneralSecurityException {
        qvg qvgVarA;
        d1g d1gVar = l3gVar.b;
        if (d1gVar == d1g.l) {
            if (num == null) {
                ygf.l("For given Variant TINK the value of idRequirement must be non-null");
                return null;
            }
            qvgVarA = qvg.a(ByteBuffer.allocate(5).put((byte) 1).putInt(num.intValue()).array());
        } else {
            if (d1gVar != d1g.m) {
                throw new GeneralSecurityException("Unknown Variant: ".concat(String.valueOf(d1gVar)));
            }
            if (num != null) {
                ygf.l("For given Variant NO_PREFIX the value of idRequirement must be null");
                return null;
            }
            qvgVarA = qvg.a(new byte[0]);
        }
        return new k3g(l3gVar, qvgVarA, num);
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
