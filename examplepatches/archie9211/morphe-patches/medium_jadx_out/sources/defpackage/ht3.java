package defpackage;

import android.net.Uri;
import com.medium.android.core.navigation.EditPostReference;
import gen.model.SourceParameter;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0001\u0018\u00002\u00020\u0001:\u0005\u0002\u0003\u0004\u0005\u0006¨\u0006\u0007"}, d2 = {"Lht3;", "Lque;", "ps3", "is3", "as3", "vr3", "sp2", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ht3 extends que {
    public final xpc A;
    public final wua B;
    public final r6c C;
    public final String b;
    public final EditPostReference c;
    public final mya d;
    public final my6 e;
    public final cw3 f;
    public final ty2 g;
    public final hx4 h;
    public final boolean i;
    public final vob j;
    public final tg1 k;
    public final n0c l;
    public final ax2 m;
    public final ax2 n;
    public final o98 o;
    public final qf2 p;
    public final r6c q;
    public final uua r;
    public final LinkedHashSet s;
    public final LinkedHashMap t;
    public final String u;
    public SourceParameter v;
    public boolean w;
    public xq3 x;
    public final md5 y;
    public final wua z;

    public ht3(String str, EditPostReference editPostReference, mya myaVar, my6 my6Var, cw3 cw3Var, ty2 ty2Var, hx4 hx4Var, kb2 kb2Var, vob vobVar, tg1 tg1Var, n0c n0cVar, ax2 ax2Var, ax2 ax2Var2, o98 o98Var, qf2 qf2Var) {
        str.getClass();
        editPostReference.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = editPostReference;
        this.d = myaVar;
        this.e = my6Var;
        this.f = cw3Var;
        this.g = ty2Var;
        this.h = hx4Var;
        this.i = true;
        this.j = vobVar;
        this.k = tg1Var;
        this.l = n0cVar;
        this.m = ax2Var;
        this.n = ax2Var2;
        this.o = o98Var;
        this.p = qf2Var;
        r6c r6cVarX = k40.x(0, 7, null);
        this.q = r6cVarX;
        this.r = bo.z(r6cVarX);
        this.s = new LinkedHashSet();
        this.t = new LinkedHashMap();
        this.u = "editor";
        this.v = new SourceParameter("editor", null, null, null, null, g(), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -34, 8191, null);
        this.y = new md5(15, this);
        this.z = bo.e0(w2g.r(new u50(12, new gt3(this, null)), kb2Var), f76.F(this), l7c.b, os3.a);
        xpc xpcVarJ = vv2.j(null);
        this.A = xpcVarJ;
        this.B = bo.A(xpcVarJ);
        this.C = k40.x(0, 7, null);
        i(g());
    }

    @Override // defpackage.que
    public final void d() {
        i(null);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.Serializable e(java.lang.String r11, defpackage.p92 r12) {
        /*
            r10 = this;
            boolean r0 = r12 instanceof defpackage.qs3
            if (r0 == 0) goto L13
            r0 = r12
            qs3 r0 = (defpackage.qs3) r0
            int r1 = r0.g
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.g = r1
            goto L18
        L13:
            qs3 r0 = new qs3
            r0.<init>(r10, r12)
        L18:
            java.lang.Object r12 = r0.e
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.g
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L3b
            if (r2 == r4) goto L33
            if (r2 != r3) goto L2d
            java.lang.Object r10 = r0.c
            defpackage.br7.v(r12)     // Catch: java.lang.Throwable -> L8e
            goto L81
        L2d:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            return r5
        L33:
            int r10 = r0.d
            o33 r11 = r0.b
            defpackage.br7.v(r12)     // Catch: java.lang.Throwable -> L8e
            goto L68
        L3b:
            defpackage.br7.v(r12)
            gp1 r12 = defpackage.f76.F(r10)
            ss3 r2 = new ss3
            r2.<init>(r10, r11, r5)
            r6 = 3
            o33 r12 = defpackage.vx0.G(r12, r5, r2, r6)
            gp1 r2 = defpackage.f76.F(r10)
            rs3 r7 = new rs3
            r8 = 0
            r7.<init>(r10, r11, r5, r8)
            o33 r11 = defpackage.vx0.G(r2, r5, r7, r6)
            r0.b = r11     // Catch: java.lang.Throwable -> L8e
            r0.d = r8     // Catch: java.lang.Throwable -> L8e
            r0.g = r4     // Catch: java.lang.Throwable -> L8e
            java.lang.Object r12 = r12.i(r0)     // Catch: java.lang.Throwable -> L8e
            if (r12 != r1) goto L67
            goto L7d
        L67:
            r10 = r8
        L68:
            bjb r12 = (defpackage.bjb) r12     // Catch: java.lang.Throwable -> L8e
            java.lang.Object r12 = r12.a     // Catch: java.lang.Throwable -> L8e
            defpackage.br7.v(r12)     // Catch: java.lang.Throwable -> L8e
            r0.b = r5     // Catch: java.lang.Throwable -> L8e
            r0.c = r12     // Catch: java.lang.Throwable -> L8e
            r0.d = r10     // Catch: java.lang.Throwable -> L8e
            r0.g = r3     // Catch: java.lang.Throwable -> L8e
            java.lang.Object r10 = r11.p0(r0)     // Catch: java.lang.Throwable -> L8e
            if (r10 != r1) goto L7e
        L7d:
            return r1
        L7e:
            r9 = r12
            r12 = r10
            r10 = r9
        L81:
            bjb r12 = (defpackage.bjb) r12     // Catch: java.lang.Throwable -> L8e
            java.lang.Object r11 = r12.a     // Catch: java.lang.Throwable -> L8e
            defpackage.br7.v(r11)     // Catch: java.lang.Throwable -> L8e
            f09 r12 = new f09     // Catch: java.lang.Throwable -> L8e
            r12.<init>(r10, r11)     // Catch: java.lang.Throwable -> L8e
            return r12
        L8e:
            r10 = move-exception
            ajb r11 = new ajb
            r11.<init>(r10)
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ht3.e(java.lang.String, p92):java.io.Serializable");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(java.lang.String r5, defpackage.n92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.ts3
            if (r0 == 0) goto L13
            r0 = r6
            ts3 r0 = (defpackage.ts3) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ts3 r0 = new ts3
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            defpackage.br7.v(r6)
            bjb r6 = (defpackage.bjb) r6
            java.lang.Object r4 = r6.a
            return r4
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r6)
            r0.d = r3
            cw3 r4 = r4.f
            r6 = 20
            java.lang.Object r4 = r4.i(r5, r6, r0)
            if (r4 != r1) goto L42
            return r1
        L42:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ht3.f(java.lang.String, n92):java.lang.Object");
    }

    public final String g() {
        EditPostReference editPostReference = this.c;
        if (editPostReference instanceof EditPostReference.ExistingPost) {
            return ((EditPostReference.ExistingPost) editPostReference).getPostId();
        }
        String str = (String) this.j.a("post_id");
        if (str != null) {
            return str;
        }
        xq3 xq3Var = this.x;
        if (xq3Var != null) {
            return ((ak3) xq3Var.c).d;
        }
        return null;
    }

    public final void h() {
        this.A.l(null);
    }

    public final void i(String str) {
        if (this.i) {
            ak4 ak4VarA = ak4.a();
            if (str == null) {
                str = "";
            }
            ak4VarA.c("editor_post_id", str);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00ab A[Catch: Exception -> 0x0081, TRY_LEAVE, TryCatch #2 {Exception -> 0x0081, blocks: (B:28:0x007d, B:38:0x00ab, B:82:0x01b9, B:83:0x01c0, B:33:0x0089), top: B:88:0x0029 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00f7 A[PHI: r1 r6 r7 r8
      0x00f7: PHI (r1v19 java.lang.Object) = (r1v18 java.lang.Object), (r1v1 java.lang.Object) binds: [B:48:0x00f3, B:19:0x0052] A[DONT_GENERATE, DONT_INLINE]
      0x00f7: PHI (r6v12 v09) = (r6v10 v09), (r6v13 v09) binds: [B:48:0x00f3, B:19:0x0052] A[DONT_GENERATE, DONT_INLINE]
      0x00f7: PHI (r7v6 java.lang.String) = (r7v4 java.lang.String), (r7v7 java.lang.String) binds: [B:48:0x00f3, B:19:0x0052] A[DONT_GENERATE, DONT_INLINE]
      0x00f7: PHI (r8v9 android.net.Uri) = (r8v7 android.net.Uri), (r8v10 android.net.Uri) binds: [B:48:0x00f3, B:19:0x0052] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00f9 A[Catch: Exception -> 0x0049, TryCatch #0 {Exception -> 0x0049, blocks: (B:14:0x0044, B:56:0x0146, B:58:0x014a, B:60:0x0150, B:62:0x0154, B:65:0x015b, B:68:0x0164, B:70:0x016e, B:19:0x0052, B:51:0x00f9, B:53:0x0100, B:72:0x0184, B:73:0x018b, B:74:0x018c, B:75:0x0193, B:22:0x005d, B:47:0x00e2), top: B:88:0x0029 }] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x014a A[Catch: Exception -> 0x0049, TryCatch #0 {Exception -> 0x0049, blocks: (B:14:0x0044, B:56:0x0146, B:58:0x014a, B:60:0x0150, B:62:0x0154, B:65:0x015b, B:68:0x0164, B:70:0x016e, B:19:0x0052, B:51:0x00f9, B:53:0x0100, B:72:0x0184, B:73:0x018b, B:74:0x018c, B:75:0x0193, B:22:0x005d, B:47:0x00e2), top: B:88:0x0029 }] */
    /* JADX WARN: Removed duplicated region for block: B:59:0x014f  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0154 A[Catch: Exception -> 0x0049, TryCatch #0 {Exception -> 0x0049, blocks: (B:14:0x0044, B:56:0x0146, B:58:0x014a, B:60:0x0150, B:62:0x0154, B:65:0x015b, B:68:0x0164, B:70:0x016e, B:19:0x0052, B:51:0x00f9, B:53:0x0100, B:72:0x0184, B:73:0x018b, B:74:0x018c, B:75:0x0193, B:22:0x005d, B:47:0x00e2), top: B:88:0x0029 }] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0158  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x015b A[Catch: Exception -> 0x0049, TryCatch #0 {Exception -> 0x0049, blocks: (B:14:0x0044, B:56:0x0146, B:58:0x014a, B:60:0x0150, B:62:0x0154, B:65:0x015b, B:68:0x0164, B:70:0x016e, B:19:0x0052, B:51:0x00f9, B:53:0x0100, B:72:0x0184, B:73:0x018b, B:74:0x018c, B:75:0x0193, B:22:0x005d, B:47:0x00e2), top: B:88:0x0029 }] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0160  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0164 A[Catch: Exception -> 0x0049, TryCatch #0 {Exception -> 0x0049, blocks: (B:14:0x0044, B:56:0x0146, B:58:0x014a, B:60:0x0150, B:62:0x0154, B:65:0x015b, B:68:0x0164, B:70:0x016e, B:19:0x0052, B:51:0x00f9, B:53:0x0100, B:72:0x0184, B:73:0x018b, B:74:0x018c, B:75:0x0193, B:22:0x005d, B:47:0x00e2), top: B:88:0x0029 }] */
    /* JADX WARN: Removed duplicated region for block: B:69:0x016d  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x018c A[Catch: Exception -> 0x0049, TryCatch #0 {Exception -> 0x0049, blocks: (B:14:0x0044, B:56:0x0146, B:58:0x014a, B:60:0x0150, B:62:0x0154, B:65:0x015b, B:68:0x0164, B:70:0x016e, B:19:0x0052, B:51:0x00f9, B:53:0x0100, B:72:0x0184, B:73:0x018b, B:74:0x018c, B:75:0x0193, B:22:0x005d, B:47:0x00e2), top: B:88:0x0029 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x01b9 A[Catch: Exception -> 0x0081, TRY_ENTER, TryCatch #2 {Exception -> 0x0081, blocks: (B:28:0x007d, B:38:0x00ab, B:82:0x01b9, B:83:0x01c0, B:33:0x0089), top: B:88:0x0029 }] */
    /* JADX WARN: Type inference failed for: r7v0, types: [java.lang.Object, mya] */
    /* JADX WARN: Type inference failed for: r7v2 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object j(android.net.Uri r31, java.lang.String r32, defpackage.p92 r33) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 492
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ht3.j(android.net.Uri, java.lang.String, p92):java.lang.Object");
    }

    public final void l(Uri uri) {
        uri.getClass();
        String strA = this.o.a();
        enc encVarC0 = vx0.c0(f76.F(this), null, null, new at3(this, uri, strA, null, 1), 3);
        encVarC0.R(new sr3(this, strA, 1));
        this.t.put(strA, encVarC0);
    }

    /* JADX WARN: Can't wrap try/catch for region: R(10:0|2|(2:4|(1:6)(1:7))(0)|8|93|(1:(1:(1:(1:(1:(8:15|74|(1:76)(1:77)|(1:79)(1:80)|(1:82)(1:83)|(1:85)|86|87)(2:16|17))(10:18|19|49|(1:51)(1:52)|53|(1:55)(1:56)|(1:58)(1:59)|(1:61)(1:62)|63|64))(3:23|24|(12:42|(1:44)(1:45)|46|(2:48|91)|49|(0)(0)|53|(0)(0)|(0)(0)|(0)(0)|63|64)(2:65|66)))(1:26))(2:27|28))(6:29|95|30|31|(1:34)|91)|94|35|(3:37|(2:40|(0)(0))|91)(2:69|70)|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x0166, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x0167, code lost:
    
        r6 = r2;
        r2 = r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x0172, code lost:
    
        r2 = new defpackage.gs3(new defpackage.t09(r6, r2), r0);
        r4.b = null;
        r4.c = null;
        r4.d = null;
        r4.g = 5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x0188, code lost:
    
        if (r14.a(r2, r4) != r5) goto L74;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00b5 A[Catch: Exception -> 0x0058, TRY_ENTER, TryCatch #0 {Exception -> 0x0058, blocks: (B:19:0x0053, B:49:0x011a, B:51:0x011e, B:53:0x0124, B:55:0x0128, B:58:0x0131, B:61:0x013a, B:63:0x0146, B:24:0x005f, B:42:0x00b5, B:44:0x00c5, B:46:0x0105, B:45:0x00fe, B:65:0x015e, B:66:0x0165), top: B:93:0x0032 }] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x011e A[Catch: Exception -> 0x0058, TryCatch #0 {Exception -> 0x0058, blocks: (B:19:0x0053, B:49:0x011a, B:51:0x011e, B:53:0x0124, B:55:0x0128, B:58:0x0131, B:61:0x013a, B:63:0x0146, B:24:0x005f, B:42:0x00b5, B:44:0x00c5, B:46:0x0105, B:45:0x00fe, B:65:0x015e, B:66:0x0165), top: B:93:0x0032 }] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0123  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0128 A[Catch: Exception -> 0x0058, TryCatch #0 {Exception -> 0x0058, blocks: (B:19:0x0053, B:49:0x011a, B:51:0x011e, B:53:0x0124, B:55:0x0128, B:58:0x0131, B:61:0x013a, B:63:0x0146, B:24:0x005f, B:42:0x00b5, B:44:0x00c5, B:46:0x0105, B:45:0x00fe, B:65:0x015e, B:66:0x0165), top: B:93:0x0032 }] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x012d  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0131 A[Catch: Exception -> 0x0058, TryCatch #0 {Exception -> 0x0058, blocks: (B:19:0x0053, B:49:0x011a, B:51:0x011e, B:53:0x0124, B:55:0x0128, B:58:0x0131, B:61:0x013a, B:63:0x0146, B:24:0x005f, B:42:0x00b5, B:44:0x00c5, B:46:0x0105, B:45:0x00fe, B:65:0x015e, B:66:0x0165), top: B:93:0x0032 }] */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0136  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x013a A[Catch: Exception -> 0x0058, TryCatch #0 {Exception -> 0x0058, blocks: (B:19:0x0053, B:49:0x011a, B:51:0x011e, B:53:0x0124, B:55:0x0128, B:58:0x0131, B:61:0x013a, B:63:0x0146, B:24:0x005f, B:42:0x00b5, B:44:0x00c5, B:46:0x0105, B:45:0x00fe, B:65:0x015e, B:66:0x0165), top: B:93:0x0032 }] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0144  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x015e A[Catch: Exception -> 0x0058, TryCatch #0 {Exception -> 0x0058, blocks: (B:19:0x0053, B:49:0x011a, B:51:0x011e, B:53:0x0124, B:55:0x0128, B:58:0x0131, B:61:0x013a, B:63:0x0146, B:24:0x005f, B:42:0x00b5, B:44:0x00c5, B:46:0x0105, B:45:0x00fe, B:65:0x015e, B:66:0x0165), top: B:93:0x0032 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /* JADX WARN: Type inference failed for: r6v0, types: [int] */
    /* JADX WARN: Type inference failed for: r6v3 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object k(com.medium.android.unsplash.data.UnsplashPhoto r33, java.lang.String r34, defpackage.p92 r35) {
        /*
            Method dump skipped, instruction units count: 502
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ht3.k(com.medium.android.unsplash.data.UnsplashPhoto, java.lang.String, p92):java.lang.Object");
    }
}
