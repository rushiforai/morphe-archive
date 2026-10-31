package ai;

/* loaded from: classes3.dex */
public final class i4 {

    /* renamed from: a, reason: collision with root package name */
    public final j4 f13016a;

    /* renamed from: b, reason: collision with root package name */
    public int f13017b = 1;

    /* renamed from: c, reason: collision with root package name */
    public long f13018c = a();

    public i4(j4 j4Var) {
        this.f13016a = j4Var;
    }

    public final long a() {
        j4 j4Var = this.f13016a;
        sg.w.h(j4Var);
        long jLongValue = ((Long) x.f13447v.a(null)).longValue();
        long jLongValue2 = ((Long) x.f13449w.a(null)).longValue();
        for (int i5 = 1; i5 < this.f13017b; i5++) {
            jLongValue += jLongValue;
            if (jLongValue >= jLongValue2) {
                break;
            }
        }
        j4Var.e().getClass();
        return Math.min(jLongValue, jLongValue2) + System.currentTimeMillis();
    }
}
