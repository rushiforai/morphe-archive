package com.fyber.inneractive.sdk.cache.session;

import java.util.PriorityQueue;

/* loaded from: classes.dex */
public final class k extends PriorityQueue {

    /* renamed from: a, reason: collision with root package name */
    public final int f27696a;

    public k(int i5) {
        super(1, new l());
        this.f27696a = i5;
    }

    @Override // java.util.PriorityQueue, java.util.AbstractQueue, java.util.AbstractCollection, java.util.Collection, java.util.Queue
    public final boolean add(g gVar) {
        boolean zAdd = super.add((k) gVar);
        if (size() > this.f27696a) {
            poll();
        }
        return zAdd;
    }
}
