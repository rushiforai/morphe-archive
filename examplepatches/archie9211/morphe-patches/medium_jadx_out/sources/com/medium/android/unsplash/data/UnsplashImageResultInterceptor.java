package com.medium.android.unsplash.data;

import defpackage.k56;
import defpackage.n92;
import defpackage.nx5;
import defpackage.p92;
import defpackage.rx5;
import defpackage.uv2;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001b\u0010\u0007\u001a\u00020\u0004*\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0005H\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u0018\u0010\f\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\tH\u0096@¢\u0006\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/unsplash/data/UnsplashImageResultInterceptor;", "Lk56;", "<init>", "()V", "Lrx5;", "Lcom/medium/android/unsplash/data/UnsplashPhoto;", "unsplashPhoto", "withRawUrl", "(Lrx5;Lcom/medium/android/unsplash/data/UnsplashPhoto;)Lrx5;", "Li56;", "chain", "Lxx5;", "intercept", "(Li56;Ln92;)Ljava/lang/Object;", "unsplash_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UnsplashImageResultInterceptor implements k56 {
    public static final int $stable = 0;
    public static final UnsplashImageResultInterceptor INSTANCE = new UnsplashImageResultInterceptor();

    /* JADX INFO: renamed from: com.medium.android.unsplash.data.UnsplashImageResultInterceptor$intercept$1, reason: invalid class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
    @uv2(c = "com.medium.android.unsplash.data.UnsplashImageResultInterceptor", f = "UnsplashImageResultInterceptor.kt", l = {14, 18}, m = "intercept", v = 1)
    public static final class AnonymousClass1 extends p92 {
        Object L$0;
        Object L$1;
        Object L$2;
        int label;
        /* synthetic */ Object result;

        public AnonymousClass1(n92<? super AnonymousClass1> n92Var) {
            super(n92Var);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return UnsplashImageResultInterceptor.this.intercept(null, this);
        }
    }

    private UnsplashImageResultInterceptor() {
    }

    private final rx5 withRawUrl(rx5 rx5Var, UnsplashPhoto unsplashPhoto) {
        nx5 nx5VarA = rx5.a(rx5Var);
        nx5VarA.c = unsplashPhoto.getUrls().getRaw();
        return nx5VarA.a();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.k56
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object intercept(defpackage.i56 r9, defpackage.n92<? super defpackage.xx5> r10) {
        /*
            r8 = this;
            boolean r0 = r10 instanceof com.medium.android.unsplash.data.UnsplashImageResultInterceptor.AnonymousClass1
            if (r0 == 0) goto L13
            r0 = r10
            com.medium.android.unsplash.data.UnsplashImageResultInterceptor$intercept$1 r0 = (com.medium.android.unsplash.data.UnsplashImageResultInterceptor.AnonymousClass1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.label = r1
            goto L18
        L13:
            com.medium.android.unsplash.data.UnsplashImageResultInterceptor$intercept$1 r0 = new com.medium.android.unsplash.data.UnsplashImageResultInterceptor$intercept$1
            r0.<init>(r10)
        L18:
            java.lang.Object r10 = r0.result
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.label
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L43
            if (r2 == r4) goto L39
            if (r2 != r3) goto L33
            java.lang.Object r8 = r0.L$2
            xx5 r8 = (defpackage.xx5) r8
            java.lang.Object r8 = r0.L$0
            i56 r8 = (defpackage.i56) r8
            defpackage.br7.v(r10)
            return r10
        L33:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r5
        L39:
            java.lang.Object r9 = r0.L$1
            java.lang.Object r2 = r0.L$0
            i56 r2 = (defpackage.i56) r2
            defpackage.br7.v(r10)
            goto L61
        L43:
            defpackage.br7.v(r10)
            r10 = r9
            ova r10 = (defpackage.ova) r10
            rx5 r10 = r10.d
            java.lang.Object r10 = r10.b
            r0.L$0 = r9
            r0.L$1 = r10
            r0.label = r4
            r2 = r9
            ova r2 = (defpackage.ova) r2
            java.lang.Object r2 = r2.c(r0)
            if (r2 != r1) goto L5d
            goto L8f
        L5d:
            r7 = r2
            r2 = r9
            r9 = r10
            r10 = r7
        L61:
            xx5 r10 = (defpackage.xx5) r10
            boolean r4 = r10 instanceof defpackage.w0d
            if (r4 == 0) goto L68
            goto L93
        L68:
            boolean r4 = r10 instanceof defpackage.r14
            if (r4 == 0) goto L91
            boolean r6 = r9 instanceof com.medium.android.unsplash.data.UnsplashPhoto
            if (r6 == 0) goto L91
            r10 = r2
            ova r10 = (defpackage.ova) r10
            rx5 r10 = r10.d
            com.medium.android.unsplash.data.UnsplashPhoto r9 = (com.medium.android.unsplash.data.UnsplashPhoto) r9
            rx5 r8 = r8.withRawUrl(r10, r9)
            ova r2 = (defpackage.ova) r2
            ova r8 = r2.d(r8)
            r0.L$0 = r5
            r0.L$1 = r5
            r0.L$2 = r5
            r0.label = r3
            java.lang.Object r8 = r8.c(r0)
            if (r8 != r1) goto L90
        L8f:
            return r1
        L90:
            return r8
        L91:
            if (r4 == 0) goto L94
        L93:
            return r10
        L94:
            defpackage.ygf.a()
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.unsplash.data.UnsplashImageResultInterceptor.intercept(i56, n92):java.lang.Object");
    }
}
