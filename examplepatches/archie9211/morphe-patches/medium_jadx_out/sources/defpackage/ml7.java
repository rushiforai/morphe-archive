package defpackage;

import android.content.Context;
import android.content.Intent;
import android.media.browse.MediaBrowser;
import android.media.session.MediaSession;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Message;
import android.os.Messenger;
import android.os.Process;
import android.os.RemoteException;
import android.support.v4.media.session.MediaSessionCompat$Token;
import android.support.v4.media.session.a;
import android.support.v4.media.session.b;
import android.util.Log;
import android.view.KeyEvent;
import j$.util.DesugarCollections;
import java.lang.ref.WeakReference;
import java.util.HashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ml7 extends MediaBrowser.ConnectionCallback {
    public final /* synthetic */ ing a;

    public ml7(ing ingVar) {
        this.a = ingVar;
    }

    @Override // android.media.browse.MediaBrowser.ConnectionCallback
    public final void onConnected() {
        iu5 iu5Var;
        ing ingVar = this.a;
        nl7 nl7Var = (nl7) ingVar.b;
        if (nl7Var != null) {
            ll7 ll7Var = nl7Var.d;
            MediaBrowser mediaBrowser = nl7Var.b;
            try {
                Bundle extras = mediaBrowser.getExtras();
                if (extras != null) {
                    boolean z = false;
                    extras.getInt("extra_service_version", 0);
                    IBinder binder = extras.getBinder("extra_messenger");
                    if (binder != null) {
                        Bundle bundle = nl7Var.c;
                        gg5 gg5Var = new gg5(14, z);
                        gg5Var.b = new Messenger(binder);
                        gg5Var.c = bundle;
                        nl7Var.f = gg5Var;
                        Messenger messenger = new Messenger(ll7Var);
                        nl7Var.g = messenger;
                        ll7Var.getClass();
                        ll7Var.b = new WeakReference(messenger);
                        try {
                            gg5 gg5Var2 = nl7Var.f;
                            Context context = nl7Var.a;
                            Messenger messenger2 = nl7Var.g;
                            gg5Var2.getClass();
                            Bundle bundle2 = new Bundle();
                            bundle2.putString("data_package_name", context.getPackageName());
                            bundle2.putInt("data_calling_pid", Process.myPid());
                            bundle2.putBundle("data_root_hints", (Bundle) gg5Var2.c);
                            Message messageObtain = Message.obtain();
                            messageObtain.what = 6;
                            messageObtain.arg1 = 1;
                            messageObtain.setData(bundle2);
                            messageObtain.replyTo = messenger2;
                            ((Messenger) gg5Var2.b).send(messageObtain);
                        } catch (RemoteException unused) {
                            Log.i("MediaBrowserCompat", "Remote error registering client messenger.");
                        }
                    }
                    IBinder binder2 = extras.getBinder("extra_session_binder");
                    int i = b.f;
                    if (binder2 == null) {
                        iu5Var = null;
                    } else {
                        IInterface iInterfaceQueryLocalInterface = binder2.queryLocalInterface("android.support.v4.media.session.IMediaSession");
                        if (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof iu5)) {
                            hu5 hu5Var = new hu5();
                            hu5Var.e = binder2;
                            iu5Var = hu5Var;
                        } else {
                            iu5Var = (iu5) iInterfaceQueryLocalInterface;
                        }
                    }
                    if (iu5Var != null) {
                        MediaSession.Token sessionToken = mediaBrowser.getSessionToken();
                        nl7Var.h = sessionToken != null ? new MediaSessionCompat$Token(sessionToken, iu5Var) : null;
                    }
                }
            } catch (IllegalStateException e) {
                Log.e("MediaBrowserCompat", "Unexpected IllegalStateException", e);
            }
        }
        Context context2 = (Context) ingVar.c;
        nl7 nl7Var2 = ((pl7) ingVar.f).a;
        MediaSessionCompat$Token mediaSessionCompat$Token = nl7Var2.h;
        if (mediaSessionCompat$Token == null) {
            MediaSession.Token sessionToken2 = nl7Var2.b.getSessionToken();
            MediaSessionCompat$Token mediaSessionCompat$Token2 = sessionToken2 != null ? new MediaSessionCompat$Token(sessionToken2, null) : null;
            nl7Var2.h = mediaSessionCompat$Token2;
            mediaSessionCompat$Token = mediaSessionCompat$Token2;
        }
        if (mediaSessionCompat$Token == null) {
            ay0.e("sessionToken must not be null");
            return;
        }
        DesugarCollections.synchronizedSet(new HashSet());
        a sl7Var = Build.VERSION.SDK_INT >= 29 ? new sl7(context2, mediaSessionCompat$Token) : new a(context2, mediaSessionCompat$Token);
        KeyEvent keyEvent = (KeyEvent) ((Intent) ingVar.d).getParcelableExtra("android.intent.extra.KEY_EVENT");
        if (keyEvent == null) {
            ay0.e("KeyEvent may not be null");
        } else {
            sl7Var.a.dispatchMediaButtonEvent(keyEvent);
            ingVar.d();
        }
    }

    @Override // android.media.browse.MediaBrowser.ConnectionCallback
    public final void onConnectionFailed() {
        this.a.d();
    }

    @Override // android.media.browse.MediaBrowser.ConnectionCallback
    public final void onConnectionSuspended() {
        ing ingVar = this.a;
        nl7 nl7Var = (nl7) ingVar.b;
        if (nl7Var != null) {
            nl7Var.f = null;
            nl7Var.g = null;
            nl7Var.h = null;
            ll7 ll7Var = nl7Var.d;
            ll7Var.getClass();
            ll7Var.b = new WeakReference(null);
        }
        ingVar.d();
    }
}
