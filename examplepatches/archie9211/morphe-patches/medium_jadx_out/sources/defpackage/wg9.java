package defpackage;

import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import com.medium.android.donkey.post.PostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class wg9 implements d7, k55 {
    public final /* synthetic */ PostFragment a;

    public wg9(PostFragment postFragment) {
        this.a = postFragment;
    }

    public final boolean equals(Object obj) {
        if ((obj instanceof d7) && (obj instanceof k55)) {
            return getFunctionDelegate().equals(((k55) obj).getFunctionDelegate());
        }
        return false;
    }

    public final int hashCode() {
        return getFunctionDelegate().hashCode();
    }

    @Override // defpackage.d7
    public final void onActivityResult(Object obj) {
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        wld.a.a("Audio notification permission granted: " + zBooleanValue, new Object[0]);
        if (zBooleanValue) {
            this.a.k1().z();
        }
    }

    @Override // defpackage.k55
    public final j55 getFunctionDelegate() {
        return new x55(1, 0, PostFragment.class, this.a, "onAudioNotificationPermissionResult", pUlNWdybf.FEQNcOO);
    }
}
