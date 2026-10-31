package xk;

import java.util.Map;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class y0 extends lh.h {

    /* renamed from: b, reason: collision with root package name */
    public final lh.h f96060b;

    /* renamed from: c, reason: collision with root package name */
    public Object f96061c;

    /* renamed from: d, reason: collision with root package name */
    public lh.h f96062d;

    public y0(f1 f1Var) {
        super(1);
        this.f96060b = f1Var.f95911d.entrySet().iterator();
        this.f96061c = null;
        this.f96062d = p1.f95986e;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f96062d.hasNext() || this.f96060b.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!this.f96062d.hasNext()) {
            Map.Entry entry = (Map.Entry) this.f96060b.next();
            this.f96061c = entry.getKey();
            this.f96062d = ((q0) entry.getValue()).iterator();
        }
        Object obj = this.f96061c;
        Objects.requireNonNull(obj);
        return new r0(obj, this.f96062d.next());
    }
}
