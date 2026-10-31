package k30;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public static final s f71057a;

    /* renamed from: b, reason: collision with root package name */
    public static final s f71058b;

    /* renamed from: c, reason: collision with root package name */
    public static final s f71059c;

    /* renamed from: d, reason: collision with root package name */
    public static final s f71060d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ s[] f71061e;

    static {
        s sVar = new s("SUNRISE", 0);
        f71057a = sVar;
        s sVar2 = new s("DAYTIME", 1);
        f71058b = sVar2;
        s sVar3 = new s("SUNSET", 2);
        f71059c = sVar3;
        s sVar4 = new s("NIGHT", 3);
        f71060d = sVar4;
        s[] sVarArr = {sVar, sVar2, sVar3, sVar4};
        f71061e = sVarArr;
        EnumEntriesKt.a(sVarArr);
    }

    public static s valueOf(String str) {
        return (s) Enum.valueOf(s.class, str);
    }

    public static s[] values() {
        return (s[]) f71061e.clone();
    }
}
