package defpackage;

import com.google.android.recaptcha.internal.zzaek;
import com.google.android.recaptcha.internal.zzagd;
import com.google.android.recaptcha.internal.zzfx;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aeg {
    public final mq7 a;
    public final byte[] b;

    public aeg(mq7 mq7Var, byte[] bArr) {
        this.a = mq7Var;
        this.b = bArr;
    }

    public final void a() {
        d87 d87Var = d87.r;
        d87 d87Var2 = d87.a1;
        d87 d87Var3 = d87.U0;
        try {
            int iZ = this.a.z();
            if (iZ != 200) {
                int i = 12;
                String str = null;
                if (iZ == 400) {
                    throw new zzfx(d87Var3, d87.L, str, i);
                }
                if (iZ != 503 && iZ != 403) {
                    if (iZ == 404) {
                    }
                }
            }
        } catch (Exception e) {
            throw new zzfx(d87Var3, d87.z, e.getMessage(), 8);
        }
    }

    public final emf b(fnf fnfVar) throws zzfx {
        d87 d87Var = d87.U0;
        a();
        byte[] bArr = this.b;
        if (bArr.length == 0) {
            throw new zzfx(d87Var, d87.K, (String) null, 12);
        }
        try {
            dnf dnfVar = (dnf) ((mof) fnfVar.t(7));
            fnf fnfVarR = fnf.r(dnfVar.a, bArr, bArr.length, dnf.b);
            if (fnfVarR != null && !fnf.q(fnfVarR, true)) {
                throw new zzaek(new zzagd().getMessage());
            }
            fnfVarR.getClass();
            return fnfVarR;
        } catch (Exception e) {
            throw new zzfx(d87Var, d87.p, e.getMessage(), 8);
        }
    }
}
