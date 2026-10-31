package jb;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public static final h f69400a;

    /* renamed from: b, reason: collision with root package name */
    public static final h f69401b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ h[] f69402c;

    static {
        h hVar = new h("LOW", 0);
        f69400a = hVar;
        h hVar2 = new h("NORMAL", 1);
        f69401b = hVar2;
        f69402c = new h[]{hVar, hVar2, new h("HIGH", 2), new h("IMMEDIATE", 3)};
    }

    public static h valueOf(String str) {
        return (h) Enum.valueOf(h.class, str);
    }

    public static h[] values() {
        return (h[]) f69402c.clone();
    }
}
