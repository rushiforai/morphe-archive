package ni;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public static final y f78344a;

    /* renamed from: b, reason: collision with root package name */
    public static final y f78345b;

    /* renamed from: c, reason: collision with root package name */
    public static final y f78346c;

    /* renamed from: d, reason: collision with root package name */
    public static final y f78347d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ y[] f78348e;

    static {
        y yVar = new y("UNKNOWN", 0);
        f78344a = yVar;
        y yVar2 = new y("ESTIMATED", 1);
        f78345b = yVar2;
        y yVar3 = new y("PUBLISHER_PROVIDED", 2);
        f78346c = yVar3;
        y yVar4 = new y("PRECISE", 3);
        f78347d = yVar4;
        y[] yVarArr = {yVar, yVar2, yVar3, yVar4};
        f78348e = yVarArr;
        EnumEntriesKt.a(yVarArr);
    }

    public static y[] values() {
        return (y[]) f78348e.clone();
    }
}
