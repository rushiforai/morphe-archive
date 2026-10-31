package bu;

/* loaded from: classes4.dex */
public final class a implements s40.h {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18490a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f18491b;

    public /* synthetic */ a(Object obj, int i5) {
        this.f18490a = i5;
        this.f18491b = obj;
    }

    @Override // w60.a
    public final Object get() {
        switch (this.f18490a) {
            case 0:
                return new e(((b) this.f18491b).f18494a, 0);
            case 1:
                return new c(((b) this.f18491b).f18494a, 0);
            default:
                return new a5.d((tm.o) ((tm.o) this.f18491b).f89494c, 17);
        }
    }
}
