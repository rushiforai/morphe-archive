package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* renamed from: ads_mobile_sdk.if, reason: invalid class name */
/* loaded from: classes.dex */
public final class Cif {

    /* renamed from: a, reason: collision with root package name */
    public static final Cif f4757a;

    /* renamed from: b, reason: collision with root package name */
    public static final Cif f4758b;

    /* renamed from: c, reason: collision with root package name */
    public static final Cif f4759c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ Cif[] f4760d;

    static {
        Cif cif = new Cif("NO_ANR", 0);
        f4757a = cif;
        Cif cif2 = new Cif("EARLY_ANR", 1);
        f4758b = cif2;
        Cif cif3 = new Cif("FULL_ANR", 2);
        f4759c = cif3;
        Cif[] cifArr = {cif, cif2, cif3};
        f4760d = cifArr;
        EnumEntriesKt.a(cifArr);
    }

    public static Cif[] values() {
        return (Cif[]) f4760d.clone();
    }
}
