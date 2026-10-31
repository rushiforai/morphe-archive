package d4;

/* loaded from: classes.dex */
public final class j extends g {

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ k f48970h;

    public j(k kVar) {
        this.f48970h = kVar;
    }

    @Override // d4.g
    public final String k() {
        h hVar = (h) this.f48970h.f48971a.get();
        if (hVar == null) {
            return "Completer object has been garbage collected, future will fail soon";
        }
        return "tag=[" + hVar.f48966a + "]";
    }
}
