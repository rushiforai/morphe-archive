package b0;

import c0.w1;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class u0 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f16248j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ f1 f16249k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ g1 f16250l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ u0(f1 f1Var, g1 g1Var, int i5) {
        super(1);
        this.f16248j = i5;
        this.f16249k = f1Var;
        this.f16250l = g1Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x0084  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        c0.c0 c0Var;
        c0.c0 c0Var2;
        c0.c0 c0Var3;
        c0.c0 c0Var4;
        switch (this.f16248j) {
            case 0:
                w1 w1Var = (w1) obj;
                r0 r0Var = r0.f16218a;
                r0 r0Var2 = r0.f16219b;
                if (w1Var.c(r0Var, r0Var2)) {
                    h1 h1Var = this.f16249k.f16126a.f16260a;
                    return (h1Var == null || (c0Var2 = h1Var.f16138a) == null) ? z0.f16287b : c0Var2;
                }
                if (!w1Var.c(r0Var2, r0.f16220c)) {
                    return z0.f16287b;
                }
                h1 h1Var2 = this.f16250l.f16133a.f16260a;
                return (h1Var2 == null || (c0Var = h1Var2.f16138a) == null) ? z0.f16287b : c0Var;
            case 1:
                int iOrdinal = ((r0) obj).ordinal();
                float f11 = 0.0f;
                if (iOrdinal != 0) {
                    if (iOrdinal == 1) {
                        f11 = 1.0f;
                    } else {
                        if (iOrdinal != 2) {
                            throw new NoWhenBranchMatchedException();
                        }
                        if (this.f16250l.f16133a.f16260a == null) {
                        }
                    }
                } else if (this.f16249k.f16126a.f16260a == null) {
                }
                return Float.valueOf(f11);
            case 2:
                w1 w1Var2 = (w1) obj;
                r0 r0Var3 = r0.f16218a;
                r0 r0Var4 = r0.f16219b;
                if (w1Var2.c(r0Var3, r0Var4)) {
                    m1 m1Var = this.f16249k.f16126a.f16263d;
                    return (m1Var == null || (c0Var4 = m1Var.f16188c) == null) ? z0.f16287b : c0Var4;
                }
                if (!w1Var2.c(r0Var4, r0.f16220c)) {
                    return z0.f16287b;
                }
                m1 m1Var2 = this.f16250l.f16133a.f16263d;
                return (m1Var2 == null || (c0Var3 = m1Var2.f16188c) == null) ? z0.f16287b : c0Var3;
            default:
                int iOrdinal2 = ((r0) obj).ordinal();
                float f12 = 1.0f;
                if (iOrdinal2 == 0) {
                    m1 m1Var3 = this.f16249k.f16126a.f16263d;
                    if (m1Var3 != null) {
                        f12 = m1Var3.f16186a;
                    }
                } else if (iOrdinal2 != 1) {
                    if (iOrdinal2 != 2) {
                        throw new NoWhenBranchMatchedException();
                    }
                    m1 m1Var4 = this.f16250l.f16133a.f16263d;
                    if (m1Var4 != null) {
                        f12 = m1Var4.f16186a;
                    }
                }
                return Float.valueOf(f12);
        }
    }
}
