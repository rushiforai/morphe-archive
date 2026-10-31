package b;

import ads_mobile_sdk.fm2;
import ads_mobile_sdk.gm2;
import ads_mobile_sdk.oc3;
import ads_mobile_sdk.rm2;
import ads_mobile_sdk.yk0;
import java.io.File;
import java.util.concurrent.Callable;

/* loaded from: classes2.dex */
public final /* synthetic */ class o7 implements Callable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15967a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ oc3 f15968b;

    public /* synthetic */ o7(oc3 oc3Var, int i5) {
        this.f15967a = i5;
        this.f15968b = oc3Var;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        switch (this.f15967a) {
            case 0:
                gm2 gm2Var = this.f15968b.f7830a;
                rm2 rm2VarA = gm2Var.a(1);
                if (rm2VarA == null) {
                    gm2Var.f4005e.b(yk0.EVENT_ID_DG_STORAGE_PROGRAM_CACHE_GET_PROGRAM_BYTECODE_NOT_FOUND);
                    return null;
                }
                String strR = rm2VarA.r().r();
                File fileP = k9.p(strR, gm2Var.a(), "pcam.jar");
                fileP.getClass();
                if (!fileP.exists()) {
                    fileP = k9.p(strR, gm2Var.a(), "pcam");
                    fileP.getClass();
                }
                File fileP2 = k9.p(strR, gm2Var.a(), "pcopt");
                fileP2.getClass();
                File fileP3 = k9.p(strR, gm2Var.a(), "pcbc");
                fileP3.getClass();
                return new fm2(rm2VarA.r(), fileP, fileP3, fileP2);
            default:
                rm2 rm2VarA2 = this.f15968b.f7830a.a(1);
                return rm2VarA2 == null ? rm2.q() : rm2VarA2;
        }
    }
}
