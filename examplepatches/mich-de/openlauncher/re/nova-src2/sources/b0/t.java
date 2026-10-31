package b0;

import java.util.regex.Pattern;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class t extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f16236j = 1;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ long f16237k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Object f16238l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Object f16239m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(long j11, String str, String str2) {
        super(1);
        this.f16237k = j11;
        this.f16238l = str;
        this.f16239m = str2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        boolean zJ;
        int i5 = this.f16236j;
        Object obj2 = this.f16238l;
        Object obj3 = this.f16239m;
        switch (i5) {
            case 0:
                z2.h1.k((z2.h1) obj, (z2.i1) obj3, ((v) obj2).f16254c.f16267b.a((r2.f98081a << 32) | (r2.f98082b & 4294967295L), this.f16237k, y3.n.f96612a));
                return Unit.f71706a;
            default:
                String str = (String) obj3;
                String str2 = (String) obj2;
                String it = (String) obj;
                Intrinsics.g(it, "it");
                int[] iArr = new int[it.length()];
                int[] iArr2 = {-1};
                long j11 = this.f16237k;
                if (j11 == 2001) {
                    Pattern pattern = u40.g.f90586a;
                    zJ = ((Boolean) u40.g.l(it, str2, str, iArr, iArr2).f71683a).booleanValue();
                } else if (j11 == 2000) {
                    Pattern pattern2 = u40.g.f90586a;
                    zJ = u40.g.k(it, str2, str, iArr, iArr2);
                } else {
                    Pattern pattern3 = u40.g.f90586a;
                    zJ = u40.g.j(it, str2, str, iArr, iArr2);
                }
                if (zJ) {
                    return u40.g.a(str2, iArr);
                }
                return null;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(v vVar, z2.i1 i1Var, long j11) {
        super(1);
        this.f16238l = vVar;
        this.f16239m = i1Var;
        this.f16237k = j11;
    }
}
