package yx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final c f97687a;

    /* renamed from: b, reason: collision with root package name */
    public static final c f97688b;

    /* renamed from: c, reason: collision with root package name */
    public static final c f97689c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ c[] f97690d;

    static {
        c cVar = new c("GRANTED", 0);
        f97687a = cVar;
        c cVar2 = new c("DENIED", 1);
        f97688b = cVar2;
        c cVar3 = new c("PENDING", 2);
        f97689c = cVar3;
        c[] cVarArr = {cVar, cVar2, cVar3};
        f97690d = cVarArr;
        EnumEntriesKt.a(cVarArr);
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f97690d.clone();
    }
}
