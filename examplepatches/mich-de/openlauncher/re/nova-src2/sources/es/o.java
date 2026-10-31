package es;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public static final o f52992a;

    /* renamed from: b, reason: collision with root package name */
    public static final o f52993b;

    /* renamed from: c, reason: collision with root package name */
    public static final o f52994c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ o[] f52995d;

    static {
        o oVar = new o("DISABLED", 0);
        f52992a = oVar;
        o oVar2 = new o("ENABLED", 1);
        f52993b = oVar2;
        o oVar3 = new o("ENABLED_NO_WEB_FALLBACK", 2);
        f52994c = oVar3;
        o[] oVarArr = {oVar, oVar2, oVar3};
        f52995d = oVarArr;
        EnumEntriesKt.a(oVarArr);
    }

    public static o valueOf(String str) {
        return (o) Enum.valueOf(o.class, str);
    }

    public static o[] values() {
        return (o[]) f52995d.clone();
    }
}
