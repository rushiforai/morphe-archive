package xk;

/* loaded from: classes3.dex */
public final class w0 {

    /* renamed from: a, reason: collision with root package name */
    public final Object f96037a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f96038b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f96039c;

    public w0(Object obj, Object obj2, Object obj3) {
        this.f96037a = obj;
        this.f96038b = obj2;
        this.f96039c = obj3;
    }

    public final IllegalArgumentException a() {
        StringBuilder sb2 = new StringBuilder("Multiple entries with same key: ");
        Object obj = this.f96037a;
        sb2.append(obj);
        sb2.append("=");
        sb2.append(this.f96038b);
        sb2.append(" and ");
        sb2.append(obj);
        sb2.append("=");
        sb2.append(this.f96039c);
        return new IllegalArgumentException(sb2.toString());
    }
}
