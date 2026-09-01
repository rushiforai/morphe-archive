package defpackage;

import com.medium.android.donkey.main.MainActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class te7 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ MainActivity b;

    public /* synthetic */ te7(MainActivity mainActivity, int i) {
        this.a = i;
        this.b = mainActivity;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.m45
    public final Object invoke() {
        float f;
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = 2;
        int i3 = 0;
        Object[] objArr = 0;
        n92 n92Var = null;
        MainActivity mainActivity = this.b;
        switch (i) {
            case 0:
                int i4 = MainActivity.H;
                sg7 sg7VarV = mainActivity.v();
                vx0.c0(f76.F(sg7VarV), null, null, new wd0((Object) sg7VarV, (boolean) (objArr == true ? 1 : 0), n92Var, i2), 3);
                return c1eVar;
            case 1:
                int i5 = MainActivity.H;
                sg7 sg7VarV2 = mainActivity.v();
                vx0.c0(f76.F(sg7VarV2), null, null, new wd0((Object) sg7VarV2, true, n92Var, i2), 3);
                return c1eVar;
            case 2:
                wm2 wm2Var = mainActivity.x;
                if (wm2Var != null) {
                    return (sg7) wm2Var.get();
                }
                g76.g0("vmFactory");
                throw null;
            default:
                int i6 = MainActivity.H;
                w23 w23Var = mainActivity.v().E;
                vq6 vq6Var = mainActivity.A;
                sp4 sp4Var = new sp4(w23Var, (xpc) vq6Var.getValue(), new ve7(3, null), i3);
                xx6 xx6VarX = o7f.x(mainActivity);
                if (((Boolean) ((xpc) vq6Var.getValue()).getValue()).booleanValue()) {
                    hl0 hl0Var = as7.a;
                    f = 56.0f;
                } else {
                    f = 0.0f;
                }
                return bo.e0(sp4Var, xx6VarX, l7c.b, new vj3(f));
        }
    }
}
