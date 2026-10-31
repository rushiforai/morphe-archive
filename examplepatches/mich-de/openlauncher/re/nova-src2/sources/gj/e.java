package gj;

import a5.h2;
import a5.l1;
import a5.t1;
import android.view.View;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public final class e extends l1 {

    /* renamed from: c, reason: collision with root package name */
    public final View f57702c;

    /* renamed from: d, reason: collision with root package name */
    public int f57703d;

    /* renamed from: e, reason: collision with root package name */
    public int f57704e;

    /* renamed from: f, reason: collision with root package name */
    public final int[] f57705f;

    public e(View view) {
        super(0);
        this.f57705f = new int[2];
        this.f57702c = view;
    }

    @Override // a5.l1
    public final void d(t1 t1Var) {
        this.f57702c.setTranslationY(0.0f);
    }

    @Override // a5.l1
    public final void e() {
        View view = this.f57702c;
        int[] iArr = this.f57705f;
        view.getLocationOnScreen(iArr);
        this.f57703d = iArr[1];
    }

    @Override // a5.l1
    public final h2 f(h2 h2Var, List list) {
        Iterator it = list.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            if ((((t1) it.next()).f369a.c() & 8) != 0) {
                this.f57702c.setTranslationY(cj.a.c(r0.f369a.b(), this.f57704e, 0));
                break;
            }
        }
        return h2Var;
    }

    @Override // a5.l1
    public final c10.a g(t1 t1Var, c10.a aVar) {
        View view = this.f57702c;
        int[] iArr = this.f57705f;
        view.getLocationOnScreen(iArr);
        int i5 = this.f57703d - iArr[1];
        this.f57704e = i5;
        view.setTranslationY(i5);
        return aVar;
    }
}
