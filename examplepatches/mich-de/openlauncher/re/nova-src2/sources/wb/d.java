package wb;

import ai.t;
import android.graphics.SurfaceTexture;
import android.media.MediaPlayer;
import android.media.PlaybackParams;
import android.os.Message;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.SparseIntArray;
import android.view.Surface;
import android.view.SurfaceHolder;
import androidx.compose.ui.node.LayoutNode;
import com.bytedance.sdk.component.fby.ycx.ycx;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.thx;
import com.bytedance.sdk.component.utils.tru;
import com.bytedance.sdk.openadsdk.core.syc.dj.sya;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.FileInputStream;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import mk.w;
import o7.g0;
import org.json.JSONObject;
import p6.p0;

/* loaded from: classes2.dex */
public abstract class d implements nb.c, e, f, g, h, i, j, k, tru.ycx {
    private static final SparseIntArray ycx = new SparseIntArray();
    private volatile boolean dc;

    /* renamed from: dj, reason: collision with root package name */
    private final c f94139dj;

    /* renamed from: dv, reason: collision with root package name */
    private ArrayList<Runnable> f94140dv;
    private boolean dwi;

    /* renamed from: dy, reason: collision with root package name */
    private tru f94141dy;
    private volatile boolean kgy;

    /* renamed from: lt, reason: collision with root package name */
    private SurfaceHolder f94146lt;
    private SurfaceTexture lud;
    private boolean nji;
    private final Runnable oby;

    /* renamed from: ok, reason: collision with root package name */
    private boolean f94147ok;
    private int oty;

    /* renamed from: ry, reason: collision with root package name */
    private boolean f94148ry;

    /* renamed from: tn, reason: collision with root package name */
    private boolean f94149tn;
    private boolean tru;

    /* renamed from: zb, reason: collision with root package name */
    private final boolean f94153zb = false;
    private final List<WeakReference<nb.b>> sya = new CopyOnWriteArrayList();

    /* renamed from: ul, reason: collision with root package name */
    private int f94151ul = 0;
    private int fby = 3;

    /* renamed from: jw, reason: collision with root package name */
    private boolean f94145jw = false;

    /* renamed from: jc, reason: collision with root package name */
    private volatile l f94144jc = null;

    /* renamed from: ea, reason: collision with root package name */
    private boolean f94142ea = false;
    private volatile int xkz = 201;
    private long syc = -1;
    private boolean wie = false;
    private long pmi = 0;

    /* renamed from: uh, reason: collision with root package name */
    private long f94150uh = Long.MIN_VALUE;
    private long htf = 0;
    private long thx = 0;
    private long wwx = 0;

    /* renamed from: hf, reason: collision with root package name */
    private String f94143hf = "0";
    private com.bykv.vk.openvk.ycx.ycx.ycx.sya.a bhi = null;

    /* renamed from: av, reason: collision with root package name */
    private boolean f94138av = false;
    private CountDownLatch rmf = new CountDownLatch(1);
    private volatile int aeu = 200;

    /* renamed from: xz, reason: collision with root package name */
    private AtomicBoolean f94152xz = new AtomicBoolean(false);
    private Surface rmy = null;
    private long ifb = 0;
    private long yzp = 0;

    public d() {
        sya syaVar = (sya) this;
        this.f94139dj = new c(syaVar);
        this.oty = 0;
        this.dwi = false;
        this.oby = new g0(syaVar, 26);
        this.oty = 0;
        tru truVarYcx = ycx.ycx().ycx(this, "csj_".concat("SSMediaPlayerWrapper"));
        this.f94141dy = truVarYcx;
        this.dwi = true;
        if (truVarYcx != null) {
            truVarYcx.post(new a(this, 0));
        }
    }

    public static void jc(d dVar) {
        tru truVar = dVar.f94141dy;
        if (truVar != null) {
            truVar.post(new a(dVar, 0));
        }
    }

