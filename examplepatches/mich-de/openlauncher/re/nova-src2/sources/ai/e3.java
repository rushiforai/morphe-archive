package ai;

import android.app.ActivityManager;
import android.app.ApplicationExitInfo;
import android.content.Context;
import com.google.android.gms.internal.measurement.fe;
import com.google.android.gms.internal.measurement.zd;
import io.sentry.android.core.AnrV2Integration;
import io.sentry.android.core.SentryAndroidOptions;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class e3 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f12910a;

    /* renamed from: b, reason: collision with root package name */
    public final long f12911b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f12912c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f12913d;

    public /* synthetic */ e3(Object obj, Object obj2, long j11, int i5) {
        this.f12910a = i5;
        this.f12913d = obj;
        this.f12912c = obj2;
        this.f12911b = j11;
    }

    public void a(ApplicationExitInfo applicationExitInfo, boolean z11) {
        fl.l lVar;
        byte[] bArr;
        SentryAndroidOptions sentryAndroidOptions = (SentryAndroidOptions) this.f12913d;
        long timestamp = applicationExitInfo.getTimestamp();
        boolean z12 = applicationExitInfo.getImportance() != 100;
        try {
            InputStream traceInputStream = applicationExitInfo.getTraceInputStream();
            try {
                if (traceInputStream == null) {
                    lVar = new fl.l(io.sentry.android.core.v.NO_DUMP);
                    if (traceInputStream != null) {
                        traceInputStream.close();
                    }
                } else {
                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                    try {
                        byte[] bArr2 = new byte[1024];
                        while (true) {
                            int i5 = traceInputStream.read(bArr2, 0, 1024);
                            if (i5 == -1) {
                                break;
                            } else {
                                byteArrayOutputStream.write(bArr2, 0, i5);
                            }
                        }
                        byte[] byteArray = byteArrayOutputStream.toByteArray();
                        byteArrayOutputStream.close();
                        traceInputStream.close();
                        try {
                            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(byteArray)));
                            try {
                                ArrayList arrayList = new ArrayList();
                                while (true) {
                                    String line = bufferedReader.readLine();
                                    if (line == null) {
                                        break;
                                    }
                                    io.sentry.android.core.internal.threaddump.a aVar = new io.sentry.android.core.internal.threaddump.a();
                                    aVar.f66922a = line;
                                    arrayList.add(aVar);
                                }
                                ArrayList arrayListD = new io.sentry.android.core.internal.threaddump.c(sentryAndroidOptions, z12).d(new io.sentry.android.core.internal.threaddump.b(arrayList));
                                if (arrayListD.isEmpty()) {
                                    lVar = new fl.l(io.sentry.android.core.v.NO_DUMP);
                                    bufferedReader.close();
                                } else {
                                    fl.l lVar2 = new fl.l(17, io.sentry.android.core.v.DUMP, byteArray, arrayListD);
                                    bufferedReader.close();
                                    lVar = lVar2;
                                }
                            } finally {
                            }
                        } catch (Throwable th2) {
                            sentryAndroidOptions.getLogger().e(io.sentry.g3.WARNING, "Failed to parse ANR thread dump", th2);
                            lVar = new fl.l(io.sentry.android.core.v.ERROR, byteArray);
                        }
                    } finally {
                    }
                }
            } finally {
            }
        } catch (Throwable th3) {
            sentryAndroidOptions.getLogger().e(io.sentry.g3.WARNING, "Failed to read ANR thread dump", th3);
            lVar = new fl.l(io.sentry.android.core.v.NO_DUMP);
        }
        io.sentry.android.core.v vVar = (io.sentry.android.core.v) lVar.f55376d;
        if (vVar == io.sentry.android.core.v.NO_DUMP) {
            sentryAndroidOptions.getLogger().g(io.sentry.g3.WARNING, "Not reporting ANR event as there was no thread dump for the ANR %s", applicationExitInfo.toString());
            return;
        }
        io.sentry.android.core.u uVar = new io.sentry.android.core.u(sentryAndroidOptions.getFlushTimeoutMillis(), sentryAndroidOptions.getLogger(), timestamp, z11, z12);
        io.sentry.x xVarR = ex.i.r(uVar);
        io.sentry.b3 b3Var = new io.sentry.b3();
        if (vVar == io.sentry.android.core.v.ERROR) {
            io.sentry.protocol.l lVar3 = new io.sentry.protocol.l();
            lVar3.f67569a = "Sentry Android SDK failed to parse system thread dump for this ANR. We recommend enabling [SentryOptions.isAttachAnrThreadDump] option to attach the thread dump as plain text and report this issue on GitHub.";
            b3Var.f67116q = lVar3;
        } else if (vVar == io.sentry.android.core.v.DUMP) {
            b3Var.f67118s = new io.sentry.g1((List) lVar.f55375c);
        }
        b3Var.f67120u = io.sentry.g3.FATAL;
        b3Var.f67115p = android.support.v4.media.session.b.W(timestamp);
        if (sentryAndroidOptions.isAttachAnrThreadDump() && (bArr = (byte[]) lVar.f55374b) != null) {
            xVarR.f67906e = new io.sentry.a("thread-dump.txt", "text/plain", bArr);
        }
        if (io.sentry.o2.b().w(b3Var, xVarR).equals(io.sentry.protocol.u.f67620b) || uVar.d()) {
            return;
        }
        sentryAndroidOptions.getLogger().g(io.sentry.g3.WARNING, "Timed out waiting to flush ANR event to disk. Event: %s", b3Var.f67682a);
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0111  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0120  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x010f A[SYNTHETIC] */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() {
        Long lValueOf;
        Iterator it;
        int i5 = this.f12910a;
        ApplicationExitInfo applicationExitInfo = null;
        int i11 = 1;
        long j11 = this.f12911b;
        Object obj = this.f12912c;
        Object obj2 = this.f12913d;
        switch (i5) {
            case 0:
                f3 f3Var = (f3) obj2;
                f3Var.M((b3) obj, false, j11);
                f3Var.f12949e = null;
                p3 p3VarO = ((m1) f3Var.f13368a).o();
                p3VarO.D();
                p3VarO.E();
                p3VarO.R(new ab.z(p3VarO, (b3) null));
                break;
            case 1:
                ((zd) obj).run();
                TimeUnit timeUnit = TimeUnit.MINUTES;
                cl.j1 j1Var = (cl.j1) ((cl.e1) obj2);
                j1Var.getClass();
                cl.p1 p1Var = new cl.p1(Executors.callable(this, null));
                cl.h1 h1Var = new cl.h1(p1Var, j1Var.f20024c.schedule(p1Var, j11, timeUnit));
                h1Var.b(new zd(h1Var, i11), cl.m0.f20038a);
                break;
            case 2:
                SentryAndroidOptions sentryAndroidOptions = (SentryAndroidOptions) obj2;
                List historicalProcessExitReasons = ((ActivityManager) ((Context) obj).getSystemService("activity")).getHistoricalProcessExitReasons(null, 0, 0);
                if (historicalProcessExitReasons.size() == 0) {
                    sentryAndroidOptions.getLogger().g(io.sentry.g3.DEBUG, "No records in historical exit reasons.", new Object[0]);
                    break;
                } else {
                    io.sentry.cache.c envelopeDiskCache = sentryAndroidOptions.getEnvelopeDiskCache();
                    if ((envelopeDiskCache instanceof io.sentry.cache.b) && sentryAndroidOptions.isEnableAutoSessionTracking()) {
                        io.sentry.cache.b bVar = (io.sentry.cache.b) envelopeDiskCache;
                        if (!bVar.g()) {
                            sentryAndroidOptions.getLogger().g(io.sentry.g3.WARNING, "Timed out waiting to flush previous session to its own file.", new Object[0]);
                            bVar.f67161e.countDown();
                        }
                    }
                    ArrayList arrayList = new ArrayList(historicalProcessExitReasons);
                    int i12 = io.sentry.android.core.cache.a.f66855i;
                    String cacheDirPath = sentryAndroidOptions.getCacheDirPath();
                    i30.j.Q(cacheDirPath, "Cache dir path should be set for getting ANRs reported");
                    File file = new File(cacheDirPath, "last_anr_report");
                    try {
                    } catch (Throwable th2) {
                        sentryAndroidOptions.getLogger().e(io.sentry.g3.ERROR, "Error reading last ANR marker", th2);
                    }
                    if (file.exists() && file.canRead()) {
                        String strF = cw.l2.F(file);
                        if (!strF.equals(AbstractJsonLexerKt.NULL)) {
                            lValueOf = Long.valueOf(Long.parseLong(strF.trim()));
                        }
                        it = arrayList.iterator();
                        while (true) {
                            if (!it.hasNext()) {
                                ApplicationExitInfo applicationExitInfoC = b.s.c(it.next());
                                if (applicationExitInfoC.getReason() == 6) {
                                    arrayList.remove(applicationExitInfoC);
                                    applicationExitInfo = applicationExitInfoC;
                                }
                            }
                        }
                        if (applicationExitInfo == null) {
                            if (applicationExitInfo.getTimestamp() >= j11) {
                                if (lValueOf != null && applicationExitInfo.getTimestamp() <= lValueOf.longValue()) {
                                    sentryAndroidOptions.getLogger().g(io.sentry.g3.DEBUG, "Latest ANR has already been reported, returning early.", new Object[0]);
                                    break;
                                } else {
                                    if (sentryAndroidOptions.isReportHistoricalAnrs()) {
                                        Collections.reverse(arrayList);
                                        Iterator it2 = arrayList.iterator();
                                        while (it2.hasNext()) {
                                            ApplicationExitInfo applicationExitInfoC2 = b.s.c(it2.next());
                                            if (applicationExitInfoC2.getReason() == 6) {
                                                if (applicationExitInfoC2.getTimestamp() < j11) {
                                                    sentryAndroidOptions.getLogger().g(io.sentry.g3.DEBUG, "ANR happened too long ago %s.", applicationExitInfoC2);
                                                } else if (lValueOf == null || applicationExitInfoC2.getTimestamp() > lValueOf.longValue()) {
                                                    a(applicationExitInfoC2, false);
                                                } else {
                                                    sentryAndroidOptions.getLogger().g(io.sentry.g3.DEBUG, "ANR has already been reported %s.", applicationExitInfoC2);
                                                }
                                            }
                                        }
                                    }
                                    a(applicationExitInfo, true);
                                    break;
                                }
                            } else {
                                sentryAndroidOptions.getLogger().g(io.sentry.g3.DEBUG, "Latest ANR happened too long ago, returning early.", new Object[0]);
                                break;
                            }
                        } else {
                            sentryAndroidOptions.getLogger().g(io.sentry.g3.DEBUG, "No ANRs have been found in the historical exit reasons list.", new Object[0]);
                            break;
                        }
                    } else {
                        sentryAndroidOptions.getLogger().g(io.sentry.g3.DEBUG, "Last ANR marker does not exist. %s.", file.getAbsolutePath());
                    }
                    lValueOf = null;
                    it = arrayList.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                        }
                    }
                    if (applicationExitInfo == null) {
                    }
                }
                break;
            case 3:
                jb.i iVar = (jb.i) obj2;
                iVar.mEventLog.a(j11, (String) obj);
                iVar.mEventLog.b(iVar.toString());
                break;
            default:
                sp.k0 k0Var = (sp.k0) obj2;
                sp.m0 m0Var = k0Var.f87600a;
                if (((Boolean) obj).booleanValue()) {
                    k0Var.b(j11);
                }
                k0Var.f87605f = true;
                sp.c0.c(m0Var.f87616a, m0Var.f87617b);
                sp.i iVar2 = m0Var.f87617b;
                if (iVar2 != null) {
                    iVar2.c();
                    break;
                }
                break;
        }
    }

    public e3(f3 f3Var, b3 b3Var, long j11) {
        this.f12910a = 0;
        this.f12912c = b3Var;
        this.f12911b = j11;
        Objects.requireNonNull(f3Var);
        this.f12913d = f3Var;
    }

    public e3(fe feVar, zd zdVar, cl.e1 e1Var, long j11) {
        this.f12910a = 1;
        TimeUnit timeUnit = TimeUnit.MINUTES;
        this.f12912c = zdVar;
        this.f12913d = e1Var;
        this.f12911b = j11;
    }

    public e3(Context context, SentryAndroidOptions sentryAndroidOptions, io.sentry.transport.d dVar) {
        this.f12910a = 2;
        this.f12912c = context;
        this.f12913d = sentryAndroidOptions;
        dVar.getClass();
        this.f12911b = System.currentTimeMillis() - AnrV2Integration.f66774d;
    }
}
