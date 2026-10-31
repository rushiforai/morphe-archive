package jk;

/* loaded from: classes3.dex */
public final class g extends ih.g {

    /* renamed from: b, reason: collision with root package name */
    public final ex.a f69582b;

    /* renamed from: c, reason: collision with root package name */
    public final fi.j f69583c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ h f69584d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ h f69585e;

    public g(h hVar, fi.j jVar, String str) {
        this.f69585e = hVar;
        ex.a aVar = new ex.a("OnRequestInstallCallback", 2);
        this.f69584d = hVar;
        super(2);
        attachInterface(this, "com.google.android.play.core.appupdate.protocol.IAppUpdateServiceCallback");
        this.f69582b = aVar;
        this.f69583c = jVar;
    }
}
