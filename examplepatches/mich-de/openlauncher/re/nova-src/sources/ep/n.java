package ep;

import java.util.Map;

/* loaded from: classes4.dex */
public final class n implements Map.Entry {

    /* renamed from: a, reason: collision with root package name */
    public n f52880a;

    /* renamed from: b, reason: collision with root package name */
    public n f52881b;

    /* renamed from: c, reason: collision with root package name */
    public n f52882c;

    /* renamed from: d, reason: collision with root package name */
    public n f52883d;

    /* renamed from: e, reason: collision with root package name */
    public n f52884e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f52885f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f52886g;

    /* renamed from: h, reason: collision with root package name */
    public Object f52887h;

    /* renamed from: i, reason: collision with root package name */
    public int f52888i;

    public n(boolean z11) {
        this.f52885f = null;
        this.f52886g = z11;
        this.f52884e = this;
        this.f52883d = this;
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (obj instanceof Map.Entry) {
            Map.Entry entry = (Map.Entry) obj;
            Object obj2 = this.f52885f;
            if (obj2 != null ? obj2.equals(entry.getKey()) : entry.getKey() == null) {
                Object obj3 = this.f52887h;
                if (obj3 == null) {
                    if (entry.getValue() == null) {
                        return true;
                    }
                } else if (obj3.equals(entry.getValue())) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.f52885f;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f52887h;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        Object obj = this.f52885f;
        int iHashCode = obj == null ? 0 : obj.hashCode();
        Object obj2 = this.f52887h;
        return (obj2 != null ? obj2.hashCode() : 0) ^ iHashCode;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        if (obj == null && !this.f52886g) {
            throw new NullPointerException("value == null");
        }
        Object obj2 = this.f52887h;
        this.f52887h = obj;
        return obj2;
    }

    public final String toString() {
        return this.f52885f + "=" + this.f52887h;
    }

    public n(boolean z11, n nVar, Object obj, n nVar2, n nVar3) {
        this.f52880a = nVar;
        this.f52885f = obj;
        this.f52886g = z11;
        this.f52888i = 1;
        this.f52883d = nVar2;
        this.f52884e = nVar3;
        nVar3.f52883d = this;
        nVar2.f52884e = this;
    }
}
