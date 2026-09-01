package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w5d implements vq6, Serializable {
    public m45 a;
    public volatile Object b;
    public final Object c;

    public w5d(m45 m45Var) {
        m45Var.getClass();
        this.a = m45Var;
        this.b = h1c.k;
        this.c = this;
    }

    private final Object writeReplace() {
        return new t16(getValue());
    }

    public final boolean a() {
        return this.b != h1c.k;
    }

    @Override // defpackage.vq6
    public final Object getValue() {
        Object objInvoke;
        Object obj = this.b;
        h1c h1cVar = h1c.k;
        if (obj != h1cVar) {
            return obj;
        }
        synchronized (this.c) {
            objInvoke = this.b;
            if (objInvoke == h1cVar) {
                m45 m45Var = this.a;
                m45Var.getClass();
                objInvoke = m45Var.invoke();
                this.b = objInvoke;
                this.a = null;
            }
        }
        return objInvoke;
    }

    public final String toString() {
        return a() ? String.valueOf(getValue()) : "Lazy value not initialized yet.";
    }
}
