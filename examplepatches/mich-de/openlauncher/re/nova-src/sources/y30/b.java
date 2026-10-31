package y30;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f96628a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ b[] f96629b;

    static {
        b bVar = new b("ENTERTAINMENT", 0);
        b bVar2 = new b("FINANCE", 1);
        b bVar3 = new b("FOOD", 2);
        b bVar4 = new b("GAMES", 3);
        f96628a = bVar4;
        b[] bVarArr = {bVar, bVar2, bVar3, bVar4, new b("SHOPPING", 4), new b("SOCIAL", 5), new b("TRAVEL", 6)};
        f96629b = bVarArr;
        EnumEntriesKt.a(bVarArr);
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f96629b.clone();
    }
}
