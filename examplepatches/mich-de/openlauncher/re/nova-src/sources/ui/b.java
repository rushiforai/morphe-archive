package ui;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f91276a;

    /* renamed from: b, reason: collision with root package name */
    public static final b f91277b;

    /* renamed from: c, reason: collision with root package name */
    public static final b f91278c;

    /* renamed from: d, reason: collision with root package name */
    public static final b f91279d;

    /* renamed from: e, reason: collision with root package name */
    public static final b f91280e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ b[] f91281f;

    static {
        b bVar = new b("UNKNOWN", 0);
        f91276a = bVar;
        b bVar2 = new b("ANY", 1);
        f91277b = bVar2;
        b bVar3 = new b("LANDSCAPE", 2);
        f91278c = bVar3;
        b bVar4 = new b("PORTRAIT", 3);
        f91279d = bVar4;
        b bVar5 = new b("SQUARE", 4);
        f91280e = bVar5;
        b[] bVarArr = {bVar, bVar2, bVar3, bVar4, bVar5};
        f91281f = bVarArr;
        EnumEntriesKt.a(bVarArr);
    }

    public static b[] values() {
        return (b[]) f91281f.clone();
    }
}
