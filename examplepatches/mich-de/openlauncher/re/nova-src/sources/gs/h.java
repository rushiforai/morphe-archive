package gs;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public static final h f57783a;

    /* renamed from: b, reason: collision with root package name */
    public static final h f57784b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ h[] f57785c;

    static {
        h hVar = new h("RequiresSignUp", 0);
        h hVar2 = new h("RequiresVerification", 1);
        f57783a = hVar2;
        h hVar3 = new h("Verified", 2);
        f57784b = hVar3;
        h[] hVarArr = {hVar, hVar2, hVar3};
        f57785c = hVarArr;
        EnumEntriesKt.a(hVarArr);
    }

    public static h valueOf(String str) {
        return (h) Enum.valueOf(h.class, str);
    }

    public static h[] values() {
        return (h[]) f57785c.clone();
    }
}
