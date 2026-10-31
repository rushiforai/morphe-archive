package com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache;

import android.os.ConditionVariable;

/* loaded from: classes3.dex */
public final class k extends Thread {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ConditionVariable f30326a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l f30327b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(l lVar, ConditionVariable conditionVariable) {
        super("SimpleCache.initialize()");
        this.f30327b = lVar;
        this.f30326a = conditionVariable;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() {
        synchronized (this.f30327b) {
            this.f30326a.open();
            try {
                l.a(this.f30327b);
            } catch (a e3) {
                this.f30327b.f30333f = e3;
            }
            this.f30327b.f30329b.getClass();
        }
    }
}
