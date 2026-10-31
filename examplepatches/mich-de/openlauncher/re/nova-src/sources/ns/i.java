package ns;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class i {

    /* renamed from: b, reason: collision with root package name */
    public static final i f78539b;

    /* renamed from: c, reason: collision with root package name */
    public static final i f78540c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i[] f78541d;

    /* renamed from: a, reason: collision with root package name */
    public final String f78542a;

    static {
        i iVar = new i("Payment", 0, "payment");
        f78539b = iVar;
        i iVar2 = new i("Setup", 1, "setup");
        f78540c = iVar2;
        i[] iVarArr = {iVar, iVar2};
        f78541d = iVarArr;
        EnumEntriesKt.a(iVarArr);
    }

    public i(String str, int i5, String str2) {
        this.f78542a = str2;
    }

    public static i valueOf(String str) {
        return (i) Enum.valueOf(i.class, str);
    }

    public static i[] values() {
        return (i[]) f78541d.clone();
    }
}
