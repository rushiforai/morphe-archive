package p10;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final class h2 {

    /* renamed from: d, reason: collision with root package name */
    public static final y5.f f81784d = new y5.f("streak_count");

    /* renamed from: e, reason: collision with root package name */
    public static final y5.f f81785e = v70.o.h("streak_last_day");

    /* renamed from: a, reason: collision with root package name */
    public final t5.g f81786a;

    /* renamed from: b, reason: collision with root package name */
    public final Function0 f81787b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f81788c;

    public h2(t5.g gVar) {
        d2 d2Var = d2.f81742d;
        e2 e2Var = e2.f81753d;
        this.f81786a = gVar;
        this.f81787b = d2Var;
        this.f81788c = e2Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0027 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final int a(h2 h2Var, int i5, Long l9, long j11) {
        if (l9 != null) {
            if (j11 == l9.longValue()) {
                if (i5 >= 1) {
                    return i5;
                }
            } else {
                if (j11 == l9.longValue() + 1) {
                    return i5 + 1;
                }
                if (j11 >= l9.longValue() || i5 < 1) {
                }
            }
        }
        return 1;
    }
}
