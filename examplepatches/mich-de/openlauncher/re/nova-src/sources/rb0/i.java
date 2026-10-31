package rb0;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class i implements mb0.e {

    /* renamed from: a, reason: collision with root package name */
    public static final i f85790a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ i[] f85791b;

    static {
        i iVar = new i("INSTANCE", 0);
        f85790a = iVar;
        f85791b = new i[]{iVar};
    }

    public static i valueOf(String str) {
        return (i) Enum.valueOf(i.class, str);
    }

    public static i[] values() {
        return (i[]) f85791b.clone();
    }

    @Override // mb0.e
    public final Object b(Object obj) {
        return obj;
    }
}
