package x60;

/* loaded from: classes4.dex */
public enum a implements d {
    /* JADX INFO: Fake field, exist only in values array */
    KIBI("Ki", 1),
    /* JADX INFO: Fake field, exist only in values array */
    MEBI("Mi", 2),
    /* JADX INFO: Fake field, exist only in values array */
    GIBI("Gi", 3),
    /* JADX INFO: Fake field, exist only in values array */
    TEBI("Ti", 4),
    /* JADX INFO: Fake field, exist only in values array */
    PEBI("Pi", 5),
    /* JADX INFO: Fake field, exist only in values array */
    EXBI("Ei", 6),
    /* JADX INFO: Fake field, exist only in values array */
    ZEBI("Zi", 7),
    /* JADX INFO: Fake field, exist only in values array */
    YOBI("Yi", 8);


    /* renamed from: a, reason: collision with root package name */
    public final String f95110a;

    /* renamed from: b, reason: collision with root package name */
    public final int f95111b;

    a(String str, int i5) {
        this.f95110a = str;
        this.f95111b = i5;
    }

    @Override // x60.d
    public final int a() {
        return this.f95111b;
    }

    @Override // x60.d
    public final /* bridge */ /* synthetic */ Integer b() {
        return 1024;
    }
}
