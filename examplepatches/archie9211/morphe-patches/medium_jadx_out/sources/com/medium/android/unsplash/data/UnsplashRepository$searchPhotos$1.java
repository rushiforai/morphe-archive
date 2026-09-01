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
@uv2(c = "com.medium.android.unsplash.data.UnsplashRepository", f = "UnsplashRepository.kt", l = {25}, m = "searchPhotos-BWLJW6A", v = 1)
public final class UnsplashRepository$searchPhotos$1 extends p92 {
    int I$0;
    int I$1;
    int I$2;
    Object L$0;
    Object L$1;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ UnsplashRepository this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UnsplashRepository$searchPhotos$1(UnsplashRepository unsplashRepository, n92<? super UnsplashRepository$searchPhotos$1> n92Var) {
        super(n92Var);
        this.this$0 = unsplashRepository;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM69searchPhotosBWLJW6A = this.this$0.m69searchPhotosBWLJW6A(null, 0, 0, this);
        return objM69searchPhotosBWLJW6A == tb2.COROUTINE_SUSPENDED ? objM69searchPhotosBWLJW6A : new bjb(objM69searchPhotosBWLJW6A);
    }
}
