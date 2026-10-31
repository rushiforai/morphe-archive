package io.sentry.internal.debugmeta;

import ads_mobile_sdk.ql1;
import ads_mobile_sdk.r33;
import ads_mobile_sdk.xj;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.XmlResourceParser;
import android.graphics.Rect;
import android.os.Parcel;
import android.util.Log;
import android.util.SparseArray;
import android.util.Xml;
import android.view.View;
import android.widget.SeekBar;
import androidx.room.k;
import b.d0;
import b.f0;
import b.m5;
import b70.n;
import bn.q;
import cl.c0;
import cl.m0;
import cl.m1;
import cl.n0;
import cl.n1;
import cl.o0;
import cl.p0;
import cl.p1;
import cl.w0;
import cl.z0;
import com.google.android.gms.cloudmessaging.RegisterRequest;
import com.google.android.gms.common.api.ApiMetadata;
import com.google.android.gms.common.api.ComplianceOptions;
import com.google.android.gms.internal.measurement.ag;
import com.google.android.gms.internal.measurement.v6;
import com.google.common.util.concurrent.ListenableFuture;
import com.teslacoilsw.launcher.widget.DisabledSegmentSeekBar;
import eb0.g;
import eb0.y;
import fx.h;
import hq.e;
import hq.x;
import io.ktor.utils.io.m;
import io.ktor.utils.io.t;
import io.sentry.ILogger;
import io.sentry.clientreport.d;
import io.sentry.clientreport.f;
import io.sentry.e3;
import io.sentry.f3;
import io.sentry.g3;
import io.sentry.i;
import io.sentry.protocol.b0;
import io.sentry.w2;
import io.sentry.w3;
import io.sentry.z2;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import ni.g0;
import ni.v;
import ni.z;
import org.xmlpull.v1.XmlPullParserException;
import r3.s;
import rg.l;
import t70.k0;
import w70.i2;
import w70.o1;
import x80.j;

/* loaded from: classes4.dex */
public final class c implements a, f0, dn.b, j, z, g60.b, e, f, l, s {

    /* renamed from: a, reason: collision with root package name */
    public Object f67327a;

    /* renamed from: b, reason: collision with root package name */
    public Object f67328b;

    public /* synthetic */ c(Object obj) {
        this.f67328b = obj;
    }

    public static i s(f3 f3Var) {
        return f3.Event.equals(f3Var) ? i.Error : f3.Session.equals(f3Var) ? i.Session : f3.Transaction.equals(f3Var) ? i.Transaction : f3.UserFeedback.equals(f3Var) ? i.UserReport : f3.Profile.equals(f3Var) ? i.Profile : f3.Statsd.equals(f3Var) ? i.MetricBucket : f3.Attachment.equals(f3Var) ? i.Attachment : f3.CheckIn.equals(f3Var) ? i.Monitor : f3.ReplayVideo.equals(f3Var) ? i.Replay : i.Default;
    }

    public static void t(c cVar, e3 e3Var) {
        fl.l lVar = (fl.l) cVar.f67327a;
        long[] jArr = (long[]) lVar.f55376d;
        fl.l lVar2 = (fl.l) e3Var.f67208b;
        long[] jArr2 = (long[]) lVar2.f55376d;
        long[] jArr3 = (long[]) e3Var.f67209c;
        kl.a.m(jArr, jArr2, jArr3);
        long[] jArr4 = (long[]) lVar.f55374b;
        long[] jArr5 = (long[]) lVar2.f55374b;
        long[] jArr6 = (long[]) lVar2.f55375c;
        kl.a.m(jArr4, jArr5, jArr6);
        kl.a.m((long[]) lVar.f55375c, jArr6, jArr3);
        kl.a.m((long[]) cVar.f67328b, (long[]) lVar2.f55376d, (long[]) lVar2.f55374b);
    }

    public void A(dy.b bVar) {
        synchronized (((c) this.f67328b)) {
            ((ag) this.f67327a).q(bVar);
        }
    }

    public void B(io.sentry.clientreport.b bVar) {
        if (bVar == null) {
            return;
        }
        Iterator it = bVar.f67170b.iterator();
        while (it.hasNext()) {
            io.sentry.clientreport.e eVar = (io.sentry.clientreport.e) it.next();
            z(eVar.f67174a, eVar.f67175b, eVar.f67176c);
        }
    }

