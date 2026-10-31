package xk;

import java.util.Iterator;

/* loaded from: classes3.dex */
public final class n1 extends b {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f95975d = 0;

    /* renamed from: e, reason: collision with root package name */
    public final Iterator f95976e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f95977f;

    public n1(Iterator it, vk.m mVar) {
        this.f95976e = it;
        this.f95977f = mVar;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // xk.b
    public final Object a() {
        Object next;
        Object next2;
        switch (this.f95975d) {
            case 0:
                do {
                    Iterator it = this.f95976e;
                    if (!it.hasNext()) {
                        this.f95861b = 3;
                        break;
                    } else {
                        next = it.next();
                    }
                } while (!((vk.m) this.f95977f).apply(next));
            default:
                do {
                    Iterator it2 = this.f95976e;
                    if (!it2.hasNext()) {
                        this.f95861b = 3;
                        break;
                    } else {
                        next2 = it2.next();
                    }
                } while (!((d3) this.f95977f).f95897b.contains(next2));
        }
        return null;
    }

    public n1(d3 d3Var) {
        this.f95977f = d3Var;
        this.f95976e = d3Var.f95896a.iterator();
    }
}
