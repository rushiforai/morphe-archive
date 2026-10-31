package bn;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class k implements im.f {

    /* renamed from: b, reason: collision with root package name */
    public static final k f18234b;

    /* renamed from: c, reason: collision with root package name */
    public static final k f18235c;

    /* renamed from: d, reason: collision with root package name */
    public static final k f18236d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ k[] f18237e;

    /* renamed from: a, reason: collision with root package name */
    public final int f18238a;

    static {
        k kVar = new k("COLLECTION_UNKNOWN", 0, 0);
        k kVar2 = new k("COLLECTION_SDK_NOT_INSTALLED", 1, 1);
        f18234b = kVar2;
        k kVar3 = new k("COLLECTION_ENABLED", 2, 2);
        f18235c = kVar3;
        k kVar4 = new k("COLLECTION_DISABLED", 3, 3);
        f18236d = kVar4;
        k[] kVarArr = {kVar, kVar2, kVar3, kVar4, new k("COLLECTION_DISABLED_REMOTE", 4, 4), new k("COLLECTION_SAMPLED", 5, 5)};
        f18237e = kVarArr;
        EnumEntriesKt.a(kVarArr);
    }

    public k(String str, int i5, int i11) {
        this.f18238a = i11;
    }

    public static k valueOf(String str) {
        return (k) Enum.valueOf(k.class, str);
    }

    public static k[] values() {
        return (k[]) f18237e.clone();
    }

    @Override // im.f
    public final int getNumber() {
        return this.f18238a;
    }
}
