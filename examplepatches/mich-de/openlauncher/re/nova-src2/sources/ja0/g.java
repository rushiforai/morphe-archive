package ja0;

import com.google.android.gms.internal.measurement.v6;
import fa.t;

/* loaded from: classes5.dex */
public final class g extends ma0.j {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f69326e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f69327f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ g(Object obj, v6 v6Var, int i5, int i11, int i12) {
        super(v6Var, i5, i11);
        this.f69326e = i12;
        this.f69327f = obj;
    }

    @Override // ma0.j
    public final Object a(t tVar) {
        switch (this.f69326e) {
            case 0:
                return Integer.valueOf(tVar.m(false));
            default:
                return ul.b.Z(((na0.c) this.f69327f).f78075d.f78076a, tVar);
        }
    }

    @Override // ma0.j, java.util.ListIterator, java.util.Iterator
    public Object next() {
        switch (this.f69326e) {
            case 0:
                Object obj = ((bg.e) this.f69327f).f17884c;
                return (Integer) super.next();
            default:
                return super.next();
        }
    }
}
