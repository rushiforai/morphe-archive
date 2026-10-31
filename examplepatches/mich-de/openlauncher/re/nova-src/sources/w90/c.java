package w90;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final c f94120a;

    /* renamed from: b, reason: collision with root package name */
    public static final c f94121b;

    /* renamed from: c, reason: collision with root package name */
    public static final c f94122c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ c[] f94123d;

    static {
        c cVar = new c("LEFT", 0);
        f94120a = cVar;
        c cVar2 = new c("CENTER", 1);
        f94121b = cVar2;
        c cVar3 = new c("RIGHT", 2);
        f94122c = cVar3;
        f94123d = new c[]{cVar, cVar2, cVar3};
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f94123d.clone();
    }
}