    public void C(int i5) {
        SeekBar seekBarR = r();
        if (seekBarR != null) {
            seekBarR.setMax(i5);
        }
        DisabledSegmentSeekBar disabledSegmentSeekBarQ = q();
        if (disabledSegmentSeekBarQ != null) {
            disabledSegmentSeekBarQ.l(i5);
        }
    }

    public ListenableFuture D(c0 c0Var, Executor executor) {
        executor.getClass();
        p0 p0Var = new p0(o0.f20048a);
        p0Var.f20056b = executor;
        p0Var.f20055a = this;
        e3 e3Var = new e3(7, p0Var, c0Var);
        m1 m1Var = new m1();
        ListenableFuture listenableFuture = (ListenableFuture) ((AtomicReference) this.f67327a).getAndSet(m1Var);
        p1 p1Var = new p1();
        p1Var.f20059h = new n1(p1Var, e3Var);
        listenableFuture.b(p1Var, p0Var);
        ListenableFuture listenableFutureC = w0.c(p1Var);
        n0 n0Var = new n0(p1Var, m1Var, listenableFuture, listenableFutureC, p0Var, 0);
        m0 m0Var = m0.f20038a;
        listenableFutureC.b(n0Var, m0Var);
        p1Var.b(n0Var, m0Var);
        return listenableFutureC;
    }

    public void a(m5 m5Var) {
        ((List) this.f67327a).add(m5Var);
    }

    @Override // rg.l
    public void accept(Object obj, Object obj2) {
        int i5;
        kh.c cVar = (kh.c) this.f67327a;
        kh.a aVar = (kh.a) obj;
        k kVar = new k(cVar, (fi.j) obj2);
        Context context = cVar.f84052a;
        try {
            i5 = zg.b.a(context).c(0, context.getPackageName()).versionCode;
        } catch (PackageManager.NameNotFoundException unused) {
            i5 = 0;
        }
        RegisterRequest registerRequest = (RegisterRequest) this.f67328b;
        registerRequest.f31774k = i5;
        kh.b bVar = (kh.b) aVar.getService();
        ApiMetadata apiMetadata = new ApiMetadata(new ComplianceOptions(-1, -1, 0, true), true);
        apiMetadata.f31798h = false;
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeInterfaceToken("com.google.android.gms.cloudmessaging.internal.ICloudMessagingService");
        parcelObtain.writeStrongBinder(kVar);
        parcelObtain.writeInt(1);
        registerRequest.writeToParcel(parcelObtain, 0);
        parcelObtain.writeInt(1);
        apiMetadata.writeToParcel(parcelObtain, 0);
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            bVar.f71524a.transact(1, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
        } finally {
            parcelObtain.recycle();
            parcelObtain2.recycle();
        }
    }

    @Override // hq.e
    public o1 b() {
        return (o1) this.f67328b;
    }

    @Override // io.sentry.clientreport.f
    public void c(d dVar, i iVar) {
        g(dVar, iVar, 1L);
    }

    @Override // hq.e
    public Object d(hq.f fVar, Continuation continuation) {
        return ((hq.s) ((x) this.f67327a)).a(fVar);
    }

    @Override // ni.z
    public void e(String preloadId) {
        Intrinsics.g(preloadId, "preloadId");
        ((h) this.f67327a).a((String) this.f67328b);
    }

    @Override // io.sentry.internal.debugmeta.a
    public List f() throws IOException {
        ILogger iLogger = (ILogger) this.f67327a;
        ArrayList arrayList = new ArrayList();
        try {
            Enumeration<URL> resources = ((ClassLoader) this.f67328b).getResources("sentry-debug-meta.properties");
            while (resources.hasMoreElements()) {
                URL urlNextElement = resources.nextElement();
                try {
                    InputStream inputStreamOpenStream = urlNextElement.openStream();
                    try {
                        Properties properties = new Properties();
                        properties.load(inputStreamOpenStream);
                        arrayList.add(properties);
                        iLogger.g(g3.INFO, "Debug Meta Data Properties loaded from %s", urlNextElement);
                        if (inputStreamOpenStream != null) {
                            inputStreamOpenStream.close();
                        }
                    } catch (Throwable th2) {
                        if (inputStreamOpenStream != null) {
                            try {
                                inputStreamOpenStream.close();
                            } catch (Throwable th3) {
                                th2.addSuppressed(th3);
                            }
                        }
                        throw th2;
                    }
                } catch (RuntimeException e3) {
                    iLogger.d(g3.ERROR, e3, "%s file is malformed.", urlNextElement);
                }
            }
        } catch (IOException e11) {
            iLogger.d(g3.ERROR, e11, "Failed to load %s", "sentry-debug-meta.properties");
        }
        if (!arrayList.isEmpty()) {
            return arrayList;
        }
        iLogger.g(g3.INFO, "No %s file was found.", "sentry-debug-meta.properties");
        return null;
    }

