package com.fyber.inneractive.sdk.cache.session;

import com.fyber.inneractive.sdk.util.o;
import java.io.UnsupportedEncodingException;

/* loaded from: classes3.dex */
public final class d implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.cache.session.enums.a f27682a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.cache.session.enums.c f27683b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e f27684c;

    public d(e eVar, com.fyber.inneractive.sdk.cache.session.enums.a aVar, com.fyber.inneractive.sdk.cache.session.enums.c cVar) {
        this.f27684c = eVar;
        this.f27682a = aVar;
        this.f27683b = cVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        synchronized (this.f27684c.f27687c) {
            try {
                com.fyber.inneractive.sdk.cache.session.enums.a aVar = this.f27682a;
                if (aVar != com.fyber.inneractive.sdk.cache.session.enums.a.NEW_SESSION) {
                    g gVar = (g) this.f27684c.f27685a.f27695a.get(this.f27683b);
                    if (gVar != null) {
                        int i5 = f.f27690a[aVar.ordinal()];
                        if (i5 == 1) {
                            gVar.f27692b++;
                        } else if (i5 == 2) {
                            gVar.f27693c++;
                        } else if (i5 == 3) {
                            gVar.f27691a++;
                        }
                    }
                } else {
                    this.f27684c.f27685a = new i();
                }
                try {
                    o.a(o.f31210a, e.a(this.f27684c).toString().getBytes("UTF-8"));
                } catch (UnsupportedEncodingException unused) {
                }
                this.f27684c.getClass();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
