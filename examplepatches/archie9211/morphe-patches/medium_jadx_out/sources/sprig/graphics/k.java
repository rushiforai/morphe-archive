package sprig.graphics;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.PixelCopy;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import com.userleap.EventName;
import com.userleap.SprigEvent;
import com.userleap.internal.sessions.util.RecorderLifecycleObserver;
import com.userleap.internal.sessions.util.RedactorsKt;
import com.userleap.internal.sessions.util.ViewRedactor;
import defpackage.ajb;
import defpackage.b09;
import defpackage.b55;
import defpackage.bjb;
import defpackage.bo;
import defpackage.br7;
import defpackage.bu1;
import defpackage.c1e;
import defpackage.co6;
import defpackage.cu1;
import defpackage.d2a;
import defpackage.d46;
import defpackage.ep0;
import defpackage.ev6;
import defpackage.ff7;
import defpackage.g76;
import defpackage.gy2;
import defpackage.kb2;
import defpackage.kyd;
import defpackage.m15;
import defpackage.m45;
import defpackage.n92;
import defpackage.o7f;
import defpackage.p4d;
import defpackage.p92;
import defpackage.r13;
import defpackage.sb2;
import defpackage.ss;
import defpackage.tb2;
import defpackage.uv2;
import defpackage.va6;
import defpackage.vx0;
import defpackage.vz2;
import defpackage.x45;
import defpackage.x55;
import defpackage.xg3;
import defpackage.ygf;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import kotlin.Metadata;
import org.json.JSONException;
import sprig.b.b;
import sprig.b.h;
import sprig.graphics.i;
import sprig.graphics.k;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000Þ\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0005\u0018\u0000 \u0096\u00012\u00020\u0001:\u0005\u000f\u00127;?B5\u0012\b\b\u0002\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0004\u0012\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u0007¢\u0006\u0004\b\n\u0010\u000bJ\u0017\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\r\u001a\u00020\fH\u0002¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u000f\u001a\u00020\u000eH\u0002¢\u0006\u0004\b\u000f\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u000eH\u0002¢\u0006\u0004\b\u0012\u0010\u0011J\u0017\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0014\u001a\u00020\u0013H\u0002¢\u0006\u0004\b\u000f\u0010\u0015J\u001b\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0014\u001a\u00020\u0013H\u0082@ø\u0001\u0000¢\u0006\u0004\b\u000f\u0010\u0016J\u0013\u0010\u000f\u001a\u00020\u000eH\u0082@ø\u0001\u0000¢\u0006\u0004\b\u000f\u0010\u0017J\u0019\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00180\u0007*\u00020\u0018H\u0002¢\u0006\u0004\b\u000f\u0010\u0019J\u0017\u0010\u0012\u001a\u00020\u000e2\u0006\u0010\u001b\u001a\u00020\u001aH\u0002¢\u0006\u0004\b\u0012\u0010\u001cJ\u0017\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u001e\u001a\u00020\u001dH\u0002¢\u0006\u0004\b\u000f\u0010\u001fJ\u0017\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u001b\u001a\u00020\u001aH\u0002¢\u0006\u0004\b\u000f\u0010\u001cJ\u001d\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020!0\u00072\u0006\u0010 \u001a\u00020\u0018H\u0002¢\u0006\u0004\b\u0012\u0010\u0019J/\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u001e\u001a\u00020\u001d2\f\u0010\"\u001a\b\u0012\u0004\u0012\u00020!0\u00072\b\b\u0002\u0010#\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u000f\u0010$J#\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u001e\u001a\u00020\u001d2\n\b\u0002\u0010&\u001a\u0004\u0018\u00010%H\u0002¢\u0006\u0004\b\u000f\u0010'J#\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u001e\u001a\u00020\u001d2\n\b\u0002\u0010)\u001a\u0004\u0018\u00010(H\u0002¢\u0006\u0004\b\u000f\u0010*J?\u0010\u000f\u001a\u00020\u000e2\u0006\u0010 \u001a\u00020\u00182\u0006\u0010\u001b\u001a\u00020\u001a2\u001e\u0010,\u001a\u001a\u0012\u0004\u0012\u00020\u001a\u0012\n\u0012\b\u0012\u0004\u0012\u00020!0\u0007\u0012\u0004\u0012\u00020\u000e0+H\u0002¢\u0006\u0004\b\u000f\u0010-J\r\u0010.\u001a\u00020\u000e¢\u0006\u0004\b.\u0010\u0011J\u000f\u00100\u001a\u00020\u000eH\u0000¢\u0006\u0004\b/\u0010\u0011J\u0015\u00101\u001a\u00020\u000e2\u0006\u0010&\u001a\u00020%¢\u0006\u0004\b1\u00102J'\u00105\u001a\u00020\u000e2\n\b\u0002\u0010&\u001a\u0004\u0018\u00010%2\n\b\u0002\u0010)\u001a\u0004\u0018\u00010(H\u0000¢\u0006\u0004\b3\u00104R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u00106R\u0014\u0010\u0006\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0012\u00106R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u00078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b7\u00108R\u001c\u0010=\u001a\b\u0012\u0004\u0012\u00020:098\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b;\u0010<R\u0014\u0010A\u001a\u00020>8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b?\u0010@R(\u0010C\u001a\b\u0012\u0004\u0012\u00020B098\u0006@\u0006X\u0086.¢\u0006\u0012\n\u0004\bC\u0010<\u001a\u0004\bD\u0010E\"\u0004\bF\u0010GR\u001e\u0010I\u001a\n\u0012\u0004\u0012\u00020\u0018\u0018\u0001098\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bH\u0010<R\"\u0010O\u001a\u00020\u00138\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\bJ\u0010K\u001a\u0004\bL\u0010M\"\u0004\bN\u0010\u0015R\u0018\u0010S\u001a\u0004\u0018\u00010P8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bQ\u0010RR\"\u0010[\u001a\u00020T8\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\bU\u0010V\u001a\u0004\bW\u0010X\"\u0004\bY\u0010ZR\u0018\u0010]\u001a\u0004\u0018\u00010P8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\\\u0010RR\u0014\u0010a\u001a\u00020^8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b_\u0010`R\u0014\u0010c\u001a\u00020^8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bb\u0010`R\u0014\u0010e\u001a\u00020^8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bd\u0010`R\u0014\u0010g\u001a\u00020^8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bf\u0010`R\u0014\u0010k\u001a\u00020h8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bi\u0010jR\"\u0010m\u001a\u00020l8\u0000@\u0000X\u0080.¢\u0006\u0012\n\u0004\bm\u0010n\u001a\u0004\bo\u0010p\"\u0004\bq\u0010rR\u0016\u0010t\u001a\u00020\u00138\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bs\u0010KR\u0016\u0010v\u001a\u00020\u00138\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bu\u0010KR\u0016\u0010z\u001a\u00020w8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bx\u0010yR\u0014\u0010~\u001a\u00020{8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b|\u0010}R\u0019\u0010\u0082\u0001\u001a\u00020\u007f8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u0080\u0001\u0010\u0081\u0001R\u001e\u0010\u0086\u0001\u001a\n\u0012\u0005\u0012\u00030\u0084\u00010\u0083\u00018\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0085\u0001\u00108R.\u0010\u008c\u0001\u001a\u0004\u0018\u00010:2\t\u0010\u0087\u0001\u001a\u0004\u0018\u00010:8@@@X\u0080\u000e¢\u0006\u0010\u001a\u0006\b\u0088\u0001\u0010\u0089\u0001\"\u0006\b\u008a\u0001\u0010\u008b\u0001R.\u0010\u0091\u0001\u001a\u0004\u0018\u00010\u00182\t\u0010\u0087\u0001\u001a\u0004\u0018\u00010\u00188F@FX\u0086\u000e¢\u0006\u0010\u001a\u0006\b\u008d\u0001\u0010\u008e\u0001\"\u0006\b\u008f\u0001\u0010\u0090\u0001R\u0017\u0010\u0095\u0001\u001a\u0005\u0018\u00010\u0092\u00018F¢\u0006\b\u001a\u0006\b\u0093\u0001\u0010\u0094\u0001\u0082\u0002\u0004\n\u0002\b\u0019¨\u0006\u0097\u0001"}, d2 = {"Lsprig/h/k;", "", "Lkb2;", "dispatcher", "", "framesPerSecond", "jpegQuality", "", "Lcom/userleap/internal/sessions/util/ViewRedactor;", "redactors", "<init>", "(Lkb2;IILjava/util/List;)V", "Lsprig/h/b;", "reason", "Lc1e;", "a", "(Lsprig/h/b;)V", "()V", "b", "", "olderThan", "(J)V", "(JLn92;)Ljava/lang/Object;", "(Ln92;)Ljava/lang/Object;", "Landroid/view/View;", "(Landroid/view/View;)Ljava/util/List;", "Landroid/graphics/Bitmap;", "bitmap", "(Landroid/graphics/Bitmap;)V", "Landroid/graphics/Canvas;", "canvas", "(Landroid/graphics/Canvas;)V", "view", "Landroid/graphics/Rect;", "maskingRects", "color", "(Landroid/graphics/Canvas;Ljava/util/List;I)V", "Landroid/graphics/Point;", "touchPoint", "(Landroid/graphics/Canvas;Landroid/graphics/Point;)V", "Lsprig/h/k$e;", "swipe", "(Landroid/graphics/Canvas;Lsprig/h/k$e;)V", "Lkotlin/Function2;", "bitmapCallback", "(Landroid/view/View;Landroid/graphics/Bitmap;Lb55;)V", "startRecording", "reset$userleap_release", "reset", "onTouch", "(Landroid/graphics/Point;)V", "captureScreenshot$userleap_release", "(Landroid/graphics/Point;Lsprig/h/k$e;)V", "captureScreenshot", "I", "c", "Ljava/util/List;", "Ljava/lang/ref/WeakReference;", "Lsprig/b/h;", "d", "Ljava/lang/ref/WeakReference;", "_webView", "Landroid/os/Handler;", "e", "Landroid/os/Handler;", "handler", "Lm15;", "activity", "getActivity", "()Ljava/lang/ref/WeakReference;", "setActivity", "(Ljava/lang/ref/WeakReference;)V", "f", "_rootView", "g", "J", "getReplayWindowSize", "()J", "setReplayWindowSize", "replayWindowSize", "Lva6;", "h", "Lva6;", "currentRecording", "", "i", "Z", "getRecording$userleap_release", "()Z", "setRecording$userleap_release", "(Z)V", "recording", "j", "copyFileAndUploadJob", "Landroid/graphics/Paint;", "k", "Landroid/graphics/Paint;", "blurPaint", "l", "touchPaint", "m", "strokePaint", "n", "swipePaint", "Lsb2;", "o", "Lsb2;", "coroutineScope", "Lsprig/h/e;", "fileManager", "Lsprig/h/e;", "getFileManager$userleap_release", "()Lsprig/h/e;", "setFileManager$userleap_release", "(Lsprig/h/e;)V", "p", "backgroundTimestamp", "q", "pauseTime", "Lcom/userleap/internal/sessions/util/RecorderLifecycleObserver;", "r", "Lcom/userleap/internal/sessions/util/RecorderLifecycleObserver;", "lifecycleObserver", "Lsprig/h/i;", "s", "Lsprig/h/i;", "metrics", "Lsprig/j/e;", "t", "Lsprig/j/e;", "logger", "", "Lsprig/h/k$c;", "u", "touchEvents", "value", "getWebView$userleap_release", "()Lsprig/b/h;", "setWebView$userleap_release", "(Lsprig/b/h;)V", "webView", "getRootView", "()Landroid/view/View;", "setRootView", "(Landroid/view/View;)V", "rootView", "Landroid/content/Context;", "getContext", "()Landroid/content/Context;", "context", "Companion", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class k {
    public static final String TAG = "SessionRecorder";

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final int framesPerSecond;
    public WeakReference<m15> activity;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final int jpegQuality;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public final List redactors;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    public WeakReference _webView;

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    public final Handler handler;

    /* JADX INFO: renamed from: f, reason: from kotlin metadata */
    public WeakReference _rootView;
    public sprig.graphics.e fileManager;

    /* JADX INFO: renamed from: g, reason: from kotlin metadata */
    public long replayWindowSize;

    /* JADX INFO: renamed from: h, reason: from kotlin metadata */
    public va6 currentRecording;

    /* JADX INFO: renamed from: i, reason: from kotlin metadata */
    public boolean recording;

    /* JADX INFO: renamed from: j, reason: from kotlin metadata */
    public va6 copyFileAndUploadJob;

    /* JADX INFO: renamed from: k, reason: from kotlin metadata */
    public final Paint blurPaint;

    /* JADX INFO: renamed from: l, reason: from kotlin metadata */
    public final Paint touchPaint;

    /* JADX INFO: renamed from: m, reason: from kotlin metadata */
    public final Paint strokePaint;

    /* JADX INFO: renamed from: n, reason: from kotlin metadata */
    public final Paint swipePaint;

    /* JADX INFO: renamed from: o, reason: from kotlin metadata */
    public final sb2 coroutineScope;

    /* JADX INFO: renamed from: p, reason: from kotlin metadata */
    public long backgroundTimestamp;

    /* JADX INFO: renamed from: q, reason: from kotlin metadata */
    public long pauseTime;

    /* JADX INFO: renamed from: r, reason: from kotlin metadata */
    public RecorderLifecycleObserver lifecycleObserver;

    /* JADX INFO: renamed from: s, reason: from kotlin metadata */
    public final sprig.graphics.i metrics;

    /* JADX INFO: renamed from: t, reason: from kotlin metadata */
    public sprig.j.e logger;

    /* JADX INFO: renamed from: u, reason: from kotlin metadata */
    public final List touchEvents;
    public static final List v = d46.Q(RedactorsKt.getInputRedactor());

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\b\n\u0002\b\t\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0007\u001a\u00020\u0002\u0012\u0006\u0010\b\u001a\u00020\u0002\u0012\u0006\u0010\t\u001a\u00020\u0002\u0012\u0006\u0010\n\u001a\u00020\u0002¢\u0006\u0004\b\u001c\u0010\u001dJ\t\u0010\u0003\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0004\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0005\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0006\u001a\u00020\u0002HÆ\u0003J1\u0010\u000b\u001a\u00020\u00002\b\b\u0002\u0010\u0007\u001a\u00020\u00022\b\b\u0002\u0010\b\u001a\u00020\u00022\b\b\u0002\u0010\t\u001a\u00020\u00022\b\b\u0002\u0010\n\u001a\u00020\u0002HÆ\u0001J\t\u0010\r\u001a\u00020\fHÖ\u0001J\t\u0010\u000e\u001a\u00020\u0002HÖ\u0001J\u0013\u0010\u0011\u001a\u00020\u00102\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u0017\u0010\u0007\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0012\u0010\u0013\u001a\u0004\b\u0014\u0010\u0015R\u0017\u0010\b\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0016\u0010\u0013\u001a\u0004\b\u0017\u0010\u0015R\u0017\u0010\t\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0018\u0010\u0013\u001a\u0004\b\u0019\u0010\u0015R\u0017\u0010\n\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u001a\u0010\u0013\u001a\u0004\b\u001b\u0010\u0015¨\u0006\u001e"}, d2 = {"Lsprig/h/k$a;", "", "", "component1", "component2", "component3", "component4", "x", "y", "width", "height", "copy", "", "toString", "hashCode", "other", "", "equals", "a", "I", "getX", "()I", "b", "getY", "c", "getWidth", "d", "getHeight", "<init>", "(IIII)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final /* data */ class a {

        /* JADX INFO: renamed from: a, reason: from kotlin metadata */
        public final int x;

        /* JADX INFO: renamed from: b, reason: from kotlin metadata */
        public final int y;

        /* JADX INFO: renamed from: c, reason: from kotlin metadata */
        public final int width;

        /* JADX INFO: renamed from: d, reason: from kotlin metadata */
        public final int height;

        public a(int i, int i2, int i3, int i4) {
            this.x = i;
            this.y = i2;
            this.width = i3;
            this.height = i4;
        }

        public static /* synthetic */ a copy$default(a aVar, int i, int i2, int i3, int i4, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                i = aVar.x;
            }
            if ((i5 & 2) != 0) {
                i2 = aVar.y;
            }
            if ((i5 & 4) != 0) {
                i3 = aVar.width;
            }
            if ((i5 & 8) != 0) {
                i4 = aVar.height;
            }
            return aVar.copy(i, i2, i3, i4);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final int getX() {
            return this.x;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final int getY() {
            return this.y;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final int getWidth() {
            return this.width;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final int getHeight() {
            return this.height;
        }

        public final a copy(int x, int y, int width, int height) {
            return new a(x, y, width, height);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof a)) {
                return false;
            }
            a aVar = (a) other;
            return this.x == aVar.x && this.y == aVar.y && this.width == aVar.width && this.height == aVar.height;
        }

        public final int getHeight() {
            return this.height;
        }

        public final int getWidth() {
            return this.width;
        }

        public final int getX() {
            return this.x;
        }

        public final int getY() {
            return this.y;
        }

        public int hashCode() {
            return (((((this.x * 31) + this.y) * 31) + this.width) * 31) + this.height;
        }

        public String toString() {
            int i = this.x;
            int i2 = this.y;
            int i3 = this.width;
            int i4 = this.height;
            StringBuilder sbB = ev6.B(i, i2, "Blur(x=", ", y=", ", width=");
            sbB.append(i3);
            sbB.append(", height=");
            sbB.append(i4);
            sbB.append(")");
            return sbB.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\n\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0002¢\u0006\u0004\b\u0015\u0010\u0016J\t\u0010\u0003\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0004\u001a\u00020\u0002HÆ\u0003J\u001d\u0010\u0007\u001a\u00020\u00002\b\b\u0002\u0010\u0005\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u0002HÆ\u0001J\t\u0010\t\u001a\u00020\bHÖ\u0001J\t\u0010\u000b\u001a\u00020\nHÖ\u0001J\u0013\u0010\u000e\u001a\u00020\r2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u0017\u0010\u0005\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012R\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0010\u001a\u0004\b\u0014\u0010\u0012¨\u0006\u0017"}, d2 = {"Lsprig/h/k$e;", "", "Landroid/graphics/Point;", "component1", "component2", "start", "end", "copy", "", "toString", "", "hashCode", "other", "", "equals", "a", "Landroid/graphics/Point;", "getStart", "()Landroid/graphics/Point;", "b", "getEnd", "<init>", "(Landroid/graphics/Point;Landroid/graphics/Point;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final /* data */ class e {

        /* JADX INFO: renamed from: a, reason: from kotlin metadata */
        public final Point start;

        /* JADX INFO: renamed from: b, reason: from kotlin metadata */
        public final Point end;

        public e(Point point, Point point2) {
            point.getClass();
            point2.getClass();
            this.start = point;
            this.end = point2;
        }

        public static /* synthetic */ e copy$default(e eVar, Point point, Point point2, int i, Object obj) {
            if ((i & 1) != 0) {
                point = eVar.start;
            }
            if ((i & 2) != 0) {
                point2 = eVar.end;
            }
            return eVar.copy(point, point2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Point getStart() {
            return this.start;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Point getEnd() {
            return this.end;
        }

        public final e copy(Point start, Point end) {
            start.getClass();
            end.getClass();
            return new e(start, end);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof e)) {
                return false;
            }
            e eVar = (e) other;
            return g76.L(this.start, eVar.start) && g76.L(this.end, eVar.end);
        }

        public final Point getEnd() {
            return this.end;
        }

        public final Point getStart() {
            return this.start;
        }

        public int hashCode() {
            return this.end.hashCode() + (this.start.hashCode() * 31);
        }

        public String toString() {
            return "SwipeData(start=" + this.start + ziYqbdHrAXvj.sDq + this.end + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.util.SessionRecorder$cancelRecording$1", f = "SessionRecorder.kt", l = {}, m = "invokeSuspend")
    public static final class f extends p4d implements b55 {
        int label;

        public f(n92<? super f> n92Var) {
            super(2, n92Var);
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return k.this.new f(n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((f) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            if (this.label != 0) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            d2a d2aVar = d2a.i;
            d2a.i.f.b(k.this.lifecycleObserver);
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.util.SessionRecorder$cancelRecording$2", f = "SessionRecorder.kt", l = {191, 192}, m = "invokeSuspend")
    public static final class g extends p4d implements b55 {
        int label;

        public g(n92<? super g> n92Var) {
            super(2, n92Var);
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return k.this.new g(n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((g) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        /* JADX WARN: Code restructure failed: missing block: B:16:0x0048, code lost:
        
            if (r4.removeOldFiles(r5, 0, r9) == r0) goto L17;
         */
        @Override // defpackage.kn0
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final java.lang.Object invokeSuspend(java.lang.Object r11) {
            /*
                r10 = this;
                tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
                int r1 = r10.label
                r2 = 0
                r3 = 2
                r4 = 1
                if (r1 == 0) goto L1c
                if (r1 == r4) goto L18
                if (r1 != r3) goto L12
                defpackage.br7.v(r11)
                r9 = r10
                goto L4b
            L12:
                java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
                defpackage.ygf.f(r10)
                return r2
            L18:
                defpackage.br7.v(r11)
                goto L35
            L1c:
                defpackage.br7.v(r11)
                sprig.h.k r11 = sprig.graphics.k.this
                r11.reset$userleap_release()
                sprig.h.k r11 = sprig.graphics.k.this
                va6 r11 = sprig.graphics.k.access$getCurrentRecording$p(r11)
                if (r11 == 0) goto L35
                r10.label = r4
                java.lang.Object r11 = defpackage.bo.E(r11, r10)
                if (r11 != r0) goto L35
                goto L4a
            L35:
                sprig.h.k r11 = sprig.graphics.k.this
                sprig.h.e r4 = r11.getFileManager$userleap_release()
                long r5 = java.lang.System.currentTimeMillis()
                r10.label = r3
                r7 = 0
                r9 = r10
                java.lang.Object r10 = r4.removeOldFiles(r5, r7, r9)
                if (r10 != r0) goto L4b
            L4a:
                return r0
            L4b:
                sprig.h.k r10 = sprig.graphics.k.this
                r10.setRootView(r2)
                c1e r10 = defpackage.c1e.a
                return r10
            */
            throw new UnsupportedOperationException("Method not decompiled: sprig.h.k.g.invokeSuspend(java.lang.Object):java.lang.Object");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lsprig/h/k$c;", "it", "", "invoke", "(Lsprig/h/k$c;)Ljava/lang/Boolean;", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class i extends co6 implements x45 {
        final /* synthetic */ long $currentTime;
        final /* synthetic */ long $olderThan;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public i(long j, long j2) {
            super(1);
            this.$currentTime = j;
            this.$olderThan = j2;
        }

        @Override // defpackage.x45
        public final Boolean invoke(c cVar) {
            cVar.getClass();
            return Boolean.valueOf(cVar.getTimestamp() < this.$currentTime - this.$olderThan);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.util.SessionRecorder$onBackground$1", f = "SessionRecorder.kt", l = {218}, m = "invokeSuspend")
    public static final class m extends p4d implements b55 {
        int label;

        public m(n92<? super m> n92Var) {
            super(2, n92Var);
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return k.this.new m(n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((m) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
            int i = this.label;
            if (i == 0) {
                br7.v(obj);
                k.this.backgroundTimestamp = System.currentTimeMillis();
                k.this.setRecording$userleap_release(false);
                va6 va6Var = k.this.currentRecording;
                if (va6Var != null) {
                    this.label = 1;
                    if (bo.E(va6Var, this) == tb2Var) {
                        return tb2Var;
                    }
                }
            } else {
                if (i != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
            }
            k.this.currentRecording = null;
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.util.SessionRecorder$onTouch$1", f = "SessionRecorder.kt", l = {}, m = "invokeSuspend")
    public static final class n extends p4d implements b55 {
        final /* synthetic */ Point $touchPoint;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public n(Point point, n92<? super n> n92Var) {
            super(2, n92Var);
            this.$touchPoint = point;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return k.this.new n(this.$touchPoint, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((n) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) throws JSONException {
            if (this.label != 0) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            k.captureScreenshot$userleap_release$default(k.this, this.$touchPoint, null, 2, null);
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    @uv2(c = "com.userleap.internal.sessions.util.SessionRecorder", f = "SessionRecorder.kt", l = {255, 260, 261}, m = "recordSession")
    public static final class o extends p92 {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public o(n92<? super o> n92Var) {
            super(n92Var);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return k.this.a(this);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.util.SessionRecorder$startRecording$1", f = "SessionRecorder.kt", l = {}, m = "invokeSuspend")
    public static final class p extends p4d implements b55 {
        int label;

        public p(n92<? super p> n92Var) {
            super(2, n92Var);
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return k.this.new p(n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((p) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            if (this.label != 0) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            d2a d2aVar = d2a.i;
            d2a.i.f.a(k.this.lifecycleObserver);
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.util.SessionRecorder$startRecording$2", f = "SessionRecorder.kt", l = {174, NikonType2MakernoteDirectory.TAG_UNKNOWN_30}, m = "invokeSuspend")
    public static final class q extends p4d implements b55 {
        Object L$0;
        int label;

        public q(n92<? super q> n92Var) {
            super(2, n92Var);
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return k.this.new q(n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((q) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) throws JSONException {
            k kVar;
            tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
            int i = this.label;
            c1e c1eVar = c1e.a;
            if (i != 0) {
                if (i != 1) {
                    if (i == 2) {
                        br7.v(obj);
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                kVar = (k) this.L$0;
                br7.v(obj);
                this.L$0 = null;
                this.label = 2;
                return kVar.a(this) != tb2Var ? tb2Var : c1eVar;
            }
            br7.v(obj);
            if (k.this.getContext() == null) {
                sprig.j.e.logError$default(k.this.logger, "Cannot start recording session", null, "Context is null", null, null, null, 58, null);
                k.this.setRecording$userleap_release(false);
            }
            Context context = k.this.getContext();
            if (context == null) {
                return c1eVar;
            }
            k kVar2 = k.this;
            if (kVar2.fileManager == null) {
                kVar2.setFileManager$userleap_release(new sprig.graphics.e(context, null, 2, null));
            }
            sprig.graphics.e fileManager$userleap_release = k.this.getFileManager$userleap_release();
            if (fileManager$userleap_release.getCurrentDirectory() == null) {
                fileManager$userleap_release = null;
            }
            if (fileManager$userleap_release != null) {
                k kVar3 = k.this;
                kVar3.setFileManager$userleap_release(fileManager$userleap_release);
                long jCurrentTimeMillis = System.currentTimeMillis();
                this.L$0 = kVar3;
                this.label = 1;
                if (sprig.graphics.e.removeOldFiles$default(fileManager$userleap_release, jCurrentTimeMillis, 0L, this, 2, null) != tb2Var) {
                    kVar = kVar3;
                    this.L$0 = null;
                    this.label = 2;
                    if (kVar.a(this) != tb2Var) {
                    }
                }
            }
        }
    }

    public k(kb2 kb2Var, int i2, int i3, List<? extends ViewRedactor> list) {
        kb2Var.getClass();
        list.getClass();
        this.framesPerSecond = i2;
        this.jpegQuality = i3;
        this.redactors = list;
        this._webView = new WeakReference(null);
        this.handler = new Handler(Looper.getMainLooper());
        this.replayWindowSize = 60L;
        Paint paint = new Paint();
        paint.setColor(-16777216);
        this.blurPaint = paint;
        Paint paint2 = new Paint();
        paint2.setColor(Color.rgb(250, Mp4VideoDirectory.TAG_DEPTH, 51));
        this.touchPaint = paint2;
        Paint paint3 = new Paint();
        paint3.setColor(Color.rgb(249, 198, 0));
        paint3.setStrokeWidth(2.0f);
        Paint.Style style = Paint.Style.STROKE;
        paint3.setStyle(style);
        this.strokePaint = paint3;
        Paint paint4 = new Paint();
        paint4.setColor(Color.rgb(250, Mp4VideoDirectory.TAG_DEPTH, 51));
        paint4.setStrokeWidth(8.0f);
        paint4.setStyle(style);
        this.swipePaint = paint4;
        this.coroutineScope = o7f.c(kb2Var);
        this.lifecycleObserver = new RecorderLifecycleObserver(new j(this), new C0027k(this));
        this.metrics = new sprig.graphics.i(500, new l());
        this.logger = new sprig.j.e();
        this.touchEvents = new ArrayList();
    }

    public static /* synthetic */ void captureScreenshot$userleap_release$default(k kVar, Point point, e eVar, int i2, Object obj) throws JSONException {
        if ((i2 & 1) != 0) {
            point = null;
        }
        if ((i2 & 2) != 0) {
            eVar = null;
        }
        kVar.captureScreenshot$userleap_release(point, eVar);
    }

    public static /* synthetic */ void drawRectsOnCanvas$default(k kVar, Canvas canvas, List list, int i2, int i3, Object obj) {
        if ((i3 & 4) != 0) {
            i2 = -16777216;
        }
        kVar.a(canvas, list, i2);
    }

    public static /* synthetic */ void drawSwipeOnCanvas$default(k kVar, Canvas canvas, e eVar, int i2, Object obj) {
        if ((i2 & 2) != 0) {
            eVar = null;
        }
        kVar.a(canvas, eVar);
    }

    public static /* synthetic */ void drawTouchOnCanvas$default(k kVar, Canvas canvas, Point point, int i2, Object obj) {
        if ((i2 & 2) != 0) {
            point = null;
        }
        kVar.a(canvas, point);
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0073 A[PHI: r12
      0x0073: PHI (r12v2 'this' sprig.h.k) = (r12v1 'this' sprig.h.k), (r12v7 'this' sprig.h.k) binds: [B:24:0x0070, B:16:0x0036] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x007e A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.n92 r13) throws org.json.JSONException {
        /*
            r12 = this;
            boolean r0 = r13 instanceof sprig.h.k.o
            if (r0 == 0) goto L13
            r0 = r13
            sprig.h.k$o r0 = (sprig.h.k.o) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.label = r1
            goto L18
        L13:
            sprig.h.k$o r0 = new sprig.h.k$o
            r0.<init>(r13)
        L18:
            java.lang.Object r13 = r0.result
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.label
            c1e r3 = defpackage.c1e.a
            r4 = 2
            r5 = 1
            r6 = 3
            r7 = 0
            if (r2 == 0) goto L46
            if (r2 == r5) goto L3e
            if (r2 == r4) goto L36
            if (r2 != r6) goto L30
            defpackage.br7.v(r13)
            goto L7e
        L30:
            java.lang.String r12 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r12)
            return r7
        L36:
            java.lang.Object r12 = r0.L$0
            sprig.h.k r12 = (sprig.graphics.k) r12
            defpackage.br7.v(r13)
            goto L73
        L3e:
            java.lang.Object r12 = r0.L$0
            sprig.h.k r12 = (sprig.graphics.k) r12
            defpackage.br7.v(r13)
            goto L5a
        L46:
            defpackage.br7.v(r13)
            boolean r13 = r12.recording
            if (r13 == 0) goto L7e
            long r8 = r12.replayWindowSize
            r0.L$0 = r12
            r0.label = r5
            java.lang.Object r13 = r12.a(r8, r0)
            if (r13 != r1) goto L5a
            goto L7d
        L5a:
            long r8 = r12.replayWindowSize
            r12.a(r8)
            captureScreenshot$userleap_release$default(r12, r7, r7, r6, r7)
            int r13 = r12.framesPerSecond
            long r8 = (long) r13
            r10 = 1000(0x3e8, double:4.94E-321)
            long r10 = r10 / r8
            r0.L$0 = r12
            r0.label = r4
            java.lang.Object r13 = defpackage.gsa.X(r10, r0)
            if (r13 != r1) goto L73
            goto L7d
        L73:
            r0.L$0 = r7
            r0.label = r6
            java.lang.Object r12 = r12.a(r0)
            if (r12 != r1) goto L7e
        L7d:
            return r1
        L7e:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: sprig.graphics.k.a(n92):java.lang.Object");
    }

    public final List b(View view) {
        List listA = a(view);
        ArrayList<View> arrayList = new ArrayList();
        for (Object obj : listA) {
            View view2 = (View) obj;
            List list = this.redactors;
            if (list == null || !list.isEmpty()) {
                Iterator it2 = list.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    if (((ViewRedactor) it2.next()).shouldRedact(view2)) {
                        arrayList.add(obj);
                        break;
                    }
                }
            }
        }
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
        for (View view3 : arrayList) {
            int[] iArr = new int[2];
            view3.getLocationOnScreen(iArr);
            int i2 = iArr[0];
            arrayList2.add(new Rect(i2, iArr[1], view3.getWidth() + i2, view3.getHeight() + iArr[1]));
        }
        return arrayList2;
    }

    public final void captureScreenshot$userleap_release(Point touchPoint, e swipe) throws JSONException {
        k kVar;
        Object ajbVar;
        View rootView;
        try {
            if (!this.recording || (rootView = getRootView()) == null || rootView.getWidth() == 0 || rootView.getHeight() == 0) {
                kVar = this;
            } else {
                android.graphics.Bitmap bitmapCreateBitmap = android.graphics.Bitmap.createBitmap(rootView.getWidth(), rootView.getHeight(), Bitmap.Config.ARGB_8888);
                bitmapCreateBitmap.getClass();
                kVar = this;
                try {
                    rootView.post(new ep0(kVar, rootView, bitmapCreateBitmap, touchPoint, swipe, 5));
                } catch (Throwable th) {
                    th = th;
                    ajbVar = new ajb(th);
                }
            }
            ajbVar = c1e.a;
        } catch (Throwable th2) {
            th = th2;
            kVar = this;
        }
        Throwable thB = bjb.b(ajbVar);
        if (thB != null) {
            sprig.j.e eVar = kVar.logger;
            String message = thB.getMessage();
            if (message == null) {
                message = "";
            }
            sprig.j.e.logError$default(eVar, "Error capturing screenshot", null, message, kyd.h0(thB), null, null, 50, null);
        }
    }

    public final WeakReference<m15> getActivity() {
        WeakReference<m15> weakReference = this.activity;
        if (weakReference != null) {
            return weakReference;
        }
        g76.g0("activity");
        throw null;
    }

    public final Context getContext() {
        View rootView = getRootView();
        if (rootView != null) {
            return rootView.getContext();
        }
        return null;
    }

    public final sprig.graphics.e getFileManager$userleap_release() {
        sprig.graphics.e eVar = this.fileManager;
        if (eVar != null) {
            return eVar;
        }
        g76.g0("fileManager");
        throw null;
    }

    /* JADX INFO: renamed from: getRecording$userleap_release, reason: from getter */
    public final boolean getRecording() {
        return this.recording;
    }

    public final long getReplayWindowSize() {
        return this.replayWindowSize;
    }

    public final View getRootView() {
        WeakReference weakReference = this._rootView;
        if (weakReference != null) {
            return (View) weakReference.get();
        }
        return null;
    }

    public final h getWebView$userleap_release() {
        return (h) this._webView.get();
    }

    public final void onTouch(Point touchPoint) {
        touchPoint.getClass();
        this.touchEvents.add(new c(System.currentTimeMillis(), d.TOUCH, null, null, 12, null));
        vx0.c0(this.coroutineScope, null, null, new n(touchPoint, null), 3);
    }

    public final void reset$userleap_release() {
        this.recording = false;
        this.pauseTime = 0L;
        this.backgroundTimestamp = 0L;
    }

    public final void setActivity(WeakReference<m15> weakReference) {
        weakReference.getClass();
        this.activity = weakReference;
    }

    public final void setFileManager$userleap_release(sprig.graphics.e eVar) {
        eVar.getClass();
        this.fileManager = eVar;
    }

    public final void setRecording$userleap_release(boolean z) {
        this.recording = z;
    }

    public final void setReplayWindowSize(long j2) {
        this.replayWindowSize = j2;
    }

    public final void setRootView(View view) {
        WeakReference weakReference;
        if (view != null) {
            weakReference = new WeakReference(view);
        } else {
            WeakReference weakReference2 = this._rootView;
            if (weakReference2 != null) {
                weakReference2.clear();
            }
            weakReference = null;
        }
        this._rootView = weakReference;
    }

    public final void setWebView$userleap_release(h hVar) {
        this._webView = new WeakReference(hVar);
    }

    public final void startRecording() {
        if (this.recording) {
            return;
        }
        sb2 sb2Var = this.coroutineScope;
        r13 r13Var = xg3.a;
        vx0.c0(sb2Var, ff7.a, null, new p(null), 2);
        va6 va6Var = this.currentRecording;
        if (va6Var != null) {
            va6Var.m(null);
        }
        reset$userleap_release();
        this.recording = true;
        b.INSTANCE.onEvent(new SprigEvent(EventName.REPLAY_CAPTURE_STARTED, null));
        this.currentRecording = vx0.c0(this.coroutineScope, null, null, new q(null), 3);
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\b\b\u0086\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\b¨\u0006\t"}, d2 = {"Lsprig/h/k$d;", "", "<init>", "(Ljava/lang/String;I)V", "TOUCH", "SWIPE", "TRACK_EVENT", "SHOW_SURVEY", "SUBMIT_SURVEY", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class d {
        public static final d TOUCH = new C0026d("TOUCH", 0);
        public static final d SWIPE = new c("SWIPE", 1);
        public static final d TRACK_EVENT = new e("TRACK_EVENT", 2);
        public static final d SHOW_SURVEY = new a("SHOW_SURVEY", 3);
        public static final d SUBMIT_SURVEY = new b(mgKMENwrbHf.npitPwkVtPxOLfX, 4);
        public static final /* synthetic */ d[] a = a();

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\bÆ\u0001\u0018\u00002\u00020\u0001J\b\u0010\u0003\u001a\u00020\u0002H\u0016¨\u0006\u0004"}, d2 = {"Lsprig/h/k$d$a;", "Lsprig/h/k$d;", "", "toString", "userleap_release"}, k = 1, mv = {1, 8, 0})
        public static final class a extends d {
            public a(String str, int i) {
                super(str, i, null);
            }

            @Override // java.lang.Enum
            public String toString() {
                return "Sprig_ShowSurvey";
            }
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\bÆ\u0001\u0018\u00002\u00020\u0001J\b\u0010\u0003\u001a\u00020\u0002H\u0016¨\u0006\u0004"}, d2 = {"Lsprig/h/k$d$b;", "Lsprig/h/k$d;", "", "toString", "userleap_release"}, k = 1, mv = {1, 8, 0})
        public static final class b extends d {
            public b(String str, int i) {
                super(str, i, null);
            }

            @Override // java.lang.Enum
            public String toString() {
                return "Sprig_SubmitSurvey";
            }
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\bÆ\u0001\u0018\u00002\u00020\u0001J\b\u0010\u0003\u001a\u00020\u0002H\u0016¨\u0006\u0004"}, d2 = {"Lsprig/h/k$d$c;", "Lsprig/h/k$d;", "", "toString", "userleap_release"}, k = 1, mv = {1, 8, 0})
        public static final class c extends d {
            public c(String str, int i) {
                super(str, i, null);
            }

            @Override // java.lang.Enum
            public String toString() {
                return "Sprig_Swipe";
            }
        }

        /* JADX INFO: renamed from: sprig.h.k$d$d, reason: collision with other inner class name */
        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\bÆ\u0001\u0018\u00002\u00020\u0001J\b\u0010\u0003\u001a\u00020\u0002H\u0016¨\u0006\u0004"}, d2 = {"Lsprig/h/k$d$d;", "Lsprig/h/k$d;", "", "toString", "userleap_release"}, k = 1, mv = {1, 8, 0})
        public static final class C0026d extends d {
            public C0026d(String str, int i) {
                super(str, i, null);
            }

            @Override // java.lang.Enum
            public String toString() {
                return "Sprig_Touch";
            }
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\bÆ\u0001\u0018\u00002\u00020\u0001J\b\u0010\u0003\u001a\u00020\u0002H\u0016¨\u0006\u0004"}, d2 = {"Lsprig/h/k$d$e;", "Lsprig/h/k$d;", "", "toString", "userleap_release"}, k = 1, mv = {1, 8, 0})
        public static final class e extends d {
            public e(String str, int i) {
                super(str, i, null);
            }

            @Override // java.lang.Enum
            public String toString() {
                return "Sprig_TrackEvent";
            }
        }

        public /* synthetic */ d(String str, int i, gy2 gy2Var) {
            this(str, i);
        }

        public static final /* synthetic */ d[] a() {
            return new d[]{TOUCH, SWIPE, TRACK_EVENT, SHOW_SURVEY, SUBMIT_SURVEY};
        }

        public static d valueOf(String str) {
            return (d) Enum.valueOf(d.class, str);
        }

        public static d[] values() {
            return (d[]) a.clone();
        }

        public d(String str, int i) {
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    public /* synthetic */ class j extends x55 implements m45 {
        public j(Object obj) {
            super(0, 0, k.class, obj, "onBackground", "onBackground()V");
        }

        /* JADX INFO: renamed from: invoke, reason: collision with other method in class */
        public final void m172invoke() {
            ((k) this.receiver).a();
        }

        @Override // defpackage.m45
        public /* bridge */ /* synthetic */ Object invoke() {
            m172invoke();
            return c1e.a;
        }
    }

    /* JADX INFO: renamed from: sprig.h.k$k, reason: collision with other inner class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    public /* synthetic */ class C0027k extends x55 implements m45 {
        public C0027k(Object obj) {
            super(0, 0, k.class, obj, "onForeground", "onForeground()V");
        }

        /* JADX INFO: renamed from: invoke, reason: collision with other method in class */
        public final void m173invoke() {
            ((k) this.receiver).b();
        }

        @Override // defpackage.m45
        public /* bridge */ /* synthetic */ Object invoke() {
            m173invoke();
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u000b\n\u0002\u0010\u000b\n\u0002\b\u0013\b\u0086\b\u0018\u00002\u00020\u0001B/\u0012\u0006\u0010\u000b\u001a\u00020\u0002\u0012\u0006\u0010\f\u001a\u00020\u0004\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\b¢\u0006\u0004\b%\u0010&J\t\u0010\u0003\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0005\u001a\u00020\u0004HÆ\u0003J\u000b\u0010\u0007\u001a\u0004\u0018\u00010\u0006HÆ\u0003J\u0012\u0010\t\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0004\b\t\u0010\nJ<\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u000b\u001a\u00020\u00022\b\b\u0002\u0010\f\u001a\u00020\u00042\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\bHÆ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\t\u0010\u0011\u001a\u00020\u0006HÖ\u0001J\t\u0010\u0012\u001a\u00020\bHÖ\u0001J\u0013\u0010\u0015\u001a\u00020\u00142\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u0017\u0010\u000b\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0016\u0010\u0017\u001a\u0004\b\u0018\u0010\u0019R\u0017\u0010\f\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001a\u0010\u001b\u001a\u0004\b\u001c\u0010\u001dR\u0019\u0010\r\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u001e\u0010\u001f\u001a\u0004\b \u0010!R\u0019\u0010\u000e\u001a\u0004\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\"\u0010#\u001a\u0004\b$\u0010\n¨\u0006'"}, d2 = {"Lsprig/h/k$c;", "", "", "component1", "Lsprig/h/k$d;", "component2", "", "component3", "", "component4", "()Ljava/lang/Integer;", "timestamp", "type", "name", "surveyId", "copy", "(JLsprig/h/k$d;Ljava/lang/String;Ljava/lang/Integer;)Lsprig/h/k$c;", "toString", "hashCode", "other", "", "equals", "a", "J", "getTimestamp", "()J", "b", "Lsprig/h/k$d;", "getType", "()Lsprig/h/k$d;", "c", "Ljava/lang/String;", "getName", "()Ljava/lang/String;", "d", "Ljava/lang/Integer;", "getSurveyId", "<init>", "(JLsprig/h/k$d;Ljava/lang/String;Ljava/lang/Integer;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final /* data */ class c {

        /* JADX INFO: renamed from: a, reason: from kotlin metadata */
        public final long timestamp;

        /* JADX INFO: renamed from: b, reason: from kotlin metadata */
        public final d type;

        /* JADX INFO: renamed from: c, reason: from kotlin metadata */
        public final String name;

        /* JADX INFO: renamed from: d, reason: from kotlin metadata */
        public final Integer surveyId;

        public c(long j, d dVar, String str, Integer num) {
            dVar.getClass();
            this.timestamp = j;
            this.type = dVar;
            this.name = str;
            this.surveyId = num;
        }

        public static /* synthetic */ c copy$default(c cVar, long j, d dVar, String str, Integer num, int i, Object obj) {
            if ((i & 1) != 0) {
                j = cVar.timestamp;
            }
            long j2 = j;
            if ((i & 2) != 0) {
                dVar = cVar.type;
            }
            d dVar2 = dVar;
            if ((i & 4) != 0) {
                str = cVar.name;
            }
            String str2 = str;
            if ((i & 8) != 0) {
                num = cVar.surveyId;
            }
            return cVar.copy(j2, dVar2, str2, num);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final long getTimestamp() {
            return this.timestamp;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final d getType() {
            return this.type;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getName() {
            return this.name;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Integer getSurveyId() {
            return this.surveyId;
        }

        public final c copy(long timestamp, d type, String name, Integer surveyId) {
            type.getClass();
            return new c(timestamp, type, name, surveyId);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof c)) {
                return false;
            }
            c cVar = (c) other;
            return this.timestamp == cVar.timestamp && this.type == cVar.type && g76.L(this.name, cVar.name) && g76.L(this.surveyId, cVar.surveyId);
        }

        public final String getName() {
            return this.name;
        }

        public final Integer getSurveyId() {
            return this.surveyId;
        }

        public final long getTimestamp() {
            return this.timestamp;
        }

        public final d getType() {
            return this.type;
        }

        public int hashCode() {
            long j = this.timestamp;
            int iHashCode = (this.type.hashCode() + (((int) (j ^ (j >>> 32))) * 31)) * 31;
            String str = this.name;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            Integer num = this.surveyId;
            return iHashCode2 + (num != null ? num.hashCode() : 0);
        }

        public String toString() {
            return "EventDigest(timestamp=" + this.timestamp + ", type=" + this.type + ", name=" + this.name + ", surveyId=" + this.surveyId + ")";
        }

        public /* synthetic */ c(long j, d dVar, String str, Integer num, int i, gy2 gy2Var) {
            this(j, dVar, (i & 4) != 0 ? null : str, (i & 8) != 0 ? null : num);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"", "thresholdMs", "Lc1e;", "invoke", "(I)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class l extends co6 implements x45 {
        public l() {
            super(1);
        }

        public final void invoke(int i) throws JSONException {
            sprig.j.e.logError$default(k.this.logger, "Recording taking too long, cancelling recording", null, ev6.w("Metric threshold exceeded, threshold: ", i, "ms"), null, null, null, 58, null);
            k.this.a(EnumC0050b.REPLAY_TIME_ELAPSED);
        }

        @Override // defpackage.x45
        public /* bridge */ /* synthetic */ Object invoke(Object obj) throws JSONException {
            invoke(((Number) obj).intValue());
            return c1e.a;
        }
    }

    /* JADX INFO: renamed from: sprig.h.k$h, reason: from Kotlin metadata */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\b\u001a\u00020\u00052\u0006\u0010\u0001\u001a\u00020\u00002\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002H\n¢\u0006\u0004\b\u0006\u0010\u0007"}, d2 = {"Landroid/graphics/Bitmap;", "<anonymous parameter 0>", "", "Landroid/graphics/Rect;", "maskingRects", "Lc1e;", "invoke", "(Landroid/graphics/Bitmap;Ljava/util/List;)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class Bitmap extends co6 implements b55 {
        final /* synthetic */ android.graphics.Bitmap $bitmap;
        final /* synthetic */ CountDownLatch $metricLatch;
        final /* synthetic */ e $swipe;
        final /* synthetic */ Point $touchPoint;

        /* JADX INFO: renamed from: sprig.h.k$h$a */
        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
        @uv2(c = "com.userleap.internal.sessions.util.SessionRecorder$captureScreenshot$1$1$1$1$1$1", f = "SessionRecorder.kt", l = {}, m = "invokeSuspend")
        public static final class a extends p4d implements b55 {
            final /* synthetic */ android.graphics.Bitmap $bitmap;
            final /* synthetic */ List<Rect> $maskingRects;
            final /* synthetic */ CountDownLatch $metricLatch;
            final /* synthetic */ e $swipe;
            final /* synthetic */ k $this_runCatching;
            final /* synthetic */ Point $touchPoint;
            int label;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public a(android.graphics.Bitmap bitmap, k kVar, List<Rect> list, Point point, e eVar, CountDownLatch countDownLatch, n92<? super a> n92Var) {
                super(2, n92Var);
                this.$bitmap = bitmap;
                this.$this_runCatching = kVar;
                this.$maskingRects = list;
                this.$touchPoint = point;
                this.$swipe = eVar;
                this.$metricLatch = countDownLatch;
            }

            @Override // defpackage.kn0
            public final n92<c1e> create(Object obj, n92<?> n92Var) {
                return new a(this.$bitmap, this.$this_runCatching, this.$maskingRects, this.$touchPoint, this.$swipe, this.$metricLatch, n92Var);
            }

            @Override // defpackage.b55
            public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
                return ((a) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
            }

            @Override // defpackage.kn0
            public final Object invokeSuspend(Object obj) throws JSONException {
                if (this.label != 0) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Canvas canvas = new Canvas(this.$bitmap);
                k.drawRectsOnCanvas$default(this.$this_runCatching, canvas, this.$maskingRects, 0, 4, null);
                this.$this_runCatching.a(canvas, this.$touchPoint);
                this.$this_runCatching.a(canvas, this.$swipe);
                this.$this_runCatching.a(canvas);
                this.$metricLatch.countDown();
                this.$this_runCatching.b(this.$bitmap);
                this.$this_runCatching.a(this.$bitmap);
                return c1e.a;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Bitmap(android.graphics.Bitmap bitmap, Point point, e eVar, CountDownLatch countDownLatch) {
            super(2);
            this.$bitmap = bitmap;
            this.$touchPoint = point;
            this.$swipe = eVar;
            this.$metricLatch = countDownLatch;
        }

        public final void invoke(android.graphics.Bitmap bitmap, List<Rect> list) {
            bitmap.getClass();
            list.getClass();
            vx0.c0(k.this.coroutineScope, null, null, new a(this.$bitmap, k.this, list, this.$touchPoint, this.$swipe, this.$metricLatch, null), 3);
        }

        @Override // defpackage.b55
        public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
            invoke((android.graphics.Bitmap) obj, (List<Rect>) obj2);
            return c1e.a;
        }
    }

    public final void b(android.graphics.Bitmap bitmap) {
        if (bitmap.getWidth() == 0 || bitmap.getHeight() == 0) {
            ygf.f("Bitmap width or height is 0");
        }
    }

    public final void b() {
        if (this.backgroundTimestamp == 0) {
            return;
        }
        this.pauseTime = (System.currentTimeMillis() - this.backgroundTimestamp) + this.pauseTime;
        this.backgroundTimestamp = 0L;
        startRecording();
    }

    public final void a() {
        vx0.c0(this.coroutineScope, null, null, new m(null), 3);
    }

    public final void a(long olderThan) {
        bu1.S0(this.touchEvents, new i(System.currentTimeMillis(), olderThan));
    }

    public final Object a(long j2, n92 n92Var) throws JSONException {
        Object objRemoveOldFiles = getFileManager$userleap_release().removeOldFiles(System.currentTimeMillis(), j2, n92Var);
        return objRemoveOldFiles == tb2.COROUTINE_SUSPENDED ? objRemoveOldFiles : c1e.a;
    }

    public final List a(View view) {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        arrayList2.add(view);
        while (!arrayList2.isEmpty()) {
            View view2 = (View) arrayList2.remove(0);
            arrayList.add(view2);
            if (view2 instanceof ViewGroup) {
                ViewGroup viewGroup = (ViewGroup) view2;
                int childCount = viewGroup.getChildCount();
                for (int i2 = 0; i2 < childCount; i2++) {
                    View childAt = viewGroup.getChildAt(i2);
                    childAt.getClass();
                    arrayList2.add(childAt);
                }
            }
        }
        return arrayList;
    }

    public static final void a(k kVar, View view, android.graphics.Bitmap bitmap, Point point, e eVar) {
        kVar.getClass();
        view.getClass();
        bitmap.getClass();
        sprig.graphics.i iVar = kVar.metrics;
        sprig.graphics.g gVar = sprig.graphics.g.FRAME;
        CountDownLatch countDownLatch = new CountDownLatch(1);
        long jCurrentTimeMillis = System.currentTimeMillis();
        kVar.a(view, bitmap, kVar.new Bitmap(bitmap, point, eVar, countDownLatch));
        ExecutorService executorServiceNewSingleThreadExecutor = Executors.newSingleThreadExecutor();
        executorServiceNewSingleThreadExecutor.execute(new i.a(countDownLatch, jCurrentTimeMillis, iVar, gVar));
        executorServiceNewSingleThreadExecutor.shutdown();
    }

    public final void a(EnumC0050b reason) {
        sb2 sb2Var = this.coroutineScope;
        r13 r13Var = xg3.a;
        vx0.c0(sb2Var, ff7.a, null, new f(null), 2);
        vx0.c0(this.coroutineScope, null, null, new g(null), 3);
        if (reason == EnumC0050b.LOW_MEMORY) {
            va6 va6Var = this.copyFileAndUploadJob;
            if (va6Var != null) {
                CancellationException cancellationException = new CancellationException(reason.toString());
                cancellationException.initCause(null);
                va6Var.m(cancellationException);
            }
            this.copyFileAndUploadJob = null;
        }
    }

    public final void a(Canvas canvas) throws JSONException {
        Object ajbVar;
        try {
            h webView$userleap_release = getWebView$userleap_release();
            int width = webView$userleap_release != null ? webView$userleap_release.getWidth() : 0;
            h webView$userleap_release2 = getWebView$userleap_release();
            int height = webView$userleap_release2 != null ? webView$userleap_release2.getHeight() : 0;
            if (width != 0 && height != 0) {
                android.graphics.Bitmap bitmapCreateBitmap = android.graphics.Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
                bitmapCreateBitmap.getClass();
                Canvas canvas2 = new Canvas(bitmapCreateBitmap);
                h webView$userleap_release3 = getWebView$userleap_release();
                if (webView$userleap_release3 != null) {
                    webView$userleap_release3.draw(canvas2);
                }
                canvas.drawBitmap(bitmapCreateBitmap, (canvas.getWidth() - width) / 2, canvas.getHeight() - height, (Paint) null);
            }
            ajbVar = c1e.a;
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        Throwable thB = bjb.b(ajbVar);
        if (thB != null) {
            sprig.j.e eVar = this.logger;
            String message = thB.getMessage();
            if (message == null) {
                message = "";
            }
            sprig.j.e.logError$default(eVar, "Error drawing webview", message, kyd.h0(thB), null, null, null, 56, null);
        }
    }

    public k() {
        this(null, 0, 0, null, 15, null);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public k(kb2 kb2Var, int i2, int i3, List list, int i4, gy2 gy2Var) {
        if ((i4 & 1) != 0) {
            r13 r13Var = xg3.a;
            kb2Var = vz2.c;
        }
        this(kb2Var, (i4 & 2) != 0 ? 2 : i2, (i4 & 4) != 0 ? 50 : i3, (i4 & 8) != 0 ? v : list);
    }

    public final void a(android.graphics.Bitmap bitmap) {
        getFileManager$userleap_release().saveImage(String.valueOf(System.currentTimeMillis()), bitmap, this.jpegQuality, this.metrics);
    }

    public final void a(Canvas canvas, List maskingRects, int color) {
        sprig.graphics.i iVar = this.metrics;
        sprig.graphics.g gVar = sprig.graphics.g.FILTER;
        CountDownLatch countDownLatch = new CountDownLatch(1);
        long jCurrentTimeMillis = System.currentTimeMillis();
        Iterator it2 = maskingRects.iterator();
        while (it2.hasNext()) {
            Rect rect = (Rect) it2.next();
            float f2 = rect.left;
            float f3 = rect.top;
            float f4 = rect.right;
            float f5 = rect.bottom;
            Paint paint = new Paint();
            paint.setColor(color);
            canvas.drawRect(f2, f3, f4, f5, paint);
        }
        countDownLatch.countDown();
        ExecutorService executorServiceNewSingleThreadExecutor = Executors.newSingleThreadExecutor();
        executorServiceNewSingleThreadExecutor.execute(new i.a(countDownLatch, jCurrentTimeMillis, iVar, gVar));
        executorServiceNewSingleThreadExecutor.shutdown();
    }

    public final void a(Canvas canvas, Point touchPoint) {
        if (touchPoint == null) {
            return;
        }
        canvas.drawCircle(touchPoint.x + 16.0f, touchPoint.y + 16.0f, 32.0f, this.touchPaint);
        canvas.drawCircle(touchPoint.x + 16.0f, touchPoint.y + 16.0f, 32.0f, this.strokePaint);
    }

    public final void a(Canvas canvas, e swipe) {
        if (swipe == null) {
            return;
        }
        canvas.drawLine(swipe.getStart().x, swipe.getStart().y, swipe.getEnd().x, swipe.getEnd().y, this.swipePaint);
    }

    public final void a(View view, final android.graphics.Bitmap bitmap, final b55 bitmapCallback) throws JSONException {
        int i2 = Build.VERSION.SDK_INT;
        if (i2 >= 26) {
            m15 m15Var = getActivity().get();
            Window window = m15Var != null ? m15Var.getWindow() : null;
            if (window == null) {
                sprig.j.e.logError$default(this.logger, b09.w(i2, "Error drawing view for Build.VERSION.SDK_INT: "), null, "Window is null", "", null, null, 50, null);
                return;
            }
            final List listB = b(view);
            try {
                PixelCopy.request(window, bitmap, new PixelCopy.OnPixelCopyFinishedListener() { // from class: iif
                    @Override // android.view.PixelCopy.OnPixelCopyFinishedListener
                    public final void onPixelCopyFinished(int i3) {
                        k.a(this.a, bitmapCallback, bitmap, listB, i3);
                    }
                }, this.handler);
                return;
            } catch (Exception e2) {
                sprig.j.e eVar = this.logger;
                String strW = b09.w(Build.VERSION.SDK_INT, "Error drawing view for Build.VERSION.SDK_INT: ");
                String message = e2.getMessage();
                if (message == null) {
                    message = "";
                }
                sprig.j.e.logError$default(eVar, strW, null, message, kyd.h0(e2), null, null, 50, null);
                return;
            }
        }
        Canvas canvas = new Canvas(bitmap);
        view.draw(canvas);
        canvas.setBitmap(null);
        bitmapCallback.invoke(bitmap, b(view));
    }

    public static final void a(k kVar, b55 b55Var, android.graphics.Bitmap bitmap, List list, int i2) {
        kVar.getClass();
        b55Var.getClass();
        bitmap.getClass();
        list.getClass();
        if (i2 == 0) {
            kVar.handler.postAtFrontOfQueue(new ss(b55Var, bitmap, list, 20));
        }
    }

    public static final void a(b55 b55Var, android.graphics.Bitmap bitmap, List list) {
        b55Var.getClass();
        bitmap.getClass();
        list.getClass();
        b55Var.invoke(bitmap, list);
    }
}
