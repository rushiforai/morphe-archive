package qh;

import b.c0;
import java.io.Serializable;

/* loaded from: classes3.dex */
public final class c implements Serializable, b {

    /* renamed from: a, reason: collision with root package name */
    public final transient e f84069a = new e();

    /* renamed from: b, reason: collision with root package name */
    public final b f84070b;

    /* renamed from: c, reason: collision with root package name */
    public volatile transient boolean f84071c;

    /* renamed from: d, reason: collision with root package name */
    public transient Object f84072d;

    public c(b bVar) {
        this.f84070b = bVar;
    }

    public final String toString() {
        return c0.l("Suppliers.memoize(", (this.f84071c ? c0.l("<supplier that returned ", String.valueOf(this.f84072d), ">") : this.f84070b).toString(), ")");
    }

    @Override // qh.b
    public final Object zza() {
        if (!this.f84071c) {
            synchronized (this.f84069a) {
                try {
                    if (!this.f84071c) {
                        Object objZza = this.f84070b.zza();
                        this.f84072d = objZza;
                        this.f84071c = true;
                        return objZza;
                    }
                } finally {
                }
            }
        }
        return this.f84072d;
    }
}
