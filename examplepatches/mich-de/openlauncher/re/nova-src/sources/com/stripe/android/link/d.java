package com.stripe.android.link;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public static final d f42969a;

    /* renamed from: b, reason: collision with root package name */
    public static final d f42970b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ d[] f42971c;

    static {
        d dVar = new d("LoggedOut", 0);
        f42969a = dVar;
        d dVar2 = new d("PaymentConfirmed", 1);
        f42970b = dVar2;
        d[] dVarArr = {dVar, dVar2};
        f42971c = dVarArr;
        EnumEntriesKt.a(dVarArr);
    }

    public static d valueOf(String str) {
        return (d) Enum.valueOf(d.class, str);
    }

    public static d[] values() {
        return (d[]) f42971c.clone();
    }
}
