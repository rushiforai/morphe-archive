package wb;

import android.content.Context;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.text.TextUtils;
import android.view.Surface;
import com.bytedance.sdk.openadsdk.oty.sya;
import java.io.IOException;
import java.lang.reflect.Field;

/* loaded from: classes2.dex */
public final class n implements l {

    /* renamed from: a, reason: collision with root package name */
    public g f94155a;

    /* renamed from: b, reason: collision with root package name */
    public k f94156b;

    /* renamed from: c, reason: collision with root package name */
    public j f94157c;

    /* renamed from: d, reason: collision with root package name */
    public f f94158d;

    /* renamed from: e, reason: collision with root package name */
    public i f94159e;

    /* renamed from: f, reason: collision with root package name */
    public h f94160f;

    /* renamed from: g, reason: collision with root package name */
    public e f94161g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f94162h = false;

    /* renamed from: i, reason: collision with root package name */
    public final MediaPlayer f94163i;

    /* renamed from: j, reason: collision with root package name */
    public final m f94164j;

    /* renamed from: k, reason: collision with root package name */
    public xb.a f94165k;

    /* renamed from: l, reason: collision with root package name */
    public Surface f94166l;

    /* renamed from: m, reason: collision with root package name */
    public final Object f94167m;
    public volatile boolean n;

    public n() {
        MediaPlayer mediaPlayer;
        Object obj = new Object();
        this.f94167m = obj;
        synchronized (obj) {
            mediaPlayer = new MediaPlayer();
            this.f94163i = mediaPlayer;
        }
        if (Build.VERSION.SDK_INT < 28) {
            try {
                Class<?> cls = Class.forName("android.media.MediaTimeProvider");
                Class<?> cls2 = Class.forName("android.media.SubtitleController");
                Class<?> cls3 = Class.forName("android.media.SubtitleController$Anchor");
                Object objNewInstance = cls2.getConstructor(Context.class, cls, Class.forName("android.media.SubtitleController$Listener")).newInstance(nb.a.f78093a, null, null);
                Field declaredField = cls2.getDeclaredField("mHandler");
                declaredField.setAccessible(true);
                try {
                    declaredField.set(objNewInstance, new Handler());
                    declaredField.setAccessible(false);
                    mediaPlayer.getClass().getMethod("setSubtitleAnchor", cls2, cls3).invoke(mediaPlayer, objNewInstance, null);
                } catch (Throwable th2) {
                    try {
                        sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euAphwy1beqFTt5cvB2hMV78", "SOs5pha+fc6URtJ+gx+0OlTiIZAR", 92);
                        declaredField.setAccessible(false);
                    } catch (Throwable th3) {
                        declaredField.setAccessible(false);
                        throw th3;
                    }
                }
            } catch (Throwable th4) {
                sya.ycx(th4, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euAphwy1beqFTt5cvB2hMV78", "SOs5pha+fc6URtJ+gx+0OlTiIZAR", 100);
            }
        }
        try {
            this.f94163i.setAudioStreamType(3);
        } catch (Throwable th5) {
            sya.ycx(th5, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euAphwy1beqFTt5cvB2hMV78", "B+cjnBfi", 67);
        }
        this.f94164j = new m(this);
        c();
    }

    public final void a() {
        try {
            Surface surface = this.f94166l;
            if (surface != null) {
                surface.release();
                this.f94166l = null;
            }
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euAphwy1beqFTt5cvB2hMV78", "SeshkAKvbPSVWNFcjxQ=", 475);
        }
    }

    public final void b() {
        try {
            this.f94163i.reset();
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euAphwy1beqFTt5cvB2hMV78", "Ses+kBc=", 278);
        }
        xb.a aVar = this.f94165k;
        if (aVar != null) {
            try {
                aVar.close();
            } catch (Throwable th3) {
                sya.ycx(th3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euAphwy1beqFTt5cvB2hMV78", "SeshkAKvbOqFTt5cqBC0KWjhOIcAuQ==", 180);
            }
            this.f94165k = null;
        }
        f();
        c();
    }

    public final void c() {
        MediaPlayer mediaPlayer = this.f94163i;
        m mVar = this.f94164j;
        mediaPlayer.setOnPreparedListener(mVar);
        mediaPlayer.setOnBufferingUpdateListener(mVar);
        mediaPlayer.setOnCompletionListener(mVar);
        mediaPlayer.setOnSeekCompleteListener(mVar);
        mediaPlayer.setOnVideoSizeChangedListener(mVar);
        mediaPlayer.setOnErrorListener(mVar);
        mediaPlayer.setOnInfoListener(mVar);
    }

    public final void d(long j11, int i5) throws IllegalStateException {
        MediaPlayer mediaPlayer = this.f94163i;
        if (i5 == 0) {
            mediaPlayer.seekTo((int) j11, 0);
            return;
        }
        if (i5 == 1) {
            mediaPlayer.seekTo((int) j11, 1);
            return;
        }
        if (i5 == 2) {
            mediaPlayer.seekTo((int) j11, 2);
        } else if (i5 != 3) {
            mediaPlayer.seekTo((int) j11);
        } else {
            mediaPlayer.seekTo((int) j11, 3);
        }
    }

    public final void e(String str) throws IllegalStateException, IOException, SecurityException, IllegalArgumentException {
        Uri uri = Uri.parse(str);
        String scheme = uri.getScheme();
        boolean zIsEmpty = TextUtils.isEmpty(scheme);
        MediaPlayer mediaPlayer = this.f94163i;
        if (zIsEmpty || !scheme.equalsIgnoreCase("file")) {
            mediaPlayer.setDataSource(str);
        } else {
            mediaPlayer.setDataSource(uri.getPath());
        }
    }

    public final void f() {
        this.f94155a = null;
        this.f94157c = null;
        this.f94156b = null;
        this.f94158d = null;
        this.f94159e = null;
        this.f94160f = null;
        this.f94161g = null;
    }

    public final void finalize() throws Throwable {
        super.finalize();
        a();
    }
}
