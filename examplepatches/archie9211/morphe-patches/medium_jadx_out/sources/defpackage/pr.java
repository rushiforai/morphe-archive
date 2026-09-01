package defpackage;

import android.os.Handler;
import android.os.Looper;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pr extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ dd9 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ pr(dd9 dd9Var, int i) {
        super(1);
        this.a = i;
        this.b = dd9Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        dd9 dd9Var = this.b;
        switch (i) {
            case 0:
                hp6 hp6VarY = ((hp6) obj).y();
                hp6VarY.getClass();
                dd9Var.p(hp6VarY);
                break;
            case 1:
                s46 s46Var = (s46) obj;
                long j = s46Var.a;
                dd9Var.m104setPopupContentSizefhxjrPA(s46Var);
                dd9Var.q();
                break;
            default:
                m45 m45Var = (m45) obj;
                Handler handler = dd9Var.getHandler();
                if ((handler != null ? handler.getLooper() : null) != Looper.myLooper()) {
                    Handler handler2 = dd9Var.getHandler();
                    if (handler2 != null) {
                        handler2.post(new wm(6, m45Var));
                    }
                } else {
                    m45Var.invoke();
                }
                break;
        }
        return c1eVar;
    }
}
