package xk;

import java.util.Iterator;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class z0 extends lh.h {

    /* renamed from: b, reason: collision with root package name */
    public int f96070b;

    /* renamed from: c, reason: collision with root package name */
    public Object f96071c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Iterator f96072d;

    public z0(lh.h hVar) {
        super(1);
        this.f96072d = hVar;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f96070b > 0 || this.f96072d.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (this.f96070b <= 0) {
            e2 e2Var = (e2) this.f96072d.next();
            this.f96071c = ((j2) e2Var).f95943a;
            this.f96070b = ((j2) e2Var).a();
        }
        this.f96070b--;
        Object obj = this.f96071c;
        Objects.requireNonNull(obj);
        return obj;
    }
}
