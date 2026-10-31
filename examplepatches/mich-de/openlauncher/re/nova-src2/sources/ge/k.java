package ge;

import android.content.Context;
import android.media.metrics.PlaybackMetrics;
import android.media.metrics.PlaybackSession;
import android.media.metrics.TrackChangeEvent;
import android.os.SystemClock;
import android.util.Pair;
import com.amplitude.core.events.Identify;
import com.google.android.exoplayer2.PlaybackException;
import fe.k0;
import fe.r0;
import fe.x1;
import fe.y1;
import fe.z1;
import gf.w;
import java.util.HashMap;
import wf.v;

/* loaded from: classes3.dex */
public final class k implements b {
    public boolean A;

    /* renamed from: a, reason: collision with root package name */
    public final Context f57417a;

    /* renamed from: b, reason: collision with root package name */
    public final h f57418b;

    /* renamed from: c, reason: collision with root package name */
    public final PlaybackSession f57419c;

    /* renamed from: i, reason: collision with root package name */
    public String f57425i;

    /* renamed from: j, reason: collision with root package name */
    public PlaybackMetrics.Builder f57426j;

    /* renamed from: k, reason: collision with root package name */
    public int f57427k;
    public PlaybackException n;
    public io.sentry.internal.debugmeta.c o;

    /* renamed from: p, reason: collision with root package name */
    public io.sentry.internal.debugmeta.c f57430p;

    /* renamed from: q, reason: collision with root package name */
    public io.sentry.internal.debugmeta.c f57431q;

    /* renamed from: r, reason: collision with root package name */
    public k0 f57432r;

    /* renamed from: s, reason: collision with root package name */
    public k0 f57433s;

    /* renamed from: t, reason: collision with root package name */
    public k0 f57434t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f57435u;

    /* renamed from: v, reason: collision with root package name */
    public int f57436v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f57437w;

    /* renamed from: x, reason: collision with root package name */
    public int f57438x;

    /* renamed from: y, reason: collision with root package name */
    public int f57439y;

    /* renamed from: z, reason: collision with root package name */
    public int f57440z;

    /* renamed from: e, reason: collision with root package name */
    public final y1 f57421e = new y1();

    /* renamed from: f, reason: collision with root package name */
    public final x1 f57422f = new x1();

    /* renamed from: h, reason: collision with root package name */
    public final HashMap f57424h = new HashMap();

    /* renamed from: g, reason: collision with root package name */
    public final HashMap f57423g = new HashMap();

    /* renamed from: d, reason: collision with root package name */
    public final long f57420d = SystemClock.elapsedRealtime();

    /* renamed from: l, reason: collision with root package name */
    public int f57428l = 0;

    /* renamed from: m, reason: collision with root package name */
    public int f57429m = 0;

    public k(Context context, PlaybackSession playbackSession) {
        this.f57417a = context.getApplicationContext();
        this.f57419c = playbackSession;
        h hVar = new h();
        this.f57418b = hVar;
        hVar.f57414d = this;
    }

    public final boolean a(io.sentry.internal.debugmeta.c cVar) {
        String str;
        if (cVar == null) {
            return false;
        }
        String str2 = (String) cVar.f67328b;
        h hVar = this.f57418b;
        synchronized (hVar) {
            str = hVar.f57416f;
        }
        return str2.equals(str);
    }

    public final void b() {
        PlaybackMetrics.Builder builder = this.f57426j;
        if (builder != null && this.A) {
            builder.setAudioUnderrunCount(this.f57440z);
            this.f57426j.setVideoFramesDropped(this.f57438x);
            this.f57426j.setVideoFramesPlayed(this.f57439y);
            Long l9 = (Long) this.f57423g.get(this.f57425i);
            this.f57426j.setNetworkTransferDurationMillis(l9 == null ? 0L : l9.longValue());
            Long l11 = (Long) this.f57424h.get(this.f57425i);
            this.f57426j.setNetworkBytesRead(l11 == null ? 0L : l11.longValue());
            this.f57426j.setStreamSource((l11 == null || l11.longValue() <= 0) ? 0 : 1);
            this.f57419c.reportPlaybackMetrics(this.f57426j.build());
        }
        this.f57426j = null;
        this.f57425i = null;
        this.f57440z = 0;
        this.f57438x = 0;
        this.f57439y = 0;
        this.f57432r = null;
        this.f57433s = null;
        this.f57434t = null;
        this.A = false;
    }

