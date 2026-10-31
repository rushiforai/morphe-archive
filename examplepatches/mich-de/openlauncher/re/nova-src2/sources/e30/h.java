package e30;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public static final h f52109a;

    /* renamed from: b, reason: collision with root package name */
    public static final h f52110b;

    /* renamed from: c, reason: collision with root package name */
    public static final h f52111c;

    /* renamed from: d, reason: collision with root package name */
    public static final h f52112d;

    /* renamed from: e, reason: collision with root package name */
    public static final h f52113e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ h[] f52114f;

    static {
        h hVar = new h("PORTRAIT", 0);
        f52109a = hVar;
        h hVar2 = new h("LANDSCAPE", 1);
        f52110b = hVar2;
        h hVar3 = new h("FULL", 2);
        f52111c = hVar3;
        h hVar4 = new h("SQUARE", 3);
        f52112d = hVar4;
        h hVar5 = new h("FREE", 4);
        f52113e = hVar5;
        f52114f = new h[]{hVar, hVar2, hVar3, hVar4, hVar5};
    }

    public static h valueOf(String str) {
        return (h) Enum.valueOf(h.class, str);
    }

    public static h[] values() {
        return (h[]) f52114f.clone();
    }
}
