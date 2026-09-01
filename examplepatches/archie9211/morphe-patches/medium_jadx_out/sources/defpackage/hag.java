package defpackage;

import com.google.android.gms.common.api.Status;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hag extends ihf {
    public final /* synthetic */ int f;
    public final /* synthetic */ wfd g;

    public /* synthetic */ hag(wfd wfdVar, int i) {
        this.f = i;
        this.g = wfdVar;
    }

    @Override // defpackage.ihf
    public final void m(Status status, o44 o44Var) {
        switch (this.f) {
            case 0:
                status.getClass();
                tp7.C(status, o44Var, this.g);
                break;
        }
    }

    @Override // defpackage.ihf
    public final void n(Status status, s16 s16Var) {
        switch (this.f) {
            case 0:
                break;
            default:
                status.getClass();
                tp7.C(status, s16Var, this.g);
                break;
        }
    }

    private final void o(Status status, o44 o44Var) {
    }

    private final void p(Status status, s16 s16Var) {
    }
}
