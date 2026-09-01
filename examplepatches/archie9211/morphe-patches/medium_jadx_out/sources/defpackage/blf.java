package defpackage;

import java.util.concurrent.CountDownLatch;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class blf implements kr8, br8, kq8, xq8 {
    public final CountDownLatch a;

    public /* synthetic */ blf() {
        this.a = new CountDownLatch(1);
    }

    @Override // defpackage.xq8
    public void N(jrg jrgVar) {
        this.a.countDown();
    }

    @Override // defpackage.kq8
    public void a() {
        this.a.countDown();
    }

    @Override // defpackage.kr8
    public void i(Object obj) {
        this.a.countDown();
    }

    @Override // defpackage.br8
    public void onFailure(Exception exc) {
        this.a.countDown();
    }
}
