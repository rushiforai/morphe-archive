package androidx.appcompat.view;

import a5.i1;
import a5.j1;
import android.view.View;
import android.view.animation.Interpolator;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class k {

    /* renamed from: c, reason: collision with root package name */
    public Interpolator f13660c;

    /* renamed from: d, reason: collision with root package name */
    public j1 f13661d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f13662e;

    /* renamed from: b, reason: collision with root package name */
    public long f13659b = -1;

    /* renamed from: f, reason: collision with root package name */
    public final j f13663f = new j(this);

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f13658a = new ArrayList();

    public final void a() {
        if (this.f13662e) {
            Iterator it = this.f13658a.iterator();
            while (it.hasNext()) {
                ((i1) it.next()).b();
            }
            this.f13662e = false;
        }
    }

    public final void b() {
        View view;
        if (this.f13662e) {
            return;
        }
        Iterator it = this.f13658a.iterator();
        while (it.hasNext()) {
            i1 i1Var = (i1) it.next();
            long j11 = this.f13659b;
            if (j11 >= 0) {
                i1Var.c(j11);
            }
            Interpolator interpolator = this.f13660c;
            if (interpolator != null && (view = (View) i1Var.f299a.get()) != null) {
                view.animate().setInterpolator(interpolator);
            }
            if (this.f13661d != null) {
                i1Var.d(this.f13663f);
            }
            View view2 = (View) i1Var.f299a.get();
            if (view2 != null) {
                view2.animate().start();
            }
        }
        this.f13662e = true;
    }
}
