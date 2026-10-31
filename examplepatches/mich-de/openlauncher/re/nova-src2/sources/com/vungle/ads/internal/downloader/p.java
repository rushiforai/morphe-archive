package com.vungle.ads.internal.downloader;

import java.util.concurrent.locks.ReentrantLock;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.FunctionReferenceImpl;

/* loaded from: classes4.dex */
public final /* synthetic */ class p extends FunctionReferenceImpl implements Function0 {
    public p(Object obj) {
        super(0, 0, t.class, obj, "getOrCreateDownloader", "getOrCreateDownloader()Lcom/vungle/ads/internal/downloader/AssetDownloader;");
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        i iVar;
        t tVar = (t) this.receiver;
        i iVar2 = tVar.f46808g;
        if (iVar2 != null) {
            return iVar2;
        }
        ReentrantLock reentrantLock = tVar.f46804c;
        reentrantLock.lock();
        try {
            if (tVar.f46806e) {
                iVar = null;
            } else {
                i iVar3 = tVar.f46808g;
                if (iVar3 == null) {
                    iVar3 = new i(((com.vungle.ads.internal.executor.d) tVar.f46802a).f46825f, tVar.f46803b);
                    tVar.f46808g = iVar3;
                }
                iVar = iVar3;
            }
            return iVar;
        } finally {
            reentrantLock.unlock();
        }
    }
}
