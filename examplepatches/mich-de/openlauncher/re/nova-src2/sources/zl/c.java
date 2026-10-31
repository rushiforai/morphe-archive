package zl;

import android.os.Bundle;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;

/* loaded from: classes.dex */
public final class c implements zh.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ d f98569a;

    public c(d dVar) {
        this.f98569a = dVar;
    }

    @Override // ai.d2
    public final void a(String str, String str2, Bundle bundle, long j11) {
        if (str == null || a.f98562a.contains(str2)) {
            return;
        }
        Bundle bundle2 = new Bundle();
        bundle2.putString(PendingUpgradeStore.KEY_NAME, str2);
        bundle2.putLong("timestampInMillis", j11);
        bundle2.putBundle("params", bundle);
        ((yl.b) this.f98569a.f98570a).onMessageTriggered(3, bundle2);
    }
}
