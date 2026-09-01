package com.medium.android.donkey.audio;

import android.app.ForegroundServiceStartNotAllowedException;
import android.app.Notification;
import android.app.PendingIntent;
import android.content.Intent;
import android.media.session.MediaSession;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcelable;
import android.support.v4.media.session.PlaybackStateCompat;
import android.util.Log;
import android.view.KeyEvent;
import androidx.media.session.MediaButtonReceiver;
import com.medium.android.donkey.push.TrampolineActivity;
import com.medium.android.donkey.push.d;
import com.medium.reader.R;
import defpackage.ay0;
import defpackage.bud;
import defpackage.g76;
import defpackage.ht2;
import defpackage.l8;
import defpackage.mb0;
import defpackage.mj8;
import defpackage.mm5;
import defpackage.n92;
import defpackage.ni8;
import defpackage.nm;
import defpackage.o7f;
import defpackage.pb0;
import defpackage.rr7;
import defpackage.t23;
import defpackage.ti8;
import defpackage.tq7;
import defpackage.ui8;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.wld;
import defpackage.wm7;
import defpackage.y23;
import defpackage.yw6;
import defpackage.zm7;
import java.lang.reflect.Field;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class AudioService extends mm5 {
    public static final /* synthetic */ int j = 0;
    public bud e;
    public mb0 f;
    public Notification g;
    public zm7 h;
    public final vq6 i = vx0.d0(yw6.NONE, new l8(12, this));

    public final Notification a(String str, String str2, String str3, boolean z) {
        ti8 ti8Var = new ti8(this, tq7.AUDIO.getId());
        rr7.D(ti8Var);
        ti8Var.o = ht2.p0(this);
        ti8Var.e = ti8.b(str2);
        ti8Var.f = ti8.b(str3);
        ui8 ui8Var = new ui8(4);
        ui8Var.c = null;
        zm7 zm7Var = this.h;
        if (zm7Var == null) {
            ay0.e("Required value was null.");
            return null;
        }
        ui8Var.d = ((wm7) zm7Var.b).c;
        ui8Var.c = new int[]{0, 1, 2};
        ti8Var.e(ui8Var);
        ni8 ni8Var = new ni8(R.drawable.ic_rewind, getString(R.string.rewind), MediaButtonReceiver.a(this, 8L));
        ArrayList arrayList = ti8Var.b;
        arrayList.add(ni8Var);
        arrayList.add(new ni8(z ? R.drawable.ic_pause : R.drawable.ic_play, getString(z ? R.string.pause : R.string.play), MediaButtonReceiver.a(this, 512L)));
        arrayList.add(new ni8(R.drawable.ic_fast_forward, getString(R.string.fast_forward), MediaButtonReceiver.a(this, 64L)));
        ti8Var.j = 0;
        Intent intent = new Intent(this, (Class<?>) AudioService.class);
        intent.setAction("CLOSE");
        ti8Var.s.deleteIntent = PendingIntent.getService(this, 0, intent, 67108864);
        if (str != null) {
            int i = TrampolineActivity.v;
            ti8Var.g = d.a(this, new TrampolineActivity.Action.OpenPostFromAudioControllerNotification(str), 129654L);
        }
        Notification notificationA = ti8Var.a();
        notificationA.getClass();
        return notificationA;
    }

    public final bud b() {
        bud budVar = this.e;
        if (budVar != null) {
            return budVar;
        }
        g76.g0("ttsController");
        throw null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.mb0 r9, defpackage.p92 r10) {
        /*
            Method dump skipped, instruction units count: 201
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.donkey.audio.AudioService.d(mb0, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(defpackage.ztd r14, defpackage.n92 r15) {
        /*
            Method dump skipped, instruction units count: 411
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.donkey.audio.AudioService.e(ztd, n92):java.lang.Object");
    }

    public final void f(Notification notification) {
        int i = Build.VERSION.SDK_INT;
        int i2 = i >= 29 ? 2 : 0;
        if (i >= 34) {
            nm.J(this, notification, i2);
        } else if (i >= 29) {
            nm.H(this, notification, i2);
        } else {
            startForeground(R.id.audio_service_notification_id, notification);
        }
    }

    public final boolean g() {
        Notification notificationA = this.g;
        if (notificationA == null) {
            notificationA = a(null, null, null, true);
            this.g = notificationA;
        }
        if (Build.VERSION.SDK_INT < 31) {
            f(notificationA);
            return true;
        }
        try {
            f(notificationA);
            return true;
        } catch (ForegroundServiceStartNotAllowedException e) {
            wld.a.n(e, "Cannot start AudioService as foreground: app is in background", new Object[0]);
            stopSelf();
            return false;
        }
    }

    @Override // defpackage.mm5, defpackage.qy6, android.app.Service
    public final void onCreate() {
        super.onCreate();
        this.h = new zm7(this);
        if (g()) {
            vx0.c0(o7f.x(this), null, null, new pb0(this, null, 1), 3);
        }
    }

    @Override // defpackage.qy6, android.app.Service
    public final void onDestroy() {
        zm7 zm7Var = this.h;
        if (zm7Var != null) {
            wm7 wm7Var = (wm7) zm7Var.b;
            MediaSession mediaSession = wm7Var.a;
            wm7Var.e.kill();
            if (Build.VERSION.SDK_INT == 27) {
                try {
                    Field declaredField = mediaSession.getClass().getDeclaredField("mCallback");
                    declaredField.setAccessible(true);
                    Handler handler = (Handler) declaredField.get(mediaSession);
                    if (handler != null) {
                        handler.removeCallbacksAndMessages(null);
                    }
                } catch (Exception e) {
                    Log.w("MediaSessionCompat", "Exception happened while accessing MediaSession.mCallback.", e);
                }
            }
            mediaSession.setCallback(null);
            wm7Var.b.e.set(null);
            mediaSession.release();
        }
        ((mj8) this.i.getValue()).b.cancel(null, R.id.audio_service_notification_id);
        super.onDestroy();
    }

    @Override // android.app.Service
    public final int onStartCommand(Intent intent, int i, int i2) {
        if (!g()) {
            return super.onStartCommand(intent, i, i2);
        }
        n92 n92Var = null;
        String action = intent != null ? intent.getAction() : null;
        if (action != null) {
            if (action.hashCode() == 64218584 && action.equals("CLOSE")) {
                y23 y23Var = (y23) b();
                vx0.c0(y23Var.e, null, null, new t23(y23Var, n92Var, 0), 3);
            } else {
                Bundle extras = intent.getExtras();
                KeyEvent keyEvent = extras != null ? (KeyEvent) ((Parcelable) ht2.r0(extras, "android.intent.extra.KEY_EVENT", KeyEvent.class)) : null;
                Integer numValueOf = keyEvent != null ? Integer.valueOf(keyEvent.getKeyCode()) : null;
                int iA = PlaybackStateCompat.a(64L);
                if (numValueOf != null && numValueOf.intValue() == iA) {
                    y23 y23Var2 = (y23) b();
                    vx0.c0(y23Var2.e, null, null, new t23(y23Var2, n92Var, 1), 3);
                } else {
                    int iA2 = PlaybackStateCompat.a(8L);
                    if (numValueOf != null && numValueOf.intValue() == iA2) {
                        y23 y23Var3 = (y23) b();
                        vx0.c0(y23Var3.e, null, null, new t23(y23Var3, n92Var, 5), 3);
                    } else {
                        int iA3 = PlaybackStateCompat.a(512L);
                        if (numValueOf != null && numValueOf.intValue() == iA3) {
                            y23 y23Var4 = (y23) b();
                            vx0.c0(y23Var4.e, null, null, new t23(y23Var4, n92Var, 6), 3);
                        }
                    }
                }
            }
        }
        return super.onStartCommand(intent, i, i2);
    }
}
