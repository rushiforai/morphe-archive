package defpackage;

import com.medium.android.donkey.main.MainActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class df7 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ MainActivity b;

    public /* synthetic */ df7(MainActivity mainActivity, int i) {
        this.a = i;
        this.b = mainActivity;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        MainActivity mainActivity = this.b;
        switch (i) {
            case 0:
                return mainActivity.getViewModelStore();
            default:
                return mainActivity.getDefaultViewModelCreationExtras();
        }
    }
}
