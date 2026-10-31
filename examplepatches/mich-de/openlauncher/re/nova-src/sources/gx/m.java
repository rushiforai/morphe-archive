package gx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public static final m f58121a;

    /* renamed from: b, reason: collision with root package name */
    public static final m f58122b;

    /* renamed from: c, reason: collision with root package name */
    public static final m f58123c;

    /* renamed from: d, reason: collision with root package name */
    public static final m f58124d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ m[] f58125e;

    static {
        m mVar = new m("NotStarted", 0);
        f58121a = mVar;
        m mVar2 = new m("InProgress", 1);
        f58122b = mVar2;
        m mVar3 = new m("Completed", 2);
        f58123c = mVar3;
        m mVar4 = new m("Failed", 3);
        f58124d = mVar4;
        m[] mVarArr = {mVar, mVar2, mVar3, mVar4};
        f58125e = mVarArr;
        EnumEntriesKt.a(mVarArr);
    }

    public static m valueOf(String str) {
        return (m) Enum.valueOf(m.class, str);
    }

    public static m[] values() {
        return (m[]) f58125e.clone();
    }
}
