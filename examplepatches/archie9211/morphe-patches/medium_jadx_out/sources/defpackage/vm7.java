package defpackage;

import android.media.Rating;
import android.media.session.MediaSession;
import android.net.Uri;
import android.os.BadParcelableException;
import android.os.Build;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.support.v4.media.RatingCompat;
import android.support.v4.media.session.MediaSessionCompat$Token;
import android.text.TextUtils;
import android.util.Log;
import androidx.versionedparcelable.ParcelImpl;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vm7 extends MediaSession.Callback {
    public final /* synthetic */ ms a;

    public vm7(ms msVar) {
        this.a = msVar;
    }

    public static void b(wm7 wm7Var) {
        int i = Build.VERSION.SDK_INT;
        if (i >= 28) {
            return;
        }
        MediaSession mediaSession = wm7Var.a;
        String str = null;
        if (i >= 24) {
            try {
                str = (String) mediaSession.getClass().getMethod("getCallingPackage", null).invoke(mediaSession, null);
            } catch (Exception e) {
                Log.e("MediaSessionCompat", "Cannot execute MediaSession.getCallingPackage()", e);
            }
        }
        if (TextUtils.isEmpty(str)) {
            str = "android.media.session.MediaController";
        }
        wm7Var.d(new an7(str, -1, -1));
    }

    public final wm7 a() {
        wm7 wm7Var;
        synchronized (this.a.c) {
            wm7Var = (wm7) ((WeakReference) this.a.b).get();
        }
        if (wm7Var == null || this.a != wm7Var.b()) {
            return null;
        }
        return wm7Var;
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onCommand(String str, Bundle bundle, ResultReceiver resultReceiver) {
        pse pseVar;
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        zm7.w(bundle);
        b(wm7VarA);
        try {
            if (str.equals("android.support.v4.media.session.command.GET_EXTRA_BINDER")) {
                Bundle bundle2 = new Bundle();
                MediaSessionCompat$Token mediaSessionCompat$Token = wm7VarA.c;
                iu5 iu5VarA = mediaSessionCompat$Token.a();
                bundle2.putBinder("android.support.v4.media.session.EXTRA_BINDER", iu5VarA == null ? null : iu5VarA.asBinder());
                synchronized (mediaSessionCompat$Token.a) {
                    pseVar = mediaSessionCompat$Token.d;
                }
                if (pseVar != null) {
                    Bundle bundle3 = new Bundle();
                    bundle3.putParcelable("a", new ParcelImpl(pseVar));
                    bundle2.putParcelable("android.support.v4.media.session.SESSION_TOKEN2", bundle3);
                }
                resultReceiver.send(0, bundle2);
            } else if (str.equals("android.support.v4.media.session.command.ADD_QUEUE_ITEM")) {
            } else if (str.equals("android.support.v4.media.session.command.ADD_QUEUE_ITEM_AT")) {
                bundle.getInt("android.support.v4.media.session.command.ARGUMENT_INDEX");
            } else if (str.equals("android.support.v4.media.session.command.REMOVE_QUEUE_ITEM")) {
            } else {
                str.equals("android.support.v4.media.session.command.REMOVE_QUEUE_ITEM_AT");
            }
        } catch (BadParcelableException unused) {
            Log.e("MediaSessionCompat", "Could not unparcel the extra data.");
        }
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onCustomAction(String str, Bundle bundle) {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        zm7.w(bundle);
        b(wm7VarA);
        try {
            if (str.equals("android.support.v4.media.session.action.PLAY_FROM_URI")) {
                zm7.w(bundle.getBundle("android.support.v4.media.session.action.ARGUMENT_EXTRAS"));
            } else if (!str.equals("android.support.v4.media.session.action.PREPARE")) {
                if (str.equals("android.support.v4.media.session.action.PREPARE_FROM_MEDIA_ID")) {
                    bundle.getString("android.support.v4.media.session.action.ARGUMENT_MEDIA_ID");
                    zm7.w(bundle.getBundle("android.support.v4.media.session.action.ARGUMENT_EXTRAS"));
                } else if (str.equals("android.support.v4.media.session.action.PREPARE_FROM_SEARCH")) {
                    bundle.getString("android.support.v4.media.session.action.ARGUMENT_QUERY");
                    zm7.w(bundle.getBundle("android.support.v4.media.session.action.ARGUMENT_EXTRAS"));
                } else if (str.equals("android.support.v4.media.session.action.PREPARE_FROM_URI")) {
                    zm7.w(bundle.getBundle("android.support.v4.media.session.action.ARGUMENT_EXTRAS"));
                } else if (str.equals("android.support.v4.media.session.action.SET_CAPTIONING_ENABLED")) {
                    bundle.getBoolean("android.support.v4.media.session.action.ARGUMENT_CAPTIONING_ENABLED");
                } else if (str.equals("android.support.v4.media.session.action.SET_REPEAT_MODE")) {
                    bundle.getInt("android.support.v4.media.session.action.ARGUMENT_REPEAT_MODE");
                } else if (str.equals("android.support.v4.media.session.action.SET_SHUFFLE_MODE")) {
                    bundle.getInt("android.support.v4.media.session.action.ARGUMENT_SHUFFLE_MODE");
                } else if (str.equals("android.support.v4.media.session.action.SET_RATING")) {
                    zm7.w(bundle.getBundle("android.support.v4.media.session.action.ARGUMENT_EXTRAS"));
                } else if (str.equals("android.support.v4.media.session.action.SET_PLAYBACK_SPEED")) {
                    bundle.getFloat("android.support.v4.media.session.action.ARGUMENT_PLAYBACK_SPEED", 1.0f);
                }
            }
        } catch (BadParcelableException unused) {
            Log.e("MediaSessionCompat", "Could not unparcel the data.");
        }
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onFastForward() {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        b(wm7VarA);
        wm7VarA.d(null);
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    @Override // android.media.session.MediaSession.Callback
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean onMediaButtonEvent(android.content.Intent r10) {
        /*
            r9 = this;
            wm7 r0 = r9.a()
            r1 = 0
            if (r0 != 0) goto L9
            goto L90
        L9:
            b(r0)
            ms r2 = r9.a
            int r3 = android.os.Build.VERSION.SDK_INT
            r4 = 27
            r5 = 1
            if (r3 < r4) goto L18
        L15:
            r2 = r1
            goto L83
        L18:
            java.lang.Object r3 = r2.c
            monitor-enter(r3)
            java.lang.Object r4 = r2.b     // Catch: java.lang.Throwable -> L92
            java.lang.ref.WeakReference r4 = (java.lang.ref.WeakReference) r4     // Catch: java.lang.Throwable -> L92
            java.lang.Object r4 = r4.get()     // Catch: java.lang.Throwable -> L92
            wm7 r4 = (defpackage.wm7) r4     // Catch: java.lang.Throwable -> L92
            java.lang.Object r6 = r2.e     // Catch: java.lang.Throwable -> L92
            xc r6 = (defpackage.xc) r6     // Catch: java.lang.Throwable -> L92
            monitor-exit(r3)     // Catch: java.lang.Throwable -> L92
            if (r4 == 0) goto L15
            if (r6 != 0) goto L2f
            goto L15
        L2f:
            java.lang.String r3 = "android.intent.extra.KEY_EVENT"
            android.os.Parcelable r3 = r10.getParcelableExtra(r3)
            android.view.KeyEvent r3 = (android.view.KeyEvent) r3
            if (r3 == 0) goto L15
            int r7 = r3.getAction()
            if (r7 == 0) goto L40
            goto L15
        L40:
            an7 r4 = r4.c()
            int r7 = r3.getKeyCode()
            r8 = 79
            if (r7 == r8) goto L5b
            r8 = 85
            if (r7 == r8) goto L5b
            boolean r3 = r2.a
            if (r3 != 0) goto L55
            goto L15
        L55:
            r2.a = r1
            r6.removeMessages(r5)
            goto L15
        L5b:
            int r3 = r3.getRepeatCount()
            boolean r7 = r2.a
            if (r3 != 0) goto L7a
            if (r7 == 0) goto L6b
            r6.removeMessages(r5)
            r2.a = r1
            goto L82
        L6b:
            r2.a = r5
            android.os.Message r2 = r6.obtainMessage(r5, r4)
            int r3 = android.view.ViewConfiguration.getDoubleTapTimeout()
            long r3 = (long) r3
            r6.sendMessageDelayed(r2, r3)
            goto L82
        L7a:
            if (r7 != 0) goto L7d
            goto L82
        L7d:
            r2.a = r1
            r6.removeMessages(r5)
        L82:
            r2 = r5
        L83:
            r3 = 0
            r0.d(r3)
            if (r2 != 0) goto L91
            boolean r9 = super.onMediaButtonEvent(r10)
            if (r9 == 0) goto L90
            goto L91
        L90:
            return r1
        L91:
            return r5
        L92:
            r9 = move-exception
            monitor-exit(r3)     // Catch: java.lang.Throwable -> L92
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vm7.onMediaButtonEvent(android.content.Intent):boolean");
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onPause() {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        b(wm7VarA);
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onPlay() {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        b(wm7VarA);
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onPlayFromMediaId(String str, Bundle bundle) {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        zm7.w(bundle);
        b(wm7VarA);
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onPlayFromSearch(String str, Bundle bundle) {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        zm7.w(bundle);
        b(wm7VarA);
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onPlayFromUri(Uri uri, Bundle bundle) {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        zm7.w(bundle);
        b(wm7VarA);
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onPrepare() {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        b(wm7VarA);
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onPrepareFromMediaId(String str, Bundle bundle) {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        zm7.w(bundle);
        b(wm7VarA);
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onPrepareFromSearch(String str, Bundle bundle) {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        zm7.w(bundle);
        b(wm7VarA);
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onPrepareFromUri(Uri uri, Bundle bundle) {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        zm7.w(bundle);
        b(wm7VarA);
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onRewind() {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        b(wm7VarA);
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onSeekTo(long j) {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        b(wm7VarA);
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onSetPlaybackSpeed(float f) {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        b(wm7VarA);
        wm7VarA.d(null);
    }

    /* JADX WARN: Failed to find 'out' block for switch in B:10:0x001c. Please report as an issue. */
    @Override // android.media.session.MediaSession.Callback
    public final void onSetRating(Rating rating) {
        RatingCompat ratingCompat;
        float f;
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        b(wm7VarA);
        if (rating != null) {
            int iB = psa.b(rating);
            if (psa.e(rating)) {
                switch (iB) {
                    case 1:
                        ratingCompat = new RatingCompat(1, psa.d(rating) ? 1.0f : 0.0f);
                        ratingCompat.getClass();
                        break;
                    case 2:
                        ratingCompat = new RatingCompat(2, psa.f(rating) ? 1.0f : 0.0f);
                        ratingCompat.getClass();
                        break;
                    case 3:
                    case 4:
                    case 5:
                        float fC = psa.c(rating);
                        if (iB == 3) {
                            f = 3.0f;
                        } else if (iB == 4) {
                            f = 4.0f;
                        } else if (iB != 5) {
                            Log.e("Rating", "Invalid rating style (" + iB + ") for a star rating");
                            ratingCompat = null;
                            ratingCompat.getClass();
                        } else {
                            f = 5.0f;
                        }
                        if (fC >= 0.0f && fC <= f) {
                            ratingCompat = new RatingCompat(iB, fC);
                            ratingCompat.getClass();
                        } else {
                            Log.e("Rating", "Trying to set out of range star-based rating");
                            ratingCompat = null;
                            ratingCompat.getClass();
                        }
                        break;
                    case 6:
                        float fA = psa.a(rating);
                        if (fA >= 0.0f && fA <= 100.0f) {
                            ratingCompat = new RatingCompat(6, fA);
                            ratingCompat.getClass();
                        } else {
                            Log.e("Rating", "Invalid percentage-based rating value");
                            ratingCompat = null;
                            ratingCompat.getClass();
                        }
                        break;
                }
            } else {
                switch (iB) {
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                        ratingCompat = new RatingCompat(iB, -1.0f);
                        break;
                    default:
                        ratingCompat = null;
                        break;
                }
                ratingCompat.getClass();
            }
        }
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onSkipToNext() {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        b(wm7VarA);
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onSkipToPrevious() {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        b(wm7VarA);
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onSkipToQueueItem(long j) {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        b(wm7VarA);
        wm7VarA.d(null);
    }

    @Override // android.media.session.MediaSession.Callback
    public final void onStop() {
        wm7 wm7VarA = a();
        if (wm7VarA == null) {
            return;
        }
        b(wm7VarA);
        wm7VarA.d(null);
    }
}