    public final void a() {
        if (this.f94144jc == null) {
            return;
        }
        try {
            ((n) this.f94144jc).b();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "SeshkAKvbOqFTt5cvB2hMV78", 937);
        }
        ((n) this.f94144jc).f94156b = null;
        ((n) this.f94144jc).f94159e = null;
        ((n) this.f94144jc).f94157c = null;
        ((n) this.f94144jc).f94161g = null;
        ((n) this.f94144jc).f94160f = null;
        ((n) this.f94144jc).f94155a = null;
        ((n) this.f94144jc).f94158d = null;
        try {
            n nVar = (n) this.f94144jc;
            synchronized (nVar.f94167m) {
                try {
                    if (!nVar.n) {
                        nVar.f94163i.release();
                        nVar.n = true;
                        nVar.a();
                        xb.a aVar = nVar.f94165k;
                        if (aVar != null) {
                            try {
                                aVar.close();
                            } catch (Throwable th3) {
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euAphwy1beqFTt5cvB2hMV78", "SeshkAKvbOqFTt5cqBC0KWjhOIcAuQ==", 180);
                            }
                            nVar.f94165k = null;
                        }
                        nVar.f();
                        nVar.c();
                    }
                } catch (Throwable th4) {
                    throw th4;
                }
            }
        } catch (Throwable th5) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th5, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "SeshkAKvbOqFTt5cvB2hMV78", 949);
        }
    }

    public final void b() {
        tru truVar = this.f94141dy;
        if (truVar == null || truVar.getLooper() == null) {
            return;
        }
        try {
            this.f94141dy.post(new a(this, 5));
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "VOAJkBCoe8iZ", 973);
        }
    }

    public final void c() {
        ArrayList<Runnable> arrayList = this.f94140dv;
        if (arrayList == null || arrayList.isEmpty() || this.f94147ok) {
            return;
        }
        this.f94147ok = true;
        Iterator it = new ArrayList(this.f94140dv).iterator();
        while (it.hasNext()) {
            ((Runnable) it.next()).run();
        }
        this.f94140dv.clear();
        this.f94147ok = false;
    }

    public final void d(com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar) {
        aVar.dy();
        n nVar = (n) this.f94144jc;
        synchronized (nVar) {
            xb.a aVar2 = new xb.a(nb.a.f78093a, aVar);
            xb.a.f95748e.put(aVar.wie(), aVar2);
            nVar.f94165k = aVar2;
            zb.a.a(aVar);
            nVar.f94163i.setDataSource(nVar.f94165k);
        }
        aVar.dy();
    }

    public int dy() {
        return this.f94151ul;
    }

    public final void e() {
        this.dc = true;
        this.f94145jw = true;
        long jElapsedRealtime = SystemClock.elapsedRealtime() - this.wwx;
        for (WeakReference<nb.b> weakReference : this.sya) {
            if (weakReference != null && weakReference.get() != null) {
                weakReference.get().ycx(this, jElapsedRealtime);
            }
        }
    }

    public final void f(com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar, File file) {
        if (!aVar.ycx()) {
            g(file);
            return;
        }
        try {
            String strN = p0.n(file);
            if (aVar.wie().equals(strN)) {
                g(file);
                return;
            }
            JSONObject jSONObjectSya = aVar.sya();
            boolean zZb = aVar.zb();
            if (jSONObjectSya != null) {
                jSONObjectSya.put("file_hash", aVar.wie());
                jSONObjectSya.put("file_real_hash", strN);
                jSONObjectSya.put("is_change_play_type", zZb ? 1 : 0);
                jSONObjectSya.put("error_real_code", Sdk.SDKError.Reason.ASSET_FAILED_TO_DELETE_VALUE);
                jSONObjectSya.put("error_real_msg", "md5_not_match");
            }
            if (zZb) {
                boolean zDelete = file.delete();
                if (jSONObjectSya != null) {
                    jSONObjectSya.put("delete_cache_file", zDelete ? 1 : 0);
                }
                if (zDelete) {
                    d(aVar);
                    return;
                }
            }
            g(file);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "Tes/nAWlT86MT/5TmBSnOlL6NA==", 909);
        }
    }

    public final void g(File file) {
        file.getAbsolutePath();
        try {
            if (thx.ycx(nb.a.f78093a)) {
                ((n) this.f94144jc).e(file.getAbsolutePath());
            } else {
                FileInputStream fileInputStream = new FileInputStream(file.getAbsolutePath());
                l lVar = this.f94144jc;
                ((n) lVar).f94163i.setDataSource(fileInputStream.getFD());
                fileInputStream.close();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "S+IsjC+zasaMfN5ZiR4=", 875);
        }
    }

    public final void h(Runnable runnable) {
        try {
            if (this.f94140dv == null) {
                this.f94140dv = new ArrayList<>();
            }
            this.f94140dv.add(runnable);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "XuA8gAapbOaDXt5Sgg==", 1218);
            th2.getMessage();
        }
    }

    public SurfaceTexture htf() {
        return this.lud;
    }

    public final void i(int i5) {
        if (i5 == 701) {
            this.ifb = SystemClock.elapsedRealtime();
            this.f94151ul++;
            for (WeakReference<nb.b> weakReference : this.sya) {
                if (weakReference != null && weakReference.get() != null) {
                    weakReference.get().ycx(this, LayoutNode.NotPlacedPlaceOrder, 0, 0);
                }
            }
            return;
        }
        if (i5 != 702) {
            if (this.dwi && i5 == 3) {
                c();
                e();
                zb(this.f94138av);
                return;
            } else {
                if (i5 == 805) {
                    this.nji = true;
                    return;
                }
                return;
            }
        }
        if (this.ifb > 0) {
            this.yzp = (SystemClock.elapsedRealtime() - this.ifb) + this.yzp;
            this.ifb = 0L;
        }
        for (WeakReference<nb.b> weakReference2 : this.sya) {
            if (weakReference2 != null && weakReference2.get() != null) {
                weakReference2.get().ycx((nb.c) this, LayoutNode.NotPlacedPlaceOrder);
            }
        }
    }

    public final void j(long j11) {
        c cVar = this.f94139dj;
        cVar.f94135a = j11;
        if (this.tru) {
            k(cVar);
            return;
        }
        com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar = this.bhi;
        if (aVar == null || !aVar.ul()) {
            h(this.f94139dj);
        } else {
            k(this.f94139dj);
        }
    }

    public final void k(Runnable runnable) {
        if (runnable == null || fby()) {
            return;
        }
        if (this.f94148ry) {
            h(runnable);
        } else {
            runnable.run();
        }
    }

    public void ok() {
        if (fby()) {
            return;
        }
        this.f94148ry = true;
        ArrayList<Runnable> arrayList = this.f94140dv;
        if (arrayList != null && !arrayList.isEmpty()) {
            this.f94140dv.clear();
        }
        tru truVar = this.f94141dy;
        if (truVar != null) {
            try {
                truVar.removeCallbacksAndMessages(null);
                if (this.f94144jc != null) {
                    this.f94141dy.sendEmptyMessage(103);
                }
            } catch (Throwable th2) {
                try {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "SeshkAKvbA==", 467);
                } finally {
                    b();
                }
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r0v3, types: [int] */
    public long pmi() {
        String currentPosition = "XOs5thaue8KOXudSnxi0IVTg";
        if (fby() || (this.xkz != 206 && this.xkz != 207)) {
            return 0L;
        }
        try {
            n nVar = (n) this.f94144jc;
            nVar.getClass();
            try {
                currentPosition = nVar.f94163i.getCurrentPosition();
                return (long) currentPosition;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euAphwy1beqFTt5cvB2hMV78", "XOs5thaue8KOXudSnxi0IVTg", 244);
                return 0L;
            }
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", currentPosition, 1376);
            return 0L;
        }
    }

    public boolean ry() {
        return this.xkz == 205;
    }

    public long syc() {
        if (this.wie) {
            long j11 = this.htf;
            if (j11 > 0) {
                return this.pmi + j11;
            }
        }
        return this.pmi;
    }

    public SurfaceHolder uh() {
        return this.f94146lt;
    }

    public long wie() {
        long j11 = this.thx;
        long duration = 0;
        if (j11 != 0) {
            return j11;
        }
        if (this.xkz == 206 || this.xkz == 207) {
            try {
                n nVar = (n) this.f94144jc;
                nVar.getClass();
                try {
                    duration = nVar.f94163i.getDuration();
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euAphwy1beqFTt5cvB2hMV78", "XOs5sRauaNOJRdk=", 254);
                }
                this.thx = duration;
            } catch (Throwable th3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "XOs5owq4bMikX8VcmBivJg==", 1362);
            }
        }
        return this.thx;
    }

    public boolean xkz() {
        return this.nji;
    }

    public void ea() {
        tru truVar;
        com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar;
        com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar2;
        if (fby() || (truVar = this.f94141dy) == null) {
            return;
        }
        truVar.removeMessages(100);
        this.kgy = true;
        if (this.dwi) {
            if (!this.f94145jw && ((aVar = this.bhi) == null || !aVar.ul())) {
                h(new a(this, 3));
                return;
            }
            tru truVar2 = this.f94141dy;
            if (truVar2 != null) {
                truVar2.sendEmptyMessage(101);
                return;
            }
            return;
        }
        if (!this.f94149tn && ((aVar2 = this.bhi) == null || !aVar2.ul())) {
            h(new a(this, 2));
            return;
        }
        tru truVar3 = this.f94141dy;
        if (truVar3 != null) {
            truVar3.sendEmptyMessage(101);
        }
    }

    @Override // nb.c
    public boolean fby() {
        return this.f94148ry;
    }

    public void jw() {
        if (fby() || this.f94144jc == null) {
            return;
        }
        this.f94152xz.set(true);
        if (this.xkz != 206) {
            this.pmi = 0L;
            this.f94151ul = 0;
            this.htf = 0L;
            this.wie = false;
            this.f94150uh = Long.MIN_VALUE;
            this.kgy = false;
            this.f94139dj.f94136b = true;
            j(0L);
            tru truVar = this.f94141dy;
            if (truVar != null) {
                truVar.removeCallbacks(this.oby);
                this.f94141dy.postDelayed(this.oby, this.aeu);
            }
        }
        this.rmf.countDown();
    }

    @Override // nb.c
    public boolean lt() {
        tru truVar;
        return (this.xkz == 206 || ((truVar = this.f94141dy) != null && truVar.hasMessages(100))) && !this.kgy;
    }

    @Override // nb.c
    public int lud() {
        MediaPlayer mediaPlayer;
        if (this.f94144jc == null || fby() || (mediaPlayer = ((n) this.f94144jc).f94163i) == null) {
            return 0;
        }
        return mediaPlayer.getVideoHeight();
    }

    @Override // nb.c
    public boolean ul() {
        tru truVar;
        return ((this.xkz != 207 && !this.kgy) || (truVar = this.f94141dy) == null || truVar.hasMessages(100)) ? false : true;
    }

    public void jc() {
        if (fby() || this.f94141dy == null) {
            return;
        }
        this.f94152xz.set(true);
        this.f94141dy.post(new a(this, 1));
    }

    @Override // nb.c
    public int dj() {
        MediaPlayer mediaPlayer;
        if (this.f94144jc == null || fby() || (mediaPlayer = ((n) this.f94144jc).f94163i) == null) {
            return 0;
        }
        return mediaPlayer.getVideoWidth();
    }

    @Override // nb.c
    public boolean sya() {
        return ry() || lt() || ul();
    }

    @Override // nb.c
    public boolean zb() {
        return this.xkz == 209;
    }

    @Override // wb.f
    public void sya(l lVar) {
        for (WeakReference<nb.b> weakReference : this.sya) {
            if (weakReference != null && weakReference.get() != null) {
                weakReference.get().ycx((nb.c) this, true);
            }
        }
    }

    @Override // wb.e
    public boolean zb(l lVar, int i5, int i11) {
        if (this.f94144jc != lVar) {
            return false;
        }
        if (i11 == -1004) {
            com.bykv.vk.openvk.ycx.ycx.ycx.sya.b bVar = new com.bykv.vk.openvk.ycx.ycx.ycx.sya.b(i5, i11);
            for (WeakReference<nb.b> weakReference : this.sya) {
                if (weakReference != null && weakReference.get() != null) {
                    weakReference.get().ycx(this, bVar);
                }
            }
        }
        i(i5);
        return false;
    }

    public static void ycx(d dVar, long j11, long j12) {
        d dVar2;
        long j13;
        long j14;
        if (!dVar.dc) {
            dVar.e();
        }
        for (WeakReference<nb.b> weakReference : dVar.sya) {
            if (weakReference == null || weakReference.get() == null) {
                dVar2 = dVar;
                j13 = j11;
                j14 = j12;
            } else {
                dVar2 = dVar;
                j13 = j11;
                j14 = j12;
                weakReference.get().ycx(dVar2, j13, j14);
            }
            dVar = dVar2;
            j11 = j13;
            j12 = j14;
        }
    }

    @Override // wb.g
    public void zb(l lVar) {
        if (fby()) {
            return;
        }
        this.xkz = Sdk.SDKError.Reason.AD_IS_PLAYING_VALUE;
        try {
            com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar = this.bhi;
            if (aVar != null) {
                float fSyc = aVar.syc();
                if (fSyc > 0.0f) {
                    MediaPlayer mediaPlayer = ((n) this.f94144jc).f94163i;
                    mediaPlayer.setPlaybackParams(mediaPlayer.getPlaybackParams().setSpeed(fSyc));
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "VOAdhwasaNWFTg==", 1147);
        }
        if (this.f94141dy != null) {
            if (this.kgy) {
                tru truVar = this.f94141dy;
                if (truVar != null) {
                    truVar.post(new a(this, 6));
                }
            } else {
                tru truVar2 = this.f94141dy;
                truVar2.sendMessage(truVar2.obtainMessage(100, -1, -1));
            }
        }
        ycx.delete(this.oty);
        boolean z11 = this.dwi;
        boolean z12 = this.f94149tn;
        if (!z11 && !z12) {
            e();
            this.f94149tn = true;
        }
        for (WeakReference<nb.b> weakReference : this.sya) {
            if (weakReference != null && weakReference.get() != null) {
                weakReference.get().zb(this);
            }
        }
    }

    public void ycx(boolean z11) {
        if (fby()) {
            return;
        }
        this.tru = z11;
        if (this.f94144jc != null) {
            ((n) this.f94144jc).f94162h = z11;
            return;
        }
        tru truVar = this.f94141dy;
        if (truVar != null) {
            truVar.post(new b(this, z11, 1));
        }
    }

    public void ycx(boolean z11, long j11, boolean z12) {
        if (fby()) {
            return;
        }
        tru truVar = this.f94141dy;
        if (truVar != null) {
            truVar.post(new a(this, 0));
        }
        this.f94138av = z12;
        this.f94152xz.set(true);
        this.kgy = false;
        zb(z12);
        if (z11) {
            this.syc = j11;
            k(new a(this, 4));
        } else {
            j(j11);
        }
        tru truVar2 = this.f94141dy;
        if (truVar2 != null) {
            truVar2.removeCallbacks(this.oby);
            this.f94141dy.postDelayed(this.oby, this.aeu);
        }
        this.rmf.countDown();
    }

    public void zb(boolean z11) {
        tru truVar;
        if (fby() || (truVar = this.f94141dy) == null) {
            return;
        }
        truVar.post(new b(this, z11, 0));
    }

    public void ycx(long j11) {
        if (fby()) {
            return;
        }
        if (this.xkz == 207 || this.xkz == 206 || this.xkz == 209) {
            k(new t(this, j11, 5));
        }
    }

    public void zb(int i5) {
        this.fby = i5;
    }

    @Override // nb.c
    public boolean ycx() {
        return this.f94145jw;
    }

    public void ycx(SurfaceTexture surfaceTexture) {
        if (fby()) {
            return;
        }
        this.lud = surfaceTexture;
        ycx(true);
        k(new w((Object) this, (Object) surfaceTexture, false, 26));
    }

    public void ycx(SurfaceHolder surfaceHolder) {
        if (fby()) {
            return;
        }
        this.f94146lt = surfaceHolder;
        ycx(true);
        k(new w((Object) this, (Object) surfaceHolder, false, 27));
    }

    public void ycx(com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar) {
        if (fby()) {
            return;
        }
        this.bhi = aVar;
        if (aVar != null) {
            this.dwi = this.dwi && !aVar.ul();
        }
        k(new w((Object) this, (Object) aVar, false, 28));
    }

    @Override // com.bytedance.sdk.component.utils.tru.ycx
    public void ycx(Message message) {
        int i5 = this.xkz;
        int i11 = message.what;
        if (this.f94144jc != null) {
            switch (message.what) {
                case 100:
                    if (this.xkz == 205 || this.xkz == 207 || this.xkz == 209) {
                        try {
                            ((n) this.f94144jc).f94163i.start();
                            this.wwx = SystemClock.elapsedRealtime();
                            this.xkz = Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE;
                            if (this.syc > 0) {
                                ((n) this.f94144jc).d(this.syc, this.fby);
                                this.syc = -1L;
                            }
                            if (this.bhi != null) {
                                zb(this.f94138av);
                                return;
                            }
                            return;
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "U+8jkQ+5RNSH", 653);
                            return;
                        }
                    }
                    break;
                case 101:
                    if (this.wie) {
                        this.pmi += this.htf;
                    }
                    this.wie = false;
                    this.htf = 0L;
                    this.f94150uh = Long.MIN_VALUE;
                    if (this.xkz == 206 || this.xkz == 207 || this.xkz == 209) {
                        try {
                            ((n) this.f94144jc).f94163i.pause();
                            this.xkz = Sdk.SDKError.Reason.PLACEMENT_AD_TYPE_MISMATCH_VALUE;
                            this.kgy = false;
                            for (WeakReference<nb.b> weakReference : this.sya) {
                                if (weakReference != null && weakReference.get() != null) {
                                    weakReference.get().dj(this);
                                }
                            }
                            return;
                        } catch (Throwable th3) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "U+8jkQ+5RNSH", 686);
                            return;
                        }
                    }
                    break;
                case 102:
                    try {
                        ((n) this.f94144jc).b();
                        this.xkz = 201;
                        return;
                    } catch (Throwable th4) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th4, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "U+8jkQ+5RNSH", 736);
                        return;
                    }
                case 103:
                    try {
                        a();
                    } catch (Throwable th5) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th5, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "U+8jkQ+5RNSH", 713);
                    }
                    for (WeakReference<nb.b> weakReference2 : this.sya) {
                        if (weakReference2 != null && weakReference2.get() != null) {
                            weakReference2.get().sya(this);
                        }
                    }
                    this.xkz = Sdk.SDKError.Reason.AD_IS_LOADING_VALUE;
                    return;
                case 104:
                    if (this.xkz == 202 || this.xkz == 208) {
                        try {
                            MediaPlayer mediaPlayer = ((n) this.f94144jc).f94163i;
                            if (mediaPlayer != null) {
                                mediaPlayer.prepareAsync();
                                return;
                            }
                            return;
                        } catch (Throwable th6) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th6, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "U+8jkQ+5RNSH", Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE);
                            return;
                        }
                    }
                    break;
                case 105:
                    if (this.xkz == 205 || this.xkz == 206 || this.xkz == 208 || this.xkz == 207 || this.xkz == 209) {
                        try {
                            ((n) this.f94144jc).f94163i.stop();
                            this.xkz = Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE;
                            return;
                        } catch (Throwable th7) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th7, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "U+8jkQ+5RNSH", 827);
                            return;
                        }
                    }
                    break;
                case 106:
                    if (this.xkz == 206 || this.xkz == 207 || this.xkz == 209) {
                        try {
                            ((n) this.f94144jc).d(((Long) message.obj).longValue(), this.fby);
                            return;
                        } catch (Throwable th8) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th8, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "U+8jkQ+5RNSH", 747);
                            return;
                        }
                    }
                    break;
                case 107:
                    this.pmi = 0L;
                    this.f94151ul = 0;
                    this.htf = 0L;
                    this.wie = false;
                    this.f94150uh = Long.MIN_VALUE;
                    if (this.xkz == 201 || this.xkz == 203) {
                        try {
                            com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar = (com.bykv.vk.openvk.ycx.ycx.ycx.sya.a) message.obj;
                            if (TextUtils.isEmpty(aVar.lud())) {
                                aVar.ycx(nb.a.b());
                            }
                            if (aVar.oty()) {
                                ((n) this.f94144jc).e(aVar.dy());
                                aVar.dy();
                            } else {
                                File file = new File(aVar.lud(), aVar.wie());
                                if (file.exists()) {
                                    f(aVar, file);
                                } else {
                                    d(aVar);
                                }
                            }
                            this.xkz = Sdk.SDKError.Reason.AD_CONSUMED_VALUE;
                            return;
                        } catch (Throwable th9) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th9, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "U+8jkQ+5RNSH", 779);
                            return;
                        }
                    }
                    break;
                case 108:
                case 109:
                default:
                    return;
                case 110:
                    try {
                        SurfaceHolder surfaceHolder = (SurfaceHolder) message.obj;
                        n nVar = (n) this.f94144jc;
                        synchronized (nVar.f94167m) {
                            try {
                                if (!nVar.n && surfaceHolder != null && surfaceHolder.getSurface() != null && nVar.f94162h) {
                                    nVar.f94163i.setDisplay(surfaceHolder);
                                }
                            } finally {
                                ((n) this.f94144jc).f94163i.setScreenOnWhilePlaying(true);
                                this.rmf.await(1L, TimeUnit.SECONDS);
                                c();
                                return;
                            }
                        }
                        ((n) this.f94144jc).f94163i.setScreenOnWhilePlaying(true);
                        this.rmf.await(1L, TimeUnit.SECONDS);
                        c();
                        return;
                    } catch (Throwable th10) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th10, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "U+8jkQ+5RNSH", 814);
                        return;
                    }
                case 111:
                    try {
                        this.rmy = new Surface((SurfaceTexture) message.obj);
                        l lVar = this.f94144jc;
                        Surface surface = this.rmy;
                        n nVar2 = (n) lVar;
                        nVar2.a();
                        nVar2.f94166l = surface;
                        nVar2.f94163i.setSurface(surface);
                        ((n) this.f94144jc).f94163i.setScreenOnWhilePlaying(true);
                        this.rmf.await(1L, TimeUnit.SECONDS);
                        c();
                        return;
                    } catch (Throwable th11) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th11, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "U+8jkQ+5RNSH", 799);
                        return;
                    }
            }
            this.xkz = 200;
            if (this.f94142ea) {
                return;
            }
            com.bykv.vk.openvk.ycx.ycx.ycx.sya.b bVar = new com.bykv.vk.openvk.ycx.ycx.ycx.sya.b(Sdk.SDKError.Reason.AD_WIN_NOTIFICATION_ERROR_VALUE, i11);
            bVar.f22182c = i5 + "," + i11;
            for (WeakReference<nb.b> weakReference3 : this.sya) {
                if (weakReference3 != null && weakReference3.get() != null) {
                    weakReference3.get().ycx(this, bVar);
                }
            }
            this.f94142ea = true;
        }
    }

    @Override // wb.j
    public void ycx(l lVar, int i5) {
        if (this.f94144jc != lVar) {
            return;
        }
        for (WeakReference<nb.b> weakReference : this.sya) {
            if (weakReference != null && weakReference.get() != null) {
                weakReference.get().zb(this, i5);
            }
        }
    }

    @Override // wb.h
    public boolean ycx(l lVar, int i5, int i11) {
        SparseIntArray sparseIntArray = ycx;
        sparseIntArray.put(this.oty, sparseIntArray.get(this.oty) + 1);
        this.xkz = 200;
        tru truVar = this.f94141dy;
        if (truVar != null) {
            truVar.removeCallbacks(this.oby);
        }
        boolean z11 = i5 == -1010 || i5 == -1007 || i5 == -1004 || i5 == -110 || i5 == 100 || i5 == 200;
        if (i11 == 1 || i11 == 700 || i11 == 800) {
            z11 = true;
        }
        if (z11) {
            b();
        }
        if (!this.f94152xz.get()) {
            return true;
        }
        this.f94152xz.set(false);
        com.bykv.vk.openvk.ycx.ycx.ycx.sya.b bVar = new com.bykv.vk.openvk.ycx.ycx.ycx.sya.b(i5, i11);
        for (WeakReference<nb.b> weakReference : this.sya) {
            if (weakReference != null && weakReference.get() != null) {
                weakReference.get().ycx(this, bVar);
            }
        }
        return true;
    }

    @Override // wb.k
    public void ycx(l lVar) {
        this.xkz = Sdk.SDKError.Reason.INVALID_JSON_BID_PAYLOAD_VALUE;
        ycx.delete(this.oty);
        tru truVar = this.f94141dy;
        if (truVar != null) {
            truVar.removeCallbacks(this.oby);
        }
        for (WeakReference<nb.b> weakReference : this.sya) {
            if (weakReference != null && weakReference.get() != null) {
                weakReference.get().ycx(this);
            }
        }
    }

    @Override // wb.i
    public void ycx(l lVar, int i5, int i11, int i12, int i13) {
        for (WeakReference<nb.b> weakReference : this.sya) {
            if (weakReference != null && weakReference.get() != null) {
                weakReference.get().ycx((nb.c) this, i5, i11);
            }
        }
    }

    public void ycx(nb.b bVar) {
        if (bVar == null) {
            return;
        }
        for (WeakReference<nb.b> weakReference : this.sya) {
            if (weakReference != null && weakReference.get() == bVar) {
                return;
            }
        }
        this.sya.add(new WeakReference<>(bVar));
    }

    public void ycx(int i5) {
        if (fby()) {
            return;
        }
        this.aeu = i5;
    }

    public boolean ycx(float f11) {
        PlaybackParams playbackParams;
        if (f11 <= 0.0f) {
            return false;
        }
        try {
            if (this.f94144jc == null || !sya()) {
                return false;
            }
            try {
                playbackParams = ((n) this.f94144jc).f94163i.getPlaybackParams();
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "SOs5pQ+9cPSQT9JZvhC0IVQ=", 1482);
                htf.sya("CSJ_VIDEO_MEDIA", "getPlaybackParams error:" + th2.getMessage());
                playbackParams = null;
            }
            if ((playbackParams != null ? playbackParams.getSpeed() : 0.0f) == f11) {
                return true;
            }
            MediaPlayer mediaPlayer = ((n) this.f94144jc).f94163i;
            mediaPlayer.setPlaybackParams(mediaPlayer.getPlaybackParams().setSpeed(f11));
            return true;
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIc=", "SOs5pQ+9cPSQT9JZvhC0IVQ=", 1495);
            htf.ycx("CSJ_VIDEO_MEDIA", "setPlaySpeedRatio error: ", th3);
            return false;
        }
    }
}
