package com.fyber.inneractive.sdk.flow.endcard;

import android.content.Context;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.flow.t0;
import com.fyber.inneractive.sdk.flow.x0;
import com.fyber.inneractive.sdk.flow.y0;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes3.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final y0 f28075a;

    /* renamed from: b, reason: collision with root package name */
    public final m f28076b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f28077c;

    /* renamed from: d, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.flow.endcard.loaders.b f28078d;

    /* renamed from: e, reason: collision with root package name */
    public final h f28079e;

    /* renamed from: f, reason: collision with root package name */
    public final int f28080f;

    /* renamed from: g, reason: collision with root package name */
    public final AtomicBoolean f28081g;

    /* renamed from: h, reason: collision with root package name */
    public final Object f28082h;

    public k(Context context, t0 t0Var, x0 x0Var) {
        y0 y0Var = new y0(context, t0Var);
        m mVar = new m();
        this.f28076b = mVar;
        this.f28081g = new AtomicBoolean(false);
        this.f28082h = new Object();
        this.f28075a = y0Var;
        this.f28077c = !TextUtils.equals(y0Var.f28456d.B, "1");
        h hVar = new h(x0Var);
        this.f28079e = hVar;
        this.f28080f = hVar.f28071b;
        this.f28078d = new com.fyber.inneractive.sdk.flow.endcard.loaders.b(y0Var, mVar);
    }

    public final b a() {
        synchronized (this.f28082h) {
            try {
                if (!this.f28081g.compareAndSet(false, true)) {
                    return this.f28076b.a();
                }
                b bVarB = b();
                this.f28079e.a(this.f28076b);
                return bVarB;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final b b() {
        b bVar;
        m mVar = this.f28076b;
        int size = mVar.f28113a.size();
        int i5 = mVar.f28115c;
        do {
            i5++;
            if (i5 >= size) {
                return null;
            }
            bVar = (b) mVar.f28113a.get(i5);
        } while (!bVar.l());
        if (bVar.i() == com.fyber.inneractive.sdk.model.vast.i.Default_End_Card) {
            for (int size2 = mVar.f28114b.size() - 1; size2 >= 0; size2--) {
                if (((b) mVar.f28114b.get(size2)) instanceof o) {
                    return null;
                }
            }
            if (mVar.f28115c >= 0) {
                return null;
            }
        } else if (bVar instanceof c) {
            int i11 = i5 + 1;
            for (int size3 = mVar.f28113a.size() - 1; size3 >= i11; size3--) {
                b bVar2 = (b) mVar.f28113a.get(size3);
                if (bVar2 instanceof c) {
                    bVar2.destroy();
                    mVar.f28113a.remove(size3);
                }
            }
        }
        mVar.f28115c = i5;
        mVar.f28114b.add(bVar);
        bVar.f28059e = mVar.f28114b.size();
        return bVar;
    }
}
