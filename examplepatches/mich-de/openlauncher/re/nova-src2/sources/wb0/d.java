package wb0;

import ib0.h;
import java.util.concurrent.atomic.AtomicReference;
import nb0.s;
import xb0.e;

/* loaded from: classes.dex */
public final class d extends AtomicReference implements ib0.b {

    /* renamed from: a, reason: collision with root package name */
    public volatile Object f94180a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f94181b;

    /* renamed from: c, reason: collision with root package name */
    public mb0.c f94182c;

    /* renamed from: d, reason: collision with root package name */
    public mb0.b f94183d;

    /* renamed from: e, reason: collision with root package name */
    public mb0.b f94184e;

    public final void a(c cVar) {
        b bVar;
        b bVar2;
        do {
            bVar = (b) get();
            if (bVar.f94173a) {
                return;
            }
            c[] cVarArr = bVar.f94174b;
            int length = cVarArr.length;
            bVar2 = b.f94172e;
            if (length != 1 || cVarArr[0] != cVar) {
                if (length == 0) {
                    bVar2 = bVar;
                    break;
                }
                int i5 = length - 1;
                c[] cVarArr2 = new c[i5];
                int i11 = 0;
                for (c cVar2 : cVarArr) {
                    if (cVar2 != cVar) {
                        if (i11 == i5) {
                            bVar2 = bVar;
                            break;
                        } else {
                            cVarArr2[i11] = cVar2;
                            i11++;
                        }
                    }
                }
                if (i11 != 0) {
                    if (i11 < i5) {
                        c[] cVarArr3 = new c[i11];
                        System.arraycopy(cVarArr2, 0, cVarArr3, 0, i11);
                        cVarArr2 = cVarArr3;
                    }
                    bVar2 = new b(bVar.f94173a, cVarArr2);
                }
            }
            if (bVar2 == bVar) {
                return;
            }
        } while (!compareAndSet(bVar, bVar2));
    }

    @Override // mb0.b
    /* renamed from: b */
    public final void mo5b(Object obj) {
        b bVar;
        c[] cVarArr;
        h hVar = (h) obj;
        c cVar = new c(hVar);
        hVar.d(e.a(new s(4, this, cVar)));
        this.f94182c.getClass();
        if (hVar.a()) {
            return;
        }
        do {
            bVar = (b) get();
            if (bVar.f94173a) {
                this.f94184e.mo5b(cVar);
                return;
            }
            c[] cVarArr2 = bVar.f94174b;
            int length = cVarArr2.length;
            cVarArr = new c[length + 1];
            System.arraycopy(cVarArr2, 0, cVarArr, 0, length);
            cVarArr[length] = cVar;
        } while (!compareAndSet(bVar, new b(bVar.f94173a, cVarArr)));
        this.f94183d.mo5b(cVar);
        if (hVar.a()) {
            a(cVar);
        }
    }
}
