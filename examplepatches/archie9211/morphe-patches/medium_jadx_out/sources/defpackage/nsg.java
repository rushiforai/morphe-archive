package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nsg extends evg {
    public final esg i;
    public final cmf j;
    public final cmf k;
    public final Integer l;

    public nsg(esg esgVar, cmf cmfVar, cmf cmfVar2, Integer num) {
        this.i = esgVar;
        this.j = cmfVar;
        this.k = cmfVar2;
        this.l = num;
    }

    public static nsg R(b3g b3gVar, cmf cmfVar, Integer num) throws GeneralSecurityException {
        cmf cmfVarA;
        String str = b3gVar.b;
        byte[] bArr = cmfVar.a;
        esg esgVar = new esg(b3gVar);
        b3g b3gVar2 = b3g.i;
        if (b3gVar != b3gVar2 && num == null) {
            throw new GeneralSecurityException(y30.s(new StringBuilder(str.length() + 62), "For given Variant ", str, " the value of idRequirement must be non-null"));
        }
        if (b3gVar == b3gVar2 && num != null) {
            ygf.l("For given Variant NO_PREFIX the value of idRequirement must be null");
            return null;
        }
        if (bArr.length != 32) {
            int length = bArr.length;
            throw new GeneralSecurityException(b09.A(new StringBuilder(String.valueOf(length).length() + 65), length, "Ed25519 key must be constructed with key of length 32 bytes, not "));
        }
        if (b3gVar == b3gVar2) {
            cmfVarA = hmg.a;
        } else if (b3gVar == b3g.g || b3gVar == b3g.h) {
            cmfVarA = hmg.a(num.intValue());
        } else {
            if (b3gVar != b3g.f) {
                ygf.f("Unknown Variant: ".concat(str));
                return null;
            }
            cmfVarA = hmg.b(num.intValue());
        }
        return new nsg(esgVar, cmfVar, cmfVarA, num);
    }

    @Override // defpackage.ur7
    public final /* synthetic */ jjg H() {
        return this.i;
    }

    @Override // defpackage.ur7
    public final Integer I() {
        return this.l;
    }

    @Override // defpackage.evg
    public final cmf Q() {
        return this.k;
    }
}
