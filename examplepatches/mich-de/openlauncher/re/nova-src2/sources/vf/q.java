package vf;

import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes3.dex */
public final class q implements k {

    /* renamed from: a, reason: collision with root package name */
    public final Context f92728a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f92729b;

    /* renamed from: c, reason: collision with root package name */
    public final k f92730c;

    /* renamed from: d, reason: collision with root package name */
    public w f92731d;

    /* renamed from: e, reason: collision with root package name */
    public b f92732e;

    /* renamed from: f, reason: collision with root package name */
    public g f92733f;

    /* renamed from: g, reason: collision with root package name */
    public k f92734g;

    /* renamed from: h, reason: collision with root package name */
    public h0 f92735h;

    /* renamed from: i, reason: collision with root package name */
    public i f92736i;

    /* renamed from: j, reason: collision with root package name */
    public c0 f92737j;

    /* renamed from: k, reason: collision with root package name */
    public k f92738k;

    public q(Context context, k kVar) {
        this.f92728a = context.getApplicationContext();
        kVar.getClass();
        this.f92730c = kVar;
        this.f92729b = new ArrayList();
    }

    public static void h(k kVar, g0 g0Var) {
        if (kVar != null) {
            kVar.addTransferListener(g0Var);
        }
    }

    public final void a(k kVar) {
        int i5 = 0;
        while (true) {
            ArrayList arrayList = this.f92729b;
            if (i5 >= arrayList.size()) {
                return;
            }
            kVar.addTransferListener((g0) arrayList.get(i5));
            i5++;
        }
    }

    @Override // vf.k
    public final void addTransferListener(g0 g0Var) {
        g0Var.getClass();
        this.f92730c.addTransferListener(g0Var);
        this.f92729b.add(g0Var);
        h(this.f92731d, g0Var);
        h(this.f92732e, g0Var);
        h(this.f92733f, g0Var);
        h(this.f92734g, g0Var);
        h(this.f92735h, g0Var);
        h(this.f92736i, g0Var);
        h(this.f92737j, g0Var);
    }

    @Override // vf.k
    public final void close() {
        k kVar = this.f92738k;
        if (kVar != null) {
            try {
                kVar.close();
            } finally {
                this.f92738k = null;
            }
        }
    }

    @Override // vf.k
    public final Map getResponseHeaders() {
        k kVar = this.f92738k;
        return kVar == null ? Collections.EMPTY_MAP : kVar.getResponseHeaders();
    }

    @Override // vf.k
    public final Uri getUri() {
        k kVar = this.f92738k;
        if (kVar == null) {
            return null;
        }
        return kVar.getUri();
    }

    @Override // vf.k
    public final long open(l lVar) {
        wf.a.i(this.f92738k == null);
        Uri uri = lVar.f92691a;
        String scheme = uri.getScheme();
        int i5 = wf.v.f94376a;
        String scheme2 = uri.getScheme();
        boolean zIsEmpty = TextUtils.isEmpty(scheme2);
        Context context = this.f92728a;
        if (zIsEmpty || "file".equals(scheme2)) {
            String path = uri.getPath();
            if (path == null || !path.startsWith("/android_asset/")) {
                if (this.f92731d == null) {
                    w wVar = new w(false);
                    this.f92731d = wVar;
                    a(wVar);
                }
                this.f92738k = this.f92731d;
            } else {
                if (this.f92732e == null) {
                    b bVar = new b(context);
                    this.f92732e = bVar;
                    a(bVar);
                }
                this.f92738k = this.f92732e;
            }
        } else if ("asset".equals(scheme)) {
            if (this.f92732e == null) {
                b bVar2 = new b(context);
                this.f92732e = bVar2;
                a(bVar2);
            }
            this.f92738k = this.f92732e;
        } else if ("content".equals(scheme)) {
            if (this.f92733f == null) {
                g gVar = new g(context);
                this.f92733f = gVar;
                a(gVar);
            }
            this.f92738k = this.f92733f;
        } else {
            boolean zEquals = "rtmp".equals(scheme);
            k kVar = this.f92730c;
            if (zEquals) {
                if (this.f92734g == null) {
                    try {
                        k kVar2 = (k) Class.forName("com.google.android.exoplayer2.ext.rtmp.RtmpDataSource").getConstructor(null).newInstance(null);
                        this.f92734g = kVar2;
                        a(kVar2);
                    } catch (ClassNotFoundException unused) {
                        wf.a.D("DefaultDataSource", "Attempting to play RTMP stream without depending on the RTMP extension");
                    } catch (Exception e3) {
                        throw new RuntimeException("Error instantiating RTMP extension", e3);
                    }
                    if (this.f92734g == null) {
                        this.f92734g = kVar;
                    }
                }
                this.f92738k = this.f92734g;
            } else if ("udp".equals(scheme)) {
                if (this.f92735h == null) {
                    h0 h0Var = new h0();
                    this.f92735h = h0Var;
                    a(h0Var);
                }
                this.f92738k = this.f92735h;
            } else if ("data".equals(scheme)) {
                if (this.f92736i == null) {
                    i iVar = new i(false);
                    this.f92736i = iVar;
                    a(iVar);
                }
                this.f92738k = this.f92736i;
            } else if ("rawresource".equals(scheme) || "android.resource".equals(scheme)) {
                if (this.f92737j == null) {
                    c0 c0Var = new c0(context);
                    this.f92737j = c0Var;
                    a(c0Var);
                }
                this.f92738k = this.f92737j;
            } else {
                this.f92738k = kVar;
            }
        }
        return this.f92738k.open(lVar);
    }

    @Override // vf.h
    public final int read(byte[] bArr, int i5, int i11) {
        k kVar = this.f92738k;
        kVar.getClass();
        return kVar.read(bArr, i5, i11);
    }
}
