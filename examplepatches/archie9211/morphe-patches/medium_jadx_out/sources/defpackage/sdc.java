package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lsdc;", "Lque;", "es2", "pdc", "odc", "kdc", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class sdc extends que {
    public static final /* synthetic */ fj6[] r;
    public final String b;
    public final String c;
    public final String d;
    public final SusiDestination e;
    public final boolean f;
    public final a13 g;
    public final dzb h;
    public final qlb i;
    public final qlb j;
    public final String k;
    public final String l;
    public final SusiOperation m;
    public final wua n;
    public final r6c o;
    public final uua p;
    public final r6c q;

    static {
        c78 c78Var = new c78(sdc.class, "fullName", "getFullName()Landroidx/compose/ui/text/input/TextFieldValue;", 0);
        s1b s1bVar = n1b.a;
        r = new fj6[]{s1bVar.e(c78Var), ka1.h(sdc.class, "email", "getEmail()Landroidx/compose/ui/text/input/TextFieldValue;", 0, s1bVar)};
    }

    public sdc(String str, String str2, String str3, SusiDestination susiDestination, boolean z, vob vobVar, a13 a13Var, dzb dzbVar, kb2 kb2Var) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = str2;
        this.d = str3;
        this.e = susiDestination;
        this.f = z;
        this.g = a13Var;
        this.h = dzbVar;
        final int i = 0;
        m45 m45Var = new m45(this) { // from class: gdc
            public final /* synthetic */ sdc b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i2 = i;
                sdc sdcVar = this.b;
                switch (i2) {
                    case 0:
                        return qo7.u(new uid(sdcVar.c, 6, 0L));
                    default:
                        return qo7.u(new uid(sdcVar.b, 6, 0L));
                }
            }
        };
        fj6[] fj6VarArr = r;
        fj6 fj6Var = fj6VarArr[0];
        StringBuilder sb = new StringBuilder();
        s1b s1bVar = n1b.a;
        sb.append(s1bVar.b(sdc.class).d());
        sb.append('.');
        String str4 = sb.toString() + fj6Var.getName();
        mya myaVar = uid.d;
        this.i = new qlb(to7.r(vobVar, str4, myaVar, m45Var));
        final int i2 = 1;
        m45 m45Var2 = new m45(this) { // from class: gdc
            public final /* synthetic */ sdc b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i22 = i2;
                sdc sdcVar = this.b;
                switch (i22) {
                    case 0:
                        return qo7.u(new uid(sdcVar.c, 6, 0L));
                    default:
                        return qo7.u(new uid(sdcVar.b, 6, 0L));
                }
            }
        };
        fj6 fj6Var2 = fj6VarArr[1];
        StringBuilder sb2 = new StringBuilder(s1bVar.b(sdc.class).d() + '.');
        sb2.append(fj6Var2.getName());
        this.j = new qlb(to7.r(vobVar, sb2.toString(), myaVar, m45Var2));
        this.k = "susi_email_form";
        String strU = gp7.u(new SourceParameter("susi_email_form", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null));
        this.l = strU;
        this.m = SusiOperation.REGISTER;
        this.n = bo.e0(w2g.r(new u50(12, new eub(this, (n92) null, 14)), kb2Var), f76.F(this), l7c.b, new pdc(f(), e(), 1 == true ? 1 : 0, strU));
        r6c r6cVarX = k40.x(0, 7, null);
        this.o = r6cVarX;
        this.p = bo.z(r6cVarX);
        this.q = k40.x(0, 7, null);
    }

    public final uid e() {
        fj6 fj6Var = r[1];
        return (uid) ((l78) this.j.a).getValue();
    }

    public final uid f() {
        fj6 fj6Var = r[0];
        return (uid) ((l78) this.i.a).getValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0095 A[PHI: r15
      0x0095: PHI (r15v12 java.lang.Object) = (r15v10 java.lang.Object), (r15v1 java.lang.Object) binds: [B:34:0x0091, B:24:0x0048] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00ab A[PHI: r1
      0x00ab: PHI (r1v5 wyb) = (r1v4 wyb), (r1v9 wyb) binds: [B:37:0x00a7, B:23:0x0042] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00da  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x013b A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(defpackage.p92 r15) {
        /*
            Method dump skipped, instruction units count: 342
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sdc.g(p92):java.lang.Object");
    }
}
