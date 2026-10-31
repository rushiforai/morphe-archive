package q00;

import e10.s2;
import p1.e1;
import p1.y2;

/* loaded from: classes.dex */
public final class l implements y2, e1 {

    /* renamed from: a, reason: collision with root package name */
    public final s2 f83362a;

    /* renamed from: b, reason: collision with root package name */
    public final y2 f83363b;

    public l(s2 s2Var, e1 e1Var) {
        this.f83362a = s2Var;
        this.f83363b = e1Var;
    }

    @Override // p1.y2
    public final Object getValue() {
        return this.f83363b.getValue();
    }

    @Override // p1.e1
    public final void setValue(Object obj) {
        this.f83362a.i(obj);
    }
}
