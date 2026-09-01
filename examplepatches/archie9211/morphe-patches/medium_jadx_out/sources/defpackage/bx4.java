package defpackage;

import android.app.PendingIntent;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.following.FollowingFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bx4 implements dx4 {
    public final /* synthetic */ FollowingFragment a;

    public bx4(FollowingFragment followingFragment) {
        this.a = followingFragment;
    }

    @Override // defpackage.dx4
    public final void a() {
        k40.X(this.a).f();
    }

    @Override // defpackage.dx4
    public final void b(String str, String str2) {
        str.getClass();
        FollowingFragment followingFragment = this.a;
        ((p13) followingFragment.Z()).Q(followingFragment.S(), str, str2);
    }

    @Override // defpackage.dx4
    public final void c(String str, String str2) {
        str.getClass();
        FollowingFragment followingFragment = this.a;
        ((p13) followingFragment.Z()).y(followingFragment.S(), new PublicationReference.Id(str), str2, PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.dx4
    public final void d(String str) throws PendingIntent.CanceledException {
        FollowingFragment followingFragment = this.a;
        ((p13) followingFragment.Z()).i(followingFragment.S(), str);
    }
}
