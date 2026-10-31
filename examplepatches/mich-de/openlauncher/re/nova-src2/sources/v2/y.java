package v2;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public static final y f92022a;

    /* renamed from: b, reason: collision with root package name */
    public static final y f92023b;

    /* renamed from: c, reason: collision with root package name */
    public static final y f92024c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ y[] f92025d;

    static {
        y yVar = new y("Unknown", 0);
        f92022a = yVar;
        y yVar2 = new y("Dispatching", 1);
        f92023b = yVar2;
        y yVar3 = new y("NotDispatching", 2);
        f92024c = yVar3;
        y[] yVarArr = {yVar, yVar2, yVar3};
        f92025d = yVarArr;
        EnumEntriesKt.a(yVarArr);
    }

    public static y valueOf(String str) {
        return (y) Enum.valueOf(y.class, str);
    }

    public static y[] values() {
        return (y[]) f92025d.clone();
    }
}
