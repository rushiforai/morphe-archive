package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class yj9 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ bg9 b;

    public /* synthetic */ yj9(bg9 bg9Var, int i) {
        this.a = i;
        this.b = bg9Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        bg9 bg9Var = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jjd.b(vo7.Q(R.string.common_stop_featuring_this_story, new Object[]{bg9Var.b}, p65Var), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var, 0, 0, 262142);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    jjd.b(vo7.Q(R.string.common_stop_featuring_this_story, new Object[]{bg9Var.b}, p65Var2), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var2, 0, 0, 262142);
                }
                break;
        }
        return c1eVar;
    }
}
