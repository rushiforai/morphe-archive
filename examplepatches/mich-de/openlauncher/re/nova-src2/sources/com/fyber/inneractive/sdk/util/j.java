package com.fyber.inneractive.sdk.util;

import java.util.concurrent.ConcurrentLinkedQueue;

/* loaded from: classes3.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final ConcurrentLinkedQueue f31196a = new ConcurrentLinkedQueue();

    /* renamed from: b, reason: collision with root package name */
    public final i f31197b;

    public j(int i5, i iVar) {
        for (int i11 = 0; i11 < i5; i11++) {
            this.f31196a.offer(iVar.a());
        }
        this.f31197b = iVar;
    }
}
