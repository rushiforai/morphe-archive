package defpackage;

import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@rc8("dialog")
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lob3;", "Lsc8;", "Lnb3;", "navigation-compose_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class ob3 extends sc8 {
    @Override // defpackage.sc8
    public final va8 a() {
        mz1 mz1Var = xz1.a;
        return new nb3(this);
    }

    @Override // defpackage.sc8
    public final void d(List list, ob8 ob8Var, w6 w6Var) {
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            b().h((ba8) it2.next());
        }
    }

    @Override // defpackage.sc8
    public final void i(ba8 ba8Var, boolean z) {
        b().f(ba8Var, z);
        int iB0 = bu1.B0((Iterable) b().f.a.getValue(), ba8Var);
        int i = 0;
        for (Object obj : (Iterable) b().f.a.getValue()) {
            int i2 = i + 1;
            if (i < 0) {
                d46.i0();
                throw null;
            }
            ba8 ba8Var2 = (ba8) obj;
            if (i > iB0) {
                b().c(ba8Var2);
            }
            i = i2;
        }
    }
}
