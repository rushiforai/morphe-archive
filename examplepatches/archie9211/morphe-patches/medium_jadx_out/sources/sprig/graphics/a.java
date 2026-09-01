package sprig.graphics;

import android.R;
import android.app.Activity;
import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.DisplayMetrics;
import android.util.Size;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.WindowMetrics;
import com.drew.metadata.iptc.IptcDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.google.android.gms.analytics.wYI.ivbZv;
import com.userleap.EventName;
import com.userleap.SprigEvent;
import com.userleap.SprigLoggingLevel;
import com.userleap.internal.data.ReplayRequest;
import com.userleap.internal.sessions.util.RecorderLifecycleObserver;
import com.userleap.internal.sessions.util.RedactorsKt;
import com.userleap.internal.sessions.util.ReplayEncoderWorker;
import com.userleap.internal.sessions.util.UploadWorker;
import defpackage.ajb;
import defpackage.b09;
import defpackage.b55;
import defpackage.bjb;
import defpackage.bo;
import defpackage.br7;
import defpackage.bu1;
import defpackage.c1e;
import defpackage.co6;
import defpackage.ct2;
import defpackage.d2a;
import defpackage.d46;
import defpackage.dt2;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.f09;
import defpackage.ff7;
import defpackage.flb;
import defpackage.g76;
import defpackage.gsa;
import defpackage.gy2;
import defpackage.ho2;
import defpackage.iy6;
import defpackage.j55;
import defpackage.j7f;
import defpackage.k55;
import defpackage.k7f;
import defpackage.ka1;
import defpackage.kb2;
import defpackage.kn8;
import defpackage.kyd;
import defpackage.lv8;
import defpackage.m45;
import defpackage.m7f;
import defpackage.n92;
import defpackage.o7f;
import defpackage.p4d;
import defpackage.p92;
import defpackage.pwd;
import defpackage.qd5;
import defpackage.qq7;
import defpackage.r13;
import defpackage.sb2;
import defpackage.tb2;
import defpackage.uv2;
import defpackage.va6;
import defpackage.vq6;
import defpackage.vt8;
import defpackage.vx0;
import defpackage.vz2;
import defpackage.w51;
import defpackage.w5d;
import defpackage.wo7;
import defpackage.wt8;
import defpackage.x45;
import defpackage.x51;
import defpackage.x55;
import defpackage.xg3;
import defpackage.y30;
import defpackage.ygf;
import java.io.File;
import java.lang.ref.WeakReference;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import kotlin.Metadata;
import org.json.JSONException;
import sprig.g.b;
import sprig.graphics.EnumC0050b;
import sprig.graphics.i;
import sprig.view.b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0084\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010!\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0000\u0018\u0000 §\u00012\u00020\u0001:\u0002(4B7\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\b\b\u0002\u0010\n\u001a\u00020\b¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\u000e\u001a\u00020\rH\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ#\u0010\u0013\u001a\u00020\r2\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\r0\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0017\u0010\u0017\u001a\u00020\r2\u0006\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\rH\u0000¢\u0006\u0004\b\u0019\u0010\u000fJ\u0017\u0010\u001d\u001a\u00020\r2\u0006\u0010\u001c\u001a\u00020\u001bH\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u0017\u0010!\u001a\u00020\r2\u0006\u0010 \u001a\u00020\u001fH\u0016¢\u0006\u0004\b!\u0010\"J\u0017\u0010%\u001a\u00020\r2\u0006\u0010$\u001a\u00020#H\u0016¢\u0006\u0004\b%\u0010&J\u0011\u0010(\u001a\u0004\u0018\u00010'H\u0002¢\u0006\u0004\b(\u0010)J\u0019\u0010(\u001a\u0004\u0018\u00010'2\u0006\u0010+\u001a\u00020*H\u0002¢\u0006\u0004\b(\u0010,J9\u0010(\u001a\u00020\r2\u0006\u0010.\u001a\u00020-2\f\u00100\u001a\b\u0012\u0004\u0012\u00020#0/2\u0012\u00101\u001a\u000e\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\r0\u0010H\u0002¢\u0006\u0004\b(\u00102J\u0017\u00104\u001a\u00020\u00042\u0006\u00103\u001a\u00020\u0004H\u0002¢\u0006\u0004\b4\u00105J\u000f\u00106\u001a\u00020\rH\u0002¢\u0006\u0004\b6\u0010\u000fJ\u000f\u00107\u001a\u00020\rH\u0002¢\u0006\u0004\b7\u0010\u000fJ\u0017\u0010(\u001a\u00020\r2\u0006\u00108\u001a\u00020\u0004H\u0002¢\u0006\u0004\b(\u00109J\u001b\u0010(\u001a\u00020\r2\u0006\u00108\u001a\u00020\u0004H\u0082@ø\u0001\u0000¢\u0006\u0004\b(\u0010:J\u0013\u00104\u001a\u00020\rH\u0082@ø\u0001\u0000¢\u0006\u0004\b4\u0010;J'\u0010(\u001a\u00020\r2\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u001b2\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u001fH\u0002¢\u0006\u0004\b(\u0010<J/\u0010(\u001a\u00020\r2\u0006\u0010>\u001a\u00020=2\b\u0010\u001c\u001a\u0004\u0018\u00010\u001b2\b\u0010 \u001a\u0004\u0018\u00010\u001fH\u0082@ø\u0001\u0000¢\u0006\u0004\b(\u0010?J\u0019\u0010(\u001a\u00020\r2\b\u0010A\u001a\u0004\u0018\u00010@H\u0002¢\u0006\u0004\b(\u0010BJ\u001d\u0010(\u001a\u0004\u0018\u00010@2\u0006\u0010>\u001a\u00020=H\u0082@ø\u0001\u0000¢\u0006\u0004\b(\u0010CJ\u0019\u0010(\u001a\b\u0012\u0004\u0012\u00020D0/H\u0082@ø\u0001\u0000¢\u0006\u0004\b(\u0010;J%\u0010(\u001a\u00020\r2\u0006\u0010F\u001a\u00020E2\f\u0010G\u001a\b\u0012\u0004\u0012\u00020D0/H\u0002¢\u0006\u0004\b(\u0010HJ\u0017\u00104\u001a\u00020\r2\u0006\u0010A\u001a\u00020@H\u0002¢\u0006\u0004\b4\u0010BJ#\u0010(\u001a\u00020\r2\u0006\u0010F\u001a\u00020E2\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u001bH\u0002¢\u0006\u0004\b(\u0010IJ#\u0010(\u001a\u00020\r2\u0006\u0010F\u001a\u00020E2\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u001fH\u0002¢\u0006\u0004\b(\u0010JR\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b(\u0010K\u001a\u0004\bL\u0010MR\"\u0010\u0005\u001a\u00020\u00048\u0016@\u0016X\u0096\u000e¢\u0006\u0012\n\u0004\b4\u0010N\u001a\u0004\bO\u0010P\"\u0004\bQ\u00109R\u0014\u0010\t\u001a\u00020\b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b6\u0010RR\u0014\u0010\n\u001a\u00020\b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b7\u0010RR\u001c\u0010W\u001a\b\u0012\u0004\u0012\u00020T0S8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bU\u0010VR\u0014\u0010[\u001a\u00020X8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bY\u0010ZR\u001b\u0010`\u001a\u00020\\8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b]\u0010^\u001a\u0004\b4\u0010_R\u0018\u0010d\u001a\u0004\u0018\u00010a8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bb\u0010cR\"\u0010l\u001a\u00020e8\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\bf\u0010g\u001a\u0004\bh\u0010i\"\u0004\bj\u0010kR\u0018\u0010n\u001a\u0004\u0018\u00010a8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bm\u0010cR\u0014\u0010r\u001a\u00020o8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bp\u0010qR\u0014\u0010t\u001a\u00020o8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bs\u0010qR\u0014\u0010v\u001a\u00020o8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bu\u0010qR\u0014\u0010x\u001a\u00020o8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bw\u0010qR\u0014\u0010|\u001a\u00020y8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bz\u0010{R&\u0010~\u001a\u00020}8\u0000@\u0000X\u0080.¢\u0006\u0016\n\u0004\b~\u0010\u007f\u001a\u0006\b\u0080\u0001\u0010\u0081\u0001\"\u0006\b\u0082\u0001\u0010\u0083\u0001R\u0018\u0010\u0085\u0001\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0007\n\u0005\b\u0084\u0001\u0010NR\u0018\u0010\u0087\u0001\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0007\n\u0005\b\u0086\u0001\u0010NR\u001a\u0010\u008b\u0001\u001a\u00030\u0088\u00018\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u0089\u0001\u0010\u008a\u0001R\u0018\u0010\u008f\u0001\u001a\u00030\u008c\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\b\u008d\u0001\u0010\u008e\u0001R\u001a\u0010\u0093\u0001\u001a\u00030\u0090\u00018\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u0091\u0001\u0010\u0092\u0001R\u001e\u0010\u0097\u0001\u001a\t\u0012\u0004\u0012\u00020#0\u0094\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\b\u0095\u0001\u0010\u0096\u0001R\u0018\u0010\u0099\u0001\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\u0007\n\u0005\b\u0098\u0001\u0010RR\u0018\u0010\u009d\u0001\u001a\u00030\u009a\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\b\u009b\u0001\u0010\u009c\u0001R\u0015\u0010+\u001a\u0004\u0018\u00010*8F¢\u0006\b\u001a\u0006\b\u009e\u0001\u0010\u009f\u0001R\u0016\u0010¢\u0001\u001a\u0004\u0018\u00010=8F¢\u0006\b\u001a\u0006\b \u0001\u0010¡\u0001R\u0017\u0010¦\u0001\u001a\u0005\u0018\u00010£\u00018F¢\u0006\b\u001a\u0006\b¤\u0001\u0010¥\u0001\u0082\u0002\u0004\n\u0002\b\u0019¨\u0006¨\u0001"}, d2 = {"Lsprig/f/a;", "Lsprig/d/b;", "Lcom/userleap/internal/data/ReplayRequest;", "replayRequest", "", "replayWindowSize", "Lkb2;", "dispatcher", "", "framesPerSecond", "jpegQuality", "<init>", "(Lcom/userleap/internal/data/ReplayRequest;JLkb2;II)V", "Lc1e;", "startRecordingScreen", "()V", "Lkotlin/Function1;", "Lsprig/g/b;", "completionHandler", "waitForCompletion", "(Lx45;)V", "Lsprig/h/b;", "reason", "cancelRecording", "(Lsprig/h/b;)V", "reset$userleap_release", "reset", "Landroid/graphics/Point;", "touchPoint", "onTouch", "(Landroid/graphics/Point;)V", "Lsprig/d/b$c;", "swipe", "onSwipe", "(Lsprig/d/b$c;)V", "Lsprig/d/b$a;", "digest", "addEventDigest", "(Lsprig/d/b$a;)V", "Landroid/util/Size;", "a", "()Landroid/util/Size;", "Landroid/app/Activity;", "activity", "(Landroid/app/Activity;)Landroid/util/Size;", "", "path", "", "eventDigest", "onComplete", "(Ljava/lang/String;Ljava/util/List;Lx45;)V", "lookBackSeconds", "b", "(J)J", "c", "d", "olderThan", "(J)V", "(JLn92;)Ljava/lang/Object;", "(Ln92;)Ljava/lang/Object;", "(Landroid/graphics/Point;Lsprig/d/b$c;)V", "Landroid/view/View;", "view", "(Landroid/view/View;Landroid/graphics/Point;Lsprig/d/b$c;Ln92;)Ljava/lang/Object;", "Landroid/graphics/Bitmap;", "bitmap", "(Landroid/graphics/Bitmap;)V", "(Landroid/view/View;Ln92;)Ljava/lang/Object;", "Lsprig/f/a$b;", "Landroid/graphics/Canvas;", "canvas", "modalBitmaps", "(Landroid/graphics/Canvas;Ljava/util/List;)V", "(Landroid/graphics/Canvas;Landroid/graphics/Point;)V", "(Landroid/graphics/Canvas;Lsprig/d/b$c;)V", "Lcom/userleap/internal/data/ReplayRequest;", "getReplayRequest", "()Lcom/userleap/internal/data/ReplayRequest;", "J", "getReplayWindowSize", "()J", "setReplayWindowSize", "I", "Ljava/lang/ref/WeakReference;", "Lsprig/b/h;", "e", "Ljava/lang/ref/WeakReference;", "_webView", "Landroid/os/Handler;", "f", "Landroid/os/Handler;", "handler", "", "g", "Lvq6;", "()F", "screenDensity", "Lva6;", "h", "Lva6;", "currentRecording", "", "i", "Z", "getRecording$userleap_release", "()Z", "setRecording$userleap_release", "(Z)V", "recording", "j", "copyFileAndUploadJob", "Landroid/graphics/Paint;", "k", "Landroid/graphics/Paint;", "blurPaint", "l", "touchPaint", "m", "strokePaint", "n", "swipePaint", "Lsb2;", "o", "Lsb2;", "coroutineScope", "Lsprig/h/e;", "fileManager", "Lsprig/h/e;", "getFileManager$userleap_release", "()Lsprig/h/e;", "setFileManager$userleap_release", "(Lsprig/h/e;)V", "p", "backgroundTimestamp", "q", "pauseTime", "Lcom/userleap/internal/sessions/util/RecorderLifecycleObserver;", "r", "Lcom/userleap/internal/sessions/util/RecorderLifecycleObserver;", "lifecycleObserver", "Lsprig/h/i;", "s", "Lsprig/h/i;", "metrics", "Lsprig/j/e;", "t", "Lsprig/j/e;", "logger", "", "u", "Ljava/util/List;", "touchEvents", "v", "frameCount", "Landroid/graphics/BitmapFactory$Options;", "w", "Landroid/graphics/BitmapFactory$Options;", "bitmapOptions", "getActivity", "()Landroid/app/Activity;", "getRootView", "()Landroid/view/View;", "rootView", "Landroid/content/Context;", "getContext", "()Landroid/content/Context;", "context", "Companion", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class a implements sprig.view.b {
    public static final String TAG = "SessionRecorder";

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final ReplayRequest replayRequest;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public long replayWindowSize;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public final int framesPerSecond;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    public final int jpegQuality;

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    public WeakReference _webView;

    /* JADX INFO: renamed from: f, reason: from kotlin metadata */
    public final Handler handler;
    public sprig.graphics.e fileManager;

    /* JADX INFO: renamed from: g, reason: from kotlin metadata */
    public final vq6 screenDensity;

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

    /* JADX INFO: renamed from: v, reason: from kotlin metadata */
    public int frameCount;

    /* JADX INFO: renamed from: w, reason: from kotlin metadata */
    public final BitmapFactory.Options bitmapOptions;
    public static final List x = d46.Q(RedactorsKt.getInputRedactor());

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0082\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0007\u001a\u00020\u0002\u0012\u0006\u0010\b\u001a\u00020\u0004\u0012\u0006\u0010\t\u001a\u00020\u0004¢\u0006\u0004\b\u001b\u0010\u001cJ\t\u0010\u0003\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0005\u001a\u00020\u0004HÆ\u0003J\t\u0010\u0006\u001a\u00020\u0004HÆ\u0003J'\u0010\n\u001a\u00020\u00002\b\b\u0002\u0010\u0007\u001a\u00020\u00022\b\b\u0002\u0010\b\u001a\u00020\u00042\b\b\u0002\u0010\t\u001a\u00020\u0004HÆ\u0001J\t\u0010\f\u001a\u00020\u000bHÖ\u0001J\t\u0010\r\u001a\u00020\u0004HÖ\u0001J\u0013\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u0017\u0010\u0007\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0011\u0010\u0012\u001a\u0004\b\u0013\u0010\u0014R\u0017\u0010\b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0015\u0010\u0016\u001a\u0004\b\u0017\u0010\u0018R\u0017\u0010\t\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0019\u0010\u0016\u001a\u0004\b\u001a\u0010\u0018¨\u0006\u001d"}, d2 = {"Lsprig/f/a$b;", "", "Landroid/graphics/Bitmap;", "component1", "", "component2", "component3", "bitmap", "width", "height", "copy", "", "toString", "hashCode", "other", "", "equals", "a", "Landroid/graphics/Bitmap;", "getBitmap", "()Landroid/graphics/Bitmap;", "b", "I", "getWidth", "()I", "c", "getHeight", "<init>", "(Landroid/graphics/Bitmap;II)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final /* data */ class b {

        /* JADX INFO: renamed from: a, reason: from kotlin metadata */
        public final Bitmap bitmap;

        /* JADX INFO: renamed from: b, reason: from kotlin metadata */
        public final int width;

        /* JADX INFO: renamed from: c, reason: from kotlin metadata */
        public final int height;

        public b(Bitmap bitmap, int i, int i2) {
            bitmap.getClass();
            this.bitmap = bitmap;
            this.width = i;
            this.height = i2;
        }

        public static /* synthetic */ b copy$default(b bVar, Bitmap bitmap, int i, int i2, int i3, Object obj) {
            if ((i3 & 1) != 0) {
                bitmap = bVar.bitmap;
            }
            if ((i3 & 2) != 0) {
                i = bVar.width;
            }
            if ((i3 & 4) != 0) {
                i2 = bVar.height;
            }
            return bVar.copy(bitmap, i, i2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Bitmap getBitmap() {
            return this.bitmap;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final int getWidth() {
            return this.width;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final int getHeight() {
            return this.height;
        }

        public final b copy(Bitmap bitmap, int width, int height) {
            bitmap.getClass();
            return new b(bitmap, width, height);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof b)) {
                return false;
            }
            b bVar = (b) other;
            return g76.L(this.bitmap, bVar.bitmap) && this.width == bVar.width && this.height == bVar.height;
        }

        public final Bitmap getBitmap() {
            return this.bitmap;
        }

        public final int getHeight() {
            return this.height;
        }

        public final int getWidth() {
            return this.width;
        }

        public int hashCode() {
            return (((this.bitmap.hashCode() * 31) + this.width) * 31) + this.height;
        }

        public String toString() {
            Bitmap bitmap = this.bitmap;
            int i = this.width;
            int i2 = this.height;
            StringBuilder sb = new StringBuilder("ModalBitmapInfo(bitmap=");
            sb.append(bitmap);
            sb.append(", width=");
            sb.append(i);
            sb.append(", height=");
            return ho2.H(sb, i2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder$cancelRecording$1", f = "ScreenshotRecorder.kt", l = {}, m = "invokeSuspend")
    public static final class c extends p4d implements b55 {
        int label;

        public c(n92<? super c> n92Var) {
            super(2, n92Var);
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return a.this.new c(n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((c) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            if (this.label != 0) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            try {
                d2a d2aVar = d2a.i;
                d2a.i.f.b(a.this.lifecycleObserver);
            } catch (Exception e) {
                sprig.j.e.logWarning$default(a.this.logger, "Failed to remove lifecycle observer", e.getMessage(), null, null, null, null, 60, null);
            }
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder$cancelRecording$2", f = "ScreenshotRecorder.kt", l = {485, 494}, m = "invokeSuspend")
    public static final class d extends p4d implements b55 {
        int label;

        public d(n92<? super d> n92Var) {
            super(2, n92Var);
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return a.this.new d(n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((d) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        /* JADX WARN: Code restructure failed: missing block: B:25:0x006b, code lost:
        
            if (r4.removeOldFiles(r5, 0, r9) == r0) goto L26;
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
                if (r1 == 0) goto L20
                if (r1 == r4) goto L1c
                if (r1 != r3) goto L16
                defpackage.br7.v(r11)     // Catch: java.lang.Exception -> L12
                goto L8a
            L12:
                r0 = move-exception
                r11 = r0
                r9 = r10
                goto L74
            L16:
                java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
                defpackage.ygf.f(r10)
                return r2
            L1c:
                defpackage.br7.v(r11)     // Catch: java.lang.Exception -> L12
                goto L34
            L20:
                defpackage.br7.v(r11)
                sprig.f.a r11 = sprig.graphics.a.this     // Catch: java.lang.Exception -> L71
                va6 r11 = sprig.graphics.a.access$getCurrentRecording$p(r11)     // Catch: java.lang.Exception -> L71
                if (r11 == 0) goto L34
                r10.label = r4     // Catch: java.lang.Exception -> L12
                java.lang.Object r11 = defpackage.bo.E(r11, r10)     // Catch: java.lang.Exception -> L12
                if (r11 != r0) goto L34
                goto L6d
            L34:
                sprig.f.a r11 = sprig.graphics.a.this     // Catch: java.lang.Exception -> L71
                sprig.graphics.a.access$setCurrentRecording$p(r11, r2)     // Catch: java.lang.Exception -> L71
                sprig.f.a r11 = sprig.graphics.a.this     // Catch: java.lang.Exception -> L71
                r1 = 0
                sprig.graphics.a.access$setPauseTime$p(r11, r1)     // Catch: java.lang.Exception -> L71
                sprig.f.a r11 = sprig.graphics.a.this     // Catch: java.lang.Exception -> L71
                sprig.graphics.a.access$setBackgroundTimestamp$p(r11, r1)     // Catch: java.lang.Exception -> L71
                sprig.f.a r11 = sprig.graphics.a.this     // Catch: java.lang.Exception -> L71
                r1 = 0
                sprig.graphics.a.access$setFrameCount$p(r11, r1)     // Catch: java.lang.Exception -> L71
                sprig.f.a r11 = sprig.graphics.a.this     // Catch: java.lang.Exception -> L71
                java.util.List r11 = sprig.graphics.a.access$getTouchEvents$p(r11)     // Catch: java.lang.Exception -> L71
                r11.clear()     // Catch: java.lang.Exception -> L71
                sprig.f.a r11 = sprig.graphics.a.this     // Catch: java.lang.Exception -> L71
                sprig.h.e r1 = r11.fileManager     // Catch: java.lang.Exception -> L71
                if (r1 == 0) goto L8a
                sprig.h.e r4 = r11.getFileManager$userleap_release()     // Catch: java.lang.Exception -> L71
                long r5 = java.lang.System.currentTimeMillis()     // Catch: java.lang.Exception -> L71
                r10.label = r3     // Catch: java.lang.Exception -> L71
                r7 = 0
                r9 = r10
                java.lang.Object r10 = r4.removeOldFiles(r5, r7, r9)     // Catch: java.lang.Exception -> L6e
                if (r10 != r0) goto L8a
            L6d:
                return r0
            L6e:
                r0 = move-exception
            L6f:
                r11 = r0
                goto L74
            L71:
                r0 = move-exception
                r9 = r10
                goto L6f
            L74:
                sprig.f.a r10 = sprig.graphics.a.this
                sprig.j.e r0 = sprig.graphics.a.access$getLogger$p(r10)
                java.lang.String r2 = r11.getMessage()
                r7 = 60
                r8 = 0
                java.lang.String r1 = "Error during cancelRecording cleanup"
                r3 = 0
                r4 = 0
                r5 = 0
                r6 = 0
                sprig.j.e.logWarning$default(r0, r1, r2, r3, r4, r5, r6, r7, r8)
            L8a:
                c1e r10 = defpackage.c1e.a
                return r10
            */
            throw new UnsupportedOperationException("Method not decompiled: sprig.f.a.d.invokeSuspend(java.lang.Object):java.lang.Object");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder", f = "ScreenshotRecorder.kt", l = {863}, m = "captureModalBitmaps")
    public static final class e extends p92 {
        int label;
        /* synthetic */ Object result;

        public e(n92<? super e> n92Var) {
            super(n92Var);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return a.this.a(this);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0003\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lsb2;", "", "Lsprig/f/a$b;", "<anonymous>", "(Lsb2;)Ljava/util/List;"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder$captureModalBitmaps$2", f = "ScreenshotRecorder.kt", l = {PhotoshopDirectory.TAG_DUOTONE_HALFTONING_INFORMATION}, m = "invokeSuspend")
    public static final class f extends p4d implements b55 {
        Object L$0;
        int label;

        /* JADX INFO: renamed from: sprig.f.a$f$a, reason: collision with other inner class name */
        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0003\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0001\u0010\u0002"}, d2 = {"Lc1e;", "run", "()V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
        public static final class RunnableC0013a implements Runnable {
            final /* synthetic */ w51 $continuation;
            final /* synthetic */ a this$0;

            public RunnableC0013a(a aVar, w51 w51Var) {
                this.this$0 = aVar;
                this.$continuation = w51Var;
            }

            @Override // java.lang.Runnable
            public final void run() {
                List<View> listM1;
                ArrayList arrayList = new ArrayList();
                try {
                    try {
                        listM1 = bu1.m1(sprig.j.b.INSTANCE.getCurrentModalViews());
                    } catch (Exception e) {
                        sprig.j.e.logWarning$default(this.this$0.logger, "Failed to get modal views", e.getMessage(), null, null, null, null, 60, null);
                        listM1 = ey3.a;
                    }
                    for (View view : listM1) {
                        try {
                            if (!view.getClass().getName().equals("com.android.internal.policy.DecorView") || (view.isAttachedToWindow() && view.isLaidOut())) {
                                if (!view.isAttachedToWindow() || view.getWidth() <= 0 || view.getHeight() <= 0) {
                                    sprig.j.e.logDebug$default(this.this$0.logger, "Modal view not ready, skipping", "View: " + view.getClass().getSimpleName(), null, null, null, null, 60, null);
                                } else {
                                    try {
                                    } catch (Exception e2) {
                                        sprig.j.e.logWarning$default(this.this$0.logger, "Failed to check isRedacted for modal", e2.getMessage(), null, null, null, null, 60, null);
                                    }
                                    if (sprig.view.View.isRedacted(view)) {
                                        sprig.j.e.logDebug$default(this.this$0.logger, "Modal view is redacted, skipping", "View: " + view.getClass().getSimpleName(), null, null, null, null, 60, null);
                                    } else {
                                        Object objAsBitmap = sprig.view.View.asBitmap(view, true);
                                        a aVar = this.this$0;
                                        if (!(objAsBitmap instanceof ajb)) {
                                            arrayList.add(new b((Bitmap) objAsBitmap, view.getWidth(), view.getHeight()));
                                            sprig.j.e.logDebug$default(aVar.logger, "Modal bitmap captured", "View: " + view.getClass().getSimpleName() + ", Size: " + view.getWidth() + "x" + view.getHeight(), null, null, null, null, 60, null);
                                        }
                                        Throwable thB = bjb.b(objAsBitmap);
                                        if (thB != null) {
                                            sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "Error capturing modal bitmap: " + view.getClass().getSimpleName() + " - " + thB.getMessage(), SprigLoggingLevel.WARNING, 0, 4, null);
                                        }
                                    }
                                }
                            }
                        } catch (Exception e3) {
                            sprig.j.e.logWarning$default(this.this$0.logger, "Error processing modal view", e3.getMessage(), null, null, null, null, 60, null);
                        }
                    }
                } catch (Exception e4) {
                    sprig.j.e.logWarning$default(this.this$0.logger, "Error in captureModalBitmaps handler", e4.getMessage(), null, null, null, null, 60, null);
                }
                this.$continuation.resumeWith(arrayList);
            }
        }

        public f(n92<? super f> n92Var) {
            super(2, n92Var);
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return a.this.new f(n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super List<b>> n92Var) {
            return ((f) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
            int i = this.label;
            if (i != 0) {
                if (i != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                return obj;
            }
            br7.v(obj);
            a aVar = a.this;
            this.L$0 = aVar;
            this.label = 1;
            x51 x51Var = new x51(1, pwd.Q(this));
            x51Var.s();
            if (!aVar.handler.post(new RunnableC0013a(aVar, x51Var))) {
                sprig.j.e.logWarning$default(aVar.logger, "handler.post returned false for modal capture", "Main looper may be dead", null, null, null, null, 60, null);
                x51Var.resumeWith(ey3.a);
            }
            Object objQ = x51Var.q();
            return objQ == tb2Var ? tb2Var : objQ;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder$captureScreenshot$1", f = "ScreenshotRecorder.kt", l = {668}, m = "invokeSuspend")
    public static final class g extends p4d implements b55 {
        final /* synthetic */ b.c $swipe;
        final /* synthetic */ Point $touchPoint;
        final /* synthetic */ View $view;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public g(View view, Point point, b.c cVar, n92<? super g> n92Var) {
            super(2, n92Var);
            this.$view = view;
            this.$touchPoint = point;
            this.$swipe = cVar;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return a.this.new g(this.$view, this.$touchPoint, this.$swipe, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((g) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
            int i = this.label;
            if (i == 0) {
                br7.v(obj);
                a aVar = a.this;
                View view = this.$view;
                Point point = this.$touchPoint;
                b.c cVar = this.$swipe;
                this.label = 1;
                if (aVar.a(view, point, cVar, this) == tb2Var) {
                    return tb2Var;
                }
            } else {
                if (i != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
            }
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Landroid/graphics/Bitmap;", "<anonymous>", "(Lsb2;)Landroid/graphics/Bitmap;"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder$captureViewBitmap$2", f = "ScreenshotRecorder.kt", l = {PhotoshopDirectory.TAG_DUOTONE_HALFTONING_INFORMATION}, m = "invokeSuspend")
    public static final class h extends p4d implements b55 {
        final /* synthetic */ View $view;
        Object L$0;
        Object L$1;
        int label;

        /* JADX INFO: renamed from: sprig.f.a$h$a, reason: collision with other inner class name */
        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0003\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0001\u0010\u0002"}, d2 = {"Lc1e;", "run", "()V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
        public static final class RunnableC0014a implements Runnable {
            final /* synthetic */ w51 $continuation;
            final /* synthetic */ View $viewToCapture;
            final /* synthetic */ a this$0;

            public RunnableC0014a(View view, a aVar, w51 w51Var) {
                this.$viewToCapture = view;
                this.this$0 = aVar;
                this.$continuation = w51Var;
            }

            @Override // java.lang.Runnable
            public final void run() {
                try {
                    Object objAsBitmap = sprig.view.View.asBitmap(this.$viewToCapture, true);
                    a aVar = this.this$0;
                    w51 w51Var = this.$continuation;
                    if (!(objAsBitmap instanceof ajb)) {
                        Bitmap bitmap = (Bitmap) objAsBitmap;
                        sprig.j.e.logDebug$default(aVar.logger, "Privacy-safe view bitmap captured with redaction", "Size: " + bitmap.getWidth() + "x" + bitmap.getHeight(), null, null, null, null, 60, null);
                        w51Var.resumeWith(bitmap);
                    }
                    a aVar2 = this.this$0;
                    View view = this.$viewToCapture;
                    w51 w51Var2 = this.$continuation;
                    Throwable thB = bjb.b(objAsBitmap);
                    if (thB != null) {
                        sprig.j.e.logWarning$default(aVar2.logger, "Failed to create privacy-safe bitmap from view", null, "View: " + view.getClass().getSimpleName() + ", Size: " + view.getWidth() + "x" + view.getHeight() + ", Error: " + thB.getMessage(), kyd.h0(thB), null, null, 50, null);
                        w51Var2.resumeWith(null);
                    }
                } catch (Exception e) {
                    sprig.j.e.logWarning$default(this.this$0.logger, "Exception in handler.post for captureViewBitmap", e.getMessage(), null, null, null, null, 60, null);
                    this.$continuation.resumeWith(null);
                }
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public h(View view, n92<? super h> n92Var) {
            super(2, n92Var);
            this.$view = view;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return a.this.new h(this.$view, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super Bitmap> n92Var) {
            return ((h) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
            int i = this.label;
            if (i != 0) {
                if (i != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                return obj;
            }
            br7.v(obj);
            a aVar = a.this;
            View view = this.$view;
            this.L$0 = aVar;
            this.L$1 = view;
            this.label = 1;
            x51 x51Var = new x51(1, pwd.Q(this));
            x51Var.s();
            Activity activity = aVar.getActivity();
            try {
                if (activity != null) {
                    try {
                        Window window = activity.getWindow();
                        View decorView = window != null ? window.getDecorView() : null;
                        if (decorView == null || decorView.getWidth() <= 0 || decorView.getHeight() <= 0) {
                            View viewFindViewById = activity.findViewById(R.id.content);
                            View rootView = viewFindViewById != null ? viewFindViewById.getRootView() : null;
                            if (rootView == null || rootView.getWidth() <= 0 || rootView.getHeight() <= 0) {
                                sprig.j.e.logDebug$default(aVar.logger, "Using provided rootView for privacy-safe capture", "Size: " + view.getWidth() + "x" + view.getHeight(), null, null, null, null, 60, null);
                            } else {
                                sprig.j.e.logDebug$default(aVar.logger, "Using root view for privacy-safe capture", "Size: " + rootView.getWidth() + "x" + rootView.getHeight(), null, null, null, null, 60, null);
                                view = rootView;
                            }
                        } else {
                            sprig.j.e.logDebug$default(aVar.logger, "Using DecorView for privacy-safe capture", "Size: " + decorView.getWidth() + "x" + decorView.getHeight(), null, null, null, null, 60, null);
                            view = decorView;
                        }
                    } catch (Exception e) {
                        sprig.j.e.logWarning$default(aVar.logger, "Failed to get top-level views", e.getMessage(), null, null, null, null, 60, null);
                    }
                } else {
                    sprig.j.e.logDebug$default(aVar.logger, "Using provided rootView for privacy-safe capture", "Size: " + view.getWidth() + "x" + view.getHeight(), null, null, null, null, 60, null);
                }
                if (view.getWidth() <= 0 || view.getHeight() <= 0) {
                    sprig.j.e.logWarning$default(aVar.logger, "View not ready for privacy-safe capture", ev6.v("Size: ", view.getWidth(), view.getHeight(), "x"), null, null, null, null, 60, null);
                    x51Var.resumeWith(null);
                } else {
                    Size sizeA = aVar.a();
                    if (sizeA != null && view.getHeight() < sizeA.getHeight() - 50) {
                        sprig.j.e eVar = aVar.logger;
                        int width = view.getWidth();
                        int height = view.getHeight();
                        Integer num = new Integer(sizeA.getWidth());
                        Integer num2 = new Integer(sizeA.getHeight());
                        StringBuilder sbB = ev6.B(width, height, "View: ", "x", ", Screen: ");
                        sbB.append(num);
                        sbB.append("x");
                        sbB.append(num2);
                        sprig.j.e.logWarning$default(eVar, "View appears to be missing status bar", sbB.toString(), null, null, null, null, 60, null);
                    }
                    sprig.j.e eVar2 = aVar.logger;
                    int width2 = view.getWidth();
                    int height2 = view.getHeight();
                    Integer num3 = sizeA != null ? new Integer(sizeA.getWidth()) : null;
                    Integer num4 = sizeA != null ? new Integer(sizeA.getHeight()) : null;
                    String simpleName = view.getClass().getSimpleName();
                    StringBuilder sbB2 = ev6.B(width2, height2, "View: ", "x", ", Screen: ");
                    sbB2.append(num3);
                    sbB2.append("x");
                    sbB2.append(num4);
                    sbB2.append(", ViewType: ");
                    sbB2.append(simpleName);
                    sprig.j.e.logDebug$default(eVar2, "Privacy-safe capture comparison", sbB2.toString(), null, null, null, null, 60, null);
                    if (!aVar.handler.post(new RunnableC0014a(view, aVar, x51Var))) {
                        sprig.j.e.logWarning$default(aVar.logger, "handler.post returned false", "Main looper may be dead", null, null, null, null, 60, null);
                        x51Var.resumeWith(null);
                    }
                }
            } catch (Exception e2) {
                sprig.j.e.logWarning$default(aVar.logger, "Error selecting view to capture", e2.getMessage(), null, null, null, null, 60, null);
                x51Var.resumeWith(null);
            }
            Object objQ = x51Var.q();
            return objQ == tb2Var ? tb2Var : objQ;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder", f = "ScreenshotRecorder.kt", l = {690, IptcDirectory.TAG_MASTER_DOCUMENT_ID}, m = "captureViewWithRedaction")
    public static final class i extends p92 {
        Object L$0;
        Object L$1;
        Object L$2;
        Object L$3;
        Object L$4;
        int label;
        /* synthetic */ Object result;

        public i(n92<? super i> n92Var) {
            super(n92Var);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return a.this.a(null, null, null, this);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder$captureViewWithRedaction$2", f = "ScreenshotRecorder.kt", l = {}, m = "invokeSuspend")
    public static final class j extends p4d implements b55 {
        final /* synthetic */ Bitmap $capturedBitmap;
        final /* synthetic */ List<b> $capturedModalBitmaps;
        final /* synthetic */ b.c $swipe;
        final /* synthetic */ Point $touchPoint;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public j(List<b> list, Bitmap bitmap, Point point, b.c cVar, n92<? super j> n92Var) {
            super(2, n92Var);
            this.$capturedModalBitmaps = list;
            this.$capturedBitmap = bitmap;
            this.$touchPoint = point;
            this.$swipe = cVar;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return a.this.new j(this.$capturedModalBitmaps, this.$capturedBitmap, this.$touchPoint, this.$swipe, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((j) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            Bitmap bitmapCopy = null;
            if (this.label != 0) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            try {
                sprig.graphics.i iVar = a.this.metrics;
                sprig.graphics.g gVar = sprig.graphics.g.FRAME;
                Bitmap bitmap = this.$capturedBitmap;
                a aVar = a.this;
                List<b> list = this.$capturedModalBitmaps;
                Point point = this.$touchPoint;
                b.c cVar = this.$swipe;
                CountDownLatch countDownLatch = new CountDownLatch(1);
                long jCurrentTimeMillis = System.currentTimeMillis();
                Bitmap.Config config = bitmap.getConfig();
                if (config == null) {
                    config = Bitmap.Config.ARGB_8888;
                }
                config.getClass();
                bitmapCopy = bitmap.copy(config, true);
                aVar.a(bitmap);
                if (bitmapCopy == null) {
                    sprig.j.e.logWarning$default(aVar.logger, "Failed to copy bitmap", "bitmap.copy() returned null", null, null, null, null, 60, null);
                    Iterator<T> it2 = list.iterator();
                    while (it2.hasNext()) {
                        aVar.a(((b) it2.next()).getBitmap());
                    }
                    countDownLatch.countDown();
                } else {
                    Canvas canvas = new Canvas(bitmapCopy);
                    aVar.a(canvas, point);
                    aVar.a(canvas, list);
                    aVar.a(canvas, cVar);
                    if (bitmapCopy.getWidth() == 0 || bitmapCopy.getHeight() == 0) {
                        sprig.j.e.logWarning$default(aVar.logger, "Invalid bitmap dimensions", "width=" + bitmapCopy.getWidth() + ", height=" + bitmapCopy.getHeight(), null, null, null, null, 60, null);
                        aVar.a(bitmapCopy);
                        countDownLatch.countDown();
                    } else {
                        aVar.b(bitmapCopy);
                        countDownLatch.countDown();
                    }
                }
                ExecutorService executorServiceNewSingleThreadExecutor = Executors.newSingleThreadExecutor();
                executorServiceNewSingleThreadExecutor.execute(new i.a(countDownLatch, jCurrentTimeMillis, iVar, gVar));
                executorServiceNewSingleThreadExecutor.shutdown();
            } catch (Exception e) {
                sprig.j.e eVar = a.this.logger;
                String message = e.getMessage();
                if (message == null) {
                    message = "";
                }
                sprig.j.e.logWarning$default(eVar, "Error processing privacy-safe screenshot", null, message, kyd.h0(e), null, null, 50, null);
                if (bitmapCopy != null) {
                    a.this.a(bitmapCopy);
                }
                List<b> list2 = this.$capturedModalBitmaps;
                a aVar2 = a.this;
                Iterator<T> it3 = list2.iterator();
                while (it3.hasNext()) {
                    aVar2.a(((b) it3.next()).getBitmap());
                }
            }
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder", f = "ScreenshotRecorder.kt", l = {563}, m = "cleanupScreenshots")
    public static final class k extends p92 {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public k(n92<? super k> n92Var) {
            super(n92Var);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return a.this.a(0L, this);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lsprig/d/b$a;", "it", "", "invoke", "(Lsprig/d/b$a;)Ljava/lang/Boolean;", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class l extends co6 implements x45 {
        final /* synthetic */ long $currentTime;
        final /* synthetic */ long $olderThan;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public l(long j, long j2) {
            super(1);
            this.$currentTime = j;
            this.$olderThan = j2;
        }

        @Override // defpackage.x45
        public final Boolean invoke(b.a aVar) {
            aVar.getClass();
            return Boolean.valueOf(aVar.getTimestamp() < this.$currentTime - this.$olderThan);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder$onBackground$1", f = "ScreenshotRecorder.kt", l = {514}, m = "invokeSuspend")
    public static final class p extends p4d implements b55 {
        int label;

        public p(n92<? super p> n92Var) {
            super(2, n92Var);
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return a.this.new p(n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((p) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
            int i = this.label;
            try {
                if (i == 0) {
                    br7.v(obj);
                    a.this.backgroundTimestamp = System.currentTimeMillis();
                    a.this.setRecording$userleap_release(false);
                    va6 va6Var = a.this.currentRecording;
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
                a.this.currentRecording = null;
            } catch (Exception e) {
                sprig.j.e.logWarning$default(a.this.logger, "Error in onBackground", e.getMessage(), null, null, null, null, 60, null);
            }
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder$onTouch$1", f = "ScreenshotRecorder.kt", l = {}, m = "invokeSuspend")
    public static final class q extends p4d implements b55 {
        final /* synthetic */ Point $touchPoint;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public q(Point point, n92<? super q> n92Var) {
            super(2, n92Var);
            this.$touchPoint = point;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return a.this.new q(this.$touchPoint, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((q) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            if (this.label != 0) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            a.captureScreenshot$default(a.this, this.$touchPoint, null, 2, null);
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder$performEncoding$1", f = "ScreenshotRecorder.kt", l = {}, m = "invokeSuspend")
    public static final class r extends p4d implements b55 {
        final /* synthetic */ Context $context;
        final /* synthetic */ wt8 $encode;
        final /* synthetic */ List<b.a> $eventDigest;
        final /* synthetic */ x45 $onComplete;
        int label;

        /* JADX INFO: renamed from: sprig.f.a$r$a, reason: collision with other inner class name */
        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0006\u001a\u00020\u00032\u000e\u0010\u0002\u001a\n \u0001*\u0004\u0018\u00010\u00000\u0000H\n¢\u0006\u0004\b\u0004\u0010\u0005"}, d2 = {"Lk7f;", "kotlin.jvm.PlatformType", "workInfo", "Lc1e;", "invoke", "(Lk7f;)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
        public static final class C0015a extends co6 implements x45 {
            final /* synthetic */ wt8 $encode;
            final /* synthetic */ List<b.a> $eventDigest;
            final /* synthetic */ x45 $onComplete;
            final /* synthetic */ a this$0;

            /* JADX INFO: renamed from: sprig.f.a$r$a$a, reason: collision with other inner class name */
            /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
            @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
            public /* synthetic */ class C0016a {
                public static final /* synthetic */ int[] $EnumSwitchMapping$0;

                static {
                    int[] iArr = new int[j7f.values().length];
                    try {
                        iArr[j7f.SUCCEEDED.ordinal()] = 1;
                    } catch (NoSuchFieldError unused) {
                    }
                    try {
                        iArr[j7f.FAILED.ordinal()] = 2;
                    } catch (NoSuchFieldError unused2) {
                    }
                    try {
                        iArr[j7f.CANCELLED.ordinal()] = 3;
                    } catch (NoSuchFieldError unused3) {
                    }
                    $EnumSwitchMapping$0 = iArr;
                }
            }

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C0015a(a aVar, wt8 wt8Var, x45 x45Var, List<b.a> list) {
                super(1);
                this.this$0 = aVar;
                this.$encode = wt8Var;
                this.$onComplete = x45Var;
                this.$eventDigest = list;
            }

            public final void invoke(k7f k7fVar) {
                sprig.j.e eVar = this.this$0.logger;
                j7f j7fVar = k7fVar != null ? k7fVar.b : null;
                sprig.j.e.logDebug$default(eVar, "Work status changed: " + j7fVar + ", ID: " + this.$encode.a, null, null, null, null, null, 62, null);
                if (k7fVar == null) {
                    sprig.j.e.logWarning$default(this.this$0.logger, "WorkInfo is null", null, "Work ID: " + this.$encode.a, null, null, null, 58, null);
                    return;
                }
                dt2 dt2Var = k7fVar.d;
                j7f j7fVar2 = k7fVar.b;
                int i = C0016a.$EnumSwitchMapping$0[j7fVar2.ordinal()];
                if (i == 1) {
                    String strA = dt2Var.a(UploadWorker.KEY_FILE);
                    sprig.j.e.logDebug$default(this.this$0.logger, ka1.r("Encoding succeeded with output: ", strA), null, null, null, null, null, 62, null);
                    if (strA == null) {
                        sprig.j.e.logWarning$default(this.this$0.logger, ivbZv.ppDpMMIZ, null, "Work ID: " + this.$encode.a, null, null, null, 58, null);
                        this.$onComplete.invoke(new b.a(new IllegalStateException("Missing output path")));
                        return;
                    }
                    try {
                        URL url = new File(strA).toURI().toURL();
                        x45 x45Var = this.$onComplete;
                        url.getClass();
                        x45Var.invoke(new b.C0022b(url, this.$eventDigest));
                        return;
                    } catch (Exception e) {
                        sprig.j.e.logWarning$default(this.this$0.logger, "Error creating URL from output path", null, lv8.r("Path: ", strA, ", Error: ", e.getMessage()), kyd.h0(e), null, null, 50, null);
                        this.$onComplete.invoke(new b.a(e));
                        return;
                    }
                }
                a aVar = this.this$0;
                if (i == 2) {
                    sprig.j.e.logWarning$default(aVar.logger, "Encoding work failed", null, "Work ID: " + this.$encode.a + ", Output data: " + dt2Var, null, null, null, 58, null);
                    this.$onComplete.invoke(new b.a(new IllegalStateException("Encoding work failed")));
                    return;
                }
                if (i == 3) {
                    sprig.j.e.logWarning$default(aVar.logger, "Encoding work was cancelled", null, "Work ID: " + this.$encode.a, null, null, null, 58, null);
                    this.$onComplete.invoke(new b.a(new IllegalStateException("Encoding work was cancelled")));
                    return;
                }
                sprig.j.e.logDebug$default(aVar.logger, "Work state: " + j7fVar2 + " for ID: " + this.$encode.a, null, null, null, null, null, 62, null);
            }

            @Override // defpackage.x45
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((k7f) obj);
                return c1e.a;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public r(x45 x45Var, wt8 wt8Var, Context context, List<b.a> list, n92<? super r> n92Var) {
            super(2, n92Var);
            this.$onComplete = x45Var;
            this.$encode = wt8Var;
            this.$context = context;
            this.$eventDigest = list;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return a.this.new r(this.$onComplete, this.$encode, this.$context, this.$eventDigest, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((r) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            c1e c1eVar = c1e.a;
            if (this.label != 0) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            try {
                ComponentCallbacks2 currentActivity = sprig.j.b.INSTANCE.getCurrentActivity();
                boolean z = currentActivity instanceof iy6;
                a aVar = a.this;
                if (!z) {
                    sprig.j.e.logWarning$default(aVar.logger, "Current activity is not a LifecycleOwner", null, "Activity: " + (currentActivity != null ? currentActivity.getClass().getSimpleName() : null), null, null, null, 58, null);
                    this.$onComplete.invoke(new b.a(new IllegalStateException("Current activity is not a LifecycleOwner")));
                    return c1eVar;
                }
                sprig.j.e.logDebug$default(aVar.logger, "Observing work progress for ID: " + this.$encode.a, null, null, null, null, null, 62, null);
                Context context = this.$context;
                context.getClass();
                m7f m7fVarF = m7f.f(context);
                m7fVarF.getClass();
                m7fVarF.g(this.$encode.a).d((iy6) currentActivity, new s(new C0015a(a.this, this.$encode, this.$onComplete, this.$eventDigest)));
                return c1eVar;
            } catch (Exception e) {
                sprig.j.e eVar = a.this.logger;
                String message = e.getMessage();
                if (message == null) {
                    message = "";
                }
                sprig.j.e.logWarning$default(eVar, "Error setting up work observation", null, message, kyd.h0(e), null, null, 50, null);
                this.$onComplete.invoke(new b.a(e));
                return c1eVar;
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    public static final class s implements kn8, k55 {
        public final /* synthetic */ x45 a;

        public s(x45 x45Var) {
            x45Var.getClass();
            this.a = x45Var;
        }

        public final boolean equals(Object obj) {
            if ((obj instanceof kn8) && (obj instanceof k55)) {
                return g76.L(getFunctionDelegate(), ((k55) obj).getFunctionDelegate());
            }
            return false;
        }

        @Override // defpackage.k55
        public final j55 getFunctionDelegate() {
            return this.a;
        }

        public final int hashCode() {
            return getFunctionDelegate().hashCode();
        }

        @Override // defpackage.kn8
        public final /* synthetic */ void onChanged(Object obj) {
            this.a.invoke(obj);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0002\u0010\u0000\u001a\u00020\u0001H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"<anonymous>", "", "invoke", "()Ljava/lang/Float;"}, k = 3, mv = {1, 8, 0}, xi = 48)
    public static final class t extends co6 implements m45 {
        public t() {
            super(0);
        }

        @Override // defpackage.m45
        public final Float invoke() {
            Context context;
            Resources resources;
            DisplayMetrics displayMetrics;
            try {
                context = a.this.getContext();
            } catch (Exception unused) {
            }
            return Float.valueOf((context == null || (resources = context.getResources()) == null || (displayMetrics = resources.getDisplayMetrics()) == null) ? 1.0f : displayMetrics.density);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder", f = "ScreenshotRecorder.kt", l = {IptcDirectory.TAG_TIME_CREATED, 583, 624}, m = "startRecordingLoop")
    public static final class u extends p92 {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public u(n92<? super u> n92Var) {
            super(n92Var);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return a.this.b(this);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder$startRecordingScreen$1", f = "ScreenshotRecorder.kt", l = {}, m = "invokeSuspend")
    public static final class v extends p4d implements b55 {
        int label;

        public v(n92<? super v> n92Var) {
            super(2, n92Var);
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return a.this.new v(n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((v) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            if (this.label != 0) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            try {
                d2a d2aVar = d2a.i;
                d2a.i.f.a(a.this.lifecycleObserver);
            } catch (Exception e) {
                sprig.j.e.logWarning$default(a.this.logger, "Failed to add lifecycle observer", e.getMessage(), null, null, null, null, 60, null);
            }
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder$startRecordingScreen$2", f = "ScreenshotRecorder.kt", l = {268, 269}, m = "invokeSuspend")
    public static final class w extends p4d implements b55 {
        Object L$0;
        int label;

        public w(n92<? super w> n92Var) {
            super(2, n92Var);
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return a.this.new w(n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((w) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            a aVar;
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
                aVar = (a) this.L$0;
                br7.v(obj);
                this.L$0 = null;
                this.label = 2;
                return aVar.b(this) != tb2Var ? tb2Var : c1eVar;
            }
            br7.v(obj);
            Context context = a.this.getContext();
            a aVar2 = a.this;
            if (context == null) {
                sprig.j.e.logWarning$default(aVar2.logger, "Cannot start recording session", null, "Context is null", null, null, null, 58, null);
                a.this.setRecording$userleap_release(false);
                return c1eVar;
            }
            Context context2 = aVar2.getContext();
            if (context2 == null) {
                return c1eVar;
            }
            a aVar3 = a.this;
            if (aVar3.fileManager == null) {
                aVar3.setFileManager$userleap_release(new sprig.graphics.e(context2, null, 2, null));
            }
            sprig.graphics.e fileManager$userleap_release = a.this.getFileManager$userleap_release();
            if (fileManager$userleap_release.getCurrentDirectory() == null) {
                fileManager$userleap_release = null;
            }
            if (fileManager$userleap_release != null) {
                a aVar4 = a.this;
                aVar4.setFileManager$userleap_release(fileManager$userleap_release);
                long jCurrentTimeMillis = System.currentTimeMillis();
                this.L$0 = aVar4;
                this.label = 1;
                if (sprig.graphics.e.removeOldFiles$default(fileManager$userleap_release, jCurrentTimeMillis, 0L, this, 2, null) != tb2Var) {
                    aVar = aVar4;
                    this.L$0 = null;
                    this.label = 2;
                    if (aVar.b(this) != tb2Var) {
                    }
                }
            }
        }
    }

    public a(ReplayRequest replayRequest, long j2, kb2 kb2Var, int i2, int i3) {
        replayRequest.getClass();
        kb2Var.getClass();
        this.replayRequest = replayRequest;
        this.replayWindowSize = j2;
        this.framesPerSecond = i2;
        this.jpegQuality = i3;
        this._webView = new WeakReference(null);
        this.handler = new Handler(Looper.getMainLooper());
        this.screenDensity = new w5d(new t());
        Paint paint = new Paint();
        paint.setColor(-16777216);
        paint.setAntiAlias(false);
        this.blurPaint = paint;
        Paint paint2 = new Paint();
        paint2.setColor(Color.rgb(250, Mp4VideoDirectory.TAG_DEPTH, 51));
        paint2.setAntiAlias(true);
        this.touchPaint = paint2;
        Paint paint3 = new Paint();
        paint3.setColor(Color.rgb(249, 198, 0));
        paint3.setStrokeWidth(2.0f);
        Paint.Style style = Paint.Style.STROKE;
        paint3.setStyle(style);
        paint3.setAntiAlias(true);
        this.strokePaint = paint3;
        Paint paint4 = new Paint();
        paint4.setColor(Color.rgb(250, Mp4VideoDirectory.TAG_DEPTH, 51));
        paint4.setStrokeWidth(8.0f);
        paint4.setStyle(style);
        paint4.setAntiAlias(true);
        this.swipePaint = paint4;
        this.coroutineScope = o7f.c(flb.p0(kb2Var, qq7.h()));
        this.lifecycleObserver = new RecorderLifecycleObserver(new m(this), new n(this));
        this.metrics = new sprig.graphics.i(500, new o());
        this.logger = new sprig.j.e();
        this.touchEvents = new ArrayList();
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inPreferredConfig = Bitmap.Config.RGB_565;
        options.inMutable = false;
        this.bitmapOptions = options;
    }

    public static /* synthetic */ void captureScreenshot$default(a aVar, Point point, b.c cVar, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            point = null;
        }
        if ((i2 & 2) != 0) {
            cVar = null;
        }
        aVar.a(point, cVar);
    }

    public static /* synthetic */ void drawSwipeOnCanvas$default(a aVar, Canvas canvas, b.c cVar, int i2, Object obj) {
        if ((i2 & 2) != 0) {
            cVar = null;
        }
        aVar.a(canvas, cVar);
    }

    public static /* synthetic */ void drawTouchOnCanvas$default(a aVar, Canvas canvas, Point point, int i2, Object obj) {
        if ((i2 & 2) != 0) {
            point = null;
        }
        aVar.a(canvas, point);
    }

    public final void a(String path, List eventDigest, x45 onComplete) {
        try {
            Context context = getContext();
            sprig.j.e eVar = this.logger;
            if (context == null) {
                sprig.j.e.logWarning$default(eVar, "Cannot perform encoding - context is null", null, "Path: " + path + ", Events: " + eventDigest.size(), null, null, null, 58, null);
                onComplete.invoke(new b.a(new IllegalStateException("Context is null")));
                return;
            }
            sprig.j.e.logDebug$default(eVar, "Starting encoding with path: " + path + ", events: " + eventDigest.size() + ", frameRate: " + this.framesPerSecond, null, null, null, null, null, 62, null);
            vt8 vt8Var = new vt8(ReplayEncoderWorker.class);
            vt8Var.d.add(ReplayEncoderWorker.WORK_TAG);
            f09[] f09VarArr = {new f09("directory", path), new f09(ReplayEncoderWorker.KEY_FRAME_RATE, Integer.valueOf(this.framesPerSecond))};
            ct2 ct2Var = new ct2(0, false);
            for (int i2 = 0; i2 < 2; i2++) {
                f09 f09Var = f09VarArr[i2];
                ct2Var.d((String) f09Var.a, f09Var.b);
            }
            vt8Var.c.e = ct2Var.a();
            wt8 wt8Var = (wt8) vt8Var.a();
            sprig.j.e.logDebug$default(this.logger, "Enqueuing work with ID: " + wt8Var.a, null, null, null, null, null, 62, null);
            m7f m7fVarF = m7f.f(context);
            m7fVarF.getClass();
            m7fVarF.c(wt8Var);
            qd5 qd5Var = qd5.a;
            r13 r13Var = xg3.a;
            vx0.c0(qd5Var, ff7.a, null, new r(onComplete, wt8Var, context, eventDigest, null), 2);
        } catch (Exception e2) {
            sprig.j.e eVar2 = this.logger;
            int size = eventDigest.size();
            String message = e2.getMessage();
            StringBuilder sbT = y30.t(size, "Path: ", path, ", Events: ", ", Error: ");
            sbT.append(message);
            sprig.j.e.logWarning$default(eVar2, "Error in performEncoding setup", null, sbT.toString(), kyd.h0(e2), null, null, 50, null);
            onComplete.invoke(new b.a(e2));
        }
    }

    @Override // sprig.view.b
    public void addEventDigest(b.a digest) {
        digest.getClass();
        try {
            this.touchEvents.add(digest);
        } catch (Exception e2) {
            sprig.j.e.logWarning$default(this.logger, "Failed to add event digest", e2.getMessage(), null, null, null, null, 60, null);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:61:0x0179, code lost:
    
        if (defpackage.muc.Q(r0, "codec", r10) == r10) goto L62;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0065 A[Catch: Exception -> 0x004e, CancellationException -> 0x0050, OutOfMemoryError -> 0x0053, TRY_ENTER, TryCatch #2 {OutOfMemoryError -> 0x0053, CancellationException -> 0x0050, Exception -> 0x004e, blocks: (B:31:0x0065, B:34:0x0075, B:36:0x0088, B:37:0x008b, B:17:0x004a, B:26:0x005a), top: B:76:0x0030 }] */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0088 A[Catch: Exception -> 0x004e, CancellationException -> 0x0050, OutOfMemoryError -> 0x0053, TryCatch #2 {OutOfMemoryError -> 0x0053, CancellationException -> 0x0050, Exception -> 0x004e, blocks: (B:31:0x0065, B:34:0x0075, B:36:0x0088, B:37:0x008b, B:17:0x004a, B:26:0x005a), top: B:76:0x0030 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r11v0 */
    /* JADX WARN: Type inference failed for: r11v10 */
    /* JADX WARN: Type inference failed for: r11v11 */
    /* JADX WARN: Type inference failed for: r11v12 */
    /* JADX WARN: Type inference failed for: r11v13 */
    /* JADX WARN: Type inference failed for: r11v14 */
    /* JADX WARN: Type inference failed for: r11v4 */
    /* JADX WARN: Type inference failed for: r11v8, types: [android.graphics.Point, java.lang.Object, sprig.d.b$c] */
    /* JADX WARN: Type inference failed for: r11v9 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:38:0x009a -> B:29:0x0061). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:67:0x01a8 -> B:29:0x0061). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.n92 r32) throws org.json.JSONException {
        /*
            Method dump skipped, instruction units count: 558
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: sprig.graphics.a.b(n92):java.lang.Object");
    }

    public final void c() {
        vx0.c0(this.coroutineScope, null, null, new p(null), 3);
    }

    @Override // sprig.view.b
    public void cancelRecording(EnumC0050b reason) {
        reason.getClass();
        this.recording = false;
        r13 r13Var = xg3.a;
        vx0.c0(qd5.a, ff7.a, null, new c(null), 2);
        va6 va6Var = this.copyFileAndUploadJob;
        if (va6Var != null) {
            va6Var.m(new CancellationException("Recording cancelled: " + reason));
        }
        this.copyFileAndUploadJob = null;
        vx0.c0(this.coroutineScope, null, null, new d(null), 3);
    }

    public final void d() {
        if (this.backgroundTimestamp == 0) {
            return;
        }
        this.pauseTime = (System.currentTimeMillis() - this.backgroundTimestamp) + this.pauseTime;
        this.backgroundTimestamp = 0L;
        startRecordingScreen();
    }

    public final Activity getActivity() {
        return sprig.j.b.INSTANCE.getCurrentActivity();
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

    @Override // sprig.view.b
    public ReplayRequest getReplayRequest() {
        return this.replayRequest;
    }

    @Override // sprig.view.b
    public long getReplayWindowSize() {
        return this.replayWindowSize;
    }

    public final View getRootView() {
        return sprig.j.b.INSTANCE.getCurrentActivityRootView();
    }

    @Override // sprig.view.b
    public void onSwipe(b.c swipe) {
        swipe.getClass();
        addEventDigest(new b.a(System.currentTimeMillis(), b.EnumC0010b.SWIPE, null, null, 12, null));
    }

    @Override // sprig.view.b
    public void onTouch(Point touchPoint) {
        touchPoint.getClass();
        addEventDigest(new b.a(System.currentTimeMillis(), b.EnumC0010b.TOUCH, null, null, 12, null));
        vx0.c0(this.coroutineScope, null, null, new q(touchPoint, null), 3);
    }

    public final void reset$userleap_release() {
        this.recording = false;
        this.pauseTime = 0L;
        this.backgroundTimestamp = 0L;
        this.frameCount = 0;
    }

    public final void setFileManager$userleap_release(sprig.graphics.e eVar) {
        eVar.getClass();
        this.fileManager = eVar;
    }

    public final void setRecording$userleap_release(boolean z) {
        this.recording = z;
    }

    @Override // sprig.view.b
    public void setReplayWindowSize(long j2) {
        this.replayWindowSize = j2;
    }

    @Override // sprig.view.b
    public void startRecordingScreen() {
        if (this.recording) {
            return;
        }
        r13 r13Var = xg3.a;
        vx0.c0(qd5.a, ff7.a, null, new v(null), 2);
        va6 va6Var = this.currentRecording;
        if (va6Var != null) {
            va6Var.m(null);
        }
        reset$userleap_release();
        this.recording = true;
        try {
            sprig.b.b.INSTANCE.onEvent(new SprigEvent(EventName.REPLAY_CAPTURE_STARTED, null));
        } catch (Exception e2) {
            sprig.j.e.logWarning$default(this.logger, "Failed to notify event", e2.getMessage(), null, null, null, null, 60, null);
        }
        this.currentRecording = vx0.c0(this.coroutineScope, null, null, new w(null), 3);
    }

    @Override // sprig.view.b
    public void waitForCompletion(x45 completionHandler) {
        completionHandler.getClass();
        this.copyFileAndUploadJob = vx0.c0(this.coroutineScope, null, null, new x(completionHandler, null), 3);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.implementations.ScreenshotRecorder$waitForCompletion$1", f = "ScreenshotRecorder.kt", l = {285}, m = "invokeSuspend")
    public static final class x extends p4d implements b55 {
        final /* synthetic */ x45 $completionHandler;
        long J$0;
        long J$1;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public x(x45 x45Var, n92<? super x> n92Var) {
            super(2, n92Var);
            this.$completionHandler = x45Var;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return a.this.new x(this.$completionHandler, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((x) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            long j;
            long j2;
            tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
            int i = this.label;
            try {
                if (i == 0) {
                    br7.v(obj);
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    a aVar = a.this;
                    long jB = jCurrentTimeMillis - aVar.b(aVar.getReplayRequest().getLookBackSeconds());
                    long lookAheadSeconds = a.this.getReplayRequest().getLookAheadSeconds();
                    long j3 = 0;
                    if (lookAheadSeconds < 0) {
                        lookAheadSeconds = 0;
                    }
                    long j4 = jCurrentTimeMillis + (lookAheadSeconds * 1000);
                    sprig.j.e.logDebug$default(a.this.logger, "Starting waitForCompletion - startTime: " + jB + ", stopTime: " + j4 + ", lookAhead: " + a.this.getReplayRequest().getLookAheadSeconds(), null, null, null, null, null, 62, null);
                    long lookAheadSeconds2 = a.this.getReplayRequest().getLookAheadSeconds();
                    if (lookAheadSeconds2 >= 0) {
                        j3 = lookAheadSeconds2;
                    }
                    this.J$0 = jB;
                    this.J$1 = j4;
                    this.label = 1;
                    if (gsa.X(j3 * 1000, this) == tb2Var) {
                        return tb2Var;
                    }
                    j = j4;
                    j2 = jB;
                } else {
                    if (i != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    long j5 = this.J$1;
                    long j6 = this.J$0;
                    br7.v(obj);
                    j = j5;
                    j2 = j6;
                }
                sprig.j.e.logDebug$default(a.this.logger, "Calling fileManager.copyFiles with " + a.this.touchEvents.size() + " touch events", null, null, null, null, null, 62, null);
                long j7 = j2;
                a.this.getFileManager$userleap_release().copyFiles(j7, j, new C0017a(a.this, j7, j, this.$completionHandler));
            } catch (Exception e) {
                sprig.j.e eVar = a.this.logger;
                String message = e.getMessage();
                if (message == null) {
                    message = "";
                }
                sprig.j.e.logWarning$default(eVar, "Error in waitForCompletion", null, message, kyd.h0(e), null, null, 50, null);
                this.$completionHandler.invoke(new b.a(e));
            }
            return c1e.a;
        }

        /* JADX INFO: renamed from: sprig.f.a$x$a, reason: collision with other inner class name */
        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\u000e\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0005\u001a\u00020\u00022\b\u0010\u0001\u001a\u0004\u0018\u00010\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"", "result", "Lc1e;", "invoke", "(Ljava/lang/String;)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
        public static final class C0017a extends co6 implements x45 {
            final /* synthetic */ x45 $completionHandler;
            final /* synthetic */ long $startTime;
            final /* synthetic */ long $stopTime;
            final /* synthetic */ a this$0;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C0017a(a aVar, long j, long j2, x45 x45Var) {
                super(1);
                this.this$0 = aVar;
                this.$startTime = j;
                this.$stopTime = j2;
                this.$completionHandler = x45Var;
            }

            public final void invoke(String str) throws JSONException {
                sprig.j.e.logDebug$default(this.this$0.logger, ka1.r("fileManager.copyFiles completed with result: ", str), null, null, null, null, null, 62, null);
                if (str == null) {
                    sprig.j.e eVar = this.this$0.logger;
                    long j = this.$startTime;
                    long j2 = this.$stopTime;
                    StringBuilder sbD = b09.D("startTime: ", ", stopTime: ", j);
                    sbD.append(j2);
                    sprig.j.e.logWarning$default(eVar, "File copy failed - result is null", null, sbD.toString(), null, null, null, 58, null);
                    this.$completionHandler.invoke(new b.a(new IllegalStateException("File copy failed")));
                    return;
                }
                sprig.view.a.INSTANCE.get$userleap_release().stopRecording$userleap_release(EnumC0050b.RECORDING_COMPLETE);
                List list = this.this$0.touchEvents;
                long j3 = this.$startTime;
                long j4 = this.$stopTime;
                ArrayList arrayList = new ArrayList();
                for (Object obj : list) {
                    long timestamp = ((b.a) obj).getTimestamp();
                    if (j3 <= timestamp && timestamp <= j4) {
                        arrayList.add(obj);
                    }
                }
                sprig.j.e.logDebug$default(this.this$0.logger, ev6.v("Filtered events: ", arrayList.size(), this.this$0.touchEvents.size(), " out of "), null, null, null, null, null, 62, null);
                try {
                    this.this$0.a(str, arrayList, new C0018a(this.$completionHandler));
                } catch (Exception e) {
                    sprig.j.e eVar2 = this.this$0.logger;
                    int size = arrayList.size();
                    String message = e.getMessage();
                    StringBuilder sbT = y30.t(size, "Directory: ", str, ", Events: ", ", Error: ");
                    sbT.append(message);
                    sprig.j.e.logError$default(eVar2, "Error in encoding process", null, sbT.toString(), kyd.h0(e), null, null, 50, null);
                    this.$completionHandler.invoke(new b.a(e));
                }
            }

            /* JADX INFO: renamed from: sprig.f.a$x$a$a, reason: collision with other inner class name */
            /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
            @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lsprig/g/b;", "outcome", "Lc1e;", "invoke", "(Lsprig/g/b;)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
            public static final class C0018a extends co6 implements x45 {
                final /* synthetic */ x45 $completionHandler;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                public C0018a(x45 x45Var) {
                    super(1);
                    this.$completionHandler = x45Var;
                }

                public final void invoke(sprig.g.b bVar) {
                    bVar.getClass();
                    this.$completionHandler.invoke(bVar);
                }

                @Override // defpackage.x45
                public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                    invoke((sprig.g.b) obj);
                    return c1e.a;
                }
            }

            @Override // defpackage.x45
            public /* bridge */ /* synthetic */ Object invoke(Object obj) throws JSONException {
                invoke((String) obj);
                return c1e.a;
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    public /* synthetic */ class m extends x55 implements m45 {
        public m(Object obj) {
            super(0, 0, a.class, obj, "onBackground", "onBackground()V");
        }

        /* JADX INFO: renamed from: invoke, reason: collision with other method in class */
        public final void m170invoke() {
            ((a) this.receiver).c();
        }

        @Override // defpackage.m45
        public /* bridge */ /* synthetic */ Object invoke() {
            m170invoke();
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    public /* synthetic */ class n extends x55 implements m45 {
        public n(Object obj) {
            super(0, 0, a.class, obj, "onForeground", "onForeground()V");
        }

        /* JADX INFO: renamed from: invoke, reason: collision with other method in class */
        public final void m171invoke() {
            ((a) this.receiver).d();
        }

        @Override // defpackage.m45
        public /* bridge */ /* synthetic */ Object invoke() {
            m171invoke();
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"", "thresholdMs", "Lc1e;", "invoke", "(I)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class o extends co6 implements x45 {
        public o() {
            super(1);
        }

        public final void invoke(int i) throws JSONException {
            sprig.j.e.logError$default(a.this.logger, "Recording taking too long, cancelling recording", null, ev6.w("Metric threshold exceeded, threshold: ", i, "ms"), null, null, null, 58, null);
            a.this.cancelRecording(EnumC0050b.REPLAY_TIME_ELAPSED);
        }

        @Override // defpackage.x45
        public /* bridge */ /* synthetic */ Object invoke(Object obj) throws JSONException {
            invoke(((Number) obj).intValue());
            return c1e.a;
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public a(ReplayRequest replayRequest, long j2, kb2 kb2Var, int i2, int i3, int i4, gy2 gy2Var) {
        long j3 = (i4 & 2) != 0 ? 60L : j2;
        if ((i4 & 4) != 0) {
            r13 r13Var = xg3.a;
            kb2Var = vz2.c;
        }
        this(replayRequest, j3, kb2Var, (i4 & 8) != 0 ? 2 : i2, (i4 & 16) != 0 ? 50 : i3);
    }

    public final Size a(Activity activity) {
        try {
            DisplayMetrics displayMetrics = activity.getResources().getDisplayMetrics();
            sprig.j.e.logDebug$default(this.logger, "DisplayMetrics", "Width: " + displayMetrics.widthPixels + ", Height: " + displayMetrics.heightPixels, null, null, null, null, 60, null);
            return new Size(displayMetrics.widthPixels, displayMetrics.heightPixels);
        } catch (Exception e2) {
            sprig.j.e.logWarning$default(this.logger, "getDisplayMetricsSize failed", e2.getMessage(), null, null, null, null, 60, null);
            return null;
        }
    }

    public final Size a() {
        Activity activity = getActivity();
        if (activity == null) {
            return null;
        }
        try {
            if (Build.VERSION.SDK_INT >= 30) {
                try {
                    WindowManager windowManager = activity.getWindowManager();
                    WindowMetrics currentWindowMetrics = windowManager.getCurrentWindowMetrics();
                    currentWindowMetrics.getClass();
                    Rect bounds = currentWindowMetrics.getBounds();
                    bounds.getClass();
                    WindowMetrics maximumWindowMetrics = windowManager.getMaximumWindowMetrics();
                    maximumWindowMetrics.getClass();
                    Rect bounds2 = maximumWindowMetrics.getBounds();
                    bounds2.getClass();
                    sprig.j.e.logDebug$default(this.logger, "WindowMetrics bounds", "Current: " + bounds.width() + "x" + bounds.height() + ", Max: " + bounds2.width() + "x" + bounds2.height(), null, null, null, null, 60, null);
                    return new Size(Math.max(bounds.width(), bounds2.width()), Math.max(bounds.height(), bounds2.height()));
                } catch (Exception e2) {
                    sprig.j.e.logWarning$default(this.logger, "WindowMetrics failed", e2.getMessage(), null, null, null, null, 60, null);
                    return a(activity);
                }
            }
            try {
                Configuration configuration = activity.getResources().getConfiguration();
                DisplayMetrics displayMetrics = activity.getResources().getDisplayMetrics();
                sprig.j.e.logDebug$default(this.logger, "Using configuration metrics", "Config: " + configuration.screenWidthDp + "x" + configuration.screenHeightDp + "dp, Display: " + displayMetrics.widthPixels + "x" + displayMetrics.heightPixels + "px", null, null, null, null, 60, null);
                return new Size(displayMetrics.widthPixels, displayMetrics.heightPixels);
            } catch (Exception e3) {
                sprig.j.e.logWarning$default(this.logger, "Configuration metrics failed", e3.getMessage(), null, null, null, null, 60, null);
                return a(activity);
            }
        } catch (Exception e4) {
            sprig.j.e.logWarning$default(this.logger, "getActualScreenSize failed", e4.getMessage(), null, null, null, null, 60, null);
            return null;
        }
        sprig.j.e.logWarning$default(this.logger, "getActualScreenSize failed", e4.getMessage(), null, null, null, null, 60, null);
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(long r10, defpackage.n92 r12) {
        /*
            r9 = this;
            boolean r0 = r12 instanceof sprig.f.a.k
            if (r0 == 0) goto L14
            r0 = r12
            sprig.f.a$k r0 = (sprig.f.a.k) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.label = r1
        L12:
            r6 = r0
            goto L1a
        L14:
            sprig.f.a$k r0 = new sprig.f.a$k
            r0.<init>(r12)
            goto L12
        L1a:
            java.lang.Object r12 = r6.result
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r6.label
            r2 = 1
            if (r1 == 0) goto L37
            if (r1 != r2) goto L30
            java.lang.Object r9 = r6.L$0
            sprig.f.a r9 = (sprig.graphics.a) r9
            defpackage.br7.v(r12)     // Catch: java.lang.Exception -> L2d
            goto L61
        L2d:
            r0 = move-exception
            r10 = r0
            goto L4f
        L30:
            java.lang.String r9 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r9)
            r9 = 0
            return r9
        L37:
            defpackage.br7.v(r12)
            r12 = r2
            long r2 = java.lang.System.currentTimeMillis()     // Catch: java.lang.Exception -> L2d
            sprig.h.e r1 = r9.getFileManager$userleap_release()     // Catch: java.lang.Exception -> L2d
            r6.L$0 = r9     // Catch: java.lang.Exception -> L2d
            r6.label = r12     // Catch: java.lang.Exception -> L2d
            r4 = r10
            java.lang.Object r9 = r1.removeOldFiles(r2, r4, r6)     // Catch: java.lang.Exception -> L2d
            if (r9 != r0) goto L61
            return r0
        L4f:
            sprig.j.e r0 = r9.logger
            java.lang.String r2 = r10.getMessage()
            r7 = 60
            r8 = 0
            java.lang.String r1 = "Failed to cleanup screenshots"
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            sprig.j.e.logWarning$default(r0, r1, r2, r3, r4, r5, r6, r7, r8)
        L61:
            c1e r9 = defpackage.c1e.a
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: sprig.graphics.a.a(long, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.n92 r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof sprig.f.a.e
            if (r0 == 0) goto L13
            r0 = r6
            sprig.f.a$e r0 = (sprig.f.a.e) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.label = r1
            goto L18
        L13:
            sprig.f.a$e r0 = new sprig.f.a$e
            r0.<init>(r6)
        L18:
            java.lang.Object r6 = r0.result
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.label
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r6)
            goto L41
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r6)
            sprig.f.a$f r6 = new sprig.f.a$f
            r6.<init>(r3)
            r0.label = r4
            r2 = 5000(0x1388, double:2.4703E-320)
            java.lang.Object r6 = defpackage.wo7.A(r2, r6, r0)
            if (r6 != r1) goto L41
            return r1
        L41:
            java.util.List r6 = (java.util.List) r6
            if (r6 != 0) goto L48
            ey3 r5 = defpackage.ey3.a
            return r5
        L48:
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: sprig.graphics.a.a(n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x00b0 A[Catch: Exception -> 0x00c3, TRY_ENTER, TryCatch #5 {Exception -> 0x00c3, blocks: (B:32:0x00b0, B:36:0x00c6), top: B:71:0x00ae }] */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00c6 A[Catch: Exception -> 0x00c3, TRY_LEAVE, TryCatch #5 {Exception -> 0x00c3, blocks: (B:32:0x00b0, B:36:0x00c6), top: B:71:0x00ae }] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0106  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x011b  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0128 A[LOOP:0: B:57:0x0122->B:59:0x0128, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(android.view.View r21, android.graphics.Point r22, sprig.d.b.c r23, defpackage.n92 r24) {
        /*
            Method dump skipped, instruction units count: 311
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: sprig.graphics.a.a(android.view.View, android.graphics.Point, sprig.d.b$c, n92):java.lang.Object");
    }

    public final void a(long olderThan) {
        try {
            bu1.S0(this.touchEvents, new l(System.currentTimeMillis(), olderThan));
        } catch (Exception e2) {
            sprig.j.e.logWarning$default(this.logger, "Failed to cleanup touch events", e2.getMessage(), null, null, null, null, 60, null);
        }
    }

    public final void a(Point touchPoint, b.c swipe) {
        View rootView;
        try {
            if (this.recording && (rootView = getRootView()) != null) {
                Size sizeA = a();
                sprig.j.e.logDebug$default(this.logger, "PRIVACY-SAFE screen capture", "View size: " + rootView.getWidth() + "x" + rootView.getHeight() + ", Screen size: " + (sizeA != null ? Integer.valueOf(sizeA.getWidth()) : null) + "x" + (sizeA != null ? Integer.valueOf(sizeA.getHeight()) : null), null, null, null, null, 60, null);
                if (rootView.getWidth() != 0 && rootView.getHeight() != 0) {
                    sb2 sb2Var = this.coroutineScope;
                    r13 r13Var = xg3.a;
                    vx0.c0(sb2Var, ff7.a, null, new g(rootView, touchPoint, swipe, null), 2);
                    return;
                }
                sprig.j.e.logWarning$default(this.logger, "Cannot capture screenshot", "View dimensions are zero", null, null, null, null, 60, null);
            }
        } catch (Exception e2) {
            sprig.j.e eVar = this.logger;
            String message = e2.getMessage();
            if (message == null) {
                message = "";
            }
            sprig.j.e.logWarning$default(eVar, "Error capturing privacy-safe screenshot", null, message, kyd.h0(e2), null, null, 50, null);
        }
    }

    public final void a(Bitmap bitmap) {
        if (bitmap != null) {
            try {
                if (bitmap.isRecycled()) {
                    return;
                }
                bitmap.recycle();
            } catch (Exception e2) {
                sprig.j.e.logWarning$default(this.logger, "Failed to recycle bitmap", e2.getMessage(), null, null, null, null, 60, null);
            }
        }
    }

    public final Object a(View view, n92 n92Var) {
        return wo7.A(5000L, new h(view, null), n92Var);
    }

    public final void a(Canvas canvas, List modalBitmaps) {
        Iterator it2 = modalBitmaps.iterator();
        while (it2.hasNext()) {
            b bVar = (b) it2.next();
            try {
                try {
                    if (bVar.getBitmap().isRecycled()) {
                        sprig.j.e.logWarning$default(this.logger, "Modal bitmap already recycled", "Skipping draw", null, null, null, null, 60, null);
                    } else {
                        int width = canvas.getWidth();
                        int height = canvas.getHeight();
                        try {
                            canvas.drawBitmap(bVar.getBitmap(), (width - bVar.getWidth()) / 2, height - bVar.getHeight(), (Paint) null);
                            sprig.j.e.logDebug$default(this.logger, "Modal bitmap drawn", "Size: " + bVar.getWidth() + "x" + bVar.getHeight(), null, null, null, null, 60, null);
                        } catch (Exception e2) {
                            e = e2;
                            sprig.j.e.logWarning$default(this.logger, "Error drawing modal bitmap", e.getMessage(), null, null, null, null, 60, null);
                        }
                    }
                } catch (Throwable th) {
                    a(bVar.getBitmap());
                    throw th;
                }
            } catch (Exception e3) {
                e = e3;
            }
            a(bVar.getBitmap());
        }
    }

    public final void a(Canvas canvas, Point touchPoint) {
        if (touchPoint == null) {
            return;
        }
        try {
            float f2 = touchPoint.x + 16.0f;
            float f3 = touchPoint.y + 16.0f;
            float fB = b() * 32.0f;
            canvas.drawCircle(f2, f3, fB, this.touchPaint);
            canvas.drawCircle(f2, f3, fB, this.strokePaint);
        } catch (Exception e2) {
            sprig.j.e.logWarning$default(this.logger, "Error drawing touch on canvas", e2.getMessage(), null, null, null, null, 60, null);
        }
    }

    public final void a(Canvas canvas, b.c swipe) {
        if (swipe == null) {
            return;
        }
        try {
            canvas.drawLine(swipe.getStart().x, swipe.getStart().y, swipe.getEnd().x, swipe.getEnd().y, this.swipePaint);
        } catch (Exception e2) {
            sprig.j.e.logWarning$default(this.logger, "Error drawing swipe on canvas", e2.getMessage(), null, null, null, null, 60, null);
        }
    }

    public final long b(long lookBackSeconds) {
        if (lookBackSeconds < 0) {
            lookBackSeconds = 0;
        }
        return (lookBackSeconds * 1000) + this.pauseTime;
    }

    public final float b() {
        return ((Number) this.screenDensity.getValue()).floatValue();
    }

    public final void b(Bitmap bitmap) {
        try {
            getFileManager$userleap_release().saveImage(String.valueOf(System.currentTimeMillis()), bitmap, this.jpegQuality, this.metrics);
        } catch (Exception e2) {
            sprig.j.e.logWarning$default(this.logger, "Failed to save bitmap to file", e2.getMessage(), null, null, null, null, 60, null);
            a(bitmap);
        }
    }
}
