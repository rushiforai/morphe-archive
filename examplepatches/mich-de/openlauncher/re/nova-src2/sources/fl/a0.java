package fl;

import java.nio.ByteBuffer;
import java.security.GeneralSecurityException;

/* loaded from: classes.dex */
public final class a0 extends b {

    /* renamed from: c, reason: collision with root package name */
    public final c0 f55281c;

    /* renamed from: d, reason: collision with root package name */
    public final tl.a f55282d;

    /* renamed from: e, reason: collision with root package name */
    public final Integer f55283e;

    public a0(c0 c0Var, tl.a aVar, Integer num) {
        this.f55281c = c0Var;
        this.f55282d = aVar;
        this.f55283e = num;
    }

    public static a0 p0(c0 c0Var, Integer num) throws GeneralSecurityException {
        tl.a aVarA;
        b0 b0Var = c0Var.f55297b;
        if (b0Var == b0.f55284c) {
            if (num == null) {
                throw new GeneralSecurityException("For given Variant TINK the value of idRequirement must be non-null");
            }
            aVarA = tl.a.a(ByteBuffer.allocate(5).put((byte) 1).putInt(num.intValue()).array());
        } else {
            if (b0Var != b0.f55285d) {
                throw new GeneralSecurityException("Unknown Variant: " + b0Var);
            }
            if (num != null) {
                throw new GeneralSecurityException("For given Variant NO_PREFIX the value of idRequirement must be null");
            }
            aVarA = tl.a.a(new byte[0]);
        }
        return new a0(c0Var, aVarA, num);
    }

    @Override // bh.g
    public final Integer W() {
        return this.f55283e;
    }

    @Override // bh.g
    public final el.g a0() {
        return this.f55281c;
    }

    @Override // fl.b
    public final tl.a o0() {
        return this.f55282d;
    }
}
