package defpackage;

import android.media.session.MediaSessionManager;
import android.text.TextUtils;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class xm7 extends wm7 {
    @Override // defpackage.wm7
    public final an7 c() {
        MediaSessionManager.RemoteUserInfo currentControllerInfo = this.a.getCurrentControllerInfo();
        an7 an7Var = new an7();
        String packageName = currentControllerInfo.getPackageName();
        if (packageName == null) {
            z72.c("package shouldn't be null");
            return null;
        }
        if (TextUtils.isEmpty(packageName)) {
            ay0.e("packageName should be nonempty");
            return null;
        }
        an7Var.a = new cn7(currentControllerInfo.getPackageName(), currentControllerInfo.getPid(), currentControllerInfo.getUid());
        return an7Var;
    }

    @Override // defpackage.wm7
    public final void d(an7 an7Var) {
    }
}
