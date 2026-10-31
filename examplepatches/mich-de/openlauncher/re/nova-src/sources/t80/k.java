package t80;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public static final k f88925a;

    /* renamed from: b, reason: collision with root package name */
    public static final k f88926b;

    /* renamed from: c, reason: collision with root package name */
    public static final k f88927c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ k[] f88928d;

    static {
        k kVar = new k("GOOGLE_MEET", 0);
        f88925a = kVar;
        k kVar2 = new k("GOOGLE_MAPS", 1);
        f88926b = kVar2;
        k kVar3 = new k("ZOOM", 2);
        f88927c = kVar3;
        k[] kVarArr = {kVar, kVar2, kVar3};
        f88928d = kVarArr;
        EnumEntriesKt.a(kVarArr);
    }

    public static k valueOf(String str) {
        return (k) Enum.valueOf(k.class, str);
    }

    public static k[] values() {
        return (k[]) f88928d.clone();
    }
}
