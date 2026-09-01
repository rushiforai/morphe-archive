package com.medium.android.unsplash.data;

import defpackage.f8a;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class UnsplashRepository_Factory implements f8a {
    private final f8a unsplashApiProvider;

    private UnsplashRepository_Factory(f8a f8aVar) {
        this.unsplashApiProvider = f8aVar;
    }

    public static UnsplashRepository_Factory create(f8a f8aVar) {
        return new UnsplashRepository_Factory(f8aVar);
    }

    public static UnsplashRepository newInstance(UnsplashApi unsplashApi) {
        return new UnsplashRepository(unsplashApi);
    }

    @Override // defpackage.g8a
    public final UnsplashRepository get() {
        return new UnsplashRepository((UnsplashApi) this.unsplashApiProvider.get());
    }
}
