package dv;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public static final m f49616a;

    /* renamed from: b, reason: collision with root package name */
    public static final m f49617b;

    /* renamed from: c, reason: collision with root package name */
    public static final m f49618c;

    /* renamed from: d, reason: collision with root package name */
    public static final m f49619d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ m[] f49620e;

    static {
        m mVar = new m("Active", 0);
        f49616a = mVar;
        m mVar2 = new m("Success", 1);
        f49617b = mVar2;
        m mVar3 = new m("Failed", 2);
        f49618c = mVar3;
        m mVar4 = new m("Canceled", 3);
        f49619d = mVar4;
        m[] mVarArr = {mVar, mVar2, mVar3, mVar4};
        f49620e = mVarArr;
        EnumEntriesKt.a(mVarArr);
    }

    public static m valueOf(String str) {
        return (m) Enum.valueOf(m.class, str);
    }

    public static m[] values() {
        return (m[]) f49620e.clone();
    }
}
