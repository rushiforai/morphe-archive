package e0;

import android.content.Context;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final Context f50056a;

    /* renamed from: b, reason: collision with root package name */
    public final y3.c f50057b;

    /* renamed from: c, reason: collision with root package name */
    public final long f50058c;

    /* renamed from: d, reason: collision with root package name */
    public final k0.o1 f50059d;

    public l(Context context, y3.c cVar, long j11, k0.o1 o1Var) {
        this.f50056a = context;
        this.f50057b = cVar;
        this.f50058c = j11;
        this.f50059d = o1Var;
    }

    public final k a() {
        return new k(this.f50056a, this.f50057b, this.f50058c, this.f50059d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!l.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        Intrinsics.e(obj, "null cannot be cast to non-null type androidx.compose.foundation.AndroidEdgeEffectOverscrollFactory");
        l lVar = (l) obj;
        if (!Intrinsics.b(this.f50056a, lVar.f50056a) || !Intrinsics.b(this.f50057b, lVar.f50057b)) {
            return false;
        }
        long j11 = lVar.f50058c;
        int i5 = i2.s.n;
        return ULong.a(this.f50058c, j11) && Intrinsics.b(this.f50059d, lVar.f50059d);
    }

    public final int hashCode() {
        int iHashCode = (this.f50057b.hashCode() + (this.f50056a.hashCode() * 31)) * 31;
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return this.f50059d.hashCode() + b.c0.d(iHashCode, 31, this.f50058c);
    }
}
