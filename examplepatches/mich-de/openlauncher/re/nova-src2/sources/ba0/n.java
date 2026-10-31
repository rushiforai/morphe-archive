package ba0;

/* loaded from: classes5.dex */
public final class n extends r {

    /* renamed from: f, reason: collision with root package name */
    public final String f17775f;

    /* renamed from: g, reason: collision with root package name */
    public final String f17776g;

    public n(String str, String str2) {
        this.f17775f = str;
        this.f17776g = str2;
    }

    @Override // ba0.r
    public final void a(y yVar) {
        yVar.D(this);
    }

    @Override // ba0.r
    public final String e() {
        return "destination=" + this.f17775f + ", title=" + this.f17776g;
    }
}
