package iy;

import kotlin.NoWhenBranchMatchedException;
import kotlin.enums.EnumEntriesKt;
import l1.g9;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class q implements gy.n0 {

    /* renamed from: a, reason: collision with root package name */
    public static final q f68348a;

    /* renamed from: b, reason: collision with root package name */
    public static final q f68349b;

    /* renamed from: c, reason: collision with root package name */
    public static final q f68350c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ q[] f68351d;

    static {
        q qVar = new q("ADJUST_TONE", 0);
        f68348a = qVar;
        q qVar2 = new q("BEST_OF", 1);
        f68349b = qVar2;
        q qVar3 = new q("FALLBACK", 2);
        f68350c = qVar3;
        q[] qVarArr = {qVar, qVar2, qVar3};
        f68351d = qVarArr;
        EnumEntriesKt.a(qVarArr);
    }

    public static q valueOf(String str) {
        return (q) Enum.valueOf(q.class, str);
    }

    public static q[] values() {
        return (q[]) f68351d.clone();
    }

    @Override // gy.n0
    public final void a(p1.o oVar, int i5) {
        String str;
        p1.t tVar = (p1.t) oVar;
        tVar.b0(1084629513);
        int iOrdinal = ordinal();
        if (iOrdinal == 0) {
            str = "Adjust";
        } else if (iOrdinal == 1) {
            str = "Best of";
        } else {
            if (iOrdinal != 2) {
                throw new NoWhenBranchMatchedException();
            }
            str = "Fallback";
        }
        g9.b(str, null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, tVar, 0, 0, 131070);
        tVar.p(false);
    }
}
