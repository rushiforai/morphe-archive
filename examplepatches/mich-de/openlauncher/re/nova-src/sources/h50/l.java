package h50;

/* loaded from: classes.dex */
public final class l extends r50.b {

    /* renamed from: a, reason: collision with root package name */
    public final o50.e f59224a;

    /* renamed from: b, reason: collision with root package name */
    public final long f59225b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f59226c;

    public l(o50.e eVar, Object obj) {
        this.f59226c = obj;
        if (eVar == null) {
            o50.e eVar2 = o50.b.f79540a;
            eVar = o50.b.f79541b;
        }
        this.f59224a = eVar;
        this.f59225b = ((byte[]) obj).length;
    }

    @Override // r50.c
    public final Long a() {
        return Long.valueOf(this.f59225b);
    }

    @Override // r50.c
    public final o50.e b() {
        return this.f59224a;
    }

    @Override // r50.b
    public final byte[] d() {
        return (byte[]) this.f59226c;
    }
}
