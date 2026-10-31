package kx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f72746a;

    /* renamed from: b, reason: collision with root package name */
    public static final b f72747b;

    /* renamed from: c, reason: collision with root package name */
    public static final b f72748c;

    /* renamed from: d, reason: collision with root package name */
    public static final b f72749d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ b[] f72750e;

    static {
        b bVar = new b("TIME", 0);
        f72746a = bVar;
        b bVar2 = new b("WEATHER", 1);
        f72747b = bVar2;
        b bVar3 = new b("WIFI", 2);
        f72748c = bVar3;
        b bVar4 = new b("BLUETOOTH", 3);
        f72749d = bVar4;
        b[] bVarArr = {bVar, bVar2, bVar3, bVar4};
        f72750e = bVarArr;
        EnumEntriesKt.a(bVarArr);
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f72750e.clone();
    }
}
