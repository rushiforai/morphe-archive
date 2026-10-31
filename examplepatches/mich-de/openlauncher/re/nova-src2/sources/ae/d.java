package ae;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public static final d f12743a;

    /* renamed from: b, reason: collision with root package name */
    public static final d f12744b;

    /* renamed from: c, reason: collision with root package name */
    public static final d f12745c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ d[] f12746d;

    static {
        d dVar = new d("NETWORK_UNMETERED", 0);
        f12743a = dVar;
        d dVar2 = new d("DEVICE_IDLE", 1);
        f12744b = dVar2;
        d dVar3 = new d("DEVICE_CHARGING", 2);
        f12745c = dVar3;
        f12746d = new d[]{dVar, dVar2, dVar3};
    }

    public static d valueOf(String str) {
        return (d) Enum.valueOf(d.class, str);
    }

    public static d[] values() {
        return (d[]) f12746d.clone();
    }
}
