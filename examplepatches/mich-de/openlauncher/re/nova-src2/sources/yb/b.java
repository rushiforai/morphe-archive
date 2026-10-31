package yb;

import a2.c;
import com.amplitude.core.events.Identify;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.zb.ycx.ea;
import com.bytedance.sdk.component.zb.ycx.ok;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.concurrent.TimeUnit;
import org.json.JSONObject;
import p6.p0;
import ps.f;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f97227a;

    /* renamed from: d, reason: collision with root package name */
    public final File f97230d;

    /* renamed from: e, reason: collision with root package name */
    public final File f97231e;

    /* renamed from: f, reason: collision with root package name */
    public final long f97232f;

    /* renamed from: j, reason: collision with root package name */
    public RandomAccessFile f97236j;

    /* renamed from: k, reason: collision with root package name */
    public final com.bykv.vk.openvk.ycx.ycx.ycx.sya.a f97237k;

    /* renamed from: l, reason: collision with root package name */
    public volatile long f97238l;

    /* renamed from: b, reason: collision with root package name */
    public volatile long f97228b = -2147483648L;

    /* renamed from: c, reason: collision with root package name */
    public final Object f97229c = new Object();

    /* renamed from: g, reason: collision with root package name */
    public volatile int f97233g = -100;

    /* renamed from: h, reason: collision with root package name */
    public volatile boolean f97234h = false;

    /* renamed from: i, reason: collision with root package name */
    public volatile boolean f97235i = false;

    public b(com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar) {
        this.f97232f = 0L;
        this.f97236j = null;
        this.f97237k = aVar;
        try {
            String strLud = aVar.lud();
            String strWie = aVar.wie();
            File fileX = f.x(strLud, strWie);
            this.f97230d = fileX;
            File fileT = f.t(strLud, strWie);
            this.f97231e = fileT;
            if (fileT.exists()) {
                this.f97236j = new RandomAccessFile(fileT, "r");
            } else {
                this.f97236j = new RandomAccessFile(fileX, "rw");
            }
            if (!fileT.exists()) {
                this.f97232f = fileX.length();
                b();
            }
            this.f97227a = p0.f82235g == 2;
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2wC9as+F", "duspnAKYZtCORthciCGsKULNLJYLuUDKkEY=", "B+cjnBfi", 94);
            aVar.dy();
        }
    }

    public static void a(b bVar) {
        synchronized (bVar.f97229c) {
            if (bVar.f97231e.exists()) {
                bVar.f97237k.dy();
                bVar.f97237k.wie();
                return;
            }
            try {
            } finally {
            }
            if (!bVar.f97230d.renameTo(bVar.f97231e)) {
                throw new IOException("Error renaming file " + bVar.f97230d + " to " + bVar.f97231e + " for completion!");
            }
            RandomAccessFile randomAccessFile = bVar.f97236j;
            if (randomAccessFile != null) {
                randomAccessFile.close();
            }
            bVar.f97236j = new RandomAccessFile(bVar.f97231e, "rw");
            bVar.f97237k.wie();
            bVar.f97237k.dy();
        }
    }

    public static void c(b bVar, int i5, String str) {
        JSONObject jSONObjectSya;
        bVar.f97235i = false;
        bVar.f97233g = i5;
        bVar.f97228b = -1L;
        htf.zb("CSJ_MediaDLPlay", "handleFailResponse: ", Integer.valueOf(i5), " ", str);
        if (!bVar.f97237k.ycx() || (jSONObjectSya = bVar.f97237k.sya()) == null) {
            return;
        }
        try {
            jSONObjectSya.put("error_real_code", i5);
            jSONObjectSya.put("error_real_msg", str);
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2wC9as+F", "duspnAKYZtCORthciCGsKULNLJYLuUDKkEY=", "U+8jkQ+5T8aJRuVYnwGvJkjr", Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE);
            htf.ycx("CSJ_MediaDLPlay", "handleFailResponse: ", th2);
        }
    }

    public final void b() {
        ea.ycx ycxVarSya = nb.a.a() != null ? nb.a.a().sya() : new ea.ycx("v_cache");
        com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar = this.f97237k;
        long jUh = aVar.uh();
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        ycxVarSya.ycx(jUh, timeUnit).zb(aVar.htf(), timeUnit).sya(aVar.thx(), timeUnit);
        ea eaVarYcx = ycxVarSya.ycx();
        aVar.wie();
        eaVarYcx.ycx(new ok.ycx().ycx("RANGE", c.i(this.f97232f, Identify.UNSET_VALUE, new StringBuilder("bytes="))).zb(aVar.dy()).ycx().ycx("videoLoadWhenPlaying").ycx(9).zb()).ycx(new y90.f(this));
    }
}
