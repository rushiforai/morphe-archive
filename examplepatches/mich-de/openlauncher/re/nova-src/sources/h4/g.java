package h4;

import java.util.Iterator;

/* loaded from: classes2.dex */
public class g extends f {

    /* renamed from: m, reason: collision with root package name */
    public int f59119m;

    public g(o oVar) {
        super(oVar);
        if (oVar instanceof k) {
            this.f59111e = 2;
        } else {
            this.f59111e = 3;
        }
    }

    @Override // h4.f
    public final void d(int i5) {
        if (this.f59116j) {
            return;
        }
        this.f59116j = true;
        this.f59113g = i5;
        Iterator it = this.f59117k.iterator();
        while (it.hasNext()) {
            d dVar = (d) it.next();
            dVar.a(dVar);
        }
    }
}
