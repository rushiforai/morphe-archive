package defpackage;

import android.view.View;
import android.view.animation.Interpolator;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kve {
    public Interpolator c;
    public lve d;
    public boolean e;
    public long b = -1;
    public final aod f = new aod(this);
    public final ArrayList a = new ArrayList();

    public final void a() {
        if (this.e) {
            Iterator it2 = this.a.iterator();
            while (it2.hasNext()) {
                ((jve) it2.next()).b();
            }
            this.e = false;
        }
    }

    public final void b() {
        View view;
        if (this.e) {
            return;
        }
        for (jve jveVar : this.a) {
            long j = this.b;
            if (j >= 0) {
                jveVar.c(j);
            }
            Interpolator interpolator = this.c;
            if (interpolator != null && (view = (View) jveVar.a.get()) != null) {
                view.animate().setInterpolator(interpolator);
            }
            if (this.d != null) {
                jveVar.d(this.f);
            }
            View view2 = (View) jveVar.a.get();
            if (view2 != null) {
                view2.animate().start();
            }
        }
        this.e = true;
    }
}
