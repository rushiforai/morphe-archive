package wb0;

import ib0.e;
import ib0.h;
import java.util.ArrayList;

/* loaded from: classes.dex */
public final class c implements e {

    /* renamed from: a, reason: collision with root package name */
    public final h f94175a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f94176b = true;

    /* renamed from: c, reason: collision with root package name */
    public boolean f94177c;

    /* renamed from: d, reason: collision with root package name */
    public ArrayList f94178d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f94179e;

    public c(h hVar) {
        this.f94175a = hVar;
    }

    public final void a(Object obj) {
        if (!this.f94179e) {
            synchronized (this) {
                try {
                    this.f94176b = false;
                    if (this.f94177c) {
                        if (this.f94178d == null) {
                            this.f94178d = new ArrayList();
                        }
                        this.f94178d.add(obj);
                        return;
                    }
                    this.f94179e = true;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        nb0.d.a(this.f94175a, obj);
    }

    @Override // ib0.e
    public final void c(Object obj) {
        this.f94175a.c(obj);
    }

    @Override // ib0.e
    public final void onCompleted() {
        this.f94175a.onCompleted();
    }

    @Override // ib0.e
    public final void onError(Throwable th2) {
        this.f94175a.onError(th2);
    }
}
