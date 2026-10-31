package com.iab.omid.library.vungle.internal;

import android.annotation.SuppressLint;
import android.view.View;
import java.util.Iterator;

/* loaded from: classes3.dex */
public class b extends d {

    /* renamed from: d, reason: collision with root package name */
    @SuppressLint({"StaticFieldLeak"})
    private static b f35204d = new b();

    private b() {
    }

    public static b g() {
        return f35204d;
    }

    @Override // com.iab.omid.library.vungle.internal.d
    public void b(boolean z11) {
        Iterator<com.iab.omid.library.vungle.adsession.a> it = c.c().b().iterator();
        while (it.hasNext()) {
            it.next().d().a(z11);
        }
    }

    @Override // com.iab.omid.library.vungle.internal.d
    public boolean d() {
        Iterator<com.iab.omid.library.vungle.adsession.a> it = c.c().a().iterator();
        while (it.hasNext()) {
            View viewE = it.next().e();
            if (viewE != null && viewE.hasWindowFocus()) {
                return true;
            }
        }
        return false;
    }
}
