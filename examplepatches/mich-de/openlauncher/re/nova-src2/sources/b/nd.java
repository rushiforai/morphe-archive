package b;

import ads_mobile_sdk.yk0;
import ads_mobile_sdk.yl0;
import ads_mobile_sdk.ym3;
import ads_mobile_sdk.zm3;
import com.google.common.util.concurrent.ListenableFuture;

/* loaded from: classes2.dex */
public final /* synthetic */ class nd implements cl.d0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15958a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ zm3 f15959b;

    public /* synthetic */ nd(zm3 zm3Var, int i5) {
        this.f15958a = i5;
        this.f15959b = zm3Var;
    }

    @Override // cl.d0
    public final ListenableFuture apply(Object obj) {
        switch (this.f15958a) {
            case 0:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                zm3 zm3Var = this.f15959b;
                if (zBooleanValue) {
                    return zm3Var.c(0);
                }
                zm3Var.f12594d.b(yk0.EVENT_ID_PRIMARY_UPDATE_PROGRAM_NOOP_LOCAL_PROGRAM_STILL_VALID);
                return cl.w0.b(ym3.f12212b);
            default:
                yl0 yl0Var = (yl0) obj;
                s4 s4Var = this.f15959b.f12593c;
                if (yl0Var.q$1() == 2) {
                    return s4Var.a(yl0Var.p(), yl0Var.o().c());
                }
                if (yl0Var.q$1() == 3) {
                    return s4Var.a(yl0Var.p(), yl0Var.r().c(), yl0Var.o().c());
                }
                throw new AssertionError("Unreachable");
        }
    }
}
