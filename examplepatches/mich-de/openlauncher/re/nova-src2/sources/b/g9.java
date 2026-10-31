package b;

import ads_mobile_sdk.qc3;
import ads_mobile_sdk.rm2;
import ads_mobile_sdk.vi3;
import ads_mobile_sdk.yk0;
import android.content.Context;
import com.google.common.util.concurrent.ListenableFuture;

/* loaded from: classes2.dex */
public final /* synthetic */ class g9 implements cl.d0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15858a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f15859b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f15860c;

    public /* synthetic */ g9(int i5, Object obj, Object obj2) {
        this.f15858a = i5;
        this.f15859b = obj;
        this.f15860c = obj2;
    }

    @Override // cl.d0
    public final ListenableFuture apply(Object obj) {
        switch (this.f15858a) {
            case 0:
                qc3 qc3Var = (qc3) this.f15859b;
                rm2 rm2Var = (rm2) this.f15860c;
                vi3 vi3Var = qc3Var.f8592d;
                yk0 yk0Var = yk0.EVENT_ID_ORCAS_STORAGE_UPDATE_METADATA;
                cl.p1 p1VarA = qc3Var.f8589a.a(rm2Var);
                vi3Var.a(yk0Var, (cl.r0) p1VarA);
                return p1VarA;
            case 1:
                qc3 qc3Var2 = (qc3) this.f15859b;
                rm2 rm2Var2 = (rm2) this.f15860c;
                vi3 vi3Var2 = qc3Var2.f8592d;
                yk0 yk0Var2 = yk0.EVENT_ID_ORCAS_STORAGE_UPDATE_METADATA;
                cl.p1 p1VarA2 = qc3Var2.f8589a.a(rm2Var2);
                vi3Var2.a(yk0Var2, (cl.r0) p1VarA2);
                return p1VarA2;
            default:
                ads_mobile_sdk.f7 f7Var = (ads_mobile_sdk.f7) this.f15859b;
                return ((n) f7Var.f3211b.f3752f.get()).a((Context) this.f15860c);
        }
    }
}
