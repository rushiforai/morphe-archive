package np;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class k {

    /* renamed from: b, reason: collision with root package name */
    public static final k f78519b;

    /* renamed from: c, reason: collision with root package name */
    public static final k f78520c;

    /* renamed from: d, reason: collision with root package name */
    public static final k f78521d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ k[] f78522e;

    /* renamed from: a, reason: collision with root package name */
    public final int f78523a;

    static {
        k kVar = new k("UNSUBMITTED", 0, 2132020308);
        f78519b = kVar;
        k kVar2 = new k("PENDING", 1, 2132019097);
        f78520c = kVar2;
        k kVar3 = new k("SUBMITTED", 2, 2132020072);
        f78521d = kVar3;
        k[] kVarArr = {kVar, kVar2, kVar3};
        f78522e = kVarArr;
        EnumEntriesKt.a(kVarArr);
    }

    public k(String str, int i5, int i11) {
        this.f78523a = i11;
    }

    public static k valueOf(String str) {
        return (k) Enum.valueOf(k.class, str);
    }

    public static k[] values() {
        return (k[]) f78522e.clone();
    }
}
