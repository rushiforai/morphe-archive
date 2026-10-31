package f10;

import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.SystemClock;
import androidx.fragment.app.m0;
import com.android.launcher3.LauncherProvider;
import com.google.android.exoplayer2.PlaybackException;
import com.google.android.exoplayer2.metadata.Metadata;
import com.google.android.gms.appset.AppSetIdInfo;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import com.stripe.android.challenge.confirmation.IntentConfirmationChallengeActivity;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView;
import com.teslacoilsw.launcher.preferences.fragments.SettingsBackup;
import com.tiktok.util.TTConst;
import e00.b4;
import e10.a3;
import e10.g2;
import f1.o0;
import fe.j1;
import fe.w0;
import fr.p0;
import fr.z;
import h6.g1;
import io.sentry.h2;
import io.sentry.h4;
import io.sentry.i2;
import io.sentry.j2;
import io.sentry.j4;
import io.sentry.l4;
import io.sentry.n0;
import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import kotlin.jvm.internal.Intrinsics;
import mx.g0;
import o9.f2;
import o9.v1;
import o9.z1;
import uy.e0;

/* loaded from: classes4.dex */
public final /* synthetic */ class o implements mb0.b, mb0.e, z1, wf.e, d9.i, j2, io.sentry.util.b, h2, fi.g, w60.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54200a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f54201b;

    public /* synthetic */ o(ge.a aVar, gf.m mVar, gf.r rVar, IOException iOException, boolean z11) {
        this.f54200a = 15;
        this.f54201b = rVar;
    }

    @Override // io.sentry.util.b
    public Object a() {
        return ((io.sentry.cache.b) this.f54201b).f67157a.getSerializer();
    }

    @Override // mb0.e
    public Object b(Object obj) {
        switch (this.f54200a) {
            case 1:
                return ((o0) this.f54201b).invoke(obj);
            default:
                return (Boolean) ((h00.f) this.f54201b).invoke(obj);
        }
    }

    @Override // o9.z1
    public void c(fa.p pVar) {
        int i5 = this.f54200a;
        Object obj = this.f54201b;
        switch (i5) {
            case 2:
                pVar.J((HashMap) obj);
                break;
            case 3:
                pVar.e((ya.v) obj);
                break;
            default:
                ComponentName componentName = ya.v.f97214a;
                ya.r rVar = new ya.r();
                ((Collection) obj).forEach(new ya.q(rVar, 1));
                pVar.e(new e0(rVar, 2));
                break;
        }
    }

    @Override // d9.i
    public void d(d9.c cVar) {
        SettingsBackup settingsBackup = (SettingsBackup) this.f54201b;
        Context context = g0.f77088a;
        LauncherProvider launcherProvider = g0.f77091d;
        if (launcherProvider == null) {
            Intrinsics.m("launcherProvider");
            throw null;
        }
        g2 g2Var = a3.f51435a;
        g2Var.f51545a.unregisterOnSharedPreferenceChangeListener(g2Var);
        SharedPreferences.Editor editorEdit = g2Var.f51545a.edit();
        String[] strArr = {"0", "1"};
        for (String str : g2Var.f51545a.getAll().keySet()) {
            if (!kotlin.collections.c.o0(str, strArr)) {
                editorEdit.remove(str);
            }
        }
        editorEdit.commit();
        f2 f2Var = launcherProvider.f20964a;
        if (f2Var != null) {
            f2Var.close();
        }
        m0 m0VarRequireActivity = settingsBackup.requireActivity();
        m0VarRequireActivity.getDatabasePath("nova.db").delete();
        m0VarRequireActivity.getDatabasePath("nova.db-journal").delete();
        m0VarRequireActivity.getDatabasePath("launcher.db").delete();
        m0VarRequireActivity.getDatabasePath("launcher.db-journal").delete();
        List list = v1.f80192a;
        m0VarRequireActivity.getDatabasePath("app_icons.db").delete();
        m0VarRequireActivity.getDatabasePath("app_icons.db-journal").delete();
        m0VarRequireActivity.getDatabasePath("saved_wallpaper_images.db").delete();
        m0VarRequireActivity.getDatabasePath("saved_wallpaper_images.db-journal").delete();
        m0VarRequireActivity.getDatabasePath("widgetpreviews.db").delete();
        m0VarRequireActivity.getDatabasePath("widgetpreviews.db-journal").delete();
        m0VarRequireActivity.getFileStreamPath("device-id").delete();
        m0VarRequireActivity.getFileStreamPath("wo").delete();
        m0VarRequireActivity.getFileStreamPath("downgrade_schema.json").delete();
        File file = new File(m0VarRequireActivity.getDataDir(), "shared_prefs/");
        new File(file, "com.teslacoilsw.launcher_preferences.xml").delete();
        new File(file, "com.android.launcher3.device.prefs.xml").delete();
        new File(file, "com.android.launcher3.prefs.xml").delete();
        new File(file, "preferences.SettingsActivity.xml").delete();
        SystemClock.sleep(200L);
        System.exit(0);
        throw new RuntimeException("System.exit returned normally, while it was supposed to halt JVM.");
    }

    @Override // io.sentry.h2
    public void e(fl.l lVar) {
        io.sentry.m0 m0Var = (io.sentry.m0) this.f54201b;
        fl.l lVar2 = new fl.l(16);
        i2 i2Var = (i2) m0Var;
        i2Var.f67311p = lVar2;
        j4 j4Var = new j4((io.sentry.protocol.u) lVar2.f55376d, (l4) lVar2.f55374b, CarrierConfigurator.APN_TYPE, null, null);
        j4Var.f67360i = TTConst.TRACK_TYPE_AUTO;
        Iterator<n0> it = i2Var.f67306i.getScopeObservers().iterator();
        while (it.hasNext()) {
            io.sentry.cache.f fVar = (io.sentry.cache.f) it.next();
            fVar.getClass();
            fVar.b(new androidx.fragment.app.d(21, fVar, j4Var, i2Var));
        }
    }

    public void f(iq.a aVar) {
        iq.n nVar = (iq.n) ((IntentConfirmationChallengeActivity) this.f54201b).f42489p.getValue();
        t70.m0.t(g1.f(nVar), null, null, new com.stripe.android.challenge.confirmation.d(nVar, aVar, null), 3);
    }

    @Override // w60.a
    public Object get() {
        z zVar;
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) ((p0) this.f54201b).f55681a).getActiveNetworkInfo();
        if (activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
            return null;
        }
        int type = activeNetworkInfo.getType();
        if (type == 0) {
            switch (activeNetworkInfo.getSubtype()) {
                case 1:
                case 2:
                case 4:
                case 7:
                case 11:
                case 16:
                    zVar = z.f55716c;
                    break;
                case 3:
                case 5:
                case 6:
                case 8:
                case 9:
                case 10:
                case 12:
                case 14:
                case 15:
                case 17:
                    zVar = z.f55717d;
                    break;
                case 13:
                case 18:
                case 19:
                    zVar = z.f55718e;
                    break;
                case 20:
                    zVar = z.f55719f;
                    break;
                default:
                    zVar = z.f55720g;
                    break;
            }
        } else {
            zVar = type != 1 ? z.f55720g : z.f55715b;
        }
        return zVar.f55722a;
    }

    @Override // wf.e
    public void invoke(Object obj) {
        switch (this.f54200a) {
            case 5:
                ((j1) obj).onMediaMetadataChanged((w0) this.f54201b);
                break;
            case 6:
                ((j1) obj).onTrackSelectionParametersChanged((tf.u) this.f54201b);
                break;
            case 7:
                ((j1) obj).onCues((jf.c) this.f54201b);
                break;
            case 8:
                ((j1) obj).onMediaMetadataChanged(((fe.x) this.f54201b).f55061a.P);
                break;
            case 9:
                ((j1) obj).onMetadata((Metadata) this.f54201b);
                break;
            case 10:
                ((j1) obj).onDeviceInfoChanged((fe.j) this.f54201b);
                break;
            case 11:
            default:
                gf.r rVar = (gf.r) this.f54201b;
                ge.k kVar = (ge.k) ((ge.b) obj);
                kVar.getClass();
                kVar.f57436v = rVar.f57609a;
                break;
            case 12:
                ((ge.k) ((ge.b) obj)).n = (PlaybackException) this.f54201b;
                break;
            case 13:
                ie.e eVar = (ie.e) this.f54201b;
                ge.k kVar2 = (ge.k) ((ge.b) obj);
                kVar2.f57438x += eVar.f61573g;
                kVar2.f57439y += eVar.f61571e;
                break;
            case 14:
                ((ge.b) obj).getClass();
                break;
        }
    }

    @Override // io.sentry.j2
    public void j(io.sentry.m0 m0Var) {
        h4 h4Var;
        switch (this.f54200a) {
            case 21:
                io.sentry.android.core.m0 m0Var2 = (io.sentry.android.core.m0) this.f54201b;
                if (m0Var2.f66990a.get() != 0 || (h4Var = ((i2) m0Var).f67307j) == null) {
                    return;
                }
                Date date = h4Var.f67259a;
                if ((date == null ? null : (Date) date.clone()) != null) {
                    AtomicLong atomicLong = m0Var2.f66990a;
                    Date date2 = h4Var.f67259a;
                    atomicLong.set((date2 != null ? (Date) date2.clone() : null).getTime());
                    m0Var2.f66991b.set(true);
                    return;
                }
                return;
            case 22:
                AtomicBoolean atomicBoolean = (AtomicBoolean) this.f54201b;
                h4 h4Var2 = ((i2) m0Var).f67307j;
                if (h4Var2 != null) {
                    Date date3 = h4Var2.f67259a;
                    if ((date3 == null ? null : (Date) date3.clone()) != null) {
                        atomicBoolean.set(true);
                        return;
                    }
                    return;
                }
                return;
            default:
                io.sentry.android.core.internal.gestures.e eVar = (io.sentry.android.core.internal.gestures.e) this.f54201b;
                eVar.getClass();
                i2 i2Var = (i2) m0Var;
                synchronized (i2Var.f67309l) {
                    if (i2Var.f67298a == eVar.f66912e) {
                        ((i2) m0Var).a();
                    }
                }
                return;
        }
    }

    @Override // fi.g
    public void onSuccess(Object obj) {
        switch (this.f54200a) {
            case 27:
                com.vungle.ads.internal.platform.c.a((com.vungle.ads.internal.platform.c) this.f54201b, (AppSetIdInfo) obj);
                break;
            default:
                ((j5.c) this.f54201b).invoke(obj);
                break;
        }
    }

    public /* synthetic */ o(ge.a aVar, Object obj, int i5) {
        this.f54200a = i5;
        this.f54201b = obj;
    }

    public /* synthetic */ o(ge.a aVar, Object obj, long j11) {
        this.f54200a = 14;
        this.f54201b = obj;
    }

    public /* synthetic */ o(Object obj, int i5) {
        this.f54200a = i5;
        this.f54201b = obj;
    }

    @Override // mb0.b
    /* renamed from: b */
    public void mo5b(Object obj) {
        int i5 = this.f54200a;
        Object obj2 = this.f54201b;
        switch (i5) {
            case 0:
                int i11 = FancyPrefView.J;
                ((n) obj2).invoke(obj);
                break;
            default:
                ((b4) obj2).invoke(obj);
                break;
        }
    }
}
