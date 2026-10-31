package he;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* loaded from: classes3.dex */
public abstract class q implements h {

    /* renamed from: b, reason: collision with root package name */
    public g f59781b;

    /* renamed from: c, reason: collision with root package name */
    public g f59782c;

    /* renamed from: d, reason: collision with root package name */
    public g f59783d;

    /* renamed from: e, reason: collision with root package name */
    public g f59784e;

    /* renamed from: f, reason: collision with root package name */
    public ByteBuffer f59785f;

    /* renamed from: g, reason: collision with root package name */
    public ByteBuffer f59786g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f59787h;

    public q() {
        ByteBuffer byteBuffer = h.f59733a;
        this.f59785f = byteBuffer;
        this.f59786g = byteBuffer;
        g gVar = g.f59715e;
        this.f59783d = gVar;
        this.f59784e = gVar;
        this.f59781b = gVar;
        this.f59782c = gVar;
    }

    @Override // he.h
    public ByteBuffer a() {
        ByteBuffer byteBuffer = this.f59786g;
        this.f59786g = h.f59733a;
        return byteBuffer;
    }

    @Override // he.h
    public boolean b() {
        return this.f59784e != g.f59715e;
    }

    @Override // he.h
    public final g c(g gVar) {
        this.f59783d = gVar;
        this.f59784e = g(gVar);
        return b() ? this.f59784e : g.f59715e;
    }

    @Override // he.h
    public final void e() {
        this.f59787h = true;
        i();
    }

    @Override // he.h
    public boolean f() {
        return this.f59787h && this.f59786g == h.f59733a;
    }

    @Override // he.h
    public final void flush() {
        this.f59786g = h.f59733a;
        this.f59787h = false;
        this.f59781b = this.f59783d;
        this.f59782c = this.f59784e;
        h();
    }

    public abstract g g(g gVar);

    public void h() {
    }

    public void i() {
    }

    public void j() {
    }

    public final ByteBuffer k(int i5) {
        if (this.f59785f.capacity() < i5) {
            this.f59785f = ByteBuffer.allocateDirect(i5).order(ByteOrder.nativeOrder());
        } else {
            this.f59785f.clear();
        }
        ByteBuffer byteBuffer = this.f59785f;
        this.f59786g = byteBuffer;
        return byteBuffer;
    }

    @Override // he.h
    public final void reset() {
        flush();
        this.f59785f = h.f59733a;
        g gVar = g.f59715e;
        this.f59783d = gVar;
        this.f59784e = gVar;
        this.f59781b = gVar;
        this.f59782c = gVar;
        j();
    }
}
