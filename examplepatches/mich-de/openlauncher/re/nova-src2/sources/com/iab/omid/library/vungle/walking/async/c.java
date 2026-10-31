package com.iab.omid.library.vungle.walking.async;

import com.iab.omid.library.vungle.walking.async.b;
import java.util.ArrayDeque;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public class c implements b.a {

    /* renamed from: a, reason: collision with root package name */
    private final BlockingQueue<Runnable> f35299a;

    /* renamed from: b, reason: collision with root package name */
    private final ThreadPoolExecutor f35300b;

    /* renamed from: c, reason: collision with root package name */
    private final ArrayDeque<b> f35301c = new ArrayDeque<>();

    /* renamed from: d, reason: collision with root package name */
    private b f35302d = null;

    public c() {
        LinkedBlockingQueue linkedBlockingQueue = new LinkedBlockingQueue();
        this.f35299a = linkedBlockingQueue;
        this.f35300b = new ThreadPoolExecutor(1, 1, 1L, TimeUnit.SECONDS, linkedBlockingQueue);
    }

    private void a() {
        b bVarPoll = this.f35301c.poll();
        this.f35302d = bVarPoll;
        if (bVarPoll != null) {
            bVarPoll.a(this.f35300b);
        }
    }

    public void b(b bVar) {
        bVar.a(this);
        this.f35301c.add(bVar);
        if (this.f35302d == null) {
            a();
        }
    }

    @Override // com.iab.omid.library.vungle.walking.async.b.a
    public void a(b bVar) {
        this.f35302d = null;
        a();
    }
}
