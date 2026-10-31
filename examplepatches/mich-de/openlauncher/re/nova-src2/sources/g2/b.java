package g2;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f56852a;

    /* renamed from: b, reason: collision with root package name */
    public static final b f56853b;

    /* renamed from: c, reason: collision with root package name */
    public static final b f56854c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ b[] f56855d;

    static {
        b bVar = new b("None", 0);
        f56852a = bVar;
        b bVar2 = new b("Cancelled", 1);
        f56853b = bVar2;
        b bVar3 = new b("Redirected", 2);
        f56854c = bVar3;
        b[] bVarArr = {bVar, bVar2, bVar3, new b("RedirectCancelled", 3)};
        f56855d = bVarArr;
        EnumEntriesKt.a(bVarArr);
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f56855d.clone();
    }
}
