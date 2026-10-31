package com.fyber.inneractive.sdk.protobuf;

import java.util.AbstractList;
import java.util.List;

/* loaded from: classes3.dex */
public final class i1 extends AbstractList {

    /* renamed from: a, reason: collision with root package name */
    public final List f30815a;

    /* renamed from: b, reason: collision with root package name */
    public final h1 f30816b;

    public i1(List list, h1 h1Var) {
        this.f30815a = list;
        this.f30816b = h1Var;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        h1 h1Var = this.f30816b;
        Object obj = this.f30815a.get(i5);
        ((com.fyber.inneractive.sdk.bidder.j) h1Var).getClass();
        com.fyber.inneractive.sdk.bidder.o0 o0VarA = com.fyber.inneractive.sdk.bidder.o0.a(((Integer) obj).intValue());
        return o0VarA == null ? com.fyber.inneractive.sdk.bidder.o0.UNRECOGNIZED : o0VarA;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f30815a.size();
    }
}
