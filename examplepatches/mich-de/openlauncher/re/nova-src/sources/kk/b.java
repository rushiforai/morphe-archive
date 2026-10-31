package kk;

/* loaded from: classes3.dex */
public final class b implements c {

    /* renamed from: c, reason: collision with root package name */
    public static final Object f71528c = new Object();

    /* renamed from: a, reason: collision with root package name */
    public volatile c f71529a;

    /* renamed from: b, reason: collision with root package name */
    public volatile Object f71530b;

    public static c a(c cVar) {
        if (cVar instanceof b) {
            return cVar;
        }
        b bVar = new b();
        bVar.f71530b = f71528c;
        bVar.f71529a = cVar;
        return bVar;
    }

    @Override // kk.c
    public final Object zza() {
        Object objZza;
        Object obj = this.f71530b;
        Object obj2 = f71528c;
        if (obj != obj2) {
            return obj;
        }
        synchronized (this) {
            try {
                objZza = this.f71530b;
                if (objZza == obj2) {
                    objZza = this.f71529a.zza();
                    Object obj3 = this.f71530b;
                    if (obj3 != obj2 && obj3 != objZza) {
                        throw new IllegalStateException("Scoped provider was invoked recursively returning different results: " + obj3 + " & " + objZza + ". This is likely due to a circular dependency.");
                    }
                    this.f71530b = objZza;
                    this.f71529a = null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return objZza;
    }
}
