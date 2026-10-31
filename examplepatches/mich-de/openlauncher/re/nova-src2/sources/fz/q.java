package fz;

import kotlin.NoWhenBranchMatchedException;
import kotlin.enums.EnumEntriesKt;
import l1.g9;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class q implements gy.n0 {

    /* renamed from: b, reason: collision with root package name */
    public static final q f56340b;

    /* renamed from: c, reason: collision with root package name */
    public static final q f56341c;

    /* renamed from: d, reason: collision with root package name */
    public static final q f56342d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ q[] f56343e;

    /* renamed from: a, reason: collision with root package name */
    public final int f56344a;

    static {
        q qVar = new q("CROP", 0, 2132018018);
        f56340b = qVar;
        q qVar2 = new q("ROUND", 1, 2132018025);
        f56341c = qVar2;
        q qVar3 = new q("SQUIRCLE", 2, 2132018028);
        f56342d = qVar3;
        q[] qVarArr = {qVar, qVar2, qVar3};
        f56343e = qVarArr;
        EnumEntriesKt.a(qVarArr);
    }

    public q(String str, int i5, int i11) {
        this.f56344a = i11;
    }

    public static q valueOf(String str) {
        return (q) Enum.valueOf(q.class, str);
    }

    public static q[] values() {
        return (q[]) f56343e.clone();
    }

    @Override // gy.n0
    public final void a(p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.b0(-1834559929);
        g9.b(x7.f.Y(tVar, this.f56344a), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, tVar, 0, 0, 131070);
        tVar.p(false);
    }

    public final float d() {
        int iOrdinal = ordinal();
        if (iOrdinal == 0) {
            return 0.0f;
        }
        if (iOrdinal == 1) {
            return 0.55191505f;
        }
        if (iOrdinal == 2) {
            return 1.0f;
        }
        throw new NoWhenBranchMatchedException();
    }
}
