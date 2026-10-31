package com.fyber.inneractive.sdk.player.cache;

import com.fyber.inneractive.sdk.network.z;
import com.fyber.inneractive.sdk.util.IAlog;
import java.io.File;

/* loaded from: classes.dex */
public final class m implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ n f28873a;

    public m(n nVar) {
        this.f28873a = nVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        long j11;
        File fileA = n.a(this.f28873a.f28875a, "fyb.vamp.vid.cache");
        if (fileA != null) {
            try {
                IAlog.a("VideoCache opening the cache in directory - %s", fileA);
                this.f28873a.f28876b = g.a(fileA, 52428800L);
                g gVar = this.f28873a.f28876b;
                gVar.getClass();
                IAlog.e("DiskLruCache delete cache", new Object[0]);
                gVar.close();
                l.a(gVar.f28852a);
                this.f28873a.f28876b = g.a(fileA, 52428800L);
                g gVar2 = this.f28873a.f28876b;
                synchronized (gVar2) {
                    j11 = gVar2.f28859h;
                }
                IAlog.a("VideoCache opened the cache in directory - %s current size is %d", fileA, Long.valueOf(j11));
                n nVar = this.f28873a;
                nVar.f28876b.f28863l = nVar;
                nVar.f28877c = true;
            } catch (Throwable th2) {
                z.a("Failed to open cache directory", th2.getMessage(), null, null);
                IAlog.a("Failed to open cache directory", th2, new Object[0]);
            }
        }
    }
}
