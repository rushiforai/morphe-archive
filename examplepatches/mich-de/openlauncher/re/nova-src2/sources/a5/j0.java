package a5;

import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes2.dex */
public final class j0 implements Iterator, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f310a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public Iterator f311b;

    public j0(c1 c1Var) {
        this.f311b = c1Var;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f311b.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        Object next = this.f311b.next();
        View view = (View) next;
        ViewGroup viewGroup = view instanceof ViewGroup ? (ViewGroup) view : null;
        c1 c1Var = viewGroup != null ? new c1(viewGroup) : null;
        ArrayList arrayList = this.f310a;
        if (c1Var != null && c1Var.hasNext()) {
            arrayList.add(this.f311b);
            this.f311b = c1Var;
            return next;
        }
        while (!this.f311b.hasNext() && !arrayList.isEmpty()) {
            this.f311b = (Iterator) b70.g.h1(arrayList);
            b70.d.H0(arrayList);
        }
        return next;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
