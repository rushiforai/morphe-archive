package sv;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final c f87738a;

    /* renamed from: b, reason: collision with root package name */
    public static final c f87739b;

    /* renamed from: c, reason: collision with root package name */
    public static final c f87740c;

    /* renamed from: d, reason: collision with root package name */
    public static final c f87741d;

    /* renamed from: e, reason: collision with root package name */
    public static final c f87742e;

    /* renamed from: f, reason: collision with root package name */
    public static final c f87743f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ c[] f87744g;

    static {
        c cVar = new c("SUBMIT", 0);
        f87738a = cVar;
        c cVar2 = new c("CONTINUE", 1);
        f87739b = cVar2;
        c cVar3 = new c("NEXT", 2);
        f87740c = cVar3;
        c cVar4 = new c("CANCEL", 3);
        f87741d = cVar4;
        c cVar5 = new c("RESEND", 4);
        f87742e = cVar5;
        c cVar6 = new c("SELECT", 5);
        f87743f = cVar6;
        f87744g = new c[]{cVar, cVar2, cVar3, cVar4, cVar5, cVar6};
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f87744g.clone();
    }
}
