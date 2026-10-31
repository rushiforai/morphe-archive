package yq;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f97402a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f97403b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ a[] f97404c;

    static {
        a aVar = new a("CustomTabs", 0);
        f97402a = aVar;
        a aVar2 = new a("Unknown", 1);
        f97403b = aVar2;
        a[] aVarArr = {aVar, aVar2};
        f97404c = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f97404c.clone();
    }
}
