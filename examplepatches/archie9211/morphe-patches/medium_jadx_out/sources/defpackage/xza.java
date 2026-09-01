package defpackage;

import com.medium.stats.ui.user.UserStatsTab;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xza implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ x45 b;

    public /* synthetic */ xza(int i, x45 x45Var) {
        this.a = i;
        this.b = x45Var;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        x45 x45Var = this.b;
        switch (i) {
            case 0:
                x45Var.invoke(new Integer(((Number) obj).intValue()));
                break;
            case 1:
                Boolean bool = (Boolean) obj;
                bool.booleanValue();
                x45Var.invoke(bool);
                break;
            default:
                x45Var.invoke(((i04) UserStatsTab.getEntries()).get(((Number) obj).intValue()));
                break;
        }
        return c1eVar;
    }
}
