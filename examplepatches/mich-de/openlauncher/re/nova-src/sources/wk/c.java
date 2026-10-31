package wk;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final c f94500a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ c[] f94501b;

    static {
        c cVar = new c("INSTANCE", 0);
        f94500a = cVar;
        f94501b = new c[]{cVar};
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f94501b.clone();
    }
}
