package defpackage;

import android.view.View;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tz6 {
    public boolean a;
    public int b;
    public int c;
    public int d;
    public int e;
    public int f;
    public int g;
    public int h;
    public int i;
    public int j;
    public List k;
    public boolean l;

    public final void a(View view) {
        int iB;
        int size = this.k.size();
        View view2 = null;
        int i = Integer.MAX_VALUE;
        for (int i2 = 0; i2 < size; i2++) {
            View view3 = ((pr0) this.k.get(i2)).a;
            txa txaVar = (txa) view3.getLayoutParams();
            if (view3 != view && !txaVar.a.g() && (iB = (txaVar.a.b() - this.d) * this.e) >= 0 && iB < i) {
                view2 = view3;
                if (iB == 0) {
                    break;
                } else {
                    i = iB;
                }
            }
        }
        if (view2 == null) {
            this.d = -1;
        } else {
            this.d = ((txa) view2.getLayoutParams()).a.b();
        }
    }

    public final View b(yxa yxaVar) {
        List list = this.k;
        if (list == null) {
            View viewD = yxaVar.d(this.d);
            this.d += this.e;
            return viewD;
        }
        int size = list.size();
        for (int i = 0; i < size; i++) {
            View view = ((pr0) this.k.get(i)).a;
            txa txaVar = (txa) view.getLayoutParams();
            if (!txaVar.a.g() && this.d == txaVar.a.b()) {
                a(view);
                return view;
            }
        }
        return null;
    }
}
