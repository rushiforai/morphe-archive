package hv;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class n {

    /* renamed from: b, reason: collision with root package name */
    public static final n f60416b;

    /* renamed from: c, reason: collision with root package name */
    public static final n f60417c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ n[] f60418d;

    /* renamed from: a, reason: collision with root package name */
    public final int f60419a;

    static {
        n nVar = new n("Dark", 0, 1);
        f60416b = nVar;
        n nVar2 = new n("Light", 1, 2);
        f60417c = nVar2;
        n[] nVarArr = {nVar, nVar2};
        f60418d = nVarArr;
        EnumEntriesKt.a(nVarArr);
    }

    public n(String str, int i5, int i11) {
        this.f60419a = i11;
    }

    public static n valueOf(String str) {
        return (n) Enum.valueOf(n.class, str);
    }

    public static n[] values() {
        return (n[]) f60418d.clone();
    }
}
