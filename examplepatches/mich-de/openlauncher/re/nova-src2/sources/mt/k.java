package mt;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public static final k f76772a;

    /* renamed from: b, reason: collision with root package name */
    public static final k f76773b;

    /* renamed from: c, reason: collision with root package name */
    public static final k f76774c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ k[] f76775d;

    static {
        k kVar = new k("InformCancellation", 0);
        f76772a = kVar;
        k kVar2 = new k("ModifyPaymentDetails", 1);
        f76773b = kVar2;
        k kVar3 = new k("None", 2);
        f76774c = kVar3;
        k[] kVarArr = {kVar, kVar2, kVar3};
        f76775d = kVarArr;
        EnumEntriesKt.a(kVarArr);
    }

    public static k valueOf(String str) {
        return (k) Enum.valueOf(k.class, str);
    }

    public static k[] values() {
        return (k[]) f76775d.clone();
    }
}
