package lo;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final c f75075a;

    /* renamed from: b, reason: collision with root package name */
    public static final c f75076b;

    /* renamed from: c, reason: collision with root package name */
    public static final c f75077c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ c[] f75078d;

    static {
        c cVar = new c("CHIP", 0);
        f75075a = cVar;
        c cVar2 = new c("CARD", 1);
        f75076b = cVar2;
        c cVar3 = new c("NOTIFICATION", 2);
        f75077c = cVar3;
        c[] cVarArr = {cVar, cVar2, cVar3, new c("SUGGESTION", 3)};
        f75078d = cVarArr;
        EnumEntriesKt.a(cVarArr);
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f75078d.clone();
    }
}
