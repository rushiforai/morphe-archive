package rv;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public static final m f86446a;

    /* renamed from: b, reason: collision with root package name */
    public static final m f86447b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ m[] f86448c;

    static {
        m mVar = new m("LOW", 0);
        m mVar2 = new m("MEDIUM", 1);
        f86446a = mVar2;
        m mVar3 = new m("HIGH", 2);
        f86447b = mVar3;
        m[] mVarArr = {mVar, mVar2, mVar3};
        f86448c = mVarArr;
        EnumEntriesKt.a(mVarArr);
    }

    public static m valueOf(String str) {
        return (m) Enum.valueOf(m.class, str);
    }

    public static m[] values() {
        return (m[]) f86448c.clone();
    }
}
