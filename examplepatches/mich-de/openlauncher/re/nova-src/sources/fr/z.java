package fr;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class z {

    /* renamed from: b, reason: collision with root package name */
    public static final z f55715b;

    /* renamed from: c, reason: collision with root package name */
    public static final z f55716c;

    /* renamed from: d, reason: collision with root package name */
    public static final z f55717d;

    /* renamed from: e, reason: collision with root package name */
    public static final z f55718e;

    /* renamed from: f, reason: collision with root package name */
    public static final z f55719f;

    /* renamed from: g, reason: collision with root package name */
    public static final z f55720g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ z[] f55721h;

    /* renamed from: a, reason: collision with root package name */
    public final String f55722a;

    static {
        z zVar = new z("WiFi", 0, "Wi-Fi");
        f55715b = zVar;
        z zVar2 = new z("Mobile2G", 1, "2G");
        f55716c = zVar2;
        z zVar3 = new z("Mobile3G", 2, "3G");
        f55717d = zVar3;
        z zVar4 = new z("Mobile4G", 3, "4G");
        f55718e = zVar4;
        z zVar5 = new z("Mobile5G", 4, "5G");
        f55719f = zVar5;
        z zVar6 = new z("Unknown", 5, "unknown");
        f55720g = zVar6;
        z[] zVarArr = {zVar, zVar2, zVar3, zVar4, zVar5, zVar6};
        f55721h = zVarArr;
        EnumEntriesKt.a(zVarArr);
    }

    public z(String str, int i5, String str2) {
        this.f55722a = str2;
    }

    public static z valueOf(String str) {
        return (z) Enum.valueOf(z.class, str);
    }

    public static z[] values() {
        return (z[]) f55721h.clone();
    }
}
