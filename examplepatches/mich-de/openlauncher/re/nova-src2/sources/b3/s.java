package b3;

import androidx.compose.ui.Modifier$Node;
import java.util.ListIterator;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes2.dex */
public final class s implements ListIterator, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public int f17328a;

    /* renamed from: b, reason: collision with root package name */
    public final int f17329b;

    /* renamed from: c, reason: collision with root package name */
    public final int f17330c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ u f17331d;

    public s(u uVar, int i5, int i11) {
        this(uVar, (i11 & 1) != 0 ? 0 : i5, 0, uVar.f17374a.f97841b);
    }

    @Override // java.util.ListIterator
    public final /* bridge */ /* synthetic */ void add(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        return this.f17328a < this.f17330c;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f17328a > this.f17329b;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        z.j0 j0Var = this.f17331d.f17374a;
        int i5 = this.f17328a;
        this.f17328a = i5 + 1;
        Object objB = j0Var.b(i5);
        Intrinsics.e(objB, "null cannot be cast to non-null type androidx.compose.ui.Modifier.Node");
        return (Modifier$Node) objB;
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.f17328a - this.f17329b;
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        z.j0 j0Var = this.f17331d.f17374a;
        int i5 = this.f17328a - 1;
        this.f17328a = i5;
        Object objB = j0Var.b(i5);
        Intrinsics.e(objB, "null cannot be cast to non-null type androidx.compose.ui.Modifier.Node");
        return (Modifier$Node) objB;
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return (this.f17328a - this.f17329b) - 1;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.ListIterator
    public final /* bridge */ /* synthetic */ void set(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    public s(u uVar, int i5, int i11, int i12) {
        this.f17331d = uVar;
        this.f17328a = i5;
        this.f17329b = i11;
        this.f17330c = i12;
    }
}
