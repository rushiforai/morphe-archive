package e10;

import kotlin.enums.EnumEntriesKt;
import l1.g9;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class r implements gy.n0 {

    /* renamed from: b, reason: collision with root package name */
    public static final r f51774b;

    /* renamed from: c, reason: collision with root package name */
    public static final r f51775c;

    /* renamed from: d, reason: collision with root package name */
    public static final r f51776d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ r[] f51777e;

    /* renamed from: a, reason: collision with root package name */
    public final String f51778a;

    static {
        r rVar = new r("NONE", 0, null);
        f51774b = rVar;
        r rVar2 = new r("DUCKDUCKGO", 1, "DuckDuckGo");
        f51775c = rVar2;
        r rVar3 = new r("GOOGLE", 2, "Google");
        f51776d = rVar3;
        r[] rVarArr = {rVar, rVar2, rVar3};
        f51777e = rVarArr;
        EnumEntriesKt.a(rVarArr);
    }

    public r(String str, int i5, String str2) {
        this.f51778a = str2;
    }

    public static r valueOf(String str) {
        return (r) Enum.valueOf(r.class, str);
    }

    public static r[] values() {
        return (r[]) f51777e.clone();
    }

    @Override // gy.n0
    public final void a(p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.b0(312171331);
        tVar.b0(-1767050600);
        String strY = this.f51778a;
        if (strY == null) {
            strY = x7.f.Y(tVar, 2132018734);
        }
        tVar.p(false);
        g9.b(strY, null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, tVar, 0, 0, 131070);
        tVar.p(false);
    }
}
