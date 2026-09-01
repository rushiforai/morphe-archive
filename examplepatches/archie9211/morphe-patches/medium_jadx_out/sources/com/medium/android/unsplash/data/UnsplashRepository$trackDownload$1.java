package com.medium.android.unsplash.data;

import defpackage.bjb;
import defpackage.n92;
import defpackage.p92;
import defpackage.tb2;
import defpackage.uv2;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
@uv2(c = "com.medium.android.unsplash.data.UnsplashRepository", f = "UnsplashRepository.kt", l = {46}, m = "trackDownload-gIAlu-s", v = 1)
public final class UnsplashRepository$trackDownload$1 extends p92 {
    int I$0;
    Object L$0;
    Object L$1;
    Object L$2;
    Object L$3;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ UnsplashRepository this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UnsplashRepository$trackDownload$1(UnsplashRepository unsplashRepository, n92<? super UnsplashRepository$trackDownload$1> n92Var) {
        super(n92Var);
        this.this$0 = unsplashRepository;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM70trackDownloadgIAlus = this.this$0.m70trackDownloadgIAlus(null, this);
        return objM70trackDownloadgIAlus == tb2.COROUTINE_SUSPENDED ? objM70trackDownloadgIAlus : new bjb(objM70trackDownloadgIAlus);
    }
}
