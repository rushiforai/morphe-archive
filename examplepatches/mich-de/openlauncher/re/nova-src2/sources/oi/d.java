package oi;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class d {

    /* renamed from: b, reason: collision with root package name */
    public static final d f80442b;

    /* renamed from: c, reason: collision with root package name */
    public static final d f80443c;

    /* renamed from: d, reason: collision with root package name */
    public static final d f80444d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ d[] f80445e;

    /* renamed from: a, reason: collision with root package name */
    public final int f80446a;

    static {
        d dVar = new d("UNSPECIFIED", 0, 1);
        f80442b = dVar;
        d dVar2 = new d("BROWSER", 1, 2);
        f80443c = dVar2;
        d dVar3 = new d("FOLDER", 2, 3);
        d dVar4 = new d("HOME", 3, 4);
        f80444d = dVar4;
        d[] dVarArr = {dVar, dVar2, dVar3, dVar4, new d("LOCKSCREEN", 4, 5), new d("MINUS_ONE_SCREEN", 5, 6), new d("NOTIFICATION", 6, 7), new d("SEARCH", 7, 8), new d("SHARE", 8, 9), new d("STORE", 9, 10)};
        f80445e = dVarArr;
        EnumEntriesKt.a(dVarArr);
    }

    public d(String str, int i5, int i11) {
        this.f80446a = i11;
    }

    public static d[] values() {
        return (d[]) f80445e.clone();
    }

    public final int a() {
        return this.f80446a;
    }
}
