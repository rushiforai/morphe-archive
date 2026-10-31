package com.fyber.inneractive.sdk.nativead;

import com.fyber.inneractive.sdk.network.z;
import com.fyber.inneractive.sdk.player.cache.g;
import com.fyber.inneractive.sdk.player.cache.l;
import com.fyber.inneractive.sdk.util.IAlog;
import java.io.File;

/* loaded from: classes.dex */
public final class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ b f28679a;

    public a(b bVar) {
        this.f28679a = bVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        long j11;
        File fileA = b.a(this.f28679a);
        if (fileA != null) {
            try {
                IAlog.a("NativeCache opening the cache in directory - %s", fileA);
                this.f28679a.f28682b = g.a(fileA, 41943040L);
                g gVar = this.f28679a.f28682b;
                gVar.getClass();
                IAlog.e("DiskLruCache delete cache", new Object[0]);
                gVar.close();
                l.a(gVar.f28852a);
                this.f28679a.f28682b = g.a(fileA, 41943040L);
                g gVar2 = this.f28679a.f28682b;
                synchronized (gVar2) {
                    j11 = gVar2.f28859h;
                }
                IAlog.a("NativeCache opened the cache in directory - %s current size is %d", fileA, Long.valueOf(j11));
                b bVar = this.f28679a;
                bVar.f28682b.f28863l = bVar;
                bVar.f28683c = true;
            } catch (Throwable th2) {
                z.a("Failed to open cache directory", th2.getMessage(), null, null);
                IAlog.a("Failed to open cache directory", th2, new Object[0]);
            }
        }
    }
}
