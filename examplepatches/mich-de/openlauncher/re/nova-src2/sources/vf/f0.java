package vf;

import android.net.Uri;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes3.dex */
public final class f0 implements k {

    /* renamed from: a, reason: collision with root package name */
    public final k f92668a;

    /* renamed from: b, reason: collision with root package name */
    public long f92669b;

    /* renamed from: c, reason: collision with root package name */
    public Uri f92670c;

    public f0(k kVar) {
        kVar.getClass();
        this.f92668a = kVar;
        this.f92670c = Uri.EMPTY;
        Map map = Collections.EMPTY_MAP;
    }

    @Override // vf.k
    public final void addTransferListener(g0 g0Var) {
        g0Var.getClass();
        this.f92668a.addTransferListener(g0Var);
    }

    @Override // vf.k
    public final void close() {
        this.f92668a.close();
    }

    @Override // vf.k
    public final Map getResponseHeaders() {
        return this.f92668a.getResponseHeaders();
    }

    @Override // vf.k
    public final Uri getUri() {
        return this.f92668a.getUri();
    }

    @Override // vf.k
    public final long open(l lVar) {
        this.f92670c = lVar.f92691a;
        Map map = Collections.EMPTY_MAP;
        k kVar = this.f92668a;
        long jOpen = kVar.open(lVar);
        Uri uri = kVar.getUri();
        uri.getClass();
        this.f92670c = uri;
        kVar.getResponseHeaders();
        return jOpen;
    }

    @Override // vf.h
    public final int read(byte[] bArr, int i5, int i11) {
        int i12 = this.f92668a.read(bArr, i5, i11);
        if (i12 != -1) {
            this.f92669b += i12;
        }
        return i12;
    }
}
