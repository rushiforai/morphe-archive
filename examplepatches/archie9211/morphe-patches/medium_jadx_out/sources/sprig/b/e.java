package sprig.b;

import com.userleap.SprigLoggingLevel;
import defpackage.ajb;
import defpackage.cu1;
import defpackage.d46;
import defpackage.ka1;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\b\bÀ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\r\u0010\u000eJ\u000e\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00070\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\tR\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00070\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\t¨\u0006\u000f"}, d2 = {"Lsprig/b/e;", "", "Lsprig/b/k;", "versionProvider", "", "shouldDisableSprig", "", "", "a", "Ljava/util/List;", "unsupportedChromeVersions", "b", "browserPackageNames", "<init>", "()V", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class e {
    public static final e INSTANCE = new e();

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public static final List unsupportedChromeVersions = d46.Q("89.0.4389.90");

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public static final List browserPackageNames = d46.R("com.google.android.webview", "com.android.chrome");

    private e() {
    }

    public final boolean shouldDisableSprig(k versionProvider) {
        Object ajbVar;
        versionProvider.getClass();
        b.sendVerboseLoggingEvent$default(b.INSTANCE, "Checking if Sprig can support this device.", null, 0, 6, null);
        List list = browserPackageNames;
        ArrayList<String> arrayList = new ArrayList(cu1.k0(list, 10));
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            try {
                ajbVar = versionProvider.getVersionName((String) it2.next());
            } catch (Throwable th) {
                ajbVar = new ajb(th);
            }
            if (ajbVar instanceof ajb) {
                ajbVar = null;
            }
            arrayList.add((String) ajbVar);
        }
        for (String str : arrayList) {
            if (str != null) {
                b bVar = b.INSTANCE;
                List list2 = unsupportedChromeVersions;
                b.sendVerboseLoggingEvent$default(bVar, "Checking for " + str + " in " + list2, null, 1, 2, null);
                if (list2.contains(str)) {
                    bVar.sendVerboseLoggingEvent(ka1.s("Found ", str, " in ", ".", list2), SprigLoggingLevel.CRITICAL, 1);
                    return true;
                }
            }
        }
        return false;
    }
}
