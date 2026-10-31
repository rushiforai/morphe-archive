package z1;

import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Map;
import kotlin.Unit;
import kotlin.jvm.internal.markers.KMutableIterator;

/* loaded from: classes2.dex */
public final class y implements Iterator, KMutableIterator {

    /* renamed from: a, reason: collision with root package name */
    public final s f97991a;

    /* renamed from: b, reason: collision with root package name */
    public final Iterator f97992b;

    /* renamed from: c, reason: collision with root package name */
    public int f97993c;

    /* renamed from: d, reason: collision with root package name */
    public Map.Entry f97994d;

    /* renamed from: e, reason: collision with root package name */
    public Map.Entry f97995e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f97996f;

    public y(s sVar, Iterator it, int i5) {
        this.f97996f = i5;
        this.f97991a = sVar;
        this.f97992b = it;
        this.f97993c = sVar.b().f97957d;
        a();
    }

    public final void a() {
        this.f97994d = this.f97995e;
        Iterator it = this.f97992b;
        this.f97995e = it.hasNext() ? (Map.Entry) it.next() : null;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f97995e != null;
    }

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.f97996f) {
            case 0:
                a();
                if (this.f97994d != null) {
                    return new x(this);
                }
                throw new IllegalStateException();
            case 1:
                Map.Entry entry = this.f97995e;
                if (entry == null) {
                    throw new IllegalStateException();
                }
                a();
                return entry.getKey();
            default:
                Map.Entry entry2 = this.f97995e;
                if (entry2 == null) {
                    throw new IllegalStateException();
                }
                a();
                return entry2.getValue();
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        s sVar = this.f97991a;
        if (sVar.b().f97957d != this.f97993c) {
            throw new ConcurrentModificationException();
        }
        Map.Entry entry = this.f97994d;
        if (entry == null) {
            throw new IllegalStateException();
        }
        sVar.remove(entry.getKey());
        this.f97994d = null;
        Unit unit = Unit.f71706a;
        this.f97993c = sVar.b().f97957d;
    }
}
