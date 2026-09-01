package defpackage;

import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v70 implements Iterator, Map.Entry {
    public int a;
    public int b = -1;
    public boolean c;
    public final /* synthetic */ y70 d;

    public v70(y70 y70Var) {
        this.d = y70Var;
        this.a = y70Var.c - 1;
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (!this.c) {
            ygf.f("This container does not support retaining Map.Entry objects");
            return false;
        }
        if (obj instanceof Map.Entry) {
            Map.Entry entry = (Map.Entry) obj;
            Object key = entry.getKey();
            int i = this.b;
            y70 y70Var = this.d;
            if (g76.L(key, y70Var.f(i)) && g76.L(entry.getValue(), y70Var.i(this.b))) {
                return true;
            }
        }
        return false;
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        if (this.c) {
            return this.d.f(this.b);
        }
        ygf.f("This container does not support retaining Map.Entry objects");
        return null;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        if (this.c) {
            return this.d.i(this.b);
        }
        ygf.f("This container does not support retaining Map.Entry objects");
        return null;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.b < this.a;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        if (!this.c) {
            ygf.f("This container does not support retaining Map.Entry objects");
            return 0;
        }
        int i = this.b;
        y70 y70Var = this.d;
        Object objF = y70Var.f(i);
        Object objI = y70Var.i(this.b);
        return (objF == null ? 0 : objF.hashCode()) ^ (objI != null ? objI.hashCode() : 0);
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            ywb.n();
            return null;
        }
        this.b++;
        this.c = true;
        return this;
    }

    @Override // java.util.Iterator
    public final void remove() {
        if (!this.c) {
            lg8.d();
            return;
        }
        this.d.g(this.b);
        this.b--;
        this.a--;
        this.c = false;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        if (this.c) {
            return this.d.h(this.b, obj);
        }
        ygf.f("This container does not support retaining Map.Entry objects");
        return null;
    }

    public final String toString() {
        return getKey() + "=" + getValue();
    }
}
