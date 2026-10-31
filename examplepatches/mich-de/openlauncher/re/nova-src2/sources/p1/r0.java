package p1;

import java.util.Iterator;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes2.dex */
public final class r0 implements Iterator, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81533a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final g2 f81534b;

    /* renamed from: c, reason: collision with root package name */
    public final int f81535c;

    /* renamed from: d, reason: collision with root package name */
    public int f81536d;

    /* renamed from: e, reason: collision with root package name */
    public int f81537e;

    public r0(g2 g2Var, int i5, int i11) {
        this.f81534b = g2Var;
        this.f81535c = i11;
        this.f81536d = i5;
        this.f81537e = g2Var.f81434h;
        if (g2Var.f81433g) {
            i2.f();
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.f81533a) {
            case 0:
                return this.f81536d < this.f81535c;
            default:
                throw null;
        }
    }

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.f81533a) {
            case 0:
                g2 g2Var = this.f81534b;
                int i5 = g2Var.f81434h;
                int i11 = this.f81537e;
                if (i5 != i11) {
                    i2.f();
                }
                int i12 = this.f81536d;
                this.f81536d = i2.a(g2Var.f81427a, i12) + i12;
                return new h2(g2Var, i12, i11);
            default:
                throw null;
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.f81533a) {
            case 0:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    public r0(g2 g2Var, int i5, s0 s0Var, vh.a aVar) {
        this.f81534b = g2Var;
        this.f81535c = i5;
        this.f81536d = g2Var.f81434h;
    }
}
