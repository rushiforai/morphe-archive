package com.fyber.inneractive.sdk.protobuf;

import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class p1 extends c implements q1, RandomAccess {

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f30869b;

    static {
        new p1(10).f30774a = false;
    }

    public p1(int i5) {
        this.f30869b = new ArrayList(i5);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.q1
    public final q1 a() {
        return this.f30774a ? new r3(this) : this;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        c();
        this.f30869b.add(i5, (String) obj);
        ((AbstractList) this).modCount++;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        return addAll(this.f30869b.size(), collection);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.k1
    public final k1 b(int i5) {
        if (i5 < this.f30869b.size()) {
            throw new IllegalArgumentException();
        }
        ArrayList arrayList = new ArrayList(i5);
        arrayList.addAll(this.f30869b);
        return new p1(arrayList);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        c();
        this.f30869b.clear();
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        Object obj = this.f30869b.get(i5);
        if (obj instanceof String) {
            return (String) obj;
        }
        if (obj instanceof s) {
            s sVar = (s) obj;
            String strF = sVar.f();
            if (sVar.c()) {
                this.f30869b.set(i5, strF);
            }
            return strF;
        }
        byte[] bArr = (byte[]) obj;
        String strA = l1.a(bArr);
        if (d4.f30786a.b(bArr, 0, bArr.length)) {
            this.f30869b.set(i5, strA);
        }
        return strA;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        c();
        Object objRemove = this.f30869b.remove(i5);
        ((AbstractList) this).modCount++;
        return objRemove instanceof String ? (String) objRemove : objRemove instanceof s ? ((s) objRemove).f() : l1.a((byte[]) objRemove);
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        c();
        Object obj2 = this.f30869b.set(i5, (String) obj);
        return obj2 instanceof String ? (String) obj2 : obj2 instanceof s ? ((s) obj2).f() : l1.a((byte[]) obj2);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f30869b.size();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.q1
    public final void a(s sVar) {
        c();
        this.f30869b.add(sVar);
        ((AbstractList) this).modCount++;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.List
    public final boolean addAll(int i5, Collection collection) {
        c();
        if (collection instanceof q1) {
            collection = ((q1) collection).b();
        }
        boolean zAddAll = this.f30869b.addAll(i5, collection);
        ((AbstractList) this).modCount++;
        return zAddAll;
    }

    public p1(ArrayList arrayList) {
        this.f30869b = arrayList;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.q1
    public final Object a(int i5) {
        return this.f30869b.get(i5);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.q1
    public final List b() {
        return Collections.unmodifiableList(this.f30869b);
    }
}
