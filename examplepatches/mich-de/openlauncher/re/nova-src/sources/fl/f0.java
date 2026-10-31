package fl;

import java.security.GeneralSecurityException;

/* loaded from: classes.dex */
public final class f0 extends b {

    /* renamed from: c, reason: collision with root package name */
    public final g0 f55310c;

    /* renamed from: d, reason: collision with root package name */
    public final tl.a f55311d;

    /* renamed from: e, reason: collision with root package name */
    public final Integer f55312e;

    public f0(g0 g0Var, tl.a aVar, Integer num) {
        this.f55310c = g0Var;
        this.f55311d = aVar;
        this.f55312e = num;
    }

    public static f0 p0(g0 g0Var, Integer num) throws GeneralSecurityException {
        tl.a aVarB;
        b0 b0Var = g0Var.f55313a;
        if (b0Var == b0.f55293l) {
            if (num != null) {
                throw new GeneralSecurityException("For given Variant NO_PREFIX the value of idRequirement must be null");
            }
            aVarB = kl.c0.f71572a;
        } else {
            if (b0Var != b0.f55292k) {
                throw new GeneralSecurityException("Unknown Variant: " + b0Var);
            }
            if (num == null) {
                throw new GeneralSecurityException("For given Variant TINK the value of idRequirement must be non-null");
            }
            aVarB = kl.c0.b(num.intValue());
        }
        return new f0(g0Var, aVarB, num);
    }

    @Override // bh.g
    public final Integer W() {
        return this.f55312e;
    }

    @Override // bh.g
    public final el.g a0() {
        return this.f55310c;
    }

    @Override // fl.b
    public final tl.a o0() {
        return this.f55311d;
    }
}
