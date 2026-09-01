package defpackage;

import android.content.res.Resources;
import com.medium.android.core.models.EntityType;
import com.medium.android.graphql.fragment.ParagraphData;
import com.medium.android.graphql.fragment.PostMetaData;
import com.medium.android.graphql.type.PostType;
import gen.model.SourceParameter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yu extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ Object d;
    public Object e;
    public Object f;
    public Object g;
    public Object h;
    public final /* synthetic */ Object i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yu(y7b y7bVar, ac7 ac7Var, ac7 ac7Var2, ub7 ub7Var, ic7 ic7Var, l78 l78Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 1;
        this.e = y7bVar;
        this.f = ac7Var;
        this.g = ac7Var2;
        this.h = ub7Var;
        this.i = ic7Var;
        this.d = l78Var;
    }

    private final Object A(Object obj) {
        xbg xbgVar;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        c1e c1eVar = c1e.a;
        if (i == 0) {
            br7.v(obj);
            xbgVar = (xbg) this.f;
            nig nigVar = (nig) this.g;
            String str = (String) this.h;
            String str2 = (String) this.d;
            ms msVar = (ms) this.i;
            this.e = xbgVar;
            this.c = 1;
            obj = new ycg(new yu4(nigVar, str, msVar, str2, null));
            if (obj != tb2Var) {
            }
        }
        if (i != 1) {
            br7.v(obj);
            return c1eVar;
        }
        xbgVar = (xbg) this.e;
        br7.v(obj);
        this.e = null;
        this.c = 2;
        Object objInvoke = ((ycg) obj).a.invoke(xbgVar.a, this);
        if (objInvoke != tb2Var) {
            objInvoke = c1eVar;
        }
        return objInvoke == tb2Var ? tb2Var : c1eVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0050, code lost:
    
        if (((defpackage.ycg) r10).a.invoke(r1, r9) == r0) goto L14;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object B(java.lang.Object r10) {
        /*
            r9 = this;
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r9.c
            r2 = 1
            if (r1 == 0) goto L15
            if (r1 == r2) goto Ld
            defpackage.br7.v(r10)
            goto L53
        Ld:
            java.lang.Object r1 = r9.e
            fdg r1 = (defpackage.fdg) r1
            defpackage.br7.v(r10)
            goto L42
        L15:
            defpackage.br7.v(r10)
            java.lang.Object r10 = r9.f
            r1 = r10
            fdg r1 = (defpackage.fdg) r1
            java.lang.Object r10 = r9.g
            r4 = r10
            nig r4 = (defpackage.nig) r4
            java.lang.Object r10 = r9.h
            r5 = r10
            java.lang.String r5 = (java.lang.String) r5
            java.lang.Object r10 = r9.d
            r7 = r10
            java.lang.String r7 = (java.lang.String) r7
            java.lang.Object r10 = r9.i
            r6 = r10
            ms r6 = (defpackage.ms) r6
            r9.e = r1
            r9.c = r2
            yu4 r3 = new yu4
            r8 = 0
            r3.<init>(r4, r5, r6, r7, r8)
            ycg r10 = new ycg
            r10.<init>(r3)
            if (r10 == r0) goto L56
        L42:
            ycg r10 = (defpackage.ycg) r10
            r2 = 0
            r9.e = r2
            r2 = 2
            r9.c = r2
            b55 r10 = r10.a
            java.lang.Object r9 = r10.invoke(r1, r9)
            if (r9 != r0) goto L53
            goto L56
        L53:
            c1e r9 = defpackage.c1e.a
            return r9
        L56:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yu.B(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0041, code lost:
    
        if (r6 == r0) goto L14;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object C(java.lang.Object r6) {
        /*
            r5 = this;
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r5.c
            r2 = 1
            if (r1 == 0) goto L15
            if (r1 == r2) goto Ld
            defpackage.br7.v(r6)
            goto L44
        Ld:
            java.lang.Object r1 = r5.e
            fdg r1 = (defpackage.fdg) r1
            defpackage.br7.v(r6)
            goto L33
        L15:
            defpackage.br7.v(r6)
            java.lang.Object r6 = r5.f
            r1 = r6
            fdg r1 = (defpackage.fdg) r1
            java.lang.Object r6 = r5.g
            m1g r6 = (defpackage.m1g) r6
            java.lang.Object r3 = r5.h
            java.lang.String r3 = (java.lang.String) r3
            java.lang.Object r4 = r5.d
            arf r4 = (defpackage.arf) r4
            r5.e = r1
            r5.c = r2
            ycg r6 = r6.b(r3, r4, r5)
            if (r6 == r0) goto L50
        L33:
            ycg r6 = (defpackage.ycg) r6
            r2 = 0
            r5.e = r2
            r2 = 2
            r5.c = r2
            b55 r6 = r6.a
            java.lang.Object r6 = r6.invoke(r1, r5)
            if (r6 != r0) goto L44
            goto L50
        L44:
            java.lang.Object r5 = r5.i
            java.util.ArrayList r5 = (java.util.ArrayList) r5
            q1g r6 = (defpackage.q1g) r6
            r5.add(r6)
            c1e r5 = defpackage.c1e.a
            return r5
        L50:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yu.C(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0089, code lost:
    
        if (r12.a(r13, r7) != r1) goto L23;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object i(java.lang.Object r13) {
        /*
            r12 = this;
            java.lang.Object r0 = r12.f
            tk8 r0 = (defpackage.tk8) r0
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r12.c
            r3 = 0
            r4 = 3
            r5 = 2
            r6 = 1
            if (r2 == 0) goto L2d
            if (r2 == r6) goto L28
            if (r2 == r5) goto L1f
            if (r2 != r4) goto L19
            defpackage.br7.v(r13)
            goto L8c
        L19:
            java.lang.String r12 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r12)
            return r3
        L1f:
            java.lang.Object r2 = r12.e
            f8e r2 = (defpackage.f8e) r2
            defpackage.br7.v(r13)
            r7 = r12
            goto L7a
        L28:
            defpackage.br7.v(r13)
            r7 = r12
            goto L51
        L2d:
            defpackage.br7.v(r13)
            r13 = r6
            kbe r6 = r0.g
            java.lang.Object r2 = r12.g
            r9 = r2
            java.lang.String r9 = (java.lang.String) r9
            java.lang.Object r2 = r12.h
            r10 = r2
            java.lang.String r10 = (java.lang.String) r10
            java.lang.Object r2 = r12.d
            r11 = r2
            java.lang.String r11 = (java.lang.String) r11
            java.lang.Object r2 = r12.i
            r8 = r2
            gen.model.SourceParameter r8 = (gen.model.SourceParameter) r8
            r12.c = r13
            r7 = r12
            java.lang.Object r13 = r6.i(r7, r8, r9, r10, r11)
            if (r13 != r1) goto L51
            goto L8b
        L51:
            r2 = r13
            g8e r2 = (defpackage.g8e) r2
            boolean r12 = r2 instanceof defpackage.f8e
            if (r12 == 0) goto L7a
            r6c r12 = r0.m
            lk8 r13 = new lk8
            java.lang.Object r6 = r7.h
            java.lang.String r6 = (java.lang.String) r6
            ag8 r8 = new ag8
            java.lang.Object r9 = r7.g
            java.lang.String r9 = (java.lang.String) r9
            r8.<init>(r9)
            r13.<init>(r6, r8)
            r6 = r2
            f8e r6 = (defpackage.f8e) r6
            r7.e = r6
            r7.c = r5
            java.lang.Object r12 = r12.a(r13, r7)
            if (r12 != r1) goto L7a
            goto L8b
        L7a:
            r6c r12 = r0.n
            nk8 r13 = new nk8
            r13.<init>(r2)
            r7.e = r3
            r7.c = r4
            java.lang.Object r12 = r12.a(r13, r7)
            if (r12 != r1) goto L8c
        L8b:
            return r1
        L8c:
            c1e r12 = defpackage.c1e.a
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yu.i(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x007d, code lost:
    
        if (r12.a(r13, r7) != r1) goto L23;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object n(java.lang.Object r13) {
        /*
            r12 = this;
            java.lang.Object r0 = r12.f
            nl8 r0 = (defpackage.nl8) r0
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r12.c
            r3 = 0
            r4 = 3
            r5 = 2
            r6 = 1
            if (r2 == 0) goto L2c
            if (r2 == r6) goto L27
            if (r2 == r5) goto L1e
            if (r2 != r4) goto L18
            defpackage.br7.v(r13)
            goto L80
        L18:
            java.lang.String r12 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r12)
            return r3
        L1e:
            java.lang.Object r2 = r12.e
            v7e r2 = (defpackage.v7e) r2
            defpackage.br7.v(r13)
            r7 = r12
            goto L6e
        L27:
            defpackage.br7.v(r13)
            r7 = r12
            goto L50
        L2c:
            defpackage.br7.v(r13)
            r13 = r6
            kbe r6 = r0.g
            java.lang.Object r2 = r12.g
            r9 = r2
            java.lang.String r9 = (java.lang.String) r9
            java.lang.Object r2 = r12.h
            r10 = r2
            java.lang.String r10 = (java.lang.String) r10
            java.lang.Object r2 = r12.d
            r11 = r2
            java.lang.String r11 = (java.lang.String) r11
            java.lang.Object r2 = r12.i
            r8 = r2
            gen.model.SourceParameter r8 = (gen.model.SourceParameter) r8
            r12.c = r13
            r7 = r12
            java.lang.Object r13 = r6.d(r7, r8, r9, r10, r11)
            if (r13 != r1) goto L50
            goto L7f
        L50:
            r2 = r13
            g8e r2 = (defpackage.g8e) r2
            boolean r12 = r2 instanceof defpackage.v7e
            if (r12 == 0) goto L6e
            java.lang.Object r12 = r7.h
            java.lang.String r12 = (java.lang.String) r12
            eb8 r13 = new eb8
            r6 = r2
            v7e r6 = (defpackage.v7e) r6
            r13.<init>(r4, r6)
            r7.e = r6
            r7.c = r5
            java.lang.Object r12 = r0.f(r12, r13, r7)
            if (r12 != r1) goto L6e
            goto L7f
        L6e:
            r6c r12 = r0.l
            al8 r13 = new al8
            r13.<init>(r2)
            r7.e = r3
            r7.c = r4
            java.lang.Object r12 = r12.a(r13, r7)
            if (r12 != r1) goto L80
        L7f:
            return r1
        L80:
            c1e r12 = defpackage.c1e.a
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yu.n(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0084, code lost:
    
        if (r12.a(r13, r7) != r1) goto L23;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object o(java.lang.Object r13) {
        /*
            r12 = this;
            java.lang.Object r0 = r12.f
            nl8 r0 = (defpackage.nl8) r0
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r12.c
            r3 = 0
            r4 = 3
            r5 = 2
            r6 = 1
            if (r2 == 0) goto L2d
            if (r2 == r6) goto L28
            if (r2 == r5) goto L1f
            if (r2 != r4) goto L19
            defpackage.br7.v(r13)
            goto L87
        L19:
            java.lang.String r12 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r12)
            return r3
        L1f:
            java.lang.Object r2 = r12.e
            f8e r2 = (defpackage.f8e) r2
            defpackage.br7.v(r13)
            r7 = r12
            goto L75
        L28:
            defpackage.br7.v(r13)
            r7 = r12
            goto L51
        L2d:
            defpackage.br7.v(r13)
            r13 = r6
            kbe r6 = r0.g
            java.lang.Object r2 = r12.g
            r9 = r2
            java.lang.String r9 = (java.lang.String) r9
            java.lang.Object r2 = r12.h
            r10 = r2
            java.lang.String r10 = (java.lang.String) r10
            java.lang.Object r2 = r12.d
            r11 = r2
            java.lang.String r11 = (java.lang.String) r11
            java.lang.Object r2 = r12.i
            r8 = r2
            gen.model.SourceParameter r8 = (gen.model.SourceParameter) r8
            r12.c = r13
            r7 = r12
            java.lang.Object r13 = r6.i(r7, r8, r9, r10, r11)
            if (r13 != r1) goto L51
            goto L86
        L51:
            r2 = r13
            g8e r2 = (defpackage.g8e) r2
            boolean r12 = r2 instanceof defpackage.f8e
            if (r12 == 0) goto L75
            java.lang.Object r12 = r7.h
            java.lang.String r12 = (java.lang.String) r12
            java.lang.Object r13 = r7.g
            java.lang.String r13 = (java.lang.String) r13
            ov5 r6 = new ov5
            r8 = 10
            r6.<init>(r13, r8)
            r13 = r2
            f8e r13 = (defpackage.f8e) r13
            r7.e = r13
            r7.c = r5
            java.lang.Object r12 = r0.f(r12, r6, r7)
            if (r12 != r1) goto L75
            goto L86
        L75:
            r6c r12 = r0.l
            al8 r13 = new al8
            r13.<init>(r2)
            r7.e = r3
            r7.c = r4
            java.lang.Object r12 = r12.a(r13, r7)
            if (r12 != r1) goto L87
        L86:
            return r1
        L87:
            c1e r12 = defpackage.c1e.a
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yu.o(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x008c, code lost:
    
        if (r2.a(r3, r15) == r12) goto L22;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object r(java.lang.Object r16) {
        /*
            r15 = this;
            java.lang.Object r0 = r15.g
            com.medium.android.graphql.fragment.PostMetaData r0 = (com.medium.android.graphql.fragment.PostMetaData) r0
            java.lang.Object r1 = r15.e
            r11 = r1
            sw9 r11 = (defpackage.sw9) r11
            tb2 r12 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r15.c
            r2 = 0
            r13 = 2
            r3 = 1
            if (r1 == 0) goto L2b
            if (r1 == r3) goto L21
            if (r1 != r13) goto L1b
            defpackage.br7.v(r16)
            goto L8f
        L1b:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r2
        L21:
            defpackage.br7.v(r16)
            r0 = r16
            bjb r0 = (defpackage.bjb) r0
            java.lang.Object r0 = r0.a
            goto L65
        L2b:
            defpackage.br7.v(r16)
            r1 = r0
            jf2 r0 = r11.x
            r4 = r1
            java.lang.String r1 = r4.getId()
            java.lang.String r4 = r4.getLatestPublishedVersion()
            java.lang.Object r5 = r15.h
            qxb r5 = (defpackage.qxb) r5
            int r6 = r5.a
            int r5 = r5.b
            java.lang.Object r7 = r15.d
            com.medium.android.graphql.fragment.ParagraphData r7 = (com.medium.android.graphql.fragment.ParagraphData) r7
            java.lang.String r7 = r7.getName()
            if (r7 == 0) goto L92
            r8 = r6
            com.medium.android.core.models.HighlightType r6 = com.medium.android.core.models.HighlightType.STANDARD
            r2 = r4
            r4 = r5
            r5 = r7
            java.lang.String r7 = r11.d
            r9 = r8
            java.lang.String r8 = r11.F0
            r14 = r9
            java.lang.String r9 = r11.D0
            r15.c = r3
            r10 = r15
            r3 = r14
            java.lang.Object r0 = r0.a(r1, r2, r3, r4, r5, r6, r7, r8, r9, r10)
            if (r0 != r12) goto L65
            goto L8e
        L65:
            java.lang.Object r1 = r15.i
            n39 r1 = (defpackage.n39) r1
            boolean r2 = r0 instanceof defpackage.ajb
            if (r2 != 0) goto L73
            r2 = r0
            com.medium.android.domain.post.models.Highlight r2 = (com.medium.android.domain.post.models.Highlight) r2
            r1.e(r2)
        L73:
            java.lang.Throwable r1 = defpackage.bjb.b(r0)
            if (r1 == 0) goto L8f
            r6c r2 = r11.x0
            ms9 r3 = new ms9
            b24 r1 = defpackage.m4.I(r1)
            r3.<init>(r1)
            r15.f = r0
            r15.c = r13
            java.lang.Object r0 = r2.a(r3, r15)
            if (r0 != r12) goto L8f
        L8e:
            return r12
        L8f:
            c1e r0 = defpackage.c1e.a
            return r0
        L92:
            java.lang.String r0 = "Paragraph name cannot be null"
            defpackage.ay0.e(r0)
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yu.r(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0080, code lost:
    
        if (r8.a(r1, r14) == r9) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00ab, code lost:
    
        if (r8.a(r1, r14) == r9) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x00cd, code lost:
    
        if (r8.a(r1, r14) == r9) goto L34;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object u(java.lang.Object r15) {
        /*
            Method dump skipped, instruction units count: 215
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yu.u(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00ad  */
    /* JADX WARN: Removed duplicated region for block: B:50:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object v(java.lang.Object r15) throws java.lang.Throwable {
        /*
            r14 = this;
            java.lang.Object r0 = r14.g
            r1 = r0
            wx6 r1 = (defpackage.wx6) r1
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r14.c
            r3 = 0
            c1e r4 = defpackage.c1e.a
            r5 = 1
            if (r2 == 0) goto L28
            if (r2 != r5) goto L22
            java.lang.Object r0 = r14.f
            r2 = r0
            rya r2 = (defpackage.rya) r2
            java.lang.Object r14 = r14.e
            rya r14 = (defpackage.rya) r14
            defpackage.br7.v(r15)     // Catch: java.lang.Throwable -> L1e
            goto L83
        L1e:
            r0 = move-exception
            r15 = r0
            goto L9e
        L22:
            java.lang.String r14 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r14)
            return r3
        L28:
            defpackage.br7.v(r15)
            r15 = r1
            ky6 r15 = (defpackage.ky6) r15
            vx6 r15 = r15.d
            vx6 r2 = defpackage.vx6.DESTROYED
            if (r15 != r2) goto L35
            goto L95
        L35:
            rya r8 = new rya
            r8.<init>()
            rya r2 = new rya
            r2.<init>()
            java.lang.Object r15 = r14.h     // Catch: java.lang.Throwable -> L9a
            vx6 r15 = (defpackage.vx6) r15     // Catch: java.lang.Throwable -> L9a
            java.lang.Object r6 = r14.d     // Catch: java.lang.Throwable -> L9a
            r9 = r6
            sb2 r9 = (defpackage.sb2) r9     // Catch: java.lang.Throwable -> L9a
            java.lang.Object r6 = r14.i     // Catch: java.lang.Throwable -> L9a
            r13 = r6
            b55 r13 = (defpackage.b55) r13     // Catch: java.lang.Throwable -> L9a
            r14.e = r8     // Catch: java.lang.Throwable -> L96
            r14.f = r2     // Catch: java.lang.Throwable -> L96
            r14.c = r5     // Catch: java.lang.Throwable -> L96
            x51 r11 = new x51     // Catch: java.lang.Throwable -> L96
            n92 r14 = defpackage.pwd.Q(r14)     // Catch: java.lang.Throwable -> L96
            r11.<init>(r5, r14)     // Catch: java.lang.Throwable -> L96
            r11.s()     // Catch: java.lang.Throwable -> L96
            sx6 r14 = defpackage.ux6.Companion     // Catch: java.lang.Throwable -> L96
            r14.getClass()     // Catch: java.lang.Throwable -> L9a
            ux6 r7 = defpackage.sx6.c(r15)     // Catch: java.lang.Throwable -> L9a
            ux6 r10 = defpackage.sx6.a(r15)     // Catch: java.lang.Throwable -> L96
            a98 r12 = new a98     // Catch: java.lang.Throwable -> L9a
            r12.<init>()     // Catch: java.lang.Throwable -> L9a
            w4b r6 = new w4b     // Catch: java.lang.Throwable -> L96
            r6.<init>(r7, r8, r9, r10, r11, r12, r13)     // Catch: java.lang.Throwable -> L96
            r2.a = r6     // Catch: java.lang.Throwable -> L96
            r1.a(r6)     // Catch: java.lang.Throwable -> L96
            java.lang.Object r14 = r11.q()     // Catch: java.lang.Throwable -> L96
            if (r14 != r0) goto L82
            return r0
        L82:
            r14 = r8
        L83:
            java.lang.Object r14 = r14.a
            va6 r14 = (defpackage.va6) r14
            if (r14 == 0) goto L8c
            r14.m(r3)
        L8c:
            java.lang.Object r14 = r2.a
            cy6 r14 = (defpackage.cy6) r14
            if (r14 == 0) goto L95
            r1.b(r14)
        L95:
            return r4
        L96:
            r0 = move-exception
            r15 = r0
        L98:
            r14 = r8
            goto L9e
        L9a:
            r0 = move-exception
            r14 = r0
            r15 = r14
            goto L98
        L9e:
            java.lang.Object r14 = r14.a
            va6 r14 = (defpackage.va6) r14
            if (r14 == 0) goto La7
            r14.m(r3)
        La7:
            java.lang.Object r14 = r2.a
            cy6 r14 = (defpackage.cy6) r14
            if (r14 == 0) goto Lb0
            r1.b(r14)
        Lb0:
            throw r15
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yu.v(java.lang.Object):java.lang.Object");
    }

    private final Object w(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            uua uuaVar = ((qed) this.e).o;
            yi1 yi1Var = new yi1((nhc) this.f, (sb2) this.g, (Resources) this.h, (zdd) this.d, (bed) this.i, 8);
            this.c = 1;
            if (uuaVar.a.b(yi1Var, this) == tb2Var) {
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

    private final Object x(Object obj) {
        vb9 vb9Var = (vb9) this.e;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            lfd lfdVar = new lfd((sb2) this.f, new f0a(vb9Var), (x45) this.g, (x45) this.h, (c55) this.d, (x45) this.i, null);
            this.c = 1;
            if (w2g.l(vb9Var, lfdVar, this) == tb2Var) {
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

    /* JADX WARN: Code restructure failed: missing block: B:14:0x005b, code lost:
    
        if (r14 == r1) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x008a, code lost:
    
        if (r14 == r1) goto L23;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object y(java.lang.Object r15) {
        /*
            r14 = this;
            java.lang.Object r0 = r14.f
            o2b r0 = (defpackage.o2b) r0
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r14.c
            r3 = 0
            r4 = 2
            r5 = 1
            if (r2 == 0) goto L27
            if (r2 == r5) goto L1f
            if (r2 != r4) goto L19
            defpackage.br7.v(r15)
            bjb r15 = (defpackage.bjb) r15
            java.lang.Object r14 = r15.a
            goto L5e
        L19:
            java.lang.String r14 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r14)
            return r3
        L1f:
            defpackage.br7.v(r15)
            bjb r15 = (defpackage.bjb) r15
            java.lang.Object r14 = r15.a
            goto L8d
        L27:
            defpackage.br7.v(r15)
            java.lang.Object r15 = r14.e
            com.medium.android.core.models.EntityType r15 = (com.medium.android.core.models.EntityType) r15
            int[] r2 = defpackage.s0e.a
            int r15 = r15.ordinal()
            r15 = r2[r15]
            java.lang.Object r2 = r14.i
            java.lang.Object r6 = r14.d
            if (r15 == r5) goto L6d
            if (r15 != r4) goto L69
            java.lang.Object r15 = r0.c
            r7 = r15
            o2b r7 = (defpackage.o2b) r7
            java.lang.Object r15 = r14.g
            r8 = r15
            java.lang.String r8 = (java.lang.String) r8
            java.lang.Object r15 = r14.h
            r9 = r15
            java.lang.String r9 = (java.lang.String) r9
            r10 = r6
            gen.model.SourceParameter r10 = (gen.model.SourceParameter) r10
            r11 = r2
            java.lang.String r11 = (java.lang.String) r11
            r14.c = r4
            r12 = 1
            r13 = r14
            java.lang.Object r14 = r7.w(r8, r9, r10, r11, r12, r13)
            if (r14 != r1) goto L5e
            goto L8c
        L5e:
            boolean r15 = r14 instanceof defpackage.ajb
            if (r15 != 0) goto L97
            com.medium.android.graphql.fragment.CollectionFollowData r14 = (com.medium.android.graphql.fragment.CollectionFollowData) r14
            java.lang.String r14 = r14.getName()
            goto L97
        L69:
            defpackage.ygf.a()
            return r3
        L6d:
            r8 = r14
            java.lang.Object r14 = r0.b
            o2b r14 = (defpackage.o2b) r14
            java.lang.Object r15 = r8.g
            r3 = r15
            java.lang.String r3 = (java.lang.String) r3
            java.lang.Object r15 = r8.h
            r4 = r15
            java.lang.String r4 = (java.lang.String) r4
            gen.model.SourceParameter r6 = (gen.model.SourceParameter) r6
            java.lang.String r2 = (java.lang.String) r2
            r8.c = r5
            r7 = 1
            r5 = r6
            r6 = r2
            r2 = r14
            java.lang.Object r14 = r2.w(r3, r4, r5, r6, r7, r8)
            if (r14 != r1) goto L8d
        L8c:
            return r1
        L8d:
            boolean r15 = r14 instanceof defpackage.ajb
            if (r15 != 0) goto L97
            com.medium.android.graphql.fragment.UserFollowData r14 = (com.medium.android.graphql.fragment.UserFollowData) r14
            java.lang.String r14 = r14.getName()
        L97:
            bjb r15 = new bjb
            r15.<init>(r14)
            return r15
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yu.y(java.lang.Object):java.lang.Object");
    }

    private final Object z(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            uua uuaVar = ((ide) this.e).v;
            yi1 yi1Var = new yi1((nhc) this.f, (sb2) this.g, (zbe) this.h, (Resources) this.d, (mya) this.i);
            this.c = 1;
            if (uuaVar.a.b(yi1Var, this) == tb2Var) {
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

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.i;
        Object obj3 = this.d;
        switch (i) {
            case 0:
                yu yuVar = new yu((wj1) this.g, (ou) this.h, (l78) obj3, (l78) obj2, n92Var, 0);
                yuVar.f = obj;
                return yuVar;
            case 1:
                return new yu((y7b) this.e, (ac7) this.f, (ac7) this.g, (ub7) this.h, (ic7) obj2, (l78) obj3, n92Var);
            case 2:
                return new yu((id1) this.e, (String) this.g, (SourceParameter) this.h, (String) obj3, (String) obj2, n92Var, 2);
            case 3:
                return new yu((mj1) this.e, (nhc) this.f, (sb2) this.g, (Resources) this.h, (m50) obj3, (aj1) obj2, n92Var, 3);
            case 4:
                yu yuVar2 = new yu((k37) this.h, (ru) obj3, (c8f) obj2, n92Var, 4);
                yuVar2.f = obj;
                return yuVar2;
            case 5:
                yu yuVar3 = new yu((do4) this.e, (zj2) this.g, (PostType) this.h, (x45) obj3, (c55) obj2, n92Var, 5);
                yuVar3.f = obj;
                return yuVar3;
            case 6:
                yu yuVar4 = new yu((List) obj3, (ArrayList) obj2, n92Var, 6);
                yuVar4.h = obj;
                return yuVar4;
            case 7:
                yu yuVar5 = new yu((y23) this.e, (wtd) this.g, (ArrayList) this.h, (String) obj3, (String) obj2, n92Var, 7);
                yuVar5.f = obj;
                return yuVar5;
            case 8:
                return new yu((fj4) this.e, (nhc) this.f, (ug7) this.g, (sb2) this.h, (Resources) obj3, (s26) obj2, n92Var, 8);
            case 9:
                return new yu((EntityType) this.e, (ku3) this.f, (String) this.g, (String) this.h, (SourceParameter) obj3, (String) obj2, n92Var, 9);
            case 10:
                yu yuVar6 = new yu((rp7) obj3, (String) obj2, n92Var, 10);
                yuVar6.f = obj;
                return yuVar6;
            case 11:
                return new yu((x88) this.e, (nhc) this.f, (sb2) this.g, (Resources) this.h, (h88) obj3, (j88) obj2, n92Var, 11);
            case 12:
                return new yu((m98) this.e, (nhc) this.f, (i98) this.g, (sb2) this.h, (Resources) obj3, (h98) obj2, n92Var, 12);
            case 13:
                yu yuVar7 = new yu((rya) this.g, (be8) this.h, (rya) obj3, (ke8) obj2, n92Var, 13);
                yuVar7.f = obj;
                return yuVar7;
            case 14:
                return new yu(this.f, this.g, (String) this.h, obj3, obj2, n92Var, 14);
            case 15:
                return new yu(this.f, this.g, (String) this.h, obj3, obj2, n92Var, 15);
            case 16:
                return new yu(this.f, this.g, (String) this.h, obj3, obj2, n92Var, 16);
            case 17:
                return new yu(this.f, this.g, (String) this.h, obj3, obj2, n92Var, 17);
            case 18:
                return new yu((sw9) this.e, (PostMetaData) this.g, (qxb) this.h, (ParagraphData) obj3, (n39) obj2, n92Var, 18);
            case 19:
                return new yu((sw9) this.e, (String) this.f, (String) this.g, (EntityType) this.h, (String) obj3, (String) obj2, n92Var, 19);
            case 20:
                return new yu((wx6) this.g, (vx6) this.h, (sb2) obj3, (b55) obj2, n92Var, 20);
            case 21:
                return new yu((jcd) this.e, (nhc) this.f, (Resources) this.g, (jbd) this.h, (u8d) obj3, (odd) obj2, n92Var, 21);
            case 22:
                return new yu((qed) this.e, (nhc) this.f, (sb2) this.g, (Resources) this.h, (zdd) obj3, (bed) obj2, n92Var, 22);
            case 23:
                yu yuVar8 = new yu((vb9) this.e, (x45) this.g, (x45) this.h, (c55) obj3, (x45) obj2, n92Var, 23);
                yuVar8.f = obj;
                return yuVar8;
            case 24:
                return new yu((EntityType) this.e, (o2b) this.f, (String) this.g, (String) this.h, (SourceParameter) obj3, (String) obj2, n92Var, 24);
            case 25:
                return new yu((ide) this.e, (nhc) this.f, (sb2) this.g, (zbe) this.h, (Resources) obj3, (mya) obj2, n92Var, 25);
            case 26:
                return new yu(this.f, this.g, (String) this.h, obj3, obj2, n92Var, 26);
            case 27:
                return new yu(this.f, this.g, (String) this.h, obj3, obj2, n92Var, 27);
            case 28:
                return new yu(this.f, this.g, (String) this.h, obj3, obj2, n92Var, 28);
            default:
                return new yu((jrf) this.h, (xzf) obj3, (fdg) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((yu) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Can't wrap try/catch for region: R(5:132|(1:(1:135)(2:136|151))(4:137|(1:140)|139|580)|517|141|(5:143|149|150|139|580)(2:146|147)) */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x0272, code lost:
    
        if (r0 == r5) goto L106;
     */
    /* JADX WARN: Code restructure failed: missing block: B:144:0x037f, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:148:0x0389, code lost:
    
        r0 = new defpackage.ajb(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:152:0x0399, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:154:0x039d, code lost:
    
        throw r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:166:0x03f1, code lost:
    
        if (r0 == r7) goto L174;
     */
    /* JADX WARN: Code restructure failed: missing block: B:173:0x0418, code lost:
    
        if (r0 == r7) goto L174;
     */
    /* JADX WARN: Code restructure failed: missing block: B:476:0x0ae0, code lost:
    
        if (defpackage.f76.y(r1, r0, 0.0f, r1, 0.0f, null, r29, 2014) == r12) goto L495;
     */
    /* JADX WARN: Code restructure failed: missing block: B:494:0x0b60, code lost:
    
        if (defpackage.f76.O(r5, r0, r1, r29, 12) == r12) goto L495;
     */
    /* JADX WARN: Code restructure failed: missing block: B:604:?, code lost:
    
        return r12;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Path cross not found for [B:358:0x0803, B:365:0x082c], limit reached: 578 */
    /* JADX WARN: Path cross not found for [B:365:0x082c, B:358:0x0803], limit reached: 578 */
    /* JADX WARN: Removed duplicated region for block: B:222:0x0505  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:360:0x0809  */
    /* JADX WARN: Removed duplicated region for block: B:365:0x082c  */
    /* JADX WARN: Removed duplicated region for block: B:368:0x085b  */
    /* JADX WARN: Removed duplicated region for block: B:444:0x0a5f A[PHI: r0
      0x0a5f: PHI (r0v15 java.lang.Object) = (r0v14 java.lang.Object), (r0v14 java.lang.Object), (r0v20 java.lang.Object) binds: [B:440:0x0a4a, B:442:0x0a5c, B:434:0x0a06] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:446:0x0a65  */
    /* JADX WARN: Removed duplicated region for block: B:507:0x0ba6  */
    /* JADX WARN: Removed duplicated region for block: B:510:0x0bb0  */
    /* JADX WARN: Removed duplicated region for block: B:564:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:570:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:600:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:607:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x01d3 A[PHI: r0
      0x01d3: PHI (r0v95 g8e) = (r0v94 g8e), (r0v94 g8e), (r0v99 g8e) binds: [B:75:0x01b1, B:77:0x01d0, B:69:0x0180] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Type inference failed for: r4v0, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r4v110 */
    /* JADX WARN: Type inference failed for: r4v111 */
    /* JADX WARN: Type inference failed for: r4v26, types: [java.util.concurrent.Future] */
    /* JADX WARN: Type inference failed for: r4v29 */
    /* JADX WARN: Type inference failed for: r5v0, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v29 */
    /* JADX WARN: Type inference failed for: r5v30 */
    /* JADX WARN: Type inference failed for: r5v9, types: [java.util.concurrent.atomic.AtomicInteger] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:364:0x082a -> B:358:0x0803). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:366:0x0857 -> B:358:0x0803). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:506:0x0ba4 -> B:508:0x0ba8). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r30) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 3100
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yu.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ yu(Object obj, Serializable serializable, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.i = serializable;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ yu(Object obj, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.h = obj;
        this.d = obj2;
        this.i = obj3;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ yu(Object obj, Object obj2, Object obj3, Object obj4, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.g = obj;
        this.h = obj2;
        this.d = obj3;
        this.i = obj4;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ yu(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
        this.g = obj2;
        this.h = obj3;
        this.d = obj4;
        this.i = obj5;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ yu(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
        this.f = obj2;
        this.g = obj3;
        this.h = obj4;
        this.d = obj5;
        this.i = obj6;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ yu(Object obj, Object obj2, String str, Object obj3, Object obj4, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.g = obj2;
        this.h = str;
        this.d = obj3;
        this.i = obj4;
    }
}
