package a5;

import android.view.View;
import android.view.ViewGroup;
import java.util.Iterator;
import kotlin.jvm.internal.markers.KMutableIterator;

/* loaded from: classes.dex */
public final class c1 implements Iterator, KMutableIterator {

    /* renamed from: a, reason: collision with root package name */
    public int f264a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ViewGroup f265b;

    public c1(ViewGroup viewGroup) {
        this.f265b = viewGroup;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f264a < this.f265b.getChildCount();
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i5 = this.f264a;
        this.f264a = i5 + 1;
        View childAt = this.f265b.getChildAt(i5);
        if (childAt != null) {
            return childAt;
        }
        throw new IndexOutOfBoundsException();
    }

    @Override // java.util.Iterator
    public final void remove() {
        int i5 = this.f264a - 1;
        this.f264a = i5;
        this.f265b.removeViewAt(i5);
    }
}
