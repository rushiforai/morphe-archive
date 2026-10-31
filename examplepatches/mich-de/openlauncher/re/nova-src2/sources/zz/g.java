package zz;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.media.MediaMetadata;
import android.media.MediaRouter;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.MediaSessionManager;
import android.media.session.PlaybackState;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.service.notification.StatusBarNotification;
import com.teslacoilsw.launcher.notificationlistener.NotificationListener;
import e20.r;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import kotlin.LazyKt;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import mx.d0;
import p1.v1;
import v70.w;
import x7.n;
import ya.j;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final Context f98842a;

    /* renamed from: b, reason: collision with root package name */
    public final String f98843b;

    /* renamed from: c, reason: collision with root package name */
    public final MediaSessionManager f98844c;

    /* renamed from: d, reason: collision with root package name */
    public final c f98845d;

    /* renamed from: e, reason: collision with root package name */
    public MediaController f98846e;

    /* renamed from: f, reason: collision with root package name */
    public final LinkedHashSet f98847f;

    /* renamed from: g, reason: collision with root package name */
    public final r f98848g;

    /* renamed from: h, reason: collision with root package name */
    public final a70.d f98849h;

    /* renamed from: i, reason: collision with root package name */
    public final b f98850i;

    /* renamed from: j, reason: collision with root package name */
    public final a70.d f98851j;

    /* renamed from: k, reason: collision with root package name */
    public final b f98852k;

    /* renamed from: l, reason: collision with root package name */
    public final a70.d f98853l;

    /* renamed from: m, reason: collision with root package name */
    public final e f98854m;
    public final a70.d n;
    public volatile String o;

    /* renamed from: p, reason: collision with root package name */
    public volatile boolean f98855p;

    /* JADX WARN: Type inference failed for: r2v0, types: [zz.b] */
    /* JADX WARN: Type inference failed for: r2v3, types: [zz.b] */
    /* JADX WARN: Type inference failed for: r6v6, types: [zz.c] */
    public g(Context context, o7.a aVar, n nVar) {
        Object objA;
        this.f98842a = context.getApplicationContext();
        this.f98843b = context.getPackageName();
        Object systemService = context.getSystemService((Class<Object>) MediaSessionManager.class);
        Intrinsics.d(systemService);
        this.f98844c = (MediaSessionManager) systemService;
        this.f98845d = new MediaSessionManager.OnActiveSessionsChangedListener() { // from class: zz.c
            @Override // android.media.session.MediaSessionManager.OnActiveSessionsChangedListener
            public final void onActiveSessionsChanged(List list) {
                ((yz.a) this.f98838a.f98853l.getValue()).a();
            }
        };
        f fVar = new f(this);
        this.f98847f = new LinkedHashSet();
        final int i5 = 2;
        a70.d dVarA = LazyKt.a(new d0(context, i5));
        this.f98849h = dVarA;
        final int i11 = 1;
        this.f98850i = new Runnable(this) { // from class: zz.b

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ g f98837b;

            {
                this.f98837b = this;
            }

            @Override // java.lang.Runnable
            public final void run() {
                switch (i11) {
                    case 0:
                        g gVar = this.f98837b;
                        try {
                            if (!gVar.f98855p) {
                                gVar.o = ((SharedPreferences) gVar.n.getValue()).getString("key_dismissed_media_session", null);
                                gVar.f98855p = true;
                                break;
                            }
                        } catch (Exception unused) {
                            return;
                        }
                        break;
                    case 1:
                        g gVar2 = this.f98837b;
                        a00.b bVarA = gVar2.a();
                        Iterator it = gVar2.f98847f.iterator();
                        while (it.hasNext()) {
                            ((w) ((d) it.next()).f98839a).j(bVarA);
                        }
                        break;
                    default:
                        this.f98837b.d();
                        break;
                }
            }
        };
        this.f98851j = LazyKt.a(new Function0(this) { // from class: zz.a

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ g f98835b;

            {
                this.f98835b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i11) {
                    case 0:
                        return new yz.a(this.f98835b.f98852k);
                    default:
                        return new yz.a(this.f98835b.f98850i, 400L);
                }
            }
        });
        this.f98852k = new Runnable(this) { // from class: zz.b

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ g f98837b;

            {
                this.f98837b = this;
            }

            @Override // java.lang.Runnable
            public final void run() {
                switch (i5) {
                    case 0:
                        g gVar = this.f98837b;
                        try {
                            if (!gVar.f98855p) {
                                gVar.o = ((SharedPreferences) gVar.n.getValue()).getString("key_dismissed_media_session", null);
                                gVar.f98855p = true;
                                break;
                            }
                        } catch (Exception unused) {
                            return;
                        }
                        break;
                    case 1:
                        g gVar2 = this.f98837b;
                        a00.b bVarA = gVar2.a();
                        Iterator it = gVar2.f98847f.iterator();
                        while (it.hasNext()) {
                            ((w) ((d) it.next()).f98839a).j(bVarA);
                        }
                        break;
                    default:
                        this.f98837b.d();
                        break;
                }
            }
        };
        final int i12 = 0;
        this.f98853l = LazyKt.a(new Function0(this) { // from class: zz.a

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ g f98835b;

            {
                this.f98835b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i12) {
                    case 0:
                        return new yz.a(this.f98835b.f98852k);
                    default:
                        return new yz.a(this.f98835b.f98850i, 400L);
                }
            }
        });
        this.f98854m = new e(this);
        this.n = LazyKt.a(new d0(context, i11));
        r rVar = new r();
        rVar.f52080b = nVar;
        rVar.f52082d = new Handler(Looper.getMainLooper());
        rVar.f52083e = new a90.d(rVar, 8);
        this.f98848g = rVar;
        j.f97146a.execute(new Runnable(this) { // from class: zz.b

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ g f98837b;

            {
                this.f98837b = this;
            }

            @Override // java.lang.Runnable
            public final void run() {
                switch (i12) {
                    case 0:
                        g gVar = this.f98837b;
                        try {
                            if (!gVar.f98855p) {
                                gVar.o = ((SharedPreferences) gVar.n.getValue()).getString("key_dismissed_media_session", null);
                                gVar.f98855p = true;
                                break;
                            }
                        } catch (Exception unused) {
                            return;
                        }
                        break;
                    case 1:
                        g gVar2 = this.f98837b;
                        a00.b bVarA = gVar2.a();
                        Iterator it = gVar2.f98847f.iterator();
                        while (it.hasNext()) {
                            ((w) ((d) it.next()).f98839a).j(bVarA);
                        }
                        break;
                    default:
                        this.f98837b.d();
                        break;
                }
            }
        });
        try {
            int i13 = Result.f71687b;
            ((MediaRouter) dVarA.getValue()).addCallback(8388609, fVar);
            objA = Unit.f71706a;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            thA.printStackTrace();
            vm.d.j(thA, "Exception while adding callback to  mediaRouterLegacy " + thA.getMessage());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:66:0x011a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final a00.b a() {
        MediaMetadata metadata;
        StatusBarNotification statusBarNotification;
        MediaSession.Token token;
        Parcelable parcelable;
        String string;
        String string2;
        String string3;
        Parcelable parcelable2;
        Object objA;
        MediaController mediaControllerB = this.f98846e;
        if (mediaControllerB == null) {
            mediaControllerB = b();
        }
        MediaController mediaController = mediaControllerB;
        if (mediaController == null || (metadata = mediaController.getMetadata()) == null) {
            return null;
        }
        Uri iconUri = metadata.getDescription().getIconUri();
        if ((iconUri == null || iconUri.toString() == null) && metadata.getString("android.media.metadata.ART_URI") == null && metadata.getString("android.media.metadata.ALBUM_ART_URI") == null) {
            metadata.getString("android.media.metadata.DISPLAY_ICON_URI");
        }
        mediaController.getMetadata();
        MediaRouter.RouteInfo selectedRoute = ((MediaRouter) this.f98849h.getValue()).getSelectedRoute(8388609);
        String string4 = selectedRoute.getName().toString();
        int deviceType = selectedRoute.getDeviceType();
        a00.c cVar = new a00.c(string4, vm.d.k(deviceType != 2 ? deviceType != 3 ? 2131231689 : 2131231509 : 2131231804, this.f98843b));
        PlaybackState playbackState = mediaController.getPlaybackState();
        boolean z11 = false;
        if (ha.g.a() == null) {
            statusBarNotification = null;
        } else {
            ha.g gVarA = ha.g.a();
            Intrinsics.d(gVarA);
            StatusBarNotification[] activeNotifications = gVarA.getActiveNotifications();
            int length = activeNotifications.length;
            for (int i5 = 0; i5 < length; i5++) {
                statusBarNotification = activeNotifications[i5];
                Bundle bundle = statusBarNotification.getNotification().extras;
                if (bundle != null) {
                    if (Build.VERSION.SDK_INT >= 33) {
                        parcelable = (Parcelable) bundle.getParcelable("android.mediaSession", MediaSession.Token.class);
                    } else {
                        Parcelable parcelable3 = bundle.getParcelable("android.mediaSession");
                        if (!(parcelable3 instanceof MediaSession.Token)) {
                            parcelable3 = null;
                        }
                        parcelable = (MediaSession.Token) parcelable3;
                    }
                    token = (MediaSession.Token) parcelable;
                } else {
                    token = null;
                }
                if (Intrinsics.b(token, mediaController.getSessionToken())) {
                    break;
                }
            }
            statusBarNotification = null;
        }
        String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (statusBarNotification != null) {
            Bundle bundle2 = statusBarNotification.getNotification().extras;
            if (Build.VERSION.SDK_INT >= 33) {
                parcelable2 = (Parcelable) bundle2.getParcelable("android.appInfo", ApplicationInfo.class);
            } else {
                Parcelable parcelable4 = bundle2.getParcelable("android.appInfo");
                if (!(parcelable4 instanceof ApplicationInfo)) {
                    parcelable4 = null;
                }
                parcelable2 = (ApplicationInfo) parcelable4;
            }
            ApplicationInfo applicationInfo = (ApplicationInfo) parcelable2;
            Context context = this.f98842a;
            if (applicationInfo == null) {
                try {
                    int i11 = Result.f71687b;
                    objA = context.getPackageManager().getApplicationInfo(statusBarNotification.getPackageName(), 0);
                } catch (Throwable th2) {
                    int i12 = Result.f71687b;
                    objA = ResultKt.a(th2);
                }
                if (objA instanceof Result.Failure) {
                    objA = null;
                }
                applicationInfo = (ApplicationInfo) objA;
            }
            string = applicationInfo == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : context.getPackageManager().getApplicationLabel(applicationInfo).toString();
        }
        if (statusBarNotification == null || (string2 = metadata.getString("android.media.metadata.TITLE")) == null || (string3 = metadata.getString("android.media.metadata.ARTIST")) == null) {
            return null;
        }
        long j11 = metadata.getLong("android.media.metadata.DURATION");
        if (playbackState != null && playbackState.getState() == 3) {
            z11 = true;
        }
        long actions = playbackState != null ? playbackState.getActions() : 0L;
        String strK = (Build.VERSION.SDK_INT < 28 || statusBarNotification.getNotification().getSmallIcon().getType() != 2) ? vm.d.k(statusBarNotification.getNotification().icon, statusBarNotification.getPackageName()) : vm.d.k(statusBarNotification.getNotification().getSmallIcon().getResId(), statusBarNotification.getNotification().getSmallIcon().getResPackage());
        String packageName = mediaController.getPackageName();
        if (packageName != null) {
            str = packageName;
        }
        return new a00.b(string2, string3, j11, z11, actions, string, strK, str, cVar, new v1(metadata, 10));
    }

    public final MediaController b() {
        Object next;
        try {
            List<MediaController> activeSessions = this.f98844c.getActiveSessions(NotificationListener.f45910j);
            Iterator<T> it = activeSessions.iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                PlaybackState playbackState = ((MediaController) next).getPlaybackState();
                if (playbackState != null && playbackState.getState() == 3) {
                    break;
                }
            }
            MediaController mediaController = (MediaController) next;
            return mediaController == null ? (MediaController) b70.g.Y0(activeSessions) : mediaController;
        } catch (SecurityException unused) {
            vm.d.j(this, "Permission denied: Does the " + NotificationListener.class.getName() + " have access to the notifications?");
            return null;
        }
    }

    public final yz.a c() {
        return (yz.a) this.f98851j.getValue();
    }

    public final void d() {
        r rVar = this.f98848g;
        MediaController mediaControllerB = b();
        if (mediaControllerB == null) {
            this.o = null;
            this.f98855p = true;
            SharedPreferences.Editor editorEdit = ((SharedPreferences) this.n.getValue()).edit();
            editorEdit.putString("key_dismissed_media_session", this.o);
            editorEdit.apply();
            e(null);
            if (rVar != null) {
                rVar.g(null);
                return;
            }
            return;
        }
        if (!this.f98855p) {
            this.o = ((SharedPreferences) this.n.getValue()).getString("key_dismissed_media_session", null);
            this.f98855p = true;
        }
        if (Intrinsics.b(this.o, mediaControllerB.getPackageName())) {
            e(null);
            if (rVar != null) {
                rVar.g(null);
                return;
            }
            return;
        }
        this.o = null;
        this.f98855p = true;
        SharedPreferences.Editor editorEdit2 = ((SharedPreferences) this.n.getValue()).edit();
        editorEdit2.putString("key_dismissed_media_session", this.o);
        editorEdit2.apply();
        e(mediaControllerB);
        c().a();
        if (rVar != null) {
            rVar.g(mediaControllerB);
        }
    }

    public final void e(MediaController mediaController) {
        MediaController mediaController2 = this.f98846e;
        e eVar = this.f98854m;
        if (mediaController2 != null) {
            mediaController2.unregisterCallback(eVar);
        }
        this.f98846e = mediaController;
        r rVar = this.f98848g;
        if (rVar != null) {
            rVar.g(mediaController);
        }
        if (mediaController != null) {
            mediaController.registerCallback(eVar);
        }
    }
}
