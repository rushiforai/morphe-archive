package h6;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public static final t f59440a;

    /* renamed from: b, reason: collision with root package name */
    public static final t f59441b;

    /* renamed from: c, reason: collision with root package name */
    public static final t f59442c;

    /* renamed from: d, reason: collision with root package name */
    public static final t f59443d;

    /* renamed from: e, reason: collision with root package name */
    public static final t f59444e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ t[] f59445f;

    static {
        t tVar = new t("DESTROYED", 0);
        f59440a = tVar;
        t tVar2 = new t("INITIALIZED", 1);
        f59441b = tVar2;
        t tVar3 = new t("CREATED", 2);
        f59442c = tVar3;
        t tVar4 = new t("STARTED", 3);
        f59443d = tVar4;
        t tVar5 = new t("RESUMED", 4);
        f59444e = tVar5;
        t[] tVarArr = {tVar, tVar2, tVar3, tVar4, tVar5};
        f59445f = tVarArr;
        EnumEntriesKt.a(tVarArr);
    }

    public static t valueOf(String str) {
        return (t) Enum.valueOf(t.class, str);
    }

    public static t[] values() {
        return (t[]) f59445f.clone();
    }
}
