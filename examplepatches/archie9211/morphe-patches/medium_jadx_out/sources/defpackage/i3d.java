package defpackage;

import com.medium.android.donkey.susi.SusiActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class i3d extends dq8 {
    public final /* synthetic */ db8 d;
    public final /* synthetic */ SusiActivity e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i3d(db8 db8Var, SusiActivity susiActivity) {
        super(true);
        this.d = db8Var;
        this.e = susiActivity;
    }

    @Override // defpackage.dq8
    public final void b() {
        if (this.d.f()) {
            return;
        }
        this.e.finish();
    }
}
