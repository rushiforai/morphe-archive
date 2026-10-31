package w70;

import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class r1 implements t70.a1 {

    /* renamed from: a, reason: collision with root package name */
    public final t1 f93999a;

    /* renamed from: b, reason: collision with root package name */
    public final long f94000b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f94001c;

    /* renamed from: d, reason: collision with root package name */
    public final t70.m f94002d;

    public r1(t1 t1Var, long j11, Object obj, t70.m mVar) {
        this.f93999a = t1Var;
        this.f94000b = j11;
        this.f94001c = obj;
        this.f94002d = mVar;
    }

    @Override // t70.a1
    public final void dispose() {
        t1 t1Var = this.f93999a;
        synchronized (t1Var) {
            if (this.f94000b < t1Var.o()) {
                return;
            }
            Object[] objArr = t1Var.f94024h;
            Intrinsics.d(objArr);
            long j11 = this.f94000b;
            if (objArr[((int) j11) & (objArr.length - 1)] != this) {
                return;
            }
            u1.d(objArr, j11, u1.f94041a);
            t1Var.j();
            Unit unit = Unit.f71706a;
        }
    }
}
