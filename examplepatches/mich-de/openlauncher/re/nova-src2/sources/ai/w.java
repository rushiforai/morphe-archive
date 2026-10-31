package ai;

import b.kc;

/* loaded from: classes3.dex */
public final class w {

    /* renamed from: f, reason: collision with root package name */
    public static final Object f13380f = new Object();

    /* renamed from: a, reason: collision with root package name */
    public final String f13381a;

    /* renamed from: b, reason: collision with root package name */
    public final s f13382b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f13383c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f13384d = new Object();

    /* renamed from: e, reason: collision with root package name */
    public volatile Object f13385e = null;

    public /* synthetic */ w(String str, Object obj, s sVar) {
        this.f13381a = str;
        this.f13383c = obj;
        this.f13382b = sVar;
    }

    public final Object a(Object obj) {
        synchronized (this.f13384d) {
        }
        if (obj != null) {
            return obj;
        }
        if (b2.n == null) {
            return this.f13383c;
        }
        synchronized (f13380f) {
            try {
                if (kc.b()) {
                    return this.f13385e == null ? this.f13383c : this.f13385e;
                }
                try {
                    for (w wVar : x.f13400a) {
                        if (kc.b()) {
                            throw new IllegalStateException("Refreshing flag cache must be done on a worker thread.");
                        }
                        Object objZza = null;
                        try {
                            s sVar = wVar.f13382b;
                            if (sVar != null) {
                                objZza = sVar.zza();
                            }
                        } catch (IllegalStateException unused) {
                        }
                        synchronized (f13380f) {
                            wVar.f13385e = objZza;
                        }
                    }
                } catch (SecurityException unused2) {
                }
                s sVar2 = this.f13382b;
                if (sVar2 != null) {
                    try {
                        return sVar2.zza();
                    } catch (IllegalStateException | SecurityException unused3) {
                    }
                }
                return this.f13383c;
            } finally {
            }
        }
    }
}
