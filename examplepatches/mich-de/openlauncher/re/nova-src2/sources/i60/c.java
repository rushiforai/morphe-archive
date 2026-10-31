package i60;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final c f61408a;

    /* renamed from: b, reason: collision with root package name */
    public static final c f61409b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ c[] f61410c;

    static {
        c cVar = new c("BULLET", 0);
        f61408a = cVar;
        c cVar2 = new c("ORDERED", 1);
        f61409b = cVar2;
        f61410c = new c[]{cVar, cVar2};
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f61410c.clone();
    }
}
