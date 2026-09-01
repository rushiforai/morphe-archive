package defpackage;

import android.os.Bundle;
import android.os.IInterface;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nhf extends ihf implements IInterface {
    public final wfd f;
    public final /* synthetic */ phf g;
    public final /* synthetic */ int h;
    public final jif i;
    public final /* synthetic */ phf j;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public nhf(phf phfVar, wfd wfdVar, int i) {
        this(phfVar, wfdVar, (byte) 0);
        this.h = i;
        switch (i) {
            case 1:
                this.j = phfVar;
                this(phfVar, wfdVar, (byte) 0);
                this.i = new jif("OnWarmUpIntegrityTokenCallback");
                break;
            default:
                this.j = phfVar;
                this.i = new jif("OnRequestIntegrityTokenCallback");
                break;
        }
    }

    public final void o(Bundle bundle) {
        this.g.e.c(this.f);
    }

    public final void p(Bundle bundle) {
        this.g.e.c(this.f);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nhf(phf phfVar, wfd wfdVar, byte b) {
        super(0);
        this.g = phfVar;
        attachInterface(this, "com.google.android.play.core.integrity.protocol.IExpressIntegrityServiceCallback");
        this.f = wfdVar;
    }
}
