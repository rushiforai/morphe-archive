package ni;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class r {

    /* renamed from: b, reason: collision with root package name */
    public static final r f78316b;

    /* renamed from: c, reason: collision with root package name */
    public static final r f78317c;

    /* renamed from: d, reason: collision with root package name */
    public static final r f78318d;

    /* renamed from: e, reason: collision with root package name */
    public static final r f78319e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ r[] f78320f;

    /* renamed from: a, reason: collision with root package name */
    public final int f78321a;

    static {
        r rVar = new r("INTERNAL_ERROR", 0, 0);
        f78316b = rVar;
        r rVar2 = new r("AD_REUSED", 1, 1);
        f78317c = rVar2;
        r rVar3 = new r("APP_NOT_FOREGROUND", 2, 3);
        f78318d = rVar3;
        r rVar4 = new r("MEDIATION_SHOW_ERROR", 3, 4);
        f78319e = rVar4;
        r[] rVarArr = {rVar, rVar2, rVar3, rVar4, new r("H5_SHOW_AD_NOT_LOADED", 4, 5)};
        f78320f = rVarArr;
        EnumEntriesKt.a(rVarArr);
    }

    public r(String str, int i5, int i11) {
        this.f78321a = i11;
    }

    public static r[] values() {
        return (r[]) f78320f.clone();
    }
}
