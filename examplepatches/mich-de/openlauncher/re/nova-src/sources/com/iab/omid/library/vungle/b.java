package com.iab.omid.library.vungle;

import android.content.Context;
import android.webkit.WebSettings;
import com.iab.omid.library.vungle.internal.i;
import com.iab.omid.library.vungle.internal.k;
import com.iab.omid.library.vungle.utils.e;
import com.iab.omid.library.vungle.utils.g;
import java.util.concurrent.Executors;

/* loaded from: classes3.dex */
public class b {

    /* renamed from: a, reason: collision with root package name */
    private boolean f35178a;

    public class a implements Runnable {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ Context f35179a;

        public a(b bVar, Context context) {
            this.f35179a = context;
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                WebSettings.getDefaultUserAgent(this.f35179a);
            } catch (Throwable unused) {
                com.iab.omid.library.vungle.utils.d.a("Ignoring failure while retrieving default WebView user agent");
            }
        }
    }

    private void b(Context context) {
        g.a(context, "Application Context cannot be null");
    }

    public String a() {
        return "1.6.2-Vungle";
    }

    public void c() {
        g.a();
        com.iab.omid.library.vungle.internal.a.a().d();
    }

    private void c(Context context) {
        Executors.newSingleThreadExecutor().execute(new a(this, context));
    }

    public void a(Context context) {
        b(context);
        if (b()) {
            return;
        }
        a(true);
        i.c().a(context);
        com.iab.omid.library.vungle.internal.b.g().a(context);
        com.iab.omid.library.vungle.utils.a.a(context);
        com.iab.omid.library.vungle.utils.c.a(context);
        e.a(context);
        com.iab.omid.library.vungle.internal.g.b().a(context);
        com.iab.omid.library.vungle.internal.a.a().a(context);
        k.b().a(context);
        c(context);
    }

    public boolean b() {
        return this.f35178a;
    }

    public void a(boolean z11) {
        this.f35178a = z11;
    }
}
