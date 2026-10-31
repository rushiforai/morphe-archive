package hw;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public static final m f60750a;

    /* renamed from: b, reason: collision with root package name */
    public static final m f60751b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ m[] f60752c;

    static {
        m mVar = new m("Bordered", 0);
        f60750a = mVar;
        m mVar2 = new m("Borderless", 1);
        f60751b = mVar2;
        m[] mVarArr = {mVar, mVar2};
        f60752c = mVarArr;
        EnumEntriesKt.a(mVarArr);
    }

    public static m valueOf(String str) {
        return (m) Enum.valueOf(m.class, str);
    }

    public static m[] values() {
        return (m[]) f60752c.clone();
    }
}
