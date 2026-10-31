package qd;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public static final d f83918a;

    /* renamed from: b, reason: collision with root package name */
    public static final d f83919b;

    /* renamed from: c, reason: collision with root package name */
    public static final d f83920c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ d[] f83921d;

    static {
        d dVar = new d("DEFAULT", 0);
        f83918a = dVar;
        d dVar2 = new d("VERY_LOW", 1);
        f83919b = dVar2;
        d dVar3 = new d("HIGHEST", 2);
        f83920c = dVar3;
        f83921d = new d[]{dVar, dVar2, dVar3};
    }

    public static d valueOf(String str) {
        return (d) Enum.valueOf(d.class, str);
    }

    public static d[] values() {
        return (d[]) f83921d.clone();
    }
}
