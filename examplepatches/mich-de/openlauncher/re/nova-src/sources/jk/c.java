package jk;

import android.content.Context;
import android.content.IntentFilter;
import android.os.Process;
import java.util.HashSet;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final Context f69574a;

    public c(Context context) {
        ("UID: [" + Process.myUid() + "]  PID: [" + Process.myPid() + "] ").getClass();
        new IntentFilter("com.google.android.play.core.install.ACTION_INSTALL_STATUS");
        new HashSet();
        Context applicationContext = context.getApplicationContext();
        this.f69574a = applicationContext != null ? applicationContext : context;
    }
}
