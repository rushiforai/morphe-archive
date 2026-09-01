package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003*\u0001\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001J\u001e\u0010\u0005\u001a\u00020\u00042\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002H\u0096@¢\u0006\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"kotlinx/coroutines/flow/internal/SafeCollector_commonKt$unsafeFlow$1", "Lbo4;", "Ldo4;", "collector", "Lc1e;", "b", "(Ldo4;Ln92;)Ljava/lang/Object;", "kotlinx-coroutines-core"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class q2 implements bo4 {
    final /* synthetic */ bo4 a;
    final /* synthetic */ p2 b;
    final /* synthetic */ ek6 c;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
    public static final class a<T> implements do4 {
        final /* synthetic */ do4 a;
        final /* synthetic */ p2 b;
        final /* synthetic */ ek6 c;

        /* JADX INFO: renamed from: q2$a$a, reason: collision with other inner class name */
        @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
        @uv2(c = "com.medium.android.core.preferences.AbstractSharedPreferences$watch$$inlined$filter$1$2", f = "AbstractSharedPreferences.kt", l = {217}, m = "emit", v = 1)
        public static final class C0007a extends p92 {
            Object b;
            /* synthetic */ Object c;
            int d;
            Object e;
            Object f;
            Object g;
            int h;

            public C0007a(n92 n92Var) {
                super(n92Var);
            }

            @Override // defpackage.kn0
            public final Object invokeSuspend(Object obj) {
                this.c = obj;
                this.d |= Integer.MIN_VALUE;
                return a.this.a(null, this);
            }
        }

        public a(do4 do4Var, p2 p2Var, ek6 ek6Var) {
            this.a = do4Var;
            this.b = p2Var;
            this.c = ek6Var;
        }

        /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
        @Override // defpackage.do4
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final java.lang.Object a(java.lang.Object r7, defpackage.n92 r8) {
            /*
                r6 = this;
                boolean r0 = r8 instanceof q2.a.C0007a
                if (r0 == 0) goto L13
                r0 = r8
                q2$a$a r0 = (q2.a.C0007a) r0
                int r1 = r0.d
                r2 = -2147483648(0xffffffff80000000, float:-0.0)
                r3 = r1 & r2
                if (r3 == 0) goto L13
                int r1 = r1 - r2
                r0.d = r1
                goto L18
            L13:
                q2$a$a r0 = new q2$a$a
                r0.<init>(r8)
            L18:
                java.lang.Object r8 = r0.c
                tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
                int r2 = r0.d
                r3 = 1
                r4 = 0
                if (r2 == 0) goto L36
                if (r2 != r3) goto L30
                java.lang.Object r6 = r0.g
                do4 r6 = (defpackage.do4) r6
                java.lang.Object r6 = r0.e
                q2$a$a r6 = (q2.a.C0007a) r6
                defpackage.br7.v(r8)
                goto L62
            L30:
                java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
                defpackage.ygf.f(r6)
                return r4
            L36:
                defpackage.br7.v(r8)
                do4 r8 = r6.a
                r2 = r7
                java.lang.String r2 = (java.lang.String) r2
                p2 r5 = r6.b
                ek6 r6 = r6.c
                java.lang.String r6 = defpackage.p2.c(r5, r6)
                boolean r6 = defpackage.g76.L(r2, r6)
                if (r6 != 0) goto L4e
                if (r2 != 0) goto L62
            L4e:
                r0.b = r4
                r0.e = r4
                r0.f = r4
                r0.g = r4
                r6 = 0
                r0.h = r6
                r0.d = r3
                java.lang.Object r6 = r8.a(r7, r0)
                if (r6 != r1) goto L62
                return r1
            L62:
                c1e r6 = defpackage.c1e.a
                return r6
            */
            throw new UnsupportedOperationException("Method not decompiled: q2.a.a(java.lang.Object, n92):java.lang.Object");
        }
    }

    public q2(bo4 bo4Var, p2 p2Var, ek6 ek6Var) {
        this.a = bo4Var;
        this.b = p2Var;
        this.c = ek6Var;
    }

    @Override // defpackage.bo4
    public Object b(do4 do4Var, n92 n92Var) {
        Object objB = this.a.b(new a(do4Var, this.b, this.c), n92Var);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
    }
}
