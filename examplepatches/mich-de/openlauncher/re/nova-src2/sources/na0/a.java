package na0;

import com.google.android.gms.internal.measurement.mi;
import com.google.android.gms.internal.measurement.v6;
import java.util.AbstractSet;
import java.util.Iterator;

/* loaded from: classes5.dex */
public final class a extends AbstractSet {

    /* renamed from: a, reason: collision with root package name */
    public final v6 f78064a;

    /* renamed from: b, reason: collision with root package name */
    public final int f78065b;

    /* renamed from: c, reason: collision with root package name */
    public final int f78066c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ b f78067d;

    public a(b bVar, v6 v6Var, int i5, int i11) {
        this.f78067d = bVar;
        this.f78064a = v6Var;
        this.f78065b = i5;
        this.f78066c = i11;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        return new mi(this, this.f78064a, this.f78065b, this.f78066c);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.f78066c;
    }
}
