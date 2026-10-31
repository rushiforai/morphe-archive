package b;

import ads_mobile_sdk.km2;
import ads_mobile_sdk.oc3;
import ads_mobile_sdk.vi3;
import ads_mobile_sdk.w53;
import ads_mobile_sdk.yk0;
import com.google.common.util.concurrent.ListenableFuture;

/* loaded from: classes2.dex */
public final /* synthetic */ class j5 implements cl.d0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15901a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f15902b;

    public /* synthetic */ j5(Object obj, int i5) {
        this.f15901a = i5;
        this.f15902b = obj;
    }

    @Override // cl.d0
    public final ListenableFuture apply(Object obj) {
        switch (this.f15901a) {
            case 0:
                return ((km2) this.f15902b).f5888c.a();
            default:
                oc3 oc3Var = (oc3) ((w53) this.f15902b).f11049b;
                vi3 vi3Var = oc3Var.f7832c;
                yk0 yk0Var = yk0.EVENT_ID_DG_STORAGE_GET_PROGRAM;
                cl.p1 p1VarD = cl.w0.d(new o7(oc3Var, 0), oc3Var.f7831b);
                vi3Var.a(yk0Var, (cl.r0) p1VarD);
                return p1VarD;
        }
    }
}
