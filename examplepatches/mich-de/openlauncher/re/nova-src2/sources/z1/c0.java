package z1;

import java.util.ListIterator;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.markers.KMutableListIterator;

/* loaded from: classes2.dex */
public final class c0 implements ListIterator, KMutableListIterator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f97904a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ d0 f97905b;

    public c0(Ref.IntRef intRef, d0 d0Var) {
        this.f97904a = intRef;
        this.f97905b = d0Var;
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        throw new IllegalStateException("Cannot modify a state list through an iterator");
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        return this.f97904a.f71861a < this.f97905b.f97911d - 1;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f97904a.f71861a >= 0;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        Ref.IntRef intRef = this.f97904a;
        int i5 = intRef.f71861a + 1;
        d0 d0Var = this.f97905b;
        q.a(i5, d0Var.f97911d);
        intRef.f71861a = i5;
        return d0Var.get(i5);
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.f97904a.f71861a + 1;
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        Ref.IntRef intRef = this.f97904a;
        int i5 = intRef.f71861a;
        d0 d0Var = this.f97905b;
        q.a(i5, d0Var.f97911d);
        intRef.f71861a = i5 - 1;
        return d0Var.get(i5);
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.f97904a.f71861a;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final void remove() {
        throw new IllegalStateException("Cannot modify a state list through an iterator");
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        throw new IllegalStateException("Cannot modify a state list through an iterator");
    }
}
