package defpackage;

import android.view.MotionEvent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xb9 extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ yb9 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xb9(yb9 yb9Var, int i) {
        super(1);
        this.a = i;
        this.b = yb9Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        yb9 yb9Var = this.b;
        switch (i) {
            case 0:
                MotionEvent motionEvent = (MotionEvent) obj;
                x45 x45Var = yb9Var.b;
                if (x45Var != null) {
                    x45Var.invoke(motionEvent);
                    return c1eVar;
                }
                g76.g0("onTouchEvent");
                throw null;
            default:
                MotionEvent motionEvent2 = (MotionEvent) obj;
                x45 x45Var2 = yb9Var.b;
                if (x45Var2 != null) {
                    x45Var2.invoke(motionEvent2);
                    return c1eVar;
                }
                g76.g0("onTouchEvent");
                throw null;
        }
    }
}
