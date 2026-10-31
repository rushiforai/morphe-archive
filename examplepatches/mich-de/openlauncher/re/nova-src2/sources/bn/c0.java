package bn;

import android.content.Context;
import kotlin.coroutines.CoroutineContext;

/* loaded from: classes3.dex */
public final class c0 implements dn.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18146a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final dn.c f18147b;

    /* renamed from: c, reason: collision with root package name */
    public final b5.f f18148c;

    public c0(b5.f fVar, dn.c cVar) {
        this.f18148c = fVar;
        this.f18147b = cVar;
    }

    @Override // w60.a
    public final Object get() {
        switch (this.f18146a) {
            case 0:
                return new b0((Context) this.f18148c.f17550a, (j1) this.f18147b.get());
            default:
                return new en.e((b) this.f18147b.get(), (CoroutineContext) this.f18148c.f17550a);
        }
    }

    public c0(dn.c cVar, b5.f fVar) {
        this.f18147b = cVar;
        this.f18148c = fVar;
    }
}
