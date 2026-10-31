package wk;

import java.util.Map;

/* loaded from: classes3.dex */
public final class f0 implements Map.Entry {

    /* renamed from: a, reason: collision with root package name */
    public final Object f94516a;

    /* renamed from: b, reason: collision with root package name */
    public Object f94517b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ g0 f94518c;

    public f0(g0 g0Var, Object obj, Object obj2) {
        this.f94518c = g0Var;
        this.f94516a = obj;
        this.f94517b = obj2;
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (obj instanceof Map.Entry) {
            Map.Entry entry = (Map.Entry) obj;
            if (this.f94516a.equals(entry.getKey()) && this.f94517b.equals(entry.getValue())) {
                return true;
            }
        }
        return false;
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.f94516a;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f94517b;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        return this.f94516a.hashCode() ^ this.f94517b.hashCode();
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        Object objPut = this.f94518c.put(this.f94516a, obj);
        this.f94517b = obj;
        return objPut;
    }

    public final String toString() {
        return this.f94516a + "=" + this.f94517b;
    }
}
