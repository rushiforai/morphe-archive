package com.fyber.inneractive.sdk.protobuf;

import java.util.Iterator;
import java.util.Map;

/* loaded from: classes3.dex */
public final class c3 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public int f30776a = -1;

    /* renamed from: b, reason: collision with root package name */
    public boolean f30777b;

    /* renamed from: c, reason: collision with root package name */
    public Iterator f30778c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ e3 f30779d;

    public c3(e3 e3Var) {
        this.f30779d = e3Var;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        if (this.f30776a + 1 >= this.f30779d.f30790b.size()) {
            if (this.f30779d.f30791c.isEmpty()) {
                return false;
            }
            if (this.f30778c == null) {
                this.f30778c = this.f30779d.f30791c.entrySet().iterator();
            }
            if (!this.f30778c.hasNext()) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.Iterator
    public final Object next() {
        this.f30777b = true;
        int i5 = this.f30776a + 1;
        this.f30776a = i5;
        if (i5 < this.f30779d.f30790b.size()) {
            return (Map.Entry) this.f30779d.f30790b.get(this.f30776a);
        }
        if (this.f30778c == null) {
            this.f30778c = this.f30779d.f30791c.entrySet().iterator();
        }
        return (Map.Entry) this.f30778c.next();
    }

    @Override // java.util.Iterator
    public final void remove() {
        if (!this.f30777b) {
            throw new IllegalStateException("remove() was called before next()");
        }
        this.f30777b = false;
        e3 e3Var = this.f30779d;
        int i5 = e3.f30788h;
        e3Var.a();
        if (this.f30776a >= this.f30779d.f30790b.size()) {
            if (this.f30778c == null) {
                this.f30778c = this.f30779d.f30791c.entrySet().iterator();
            }
            this.f30778c.remove();
            return;
        }
        e3 e3Var2 = this.f30779d;
        int i11 = this.f30776a;
        this.f30776a = i11 - 1;
        e3Var2.a();
        Object obj = ((b3) e3Var2.f30790b.remove(i11)).f30772b;
        if (e3Var2.f30791c.isEmpty()) {
            return;
        }
        Iterator it = e3Var2.c().entrySet().iterator();
        e3Var2.f30790b.add(new b3(e3Var2, (Map.Entry) it.next()));
        it.remove();
    }
}
