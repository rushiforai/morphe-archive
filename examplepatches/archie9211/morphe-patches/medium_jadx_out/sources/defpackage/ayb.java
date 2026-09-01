package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ayb {
    public final txb a;
    public final l68 b;

    public ayb(zxb zxbVar, i46 i46Var) {
        this.a = zxbVar.d;
        List listJ = zxb.j(4, zxbVar);
        this.b = new l68(listJ.size());
        int size = listJ.size();
        for (int i = 0; i < size; i++) {
            zxb zxbVar2 = (zxb) listJ.get(i);
            if (i46Var.a(zxbVar2.f)) {
                this.b.a(zxbVar2.f);
            }
        }
    }
}
