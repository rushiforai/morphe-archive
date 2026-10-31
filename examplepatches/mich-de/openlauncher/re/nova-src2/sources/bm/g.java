package bm;

import android.content.Context;

/* loaded from: classes.dex */
public final /* synthetic */ class g implements nm.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18073a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f18074b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f18075c;

    public /* synthetic */ g(int i5, Object obj, Object obj2) {
        this.f18073a = i5;
        this.f18074b = obj;
        this.f18075c = obj2;
    }

    @Override // nm.c
    public final Object get() {
        switch (this.f18073a) {
            case 0:
                h hVar = (h) this.f18074b;
                b bVar = (b) this.f18075c;
                return bVar.f18068f.q(new t(bVar, hVar));
            case 1:
                return new lm.j((Context) this.f18074b, (String) this.f18075c);
            default:
                ul.g gVar = (ul.g) this.f18074b;
                Context context = (Context) this.f18075c;
                String strD = gVar.d();
                return new sm.a(context, strD);
        }
    }
}
