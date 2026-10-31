package zb;

import ai.k0;
import android.content.Context;
import com.amplitude.core.events.Identify;
import com.bytedance.sdk.component.zb.ycx.ea;
import com.bytedance.sdk.component.zb.ycx.ok;
import com.bytedance.sdk.openadsdk.oty.sya;
import h6.c1;
import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.TimeUnit;
import p6.p0;
import ps.f;

/* loaded from: classes2.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final Context f98507a;

    /* renamed from: b, reason: collision with root package name */
    public final com.bykv.vk.openvk.ycx.ycx.ycx.sya.a f98508b;

    /* renamed from: d, reason: collision with root package name */
    public final File f98510d;

    /* renamed from: e, reason: collision with root package name */
    public final File f98511e;

    /* renamed from: c, reason: collision with root package name */
    public volatile boolean f98509c = false;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f98512f = new ArrayList();

    /* renamed from: g, reason: collision with root package name */
    public volatile boolean f98513g = false;

    public c(Context context, com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar) {
        this.f98510d = null;
        this.f98511e = null;
        this.f98507a = context;
        this.f98508b = aVar;
        this.f98510d = f.x(aVar.lud(), aVar.wie());
        this.f98511e = f.t(aVar.lud(), aVar.wie());
    }

    public static void a(c cVar) {
        File file = cVar.f98511e;
        File file2 = cVar.f98510d;
        try {
            if (file2.renameTo(file)) {
                return;
            }
            throw new IOException("Error renaming file " + file2 + " to " + file + " for completion!");
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2xOubMuPS9M=", "aessmQ+lX86ET9htnhSsJ1rq", "XvYoliCzZNeMT8NYiA==", 331);
            th2.getMessage();
        }
    }

    public static void d(c cVar, com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar, int i5, String str) {
        synchronized (qb.a.class) {
            try {
                Iterator it = cVar.f98512f.iterator();
                while (it.hasNext()) {
                    qb.a aVar2 = (qb.a) it.next();
                    if (aVar2 != null) {
                        aVar2.ycx(aVar, i5, str);
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public static void e(c cVar, Closeable closeable) throws IOException {
        cVar.getClass();
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Exception e3) {
                sya.ycx(e3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2xOubMuPS9M=", "aessmQ+lX86ET9htnhSsJ1rq", "WOIihgY=", 265);
            }
        }
    }

    public final void b(com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar, int i5) {
        synchronized (qb.a.class) {
            try {
                Iterator it = this.f98512f.iterator();
                while (it.hasNext()) {
                    qb.a aVar2 = (qb.a) it.next();
                    if (aVar2 != null) {
                        aVar2.ycx(aVar, i5);
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x0073, code lost:
    
        r0 = r17.f98508b.tru();
        r4 = com.bytedance.sdk.component.utils.ul.ycx(r8, r0);
        r8.getAbsolutePath();
        r0.getAbsolutePath();
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0083, code lost:
    
        if (r4 == false) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0085, code lost:
    
        r17.f98508b.dj(true);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(qb.a aVar) {
        File[] fileArrListFiles;
        if (this.f98513g) {
            synchronized (qb.a.class) {
                this.f98512f.add(aVar);
            }
            return;
        }
        this.f98512f.add(aVar);
        boolean z11 = true;
        if (p0.f82237i && !f()) {
            try {
                File parentFile = new File(this.f98508b.lud()).getParentFile();
                if (parentFile != null && (fileArrListFiles = parentFile.listFiles(new b())) != null) {
                    String strWie = this.f98508b.wie();
                    int length = fileArrListFiles.length;
                    int i5 = 0;
                    while (true) {
                        if (i5 >= length) {
                            break;
                        }
                        File file = fileArrListFiles[i5];
                        if (!file.getAbsolutePath().equals(this.f98508b.lud())) {
                            File file2 = new File(file, strWie);
                            if (file2.exists() && file2.length() > 0) {
                                break;
                            }
                        }
                        i5++;
                    }
                }
            } catch (Exception e3) {
                sya.ycx(e3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2xOubMuPS9M=", "aessmQ+lX86ET9htnhSsJ1rq", "XvYolhaobPeST/tSjRWJLnXhObAbtXrT", 107);
                e3.getMessage();
            }
        }
        if (f()) {
            this.f98508b.fby(1);
            b(this.f98508b, 200);
            a.a(this.f98508b);
            return;
        }
        this.f98513g = true;
        this.f98508b.fby(0);
        com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar2 = this.f98508b;
        ea.ycx ycxVarSya = nb.a.a() != null ? nb.a.a().sya() : new ea.ycx("v_preload");
        long jUh = aVar2.uh();
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        ycxVarSya.ycx(jUh, timeUnit).zb(aVar2.htf(), timeUnit).sya(aVar2.thx(), timeUnit);
        ea eaVarYcx = ycxVarSya.ycx();
        ok.ycx ycxVar = new ok.ycx();
        long length2 = this.f98510d.length();
        int iLt = aVar2.lt();
        boolean zRy = aVar2.ry();
        int iDj = aVar2.dj();
        if (iDj <= 0) {
            z11 = zRy;
        } else if (iDj < aVar2.ok()) {
            z11 = zRy;
            iLt = iDj;
        }
        ycxVar.ycx("videoPreload").ycx(6);
        if (z11) {
            ycxVar.ycx("RANGE", c1.o(length2, "bytes=", Identify.UNSET_VALUE)).zb(aVar2.dy()).ycx().zb();
        } else {
            ycxVar.ycx("RANGE", "bytes=" + length2 + Identify.UNSET_VALUE + iLt).zb(aVar2.dy()).ycx().zb();
        }
        eaVarYcx.ycx(ycxVar.zb()).ycx(new k0(this, length2, 12));
    }

    public final boolean f() {
        if (this.f98511e.exists()) {
            return true;
        }
        com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar = this.f98508b;
        if (!aVar.ry()) {
            File file = this.f98510d;
            if (file.length() >= aVar.lt()) {
                return true;
            }
            if (aVar.dj() > 0 && file.length() >= aVar.dj()) {
                return true;
            }
        }
        return false;
    }
}
