package cn;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public static final d f20142a;

    /* renamed from: b, reason: collision with root package name */
    public static final d f20143b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ d[] f20144c;

    static {
        d dVar = new d("CRASHLYTICS", 0);
        f20142a = dVar;
        d dVar2 = new d("PERFORMANCE", 1);
        f20143b = dVar2;
        d[] dVarArr = {dVar, dVar2, new d("MATT_SAYS_HI", 2)};
        f20144c = dVarArr;
        EnumEntriesKt.a(dVarArr);
    }

    public static d valueOf(String str) {
        return (d) Enum.valueOf(d.class, str);
    }

    public static d[] values() {
        return (d[]) f20144c.clone();
    }
}
