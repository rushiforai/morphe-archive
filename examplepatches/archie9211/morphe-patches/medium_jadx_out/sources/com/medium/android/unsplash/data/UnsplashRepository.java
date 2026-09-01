package com.medium.android.unsplash.data;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001B\u0011\b\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J2\u0010\u000f\u001a\u0014\u0012\u0010\u0012\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\f0\u000b0\n0\t2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\b\u001a\u00020\u0006H\u0086@¢\u0006\u0004\b\r\u0010\u000eJ4\u0010\u0015\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00120\n0\t2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\b\u001a\u00020\u0006H\u0086@¢\u0006\u0004\b\u0013\u0010\u0014J \u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u00170\t2\b\u0010\u0016\u001a\u0004\u0018\u00010\u0010H\u0086@¢\u0006\u0004\b\u0018\u0010\u0019R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u001b¨\u0006\u001c"}, d2 = {"Lcom/medium/android/unsplash/data/UnsplashRepository;", "", "Lcom/medium/android/unsplash/data/UnsplashApi;", "unsplashApi", "<init>", "(Lcom/medium/android/unsplash/data/UnsplashApi;)V", "", "page", "pageSize", "Lbjb;", "Lzcb;", "", "Lcom/medium/android/unsplash/data/UnsplashPhoto;", "loadPhotos-0E7RQCE", "(IILn92;)Ljava/lang/Object;", "loadPhotos", "", "query", "Lcom/medium/android/unsplash/data/SearchResponse;", "searchPhotos-BWLJW6A", "(Ljava/lang/String;IILn92;)Ljava/lang/Object;", "searchPhotos", "url", "Lc1e;", "trackDownload-gIAlu-s", "(Ljava/lang/String;Ln92;)Ljava/lang/Object;", "trackDownload", "Lcom/medium/android/unsplash/data/UnsplashApi;", "unsplash_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UnsplashRepository {
    public static final int $stable = 8;
    private final UnsplashApi unsplashApi;

    public UnsplashRepository(UnsplashApi unsplashApi) {
        unsplashApi.getClass();
        this.unsplashApi = unsplashApi;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX INFO: renamed from: loadPhotos-0E7RQCE, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object m68loadPhotos0E7RQCE(int r6, int r7, defpackage.n92<? super defpackage.bjb> r8) {
        /*
            r5 = this;
            boolean r0 = r8 instanceof com.medium.android.unsplash.data.UnsplashRepository$loadPhotos$1
            if (r0 == 0) goto L13
            r0 = r8
            com.medium.android.unsplash.data.UnsplashRepository$loadPhotos$1 r0 = (com.medium.android.unsplash.data.UnsplashRepository$loadPhotos$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.label = r1
            goto L18
        L13:
            com.medium.android.unsplash.data.UnsplashRepository$loadPhotos$1 r0 = new com.medium.android.unsplash.data.UnsplashRepository$loadPhotos$1
            r0.<init>(r5, r8)
        L18:
            java.lang.Object r8 = r0.result
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.label
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L32
            if (r2 != r4) goto L2c
            java.lang.Object r5 = r0.L$0
            com.medium.android.unsplash.data.UnsplashRepository r5 = (com.medium.android.unsplash.data.UnsplashRepository) r5
            defpackage.br7.v(r8)     // Catch: java.lang.Throwable -> L68
            goto L4b
        L2c:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L32:
            defpackage.br7.v(r8)
            com.medium.android.unsplash.data.UnsplashApi r5 = r5.unsplashApi     // Catch: java.lang.Throwable -> L68
            java.lang.String r8 = "2f08fa33dd6005dbc760f22eff633a59a678b60d2285a80953cc534138fce3c2"
            r0.L$0 = r3     // Catch: java.lang.Throwable -> L68
            r0.I$0 = r6     // Catch: java.lang.Throwable -> L68
            r0.I$1 = r7     // Catch: java.lang.Throwable -> L68
            r2 = 0
            r0.I$2 = r2     // Catch: java.lang.Throwable -> L68
            r0.label = r4     // Catch: java.lang.Throwable -> L68
            java.lang.Object r8 = r5.loadPhotos(r8, r6, r7, r0)     // Catch: java.lang.Throwable -> L68
            if (r8 != r1) goto L4b
            return r1
        L4b:
            zcb r8 = (defpackage.zcb) r8     // Catch: java.lang.Throwable -> L68
            java.lang.Object r5 = r8.b     // Catch: java.lang.Throwable -> L68
            java.util.List r5 = (java.util.List) r5     // Catch: java.lang.Throwable -> L68
            adb r6 = r8.a     // Catch: java.lang.Throwable -> L68
            boolean r6 = r6.q     // Catch: java.lang.Throwable -> L68
            if (r6 == 0) goto L5a
            if (r5 == 0) goto L5a
            return r8
        L5a:
            java.lang.Exception r5 = new java.lang.Exception     // Catch: java.lang.Throwable -> L68
            fdb r6 = r8.c     // Catch: java.lang.Throwable -> L68
            if (r6 == 0) goto L64
            java.lang.String r3 = r6.p()     // Catch: java.lang.Throwable -> L68
        L64:
            r5.<init>(r3)     // Catch: java.lang.Throwable -> L68
            throw r5     // Catch: java.lang.Throwable -> L68
        L68:
            r5 = move-exception
            ajb r6 = new ajb
            r6.<init>(r5)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.unsplash.data.UnsplashRepository.m68loadPhotos0E7RQCE(int, int, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /* JADX INFO: renamed from: searchPhotos-BWLJW6A, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object m69searchPhotosBWLJW6A(java.lang.String r9, int r10, int r11, defpackage.n92<? super defpackage.bjb> r12) {
        /*
            r8 = this;
            boolean r0 = r12 instanceof com.medium.android.unsplash.data.UnsplashRepository$searchPhotos$1
            if (r0 == 0) goto L14
            r0 = r12
            com.medium.android.unsplash.data.UnsplashRepository$searchPhotos$1 r0 = (com.medium.android.unsplash.data.UnsplashRepository$searchPhotos$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.label = r1
        L12:
            r6 = r0
            goto L1a
        L14:
            com.medium.android.unsplash.data.UnsplashRepository$searchPhotos$1 r0 = new com.medium.android.unsplash.data.UnsplashRepository$searchPhotos$1
            r0.<init>(r8, r12)
            goto L12
        L1a:
            java.lang.Object r12 = r6.result
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r6.label
            r2 = 1
            r7 = 0
            if (r1 == 0) goto L38
            if (r1 != r2) goto L32
            java.lang.Object r8 = r6.L$1
            com.medium.android.unsplash.data.UnsplashRepository r8 = (com.medium.android.unsplash.data.UnsplashRepository) r8
            java.lang.Object r8 = r6.L$0
            java.lang.String r8 = (java.lang.String) r8
            defpackage.br7.v(r12)     // Catch: java.lang.Throwable -> L74
            goto L57
        L32:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r7
        L38:
            defpackage.br7.v(r12)
            com.medium.android.unsplash.data.UnsplashApi r1 = r8.unsplashApi     // Catch: java.lang.Throwable -> L74
            r8 = r2
            java.lang.String r2 = "2f08fa33dd6005dbc760f22eff633a59a678b60d2285a80953cc534138fce3c2"
            r6.L$0 = r7     // Catch: java.lang.Throwable -> L74
            r6.L$1 = r7     // Catch: java.lang.Throwable -> L74
            r6.I$0 = r10     // Catch: java.lang.Throwable -> L74
            r6.I$1 = r11     // Catch: java.lang.Throwable -> L74
            r12 = 0
            r6.I$2 = r12     // Catch: java.lang.Throwable -> L74
            r6.label = r8     // Catch: java.lang.Throwable -> L74
            r3 = r9
            r4 = r10
            r5 = r11
            java.lang.Object r12 = r1.searchPhotos(r2, r3, r4, r5, r6)     // Catch: java.lang.Throwable -> L74
            if (r12 != r0) goto L57
            return r0
        L57:
            zcb r12 = (defpackage.zcb) r12     // Catch: java.lang.Throwable -> L74
            java.lang.Object r8 = r12.b     // Catch: java.lang.Throwable -> L74
            com.medium.android.unsplash.data.SearchResponse r8 = (com.medium.android.unsplash.data.SearchResponse) r8     // Catch: java.lang.Throwable -> L74
            adb r9 = r12.a     // Catch: java.lang.Throwable -> L74
            boolean r9 = r9.q     // Catch: java.lang.Throwable -> L74
            if (r9 == 0) goto L66
            if (r8 == 0) goto L66
            return r12
        L66:
            java.lang.Exception r8 = new java.lang.Exception     // Catch: java.lang.Throwable -> L74
            fdb r9 = r12.c     // Catch: java.lang.Throwable -> L74
            if (r9 == 0) goto L70
            java.lang.String r7 = r9.p()     // Catch: java.lang.Throwable -> L74
        L70:
            r8.<init>(r7)     // Catch: java.lang.Throwable -> L74
            throw r8     // Catch: java.lang.Throwable -> L74
        L74:
            r0 = move-exception
            r8 = r0
            ajb r9 = new ajb
            r9.<init>(r8)
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.unsplash.data.UnsplashRepository.m69searchPhotosBWLJW6A(java.lang.String, int, int, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX INFO: renamed from: trackDownload-gIAlu-s, reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object m70trackDownloadgIAlus(java.lang.String r7, defpackage.n92<? super defpackage.bjb> r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof com.medium.android.unsplash.data.UnsplashRepository$trackDownload$1
            if (r0 == 0) goto L13
            r0 = r8
            com.medium.android.unsplash.data.UnsplashRepository$trackDownload$1 r0 = (com.medium.android.unsplash.data.UnsplashRepository$trackDownload$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.label = r1
            goto L18
        L13:
            com.medium.android.unsplash.data.UnsplashRepository$trackDownload$1 r0 = new com.medium.android.unsplash.data.UnsplashRepository$trackDownload$1
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.result
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.label
            c1e r3 = defpackage.c1e.a
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L40
            if (r2 != r4) goto L3a
            java.lang.Object r6 = r0.L$3
            java.lang.String r6 = (java.lang.String) r6
            java.lang.Object r6 = r0.L$2
            android.net.Uri$Builder r6 = (android.net.Uri.Builder) r6
            java.lang.Object r6 = r0.L$1
            com.medium.android.unsplash.data.UnsplashRepository r6 = (com.medium.android.unsplash.data.UnsplashRepository) r6
            java.lang.Object r6 = r0.L$0
            java.lang.String r6 = (java.lang.String) r6
            defpackage.br7.v(r8)     // Catch: java.lang.Throwable -> L77
            goto L76
        L3a:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r5
        L40:
            defpackage.br7.v(r8)
            if (r7 != 0) goto L46
            return r3
        L46:
            android.net.Uri r7 = android.net.Uri.parse(r7)     // Catch: java.lang.Throwable -> L77
            android.net.Uri$Builder r7 = r7.buildUpon()     // Catch: java.lang.Throwable -> L77
            java.lang.String r8 = "client_id"
            java.lang.String r2 = "2f08fa33dd6005dbc760f22eff633a59a678b60d2285a80953cc534138fce3c2"
            r7.appendQueryParameter(r8, r2)     // Catch: java.lang.Throwable -> L77
            android.net.Uri r7 = r7.build()     // Catch: java.lang.Throwable -> L77
            java.lang.String r7 = r7.toString()     // Catch: java.lang.Throwable -> L77
            r7.getClass()     // Catch: java.lang.Throwable -> L77
            com.medium.android.unsplash.data.UnsplashApi r6 = r6.unsplashApi     // Catch: java.lang.Throwable -> L77
            r0.L$0 = r5     // Catch: java.lang.Throwable -> L77
            r0.L$1 = r5     // Catch: java.lang.Throwable -> L77
            r0.L$2 = r5     // Catch: java.lang.Throwable -> L77
            r0.L$3 = r5     // Catch: java.lang.Throwable -> L77
            r8 = 0
            r0.I$0 = r8     // Catch: java.lang.Throwable -> L77
            r0.label = r4     // Catch: java.lang.Throwable -> L77
            java.lang.Object r6 = r6.trackDownload(r7, r0)     // Catch: java.lang.Throwable -> L77
            if (r6 != r1) goto L76
            return r1
        L76:
            return r3
        L77:
            r6 = move-exception
            ajb r7 = new ajb
            r7.<init>(r6)
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.unsplash.data.UnsplashRepository.m70trackDownloadgIAlus(java.lang.String, n92):java.lang.Object");
    }
}
