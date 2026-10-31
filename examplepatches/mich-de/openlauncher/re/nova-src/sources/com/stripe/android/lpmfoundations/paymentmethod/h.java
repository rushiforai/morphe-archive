package com.stripe.android.lpmfoundations.paymentmethod;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ h[] f43121a;

    static {
        h[] hVarArr = {new h("SetupIntent", 0), new h("CreateAttach", 1)};
        f43121a = hVarArr;
        EnumEntriesKt.a(hVarArr);
    }

    public static h valueOf(String str) {
        return (h) Enum.valueOf(h.class, str);
    }

    public static h[] values() {
        return (h[]) f43121a.clone();
    }
}
