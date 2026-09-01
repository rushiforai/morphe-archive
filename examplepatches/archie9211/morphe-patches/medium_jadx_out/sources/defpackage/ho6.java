package defpackage;

import com.medium.android.donkey.launcher.LauncherActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ho6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ LauncherActivity b;

    public /* synthetic */ ho6(LauncherActivity launcherActivity, int i) {
        this.a = i;
        this.b = launcherActivity;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        LauncherActivity launcherActivity = this.b;
        switch (i) {
            case 0:
                return launcherActivity.getDefaultViewModelProviderFactory();
            case 1:
                return launcherActivity.getViewModelStore();
            default:
                return launcherActivity.getDefaultViewModelCreationExtras();
        }
    }
}
