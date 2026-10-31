package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class mz {

    /* renamed from: b, reason: collision with root package name */
    public static final mz f7379b;

    /* renamed from: c, reason: collision with root package name */
    public static final mz f7380c;

    /* renamed from: d, reason: collision with root package name */
    public static final mz f7381d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ mz[] f7382e;

    /* renamed from: a, reason: collision with root package name */
    public final int f7383a;

    static {
        mz mzVar = new mz("UNKNOWN", 0, -1);
        mz mzVar2 = new mz("STRING", 1, 0);
        f7379b = mzVar2;
        mz mzVar3 = new mz("NUMBER", 2, 1);
        f7380c = mzVar3;
        mz mzVar4 = new mz("BOOLEAN", 3, 2);
        f7381d = mzVar4;
        mz[] mzVarArr = {mzVar, mzVar2, mzVar3, mzVar4};
        f7382e = mzVarArr;
        EnumEntriesKt.a(mzVarArr);
    }

    public mz(String str, int i5, int i11) {
        this.f7383a = i11;
    }

    public static mz[] values() {
        return (mz[]) f7382e.clone();
    }
}
