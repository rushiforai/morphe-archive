package dq;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class h {

    /* renamed from: b, reason: collision with root package name */
    public static final h f49333b;

    /* renamed from: c, reason: collision with root package name */
    public static final h f49334c;

    /* renamed from: d, reason: collision with root package name */
    public static final h f49335d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ h[] f49336e;

    /* renamed from: a, reason: collision with root package name */
    public final String f49337a;

    static {
        h hVar = new h("NotCurrentlyKnown", 0, "NOT_CURRENTLY_KNOWN");
        f49333b = hVar;
        h hVar2 = new h("Estimated", 1, "ESTIMATED");
        f49334c = hVar2;
        h hVar3 = new h("Final", 2, "FINAL");
        f49335d = hVar3;
        h[] hVarArr = {hVar, hVar2, hVar3};
        f49336e = hVarArr;
        EnumEntriesKt.a(hVarArr);
    }

    public h(String str, int i5, String str2) {
        this.f49337a = str2;
    }

    public static h valueOf(String str) {
        return (h) Enum.valueOf(h.class, str);
    }

    public static h[] values() {
        return (h[]) f49336e.clone();
    }
}
