package defpackage;

import android.view.View;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.donkey.write.EditPostFragment;
import java.util.Iterator;
import java.util.List;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class am0 implements vh3 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ am0(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.vh3
    public final void dispose() {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                ((vl0) obj2).b((x02) obj);
                return;
            case 1:
                ((ba8) obj2).h.j.b((kb3) obj);
                return;
            case 2:
                iv2 iv2Var = ((EditPostFragment) obj2).F0;
                if (iv2Var != null) {
                    ((EditPostBodyView) iv2Var.h).getViewTreeObserver().removeOnGlobalFocusChangeListener((zp3) obj);
                    return;
                } else {
                    g76.g0("binding");
                    throw null;
                }
            case 3:
                ((iy6) obj2).getLifecycle().b((di4) obj);
                return;
            case 4:
                ((n16) obj2).a.l((l16) obj);
                return;
            case 5:
                ((View) obj2).getViewTreeObserver().removeOnPreDrawListener((rk6) obj);
                return;
            case 6:
                ((sv6) obj2).c.k(obj);
                return;
            case 7:
                Iterator it2 = ((List) ((upc) obj2).getValue()).iterator();
                while (it2.hasNext()) {
                    ((d12) obj).b().c((ba8) it2.next());
                }
                return;
            case 8:
                ((iy6) obj2).getLifecycle().b((di4) obj);
                return;
            case 9:
                ((vl0) obj2).b((j12) obj);
                return;
            case 10:
                ((vjd) obj2).c.remove((x45) obj);
                return;
            case 11:
                ((dsd) obj2).j.remove((dsd) obj);
                return;
            case 12:
                dsd dsdVar = (dsd) obj2;
                dsdVar.getClass();
                wrd wrdVar = (wrd) ((xrd) obj).b.getValue();
                if (wrdVar != null) {
                    dsdVar.i.remove(wrdVar.a);
                    return;
                }
                return;
            case 13:
                ((dsd) obj2).i.remove((bsd) obj);
                return;
            default:
                f5f f5fVar = (f5f) obj2;
                View view = (View) obj;
                int i2 = f5fVar.u - 1;
                f5fVar.u = i2;
                if (i2 == 0) {
                    WeakHashMap weakHashMap = ute.a;
                    mte.c(view, null);
                    f4f.a(view, null);
                    view.removeOnAttachStateChangeListener(f5fVar.v);
                    return;
                }
                return;
        }
    }
}
