package defpackage;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import com.medium.android.core.models.EntityType;
import com.medium.android.graphql.fragment.ParagraphData;
import com.medium.android.graphql.fragment.PostMetaData;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class nz extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public Object e;
    public Object f;
    public Object g;
    public Object h;
    public final /* synthetic */ Object i;
    public final /* synthetic */ Object j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nz(cz3 cz3Var, rx5 rx5Var, Object obj, ew8 ew8Var, z46 z46Var, cx7 cx7Var, i56 i56Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 4;
        this.e = cz3Var;
        this.f = rx5Var;
        this.d = obj;
        this.g = ew8Var;
        this.h = z46Var;
        this.i = cx7Var;
        this.j = i56Var;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0091, code lost:
    
        if (defpackage.r6c.m(r11, r6, r10) != r3) goto L23;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object i(java.lang.Object r11) {
        /*
            r10 = this;
            java.lang.Object r0 = r10.i
            java.lang.String r0 = (java.lang.String) r0
            java.lang.Object r1 = r10.h
            ts8 r1 = (defpackage.ts8) r1
            java.lang.Object r2 = r10.d
            do4 r2 = (defpackage.do4) r2
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r10.c
            r5 = 3
            r6 = 2
            r7 = 1
            r8 = 0
            if (r4 == 0) goto L43
            if (r4 == r7) goto L2f
            if (r4 == r6) goto L27
            if (r4 == r5) goto L22
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            return r8
        L22:
            defpackage.br7.v(r11)
            goto L94
        L27:
            java.lang.Object r4 = r10.f
            rya r4 = (defpackage.rya) r4
            defpackage.br7.v(r11)
            goto L80
        L2f:
            java.lang.Object r4 = r10.g
            ts8 r4 = (defpackage.ts8) r4
            java.lang.Object r7 = r10.e
            rya r7 = (defpackage.rya) r7
            java.lang.Object r9 = r10.f
            rya r9 = (defpackage.rya) r9
            defpackage.br7.v(r11)
            bjb r11 = (defpackage.bjb) r11
            java.lang.Object r11 = r11.a
            goto L63
        L43:
            rya r11 = defpackage.ev6.p(r11)
            hs8 r4 = r1.a
            java.lang.Object r9 = r10.j
            yd4 r9 = (defpackage.yd4) r9
            r10.d = r2
            r10.f = r11
            r10.e = r11
            r10.g = r1
            r10.c = r7
            r7 = 5
            java.lang.Object r4 = r4.c(r7, r10, r9, r0)
            if (r4 != r3) goto L5f
            goto L93
        L5f:
            r7 = r11
            r9 = r7
            r11 = r4
            r4 = r1
        L63:
            r4.getClass()
            os8 r11 = defpackage.ts8.a(r11)
            r7.a = r11
            java.lang.Object r11 = r9.a
            r10.d = r2
            r10.f = r9
            r10.e = r8
            r10.g = r8
            r10.c = r6
            java.lang.Object r11 = r2.a(r11, r10)
            if (r11 != r3) goto L7f
            goto L93
        L7f:
            r4 = r9
        L80:
            r6c r11 = r1.c
            ss8 r6 = new ss8
            r6.<init>(r2, r4, r1, r0)
            r10.d = r8
            r10.f = r8
            r10.c = r5
            tb2 r10 = defpackage.r6c.m(r11, r6, r10)
            if (r10 != r3) goto L94
        L93:
            return r3
        L94:
            defpackage.z72.b()
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nz.i(java.lang.Object):java.lang.Object");
    }

    private final Object n(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            sw9 sw9Var = (sw9) this.d;
            uua uuaVar = sw9Var.y0;
            lz lzVar = new lz((nhc) this.e, (sb2) this.f, (fj9) this.g, (Context) this.h, (l78) this.i, sw9Var, (kv6) this.j, 3);
            this.c = 1;
            if (uuaVar.a.b(lzVar, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x00e6, code lost:
    
        if (r13.a(r2, r18) == r14) goto L29;
     */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00d4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object r(java.lang.Object r19) {
        /*
            Method dump skipped, instruction units count: 243
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nz.r(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x00ae, code lost:
    
        if (r8.a(r1, r13) == r9) goto L25;
     */
    /* JADX WARN: Removed duplicated region for block: B:23:0x009b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object u(java.lang.Object r13) {
        /*
            r12 = this;
            java.lang.Object r0 = r12.j
            r6 = r0
            java.lang.String r6 = (java.lang.String) r6
            java.lang.Object r0 = r12.e
            sw9 r0 = (defpackage.sw9) r0
            r6c r8 = r0.x0
            tb2 r9 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r12.c
            java.lang.Object r7 = r12.i
            r10 = 3
            r11 = 2
            r2 = 1
            if (r1 == 0) goto L39
            if (r1 == r2) goto L2f
            if (r1 == r11) goto L28
            if (r1 != r10) goto L21
            defpackage.br7.v(r13)
            goto Lb1
        L21:
            java.lang.String r12 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r12)
            r12 = 0
            return r12
        L28:
            java.lang.Object r0 = r12.d
            defpackage.br7.v(r13)
            r13 = r12
            goto L83
        L2f:
            defpackage.br7.v(r13)
            bjb r13 = (defpackage.bjb) r13
            java.lang.Object r13 = r13.a
            r0 = r13
            r13 = r12
            goto L5a
        L39:
            defpackage.br7.v(r13)
            eoc r0 = r0.z
            java.lang.Object r13 = r12.f
            r3 = r13
            java.lang.String r3 = (java.lang.String) r3
            java.lang.Object r13 = r12.g
            r4 = r13
            java.lang.String r4 = (java.lang.String) r4
            java.lang.Object r13 = r12.h
            com.medium.android.core.models.EntityType r13 = (com.medium.android.core.models.EntityType) r13
            r12.c = r2
            r5 = 0
            r1 = r12
            r2 = r13
            java.lang.Object r12 = r0.d(r1, r2, r3, r4, r5)
            r13 = r1
            if (r12 != r9) goto L59
            goto Lb0
        L59:
            r0 = r12
        L5a:
            r2 = r7
            java.lang.String r2 = (java.lang.String) r2
            java.lang.Object r12 = r13.h
            r3 = r12
            com.medium.android.core.models.EntityType r3 = (com.medium.android.core.models.EntityType) r3
            java.lang.Object r12 = r13.g
            r4 = r12
            java.lang.String r4 = (java.lang.String) r4
            java.lang.Object r12 = r13.f
            r5 = r12
            java.lang.String r5 = (java.lang.String) r5
            boolean r12 = r0 instanceof defpackage.ajb
            if (r12 != 0) goto L83
            r12 = r0
            c1e r12 = (defpackage.c1e) r12
            nu9 r1 = new nu9
            r1.<init>(r2, r3, r4, r5, r6)
            r13.d = r0
            r13.c = r11
            java.lang.Object r12 = r8.a(r1, r13)
            if (r12 != r9) goto L83
            goto Lb0
        L83:
            r2 = r7
            java.lang.String r2 = (java.lang.String) r2
            java.lang.Object r12 = r13.h
            r3 = r12
            com.medium.android.core.models.EntityType r3 = (com.medium.android.core.models.EntityType) r3
            java.lang.Object r12 = r13.g
            r4 = r12
            java.lang.String r4 = (java.lang.String) r4
            java.lang.Object r12 = r13.f
            r5 = r12
            java.lang.String r5 = (java.lang.String) r5
            java.lang.Throwable r12 = defpackage.bjb.b(r0)
            if (r12 == 0) goto Lb1
            b24 r12 = defpackage.m4.I(r12)
            mu9 r1 = new mu9
            r7 = r6
            r6 = r12
            r1.<init>(r2, r3, r4, r5, r6, r7)
            r13.d = r0
            r13.c = r10
            java.lang.Object r12 = r8.a(r1, r13)
            if (r12 != r9) goto Lb1
        Lb0:
            return r9
        Lb1:
            c1e r12 = defpackage.c1e.a
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nz.u(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x00f9, code lost:
    
        if (defpackage.r6c.m(r15, r1, r14) == r0) goto L35;
     */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00db A[PHI: r1 r3 r4
      0x00db: PHI (r1v8 nya) = (r1v5 nya), (r1v10 nya) binds: [B:27:0x00bf, B:32:0x00da] A[DONT_GENERATE, DONT_INLINE]
      0x00db: PHI (r3v7 rya) = (r3v4 rya), (r3v8 rya) binds: [B:27:0x00bf, B:32:0x00da] A[DONT_GENERATE, DONT_INLINE]
      0x00db: PHI (r4v6 nya) = (r4v4 nya), (r4v7 nya) binds: [B:27:0x00bf, B:32:0x00da] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object v(java.lang.Object r15) {
        /*
            Method dump skipped, instruction units count: 256
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nz.v(java.lang.Object):java.lang.Object");
    }

    private final Object w(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            uua uuaVar = ((j2d) this.d).x;
            k64 k64Var = new k64((nhc) this.e, (sb2) this.f, (Resources) this.g, (p1d) this.h, (s1d) this.i, (r1d) this.j, 3);
            this.c = 1;
            if (uuaVar.a.b(k64Var, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        z72.b();
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x008d, code lost:
    
        if (r6.a(r7, r10) == r2) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:20:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0069 A[Catch: all -> 0x0022, TRY_LEAVE, TryCatch #0 {all -> 0x0022, blocks: (B:7:0x001c, B:18:0x0050, B:22:0x0061, B:24:0x0069, B:14:0x0034, B:17:0x0047), top: B:31:0x000e }] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0090  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x008d -> B:8:0x001f). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object x(java.lang.Object r11) {
        /*
            r10 = this;
            java.lang.Object r0 = r10.h
            s5f r0 = (defpackage.s5f) r0
            java.lang.Object r1 = r10.f
            android.content.ContentResolver r1 = (android.content.ContentResolver) r1
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r10.c
            r4 = 2
            r5 = 1
            if (r3 == 0) goto L38
            if (r3 == r5) goto L2c
            if (r3 != r4) goto L25
            java.lang.Object r3 = r10.e
            pz0 r3 = (defpackage.pz0) r3
            java.lang.Object r6 = r10.d
            do4 r6 = (defpackage.do4) r6
            defpackage.br7.v(r11)     // Catch: java.lang.Throwable -> L22
        L1f:
            r11 = r6
            r6 = r3
            goto L50
        L22:
            r10 = move-exception
            goto L96
        L25:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            r10 = 0
            return r10
        L2c:
            java.lang.Object r3 = r10.e
            pz0 r3 = (defpackage.pz0) r3
            java.lang.Object r6 = r10.d
            do4 r6 = (defpackage.do4) r6
            defpackage.br7.v(r11)     // Catch: java.lang.Throwable -> L22
            goto L61
        L38:
            defpackage.br7.v(r11)
            java.lang.Object r11 = r10.d
            do4 r11 = (defpackage.do4) r11
            java.lang.Object r3 = r10.g
            android.net.Uri r3 = (android.net.Uri) r3
            r6 = 0
            r1.registerContentObserver(r3, r6, r0)
            java.lang.Object r3 = r10.i     // Catch: java.lang.Throwable -> L22
            uz0 r3 = (defpackage.uz0) r3     // Catch: java.lang.Throwable -> L22
            pz0 r6 = new pz0     // Catch: java.lang.Throwable -> L22
            r6.<init>(r3)     // Catch: java.lang.Throwable -> L22
        L50:
            r10.d = r11     // Catch: java.lang.Throwable -> L22
            r10.e = r6     // Catch: java.lang.Throwable -> L22
            r10.c = r5     // Catch: java.lang.Throwable -> L22
            java.lang.Object r3 = r6.b(r10)     // Catch: java.lang.Throwable -> L22
            if (r3 != r2) goto L5d
            goto L8f
        L5d:
            r9 = r6
            r6 = r11
            r11 = r3
            r3 = r9
        L61:
            java.lang.Boolean r11 = (java.lang.Boolean) r11     // Catch: java.lang.Throwable -> L22
            boolean r11 = r11.booleanValue()     // Catch: java.lang.Throwable -> L22
            if (r11 == 0) goto L90
            r3.c()     // Catch: java.lang.Throwable -> L22
            java.lang.Object r11 = r10.j     // Catch: java.lang.Throwable -> L22
            android.content.Context r11 = (android.content.Context) r11     // Catch: java.lang.Throwable -> L22
            f78 r7 = defpackage.t5f.a     // Catch: java.lang.Throwable -> L22
            android.content.ContentResolver r11 = r11.getContentResolver()     // Catch: java.lang.Throwable -> L22
            java.lang.String r7 = "animator_duration_scale"
            r8 = 1065353216(0x3f800000, float:1.0)
            float r11 = android.provider.Settings.Global.getFloat(r11, r7, r8)     // Catch: java.lang.Throwable -> L22
            java.lang.Float r7 = new java.lang.Float     // Catch: java.lang.Throwable -> L22
            r7.<init>(r11)     // Catch: java.lang.Throwable -> L22
            r10.d = r6     // Catch: java.lang.Throwable -> L22
            r10.e = r3     // Catch: java.lang.Throwable -> L22
            r10.c = r4     // Catch: java.lang.Throwable -> L22
            java.lang.Object r11 = r6.a(r7, r10)     // Catch: java.lang.Throwable -> L22
            if (r11 != r2) goto L1f
        L8f:
            return r2
        L90:
            r1.unregisterContentObserver(r0)
            c1e r10 = defpackage.c1e.a
            return r10
        L96:
            r1.unregisterContentObserver(r0)
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nz.x(java.lang.Object):java.lang.Object");
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.j;
        Object obj3 = this.i;
        switch (i) {
            case 0:
                nz nzVar = new nz((h00) this.g, (sz) this.h, (yl2) obj3, (ad) obj2, n92Var);
                nzVar.e = obj;
                return nzVar;
            case 1:
                return new nz((id1) this.d, (nhc) this.e, (sb2) this.f, (Context) this.g, (z81) this.h, (Resources) obj3, (v91) obj2, n92Var, 1);
            case 2:
                return new nz((qm1) this.d, (h49) this.e, (l78) this.f, (l78) this.g, (h49) this.h, (h49) obj3, (i49) obj2, n92Var, 2);
            case 3:
                return new nz((cz3) this.e, (rya) this.f, (rya) this.g, (rx5) this.h, this.d, (rya) obj3, (z46) obj2, n92Var);
            case 4:
                return new nz((cz3) this.e, (rx5) this.f, this.d, (ew8) this.g, (z46) this.h, (cx7) obj3, (i56) obj2, n92Var);
            case 5:
                return new nz((f74) this.d, (nhc) this.e, (sb2) this.f, (Resources) this.g, (md3) this.h, (s26) obj3, (lig) obj2, n92Var, 5);
            case 6:
                nz nzVar2 = new nz((List) this.f, (List) this.g, (ku3) this.h, (String) obj3, (String) obj2, n92Var, 6);
                nzVar2.d = obj;
                return nzVar2;
            case 7:
                return new nz((sza) this.d, (nhc) this.e, (sb2) this.f, (Resources) this.g, (yx4) this.h, (cy4) obj3, (by4) obj2, n92Var, 7);
            case 8:
                nz nzVar3 = new nz((s78) this.h, (i66) obj3, (x45) obj2, n92Var, 8);
                nzVar3.e = obj;
                return nzVar3;
            case 9:
                nz nzVar4 = new nz((s78) this.h, (j66) obj3, (x45) obj2, n92Var, 9);
                nzVar4.e = obj;
                return nzVar4;
            case 10:
                nz nzVar5 = new nz((s78) this.h, (z78) obj3, (x45) obj2, n92Var, 10);
                nzVar5.e = obj;
                return nzVar5;
            case 11:
                nz nzVar6 = new nz((t78) this.h, (a88) obj3, (x45) obj2, n92Var, 11);
                nzVar6.e = obj;
                return nzVar6;
            case 12:
                nz nzVar7 = new nz((ts8) this.h, (String) obj3, (yd4) obj2, n92Var, 12);
                nzVar7.d = obj;
                return nzVar7;
            case 13:
                return new nz((ou9) this.d, (nhc) this.e, (fj9) this.f, (Context) this.g, (l78) this.h, (sw9) obj3, (kv6) obj2, n92Var, 13);
            case 14:
                return new nz((sw9) this.d, (nhc) this.e, (sb2) this.f, (fj9) this.g, (Context) this.h, (l78) obj3, (kv6) obj2, n92Var, 14);
            case 15:
                return new nz((sw9) this.e, (PostMetaData) this.f, (qxb) this.g, (ParagraphData) this.h, (n39) obj3, (m45) obj2, n92Var, 15);
            case 16:
                return new nz((sw9) this.e, (String) this.f, (String) this.g, (EntityType) this.h, (String) obj3, (String) obj2, n92Var, 16);
            case 17:
                nz nzVar8 = new nz((b55) obj3, (o2b) obj2, n92Var);
                nzVar8.e = obj;
                return nzVar8;
            case 18:
                return new nz((j2d) this.d, (nhc) this.e, (sb2) this.f, (Resources) this.g, (p1d) this.h, (s1d) obj3, (r1d) obj2, n92Var, 18);
            case 19:
                nz nzVar9 = new nz((ContentResolver) this.f, (Uri) this.g, (s5f) this.h, (uz0) obj3, (Context) obj2, n92Var, 19);
                nzVar9.d = obj;
                return nzVar9;
            default:
                nz nzVar10 = new nz((ksf) this.f, (bh4) this.g, (arf) this.h, (String) obj3, (jrf) obj2, n92Var, 20);
                nzVar10.d = obj;
                return nzVar10;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((nz) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 4:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 5:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 6:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 7:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 8:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 9:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 10:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 11:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 12:
                return ((nz) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 13:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 14:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 15:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 16:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 17:
                return ((nz) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 18:
                return ((nz) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 19:
                return ((nz) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((nz) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:321:0x05d3, code lost:
    
        if (r0.p0(r5) == r1) goto L322;
     */
    /* JADX WARN: Code restructure failed: missing block: B:458:0x093f, code lost:
    
        if (r0.b((java.util.Set) r1, r5) != r6) goto L422;
     */
    /* JADX WARN: Removed duplicated region for block: B:402:0x07a6  */
    /* JADX WARN: Removed duplicated region for block: B:441:0x0900  */
    /* JADX WARN: Removed duplicated region for block: B:444:0x0905  */
    /* JADX WARN: Removed duplicated region for block: B:447:0x090b  */
    /* JADX WARN: Removed duplicated region for block: B:522:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:524:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r2v108, types: [int, y88] */
    /* JADX WARN: Type inference failed for: r2v123, types: [int, y88] */
    /* JADX WARN: Type inference failed for: r2v74, types: [int, y88] */
    /* JADX WARN: Type inference failed for: r2v91, types: [int, y88] */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    jadx.core.utils.exceptions.JadxRuntimeException: Not class type: int
    	at jadx.core.dex.info.ClassInfo.checkClassType(ClassInfo.java:59)
    	at jadx.core.dex.info.ClassInfo.fromType(ClassInfo.java:32)
    	at jadx.core.dex.nodes.RootNode.resolveClass(RootNode.java:508)
    	at jadx.core.dex.nodes.utils.TypeUtils.getClassTypeVars(TypeUtils.java:53)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:175)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r24) throws com.google.android.recaptcha.internal.zzfx {
        /*
            Method dump skipped, instruction units count: 2416
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nz.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    private final Object o(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            ou9 ou9Var = (ou9) this.d;
            nhc nhcVar = (nhc) this.e;
            fj9 fj9Var = (fj9) this.f;
            Context context = (Context) this.g;
            l78 l78Var = (l78) this.h;
            md3 md3Var = ((sw9) this.i).b1;
            kv6 kv6Var = (kv6) this.j;
            this.c = 1;
            if (jj9.f(ou9Var, nhcVar, fj9Var, context, l78Var, md3Var, kv6Var, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f(QFTsJPDEnO.kYjySMyyhSvLG);
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nz(h00 h00Var, sz szVar, yl2 yl2Var, ad adVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 0;
        this.g = h00Var;
        this.h = szVar;
        this.i = yl2Var;
        this.j = adVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nz(cz3 cz3Var, rya ryaVar, rya ryaVar2, rx5 rx5Var, Object obj, rya ryaVar3, z46 z46Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 3;
        this.e = cz3Var;
        this.f = ryaVar;
        this.g = ryaVar2;
        this.h = rx5Var;
        this.d = obj;
        this.i = ryaVar3;
        this.j = z46Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nz(b55 b55Var, o2b o2bVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 17;
        this.i = b55Var;
        this.j = o2bVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ nz(sw9 sw9Var, Object obj, Object obj2, Object obj3, Object obj4, Object obj5, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = sw9Var;
        this.f = obj;
        this.g = obj2;
        this.h = obj3;
        this.i = obj4;
        this.j = obj5;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ nz(Object obj, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.h = obj;
        this.i = obj2;
        this.j = obj3;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ nz(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.g = obj2;
        this.h = obj3;
        this.i = obj4;
        this.j = obj5;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ nz(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.e = obj2;
        this.f = obj3;
        this.g = obj4;
        this.h = obj5;
        this.i = obj6;
        this.j = obj7;
    }
}
