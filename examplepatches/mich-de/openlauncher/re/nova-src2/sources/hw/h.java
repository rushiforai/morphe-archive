package hw;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public static final h f60733a;

    /* renamed from: b, reason: collision with root package name */
    public static final h f60734b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ h[] f60735c;

    static {
        h hVar = new h("Filled", 0);
        f60733a = hVar;
        h hVar2 = new h("Outlined", 1);
        f60734b = hVar2;
        h[] hVarArr = {hVar, hVar2};
        f60735c = hVarArr;
        EnumEntriesKt.a(hVarArr);
    }

    public static h valueOf(String str) {
        return (h) Enum.valueOf(h.class, str);
    }

    public static h[] values() {
        return (h[]) f60735c.clone();
    }
}
