package na0;

import com.google.android.gms.internal.measurement.v6;
import java.util.AbstractSequentialList;
import java.util.ListIterator;

/* loaded from: classes5.dex */
public final class c extends AbstractSequentialList {

    /* renamed from: a, reason: collision with root package name */
    public final v6 f78072a;

    /* renamed from: b, reason: collision with root package name */
    public final int f78073b;

    /* renamed from: c, reason: collision with root package name */
    public final int f78074c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ d f78075d;

    public c(d dVar, v6 v6Var, int i5, int i11) {
        this.f78075d = dVar;
        this.f78072a = v6Var;
        this.f78073b = i5;
        this.f78074c = i11;
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator() {
        return new ja0.g(this, this.f78072a, this.f78073b, this.f78074c, 1);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f78074c;
    }

    @Override // java.util.AbstractSequentialList, java.util.AbstractList, java.util.List
    public final ListIterator listIterator(int i5) {
        ja0.g gVar = new ja0.g(this, this.f78072a, this.f78073b, this.f78074c, 1);
        for (int i11 = 0; i11 < i5; i11++) {
            gVar.next();
        }
        return gVar;
    }
}
