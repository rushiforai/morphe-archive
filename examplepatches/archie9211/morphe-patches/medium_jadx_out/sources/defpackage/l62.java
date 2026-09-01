package defpackage;

import android.os.Handler;
import android.os.Looper;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l62 extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m62 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l62(m62 m62Var, int i) {
        super(1);
        this.a = i;
        this.b = m62Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        m62 m62Var = this.b;
        switch (i) {
            case 0:
                m45 m45Var = (m45) obj;
                if (!g76.L(Looper.myLooper(), Looper.getMainLooper())) {
                    Handler handler = m62Var.b;
                    if (handler == null) {
                        handler = new Handler(Looper.getMainLooper());
                        m62Var.b = handler;
                    }
                    handler.post(new wm(5, m45Var));
                } else {
                    m45Var.invoke();
                }
                break;
            default:
                m62Var.d = true;
                break;
        }
        return c1eVar;
    }
}
