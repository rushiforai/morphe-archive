package com.fyber.inneractive.sdk.protobuf;

import java.util.AbstractList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class r3 extends AbstractList implements q1, RandomAccess {

    /* renamed from: a, reason: collision with root package name */
    public final q1 f30888a;

    public r3(q1 q1Var) {
        this.f30888a = q1Var;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.q1
    public final q1 a() {
        return this;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.q1
    public final List b() {
        return this.f30888a.b();
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        return (String) this.f30888a.get(i5);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        return new q3(this);
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator(int i5) {
        return new p3(this, i5);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f30888a.size();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.q1
    public final Object a(int i5) {
        return this.f30888a.a(i5);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.q1
    public final void a(s sVar) {
        throw new UnsupportedOperationException();
    }
}
