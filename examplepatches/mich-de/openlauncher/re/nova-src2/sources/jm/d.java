package jm;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public static final d f69597a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ d[] f69598b;

    static {
        d dVar = new d("DEFAULT", 0);
        f69597a = dVar;
        f69598b = new d[]{dVar, new d("SIGNED", 1), new d("FIXED", 2)};
    }

    public static d valueOf(String str) {
        return (d) Enum.valueOf(d.class, str);
    }

    public static d[] values() {
        return (d[]) f69598b.clone();
    }
}
