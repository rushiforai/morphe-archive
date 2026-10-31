package wy;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public static final h f94897a;

    /* renamed from: b, reason: collision with root package name */
    public static final h f94898b;

    /* renamed from: c, reason: collision with root package name */
    public static final h f94899c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ h[] f94900d;

    static {
        h hVar = new h("ASK", 0);
        f94897a = hVar;
        h hVar2 = new h("AUTO_SEND", 1);
        f94898b = hVar2;
        h hVar3 = new h("DO_NOT_SEND", 2);
        f94899c = hVar3;
        h[] hVarArr = {hVar, hVar2, hVar3};
        f94900d = hVarArr;
        EnumEntriesKt.a(hVarArr);
    }

    public static h valueOf(String str) {
        return (h) Enum.valueOf(h.class, str);
    }

    public static h[] values() {
        return (h[]) f94900d.clone();
    }
}
