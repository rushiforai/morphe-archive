package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class kt0 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ long b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ Object d;

    public /* synthetic */ kt0(long j, m45 m45Var, boolean z, int i) {
        this.b = j;
        this.d = m45Var;
        this.c = z;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.d;
        switch (i) {
            case 0:
                String str = (String) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    boolean z = this.c;
                    long j = this.b;
                    if (!z) {
                        p65Var.Y(1946461426);
                        qv5.b(vn7.J(R.drawable.ic_bookmark_add_24, 0, p65Var), vo7.Q(R.string.common_content_description_save, new Object[]{str}, p65Var), null, j, p65Var, 8, 4);
                        p65Var.p(false);
                    } else {
                        p65Var.Y(1946198484);
                        qv5.b(vn7.J(R.drawable.ic_bookmark_24, 0, p65Var), vo7.Q(R.string.common_content_description_unsave, new Object[]{str}, p65Var), null, j, p65Var, 8, 4);
                        p65Var.p(false);
                    }
                }
                break;
            default:
                ((Integer) obj2).getClass();
                t18.c(this.b, (m45) obj3, this.c, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ kt0(long j, String str, boolean z) {
        this.c = z;
        this.d = str;
        this.b = j;
    }
}
