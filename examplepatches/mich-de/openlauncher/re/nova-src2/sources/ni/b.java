package ni;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class b {

    /* renamed from: b, reason: collision with root package name */
    public static final b f78244b;

    /* renamed from: c, reason: collision with root package name */
    public static final b f78245c;

    /* renamed from: d, reason: collision with root package name */
    public static final b f78246d;

    /* renamed from: e, reason: collision with root package name */
    public static final b f78247e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ b[] f78248f;

    /* renamed from: a, reason: collision with root package name */
    public final int f78249a;

    static {
        b bVar = new b("TOP_LEFT", 0, 0);
        f78244b = bVar;
        b bVar2 = new b("TOP_RIGHT", 1, 1);
        f78245c = bVar2;
        b bVar3 = new b("BOTTOM_RIGHT", 2, 2);
        f78246d = bVar3;
        b bVar4 = new b("BOTTOM_LEFT", 3, 3);
        f78247e = bVar4;
        b[] bVarArr = {bVar, bVar2, bVar3, bVar4};
        f78248f = bVarArr;
        EnumEntriesKt.a(bVarArr);
    }

    public b(String str, int i5, int i11) {
        this.f78249a = i11;
    }

    public static b[] values() {
        return (b[]) f78248f.clone();
    }
}
