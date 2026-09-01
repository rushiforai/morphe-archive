package defpackage;

import android.net.http.UrlRequest;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ot extends sgg {
    public final UrlRequest r;
    public final up s;

    public ot(UrlRequest urlRequest, up upVar, String str) {
        this.r = urlRequest;
        this.s = upVar;
    }

    @Override // defpackage.sgg
    public final void D() {
        this.r.cancel();
    }

    @Override // defpackage.sgg
    public final void M() {
        this.r.followRedirect();
    }

    @Override // defpackage.sgg
    public final void S(ByteBuffer byteBuffer) {
        this.r.read(byteBuffer);
    }

    @Override // defpackage.sgg
    public final void Y() {
        this.r.start();
    }

    public final void d0() {
        up upVar = this.s;
        ArrayList arrayList = new ArrayList();
        synchronized (upVar.w) {
            arrayList.addAll(upVar.w.values());
        }
        Iterator it2 = arrayList.iterator();
        if (it2.hasNext()) {
            throw null;
        }
    }
}
