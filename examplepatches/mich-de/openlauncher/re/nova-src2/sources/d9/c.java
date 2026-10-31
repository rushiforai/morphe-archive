package d9;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final c f49028a;

    /* renamed from: b, reason: collision with root package name */
    public static final c f49029b;

    /* renamed from: c, reason: collision with root package name */
    public static final c f49030c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ c[] f49031d;

    static {
        c cVar = new c("POSITIVE", 0);
        f49028a = cVar;
        c cVar2 = new c("NEUTRAL", 1);
        f49029b = cVar2;
        c cVar3 = new c("NEGATIVE", 2);
        f49030c = cVar3;
        f49031d = new c[]{cVar, cVar2, cVar3};
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f49031d.clone();
    }
}
