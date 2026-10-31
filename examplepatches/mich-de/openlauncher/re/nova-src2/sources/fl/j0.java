package fl;

import java.security.GeneralSecurityException;

/* loaded from: classes.dex */
public final class j0 extends b {

    /* renamed from: c, reason: collision with root package name */
    public final l0 f55360c;

    /* renamed from: d, reason: collision with root package name */
    public final t5.d0 f55361d;

    /* renamed from: e, reason: collision with root package name */
    public final tl.a f55362e;

    /* renamed from: f, reason: collision with root package name */
    public final Integer f55363f;

    public j0(l0 l0Var, t5.d0 d0Var, tl.a aVar, Integer num) {
        this.f55360c = l0Var;
        this.f55361d = d0Var;
        this.f55362e = aVar;
        this.f55363f = num;
    }

    public static j0 p0(l0 l0Var, t5.d0 d0Var, Integer num) throws GeneralSecurityException {
        tl.a aVarB;
        j jVar = l0Var.f55377a;
        j jVar2 = j.f55355x;
        if (jVar != jVar2 && num == null) {
            throw new GeneralSecurityException("For given Variant " + jVar + " the value of idRequirement must be non-null");
        }
        if (jVar == jVar2 && num != null) {
            throw new GeneralSecurityException("For given Variant NO_PREFIX the value of idRequirement must be null");
        }
        if (d0Var.I() != 32) {
            throw new GeneralSecurityException("XAesGcmKey key must be constructed with key of length 32 bytes, not " + d0Var.I());
        }
        if (jVar == jVar2) {
            aVarB = kl.c0.f71572a;
        } else {
            if (jVar != j.f55354w) {
                throw new IllegalStateException("Unknown Variant: " + jVar);
            }
            aVarB = kl.c0.b(num.intValue());
        }
        return new j0(l0Var, d0Var, aVarB, num);
    }

    @Override // bh.g
    public final Integer W() {
        return this.f55363f;
    }

    @Override // bh.g
    public final el.g a0() {
        return this.f55360c;
    }

    @Override // fl.b
    public final tl.a o0() {
        return this.f55362e;
    }
}
