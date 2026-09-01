package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ts4 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;

    public /* synthetic */ ts4(int i, boolean z) {
        this.a = i;
        this.b = z;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        int i2 = R.string.responses_locked_close_discussion;
        c1e c1eVar = c1e.a;
        boolean z = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else if (!z) {
                    p65Var.Y(1937634643);
                    qv5.b(vn7.J(R.drawable.ic_follow_list, 0, p65Var), vo7.R(p65Var, R.string.common_follow_catalog), null, 0L, p65Var, 8, 12);
                    p65Var.p(false);
                } else {
                    p65Var.Y(1937428431);
                    qv5.b(vn7.J(R.drawable.ic_followed_list, 0, p65Var), vo7.R(p65Var, R.string.common_unfollow_catalog), null, 0L, p65Var, 8, 12);
                    p65Var.p(false);
                }
                break;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    if (z) {
                        i2 = R.string.responses_locked_open_discussion;
                    }
                    jjd.b(vo7.R(p65Var2, i2), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var2, 0, 0, 262142);
                }
                break;
            case 2:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    if (z) {
                        i2 = R.string.responses_locked_open_discussion;
                    }
                    jjd.b(vo7.R(p65Var3, i2), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var3, 0, 0, 262142);
                }
                break;
            default:
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    jjd.b(vo7.R(p65Var4, z ? R.string.responses_hide_show_responses : R.string.responses_hide_hide_responses), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var4, 0, 0, 262142);
                }
                break;
        }
        return c1eVar;
    }
}