    @Override // io.sentry.clientreport.f
    public void g(d dVar, i iVar, long j11) {
        try {
            z(dVar.getReason(), iVar.getCategory(), Long.valueOf(j11));
        } catch (Throwable th2) {
            ((w3) this.f67328b).getLogger().d(g3.ERROR, th2, "Unable to record lost event.", new Object[0]);
        }
    }

    @Override // w60.a
    public Object get() {
        Context appContext = (Context) ((b5.f) this.f67327a).f17550a;
        CoroutineContext blockingDispatcher = (CoroutineContext) ((dn.c) this.f67328b).get();
        Intrinsics.g(appContext, "appContext");
        Intrinsics.g(blockingDispatcher, "blockingDispatcher");
        return q.a(en.i.f52836a, new v6(new a00.a(9), 20), k0.a(blockingDispatcher), new ar.c(appContext, 4));
    }

    @Override // io.sentry.clientreport.f
    public void h(d dVar, z2 z2Var) {
        b0 b0VarE;
        w3 w3Var = (w3) this.f67328b;
        if (z2Var == null) {
            return;
        }
        try {
            f3 f3Var = z2Var.f67945a.f66743c;
            if (f3.ClientReport.equals(f3Var)) {
                try {
                    B(z2Var.c(w3Var.getSerializer()));
                } catch (Exception unused) {
                    w3Var.getLogger().g(g3.ERROR, "Unable to restore counts from previous client report.", new Object[0]);
                }
            } else {
                i iVarS = s(f3Var);
                if (iVarS.equals(i.Transaction) && (b0VarE = z2Var.e(w3Var.getSerializer())) != null) {
                    z(dVar.getReason(), i.Span.getCategory(), Long.valueOf(b0VarE.f67474s.size() + 1));
                }
                z(dVar.getReason(), iVarS.getCategory(), 1L);
            }
        } catch (Throwable th2) {
            w3Var.getLogger().d(g3.ERROR, th2, "Unable to record lost envelope item.", new Object[0]);
        }
    }

    @Override // io.sentry.clientreport.f
    public void i(d dVar, e3 e3Var) {
        if (e3Var == null) {
            return;
        }
        try {
            Iterator it = ((Iterable) e3Var.f67209c).iterator();
            while (it.hasNext()) {
                h(dVar, (z2) it.next());
            }
        } catch (Throwable th2) {
            ((w3) this.f67328b).getLogger().d(g3.ERROR, th2, "Unable to record lost envelope.", new Object[0]);
        }
    }

    @Override // ni.z
    public void j(String preloadId, v vVar) {
        Intrinsics.g(preloadId, "preloadId");
        ((h) this.f67327a).a((String) this.f67328b);
    }

    @Override // ni.z
    public void k(String preloadId, g0 responseInfo) {
        Object value;
        Intrinsics.g(preloadId, "preloadId");
        Intrinsics.g(responseInfo, "responseInfo");
        h hVar = (h) this.f67327a;
        String adUnitId = (String) this.f67328b;
        hVar.getClass();
        Intrinsics.g(adUnitId, "adUnitId");
        i2 i2Var = hVar.f56166a.f56171d;
        do {
            value = i2Var.getValue();
        } while (!i2Var.i(value, n.c0((Set) value, adUnitId)));
    }

    @Override // io.sentry.clientreport.f
    public e3 l(e3 e3Var) {
        w3 w3Var = (w3) this.f67328b;
        Date dateV = android.support.v4.media.session.b.V();
        gu.j jVar = (gu.j) this.f67327a;
        jVar.getClass();
        ArrayList arrayList = new ArrayList();
        for (Map.Entry entry : ((Map) ((io.sentry.util.c) jVar.f57836b).a()).entrySet()) {
            long andSet = ((AtomicLong) entry.getValue()).getAndSet(0L);
            Long lValueOf = Long.valueOf(andSet);
            if (andSet > 0) {
                arrayList.add(new io.sentry.clientreport.e(((io.sentry.clientreport.c) entry.getKey()).f67172a, ((io.sentry.clientreport.c) entry.getKey()).f67173b, lValueOf));
            }
        }
        io.sentry.clientreport.b bVar = arrayList.isEmpty() ? null : new io.sentry.clientreport.b(dateV, arrayList);
        if (bVar == null) {
            return e3Var;
        }
        try {
            w3Var.getLogger().g(g3.DEBUG, "Attaching client report to envelope.", new Object[0]);
            ArrayList arrayList2 = new ArrayList();
            Iterator it = ((Iterable) e3Var.f67209c).iterator();
            while (it.hasNext()) {
                arrayList2.add((z2) it.next());
            }
            arrayList2.add(z2.a(w3Var.getSerializer(), bVar));
            return new e3((w2) e3Var.f67208b, arrayList2);
        } catch (Throwable th2) {
            w3Var.getLogger().d(g3.ERROR, th2, "Unable to attach client report to envelope.", new Object[0]);
            return e3Var;
        }
    }

