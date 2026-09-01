package defpackage;

import android.net.Network;
import android.net.http.HttpEngine;
import android.net.http.UrlRequest;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class up extends mi2 {
    public final HttpEngine v;
    public final Map w = DesugarCollections.synchronizedMap(new HashMap());

    public up(HttpEngine httpEngine) {
        this.v = httpEngine;
    }

    @Override // defpackage.gx1
    public final h7e S(String str, ceg cegVar, Executor executor) {
        return new h7e(str, cegVar, executor, this);
    }

    @Override // defpackage.mi2
    public final sgg g0(String str, ceg cegVar, Executor executor, int i, boolean z, int i2, long j, String str2, ArrayList arrayList, u5e u5eVar, Executor executor2) {
        nt ntVar = new nt(cegVar);
        UrlRequest.Builder builderNewUrlRequestBuilder = this.v.newUrlRequestBuilder(str, executor, ntVar);
        builderNewUrlRequestBuilder.setPriority(i);
        if (z) {
            builderNewUrlRequestBuilder.setTrafficStatsTag(i2);
        }
        builderNewUrlRequestBuilder.bindToNetwork(j == -1 ? null : Network.fromNetworkHandle(j));
        builderNewUrlRequestBuilder.setHttpMethod(str2);
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            Map.Entry entry = (Map.Entry) it2.next();
            builderNewUrlRequestBuilder.addHeader((String) entry.getKey(), (String) entry.getValue());
        }
        if (u5eVar != null) {
            builderNewUrlRequestBuilder.setUploadDataProvider(new gt(u5eVar), executor2);
        }
        ot otVar = new ot(builderNewUrlRequestBuilder.build(), this, str);
        ntVar.b = otVar;
        return otVar;
    }
}
