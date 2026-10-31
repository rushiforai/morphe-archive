package eb0;

import java.lang.reflect.Array;
import java.util.Iterator;

/* loaded from: classes5.dex */
public final class z extends w0 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f52676d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ w0 f52677e;

    public /* synthetic */ z(w0 w0Var, int i5) {
        this.f52676d = i5;
        this.f52677e = w0Var;
    }

    @Override // eb0.w0
    public final void a(m0 m0Var, Object obj) {
        switch (this.f52676d) {
            case 0:
                Iterable iterable = (Iterable) obj;
                if (iterable != null) {
                    Iterator it = iterable.iterator();
                    while (it.hasNext()) {
                        this.f52677e.a(m0Var, it.next());
                    }
                    break;
                }
                break;
            default:
                if (obj != null) {
                    int length = Array.getLength(obj);
                    for (int i5 = 0; i5 < length; i5++) {
                        this.f52677e.a(m0Var, Array.get(obj, i5));
                    }
                    break;
                }
                break;
        }
    }
}