    public final void c(z1 z1Var, w wVar) {
        int iB;
        PlaybackMetrics.Builder builder = this.f57426j;
        if (wVar == null || (iB = z1Var.b(wVar.f57640a)) == -1) {
            return;
        }
        x1 x1Var = this.f57422f;
        int i5 = 0;
        z1Var.f(iB, x1Var, false);
        int i11 = x1Var.f55077c;
        y1 y1Var = this.f57421e;
        z1Var.n(i11, y1Var);
        r0 r0Var = y1Var.f55100c.f54994b;
        if (r0Var != null) {
            int iU = v.u(r0Var.f54973a);
            i5 = iU != 0 ? iU != 1 ? iU != 2 ? 1 : 4 : 5 : 3;
        }
        builder.setStreamType(i5);
        if (y1Var.f55110m != -9223372036854775807L && !y1Var.f55108k && !y1Var.f55105h && !y1Var.a()) {
            builder.setMediaDurationMillis(v.F(y1Var.f55110m));
        }
        builder.setPlaybackType(y1Var.a() ? 2 : 1);
        this.A = true;
    }

    public final void d(a aVar, String str) {
        w wVar = aVar.f57381d;
        if ((wVar == null || !wVar.a()) && str.equals(this.f57425i)) {
            b();
        }
        this.f57423g.remove(str);
        this.f57424h.remove(str);
    }

    public final void e(int i5, long j11, k0 k0Var) {
        TrackChangeEvent.Builder timeSinceCreatedMillis = i.k(i5).setTimeSinceCreatedMillis(j11 - this.f57420d);
        if (k0Var != null) {
            timeSinceCreatedMillis.setTrackState(1);
            timeSinceCreatedMillis.setTrackChangeReason(2);
            String str = k0Var.f54882k;
            if (str != null) {
                timeSinceCreatedMillis.setContainerMimeType(str);
            }
            String str2 = k0Var.f54883l;
            if (str2 != null) {
                timeSinceCreatedMillis.setSampleMimeType(str2);
            }
            String str3 = k0Var.f54880i;
            if (str3 != null) {
                timeSinceCreatedMillis.setCodecName(str3);
            }
            int i11 = k0Var.f54879h;
            if (i11 != -1) {
                timeSinceCreatedMillis.setBitrate(i11);
            }
            int i12 = k0Var.f54886q;
            if (i12 != -1) {
                timeSinceCreatedMillis.setWidth(i12);
            }
            int i13 = k0Var.f54887r;
            if (i13 != -1) {
                timeSinceCreatedMillis.setHeight(i13);
            }
            int i14 = k0Var.f54894y;
            if (i14 != -1) {
                timeSinceCreatedMillis.setChannelCount(i14);
            }
            int i15 = k0Var.f54895z;
            if (i15 != -1) {
                timeSinceCreatedMillis.setAudioSampleRate(i15);
            }
            String str4 = k0Var.f54874c;
            if (str4 != null) {
                int i16 = v.f94376a;
                String[] strArrSplit = str4.split(Identify.UNSET_VALUE, -1);
                Pair pairCreate = Pair.create(strArrSplit[0], strArrSplit.length >= 2 ? strArrSplit[1] : null);
                timeSinceCreatedMillis.setLanguage((String) pairCreate.first);
                Object obj = pairCreate.second;
                if (obj != null) {
                    timeSinceCreatedMillis.setLanguageRegion((String) obj);
                }
            }
            float f11 = k0Var.f54888s;
            if (f11 != -1.0f) {
                timeSinceCreatedMillis.setVideoFrameRate(f11);
            }
        } else {
            timeSinceCreatedMillis.setTrackState(0);
        }
        this.A = true;
        this.f57419c.reportTrackChangeEvent(timeSinceCreatedMillis.build());
    }
}
