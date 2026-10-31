package androidx.room;

import android.os.IInterface;
import android.os.RemoteCallbackList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class l extends RemoteCallbackList {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ MultiInstanceInvalidationService f15237a;

    public l(MultiInstanceInvalidationService multiInstanceInvalidationService) {
        this.f15237a = multiInstanceInvalidationService;
    }

    @Override // android.os.RemoteCallbackList
    public final void onCallbackDied(IInterface iInterface, Object cookie) {
        g callback = (g) iInterface;
        Intrinsics.g(callback, "callback");
        Intrinsics.g(cookie, "cookie");
        this.f15237a.f15199b.remove((Integer) cookie);
    }
}
