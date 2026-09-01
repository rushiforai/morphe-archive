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
@uv2(c = "com.medium.android.unsplash.data.UnsplashRepository", f = "UnsplashRepository.kt", l = {10}, m = "loadPhotos-0E7RQCE", v = 1)
public final class UnsplashRepository$loadPhotos$1 extends p92 {
    int I$0;
    int I$1;
    int I$2;
    Object L$0;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ UnsplashRepository this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UnsplashRepository$loadPhotos$1(UnsplashRepository unsplashRepository, n92<? super UnsplashRepository$loadPhotos$1> n92Var) {
        super(n92Var);
        this.this$0 = unsplashRepository;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM68loadPhotos0E7RQCE = this.this$0.m68loadPhotos0E7RQCE(0, 0, this);
        return objM68loadPhotos0E7RQCE == tb2.COROUTINE_SUSPENDED ? objM68loadPhotos0E7RQCE : new bjb(objM68loadPhotos0E7RQCE);
    }
}
