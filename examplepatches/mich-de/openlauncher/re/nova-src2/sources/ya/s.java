package ya;

import android.util.SparseArray;
import java.util.Iterator;

/* loaded from: classes.dex */
public final class s extends SparseArray implements Iterable {
    public final void c() {
    }

    @Override // android.util.SparseArray
    public final SparseArray clone() {
        return (s) super.clone();
    }

    public final boolean d(int i5) {
        return indexOfKey(i5) >= 0;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new ma0.i(this, 1);
    }

    @Override // android.util.SparseArray
    public final Object clone() {
        return (s) super.clone();
    }
}
