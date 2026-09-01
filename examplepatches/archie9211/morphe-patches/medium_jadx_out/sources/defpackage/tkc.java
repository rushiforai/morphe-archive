package defpackage;

import android.os.StatFs;
import android.webkit.CookieManager;
import com.medium.stats.ui.user.UserStatsTab;
import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class tkc implements m45 {
    public final /* synthetic */ int a;

    public /* synthetic */ tkc(int i) {
        this.a = i;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = 0;
        switch (i) {
            case 0:
                return ukc.d;
            case 1:
                return c1eVar;
            case 2:
                return new vj3(0.0f);
            case 3:
            case 4:
                return null;
            case 5:
                return syd.a;
            case 6:
                return qyd.a;
            case 7:
                return new k46(0L);
            case 8:
                return new k46(0L);
            case 9:
                return o23.a;
            case 10:
                return new lyd();
            case 11:
                return new myd(null, null, 16383);
            case 12:
                return qo7.u(new uid("", 4, bkd.b));
            case 13:
                return qo7.u(new atb(new uid((String) null, 7, 0L), false, false));
            case 14:
            case 15:
                return c1eVar;
            case 16:
                return new g49(0.0f);
            case 17:
                return Integer.valueOf(((t0) UserStatsTab.getEntries()).getSize());
            case 18:
                ig6 ig6Var = ch4.a;
                g59 g59VarE = ch4.b.e("coil3_disk_cache");
                long jW = 10485760;
                try {
                    File file = g59VarE.toFile();
                    file.mkdir();
                    StatFs statFs = new StatFs(file.getAbsolutePath());
                    jW = iq7.w((long) (0.02d * statFs.getBlockSizeLong() * statFs.getBlockCountLong()), 10485760L, 262144000L);
                    break;
                } catch (Exception unused) {
                }
                return new gva(jW, ig6Var, g59VarE);
            case 19:
                try {
                    return CookieManager.getInstance();
                } catch (Exception e) {
                    wld.a.e(e, "An error occurred while trying to get CookieManager instance.", new Object[0]);
                    return null;
                }
            case 20:
                return new xsa(i2);
            default:
                throw new IllegalStateException("Expedited WorkRequests require a Worker to provide an implementation for `getForegroundInfo()`");
        }
    }
}
