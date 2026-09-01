package defpackage;

import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ef6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ up8 b;

    public /* synthetic */ ef6(up8 up8Var, int i) {
        this.a = i;
        this.b = up8Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        up8 up8Var = this.b;
        switch (i) {
            case 0:
                return up8Var;
            case 1:
                tp8 tp8VarB = up8Var.b();
                TimeUnit timeUnit = TimeUnit.SECONDS;
                timeUnit.getClass();
                tp8VarB.z = ggf.b(3L, timeUnit);
                return new up8(tp8VarB);
            default:
                return new z31(up8Var);
        }
    }
}
