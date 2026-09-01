package defpackage;

import android.graphics.Bitmap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mo8 implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ yo8 b;

    public /* synthetic */ mo8(yo8 yo8Var, int i) {
        this.a = i;
        this.b = yo8Var;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) throws Throwable {
        int i = this.a;
        yo8 yo8Var = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ho8 ho8Var = (ho8) obj;
                String str = ho8Var.a;
                Bitmap bitmap = ho8Var.b;
                go8 go8Var = yo8Var.f;
                Object objM0 = vx0.m0(go8Var.a, new lm1(bitmap, go8Var, str, null, 9), n92Var);
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                if (objM0 != tb2Var) {
                    objM0 = c1eVar;
                }
                return objM0 == tb2Var ? objM0 : c1eVar;
            default:
                ho8 ho8Var2 = (ho8) obj;
                String str2 = ho8Var2.a;
                Bitmap bitmap2 = ho8Var2.b;
                go8 go8Var2 = yo8Var.f;
                Object objM02 = vx0.m0(go8Var2.a, new lm1(bitmap2, go8Var2, str2, null, 9), n92Var);
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                if (objM02 != tb2Var2) {
                    objM02 = c1eVar;
                }
                return objM02 == tb2Var2 ? objM02 : c1eVar;
        }
    }
}
