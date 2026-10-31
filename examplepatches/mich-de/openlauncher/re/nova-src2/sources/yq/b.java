package yq;

import android.content.ComponentName;
import kotlin.jvm.internal.Intrinsics;
import w.j;
import w.k;

/* loaded from: classes4.dex */
public final class b extends k {
    @Override // w.k
    public final void onCustomTabsServiceConnected(ComponentName componentName, j jVar) {
        Intrinsics.g(componentName, "componentName");
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName name) {
        Intrinsics.g(name, "name");
    }
}
