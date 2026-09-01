package defpackage;

import android.os.Handler;
import android.os.Looper;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gn extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ mn b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gn(mn mnVar, int i) {
        super(1);
        this.a = i;
        this.b = mnVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        mn mnVar = this.b;
        switch (i) {
            case 0:
                ((or4) mnVar.getFocusOwner()).g(((br4) obj).a, false);
                return c1eVar;
            case 1:
                m45 m45Var = (m45) obj;
                mnVar.getUncaughtExceptionHandler$ui();
                Handler handler = mnVar.getHandler();
                if ((handler != null ? handler.getLooper() : null) == Looper.myLooper()) {
                    m45Var.invoke();
                } else {
                    Handler handler2 = mnVar.getHandler();
                    if (handler2 != null) {
                        handler2.post(new wm(1, m45Var));
                    }
                }
                return c1eVar;
            default:
                return new kr(mnVar, mnVar.getTextInputService(), (sb2) obj);
        }
    }
}
