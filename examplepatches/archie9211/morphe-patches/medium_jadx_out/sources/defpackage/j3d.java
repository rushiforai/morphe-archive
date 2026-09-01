package defpackage;

import com.medium.android.donkey.susi.SusiActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class j3d implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ SusiActivity b;

    public /* synthetic */ j3d(SusiActivity susiActivity, int i) {
        this.a = i;
        this.b = susiActivity;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        SusiActivity susiActivity = this.b;
        switch (i) {
            case 0:
                return susiActivity.getDefaultViewModelProviderFactory();
            default:
                return susiActivity.getViewModelStore();
        }
    }
}
