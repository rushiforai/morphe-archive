package qh;

import b.c0;

/* loaded from: classes3.dex */
public final class d implements b {

    /* renamed from: a, reason: collision with root package name */
    public final e f84073a = new e();

    /* renamed from: b, reason: collision with root package name */
    public volatile b f84074b;

    /* renamed from: c, reason: collision with root package name */
    public Object f84075c;

    public d(b bVar) {
        this.f84074b = bVar;
    }

    public final String toString() {
        Object objL = this.f84074b;
        if (objL == null) {
            objL = c0.l("<supplier that returned ", String.valueOf(this.f84075c), ">");
        }
        return c0.l("Suppliers.memoize(", objL.toString(), ")");
    }

    @Override // qh.b
    public final Object zza() {
        if (this.f84074b != null) {
            synchronized (this.f84073a) {
                try {
                    if (this.f84074b != null) {
                        Object objZza = this.f84074b.zza();
                        this.f84075c = objZza;
                        this.f84074b = null;
                        return objZza;
                    }
                } finally {
                }
            }
        }
        return this.f84075c;
    }
}
