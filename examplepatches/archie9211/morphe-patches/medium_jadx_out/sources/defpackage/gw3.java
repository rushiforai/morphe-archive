package defpackage;

import android.view.KeyEvent;
import android.view.View;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gw3 implements View.OnKeyListener {
    public final m45 a;
    public final m45 b;
    public final m45 c;

    public gw3(m45 m45Var, m45 m45Var2, m45 m45Var3) {
        this.a = m45Var;
        this.b = m45Var2;
        this.c = m45Var3;
    }

    @Override // android.view.View.OnKeyListener
    public final boolean onKey(View view, int i, KeyEvent keyEvent) {
        view.getClass();
        keyEvent.getClass();
        Object objInvoke = this.a.invoke();
        if (((Number) objInvoke).intValue() == -1) {
            objInvoke = null;
        }
        Integer num = (Integer) objInvoke;
        if (num == null) {
            return false;
        }
        int iIntValue = num.intValue();
        Iterable iterable = (Iterable) this.b.invoke();
        ArrayList<hv3> arrayList = new ArrayList();
        for (Object obj : iterable) {
            if (obj instanceof hv3) {
                arrayList.add(obj);
            }
        }
        for (hv3 hv3Var : arrayList) {
            n46 n46Var = (n46) this.c.invoke();
            int i2 = n46Var.a;
            int i3 = n46Var.b;
            if (hv3Var.c(iIntValue, Math.min(i2, i3), Math.max(i2, i3), keyEvent)) {
                return true;
            }
        }
        return false;
    }
}
