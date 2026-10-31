package p1;

import java.util.Iterator;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes2.dex */
public final class h2 implements Iterable, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final g2 f81446a;

    /* renamed from: b, reason: collision with root package name */
    public final int f81447b;

    /* renamed from: c, reason: collision with root package name */
    public final int f81448c;

    public h2(g2 g2Var, int i5, int i11) {
        this.f81446a = g2Var;
        this.f81447b = i5;
        this.f81448c = i11;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        g2 g2Var = this.f81446a;
        if (g2Var.f81434h != this.f81448c) {
            i2.f();
        }
        int i5 = this.f81447b;
        g2Var.g(i5);
        return new r0(g2Var, i5 + 1, i2.a(g2Var.f81427a, i5) + i5);
    }
}
