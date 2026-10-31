package com.iab.omid.library.bytedance2.walking.async;

import com.iab.omid.library.bytedance2.walking.async.b;
import java.util.ArrayDeque;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public class c implements b.a {

    /* renamed from: a, reason: collision with root package name */
    private final BlockingQueue<Runnable> f35134a;

    /* renamed from: b, reason: collision with root package name */
    private final ThreadPoolExecutor f35135b;

    /* renamed from: c, reason: collision with root package name */
    private final ArrayDeque<b> f35136c = new ArrayDeque<>();

    /* renamed from: d, reason: collision with root package name */
    private b f35137d = null;

    public c() {
        LinkedBlockingQueue linkedBlockingQueue = new LinkedBlockingQueue();
        this.f35134a = linkedBlockingQueue;
        this.f35135b = new ThreadPoolExecutor(1, 1, 1L, TimeUnit.SECONDS, linkedBlockingQueue);
    }

    private void a() {
        b bVarPoll = this.f35136c.poll();
        this.f35137d = bVarPoll;
        if (bVarPoll != null) {
            bVarPoll.a(this.f35135b);
        }
    }

    public void b(b bVar) {
        bVar.a(this);
        this.f35136c.add(bVar);
        if (this.f35137d == null) {
            a();
        }
    }

    @Override // com.iab.omid.library.bytedance2.walking.async.b.a
    public void a(b bVar) {
        this.f35137d = null;
        a();
    }
}
