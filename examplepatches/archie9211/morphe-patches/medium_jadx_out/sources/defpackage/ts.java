package defpackage;

import android.view.ActionMode;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ts implements hhd {
    public final View a;
    public final x45 b;
    public final m45 c;
    public final z78 d = new z78();
    public final gjc e = new gjc(new ns(this, 0));
    public final ns f = new ns(this, 1);
    public final ns g = new ns(this, 2);
    public ActionMode h;
    public ss i;
    public Runnable j;

    public ts(View view, x45 x45Var, m45 m45Var) {
        this.a = view;
        this.b = x45Var;
        this.c = m45Var;
    }

    @Override // defpackage.hhd
    public final Object a(ygd ygdVar, p4d p4dVar) {
        Object objA = z78.a(this.d, new il(this, ygdVar, null, 3), p4dVar);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }
}
