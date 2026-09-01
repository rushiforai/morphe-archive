package defpackage;

import java.net.Proxy;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class kmb {
    public final cb a;
    public final zm7 b;
    public final boolean c;
    public final List d;
    public int e;
    public List f;
    public final ArrayList g;

    public kmb(cb cbVar, zm7 zm7Var, cva cvaVar, boolean z) {
        List listK;
        zm7Var.getClass();
        this.a = cbVar;
        this.b = zm7Var;
        this.c = z;
        ey3 ey3Var = ey3.a;
        this.d = ey3Var;
        this.f = ey3Var;
        this.g = new ArrayList();
        URI uriJ = cbVar.h.j();
        if (uriJ.getHost() == null) {
            listK = ggf.k(new Proxy[]{Proxy.NO_PROXY});
        } else {
            List<Proxy> listSelect = cbVar.g.select(uriJ);
            listK = (listSelect == null || listSelect.isEmpty()) ? ggf.k(new Proxy[]{Proxy.NO_PROXY}) : ggf.j(listSelect);
        }
        this.d = listK;
        this.e = 0;
    }

    public final boolean a() {
        return this.e < this.d.size() || !this.g.isEmpty();
    }
}
