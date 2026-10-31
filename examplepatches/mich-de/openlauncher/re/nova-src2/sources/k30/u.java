package k30;

import kotlin.NoWhenBranchMatchedException;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class u {

    /* renamed from: c, reason: collision with root package name */
    public static final u f71063c;

    /* renamed from: d, reason: collision with root package name */
    public static final u f71064d;

    /* renamed from: e, reason: collision with root package name */
    public static final u f71065e;

    /* renamed from: f, reason: collision with root package name */
    public static final u f71066f;

    /* renamed from: g, reason: collision with root package name */
    public static final u f71067g;

    /* renamed from: h, reason: collision with root package name */
    public static final u f71068h;

    /* renamed from: i, reason: collision with root package name */
    public static final u f71069i;

    /* renamed from: j, reason: collision with root package name */
    public static final u f71070j;

    /* renamed from: k, reason: collision with root package name */
    public static final u f71071k;

    /* renamed from: l, reason: collision with root package name */
    public static final u f71072l;

    /* renamed from: m, reason: collision with root package name */
    public static final u f71073m;
    public static final u n;
    public static final u o;

    /* renamed from: p, reason: collision with root package name */
    public static final u f71074p;

    /* renamed from: q, reason: collision with root package name */
    public static final u f71075q;

    /* renamed from: r, reason: collision with root package name */
    public static final u f71076r;

    /* renamed from: s, reason: collision with root package name */
    public static final /* synthetic */ u[] f71077s;

    /* renamed from: a, reason: collision with root package name */
    public final int f71078a;

    /* renamed from: b, reason: collision with root package name */
    public final int f71079b;

    static {
        u uVar = new u("UNKNOWN", 0, 2131231862, 2131231814);
        f71063c = uVar;
        u uVar2 = new u("CLEAR", 1, 2131231862, 2131231814);
        f71064d = uVar2;
        u uVar3 = new u("CLOUDY", 2, 2131231835, 2131231816);
        f71065e = uVar3;
        u uVar4 = new u("OVERCAST", 3, 2131231858, 2131231816);
        f71066f = uVar4;
        u uVar5 = new u("FOG", 4, 2131231839, 2131231818);
        f71067g = uVar5;
        u uVar6 = new u("HAZE", 5, 2131231840, 2131231820);
        f71068h = uVar6;
        u uVar7 = new u("SNOW", 6, 2131231861, 2131231823);
        f71069i = uVar7;
        u uVar8 = new u("SHOWERS", 7, 2131231860, 2131231822);
        f71070j = uVar8;
        u uVar9 = new u("RAIN", 8, 2131231859, 2131231822);
        f71071k = uVar9;
        u uVar10 = new u("THUNDER", 9, 2131231866, 2131231824);
        f71072l = uVar10;
        u uVar11 = new u("TORNADO", 10, 2131231868, 2131231867);
        f71073m = uVar11;
        u uVar12 = new u("FLOOD", 11, 2131231838, 2131231838);
        n = uVar12;
        u uVar13 = new u("FIRE", 12, 2131231837, 2131231837);
        o = uVar13;
        u uVar14 = new u("HOT", 13, 2131231849, 2131231819);
        f71074p = uVar14;
        u uVar15 = new u("COLD", 14, 2131231836, 2131231817);
        f71075q = uVar15;
        u uVar16 = new u("WIND", 15, 2131231869, 2131231825);
        f71076r = uVar16;
        u[] uVarArr = {uVar, uVar2, uVar3, uVar4, uVar5, uVar6, uVar7, uVar8, uVar9, uVar10, uVar11, uVar12, uVar13, uVar14, uVar15, uVar16};
        f71077s = uVarArr;
        EnumEntriesKt.a(uVarArr);
    }

    public u(String str, int i5, int i11, int i12) {
        this.f71078a = i11;
        this.f71079b = i12;
    }

    public static u valueOf(String str) {
        return (u) Enum.valueOf(u.class, str);
    }

    public static u[] values() {
        return (u[]) f71077s.clone();
    }

    public final int a() {
        switch (ordinal()) {
            case 0:
                return 2132019042;
            case 1:
                return 2132020362;
            case 2:
                return 2132020363;
            case 3:
                return 2132020371;
            case 4:
                return 2132020368;
            case 5:
                return 2132020369;
            case 6:
                return 2132020374;
            case 7:
                return 2132020373;
            case 8:
                return 2132020372;
            case 9:
                return 2132020375;
            case 10:
                return 2132020376;
            case 11:
                return 2132020367;
            case 12:
                return 2132020366;
            case 13:
                return 2132020370;
            case 14:
                return 2132020364;
            case 15:
                return 2132020377;
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    public final int b(s sVar, d dVar) {
        int iOrdinal = ordinal();
        if (iOrdinal != 1) {
            if (iOrdinal == 5 && sVar == s.f71060d) {
                switch (dVar.ordinal()) {
                    case 0:
                        return 2131231848;
                    case 1:
                        return 2131231842;
                    case 2:
                        return 2131231843;
                    case 3:
                        return 2131231846;
                    case 4:
                        return 2131231844;
                    case 5:
                        return 2131231845;
                    case 6:
                        return 2131231847;
                    case 7:
                        return 2131231841;
                    default:
                        throw new NoWhenBranchMatchedException();
                }
            }
        } else {
            if (sVar == s.f71060d) {
                switch (dVar.ordinal()) {
                    case 0:
                        return 2131231857;
                    case 1:
                        return 2131231851;
                    case 2:
                        return 2131231852;
                    case 3:
                        return 2131231855;
                    case 4:
                        return 2131231853;
                    case 5:
                        return 2131231854;
                    case 6:
                        return 2131231856;
                    case 7:
                        return 2131231850;
                    default:
                        throw new NoWhenBranchMatchedException();
                }
            }
            int iOrdinal2 = sVar.ordinal();
            if (iOrdinal2 == 0) {
                return 2131231864;
            }
            if (iOrdinal2 == 2) {
                return 2131231865;
            }
        }
        return this.f71078a;
    }
}