    @Override // r3.s
    public int m(int i5) {
        ArrayList arrayList = (ArrayList) this.f67328b;
        int i11 = 0;
        if (!arrayList.isEmpty()) {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                if (((Number) it.next()).intValue() < i5 && (i11 = i11 + 1) < 0) {
                    ul.b.d0();
                    throw null;
                }
            }
        }
        return i5 - i11;
    }

    public void n(c60.d dVar) {
        ((ConcurrentHashMap) this.f67327a).put(((g60.a) this.f67328b).g(dVar), dVar);
    }

    @Override // r3.s
    public int o(int i5) {
        return ((Number) ((ArrayList) this.f67327a).get(i5)).intValue();
    }

    @Override // x80.j
    public void onFailure(x80.i iVar, IOException iOException) {
        try {
            ((g) this.f67327a).e((y) this.f67328b, iOException);
        } catch (Throwable th2) {
            eb0.w0.s(th2);
            th2.printStackTrace();
        }
    }

    @Override // x80.j
    public void onResponse(x80.i iVar, x80.m0 m0Var) {
        g gVar = (g) this.f67327a;
        y yVar = (y) this.f67328b;
        try {
            try {
                gVar.a(yVar, yVar.d(m0Var));
            } catch (Throwable th2) {
                eb0.w0.s(th2);
                th2.printStackTrace();
            }
        } catch (Throwable th3) {
            eb0.w0.s(th3);
            try {
                gVar.e(yVar, th3);
            } catch (Throwable th4) {
                eb0.w0.s(th4);
                th4.printStackTrace();
            }
        }
    }

    public dy.b p() {
        dy.b bVar;
        synchronized (((c) this.f67328b)) {
            ag agVar = (ag) this.f67327a;
            bVar = (dy.b) agVar.f32386b;
            if (bVar != null) {
                agVar.f32386b = bVar.f49832f;
                agVar.f32385a--;
            } else {
                bVar = new dy.b();
                bVar.f49831e = new AtomicBoolean(false);
            }
            bVar.f49832f = null;
            bVar.f49833g = false;
        }
        return bVar;
    }

    public DisabledSegmentSeekBar q() {
        View view = (View) this.f67327a;
        if (view instanceof DisabledSegmentSeekBar) {
            return (DisabledSegmentSeekBar) view;
        }
        return null;
    }

    public SeekBar r() {
        View view = (View) this.f67327a;
        if (view instanceof SeekBar) {
            return (SeekBar) view;
        }
        return null;
    }

    public File u() {
        if (((File) this.f67327a) == null) {
            this.f67327a = new File(((Context) this.f67328b).getCacheDir(), "volley");
        }
        return (File) this.f67327a;
    }

    public byte[] v() {
        Callable callable;
        if (((byte[]) this.f67327a) == null && (callable = (Callable) this.f67328b) != null) {
            this.f67327a = (byte[]) callable.call();
        }
        byte[] bArr = (byte[]) this.f67327a;
        return bArr != null ? bArr : new byte[0];
    }

    public t w() {
        return (m) this.f67327a;
    }

    public int x() {
        SeekBar seekBarR = r();
        if (seekBarR != null) {
            return seekBarR.getProgress();
        }
        DisabledSegmentSeekBar disabledSegmentSeekBarQ = q();
        Intrinsics.d(disabledSegmentSeekBarQ);
        return disabledSegmentSeekBarQ.f();
    }

    /* JADX WARN: Code restructure failed: missing block: B:145:0x0209, code lost:
    
        continue;
     */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0110 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0109 A[Catch: IOException -> 0x0091, XmlPullParserException -> 0x0094, TryCatch #2 {IOException -> 0x0091, XmlPullParserException -> 0x0094, blocks: (B:20:0x0062, B:97:0x0209, B:28:0x0074, B:29:0x0082, B:31:0x0087, B:38:0x0097, B:46:0x00b1, B:41:0x00a0, B:44:0x00a9, B:47:0x00bf, B:51:0x00ce, B:53:0x00d6, B:54:0x00e0, B:63:0x0109, B:64:0x0110, B:65:0x0128, B:57:0x00e9, B:59:0x00f1, B:60:0x00ff, B:66:0x0129, B:68:0x0131, B:69:0x013f, B:72:0x0149, B:73:0x0154, B:74:0x016c, B:75:0x016d, B:78:0x0177, B:79:0x0182, B:80:0x019a, B:81:0x019b, B:83:0x01a3, B:84:0x01ac, B:87:0x01b6, B:88:0x01c0, B:89:0x01d8, B:90:0x01d9, B:93:0x01e3, B:94:0x01ed, B:95:0x0205, B:96:0x0206), top: B:105:0x0062 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void y(Context context, XmlResourceParser xmlResourceParser) throws XmlPullParserException, NumberFormatException, IOException {
        int eventType;
        j4.h hVarD;
        j4.m mVar = new j4.m();
        int attributeCount = xmlResourceParser.getAttributeCount();
        for (int i5 = 0; i5 < attributeCount; i5++) {
            String attributeName = xmlResourceParser.getAttributeName(i5);
            String attributeValue = xmlResourceParser.getAttributeValue(i5);
            if (attributeName != null && attributeValue != null && "id".equals(attributeName)) {
                int identifier = attributeValue.contains("/") ? context.getResources().getIdentifier(attributeValue.substring(attributeValue.indexOf(47) + 1), "id", context.getPackageName()) : -1;
                if (identifier == -1) {
                    if (attributeValue.length() > 1) {
                        identifier = Integer.parseInt(attributeValue.substring(1));
                    } else {
                        Log.e("ConstraintLayoutStates", "error in parsing id");
                    }
                }
                try {
                    eventType = xmlResourceParser.getEventType();
                    hVarD = null;
                } catch (IOException e3) {
                    Log.e("ConstraintSet", "Error parsing XML resource", e3);
                } catch (XmlPullParserException e11) {
                    Log.e("ConstraintSet", "Error parsing XML resource", e11);
                }
                while (eventType != 1) {
                    if (eventType == 0) {
                        xmlResourceParser.getName();
                    } else if (eventType == 2) {
                        String name = xmlResourceParser.getName();
                        switch (name.hashCode()) {
                            case -2025855158:
                                if (name.equals("Layout")) {
                                    if (hVarD == null) {
                                        throw new RuntimeException("XML parser error must be within a Constraint " + xmlResourceParser.getLineNumber());
                                    }
                                    hVarD.f68973d.a(context, Xml.asAttributeSet(xmlResourceParser));
                                    break;
                                } else {
                                    continue;
                                }
                            case -1984451626:
                                if (name.equals("Motion")) {
                                    if (hVarD == null) {
                                        throw new RuntimeException("XML parser error must be within a Constraint " + xmlResourceParser.getLineNumber());
                                    }
                                    hVarD.f68972c.a(context, Xml.asAttributeSet(xmlResourceParser));
                                    break;
                                } else {
                                    continue;
                                }
                            case -1962203927:
                                if (name.equals("ConstraintOverride")) {
                                    hVarD = j4.m.d(context, Xml.asAttributeSet(xmlResourceParser), true);
                                    break;
                                } else {
                                    break;
                                }
                            case -1269513683:
                                if (name.equals("PropertySet")) {
                                    if (hVarD == null) {
                                        throw new RuntimeException("XML parser error must be within a Constraint " + xmlResourceParser.getLineNumber());
                                    }
                                    hVarD.f68971b.a(context, Xml.asAttributeSet(xmlResourceParser));
                                    break;
                                } else {
                                    continue;
                                }
                            case -1238332596:
                                if (name.equals("Transform")) {
                                    if (hVarD == null) {
                                        throw new RuntimeException("XML parser error must be within a Constraint " + xmlResourceParser.getLineNumber());
                                    }
                                    hVarD.f68974e.a(context, Xml.asAttributeSet(xmlResourceParser));
                                    break;
                                } else {
                                    continue;
                                }
                            case -71750448:
                                if (name.equals("Guideline")) {
                                    hVarD = j4.m.d(context, Xml.asAttributeSet(xmlResourceParser), false);
                                    hVarD.f68973d.f68977a = true;
                                    break;
                                } else {
                                    break;
                                }
                            case 366511058:
                                if (name.equals("CustomMethod")) {
                                    if (hVarD != null) {
                                        throw new RuntimeException("XML parser error must be within a Constraint " + xmlResourceParser.getLineNumber());
                                    }
                                    j4.b.a(context, xmlResourceParser, hVarD.f68975f);
                                    break;
                                } else {
                                    continue;
                                }
                            case 1331510167:
                                if (name.equals("Barrier")) {
                                    hVarD = j4.m.d(context, Xml.asAttributeSet(xmlResourceParser), false);
                                    hVarD.f68973d.f68992h0 = 1;
                                    break;
                                } else {
                                    break;
                                }
                            case 1791837707:
                                if (!name.equals("CustomAttribute")) {
                                    continue;
                                } else if (hVarD != null) {
                                }
                                break;
                            case 1803088381:
                                if (name.equals("Constraint")) {
                                    hVarD = j4.m.d(context, Xml.asAttributeSet(xmlResourceParser), false);
                                    break;
                                } else {
                                    break;
                                }
                        }
                    } else if (eventType == 3) {
                        String lowerCase = xmlResourceParser.getName().toLowerCase(Locale.ROOT);
                        switch (lowerCase.hashCode()) {
                            case -2075718416:
                                if (lowerCase.equals("guideline")) {
                                    mVar.f69048c.put(Integer.valueOf(hVarD.f68970a), hVarD);
                                    hVarD = null;
                                    break;
                                } else {
                                    break;
                                }
                            case -190376483:
                                if (lowerCase.equals("constraint")) {
                                    mVar.f69048c.put(Integer.valueOf(hVarD.f68970a), hVarD);
                                    hVarD = null;
                                    break;
                                } else {
                                    break;
                                }
                            case 426575017:
                                if (lowerCase.equals("constraintoverride")) {
                                    mVar.f69048c.put(Integer.valueOf(hVarD.f68970a), hVarD);
                                    hVarD = null;
                                    break;
                                } else {
                                    break;
                                }
                            case 2146106725:
                                if (lowerCase.equals("constraintset")) {
                                    ((SparseArray) this.f67328b).put(identifier, mVar);
                                    return;
                                }
                                break;
                        }
                    }
                    eventType = xmlResourceParser.next();
                }
                ((SparseArray) this.f67328b).put(identifier, mVar);
                return;
            }
        }
    }

    public void z(String str, String str2, Long l9) {
        AtomicLong atomicLong = (AtomicLong) ((Map) ((io.sentry.util.c) ((gu.j) this.f67327a).f57836b).a()).get(new io.sentry.clientreport.c(str, str2));
        if (atomicLong != null) {
            atomicLong.addAndGet(l9.longValue());
        }
    }

    public /* synthetic */ c(Object obj, Object obj2) {
        this.f67327a = obj;
        this.f67328b = obj2;
    }

    public r33 a() {
        return new r33((List) this.f67327a, (List) this.f67328b);
    }

    @Override // b.f0
    public Object b(Continuation continuation) {
        if (!((AtomicBoolean) this.f67328b).getAndSet(true)) {
            ql1 ql1Var = ((xj) this.f67327a).f11732a;
            ql1Var.f8726c = ql1Var.f8725b.decrementAndGet();
        }
        return Unit.f71706a;
    }

    public c(w3 w3Var) {
        this.f67328b = w3Var;
        this.f67327a = new gu.j(24, (byte) 0);
    }

    /* renamed from: a, reason: collision with other method in class */
    public ThreadPoolExecutor m343a() {
        return (ThreadPoolExecutor) this.f67327a;
    }

    public c(g60.a aVar) {
        this.f67327a = new ConcurrentHashMap();
        this.f67328b = aVar;
    }

    public c(int i5, int i11) {
        this.f67327a = d0.q(i5);
        this.f67328b = d0.q(i11);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public c(int i5) {
        this(new fl.l(22), new long[10]);
        switch (i5) {
            case 10:
                this.f67327a = new Rect();
                this.f67328b = new Rect();
                break;
            case 19:
                this.f67327a = new hq.s();
                this.f67328b = ps.v.y(Boolean.FALSE);
                break;
            case 28:
                break;
            default:
                this.f67327a = new AtomicReference(z0.f20092b);
                this.f67328b = new mg.l(11, false);
                break;
        }
    }

    public c(e3 e3Var) {
        this(28);
        t(this, e3Var);
    }
}
