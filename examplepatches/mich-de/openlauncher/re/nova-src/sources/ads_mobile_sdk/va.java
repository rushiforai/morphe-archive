package ads_mobile_sdk;

/* loaded from: classes2.dex */
public final class va implements pi.b {

    /* renamed from: a, reason: collision with root package name */
    public final pi.a f10641a;

    /* renamed from: b, reason: collision with root package name */
    public final String f10642b;

    /* renamed from: c, reason: collision with root package name */
    public final int f10643c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ pi.a f10644d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ String f10645e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f10646f;

    public va(pi.a aVar, String str, int i5) {
        this.f10644d = aVar;
        this.f10645e = str;
        this.f10646f = i5;
        this.f10641a = aVar;
        this.f10642b = str;
        this.f10643c = i5;
    }

    public final String getDescription() {
        return this.f10642b;
    }

    public final pi.a getInitializationState() {
        return this.f10641a;
    }

    public final int getLatency() {
        return this.f10643c;
    }

    public final String toString() {
        return "Adapter in state " + this.f10644d + " completed in " + this.f10646f + " with description: " + this.f10645e;
    }
}
