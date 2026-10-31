package g30;

import android.app.WallpaperManager;
import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Context;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.content.pm.PermissionInfo;
import android.os.Handler;
import android.os.StrictMode;
import android.util.Pair;
import androidx.recyclerview.widget.u1;
import com.teslacoilsw.launcher.wallpaper.compat.WallpaperManagerCompatVL$ColorExtractionService;
import java.util.ArrayList;
import o9.g3;

/* loaded from: classes4.dex */
public final class h extends f {

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f57037c = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    public final Context f57038d;

    /* renamed from: e, reason: collision with root package name */
    public c f57039e;

    public h(Context context) {
        int iIntValue;
        this.f57038d = context;
        StrictMode.ThreadPolicy threadPolicy = StrictMode.getThreadPolicy();
        StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder(threadPolicy).permitDiskReads().permitDiskWrites().build());
        try {
            String string = g3.j(this.f57038d).getString("wallpaper_parsed_colors", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            StrictMode.setThreadPolicy(threadPolicy);
            if (string.startsWith("1,")) {
                Pair pairG = g(string);
                iIntValue = ((Integer) pairG.first).intValue();
                this.f57039e = (c) pairG.second;
            } else {
                iIntValue = -1;
            }
            if (iIntValue == -1 || iIntValue != ((WallpaperManager) context.getSystemService(WallpaperManager.class)).getWallpaperId(1)) {
                h();
            }
            context.registerReceiver(new g(this, 0), new IntentFilter("android.intent.action.WALLPAPER_CHANGED"));
            String str = null;
            try {
                for (PermissionInfo permissionInfo : context.getPackageManager().getPackageInfo(context.getPackageName(), u1.FLAG_APPEARED_IN_PRE_LAYOUT).permissions) {
                    if ((permissionInfo.protectionLevel & 2) != 0) {
                        str = permissionInfo.name;
                    }
                }
            } catch (PackageManager.NameNotFoundException unused) {
            }
            this.f57038d.registerReceiver(new g(this, 1), new IntentFilter("com.android.launcher3.uioverrides.dynamicui.WallpaperManagerCompatVL.EXTRACTION_COMPLETE"), str, new Handler());
        } catch (Throwable th2) {
            StrictMode.setThreadPolicy(threadPolicy);
            throw th2;
        }
    }

    public static Pair g(String str) {
        String[] strArrSplit = str.split(",");
        Integer numValueOf = Integer.valueOf(Integer.parseInt(strArrSplit[1]));
        if (strArrSplit.length == 2) {
            return Pair.create(numValueOf, null);
        }
        return Pair.create(numValueOf, new c(strArrSplit.length > 2 ? Integer.parseInt(strArrSplit[2]) : 0, strArrSplit.length > 3 ? Integer.parseInt(strArrSplit[3]) : 0, strArrSplit.length > 4 ? Integer.parseInt(strArrSplit[4]) : 0, 0));
    }

    @Override // g30.f
    public final void a(d dVar) {
        this.f57037c.add(dVar);
    }

    @Override // g30.f
    public final c c() {
        return this.f57039e;
    }

    @Override // g30.f
    public final void e(d dVar) {
        this.f57037c.remove(dVar);
    }

    public final void h() {
        Context context = this.f57038d;
        ((JobScheduler) context.getSystemService("jobscheduler")).schedule(new JobInfo.Builder(1, new ComponentName(context, (Class<?>) WallpaperManagerCompatVL$ColorExtractionService.class)).setMinimumLatency(0L).build());
    }
}
