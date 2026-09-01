package defpackage;

import android.os.IInterface;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a66 extends ihf implements IInterface {
    public final /* synthetic */ int f;
    public final /* synthetic */ wfd g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a66(wfd wfdVar, int i) {
        super(7);
        this.f = i;
        this.g = wfdVar;
        attachInterface(this, "com.google.android.gms.identitycredentials.internal.IIdentityCredentialCallbacks");
    }
}
