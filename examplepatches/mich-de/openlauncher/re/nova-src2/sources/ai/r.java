package ai;

import com.google.android.gms.measurement.internal.zzbf;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class r implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final Iterator f13267a;

    public r(zzbf zzbfVar) {
        this.f13267a = zzbfVar.f33767f.keySet().iterator();
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f13267a.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        return (String) this.f13267a.next();
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Remove not supported");
    }
}
