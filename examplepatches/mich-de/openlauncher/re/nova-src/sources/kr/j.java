package kr;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public static final j f72142a;

    /* renamed from: b, reason: collision with root package name */
    public static final j f72143b;

    /* renamed from: c, reason: collision with root package name */
    public static final j f72144c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ j[] f72145d;

    static {
        j jVar = new j("AddPaymentMethod", 0);
        f72142a = jVar;
        j jVar2 = new j("SelectPaymentMethod", 1);
        f72143b = jVar2;
        j jVar3 = new j("EditPaymentMethod", 2);
        f72144c = jVar3;
        j[] jVarArr = {jVar, jVar2, jVar3};
        f72145d = jVarArr;
        EnumEntriesKt.a(jVarArr);
    }

    public static j valueOf(String str) {
        return (j) Enum.valueOf(j.class, str);
    }

    public static j[] values() {
        return (j[]) f72145d.clone();
    }
}
