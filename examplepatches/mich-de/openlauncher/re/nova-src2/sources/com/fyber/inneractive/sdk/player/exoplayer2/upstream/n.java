package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;

/* loaded from: classes3.dex */
public final class n implements h {

    /* renamed from: a, reason: collision with root package name */
    public final h f30382a;

    /* renamed from: b, reason: collision with root package name */
    public final s f30383b;

    /* renamed from: c, reason: collision with root package name */
    public final d f30384c;

    /* renamed from: d, reason: collision with root package name */
    public final f f30385d;

    /* renamed from: e, reason: collision with root package name */
    public h f30386e;

    public n(Context context, m mVar, h hVar) {
        hVar.getClass();
        this.f30382a = hVar;
        this.f30383b = new s(mVar);
        this.f30384c = new d(context, mVar);
        this.f30385d = new f(context, mVar);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final long a(k kVar) {
        if (this.f30386e != null) {
            throw new IllegalStateException();
        }
        String scheme = kVar.f30365a.getScheme();
        Uri uri = kVar.f30365a;
        int i5 = com.fyber.inneractive.sdk.player.exoplayer2.util.z.f30489a;
        String scheme2 = uri.getScheme();
        if (TextUtils.isEmpty(scheme2) || scheme2.equals("file")) {
            if (kVar.f30365a.getPath().startsWith("/android_asset/")) {
                this.f30386e = this.f30384c;
            } else {
                this.f30386e = this.f30383b;
            }
        } else if ("asset".equals(scheme)) {
            this.f30386e = this.f30384c;
        } else if ("content".equals(scheme)) {
            this.f30386e = this.f30385d;
        } else {
            this.f30386e = this.f30382a;
        }
        return this.f30386e.a(kVar);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final void close() {
        h hVar = this.f30386e;
        if (hVar != null) {
            try {
                hVar.close();
            } finally {
                this.f30386e = null;
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final int read(byte[] bArr, int i5, int i11) {
        return this.f30386e.read(bArr, i5, i11);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final Uri a() {
        h hVar = this.f30386e;
        if (hVar == null) {
            return null;
        }
        return hVar.a();
    }
}
