package a80;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f471a;

    /* renamed from: b, reason: collision with root package name */
    public static final b f472b;

    /* renamed from: c, reason: collision with root package name */
    public static final b f473c;

    /* renamed from: d, reason: collision with root package name */
    public static final b f474d;

    /* renamed from: e, reason: collision with root package name */
    public static final b f475e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ b[] f476f;

    static {
        b bVar = new b("CPU_ACQUIRED", 0);
        f471a = bVar;
        b bVar2 = new b("BLOCKING", 1);
        f472b = bVar2;
        b bVar3 = new b("PARKING", 2);
        f473c = bVar3;
        b bVar4 = new b("DORMANT", 3);
        f474d = bVar4;
        b bVar5 = new b("TERMINATED", 4);
        f475e = bVar5;
        b[] bVarArr = {bVar, bVar2, bVar3, bVar4, bVar5};
        f476f = bVarArr;
        EnumEntriesKt.a(bVarArr);
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f476f.clone();
    }
}
