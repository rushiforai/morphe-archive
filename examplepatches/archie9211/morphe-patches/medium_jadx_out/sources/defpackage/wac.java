package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lwac;", "Lque;", "ds2", "sac", "qac", "lac", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class wac extends que {
    public static final /* synthetic */ fj6[] p = {n1b.a.e(new c78(wac.class, "email", "getEmail()Landroidx/compose/ui/text/input/TextFieldValue;", 0))};
    public final String b;
    public final String c;
    public final SusiDestination d;
    public final boolean e;
    public final a13 f;
    public final dzb g;
    public final qlb h;
    public final String i;
    public final String j;
    public final SusiOperation k;
    public final wua l;
    public final r6c m;
    public final uua n;
    public final r6c o;

    public wac(kb2 kb2Var, a13 a13Var, vob vobVar, dzb dzbVar, SusiDestination susiDestination, String str, String str2, boolean z) {
        str.getClass();
        str2.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = str2;
        this.d = susiDestination;
        this.e = z;
        this.f = a13Var;
        this.g = dzbVar;
        i5b i5bVar = new i5b(25, this);
        fj6 fj6Var = p[0];
        StringBuilder sb = new StringBuilder(n1b.a.b(wac.class).d() + '.');
        sb.append(fj6Var.getName());
        this.h = new qlb(to7.r(vobVar, sb.toString(), uid.d, i5bVar));
        this.i = "susi_email_form";
        String strU = gp7.u(new SourceParameter("susi_email_form", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null));
        this.j = strU;
        this.k = SusiOperation.LOGIN;
        this.l = bo.e0(w2g.r(new u50(12, new eub(this, (n92) null, 13)), kb2Var), f76.F(this), l7c.b, new sac(e(), null, true, strU, susiDestination));
        r6c r6cVarX = k40.x(0, 7, null);
        this.m = r6cVarX;
        this.n = bo.z(r6cVarX);
        this.o = k40.x(0, 7, null);
    }

    public final uid e() {
        fj6 fj6Var = p[0];
        return (uid) ((l78) this.h.a).getValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00a6 A[PHI: r1 r3
      0x00a6: PHI (r1v8 int) = (r1v7 int), (r1v9 int) binds: [B:36:0x00a2, B:26:0x0056] A[DONT_GENERATE, DONT_INLINE]
      0x00a6: PHI (r3v4 java.lang.Object) = (r3v2 java.lang.Object), (r3v6 java.lang.Object) binds: [B:36:0x00a2, B:26:0x0056] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00bb A[PHI: r1 r3
      0x00bb: PHI (r1v10 int) = (r1v8 int), (r1v25 int) binds: [B:39:0x00b7, B:25:0x004e] A[DONT_GENERATE, DONT_INLINE]
      0x00bb: PHI (r3v7 wyb) = (r3v5 wyb), (r3v12 wyb) binds: [B:39:0x00b7, B:25:0x004e] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0121  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0188 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(defpackage.p92 r26) {
        /*
            Method dump skipped, instruction units count: 422
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wac.f(p92):java.lang.Object");
    }
}
