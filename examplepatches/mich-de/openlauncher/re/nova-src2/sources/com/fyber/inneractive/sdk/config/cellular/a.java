package com.fyber.inneractive.sdk.config.cellular;

import android.content.Context;
import com.fyber.inneractive.sdk.util.a1;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes.dex */
public final class a implements h {

    /* renamed from: a, reason: collision with root package name */
    public final d f27776a;

    /* renamed from: c, reason: collision with root package name */
    public final CopyOnWriteArrayList f27778c = new CopyOnWriteArrayList();

    /* renamed from: b, reason: collision with root package name */
    public a1 f27777b = a1.UNKNOWN;

    public a(Context context) {
        this.f27776a = e.a(context);
    }

    @Override // com.fyber.inneractive.sdk.config.cellular.h
    public final void a(a1 a1Var) {
        this.f27777b = a1Var;
        Iterator it = this.f27778c.iterator();
        while (it.hasNext()) {
            h hVar = (h) it.next();
            if (hVar != null) {
                hVar.a(this.f27777b);
            }
        }
    }
}
