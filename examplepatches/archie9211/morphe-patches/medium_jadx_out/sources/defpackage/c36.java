package defpackage;

import android.view.View;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c36 extends up1 {
    public final View d;
    public int e;
    public int f;
    public final int[] g;

    public c36(View view) {
        super(0);
        this.g = new int[2];
        this.d = view;
    }

    @Override // defpackage.up1
    public final void d(f4f f4fVar) {
        this.d.setTranslationY(0.0f);
    }

    @Override // defpackage.up1
    public final void e(f4f f4fVar) {
        View view = this.d;
        int[] iArr = this.g;
        view.getLocationOnScreen(iArr);
        this.e = iArr[1];
    }

    @Override // defpackage.up1
    public final z4f f(z4f z4fVar, List list) {
        Iterator it2 = list.iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            if ((((f4f) it2.next()).a.d() & 8) != 0) {
                this.d.setTranslationY(yw.c(r0.a.c(), this.f, 0));
                break;
            }
        }
        return z4fVar;
    }

    @Override // defpackage.up1
    public final mya g(f4f f4fVar, mya myaVar) {
        View view = this.d;
        int[] iArr = this.g;
        view.getLocationOnScreen(iArr);
        int i = this.e - iArr[1];
        this.f = i;
        view.setTranslationY(i);
        return myaVar;
    }
}
