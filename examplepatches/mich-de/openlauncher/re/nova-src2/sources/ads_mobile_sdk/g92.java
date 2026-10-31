package ads_mobile_sdk;

import android.app.Activity;
import android.content.ComponentName;
import android.net.Uri;
import android.os.RemoteException;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g92 extends w.k {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ m92 f3736a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Activity f3737b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Uri f3738c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f3739d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Map f3740e;

    public g92(m92 m92Var, Activity activity, Uri uri, String str, Map map) {
        this.f3736a = m92Var;
        this.f3737b = activity;
        this.f3738c = uri;
        this.f3739d = str;
        this.f3740e = map;
    }

    @Override // w.k
    public final void onCustomTabsServiceConnected(ComponentName name, w.j jVar) {
        Intrinsics.g(name, "name");
        try {
            jVar.f93398a.warmup(0L);
        } catch (RemoteException unused) {
        }
        this.f3736a.a(jVar.c(null), this.f3737b, this.f3738c, this.f3739d, this.f3740e);
        this.f3737b.unbindService(this);
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName name) {
        Intrinsics.g(name, "name");
    }
}
