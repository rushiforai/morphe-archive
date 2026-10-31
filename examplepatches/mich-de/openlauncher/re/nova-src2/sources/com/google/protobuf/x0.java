package com.google.protobuf;

import java.util.AbstractList;
import java.util.List;

/* loaded from: classes.dex */
public final class x0 extends AbstractList {

    /* renamed from: a, reason: collision with root package name */
    public final List f34999a;

    /* renamed from: b, reason: collision with root package name */
    public final w0 f35000b;

    public x0(List list, w0 w0Var) {
        this.f34999a = list;
        this.f35000b = w0Var;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        return this.f35000b.convert(this.f34999a.get(i5));
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f34999a.size();
    }
}
