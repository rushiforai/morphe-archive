package xk;

import java.util.Map;

/* loaded from: classes3.dex */
public final class z extends r {

    /* renamed from: a, reason: collision with root package name */
    public final Object f96067a;

    /* renamed from: b, reason: collision with root package name */
    public int f96068b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ a0 f96069c;

    public z(a0 a0Var, int i5) {
        this.f96069c = a0Var;
        Object obj = a0.f95848j;
        this.f96067a = a0Var.j()[i5];
        this.f96068b = i5;
    }

    public final void a() {
        int i5 = this.f96068b;
        Object obj = this.f96067a;
        a0 a0Var = this.f96069c;
        if (i5 != -1 && i5 < a0Var.size()) {
            if (ps.v.q(obj, a0Var.j()[this.f96068b])) {
                return;
            }
        }
        Object obj2 = a0.f95848j;
        this.f96068b = a0Var.e(obj);
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.f96067a;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        a0 a0Var = this.f96069c;
        Map mapC = a0Var.c();
        if (mapC != null) {
            return mapC.get(this.f96067a);
        }
        a();
        int i5 = this.f96068b;
        if (i5 == -1) {
            return null;
        }
        return a0Var.k()[i5];
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        a0 a0Var = this.f96069c;
        Map mapC = a0Var.c();
        Object obj2 = this.f96067a;
        if (mapC != null) {
            return mapC.put(obj2, obj);
        }
        a();
        int i5 = this.f96068b;
        if (i5 == -1) {
            a0Var.put(obj2, obj);
            return null;
        }
        Object obj3 = a0Var.k()[i5];
        a0Var.k()[this.f96068b] = obj;
        return obj3;
    }
}
