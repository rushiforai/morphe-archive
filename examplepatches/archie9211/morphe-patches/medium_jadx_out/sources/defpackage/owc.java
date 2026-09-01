package defpackage;

import com.medium.android.core.models.EntityType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class owc extends que {
    public final String b;
    public final EntityType c;
    public final String d;
    public final String e;
    public final o2b f;
    public final ax2 g;
    public final ax2 h;
    public final r6c i;
    public final uua j;
    public final wua k;
    public final String l;
    public boolean m;

    public owc(String str, EntityType entityType, String str2, String str3, String str4, o2b o2bVar, ax2 ax2Var, ax2 ax2Var2) {
        SourceParameter sourceParameter;
        str.getClass();
        entityType.getClass();
        str2.getClass();
        str4.getClass();
        this.b = str;
        this.c = entityType;
        this.d = str3;
        this.e = str4;
        this.f = o2bVar;
        this.g = ax2Var;
        this.h = ax2Var2;
        r6c r6cVarX = k40.x(0, 7, null);
        this.i = r6cVarX;
        this.j = bo.z(r6cVarX);
        this.k = bo.A(vv2.j(new mwc(str2)));
        int i = nwc.a[entityType.ordinal()];
        if (i == 1) {
            sourceParameter = new SourceParameter("subscribe_to_newsletter", str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, str3, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -536870916, 8191, null);
        } else {
            if (i != 2) {
                ygf.a();
                throw null;
            }
            sourceParameter = new SourceParameter("subscribe_to_newsletter", null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, str3, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -536870930, 8191, null);
        }
        this.l = gp7.u(sourceParameter);
    }
}
