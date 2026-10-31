package n0;

import kotlin.ranges.IntRange;
import p1.s2;
import p1.y2;

/* loaded from: classes.dex */
public final class i0 implements y2 {

    /* renamed from: a, reason: collision with root package name */
    public final int f77429a;

    /* renamed from: b, reason: collision with root package name */
    public final int f77430b;

    /* renamed from: c, reason: collision with root package name */
    public final p1.e1 f77431c;

    /* renamed from: d, reason: collision with root package name */
    public int f77432d;

    public i0(int i5, int i11, int i12) {
        this.f77429a = i11;
        this.f77430b = i12;
        int i13 = (i5 / i11) * i11;
        this.f77431c = androidx.compose.runtime.d.j(kotlin.ranges.a.m0(Math.max(i13 - i12, 0), i13 + i11 + i12), p1.g1.f81425e);
        this.f77432d = i5;
    }

    public final void a(int i5) {
        if (i5 != this.f77432d) {
            this.f77432d = i5;
            int i11 = this.f77429a;
            int i12 = (i5 / i11) * i11;
            int i13 = this.f77430b;
            ((s2) this.f77431c).setValue(kotlin.ranges.a.m0(Math.max(i12 - i13, 0), i12 + i11 + i13));
        }
    }

    @Override // p1.y2
    public final Object getValue() {
        return (IntRange) ((s2) this.f77431c).getValue();
    }
}
