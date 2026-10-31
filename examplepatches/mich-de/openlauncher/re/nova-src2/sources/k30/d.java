package k30;

import b.i8;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class d {

    /* renamed from: b, reason: collision with root package name */
    public static final i8 f70919b;

    /* renamed from: c, reason: collision with root package name */
    public static final d f70920c;

    /* renamed from: d, reason: collision with root package name */
    public static final d f70921d;

    /* renamed from: e, reason: collision with root package name */
    public static final d f70922e;

    /* renamed from: f, reason: collision with root package name */
    public static final d f70923f;

    /* renamed from: g, reason: collision with root package name */
    public static final d f70924g;

    /* renamed from: h, reason: collision with root package name */
    public static final d f70925h;

    /* renamed from: i, reason: collision with root package name */
    public static final d f70926i;

    /* renamed from: j, reason: collision with root package name */
    public static final d f70927j;

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ d[] f70928k;

    /* renamed from: a, reason: collision with root package name */
    public final double f70929a;

    static {
        d dVar = new d("NEW_MOON", 0, 0.0d);
        f70920c = dVar;
        d dVar2 = new d("WAXING_CRESCENT", 1, 0.7853981633974483d);
        f70921d = dVar2;
        d dVar3 = new d("FIRST_QUARTER", 2, 1.5707963267948966d);
        f70922e = dVar3;
        d dVar4 = new d("WAXING_GIBBOUS", 3, 2.356194490192345d);
        f70923f = dVar4;
        d dVar5 = new d("FULL_MOON", 4, 3.141592653589793d);
        f70924g = dVar5;
        d dVar6 = new d("WANING_GIBBOUS", 5, 3.9269908169872414d);
        f70925h = dVar6;
        d dVar7 = new d("LAST_QUARTER", 6, 4.71238898038469d);
        f70926i = dVar7;
        d dVar8 = new d("WANING_CRESCENT", 7, 5.497787143782138d);
        f70927j = dVar8;
        d[] dVarArr = {dVar, dVar2, dVar3, dVar4, dVar5, dVar6, dVar7, dVar8};
        f70928k = dVarArr;
        EnumEntriesKt.a(dVarArr);
        f70919b = new i8(26);
    }

    public d(String str, int i5, double d5) {
        this.f70929a = d5;
    }

    public static d valueOf(String str) {
        return (d) Enum.valueOf(d.class, str);
    }

    public static d[] values() {
        return (d[]) f70928k.clone();
    }
}
