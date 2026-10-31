package a10;

import android.content.ComponentName;
import android.content.Context;
import android.os.Build;
import androidx.compose.ui.platform.AndroidComposeView;
import c3.n;
import com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver;
import com.google.firebase.crashlytics.internal.concurrency.CrashlyticsWorker;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.preferences.AdaptiveIconSettingsActivity;
import com.vungle.ads.internal.AnalyticsClient;
import e10.a3;
import e10.g2;
import h6.c1;
import ka.c;
import kotlin.Unit;
import mx.g0;
import z.j0;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f105a;

    public /* synthetic */ a(int i5) {
        this.f105a = i5;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f105a) {
            case 0:
                Context context = g0.f77088a;
                g0.b();
                return;
            case 1:
                int i5 = AlarmManagerSchedulerBroadcastReceiver.f31432a;
                return;
            case 2:
                synchronized (AndroidComposeView.composeViews) {
                    try {
                        int i11 = 0;
                        if (Build.VERSION.SDK_INT < 30) {
                            j0 j0Var = AndroidComposeView.composeViews;
                            Object[] objArr = j0Var.f97840a;
                            int i12 = j0Var.f97841b;
                            while (i11 < i12) {
                                AndroidComposeView androidComposeView = (AndroidComposeView) objArr[i11];
                                boolean showLayoutBounds = androidComposeView.getShowLayoutBounds();
                                AndroidComposeView.Companion.getClass();
                                androidComposeView.setShowLayoutBounds(n.a());
                                if (showLayoutBounds != androidComposeView.getShowLayoutBounds()) {
                                    androidComposeView.invalidateDescendants();
                                }
                                i11++;
                            }
                        } else {
                            j0 j0Var2 = AndroidComposeView.composeViews;
                            Object[] objArr2 = j0Var2.f97840a;
                            int i13 = j0Var2.f97841b;
                            while (i11 < i13) {
                                ((AndroidComposeView) objArr2[i11]).invalidateDescendants();
                                i11++;
                            }
                        }
                        Unit unit = Unit.f71706a;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return;
            case 3:
                AnalyticsClient.a();
                return;
            case 4:
                CrashlyticsWorker.lambda$await$6();
                return;
            case 5:
                int i14 = AdaptiveIconSettingsActivity.C;
                Context context2 = g0.f77088a;
                g0.b();
                return;
            case 6:
                int i15 = c.M;
                return;
            case 7:
                ComponentName componentName = NovaLauncher.f45646r1;
                a3.f51435a.f51545a.edit().remove("show_nova_whatsnew").apply();
                return;
            case 8:
                NovaLauncher novaLauncher = NovaLauncher.f45649u1;
                if (novaLauncher == null || !novaLauncher.f79929s) {
                    return;
                }
                g0.b();
                return;
            default:
                g2 g2Var = a3.f51435a;
                if (g2Var.f51545a.getLong("launcher_chooser_opened_at", 0L) > 0) {
                    zy.c cVar = zy.c.f98823a;
                    c1.A("reason", "no_response", "launcher_error");
                    g2Var.f51545a.edit().remove("launcher_chooser_opened_at").remove("launcher_chooser_location").remove("launcher_chooser_type").apply();
                    return;
                }
                return;
        }
    }
}
