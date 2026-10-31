package xk;

import java.io.Serializable;

/* loaded from: classes.dex */
public final class r0 extends r implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final Object f96003a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f96004b;

    public r0(Object obj, Object obj2) {
        this.f96003a = obj;
        this.f96004b = obj2;
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.f96003a;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f96004b;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        throw new UnsupportedOperationException();
    }
}
