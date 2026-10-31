package nb0;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class a implements ib0.b {

    /* renamed from: a, reason: collision with root package name */
    public static final ib0.d f78096a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ a[] f78097b;

    /* JADX INFO: Fake field, exist only in values array */
    a EF0;

    static {
        a aVar = new a("INSTANCE", 0);
        f78097b = new a[]{aVar};
        f78096a = ib0.d.b(aVar);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f78097b.clone();
    }

    @Override // mb0.b
    /* renamed from: b */
    public final void mo5b(Object obj) {
        ((ib0.h) obj).onCompleted();
    }
}
