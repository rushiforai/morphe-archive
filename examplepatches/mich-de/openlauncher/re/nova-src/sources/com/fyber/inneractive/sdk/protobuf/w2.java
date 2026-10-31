package com.fyber.inneractive.sdk.protobuf;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes3.dex */
public final class w2 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public int f30938a;

    /* renamed from: b, reason: collision with root package name */
    public Iterator f30939b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e3 f30940c;

    public w2(e3 e3Var) {
        this.f30940c = e3Var;
        this.f30938a = e3Var.f30790b.size();
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        int i5 = this.f30938a;
        if (i5 > 0 && i5 <= this.f30940c.f30790b.size()) {
            return true;
        }
        if (this.f30939b == null) {
            this.f30939b = this.f30940c.f30794f.entrySet().iterator();
        }
        return this.f30939b.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (this.f30939b == null) {
            this.f30939b = this.f30940c.f30794f.entrySet().iterator();
        }
        if (this.f30939b.hasNext()) {
            if (this.f30939b == null) {
                this.f30939b = this.f30940c.f30794f.entrySet().iterator();
            }
            return (Map.Entry) this.f30939b.next();
        }
        List list = this.f30940c.f30790b;
        int i5 = this.f30938a - 1;
        this.f30938a = i5;
        return (Map.Entry) list.get(i5);
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }
}
