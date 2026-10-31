package ads_mobile_sdk;

import b.l1;
import b.o2;

/* loaded from: classes2.dex */
public final class ui0 implements l1 {

    /* renamed from: a, reason: collision with root package name */
    public final b.w4 f10336a;

    /* renamed from: b, reason: collision with root package name */
    public final vi3 f10337b;

    /* renamed from: c, reason: collision with root package name */
    public final o2 f10338c;

    /* renamed from: d, reason: collision with root package name */
    public final long f10339d;

    public ui0(b.w4 w4Var, vi3 vi3Var, o2 o2Var, long j11) {
        this.f10336a = w4Var;
        this.f10337b = vi3Var;
        this.f10338c = o2Var;
        this.f10339d = j11;
    }

    @Override // b.l1
    public final boolean a(rm2 rm2Var) {
        vi3 vi3Var = this.f10337b;
        if (rm2Var == null || rm2Var.equals(rm2.q())) {
            vi3Var.b(yk0.EVENT_ID_DG_VALIDATOR_UPDATE_METADATA_NOT_FOUND);
            return true;
        }
        if (rm2Var.p() != this.f10336a.get()) {
            vi3Var.b(yk0.EVENT_ID_DG_VALIDATOR_UPDATE_METADATA_ARCH_MISMATCH);
            return true;
        }
        long jQ = rm2Var.r().q() * 1000;
        this.f10338c.getClass();
        boolean z11 = jQ - System.currentTimeMillis() <= this.f10339d;
        if (z11) {
            vi3Var.b(yk0.EVENT_ID_DG_VALIDATOR_UPDATE_PROGRAM_ALMOST_EXPIRED);
        }
        return z11;
    }

    @Override // b.l1
    public final boolean b(rm2 rm2Var) {
        vi3 vi3Var = this.f10337b;
        if (rm2Var == null || rm2Var.equals(rm2.q())) {
            vi3Var.b(yk0.EVENT_ID_DG_VALIDATOR_INIT_METADATA_NOT_FOUND);
            return false;
        }
        if (rm2Var.p() == this.f10336a.get()) {
            return true;
        }
        vi3Var.b(yk0.EVENT_ID_DG_VALIDATOR_INIT_METADATA_ARCH_MISMATCH);
        return false;
    }
}
