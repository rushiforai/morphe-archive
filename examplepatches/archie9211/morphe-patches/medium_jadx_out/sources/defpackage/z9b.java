package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lz9b;", "Lque;", "wr2", "x9b", "s9b", "t9b", "repost_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class z9b extends que {
    public final String b;
    public final g08 c;
    public final String d;
    public final boolean e;
    public final gn9 f;
    public final fr9 g;
    public final hx4 h;
    public final y8b i;
    public final a1a j;
    public final boolean k;
    public final l78 l;
    public final xpc m;
    public final xpc n;
    public final r6c o;
    public final uua p;
    public final wua q;

    public z9b(String str, g08 g08Var, String str2, boolean z, gn9 gn9Var, fr9 fr9Var, hx4 hx4Var, y8b y8bVar, a1a a1aVar, kb2 kb2Var, vob vobVar) {
        str.getClass();
        g08Var.getClass();
        gn9Var.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = g08Var;
        this.d = str2;
        this.e = z;
        this.f = gn9Var;
        this.g = fr9Var;
        this.h = hx4Var;
        this.i = y8bVar;
        this.j = a1aVar;
        final int i = 1;
        final int i2 = 0;
        this.k = z || str2 != null;
        this.l = to7.r(vobVar, "note", uid.d, new m45(this) { // from class: k9b
            public final /* synthetic */ z9b b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                uid uidVar;
                int i3 = i2;
                z9b z9bVar = this.b;
                switch (i3) {
                    case 0:
                        String str3 = z9bVar.d;
                        if (str3 != null) {
                            int length = str3.length();
                            uidVar = new uid(str3, 4, lk7.q(length, length));
                        } else {
                            uidVar = new uid((String) null, 7, 0L);
                        }
                        return qo7.u(uidVar);
                    default:
                        return (uid) z9bVar.l.getValue();
                }
            }
        });
        xpc xpcVarJ = vv2.j(Boolean.FALSE);
        this.m = xpcVarJ;
        xpc xpcVarJ2 = vv2.j(0);
        this.n = xpcVarJ2;
        n92 n92Var = null;
        r6c r6cVarX = k40.x(0, 7, null);
        this.o = r6cVarX;
        this.p = bo.z(r6cVarX);
        this.q = bo.e0(k40.T(bo.e0(w2g.r(ip4.b(xpcVarJ2, new yk(12, n92Var, this)), kb2Var), f76.F(this), l7c.b, null), no7.E(new m45(this) { // from class: k9b
            public final /* synthetic */ z9b b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                uid uidVar;
                int i3 = i;
                z9b z9bVar = this.b;
                switch (i3) {
                    case 0:
                        String str3 = z9bVar.d;
                        if (str3 != null) {
                            int length = str3.length();
                            uidVar = new uid(str3, 4, lk7.q(length, length));
                        } else {
                            uidVar = new uid((String) null, 7, 0L);
                        }
                        return qo7.u(uidVar);
                    default:
                        return (uid) z9bVar.l.getValue();
                }
            }
        }), xpcVarJ, new mg7(2, n92Var, this)), f76.F(this), new ync(5000L, Long.MAX_VALUE), w9b.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0092 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(defpackage.p92 r20) {
        /*
            r19 = this;
            r0 = r19
            r1 = r20
            boolean r2 = r1 instanceof defpackage.y9b
            if (r2 == 0) goto L17
            r2 = r1
            y9b r2 = (defpackage.y9b) r2
            int r3 = r2.e
            r4 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = r3 & r4
            if (r5 == 0) goto L17
            int r3 = r3 - r4
            r2.e = r3
            goto L1c
        L17:
            y9b r2 = new y9b
            r2.<init>(r0, r1)
        L1c:
            java.lang.Object r1 = r2.c
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r2.e
            r5 = 0
            r6 = 2
            r7 = 1
            if (r4 == 0) goto L3f
            if (r4 == r7) goto L3b
            if (r4 != r6) goto L35
            rj2 r2 = r2.b
            defpackage.br7.v(r1)
            bjb r1 = (defpackage.bjb) r1
            java.lang.Object r1 = r1.a
            goto L65
        L35:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r5
        L3b:
            defpackage.br7.v(r1)
            goto L4d
        L3f:
            defpackage.br7.v(r1)
            r2.e = r7
            hx4 r1 = r0.h
            java.lang.Object r1 = r1.Y0(r2)
            if (r1 != r3) goto L4d
            goto L5f
        L4d:
            rj2 r1 = (defpackage.rj2) r1
            r2.b = r1
            r2.e = r6
            yd4 r4 = defpackage.yd4.CacheFirst
            gn9 r6 = r0.f
            java.lang.String r7 = r0.b
            java.lang.Object r2 = r6.j(r7, r4, r2)
            if (r2 != r3) goto L60
        L5f:
            return r3
        L60:
            r18 = r2
            r2 = r1
            r1 = r18
        L65:
            boolean r3 = r1 instanceof defpackage.ajb
            if (r3 != 0) goto L92
            r7 = r1
            com.medium.android.graphql.fragment.PostPreviewData r7 = (com.medium.android.graphql.fragment.PostPreviewData) r7
            if (r2 == 0) goto L71
            java.lang.String r1 = r2.b
            goto L72
        L71:
            r1 = r5
        L72:
            if (r2 == 0) goto L79
            java.lang.String r2 = r2.d
            if (r2 == 0) goto L79
            r5 = r2
        L79:
            r16 = 0
            r17 = -52
            fr9 r6 = r0.g
            g08 r8 = r0.c
            r9 = 0
            r10 = 0
            r11 = 0
            r12 = 0
            r13 = 0
            r14 = 0
            r15 = 0
            dr9 r0 = defpackage.fr9.a(r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17)
            t9b r2 = new t9b
            r2.<init>(r1, r5, r0)
            return r2
        L92:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z9b.e(p92):java.lang.Object");
    }
}
