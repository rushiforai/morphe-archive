package com.vungle.ads.internal.ui.view;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.media.AudioAttributes;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.AttributeSet;
import android.view.Surface;
import android.view.TextureView;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import b.c0;
import com.vungle.ads.internal.o1;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import com.vungle.ads.nativead.NativeVideoListener;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class d extends FrameLayout implements TextureView.SurfaceTextureListener {

    /* renamed from: a, reason: collision with root package name */
    public boolean f47596a;

    /* renamed from: b, reason: collision with root package name */
    public final ViewTreeObserver.OnScrollChangedListener f47597b;

    /* renamed from: c, reason: collision with root package name */
    public final ViewTreeObserver.OnGlobalLayoutListener f47598c;

    /* renamed from: d, reason: collision with root package name */
    public float f47599d;

    /* renamed from: e, reason: collision with root package name */
    public TextureView f47600e;

    /* renamed from: f, reason: collision with root package name */
    public Surface f47601f;

    /* renamed from: g, reason: collision with root package name */
    public MediaPlayer f47602g;

    /* renamed from: h, reason: collision with root package name */
    public Uri f47603h;

    /* renamed from: i, reason: collision with root package name */
    public AtomicBoolean f47604i;

    /* renamed from: j, reason: collision with root package name */
    public AtomicBoolean f47605j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f47606k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f47607l;

    /* renamed from: m, reason: collision with root package name */
    public int f47608m;
    public int n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f47609p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f47610q;

    /* renamed from: r, reason: collision with root package name */
    public int f47611r;

    /* renamed from: s, reason: collision with root package name */
    public int f47612s;

    /* renamed from: t, reason: collision with root package name */
    public com.vungle.ads.nativead.b f47613t;

    /* renamed from: u, reason: collision with root package name */
    public b f47614u;

    /* renamed from: v, reason: collision with root package name */
    public int f47615v;

    /* renamed from: w, reason: collision with root package name */
    public final Handler f47616w;

    /* renamed from: x, reason: collision with root package name */
    public final a f47617x;

    /* renamed from: y, reason: collision with root package name */
    public Function0 f47618y;

    public /* synthetic */ d(Context context) {
        this(context, null);
    }

    public static final void a(d this$0) {
        Intrinsics.g(this$0, "this$0");
        this$0.c();
    }

    public static final void b(d this$0) throws IllegalStateException {
        Intrinsics.g(this$0, "this$0");
        this$0.c();
    }

    public static /* synthetic */ void getMediaPlayerFactory$vungle_ads_release$annotations() {
    }

    public static /* synthetic */ void getSurface$vungle_ads_release$annotations() {
    }

    public static /* synthetic */ void getTexture$vungle_ads_release$annotations() {
    }

    public final void c() throws IllegalStateException {
        MediaPlayer mediaPlayer;
        Surface surface;
        if (this.f47596a) {
            if (!e() || !this.f47606k || this.f47607l) {
                if (this.f47604i.get() && (mediaPlayer = this.f47602g) != null && mediaPlayer.isPlaying()) {
                    boolean z11 = u.f47714a;
                    t.a("NativeAd-Video", "auto-pause: visibility NOT enough");
                    g();
                    return;
                }
                return;
            }
            if (!this.f47604i.get() || (surface = this.f47601f) == null || !surface.isValid()) {
                k();
                return;
            }
            MediaPlayer mediaPlayer2 = this.f47602g;
            if ((mediaPlayer2 == null || !mediaPlayer2.isPlaying()) && !this.f47610q) {
                boolean z12 = u.f47714a;
                StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("auto-resume: visibility OK, start() at pos=");
                MediaPlayer mediaPlayer3 = this.f47602g;
                sbA.append(mediaPlayer3 != null ? Integer.valueOf(mediaPlayer3.getCurrentPosition()) : null);
                sbA.append(" ms");
                t.a("NativeAd-Video", sbA.toString());
                MediaPlayer mediaPlayer4 = this.f47602g;
                if (mediaPlayer4 != null) {
                    mediaPlayer4.start();
                }
                f();
            }
        }
    }

    public final void d() throws IllegalArgumentException {
        if (this.f47602g != null) {
            return;
        }
        MediaPlayer mediaPlayer = (MediaPlayer) this.f47618y.invoke();
        mediaPlayer.setAudioAttributes(new AudioAttributes.Builder().setUsage(1).setContentType(3).build());
        mediaPlayer.setOnPreparedListener(new MediaPlayer.OnPreparedListener() { // from class: n40.a
            @Override // android.media.MediaPlayer.OnPreparedListener
            public final void onPrepared(MediaPlayer mediaPlayer2) throws IllegalStateException {
                com.vungle.ads.internal.ui.view.d.a(this.f77884a, mediaPlayer2);
            }
        });
        mediaPlayer.setOnVideoSizeChangedListener(new MediaPlayer.OnVideoSizeChangedListener() { // from class: n40.b
            @Override // android.media.MediaPlayer.OnVideoSizeChangedListener
            public final void onVideoSizeChanged(MediaPlayer mediaPlayer2, int i5, int i11) {
                com.vungle.ads.internal.ui.view.d.a(this.f77885a, mediaPlayer2, i5, i11);
            }
        });
        mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() { // from class: n40.c
            @Override // android.media.MediaPlayer.OnCompletionListener
            public final void onCompletion(MediaPlayer mediaPlayer2) {
                com.vungle.ads.internal.ui.view.d.b(this.f77886a, mediaPlayer2);
            }
        });
        mediaPlayer.setOnErrorListener(new MediaPlayer.OnErrorListener() { // from class: n40.d
            @Override // android.media.MediaPlayer.OnErrorListener
            public final boolean onError(MediaPlayer mediaPlayer2, int i5, int i11) {
                return com.vungle.ads.internal.ui.view.d.b(this.f77887a, mediaPlayer2, i5, i11);
            }
        });
        this.f47602g = mediaPlayer;
    }

    public final boolean e() {
        if (!isShown()) {
            return false;
        }
        if (!getGlobalVisibleRect(new Rect())) {
            return false;
        }
        long height = getHeight() * getWidth();
        return height > 0 && ((float) (r0.height() * r0.width())) / ((float) height) >= this.f47599d;
    }

    public final void f() {
        NativeVideoListener nativeVideoListener;
        this.f47616w.removeCallbacks(this.f47617x);
        this.f47616w.post(this.f47617x);
        com.vungle.ads.nativead.b bVar = this.f47613t;
        if (bVar == null || (nativeVideoListener = ((m) bVar).getNativeVideoListener()) == null) {
            return;
        }
        nativeVideoListener.onVideoPlay();
    }

    public final void g() throws IllegalStateException {
        Object objA;
        NativeVideoListener nativeVideoListener;
        MediaPlayer mediaPlayer = this.f47602g;
        if (mediaPlayer != null && this.f47604i.get() && mediaPlayer.isPlaying()) {
            boolean z11 = u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("pauseInternal(): pos=");
            sbA.append(mediaPlayer.getCurrentPosition());
            sbA.append(" ms");
            t.a("NativeAd-Video", sbA.toString());
            mediaPlayer.pause();
            this.f47616w.removeCallbacks(this.f47617x);
            b();
            com.vungle.ads.nativead.b bVar = this.f47613t;
            if (bVar != null && (nativeVideoListener = ((m) bVar).getNativeVideoListener()) != null) {
                nativeVideoListener.onVideoPause();
            }
        } else {
            boolean z12 = u.f47714a;
            t.a("NativeAd-Video", "pauseInternal(): no-op (not playing or no player)");
        }
        try {
            int i5 = Result.f71687b;
            objA = Integer.valueOf(mediaPlayer != null ? mediaPlayer.getCurrentPosition() : this.f47608m);
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Object objValueOf = Integer.valueOf(this.f47608m);
        if (objA instanceof Result.Failure) {
            objA = objValueOf;
        }
        this.f47608m = ((Number) objA).intValue();
    }

    public final int getCurrentPositionMs() {
        Object objA;
        if (!this.f47604i.get()) {
            int i5 = this.f47608m;
            if (i5 < 0) {
                return 0;
            }
            return i5;
        }
        try {
            int i11 = Result.f71687b;
            MediaPlayer mediaPlayer = this.f47602g;
            objA = Integer.valueOf(mediaPlayer != null ? mediaPlayer.getCurrentPosition() : this.f47608m);
        } catch (Throwable th2) {
            int i12 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Object objValueOf = Integer.valueOf(this.f47608m);
        if (objA instanceof Result.Failure) {
            objA = objValueOf;
        }
        int iIntValue = ((Number) objA).intValue();
        if (iIntValue < 0) {
            return 0;
        }
        return iIntValue;
    }

    public final int getDurationMs() {
        return this.n;
    }

    @NotNull
    public final Function0<MediaPlayer> getMediaPlayerFactory$vungle_ads_release() {
        return this.f47618y;
    }

    @Nullable
    public final Surface getSurface$vungle_ads_release() {
        return this.f47601f;
    }

    @NotNull
    public final TextureView getTexture$vungle_ads_release() {
        return this.f47600e;
    }

    public final void h() throws IllegalStateException {
        this.f47607l = true;
        g();
    }

    public final void i() throws IllegalStateException {
        Surface surface;
        this.f47606k = true;
        this.f47607l = false;
        this.f47610q = false;
        boolean z11 = u.f47714a;
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("play(): prepared=");
        sbA.append(this.f47604i);
        sbA.append(", surfaceValid=");
        Surface surface2 = this.f47601f;
        sbA.append(surface2 != null ? Boolean.valueOf(surface2.isValid()) : null);
        sbA.append(", visible=");
        sbA.append(e());
        t.a("NativeAd-Video", sbA.toString());
        if (!this.f47604i.get() || (surface = this.f47601f) == null || !surface.isValid() || !e()) {
            k();
            return;
        }
        MediaPlayer mediaPlayer = this.f47602g;
        if (mediaPlayer == null || !mediaPlayer.isPlaying()) {
            StringBuilder sbA2 = com.iab.omid.library.vungle.internal.l.a("play(): pos=");
            MediaPlayer mediaPlayer2 = this.f47602g;
            sbA2.append(mediaPlayer2 != null ? Integer.valueOf(mediaPlayer2.getCurrentPosition()) : null);
            sbA2.append(" ms");
            t.a("NativeAd-Video", sbA2.toString());
            MediaPlayer mediaPlayer3 = this.f47602g;
            if (mediaPlayer3 != null) {
                mediaPlayer3.start();
            }
            f();
        }
    }

    public final void j() throws IllegalStateException {
        if (this.f47606k && this.f47607l && !this.f47610q) {
            i();
        }
    }

    public final void k() {
        Object objA;
        Uri uri;
        try {
            int i5 = Result.f71687b;
            uri = this.f47603h;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (uri != null && !this.f47604i.get() && !this.f47605j.get()) {
            d();
            this.f47605j.set(true);
            this.f47604i.set(false);
            MediaPlayer mediaPlayer = this.f47602g;
            if (mediaPlayer != null) {
                mediaPlayer.reset();
            }
            MediaPlayer mediaPlayer2 = this.f47602g;
            if (mediaPlayer2 != null) {
                mediaPlayer2.setLooping(this.f47609p);
            }
            MediaPlayer mediaPlayer3 = this.f47602g;
            if (mediaPlayer3 != null) {
                mediaPlayer3.setSurface(this.f47601f);
            }
            MediaPlayer mediaPlayer4 = this.f47602g;
            if (mediaPlayer4 != null) {
                mediaPlayer4.setDataSource(getContext(), uri);
            }
            boolean z11 = u.f47714a;
            StringBuilder sb2 = new StringBuilder("prepareAsync(): uri=");
            sb2.append(uri);
            sb2.append(", surfaceValid=");
            Surface surface = this.f47601f;
            objA = null;
            sb2.append(surface != null ? Boolean.valueOf(surface.isValid()) : null);
            t.a("NativeAd-Video", sb2.toString());
            MediaPlayer mediaPlayer5 = this.f47602g;
            if (mediaPlayer5 != null) {
                mediaPlayer5.prepareAsync();
                objA = Unit.f71706a;
            }
            Throwable thA = Result.a(objA);
            if (thA != null) {
                String strValueOf = String.valueOf(thA.getLocalizedMessage());
                com.vungle.ads.nativead.b bVar = this.f47613t;
                if (bVar != null) {
                    ((m) bVar).a(strValueOf, -1);
                }
            }
        }
    }

    public final void l() throws IllegalStateException {
        Object objA;
        Object objA2;
        Object objA3;
        boolean z11 = u.f47714a;
        t.a("NativeAd-Video", "release()");
        StringBuilder sb2 = new StringBuilder("pause() at pos=");
        MediaPlayer mediaPlayer = this.f47602g;
        sb2.append(mediaPlayer != null ? Integer.valueOf(mediaPlayer.getCurrentPosition()) : null);
        sb2.append(" ms");
        t.a("NativeAd-Video", sb2.toString());
        this.f47607l = true;
        this.f47606k = false;
        g();
        this.f47616w.removeCallbacks(this.f47617x);
        try {
            int i5 = Result.f71687b;
            MediaPlayer mediaPlayer2 = this.f47602g;
            if (mediaPlayer2 != null) {
                mediaPlayer2.setSurface(null);
                objA = Unit.f71706a;
            } else {
                objA = null;
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            boolean z12 = u.f47714a;
            t.a("NativeAd-Video", "Failed to clear Surface", thA);
        }
        try {
            MediaPlayer mediaPlayer3 = this.f47602g;
            if (mediaPlayer3 != null) {
                mediaPlayer3.stop();
                objA2 = Unit.f71706a;
            } else {
                objA2 = null;
            }
        } catch (Throwable th3) {
            int i12 = Result.f71687b;
            objA2 = ResultKt.a(th3);
        }
        Throwable thA2 = Result.a(objA2);
        if (thA2 != null) {
            boolean z13 = u.f47714a;
            t.a("NativeAd-Video", "Failed to stop MediaPlayer", thA2);
        }
        try {
            MediaPlayer mediaPlayer4 = this.f47602g;
            if (mediaPlayer4 != null) {
                mediaPlayer4.release();
                objA3 = Unit.f71706a;
            } else {
                objA3 = null;
            }
        } catch (Throwable th4) {
            int i13 = Result.f71687b;
            objA3 = ResultKt.a(th4);
        }
        Throwable thA3 = Result.a(objA3);
        if (thA3 != null) {
            boolean z14 = u.f47714a;
            t.a("NativeAd-Video", "Failed to release MediaPlayer", thA3);
        }
        this.f47602g = null;
        Surface surface = this.f47601f;
        if (surface != null) {
            surface.release();
        }
        this.f47601f = null;
        this.f47604i.set(false);
        this.f47605j.set(false);
    }

    public final void m() throws IllegalStateException {
        boolean z11 = u.f47714a;
        t.a("NativeAd-Video", "setAutoVisibility enabled=true threshold=0.01");
        this.f47596a = true;
        this.f47599d = kotlin.ranges.a.d0(0.01f, 0.0f, 1.0f);
        c();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        boolean z11 = u.f47714a;
        t.a("NativeAd-Video", "onAttachedToWindow()");
        super.onAttachedToWindow();
        getViewTreeObserver().addOnScrollChangedListener(this.f47597b);
        getViewTreeObserver().addOnGlobalLayoutListener(this.f47598c);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() throws IllegalStateException {
        boolean z11 = u.f47714a;
        t.a("NativeAd-Video", "onDetachedFromWindow()");
        super.onDetachedFromWindow();
        getViewTreeObserver().removeOnScrollChangedListener(this.f47597b);
        getViewTreeObserver().removeOnGlobalLayoutListener(this.f47598c);
        g();
        Surface surface = this.f47601f;
        if (surface != null) {
            surface.release();
        }
        this.f47601f = null;
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureAvailable(SurfaceTexture st2, int i5, int i11) throws IllegalStateException {
        Object objA;
        Intrinsics.g(st2, "st");
        Surface surface = this.f47601f;
        if (surface != null) {
            surface.release();
        }
        Surface surface2 = new Surface(st2);
        this.f47601f = surface2;
        try {
            int i12 = Result.f71687b;
            MediaPlayer mediaPlayer = this.f47602g;
            if (mediaPlayer != null) {
                mediaPlayer.setSurface(surface2);
                objA = Unit.f71706a;
            } else {
                objA = null;
            }
        } catch (Throwable th2) {
            int i13 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            boolean z11 = u.f47714a;
            t.a("NativeAd-Video", "Failed to set surface", thA);
        }
        boolean z12 = objA instanceof Result.Failure;
        boolean z13 = u.f47714a;
        StringBuilder sbT = c0.t(i5, "onSurfaceTextureAvailable(): ", " x ", i11, ", prepared=");
        sbT.append(this.f47604i);
        sbT.append(", wantPlay=");
        sbT.append(this.f47606k);
        sbT.append(", surfaceRet=");
        sbT.append(!z12);
        t.a("NativeAd-Video", sbT.toString());
        if (!z12 && this.f47604i.get() && this.f47606k) {
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("onSurfaceTextureAvailable and videoCompleted=");
            sbA.append(this.f47610q);
            t.a("NativeAd-Video", sbA.toString());
            if (this.f47610q) {
                int i14 = this.n;
                if (i14 < 0) {
                    i14 = 0;
                }
                this.f47608m = i14;
                StringBuilder sbA2 = com.iab.omid.library.vungle.internal.l.a("seekTo ");
                sbA2.append(this.f47608m);
                t.a("NativeAd-Video", sbA2.toString());
                if (this.f47604i.get()) {
                    MediaPlayer mediaPlayer2 = this.f47602g;
                    if (mediaPlayer2 != null) {
                        mediaPlayer2.seekTo(this.f47608m);
                    }
                    b();
                }
                MediaPlayer mediaPlayer3 = this.f47602g;
                if (mediaPlayer3 != null) {
                    mediaPlayer3.start();
                }
                MediaPlayer mediaPlayer4 = this.f47602g;
                if (mediaPlayer4 != null) {
                    mediaPlayer4.pause();
                }
            } else {
                MediaPlayer mediaPlayer5 = this.f47602g;
                if (mediaPlayer5 != null) {
                    mediaPlayer5.start();
                }
                f();
            }
        } else {
            k();
        }
        a();
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final boolean onSurfaceTextureDestroyed(SurfaceTexture st2) throws IllegalStateException {
        Object objA;
        Intrinsics.g(st2, "st");
        boolean z11 = u.f47714a;
        t.a("NativeAd-Video", "onSurfaceTextureDestroyed()");
        g();
        try {
            int i5 = Result.f71687b;
            MediaPlayer mediaPlayer = this.f47602g;
            if (mediaPlayer != null) {
                mediaPlayer.setSurface(null);
                objA = Unit.f71706a;
            } else {
                objA = null;
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            boolean z12 = u.f47714a;
            t.a("NativeAd-Video", "Failed to clear surface", thA);
        }
        Surface surface = this.f47601f;
        if (surface != null) {
            surface.release();
        }
        this.f47601f = null;
        this.f47616w.removeCallbacks(this.f47617x);
        b();
        return true;
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureSizeChanged(SurfaceTexture st2, int i5, int i11) {
        Intrinsics.g(st2, "st");
        boolean z11 = u.f47714a;
        t.a("NativeAd-Video", "onSurfaceTextureSizeChanged() width=" + i5 + " height=" + i11);
        a();
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureUpdated(SurfaceTexture st2) {
        Intrinsics.g(st2, "st");
    }

    public final void setLooping(boolean z11) {
        boolean z12 = u.f47714a;
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("setLooping to ");
        sbA.append(this.f47609p);
        t.a("NativeAd-Video", sbA.toString());
        this.f47609p = z11;
        MediaPlayer mediaPlayer = this.f47602g;
        if (mediaPlayer == null) {
            return;
        }
        mediaPlayer.setLooping(z11);
    }

    public final void setMediaPlayerFactory$vungle_ads_release(@NotNull Function0<? extends MediaPlayer> function0) {
        Intrinsics.g(function0, "<set-?>");
        this.f47618y = function0;
    }

    public final void setMuted(boolean z11) {
        boolean z12 = u.f47714a;
        t.a("NativeAd-Video", "setMuted to " + z11);
        this.o = z11;
        float f11 = z11 ? 0.0f : 1.0f;
        MediaPlayer mediaPlayer = this.f47602g;
        if (mediaPlayer != null) {
            mediaPlayer.setVolume(f11, f11);
        }
        com.vungle.ads.nativead.b bVar = this.f47613t;
        if (bVar != null) {
            m mVar = (m) bVar;
            if (z11) {
                o1.a(mVar.getInternal(), "video.mute");
                mVar.getInternal().a(9, (Map) null);
                NativeVideoListener nativeVideoListener = mVar.getNativeVideoListener();
                if (nativeVideoListener != null) {
                    nativeVideoListener.onVideoMute();
                    return;
                }
                return;
            }
            o1.a(mVar.getInternal(), "video.unmute");
            mVar.getInternal().a(10, (Map) null);
            NativeVideoListener nativeVideoListener2 = mVar.getNativeVideoListener();
            if (nativeVideoListener2 != null) {
                nativeVideoListener2.onVideoUnmute();
            }
        }
    }

    public final void setSource(@NotNull Uri uri) {
        Intrinsics.g(uri, "uri");
        this.f47603h = uri;
        this.f47604i.set(false);
        this.f47605j.set(false);
        this.f47611r = 0;
        this.f47612s = 0;
        k();
    }

    public final void setSurface$vungle_ads_release(@Nullable Surface surface) {
        this.f47601f = surface;
    }

    public final void setTexture$vungle_ads_release(@NotNull TextureView textureView) {
        Intrinsics.g(textureView, "<set-?>");
        this.f47600e = textureView;
    }

    public final void setVideoLifecycleCallback(@NotNull com.vungle.ads.nativead.b lifecycleCallback) {
        Intrinsics.g(lifecycleCallback, "lifecycleCallback");
        this.f47613t = lifecycleCallback;
    }

    public final void setVideoTransformCallback$vungle_ads_release(@Nullable b bVar) {
        this.f47614u = bVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        Intrinsics.g(context, "context");
        this.f47597b = new ViewTreeObserver.OnScrollChangedListener() { // from class: n40.e
            @Override // android.view.ViewTreeObserver.OnScrollChangedListener
            public final void onScrollChanged() throws IllegalStateException {
                com.vungle.ads.internal.ui.view.d.b(this.f77888a);
            }
        };
        this.f47598c = new h9.b(this, 2);
        this.f47599d = 0.01f;
        TextureView textureView = new TextureView(context);
        textureView.setSurfaceTextureListener(this);
        this.f47600e = textureView;
        this.f47604i = new AtomicBoolean(false);
        this.f47605j = new AtomicBoolean(false);
        this.f47615v = -1;
        this.f47616w = new Handler(Looper.getMainLooper());
        this.f47617x = new a(this);
        this.f47618y = c.f47595a;
        setClickable(false);
        setFocusable(false);
        setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        addView(this.f47600e, new FrameLayout.LayoutParams(-1, -1));
    }

    public static final void a(d this$0, MediaPlayer mediaPlayer) throws IllegalStateException {
        Surface surface;
        Intrinsics.g(this$0, "this$0");
        com.vungle.ads.nativead.b bVar = this$0.f47613t;
        if (bVar != null) {
            ((m) bVar).b();
        }
        this$0.n = mediaPlayer.getDuration();
        this$0.f47605j.set(false);
        this$0.f47604i.set(true);
        int i5 = this$0.f47608m;
        if (i5 > 0) {
            mediaPlayer.seekTo(i5);
        }
        float f11 = this$0.o ? 0.0f : 1.0f;
        MediaPlayer mediaPlayer2 = this$0.f47602g;
        if (mediaPlayer2 != null) {
            mediaPlayer2.setVolume(f11, f11);
        }
        boolean z11 = u.f47714a;
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("onPrepared(): duration=");
        sbA.append(this$0.n);
        sbA.append(" ms lastPos=");
        sbA.append(this$0.f47608m);
        sbA.append(" wantPlay=");
        sbA.append(this$0.f47606k);
        t.a("NativeAd-Video", sbA.toString());
        if (this$0.f47606k && (surface = this$0.f47601f) != null && surface.isValid()) {
            t.a("NativeAd-Video", "start video on prepared.");
            mediaPlayer.start();
            this$0.f();
        }
    }

    public static final void b(d this$0, MediaPlayer mediaPlayer) {
        Intrinsics.g(this$0, "this$0");
        boolean z11 = u.f47714a;
        t.a("NativeAd-Video", "onCompletion()");
        this$0.f47608m = this$0.n;
        this$0.f47610q = true;
        this$0.f47616w.removeCallbacks(this$0.f47617x);
        this$0.b();
        this$0.f47615v = 100;
        com.vungle.ads.nativead.b bVar = this$0.f47613t;
        if (bVar != null) {
            ((m) bVar).a(100);
        }
        com.vungle.ads.nativead.b bVar2 = this$0.f47613t;
        if (bVar2 != null) {
            m mVar = (m) bVar2;
            o1.a(mVar.getInternal(), "video.close");
            mVar.getInternal().a(3, (Map) null);
            NativeVideoListener nativeVideoListener = mVar.getNativeVideoListener();
            if (nativeVideoListener != null) {
                nativeVideoListener.onVideoEnd();
            }
        }
    }

    public static final boolean b(d this$0, MediaPlayer mediaPlayer, int i5, int i11) {
        Intrinsics.g(this$0, "this$0");
        boolean z11 = u.f47714a;
        t.c("NativeAd-Video", "onError(): what=" + i5 + ", extra=" + i11);
        this$0.f47605j.set(false);
        this$0.f47604i.set(false);
        String strValueOf = String.valueOf(i11);
        com.vungle.ads.nativead.b bVar = this$0.f47613t;
        if (bVar == null) {
            return true;
        }
        ((m) bVar).a(strValueOf, i5);
        return true;
    }

    public static final void a(d this$0, MediaPlayer mediaPlayer, int i5, int i11) {
        Intrinsics.g(this$0, "this$0");
        if (i5 <= 0 || i11 <= 0) {
            return;
        }
        this$0.f47611r = i5;
        this$0.f47612s = i11;
        SurfaceTexture surfaceTexture = this$0.f47600e.getSurfaceTexture();
        if (surfaceTexture != null) {
            surfaceTexture.setDefaultBufferSize(i5, i11);
        }
        this$0.a();
    }

    public final void b() {
        int iE0;
        int i5 = this.n;
        if (i5 <= 0 || !this.f47604i.get() || (iE0 = kotlin.ranges.a.e0((int) ((getCurrentPositionMs() * 100) / i5), 0, 100)) == this.f47615v) {
            return;
        }
        this.f47615v = iE0;
        com.vungle.ads.nativead.b bVar = this.f47613t;
        if (bVar != null) {
            ((m) bVar).a(iE0);
        }
    }

    public final void a() {
        float f11;
        if (this.f47611r <= 0 || this.f47612s <= 0) {
            return;
        }
        int width = this.f47600e.getWidth();
        int height = this.f47600e.getHeight();
        if (width == 0 || height == 0) {
            return;
        }
        float f12 = width;
        float f13 = height;
        float f14 = f12 / f13;
        float f15 = this.f47611r / this.f47612s;
        Matrix matrix = new Matrix();
        if (f14 > f15) {
            f11 = f13 / this.f47612s;
        } else {
            f11 = f12 / this.f47611r;
        }
        matrix.setScale((this.f47611r * f11) / f12, (this.f47612s * f11) / f13, f12 / 2.0f, f13 / 2.0f);
        this.f47600e.setTransform(matrix);
        this.f47600e.invalidate();
        float f16 = (f12 - (this.f47611r * f11)) / 2.0f;
        float f17 = (f13 - (this.f47612s * f11)) / 2.0f;
        b bVar = this.f47614u;
        if (bVar != null) {
            bVar.a(this.f47600e.getX() + f16, this.f47600e.getY() + f17);
        }
    }
}
