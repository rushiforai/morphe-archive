package sprig.b;

import android.content.Context;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\b\u001a\u00020\u0005¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u0004\u001a\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0002H\u0016R\u0014\u0010\b\u001a\u00020\u00058\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007¨\u0006\u000b"}, d2 = {"Lsprig/b/l;", "Lsprig/b/k;", "", "packageName", "getVersionName", "Landroid/content/Context;", "a", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class l implements k {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final Context context;

    public l(Context context) {
        context.getClass();
        this.context = context;
    }

    @Override // sprig.b.k
    public String getVersionName(String packageName) {
        packageName.getClass();
        String str = this.context.getPackageManager().getPackageInfo(packageName, 0).versionName;
        str.getClass();
        return str;
    }
}
