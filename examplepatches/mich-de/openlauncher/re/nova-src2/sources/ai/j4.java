package ai;

import android.app.BroadcastOptions;
import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.os.PersistableBundle;
import android.os.SystemClock;
import android.os.UserHandle;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import b.kc;
import com.amplitude.android.TrackingOptions;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.events.Identify;
import com.amplitude.core.events.Plan;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.gms.internal.measurement.a9;
import com.google.android.gms.internal.measurement.b9;
import com.google.android.gms.internal.measurement.ba;
import com.google.android.gms.internal.measurement.ca;
import com.google.android.gms.internal.measurement.ea;
import com.google.android.gms.internal.measurement.fa;
import com.google.android.gms.internal.measurement.g9;
import com.google.android.gms.internal.measurement.ha;
import com.google.android.gms.internal.measurement.ia;
import com.google.android.gms.internal.measurement.ja;
import com.google.android.gms.internal.measurement.ka;
import com.google.android.gms.internal.measurement.m9;
import com.google.android.gms.internal.measurement.p9;
import com.google.android.gms.internal.measurement.r9;
import com.google.android.gms.internal.measurement.ra;
import com.google.android.gms.internal.measurement.s9;
import com.google.android.gms.internal.measurement.sa;
import com.google.android.gms.internal.measurement.ta;
import com.google.android.gms.internal.measurement.v9;
import com.google.android.gms.internal.measurement.w9;
import com.google.android.gms.internal.measurement.x9;
import com.google.android.gms.internal.measurement.y6;
import com.google.android.gms.internal.measurement.y8;
import com.google.android.gms.internal.measurement.y9;
import com.google.android.gms.internal.measurement.z4;
import com.google.android.gms.internal.measurement.z8;
import com.google.android.gms.internal.measurement.zzaeh;
import com.google.android.gms.measurement.internal.zzah;
import com.google.android.gms.measurement.internal.zzbf;
import com.google.android.gms.measurement.internal.zzbh;
import com.google.android.gms.measurement.internal.zzoh;
import com.google.android.gms.measurement.internal.zzoo;
import com.google.android.gms.measurement.internal.zzpl;
import com.google.android.gms.measurement.internal.zzr;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigInteger;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.nio.channels.OverlappingFileLockException;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.TreeSet;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.zip.GZIPInputStream;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class j4 implements w1 {
    public static volatile j4 K;
    public final HashMap B;
    public final HashMap C;
    public final HashMap D;
    public b3 F;
    public String G;
    public v3 H;
    public long I;

    /* renamed from: a, reason: collision with root package name */
    public final g1 f13039a;

    /* renamed from: b, reason: collision with root package name */
    public final s0 f13040b;

    /* renamed from: c, reason: collision with root package name */
    public l f13041c;

    /* renamed from: d, reason: collision with root package name */
    public u0 f13042d;

    /* renamed from: e, reason: collision with root package name */
    public b4 f13043e;

    /* renamed from: f, reason: collision with root package name */
    public c f13044f;

    /* renamed from: g, reason: collision with root package name */
    public final m4 f13045g;

    /* renamed from: h, reason: collision with root package name */
    public s0 f13046h;

    /* renamed from: i, reason: collision with root package name */
    public r3 f13047i;

    /* renamed from: k, reason: collision with root package name */
    public b1 f13049k;

    /* renamed from: l, reason: collision with root package name */
    public final m1 f13050l;
    public boolean n;
    public long o;

    /* renamed from: p, reason: collision with root package name */
    public ArrayList f13052p;

    /* renamed from: r, reason: collision with root package name */
    public int f13054r;

    /* renamed from: s, reason: collision with root package name */
    public int f13055s;

    /* renamed from: t, reason: collision with root package name */
    public boolean f13056t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f13057u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f13058v;

    /* renamed from: w, reason: collision with root package name */
    public FileLock f13059w;

    /* renamed from: x, reason: collision with root package name */
    public FileChannel f13060x;

    /* renamed from: y, reason: collision with root package name */
    public ArrayList f13061y;

    /* renamed from: z, reason: collision with root package name */
    public ArrayList f13062z;

    /* renamed from: m, reason: collision with root package name */
    public final AtomicBoolean f13051m = new AtomicBoolean(false);

    /* renamed from: q, reason: collision with root package name */
    public final LinkedList f13053q = new LinkedList();
    public final HashMap E = new HashMap();
    public final g4 J = new g4(this);
    public long A = -1;

    /* renamed from: j, reason: collision with root package name */
    public final f4 f13048j = new f4(this);

    public j4(k4 k4Var) {
        this.f13050l = m1.r(k4Var.f13083a, null, null, null);
        m4 m4Var = new m4(this);
        m4Var.F();
        this.f13045g = m4Var;
        s0 s0Var = new s0(this, 0);
        s0Var.F();
        this.f13040b = s0Var;
        g1 g1Var = new g1(this);
        g1Var.F();
        this.f13039a = g1Var;
        this.B = new HashMap();
        this.C = new HashMap();
        this.D = new HashMap();
        c().M(new h(this, k4Var));
    }

    public static j4 C(Context context) {
        sg.w.h(context);
        sg.w.h(context.getApplicationContext());
        if (K == null) {
            synchronized (j4.class) {
                try {
                    if (K == null) {
                        K = new j4(new k4(context, 0));
                    }
                } finally {
                }
            }
        }
        return K;
    }

    public static final void D(ba baVar, int i5, String str) {
        List listI = baVar.i();
        for (int i11 = 0; i11 < listI.size(); i11++) {
            if ("_err".equals(((fa) listI.get(i11)).y())) {
                return;
            }
        }
        ea eaVarJ = fa.J();
        eaVarJ.i("_err");
        eaVarJ.k(i5);
        fa faVar = (fa) eaVarJ.f();
        ea eaVarJ2 = fa.J();
        eaVarJ2.i("_ev");
        eaVarJ2.j(str);
        fa faVar2 = (fa) eaVarJ2.f();
        baVar.m(faVar);
        baVar.m(faVar2);
    }

    public static final void E(ba baVar, String str) {
        List listI = baVar.i();
        for (int i5 = 0; i5 < listI.size(); i5++) {
            if (str.equals(((fa) listI.get(i5)).y())) {
                baVar.o(i5);
                return;
            }
        }
    }

    public static final boolean S(zzr zzrVar) {
        return !TextUtils.isEmpty(zzrVar.f33793g);
    }

    public static final void T(d4 d4Var) {
        if (d4Var == null) {
            throw new IllegalStateException("Upload Component not created");
        }
        if (!d4Var.f12895c) {
            throw new IllegalStateException("Component not initialized: ".concat(String.valueOf(d4Var.getClass())));
        }
    }

    public static final Boolean U(zzr zzrVar) {
        Boolean bool = zzrVar.f33805u;
        String str = zzrVar.H;
        if (!TextUtils.isEmpty(str)) {
            int iOrdinal = ((x1) a5.d.O(str).f267b).ordinal();
            if (iOrdinal == 0 || iOrdinal == 1) {
                return null;
            }
            if (iOrdinal == 2) {
                return Boolean.TRUE;
            }
            if (iOrdinal == 3) {
                return Boolean.FALSE;
            }
        }
        return bool;
    }

    public final void A(t0 t0Var) throws MalformedURLException {
        z.e eVar;
        z.e eVar2;
        c().D();
        if (TextUtils.isEmpty(t0Var.H())) {
            String strE = t0Var.E();
            sg.w.h(strE);
            B(strE, Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, null, null, null);
            return;
        }
        String strE2 = t0Var.E();
        sg.w.h(strE2);
        b().n.b(strE2, "Fetching remote configuration");
        g1 g1Var = this.f13039a;
        T(g1Var);
        g9 g9VarP = g1Var.P(strE2);
        T(g1Var);
        g1Var.D();
        String str = (String) g1Var.n.get(strE2);
        if (g9VarP != null) {
            if (TextUtils.isEmpty(str)) {
                eVar2 = null;
            } else {
                eVar2 = new z.e(0);
                eVar2.put("If-Modified-Since", str);
            }
            T(g1Var);
            g1Var.D();
            String str2 = (String) g1Var.o.get(strE2);
            if (!TextUtils.isEmpty(str2)) {
                if (eVar2 == null) {
                    eVar2 = new z.e(0);
                }
                eVar2.put("If-None-Match", str2);
            }
            eVar = eVar2;
        } else {
            eVar = null;
        }
        this.f13056t = true;
        s0 s0Var = this.f13040b;
        T(s0Var);
        g4 g4Var = new g4(this);
        m1 m1Var = (m1) s0Var.f13368a;
        s0Var.D();
        s0Var.E();
        f4 f4Var = s0Var.f12889b.f13048j;
        Uri.Builder builder = new Uri.Builder();
        Uri.Builder builderAppendQueryParameter = builder.scheme((String) x.f13415f.a(null)).encodedAuthority((String) x.f13418g.a(null)).path("config/app/".concat(String.valueOf(t0Var.H()))).appendQueryParameter(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "android");
        ((m1) f4Var.f13368a).f13136d.J();
        builderAppendQueryParameter.appendQueryParameter("gmp_version", String.valueOf(161000L)).appendQueryParameter("runtime_version", "0");
        String string = builder.build().toString();
        try {
            URL url = new URI(string).toURL();
            k1 k1Var = m1Var.f13139g;
            m1.l(k1Var);
            k1Var.P(new r0(s0Var, t0Var.E(), url, (byte[]) null, eVar, g4Var));
        } catch (IllegalArgumentException | MalformedURLException | URISyntaxException unused) {
            o0 o0Var = m1Var.f13138f;
            m1.l(o0Var);
            o0Var.f13190f.c(o0.L(t0Var.E()), "Failed to parse config URL. Not fetching. appId", string);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0174 A[Catch: all -> 0x0074, TryCatch #0 {all -> 0x0074, blocks: (B:11:0x0045, B:21:0x0063, B:58:0x0177, B:29:0x0080, B:34:0x00dc, B:33:0x00ca, B:35:0x00e1, B:39:0x00f8, B:43:0x010e, B:45:0x0126, B:47:0x0141, B:49:0x014a, B:51:0x0150, B:52:0x0154, B:54:0x015d, B:56:0x016c, B:57:0x0174, B:46:0x0132, B:40:0x00ff, B:42:0x0108), top: B:66:0x0045, outer: #1 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void B(String str, int i5, Throwable th2, byte[] bArr, Map map) {
        boolean z11;
        s0 s0Var = this.f13040b;
        c().D();
        l0();
        sg.w.e(str);
        if (bArr == null) {
            try {
                bArr = new byte[0];
            } catch (Throwable th3) {
                this.f13056t = false;
                O();
                throw th3;
            }
        }
        m0 m0Var = b().n;
        Integer numValueOf = Integer.valueOf(bArr.length);
        m0Var.b(numValueOf, "onConfigFetched. Response size");
        if (e0().O(null, x.f13414e1)) {
            m4 m4Var = this.f13045g;
            T(m4Var);
            m4Var.J(map);
        }
        l lVar = this.f13041c;
        T(lVar);
        lVar.r0();
        try {
            l lVar2 = this.f13041c;
            T(lVar2);
            t0 t0VarH0 = lVar2.H0(str);
            if (i5 == 200 || i5 == 204) {
                z11 = th2 != null;
            } else {
                if (i5 == 304) {
                    i5 = 304;
                    if (th2 != null) {
                    }
                }
            }
            if (t0VarH0 == null) {
                b().f13193i.b(o0.L(str), "App does not exist in onConfigFetched. appId");
            } else {
                g1 g1Var = this.f13039a;
                if (z11 || i5 == 404) {
                    j0();
                    String strO = m4.O("Last-Modified", map);
                    j0();
                    String strO2 = m4.O("ETag", map);
                    if (i5 == 404 || i5 == 304) {
                        T(g1Var);
                        if (g1Var.P(str) == null) {
                            T(g1Var);
                            g1Var.R(str, null, null, null);
                        }
                    } else {
                        T(g1Var);
                        g1Var.R(str, strO, strO2, bArr);
                    }
                    e().getClass();
                    t0VarH0.f(System.currentTimeMillis());
                    l lVar3 = this.f13041c;
                    T(lVar3);
                    lVar3.I0(t0VarH0, false);
                    if (i5 == 404) {
                        b().f13195k.b(str, "Config not found. Using empty config. appId");
                    } else {
                        b().n.c(Integer.valueOf(i5), "Successfully fetched config. Got network response. code, size", numValueOf);
                    }
                    T(s0Var);
                    if (s0Var.H() && M()) {
                        q();
                    } else {
                        T(s0Var);
                        if (s0Var.H()) {
                            l lVar4 = this.f13041c;
                            T(lVar4);
                            if (lVar4.J(t0VarH0.E())) {
                                t(t0VarH0.E());
                            } else {
                                N();
                            }
                        }
                    }
                } else {
                    e().getClass();
                    t0VarH0.g(System.currentTimeMillis());
                    l lVar5 = this.f13041c;
                    T(lVar5);
                    lVar5.I0(t0VarH0, false);
                    b().n.c(Integer.valueOf(i5), "Fetching config failed. code, error", th2);
                    T(g1Var);
                    g1Var.D();
                    g1Var.n.put(str, null);
                    w0 w0Var = this.f13047i.f13287i;
                    e().getClass();
                    w0Var.g(System.currentTimeMillis());
                    if (i5 == 503 || i5 == 429) {
                        w0 w0Var2 = this.f13047i.f13285g;
                        e().getClass();
                        w0Var2.g(System.currentTimeMillis());
                    }
                    N();
                }
            }
            l lVar6 = this.f13041c;
            T(lVar6);
            lVar6.s0();
            this.f13056t = false;
            O();
        } finally {
            l lVar7 = this.f13041c;
            T(lVar7);
            lVar7.t0();
        }
    }

    public final int F(String str, a5.d dVar) {
        x1 x1VarH;
        g1 g1Var = this.f13039a;
        b9 b9VarZ = g1Var.Z(str);
        z1 z1Var = z1.AD_PERSONALIZATION;
        if (b9VarZ == null) {
            dVar.Q(z1Var, f.FAILSAFE);
            return 1;
        }
        l lVar = this.f13041c;
        T(lVar);
        t0 t0VarH0 = lVar.H0(str);
        if (t0VarH0 == null || ((x1) a5.d.O(t0VarH0.s()).f267b) != x1.POLICY || (x1VarH = g1Var.H(str, z1Var)) == x1.UNINITIALIZED) {
            dVar.Q(z1Var, f.REMOTE_DEFAULT);
            if (g1Var.Y(str, z1Var)) {
                return 0;
            }
        } else {
            dVar.Q(z1Var, f.REMOTE_ENFORCED_DEFAULT);
            if (x1VarH == x1.GRANTED) {
                return 0;
            }
        }
        return 1;
    }

    public final HashMap G(ca caVar) {
        Serializable serializableV;
        HashMap map = new HashMap();
        j0();
        HashMap map2 = new HashMap();
        for (fa faVar : caVar.z()) {
            if (faVar.y().startsWith("gad_") && (serializableV = m4.V(faVar)) != null) {
                map2.put(faVar.y(), serializableV);
            }
        }
        for (Map.Entry entry : map2.entrySet()) {
            map.put((String) entry.getKey(), String.valueOf(entry.getValue()));
        }
        return map;
    }

    public final void H() {
        c().D();
        if (this.f13053q.isEmpty()) {
            return;
        }
        if (this.H == null) {
            this.H = new v3(this, this.f13050l, 2);
        }
        if (this.H.f13128c != 0) {
            return;
        }
        e().getClass();
        long jMax = Math.max(0L, ((Integer) x.A0.a(null)).intValue() - (SystemClock.elapsedRealtime() - this.I));
        b().n.b(Long.valueOf(jMax), "Scheduling notify next app runnable, delay in ms");
        if (this.H == null) {
            this.H = new v3(this, this.f13050l, 2);
        }
        this.H.b(jMax);
    }

    /* JADX WARN: Removed duplicated region for block: B:138:0x049b A[Catch: all -> 0x0125, TryCatch #0 {all -> 0x0125, blocks: (B:3:0x0019, B:5:0x0035, B:8:0x003e, B:9:0x005e, B:12:0x007a, B:15:0x00a6, B:17:0x00e5, B:20:0x00fe, B:22:0x0108, B:228:0x0750, B:26:0x0135, B:29:0x014b, B:31:0x0151, B:33:0x0157, B:35:0x016a, B:39:0x0177, B:41:0x0182, B:43:0x0190, B:45:0x0196, B:49:0x01a1, B:50:0x01af, B:52:0x01c1, B:55:0x01e1, B:57:0x01e7, B:59:0x01f7, B:61:0x0205, B:63:0x0215, B:64:0x0220, B:65:0x0223, B:67:0x0230, B:69:0x023a, B:70:0x024a, B:72:0x0269, B:74:0x0273, B:76:0x0289, B:77:0x0293, B:80:0x029e, B:81:0x02a8, B:84:0x02b0, B:87:0x02c1, B:88:0x02c4, B:90:0x02db, B:141:0x04d5, B:142:0x04d8, B:144:0x04e4, B:147:0x04f5, B:149:0x0506, B:151:0x0512, B:184:0x05dd, B:186:0x05ea, B:188:0x05f0, B:190:0x05f6, B:192:0x0606, B:193:0x0609, B:194:0x0615, B:196:0x061b, B:197:0x0627, B:199:0x062d, B:201:0x063d, B:203:0x0647, B:204:0x065c, B:206:0x0662, B:207:0x067d, B:209:0x0683, B:210:0x06a1, B:211:0x06ae, B:215:0x06d7, B:212:0x06b4, B:214:0x06c2, B:216:0x06df, B:217:0x06fe, B:219:0x0704, B:221:0x0717, B:222:0x0724, B:223:0x0728, B:225:0x072e, B:227:0x073c, B:155:0x0535, B:157:0x0545, B:160:0x0558, B:162:0x056a, B:164:0x0576, B:167:0x058a, B:170:0x0598, B:172:0x05a2, B:174:0x05ac, B:177:0x05b7, B:179:0x05bd, B:181:0x05cd, B:182:0x05d8, B:98:0x0301, B:101:0x030b, B:103:0x0319, B:107:0x036a, B:104:0x033b, B:106:0x0349, B:110:0x0371, B:113:0x03a4, B:114:0x03cc, B:116:0x0401, B:118:0x0407, B:121:0x0413, B:123:0x0448, B:124:0x0465, B:126:0x046b, B:128:0x0479, B:132:0x048d, B:129:0x0481, B:135:0x0494, B:138:0x049b, B:139:0x04ba, B:231:0x0767, B:233:0x0779, B:235:0x0782, B:246:0x07b4, B:236:0x078a, B:238:0x0793, B:240:0x0799, B:243:0x07a5, B:245:0x07af, B:247:0x07b7, B:248:0x07c3, B:251:0x07cb, B:253:0x07dd, B:254:0x07e8, B:256:0x07f0, B:260:0x081f, B:262:0x083b, B:264:0x0850, B:266:0x086c, B:268:0x0881, B:269:0x089d, B:271:0x08a3, B:273:0x08bb, B:274:0x08c9, B:276:0x08d9, B:277:0x08e7, B:278:0x08ea, B:280:0x0934, B:282:0x093a, B:288:0x0965, B:290:0x096d, B:291:0x098b, B:293:0x0991, B:294:0x09a5, B:296:0x09bc, B:298:0x09d6, B:300:0x09e8, B:302:0x09f2, B:303:0x09f5, B:305:0x0a50, B:306:0x0a63, B:309:0x0a6b, B:312:0x0a8a, B:314:0x0aa3, B:316:0x0ab8, B:318:0x0abd, B:320:0x0ac1, B:322:0x0ac5, B:324:0x0acf, B:326:0x0ad8, B:328:0x0adc, B:330:0x0ae2, B:332:0x0aed, B:334:0x0afb, B:401:0x0d5c, B:336:0x0b03, B:338:0x0b1f, B:343:0x0b3c, B:345:0x0b5c, B:346:0x0b64, B:348:0x0b6a, B:350:0x0b7c, B:356:0x0b92, B:358:0x0ba8, B:359:0x0bcb, B:361:0x0bd7, B:363:0x0bed, B:364:0x0c2d, B:370:0x0c49, B:372:0x0c54, B:374:0x0c58, B:376:0x0c5c, B:378:0x0c60, B:379:0x0c6c, B:380:0x0c71, B:382:0x0c77, B:384:0x0c8d, B:385:0x0c92, B:400:0x0d59, B:387:0x0cd1, B:389:0x0cd5, B:393:0x0ce9, B:395:0x0d05, B:396:0x0d0c, B:399:0x0d4d, B:390:0x0cda, B:341:0x0b25, B:402:0x0d62, B:404:0x0d6c, B:405:0x0d80, B:406:0x0d88, B:408:0x0d8e, B:409:0x0da2, B:411:0x0db4, B:431:0x0e67, B:433:0x0e6d, B:435:0x0e84, B:438:0x0e8f, B:440:0x0e99, B:442:0x0ec0, B:444:0x0ed0, B:445:0x0ede, B:447:0x0eec, B:448:0x0efa, B:449:0x0f05, B:451:0x0f17, B:454:0x0f1e, B:459:0x0f61, B:455:0x0f2d, B:457:0x0f3b, B:458:0x0f48, B:460:0x0f70, B:461:0x0f83, B:465:0x0fa3, B:464:0x0f8e, B:412:0x0dcf, B:414:0x0dd5, B:416:0x0de7, B:418:0x0dee, B:424:0x0e06, B:426:0x0e0d, B:428:0x0e58, B:430:0x0e5f, B:429:0x0e5c, B:425:0x0e0a, B:417:0x0deb, B:283:0x094a, B:285:0x0950, B:287:0x0956, B:267:0x087e, B:263:0x084d, B:257:0x07f6, B:259:0x07fc, B:466:0x0fac), top: B:472:0x0019, inners: #1, #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:139:0x04ba A[Catch: all -> 0x0125, TryCatch #0 {all -> 0x0125, blocks: (B:3:0x0019, B:5:0x0035, B:8:0x003e, B:9:0x005e, B:12:0x007a, B:15:0x00a6, B:17:0x00e5, B:20:0x00fe, B:22:0x0108, B:228:0x0750, B:26:0x0135, B:29:0x014b, B:31:0x0151, B:33:0x0157, B:35:0x016a, B:39:0x0177, B:41:0x0182, B:43:0x0190, B:45:0x0196, B:49:0x01a1, B:50:0x01af, B:52:0x01c1, B:55:0x01e1, B:57:0x01e7, B:59:0x01f7, B:61:0x0205, B:63:0x0215, B:64:0x0220, B:65:0x0223, B:67:0x0230, B:69:0x023a, B:70:0x024a, B:72:0x0269, B:74:0x0273, B:76:0x0289, B:77:0x0293, B:80:0x029e, B:81:0x02a8, B:84:0x02b0, B:87:0x02c1, B:88:0x02c4, B:90:0x02db, B:141:0x04d5, B:142:0x04d8, B:144:0x04e4, B:147:0x04f5, B:149:0x0506, B:151:0x0512, B:184:0x05dd, B:186:0x05ea, B:188:0x05f0, B:190:0x05f6, B:192:0x0606, B:193:0x0609, B:194:0x0615, B:196:0x061b, B:197:0x0627, B:199:0x062d, B:201:0x063d, B:203:0x0647, B:204:0x065c, B:206:0x0662, B:207:0x067d, B:209:0x0683, B:210:0x06a1, B:211:0x06ae, B:215:0x06d7, B:212:0x06b4, B:214:0x06c2, B:216:0x06df, B:217:0x06fe, B:219:0x0704, B:221:0x0717, B:222:0x0724, B:223:0x0728, B:225:0x072e, B:227:0x073c, B:155:0x0535, B:157:0x0545, B:160:0x0558, B:162:0x056a, B:164:0x0576, B:167:0x058a, B:170:0x0598, B:172:0x05a2, B:174:0x05ac, B:177:0x05b7, B:179:0x05bd, B:181:0x05cd, B:182:0x05d8, B:98:0x0301, B:101:0x030b, B:103:0x0319, B:107:0x036a, B:104:0x033b, B:106:0x0349, B:110:0x0371, B:113:0x03a4, B:114:0x03cc, B:116:0x0401, B:118:0x0407, B:121:0x0413, B:123:0x0448, B:124:0x0465, B:126:0x046b, B:128:0x0479, B:132:0x048d, B:129:0x0481, B:135:0x0494, B:138:0x049b, B:139:0x04ba, B:231:0x0767, B:233:0x0779, B:235:0x0782, B:246:0x07b4, B:236:0x078a, B:238:0x0793, B:240:0x0799, B:243:0x07a5, B:245:0x07af, B:247:0x07b7, B:248:0x07c3, B:251:0x07cb, B:253:0x07dd, B:254:0x07e8, B:256:0x07f0, B:260:0x081f, B:262:0x083b, B:264:0x0850, B:266:0x086c, B:268:0x0881, B:269:0x089d, B:271:0x08a3, B:273:0x08bb, B:274:0x08c9, B:276:0x08d9, B:277:0x08e7, B:278:0x08ea, B:280:0x0934, B:282:0x093a, B:288:0x0965, B:290:0x096d, B:291:0x098b, B:293:0x0991, B:294:0x09a5, B:296:0x09bc, B:298:0x09d6, B:300:0x09e8, B:302:0x09f2, B:303:0x09f5, B:305:0x0a50, B:306:0x0a63, B:309:0x0a6b, B:312:0x0a8a, B:314:0x0aa3, B:316:0x0ab8, B:318:0x0abd, B:320:0x0ac1, B:322:0x0ac5, B:324:0x0acf, B:326:0x0ad8, B:328:0x0adc, B:330:0x0ae2, B:332:0x0aed, B:334:0x0afb, B:401:0x0d5c, B:336:0x0b03, B:338:0x0b1f, B:343:0x0b3c, B:345:0x0b5c, B:346:0x0b64, B:348:0x0b6a, B:350:0x0b7c, B:356:0x0b92, B:358:0x0ba8, B:359:0x0bcb, B:361:0x0bd7, B:363:0x0bed, B:364:0x0c2d, B:370:0x0c49, B:372:0x0c54, B:374:0x0c58, B:376:0x0c5c, B:378:0x0c60, B:379:0x0c6c, B:380:0x0c71, B:382:0x0c77, B:384:0x0c8d, B:385:0x0c92, B:400:0x0d59, B:387:0x0cd1, B:389:0x0cd5, B:393:0x0ce9, B:395:0x0d05, B:396:0x0d0c, B:399:0x0d4d, B:390:0x0cda, B:341:0x0b25, B:402:0x0d62, B:404:0x0d6c, B:405:0x0d80, B:406:0x0d88, B:408:0x0d8e, B:409:0x0da2, B:411:0x0db4, B:431:0x0e67, B:433:0x0e6d, B:435:0x0e84, B:438:0x0e8f, B:440:0x0e99, B:442:0x0ec0, B:444:0x0ed0, B:445:0x0ede, B:447:0x0eec, B:448:0x0efa, B:449:0x0f05, B:451:0x0f17, B:454:0x0f1e, B:459:0x0f61, B:455:0x0f2d, B:457:0x0f3b, B:458:0x0f48, B:460:0x0f70, B:461:0x0f83, B:465:0x0fa3, B:464:0x0f8e, B:412:0x0dcf, B:414:0x0dd5, B:416:0x0de7, B:418:0x0dee, B:424:0x0e06, B:426:0x0e0d, B:428:0x0e58, B:430:0x0e5f, B:429:0x0e5c, B:425:0x0e0a, B:417:0x0deb, B:283:0x094a, B:285:0x0950, B:287:0x0956, B:267:0x087e, B:263:0x084d, B:257:0x07f6, B:259:0x07fc, B:466:0x0fac), top: B:472:0x0019, inners: #1, #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:152:0x0522  */
    /* JADX WARN: Removed duplicated region for block: B:186:0x05ea A[Catch: all -> 0x0125, TryCatch #0 {all -> 0x0125, blocks: (B:3:0x0019, B:5:0x0035, B:8:0x003e, B:9:0x005e, B:12:0x007a, B:15:0x00a6, B:17:0x00e5, B:20:0x00fe, B:22:0x0108, B:228:0x0750, B:26:0x0135, B:29:0x014b, B:31:0x0151, B:33:0x0157, B:35:0x016a, B:39:0x0177, B:41:0x0182, B:43:0x0190, B:45:0x0196, B:49:0x01a1, B:50:0x01af, B:52:0x01c1, B:55:0x01e1, B:57:0x01e7, B:59:0x01f7, B:61:0x0205, B:63:0x0215, B:64:0x0220, B:65:0x0223, B:67:0x0230, B:69:0x023a, B:70:0x024a, B:72:0x0269, B:74:0x0273, B:76:0x0289, B:77:0x0293, B:80:0x029e, B:81:0x02a8, B:84:0x02b0, B:87:0x02c1, B:88:0x02c4, B:90:0x02db, B:141:0x04d5, B:142:0x04d8, B:144:0x04e4, B:147:0x04f5, B:149:0x0506, B:151:0x0512, B:184:0x05dd, B:186:0x05ea, B:188:0x05f0, B:190:0x05f6, B:192:0x0606, B:193:0x0609, B:194:0x0615, B:196:0x061b, B:197:0x0627, B:199:0x062d, B:201:0x063d, B:203:0x0647, B:204:0x065c, B:206:0x0662, B:207:0x067d, B:209:0x0683, B:210:0x06a1, B:211:0x06ae, B:215:0x06d7, B:212:0x06b4, B:214:0x06c2, B:216:0x06df, B:217:0x06fe, B:219:0x0704, B:221:0x0717, B:222:0x0724, B:223:0x0728, B:225:0x072e, B:227:0x073c, B:155:0x0535, B:157:0x0545, B:160:0x0558, B:162:0x056a, B:164:0x0576, B:167:0x058a, B:170:0x0598, B:172:0x05a2, B:174:0x05ac, B:177:0x05b7, B:179:0x05bd, B:181:0x05cd, B:182:0x05d8, B:98:0x0301, B:101:0x030b, B:103:0x0319, B:107:0x036a, B:104:0x033b, B:106:0x0349, B:110:0x0371, B:113:0x03a4, B:114:0x03cc, B:116:0x0401, B:118:0x0407, B:121:0x0413, B:123:0x0448, B:124:0x0465, B:126:0x046b, B:128:0x0479, B:132:0x048d, B:129:0x0481, B:135:0x0494, B:138:0x049b, B:139:0x04ba, B:231:0x0767, B:233:0x0779, B:235:0x0782, B:246:0x07b4, B:236:0x078a, B:238:0x0793, B:240:0x0799, B:243:0x07a5, B:245:0x07af, B:247:0x07b7, B:248:0x07c3, B:251:0x07cb, B:253:0x07dd, B:254:0x07e8, B:256:0x07f0, B:260:0x081f, B:262:0x083b, B:264:0x0850, B:266:0x086c, B:268:0x0881, B:269:0x089d, B:271:0x08a3, B:273:0x08bb, B:274:0x08c9, B:276:0x08d9, B:277:0x08e7, B:278:0x08ea, B:280:0x0934, B:282:0x093a, B:288:0x0965, B:290:0x096d, B:291:0x098b, B:293:0x0991, B:294:0x09a5, B:296:0x09bc, B:298:0x09d6, B:300:0x09e8, B:302:0x09f2, B:303:0x09f5, B:305:0x0a50, B:306:0x0a63, B:309:0x0a6b, B:312:0x0a8a, B:314:0x0aa3, B:316:0x0ab8, B:318:0x0abd, B:320:0x0ac1, B:322:0x0ac5, B:324:0x0acf, B:326:0x0ad8, B:328:0x0adc, B:330:0x0ae2, B:332:0x0aed, B:334:0x0afb, B:401:0x0d5c, B:336:0x0b03, B:338:0x0b1f, B:343:0x0b3c, B:345:0x0b5c, B:346:0x0b64, B:348:0x0b6a, B:350:0x0b7c, B:356:0x0b92, B:358:0x0ba8, B:359:0x0bcb, B:361:0x0bd7, B:363:0x0bed, B:364:0x0c2d, B:370:0x0c49, B:372:0x0c54, B:374:0x0c58, B:376:0x0c5c, B:378:0x0c60, B:379:0x0c6c, B:380:0x0c71, B:382:0x0c77, B:384:0x0c8d, B:385:0x0c92, B:400:0x0d59, B:387:0x0cd1, B:389:0x0cd5, B:393:0x0ce9, B:395:0x0d05, B:396:0x0d0c, B:399:0x0d4d, B:390:0x0cda, B:341:0x0b25, B:402:0x0d62, B:404:0x0d6c, B:405:0x0d80, B:406:0x0d88, B:408:0x0d8e, B:409:0x0da2, B:411:0x0db4, B:431:0x0e67, B:433:0x0e6d, B:435:0x0e84, B:438:0x0e8f, B:440:0x0e99, B:442:0x0ec0, B:444:0x0ed0, B:445:0x0ede, B:447:0x0eec, B:448:0x0efa, B:449:0x0f05, B:451:0x0f17, B:454:0x0f1e, B:459:0x0f61, B:455:0x0f2d, B:457:0x0f3b, B:458:0x0f48, B:460:0x0f70, B:461:0x0f83, B:465:0x0fa3, B:464:0x0f8e, B:412:0x0dcf, B:414:0x0dd5, B:416:0x0de7, B:418:0x0dee, B:424:0x0e06, B:426:0x0e0d, B:428:0x0e58, B:430:0x0e5f, B:429:0x0e5c, B:425:0x0e0a, B:417:0x0deb, B:283:0x094a, B:285:0x0950, B:287:0x0956, B:267:0x087e, B:263:0x084d, B:257:0x07f6, B:259:0x07fc, B:466:0x0fac), top: B:472:0x0019, inners: #1, #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:192:0x0606 A[Catch: all -> 0x0125, TryCatch #0 {all -> 0x0125, blocks: (B:3:0x0019, B:5:0x0035, B:8:0x003e, B:9:0x005e, B:12:0x007a, B:15:0x00a6, B:17:0x00e5, B:20:0x00fe, B:22:0x0108, B:228:0x0750, B:26:0x0135, B:29:0x014b, B:31:0x0151, B:33:0x0157, B:35:0x016a, B:39:0x0177, B:41:0x0182, B:43:0x0190, B:45:0x0196, B:49:0x01a1, B:50:0x01af, B:52:0x01c1, B:55:0x01e1, B:57:0x01e7, B:59:0x01f7, B:61:0x0205, B:63:0x0215, B:64:0x0220, B:65:0x0223, B:67:0x0230, B:69:0x023a, B:70:0x024a, B:72:0x0269, B:74:0x0273, B:76:0x0289, B:77:0x0293, B:80:0x029e, B:81:0x02a8, B:84:0x02b0, B:87:0x02c1, B:88:0x02c4, B:90:0x02db, B:141:0x04d5, B:142:0x04d8, B:144:0x04e4, B:147:0x04f5, B:149:0x0506, B:151:0x0512, B:184:0x05dd, B:186:0x05ea, B:188:0x05f0, B:190:0x05f6, B:192:0x0606, B:193:0x0609, B:194:0x0615, B:196:0x061b, B:197:0x0627, B:199:0x062d, B:201:0x063d, B:203:0x0647, B:204:0x065c, B:206:0x0662, B:207:0x067d, B:209:0x0683, B:210:0x06a1, B:211:0x06ae, B:215:0x06d7, B:212:0x06b4, B:214:0x06c2, B:216:0x06df, B:217:0x06fe, B:219:0x0704, B:221:0x0717, B:222:0x0724, B:223:0x0728, B:225:0x072e, B:227:0x073c, B:155:0x0535, B:157:0x0545, B:160:0x0558, B:162:0x056a, B:164:0x0576, B:167:0x058a, B:170:0x0598, B:172:0x05a2, B:174:0x05ac, B:177:0x05b7, B:179:0x05bd, B:181:0x05cd, B:182:0x05d8, B:98:0x0301, B:101:0x030b, B:103:0x0319, B:107:0x036a, B:104:0x033b, B:106:0x0349, B:110:0x0371, B:113:0x03a4, B:114:0x03cc, B:116:0x0401, B:118:0x0407, B:121:0x0413, B:123:0x0448, B:124:0x0465, B:126:0x046b, B:128:0x0479, B:132:0x048d, B:129:0x0481, B:135:0x0494, B:138:0x049b, B:139:0x04ba, B:231:0x0767, B:233:0x0779, B:235:0x0782, B:246:0x07b4, B:236:0x078a, B:238:0x0793, B:240:0x0799, B:243:0x07a5, B:245:0x07af, B:247:0x07b7, B:248:0x07c3, B:251:0x07cb, B:253:0x07dd, B:254:0x07e8, B:256:0x07f0, B:260:0x081f, B:262:0x083b, B:264:0x0850, B:266:0x086c, B:268:0x0881, B:269:0x089d, B:271:0x08a3, B:273:0x08bb, B:274:0x08c9, B:276:0x08d9, B:277:0x08e7, B:278:0x08ea, B:280:0x0934, B:282:0x093a, B:288:0x0965, B:290:0x096d, B:291:0x098b, B:293:0x0991, B:294:0x09a5, B:296:0x09bc, B:298:0x09d6, B:300:0x09e8, B:302:0x09f2, B:303:0x09f5, B:305:0x0a50, B:306:0x0a63, B:309:0x0a6b, B:312:0x0a8a, B:314:0x0aa3, B:316:0x0ab8, B:318:0x0abd, B:320:0x0ac1, B:322:0x0ac5, B:324:0x0acf, B:326:0x0ad8, B:328:0x0adc, B:330:0x0ae2, B:332:0x0aed, B:334:0x0afb, B:401:0x0d5c, B:336:0x0b03, B:338:0x0b1f, B:343:0x0b3c, B:345:0x0b5c, B:346:0x0b64, B:348:0x0b6a, B:350:0x0b7c, B:356:0x0b92, B:358:0x0ba8, B:359:0x0bcb, B:361:0x0bd7, B:363:0x0bed, B:364:0x0c2d, B:370:0x0c49, B:372:0x0c54, B:374:0x0c58, B:376:0x0c5c, B:378:0x0c60, B:379:0x0c6c, B:380:0x0c71, B:382:0x0c77, B:384:0x0c8d, B:385:0x0c92, B:400:0x0d59, B:387:0x0cd1, B:389:0x0cd5, B:393:0x0ce9, B:395:0x0d05, B:396:0x0d0c, B:399:0x0d4d, B:390:0x0cda, B:341:0x0b25, B:402:0x0d62, B:404:0x0d6c, B:405:0x0d80, B:406:0x0d88, B:408:0x0d8e, B:409:0x0da2, B:411:0x0db4, B:431:0x0e67, B:433:0x0e6d, B:435:0x0e84, B:438:0x0e8f, B:440:0x0e99, B:442:0x0ec0, B:444:0x0ed0, B:445:0x0ede, B:447:0x0eec, B:448:0x0efa, B:449:0x0f05, B:451:0x0f17, B:454:0x0f1e, B:459:0x0f61, B:455:0x0f2d, B:457:0x0f3b, B:458:0x0f48, B:460:0x0f70, B:461:0x0f83, B:465:0x0fa3, B:464:0x0f8e, B:412:0x0dcf, B:414:0x0dd5, B:416:0x0de7, B:418:0x0dee, B:424:0x0e06, B:426:0x0e0d, B:428:0x0e58, B:430:0x0e5f, B:429:0x0e5c, B:425:0x0e0a, B:417:0x0deb, B:283:0x094a, B:285:0x0950, B:287:0x0956, B:267:0x087e, B:263:0x084d, B:257:0x07f6, B:259:0x07fc, B:466:0x0fac), top: B:472:0x0019, inners: #1, #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:196:0x061b A[Catch: all -> 0x0125, TryCatch #0 {all -> 0x0125, blocks: (B:3:0x0019, B:5:0x0035, B:8:0x003e, B:9:0x005e, B:12:0x007a, B:15:0x00a6, B:17:0x00e5, B:20:0x00fe, B:22:0x0108, B:228:0x0750, B:26:0x0135, B:29:0x014b, B:31:0x0151, B:33:0x0157, B:35:0x016a, B:39:0x0177, B:41:0x0182, B:43:0x0190, B:45:0x0196, B:49:0x01a1, B:50:0x01af, B:52:0x01c1, B:55:0x01e1, B:57:0x01e7, B:59:0x01f7, B:61:0x0205, B:63:0x0215, B:64:0x0220, B:65:0x0223, B:67:0x0230, B:69:0x023a, B:70:0x024a, B:72:0x0269, B:74:0x0273, B:76:0x0289, B:77:0x0293, B:80:0x029e, B:81:0x02a8, B:84:0x02b0, B:87:0x02c1, B:88:0x02c4, B:90:0x02db, B:141:0x04d5, B:142:0x04d8, B:144:0x04e4, B:147:0x04f5, B:149:0x0506, B:151:0x0512, B:184:0x05dd, B:186:0x05ea, B:188:0x05f0, B:190:0x05f6, B:192:0x0606, B:193:0x0609, B:194:0x0615, B:196:0x061b, B:197:0x0627, B:199:0x062d, B:201:0x063d, B:203:0x0647, B:204:0x065c, B:206:0x0662, B:207:0x067d, B:209:0x0683, B:210:0x06a1, B:211:0x06ae, B:215:0x06d7, B:212:0x06b4, B:214:0x06c2, B:216:0x06df, B:217:0x06fe, B:219:0x0704, B:221:0x0717, B:222:0x0724, B:223:0x0728, B:225:0x072e, B:227:0x073c, B:155:0x0535, B:157:0x0545, B:160:0x0558, B:162:0x056a, B:164:0x0576, B:167:0x058a, B:170:0x0598, B:172:0x05a2, B:174:0x05ac, B:177:0x05b7, B:179:0x05bd, B:181:0x05cd, B:182:0x05d8, B:98:0x0301, B:101:0x030b, B:103:0x0319, B:107:0x036a, B:104:0x033b, B:106:0x0349, B:110:0x0371, B:113:0x03a4, B:114:0x03cc, B:116:0x0401, B:118:0x0407, B:121:0x0413, B:123:0x0448, B:124:0x0465, B:126:0x046b, B:128:0x0479, B:132:0x048d, B:129:0x0481, B:135:0x0494, B:138:0x049b, B:139:0x04ba, B:231:0x0767, B:233:0x0779, B:235:0x0782, B:246:0x07b4, B:236:0x078a, B:238:0x0793, B:240:0x0799, B:243:0x07a5, B:245:0x07af, B:247:0x07b7, B:248:0x07c3, B:251:0x07cb, B:253:0x07dd, B:254:0x07e8, B:256:0x07f0, B:260:0x081f, B:262:0x083b, B:264:0x0850, B:266:0x086c, B:268:0x0881, B:269:0x089d, B:271:0x08a3, B:273:0x08bb, B:274:0x08c9, B:276:0x08d9, B:277:0x08e7, B:278:0x08ea, B:280:0x0934, B:282:0x093a, B:288:0x0965, B:290:0x096d, B:291:0x098b, B:293:0x0991, B:294:0x09a5, B:296:0x09bc, B:298:0x09d6, B:300:0x09e8, B:302:0x09f2, B:303:0x09f5, B:305:0x0a50, B:306:0x0a63, B:309:0x0a6b, B:312:0x0a8a, B:314:0x0aa3, B:316:0x0ab8, B:318:0x0abd, B:320:0x0ac1, B:322:0x0ac5, B:324:0x0acf, B:326:0x0ad8, B:328:0x0adc, B:330:0x0ae2, B:332:0x0aed, B:334:0x0afb, B:401:0x0d5c, B:336:0x0b03, B:338:0x0b1f, B:343:0x0b3c, B:345:0x0b5c, B:346:0x0b64, B:348:0x0b6a, B:350:0x0b7c, B:356:0x0b92, B:358:0x0ba8, B:359:0x0bcb, B:361:0x0bd7, B:363:0x0bed, B:364:0x0c2d, B:370:0x0c49, B:372:0x0c54, B:374:0x0c58, B:376:0x0c5c, B:378:0x0c60, B:379:0x0c6c, B:380:0x0c71, B:382:0x0c77, B:384:0x0c8d, B:385:0x0c92, B:400:0x0d59, B:387:0x0cd1, B:389:0x0cd5, B:393:0x0ce9, B:395:0x0d05, B:396:0x0d0c, B:399:0x0d4d, B:390:0x0cda, B:341:0x0b25, B:402:0x0d62, B:404:0x0d6c, B:405:0x0d80, B:406:0x0d88, B:408:0x0d8e, B:409:0x0da2, B:411:0x0db4, B:431:0x0e67, B:433:0x0e6d, B:435:0x0e84, B:438:0x0e8f, B:440:0x0e99, B:442:0x0ec0, B:444:0x0ed0, B:445:0x0ede, B:447:0x0eec, B:448:0x0efa, B:449:0x0f05, B:451:0x0f17, B:454:0x0f1e, B:459:0x0f61, B:455:0x0f2d, B:457:0x0f3b, B:458:0x0f48, B:460:0x0f70, B:461:0x0f83, B:465:0x0fa3, B:464:0x0f8e, B:412:0x0dcf, B:414:0x0dd5, B:416:0x0de7, B:418:0x0dee, B:424:0x0e06, B:426:0x0e0d, B:428:0x0e58, B:430:0x0e5f, B:429:0x0e5c, B:425:0x0e0a, B:417:0x0deb, B:283:0x094a, B:285:0x0950, B:287:0x0956, B:267:0x087e, B:263:0x084d, B:257:0x07f6, B:259:0x07fc, B:466:0x0fac), top: B:472:0x0019, inners: #1, #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:226:0x0738  */
    /* JADX WARN: Removed duplicated region for block: B:236:0x078a A[Catch: all -> 0x0125, TryCatch #0 {all -> 0x0125, blocks: (B:3:0x0019, B:5:0x0035, B:8:0x003e, B:9:0x005e, B:12:0x007a, B:15:0x00a6, B:17:0x00e5, B:20:0x00fe, B:22:0x0108, B:228:0x0750, B:26:0x0135, B:29:0x014b, B:31:0x0151, B:33:0x0157, B:35:0x016a, B:39:0x0177, B:41:0x0182, B:43:0x0190, B:45:0x0196, B:49:0x01a1, B:50:0x01af, B:52:0x01c1, B:55:0x01e1, B:57:0x01e7, B:59:0x01f7, B:61:0x0205, B:63:0x0215, B:64:0x0220, B:65:0x0223, B:67:0x0230, B:69:0x023a, B:70:0x024a, B:72:0x0269, B:74:0x0273, B:76:0x0289, B:77:0x0293, B:80:0x029e, B:81:0x02a8, B:84:0x02b0, B:87:0x02c1, B:88:0x02c4, B:90:0x02db, B:141:0x04d5, B:142:0x04d8, B:144:0x04e4, B:147:0x04f5, B:149:0x0506, B:151:0x0512, B:184:0x05dd, B:186:0x05ea, B:188:0x05f0, B:190:0x05f6, B:192:0x0606, B:193:0x0609, B:194:0x0615, B:196:0x061b, B:197:0x0627, B:199:0x062d, B:201:0x063d, B:203:0x0647, B:204:0x065c, B:206:0x0662, B:207:0x067d, B:209:0x0683, B:210:0x06a1, B:211:0x06ae, B:215:0x06d7, B:212:0x06b4, B:214:0x06c2, B:216:0x06df, B:217:0x06fe, B:219:0x0704, B:221:0x0717, B:222:0x0724, B:223:0x0728, B:225:0x072e, B:227:0x073c, B:155:0x0535, B:157:0x0545, B:160:0x0558, B:162:0x056a, B:164:0x0576, B:167:0x058a, B:170:0x0598, B:172:0x05a2, B:174:0x05ac, B:177:0x05b7, B:179:0x05bd, B:181:0x05cd, B:182:0x05d8, B:98:0x0301, B:101:0x030b, B:103:0x0319, B:107:0x036a, B:104:0x033b, B:106:0x0349, B:110:0x0371, B:113:0x03a4, B:114:0x03cc, B:116:0x0401, B:118:0x0407, B:121:0x0413, B:123:0x0448, B:124:0x0465, B:126:0x046b, B:128:0x0479, B:132:0x048d, B:129:0x0481, B:135:0x0494, B:138:0x049b, B:139:0x04ba, B:231:0x0767, B:233:0x0779, B:235:0x0782, B:246:0x07b4, B:236:0x078a, B:238:0x0793, B:240:0x0799, B:243:0x07a5, B:245:0x07af, B:247:0x07b7, B:248:0x07c3, B:251:0x07cb, B:253:0x07dd, B:254:0x07e8, B:256:0x07f0, B:260:0x081f, B:262:0x083b, B:264:0x0850, B:266:0x086c, B:268:0x0881, B:269:0x089d, B:271:0x08a3, B:273:0x08bb, B:274:0x08c9, B:276:0x08d9, B:277:0x08e7, B:278:0x08ea, B:280:0x0934, B:282:0x093a, B:288:0x0965, B:290:0x096d, B:291:0x098b, B:293:0x0991, B:294:0x09a5, B:296:0x09bc, B:298:0x09d6, B:300:0x09e8, B:302:0x09f2, B:303:0x09f5, B:305:0x0a50, B:306:0x0a63, B:309:0x0a6b, B:312:0x0a8a, B:314:0x0aa3, B:316:0x0ab8, B:318:0x0abd, B:320:0x0ac1, B:322:0x0ac5, B:324:0x0acf, B:326:0x0ad8, B:328:0x0adc, B:330:0x0ae2, B:332:0x0aed, B:334:0x0afb, B:401:0x0d5c, B:336:0x0b03, B:338:0x0b1f, B:343:0x0b3c, B:345:0x0b5c, B:346:0x0b64, B:348:0x0b6a, B:350:0x0b7c, B:356:0x0b92, B:358:0x0ba8, B:359:0x0bcb, B:361:0x0bd7, B:363:0x0bed, B:364:0x0c2d, B:370:0x0c49, B:372:0x0c54, B:374:0x0c58, B:376:0x0c5c, B:378:0x0c60, B:379:0x0c6c, B:380:0x0c71, B:382:0x0c77, B:384:0x0c8d, B:385:0x0c92, B:400:0x0d59, B:387:0x0cd1, B:389:0x0cd5, B:393:0x0ce9, B:395:0x0d05, B:396:0x0d0c, B:399:0x0d4d, B:390:0x0cda, B:341:0x0b25, B:402:0x0d62, B:404:0x0d6c, B:405:0x0d80, B:406:0x0d88, B:408:0x0d8e, B:409:0x0da2, B:411:0x0db4, B:431:0x0e67, B:433:0x0e6d, B:435:0x0e84, B:438:0x0e8f, B:440:0x0e99, B:442:0x0ec0, B:444:0x0ed0, B:445:0x0ede, B:447:0x0eec, B:448:0x0efa, B:449:0x0f05, B:451:0x0f17, B:454:0x0f1e, B:459:0x0f61, B:455:0x0f2d, B:457:0x0f3b, B:458:0x0f48, B:460:0x0f70, B:461:0x0f83, B:465:0x0fa3, B:464:0x0f8e, B:412:0x0dcf, B:414:0x0dd5, B:416:0x0de7, B:418:0x0dee, B:424:0x0e06, B:426:0x0e0d, B:428:0x0e58, B:430:0x0e5f, B:429:0x0e5c, B:425:0x0e0a, B:417:0x0deb, B:283:0x094a, B:285:0x0950, B:287:0x0956, B:267:0x087e, B:263:0x084d, B:257:0x07f6, B:259:0x07fc, B:466:0x0fac), top: B:472:0x0019, inners: #1, #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:345:0x0b5c A[Catch: all -> 0x0125, TryCatch #0 {all -> 0x0125, blocks: (B:3:0x0019, B:5:0x0035, B:8:0x003e, B:9:0x005e, B:12:0x007a, B:15:0x00a6, B:17:0x00e5, B:20:0x00fe, B:22:0x0108, B:228:0x0750, B:26:0x0135, B:29:0x014b, B:31:0x0151, B:33:0x0157, B:35:0x016a, B:39:0x0177, B:41:0x0182, B:43:0x0190, B:45:0x0196, B:49:0x01a1, B:50:0x01af, B:52:0x01c1, B:55:0x01e1, B:57:0x01e7, B:59:0x01f7, B:61:0x0205, B:63:0x0215, B:64:0x0220, B:65:0x0223, B:67:0x0230, B:69:0x023a, B:70:0x024a, B:72:0x0269, B:74:0x0273, B:76:0x0289, B:77:0x0293, B:80:0x029e, B:81:0x02a8, B:84:0x02b0, B:87:0x02c1, B:88:0x02c4, B:90:0x02db, B:141:0x04d5, B:142:0x04d8, B:144:0x04e4, B:147:0x04f5, B:149:0x0506, B:151:0x0512, B:184:0x05dd, B:186:0x05ea, B:188:0x05f0, B:190:0x05f6, B:192:0x0606, B:193:0x0609, B:194:0x0615, B:196:0x061b, B:197:0x0627, B:199:0x062d, B:201:0x063d, B:203:0x0647, B:204:0x065c, B:206:0x0662, B:207:0x067d, B:209:0x0683, B:210:0x06a1, B:211:0x06ae, B:215:0x06d7, B:212:0x06b4, B:214:0x06c2, B:216:0x06df, B:217:0x06fe, B:219:0x0704, B:221:0x0717, B:222:0x0724, B:223:0x0728, B:225:0x072e, B:227:0x073c, B:155:0x0535, B:157:0x0545, B:160:0x0558, B:162:0x056a, B:164:0x0576, B:167:0x058a, B:170:0x0598, B:172:0x05a2, B:174:0x05ac, B:177:0x05b7, B:179:0x05bd, B:181:0x05cd, B:182:0x05d8, B:98:0x0301, B:101:0x030b, B:103:0x0319, B:107:0x036a, B:104:0x033b, B:106:0x0349, B:110:0x0371, B:113:0x03a4, B:114:0x03cc, B:116:0x0401, B:118:0x0407, B:121:0x0413, B:123:0x0448, B:124:0x0465, B:126:0x046b, B:128:0x0479, B:132:0x048d, B:129:0x0481, B:135:0x0494, B:138:0x049b, B:139:0x04ba, B:231:0x0767, B:233:0x0779, B:235:0x0782, B:246:0x07b4, B:236:0x078a, B:238:0x0793, B:240:0x0799, B:243:0x07a5, B:245:0x07af, B:247:0x07b7, B:248:0x07c3, B:251:0x07cb, B:253:0x07dd, B:254:0x07e8, B:256:0x07f0, B:260:0x081f, B:262:0x083b, B:264:0x0850, B:266:0x086c, B:268:0x0881, B:269:0x089d, B:271:0x08a3, B:273:0x08bb, B:274:0x08c9, B:276:0x08d9, B:277:0x08e7, B:278:0x08ea, B:280:0x0934, B:282:0x093a, B:288:0x0965, B:290:0x096d, B:291:0x098b, B:293:0x0991, B:294:0x09a5, B:296:0x09bc, B:298:0x09d6, B:300:0x09e8, B:302:0x09f2, B:303:0x09f5, B:305:0x0a50, B:306:0x0a63, B:309:0x0a6b, B:312:0x0a8a, B:314:0x0aa3, B:316:0x0ab8, B:318:0x0abd, B:320:0x0ac1, B:322:0x0ac5, B:324:0x0acf, B:326:0x0ad8, B:328:0x0adc, B:330:0x0ae2, B:332:0x0aed, B:334:0x0afb, B:401:0x0d5c, B:336:0x0b03, B:338:0x0b1f, B:343:0x0b3c, B:345:0x0b5c, B:346:0x0b64, B:348:0x0b6a, B:350:0x0b7c, B:356:0x0b92, B:358:0x0ba8, B:359:0x0bcb, B:361:0x0bd7, B:363:0x0bed, B:364:0x0c2d, B:370:0x0c49, B:372:0x0c54, B:374:0x0c58, B:376:0x0c5c, B:378:0x0c60, B:379:0x0c6c, B:380:0x0c71, B:382:0x0c77, B:384:0x0c8d, B:385:0x0c92, B:400:0x0d59, B:387:0x0cd1, B:389:0x0cd5, B:393:0x0ce9, B:395:0x0d05, B:396:0x0d0c, B:399:0x0d4d, B:390:0x0cda, B:341:0x0b25, B:402:0x0d62, B:404:0x0d6c, B:405:0x0d80, B:406:0x0d88, B:408:0x0d8e, B:409:0x0da2, B:411:0x0db4, B:431:0x0e67, B:433:0x0e6d, B:435:0x0e84, B:438:0x0e8f, B:440:0x0e99, B:442:0x0ec0, B:444:0x0ed0, B:445:0x0ede, B:447:0x0eec, B:448:0x0efa, B:449:0x0f05, B:451:0x0f17, B:454:0x0f1e, B:459:0x0f61, B:455:0x0f2d, B:457:0x0f3b, B:458:0x0f48, B:460:0x0f70, B:461:0x0f83, B:465:0x0fa3, B:464:0x0f8e, B:412:0x0dcf, B:414:0x0dd5, B:416:0x0de7, B:418:0x0dee, B:424:0x0e06, B:426:0x0e0d, B:428:0x0e58, B:430:0x0e5f, B:429:0x0e5c, B:425:0x0e0a, B:417:0x0deb, B:283:0x094a, B:285:0x0950, B:287:0x0956, B:267:0x087e, B:263:0x084d, B:257:0x07f6, B:259:0x07fc, B:466:0x0fac), top: B:472:0x0019, inners: #1, #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:355:0x0b90 A[PHI: r13
      0x0b90: PHI (r13v11 long) = (r13v10 long), (r13v36 long) binds: [B:344:0x0b5a, B:524:0x0b90] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:358:0x0ba8 A[Catch: all -> 0x0125, TryCatch #0 {all -> 0x0125, blocks: (B:3:0x0019, B:5:0x0035, B:8:0x003e, B:9:0x005e, B:12:0x007a, B:15:0x00a6, B:17:0x00e5, B:20:0x00fe, B:22:0x0108, B:228:0x0750, B:26:0x0135, B:29:0x014b, B:31:0x0151, B:33:0x0157, B:35:0x016a, B:39:0x0177, B:41:0x0182, B:43:0x0190, B:45:0x0196, B:49:0x01a1, B:50:0x01af, B:52:0x01c1, B:55:0x01e1, B:57:0x01e7, B:59:0x01f7, B:61:0x0205, B:63:0x0215, B:64:0x0220, B:65:0x0223, B:67:0x0230, B:69:0x023a, B:70:0x024a, B:72:0x0269, B:74:0x0273, B:76:0x0289, B:77:0x0293, B:80:0x029e, B:81:0x02a8, B:84:0x02b0, B:87:0x02c1, B:88:0x02c4, B:90:0x02db, B:141:0x04d5, B:142:0x04d8, B:144:0x04e4, B:147:0x04f5, B:149:0x0506, B:151:0x0512, B:184:0x05dd, B:186:0x05ea, B:188:0x05f0, B:190:0x05f6, B:192:0x0606, B:193:0x0609, B:194:0x0615, B:196:0x061b, B:197:0x0627, B:199:0x062d, B:201:0x063d, B:203:0x0647, B:204:0x065c, B:206:0x0662, B:207:0x067d, B:209:0x0683, B:210:0x06a1, B:211:0x06ae, B:215:0x06d7, B:212:0x06b4, B:214:0x06c2, B:216:0x06df, B:217:0x06fe, B:219:0x0704, B:221:0x0717, B:222:0x0724, B:223:0x0728, B:225:0x072e, B:227:0x073c, B:155:0x0535, B:157:0x0545, B:160:0x0558, B:162:0x056a, B:164:0x0576, B:167:0x058a, B:170:0x0598, B:172:0x05a2, B:174:0x05ac, B:177:0x05b7, B:179:0x05bd, B:181:0x05cd, B:182:0x05d8, B:98:0x0301, B:101:0x030b, B:103:0x0319, B:107:0x036a, B:104:0x033b, B:106:0x0349, B:110:0x0371, B:113:0x03a4, B:114:0x03cc, B:116:0x0401, B:118:0x0407, B:121:0x0413, B:123:0x0448, B:124:0x0465, B:126:0x046b, B:128:0x0479, B:132:0x048d, B:129:0x0481, B:135:0x0494, B:138:0x049b, B:139:0x04ba, B:231:0x0767, B:233:0x0779, B:235:0x0782, B:246:0x07b4, B:236:0x078a, B:238:0x0793, B:240:0x0799, B:243:0x07a5, B:245:0x07af, B:247:0x07b7, B:248:0x07c3, B:251:0x07cb, B:253:0x07dd, B:254:0x07e8, B:256:0x07f0, B:260:0x081f, B:262:0x083b, B:264:0x0850, B:266:0x086c, B:268:0x0881, B:269:0x089d, B:271:0x08a3, B:273:0x08bb, B:274:0x08c9, B:276:0x08d9, B:277:0x08e7, B:278:0x08ea, B:280:0x0934, B:282:0x093a, B:288:0x0965, B:290:0x096d, B:291:0x098b, B:293:0x0991, B:294:0x09a5, B:296:0x09bc, B:298:0x09d6, B:300:0x09e8, B:302:0x09f2, B:303:0x09f5, B:305:0x0a50, B:306:0x0a63, B:309:0x0a6b, B:312:0x0a8a, B:314:0x0aa3, B:316:0x0ab8, B:318:0x0abd, B:320:0x0ac1, B:322:0x0ac5, B:324:0x0acf, B:326:0x0ad8, B:328:0x0adc, B:330:0x0ae2, B:332:0x0aed, B:334:0x0afb, B:401:0x0d5c, B:336:0x0b03, B:338:0x0b1f, B:343:0x0b3c, B:345:0x0b5c, B:346:0x0b64, B:348:0x0b6a, B:350:0x0b7c, B:356:0x0b92, B:358:0x0ba8, B:359:0x0bcb, B:361:0x0bd7, B:363:0x0bed, B:364:0x0c2d, B:370:0x0c49, B:372:0x0c54, B:374:0x0c58, B:376:0x0c5c, B:378:0x0c60, B:379:0x0c6c, B:380:0x0c71, B:382:0x0c77, B:384:0x0c8d, B:385:0x0c92, B:400:0x0d59, B:387:0x0cd1, B:389:0x0cd5, B:393:0x0ce9, B:395:0x0d05, B:396:0x0d0c, B:399:0x0d4d, B:390:0x0cda, B:341:0x0b25, B:402:0x0d62, B:404:0x0d6c, B:405:0x0d80, B:406:0x0d88, B:408:0x0d8e, B:409:0x0da2, B:411:0x0db4, B:431:0x0e67, B:433:0x0e6d, B:435:0x0e84, B:438:0x0e8f, B:440:0x0e99, B:442:0x0ec0, B:444:0x0ed0, B:445:0x0ede, B:447:0x0eec, B:448:0x0efa, B:449:0x0f05, B:451:0x0f17, B:454:0x0f1e, B:459:0x0f61, B:455:0x0f2d, B:457:0x0f3b, B:458:0x0f48, B:460:0x0f70, B:461:0x0f83, B:465:0x0fa3, B:464:0x0f8e, B:412:0x0dcf, B:414:0x0dd5, B:416:0x0de7, B:418:0x0dee, B:424:0x0e06, B:426:0x0e0d, B:428:0x0e58, B:430:0x0e5f, B:429:0x0e5c, B:425:0x0e0a, B:417:0x0deb, B:283:0x094a, B:285:0x0950, B:287:0x0956, B:267:0x087e, B:263:0x084d, B:257:0x07f6, B:259:0x07fc, B:466:0x0fac), top: B:472:0x0019, inners: #1, #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:359:0x0bcb A[Catch: all -> 0x0125, TryCatch #0 {all -> 0x0125, blocks: (B:3:0x0019, B:5:0x0035, B:8:0x003e, B:9:0x005e, B:12:0x007a, B:15:0x00a6, B:17:0x00e5, B:20:0x00fe, B:22:0x0108, B:228:0x0750, B:26:0x0135, B:29:0x014b, B:31:0x0151, B:33:0x0157, B:35:0x016a, B:39:0x0177, B:41:0x0182, B:43:0x0190, B:45:0x0196, B:49:0x01a1, B:50:0x01af, B:52:0x01c1, B:55:0x01e1, B:57:0x01e7, B:59:0x01f7, B:61:0x0205, B:63:0x0215, B:64:0x0220, B:65:0x0223, B:67:0x0230, B:69:0x023a, B:70:0x024a, B:72:0x0269, B:74:0x0273, B:76:0x0289, B:77:0x0293, B:80:0x029e, B:81:0x02a8, B:84:0x02b0, B:87:0x02c1, B:88:0x02c4, B:90:0x02db, B:141:0x04d5, B:142:0x04d8, B:144:0x04e4, B:147:0x04f5, B:149:0x0506, B:151:0x0512, B:184:0x05dd, B:186:0x05ea, B:188:0x05f0, B:190:0x05f6, B:192:0x0606, B:193:0x0609, B:194:0x0615, B:196:0x061b, B:197:0x0627, B:199:0x062d, B:201:0x063d, B:203:0x0647, B:204:0x065c, B:206:0x0662, B:207:0x067d, B:209:0x0683, B:210:0x06a1, B:211:0x06ae, B:215:0x06d7, B:212:0x06b4, B:214:0x06c2, B:216:0x06df, B:217:0x06fe, B:219:0x0704, B:221:0x0717, B:222:0x0724, B:223:0x0728, B:225:0x072e, B:227:0x073c, B:155:0x0535, B:157:0x0545, B:160:0x0558, B:162:0x056a, B:164:0x0576, B:167:0x058a, B:170:0x0598, B:172:0x05a2, B:174:0x05ac, B:177:0x05b7, B:179:0x05bd, B:181:0x05cd, B:182:0x05d8, B:98:0x0301, B:101:0x030b, B:103:0x0319, B:107:0x036a, B:104:0x033b, B:106:0x0349, B:110:0x0371, B:113:0x03a4, B:114:0x03cc, B:116:0x0401, B:118:0x0407, B:121:0x0413, B:123:0x0448, B:124:0x0465, B:126:0x046b, B:128:0x0479, B:132:0x048d, B:129:0x0481, B:135:0x0494, B:138:0x049b, B:139:0x04ba, B:231:0x0767, B:233:0x0779, B:235:0x0782, B:246:0x07b4, B:236:0x078a, B:238:0x0793, B:240:0x0799, B:243:0x07a5, B:245:0x07af, B:247:0x07b7, B:248:0x07c3, B:251:0x07cb, B:253:0x07dd, B:254:0x07e8, B:256:0x07f0, B:260:0x081f, B:262:0x083b, B:264:0x0850, B:266:0x086c, B:268:0x0881, B:269:0x089d, B:271:0x08a3, B:273:0x08bb, B:274:0x08c9, B:276:0x08d9, B:277:0x08e7, B:278:0x08ea, B:280:0x0934, B:282:0x093a, B:288:0x0965, B:290:0x096d, B:291:0x098b, B:293:0x0991, B:294:0x09a5, B:296:0x09bc, B:298:0x09d6, B:300:0x09e8, B:302:0x09f2, B:303:0x09f5, B:305:0x0a50, B:306:0x0a63, B:309:0x0a6b, B:312:0x0a8a, B:314:0x0aa3, B:316:0x0ab8, B:318:0x0abd, B:320:0x0ac1, B:322:0x0ac5, B:324:0x0acf, B:326:0x0ad8, B:328:0x0adc, B:330:0x0ae2, B:332:0x0aed, B:334:0x0afb, B:401:0x0d5c, B:336:0x0b03, B:338:0x0b1f, B:343:0x0b3c, B:345:0x0b5c, B:346:0x0b64, B:348:0x0b6a, B:350:0x0b7c, B:356:0x0b92, B:358:0x0ba8, B:359:0x0bcb, B:361:0x0bd7, B:363:0x0bed, B:364:0x0c2d, B:370:0x0c49, B:372:0x0c54, B:374:0x0c58, B:376:0x0c5c, B:378:0x0c60, B:379:0x0c6c, B:380:0x0c71, B:382:0x0c77, B:384:0x0c8d, B:385:0x0c92, B:400:0x0d59, B:387:0x0cd1, B:389:0x0cd5, B:393:0x0ce9, B:395:0x0d05, B:396:0x0d0c, B:399:0x0d4d, B:390:0x0cda, B:341:0x0b25, B:402:0x0d62, B:404:0x0d6c, B:405:0x0d80, B:406:0x0d88, B:408:0x0d8e, B:409:0x0da2, B:411:0x0db4, B:431:0x0e67, B:433:0x0e6d, B:435:0x0e84, B:438:0x0e8f, B:440:0x0e99, B:442:0x0ec0, B:444:0x0ed0, B:445:0x0ede, B:447:0x0eec, B:448:0x0efa, B:449:0x0f05, B:451:0x0f17, B:454:0x0f1e, B:459:0x0f61, B:455:0x0f2d, B:457:0x0f3b, B:458:0x0f48, B:460:0x0f70, B:461:0x0f83, B:465:0x0fa3, B:464:0x0f8e, B:412:0x0dcf, B:414:0x0dd5, B:416:0x0de7, B:418:0x0dee, B:424:0x0e06, B:426:0x0e0d, B:428:0x0e58, B:430:0x0e5f, B:429:0x0e5c, B:425:0x0e0a, B:417:0x0deb, B:283:0x094a, B:285:0x0950, B:287:0x0956, B:267:0x087e, B:263:0x084d, B:257:0x07f6, B:259:0x07fc, B:466:0x0fac), top: B:472:0x0019, inners: #1, #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:48:0x019f  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x01c1 A[Catch: all -> 0x0125, TryCatch #0 {all -> 0x0125, blocks: (B:3:0x0019, B:5:0x0035, B:8:0x003e, B:9:0x005e, B:12:0x007a, B:15:0x00a6, B:17:0x00e5, B:20:0x00fe, B:22:0x0108, B:228:0x0750, B:26:0x0135, B:29:0x014b, B:31:0x0151, B:33:0x0157, B:35:0x016a, B:39:0x0177, B:41:0x0182, B:43:0x0190, B:45:0x0196, B:49:0x01a1, B:50:0x01af, B:52:0x01c1, B:55:0x01e1, B:57:0x01e7, B:59:0x01f7, B:61:0x0205, B:63:0x0215, B:64:0x0220, B:65:0x0223, B:67:0x0230, B:69:0x023a, B:70:0x024a, B:72:0x0269, B:74:0x0273, B:76:0x0289, B:77:0x0293, B:80:0x029e, B:81:0x02a8, B:84:0x02b0, B:87:0x02c1, B:88:0x02c4, B:90:0x02db, B:141:0x04d5, B:142:0x04d8, B:144:0x04e4, B:147:0x04f5, B:149:0x0506, B:151:0x0512, B:184:0x05dd, B:186:0x05ea, B:188:0x05f0, B:190:0x05f6, B:192:0x0606, B:193:0x0609, B:194:0x0615, B:196:0x061b, B:197:0x0627, B:199:0x062d, B:201:0x063d, B:203:0x0647, B:204:0x065c, B:206:0x0662, B:207:0x067d, B:209:0x0683, B:210:0x06a1, B:211:0x06ae, B:215:0x06d7, B:212:0x06b4, B:214:0x06c2, B:216:0x06df, B:217:0x06fe, B:219:0x0704, B:221:0x0717, B:222:0x0724, B:223:0x0728, B:225:0x072e, B:227:0x073c, B:155:0x0535, B:157:0x0545, B:160:0x0558, B:162:0x056a, B:164:0x0576, B:167:0x058a, B:170:0x0598, B:172:0x05a2, B:174:0x05ac, B:177:0x05b7, B:179:0x05bd, B:181:0x05cd, B:182:0x05d8, B:98:0x0301, B:101:0x030b, B:103:0x0319, B:107:0x036a, B:104:0x033b, B:106:0x0349, B:110:0x0371, B:113:0x03a4, B:114:0x03cc, B:116:0x0401, B:118:0x0407, B:121:0x0413, B:123:0x0448, B:124:0x0465, B:126:0x046b, B:128:0x0479, B:132:0x048d, B:129:0x0481, B:135:0x0494, B:138:0x049b, B:139:0x04ba, B:231:0x0767, B:233:0x0779, B:235:0x0782, B:246:0x07b4, B:236:0x078a, B:238:0x0793, B:240:0x0799, B:243:0x07a5, B:245:0x07af, B:247:0x07b7, B:248:0x07c3, B:251:0x07cb, B:253:0x07dd, B:254:0x07e8, B:256:0x07f0, B:260:0x081f, B:262:0x083b, B:264:0x0850, B:266:0x086c, B:268:0x0881, B:269:0x089d, B:271:0x08a3, B:273:0x08bb, B:274:0x08c9, B:276:0x08d9, B:277:0x08e7, B:278:0x08ea, B:280:0x0934, B:282:0x093a, B:288:0x0965, B:290:0x096d, B:291:0x098b, B:293:0x0991, B:294:0x09a5, B:296:0x09bc, B:298:0x09d6, B:300:0x09e8, B:302:0x09f2, B:303:0x09f5, B:305:0x0a50, B:306:0x0a63, B:309:0x0a6b, B:312:0x0a8a, B:314:0x0aa3, B:316:0x0ab8, B:318:0x0abd, B:320:0x0ac1, B:322:0x0ac5, B:324:0x0acf, B:326:0x0ad8, B:328:0x0adc, B:330:0x0ae2, B:332:0x0aed, B:334:0x0afb, B:401:0x0d5c, B:336:0x0b03, B:338:0x0b1f, B:343:0x0b3c, B:345:0x0b5c, B:346:0x0b64, B:348:0x0b6a, B:350:0x0b7c, B:356:0x0b92, B:358:0x0ba8, B:359:0x0bcb, B:361:0x0bd7, B:363:0x0bed, B:364:0x0c2d, B:370:0x0c49, B:372:0x0c54, B:374:0x0c58, B:376:0x0c5c, B:378:0x0c60, B:379:0x0c6c, B:380:0x0c71, B:382:0x0c77, B:384:0x0c8d, B:385:0x0c92, B:400:0x0d59, B:387:0x0cd1, B:389:0x0cd5, B:393:0x0ce9, B:395:0x0d05, B:396:0x0d0c, B:399:0x0d4d, B:390:0x0cda, B:341:0x0b25, B:402:0x0d62, B:404:0x0d6c, B:405:0x0d80, B:406:0x0d88, B:408:0x0d8e, B:409:0x0da2, B:411:0x0db4, B:431:0x0e67, B:433:0x0e6d, B:435:0x0e84, B:438:0x0e8f, B:440:0x0e99, B:442:0x0ec0, B:444:0x0ed0, B:445:0x0ede, B:447:0x0eec, B:448:0x0efa, B:449:0x0f05, B:451:0x0f17, B:454:0x0f1e, B:459:0x0f61, B:455:0x0f2d, B:457:0x0f3b, B:458:0x0f48, B:460:0x0f70, B:461:0x0f83, B:465:0x0fa3, B:464:0x0f8e, B:412:0x0dcf, B:414:0x0dd5, B:416:0x0de7, B:418:0x0dee, B:424:0x0e06, B:426:0x0e0d, B:428:0x0e58, B:430:0x0e5f, B:429:0x0e5c, B:425:0x0e0a, B:417:0x0deb, B:283:0x094a, B:285:0x0950, B:287:0x0956, B:267:0x087e, B:263:0x084d, B:257:0x07f6, B:259:0x07fc, B:466:0x0fac), top: B:472:0x0019, inners: #1, #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0289 A[Catch: all -> 0x0125, TryCatch #0 {all -> 0x0125, blocks: (B:3:0x0019, B:5:0x0035, B:8:0x003e, B:9:0x005e, B:12:0x007a, B:15:0x00a6, B:17:0x00e5, B:20:0x00fe, B:22:0x0108, B:228:0x0750, B:26:0x0135, B:29:0x014b, B:31:0x0151, B:33:0x0157, B:35:0x016a, B:39:0x0177, B:41:0x0182, B:43:0x0190, B:45:0x0196, B:49:0x01a1, B:50:0x01af, B:52:0x01c1, B:55:0x01e1, B:57:0x01e7, B:59:0x01f7, B:61:0x0205, B:63:0x0215, B:64:0x0220, B:65:0x0223, B:67:0x0230, B:69:0x023a, B:70:0x024a, B:72:0x0269, B:74:0x0273, B:76:0x0289, B:77:0x0293, B:80:0x029e, B:81:0x02a8, B:84:0x02b0, B:87:0x02c1, B:88:0x02c4, B:90:0x02db, B:141:0x04d5, B:142:0x04d8, B:144:0x04e4, B:147:0x04f5, B:149:0x0506, B:151:0x0512, B:184:0x05dd, B:186:0x05ea, B:188:0x05f0, B:190:0x05f6, B:192:0x0606, B:193:0x0609, B:194:0x0615, B:196:0x061b, B:197:0x0627, B:199:0x062d, B:201:0x063d, B:203:0x0647, B:204:0x065c, B:206:0x0662, B:207:0x067d, B:209:0x0683, B:210:0x06a1, B:211:0x06ae, B:215:0x06d7, B:212:0x06b4, B:214:0x06c2, B:216:0x06df, B:217:0x06fe, B:219:0x0704, B:221:0x0717, B:222:0x0724, B:223:0x0728, B:225:0x072e, B:227:0x073c, B:155:0x0535, B:157:0x0545, B:160:0x0558, B:162:0x056a, B:164:0x0576, B:167:0x058a, B:170:0x0598, B:172:0x05a2, B:174:0x05ac, B:177:0x05b7, B:179:0x05bd, B:181:0x05cd, B:182:0x05d8, B:98:0x0301, B:101:0x030b, B:103:0x0319, B:107:0x036a, B:104:0x033b, B:106:0x0349, B:110:0x0371, B:113:0x03a4, B:114:0x03cc, B:116:0x0401, B:118:0x0407, B:121:0x0413, B:123:0x0448, B:124:0x0465, B:126:0x046b, B:128:0x0479, B:132:0x048d, B:129:0x0481, B:135:0x0494, B:138:0x049b, B:139:0x04ba, B:231:0x0767, B:233:0x0779, B:235:0x0782, B:246:0x07b4, B:236:0x078a, B:238:0x0793, B:240:0x0799, B:243:0x07a5, B:245:0x07af, B:247:0x07b7, B:248:0x07c3, B:251:0x07cb, B:253:0x07dd, B:254:0x07e8, B:256:0x07f0, B:260:0x081f, B:262:0x083b, B:264:0x0850, B:266:0x086c, B:268:0x0881, B:269:0x089d, B:271:0x08a3, B:273:0x08bb, B:274:0x08c9, B:276:0x08d9, B:277:0x08e7, B:278:0x08ea, B:280:0x0934, B:282:0x093a, B:288:0x0965, B:290:0x096d, B:291:0x098b, B:293:0x0991, B:294:0x09a5, B:296:0x09bc, B:298:0x09d6, B:300:0x09e8, B:302:0x09f2, B:303:0x09f5, B:305:0x0a50, B:306:0x0a63, B:309:0x0a6b, B:312:0x0a8a, B:314:0x0aa3, B:316:0x0ab8, B:318:0x0abd, B:320:0x0ac1, B:322:0x0ac5, B:324:0x0acf, B:326:0x0ad8, B:328:0x0adc, B:330:0x0ae2, B:332:0x0aed, B:334:0x0afb, B:401:0x0d5c, B:336:0x0b03, B:338:0x0b1f, B:343:0x0b3c, B:345:0x0b5c, B:346:0x0b64, B:348:0x0b6a, B:350:0x0b7c, B:356:0x0b92, B:358:0x0ba8, B:359:0x0bcb, B:361:0x0bd7, B:363:0x0bed, B:364:0x0c2d, B:370:0x0c49, B:372:0x0c54, B:374:0x0c58, B:376:0x0c5c, B:378:0x0c60, B:379:0x0c6c, B:380:0x0c71, B:382:0x0c77, B:384:0x0c8d, B:385:0x0c92, B:400:0x0d59, B:387:0x0cd1, B:389:0x0cd5, B:393:0x0ce9, B:395:0x0d05, B:396:0x0d0c, B:399:0x0d4d, B:390:0x0cda, B:341:0x0b25, B:402:0x0d62, B:404:0x0d6c, B:405:0x0d80, B:406:0x0d88, B:408:0x0d8e, B:409:0x0da2, B:411:0x0db4, B:431:0x0e67, B:433:0x0e6d, B:435:0x0e84, B:438:0x0e8f, B:440:0x0e99, B:442:0x0ec0, B:444:0x0ed0, B:445:0x0ede, B:447:0x0eec, B:448:0x0efa, B:449:0x0f05, B:451:0x0f17, B:454:0x0f1e, B:459:0x0f61, B:455:0x0f2d, B:457:0x0f3b, B:458:0x0f48, B:460:0x0f70, B:461:0x0f83, B:465:0x0fa3, B:464:0x0f8e, B:412:0x0dcf, B:414:0x0dd5, B:416:0x0de7, B:418:0x0dee, B:424:0x0e06, B:426:0x0e0d, B:428:0x0e58, B:430:0x0e5f, B:429:0x0e5c, B:425:0x0e0a, B:417:0x0deb, B:283:0x094a, B:285:0x0950, B:287:0x0956, B:267:0x087e, B:263:0x084d, B:257:0x07f6, B:259:0x07fc, B:466:0x0fac), top: B:472:0x0019, inners: #1, #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x029d  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x029e A[Catch: all -> 0x0125, TryCatch #0 {all -> 0x0125, blocks: (B:3:0x0019, B:5:0x0035, B:8:0x003e, B:9:0x005e, B:12:0x007a, B:15:0x00a6, B:17:0x00e5, B:20:0x00fe, B:22:0x0108, B:228:0x0750, B:26:0x0135, B:29:0x014b, B:31:0x0151, B:33:0x0157, B:35:0x016a, B:39:0x0177, B:41:0x0182, B:43:0x0190, B:45:0x0196, B:49:0x01a1, B:50:0x01af, B:52:0x01c1, B:55:0x01e1, B:57:0x01e7, B:59:0x01f7, B:61:0x0205, B:63:0x0215, B:64:0x0220, B:65:0x0223, B:67:0x0230, B:69:0x023a, B:70:0x024a, B:72:0x0269, B:74:0x0273, B:76:0x0289, B:77:0x0293, B:80:0x029e, B:81:0x02a8, B:84:0x02b0, B:87:0x02c1, B:88:0x02c4, B:90:0x02db, B:141:0x04d5, B:142:0x04d8, B:144:0x04e4, B:147:0x04f5, B:149:0x0506, B:151:0x0512, B:184:0x05dd, B:186:0x05ea, B:188:0x05f0, B:190:0x05f6, B:192:0x0606, B:193:0x0609, B:194:0x0615, B:196:0x061b, B:197:0x0627, B:199:0x062d, B:201:0x063d, B:203:0x0647, B:204:0x065c, B:206:0x0662, B:207:0x067d, B:209:0x0683, B:210:0x06a1, B:211:0x06ae, B:215:0x06d7, B:212:0x06b4, B:214:0x06c2, B:216:0x06df, B:217:0x06fe, B:219:0x0704, B:221:0x0717, B:222:0x0724, B:223:0x0728, B:225:0x072e, B:227:0x073c, B:155:0x0535, B:157:0x0545, B:160:0x0558, B:162:0x056a, B:164:0x0576, B:167:0x058a, B:170:0x0598, B:172:0x05a2, B:174:0x05ac, B:177:0x05b7, B:179:0x05bd, B:181:0x05cd, B:182:0x05d8, B:98:0x0301, B:101:0x030b, B:103:0x0319, B:107:0x036a, B:104:0x033b, B:106:0x0349, B:110:0x0371, B:113:0x03a4, B:114:0x03cc, B:116:0x0401, B:118:0x0407, B:121:0x0413, B:123:0x0448, B:124:0x0465, B:126:0x046b, B:128:0x0479, B:132:0x048d, B:129:0x0481, B:135:0x0494, B:138:0x049b, B:139:0x04ba, B:231:0x0767, B:233:0x0779, B:235:0x0782, B:246:0x07b4, B:236:0x078a, B:238:0x0793, B:240:0x0799, B:243:0x07a5, B:245:0x07af, B:247:0x07b7, B:248:0x07c3, B:251:0x07cb, B:253:0x07dd, B:254:0x07e8, B:256:0x07f0, B:260:0x081f, B:262:0x083b, B:264:0x0850, B:266:0x086c, B:268:0x0881, B:269:0x089d, B:271:0x08a3, B:273:0x08bb, B:274:0x08c9, B:276:0x08d9, B:277:0x08e7, B:278:0x08ea, B:280:0x0934, B:282:0x093a, B:288:0x0965, B:290:0x096d, B:291:0x098b, B:293:0x0991, B:294:0x09a5, B:296:0x09bc, B:298:0x09d6, B:300:0x09e8, B:302:0x09f2, B:303:0x09f5, B:305:0x0a50, B:306:0x0a63, B:309:0x0a6b, B:312:0x0a8a, B:314:0x0aa3, B:316:0x0ab8, B:318:0x0abd, B:320:0x0ac1, B:322:0x0ac5, B:324:0x0acf, B:326:0x0ad8, B:328:0x0adc, B:330:0x0ae2, B:332:0x0aed, B:334:0x0afb, B:401:0x0d5c, B:336:0x0b03, B:338:0x0b1f, B:343:0x0b3c, B:345:0x0b5c, B:346:0x0b64, B:348:0x0b6a, B:350:0x0b7c, B:356:0x0b92, B:358:0x0ba8, B:359:0x0bcb, B:361:0x0bd7, B:363:0x0bed, B:364:0x0c2d, B:370:0x0c49, B:372:0x0c54, B:374:0x0c58, B:376:0x0c5c, B:378:0x0c60, B:379:0x0c6c, B:380:0x0c71, B:382:0x0c77, B:384:0x0c8d, B:385:0x0c92, B:400:0x0d59, B:387:0x0cd1, B:389:0x0cd5, B:393:0x0ce9, B:395:0x0d05, B:396:0x0d0c, B:399:0x0d4d, B:390:0x0cda, B:341:0x0b25, B:402:0x0d62, B:404:0x0d6c, B:405:0x0d80, B:406:0x0d88, B:408:0x0d8e, B:409:0x0da2, B:411:0x0db4, B:431:0x0e67, B:433:0x0e6d, B:435:0x0e84, B:438:0x0e8f, B:440:0x0e99, B:442:0x0ec0, B:444:0x0ed0, B:445:0x0ede, B:447:0x0eec, B:448:0x0efa, B:449:0x0f05, B:451:0x0f17, B:454:0x0f1e, B:459:0x0f61, B:455:0x0f2d, B:457:0x0f3b, B:458:0x0f48, B:460:0x0f70, B:461:0x0f83, B:465:0x0fa3, B:464:0x0f8e, B:412:0x0dcf, B:414:0x0dd5, B:416:0x0de7, B:418:0x0dee, B:424:0x0e06, B:426:0x0e0d, B:428:0x0e58, B:430:0x0e5f, B:429:0x0e5c, B:425:0x0e0a, B:417:0x0deb, B:283:0x094a, B:285:0x0950, B:287:0x0956, B:267:0x087e, B:263:0x084d, B:257:0x07f6, B:259:0x07fc, B:466:0x0fac), top: B:472:0x0019, inners: #1, #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:90:0x02db A[Catch: all -> 0x0125, TRY_LEAVE, TryCatch #0 {all -> 0x0125, blocks: (B:3:0x0019, B:5:0x0035, B:8:0x003e, B:9:0x005e, B:12:0x007a, B:15:0x00a6, B:17:0x00e5, B:20:0x00fe, B:22:0x0108, B:228:0x0750, B:26:0x0135, B:29:0x014b, B:31:0x0151, B:33:0x0157, B:35:0x016a, B:39:0x0177, B:41:0x0182, B:43:0x0190, B:45:0x0196, B:49:0x01a1, B:50:0x01af, B:52:0x01c1, B:55:0x01e1, B:57:0x01e7, B:59:0x01f7, B:61:0x0205, B:63:0x0215, B:64:0x0220, B:65:0x0223, B:67:0x0230, B:69:0x023a, B:70:0x024a, B:72:0x0269, B:74:0x0273, B:76:0x0289, B:77:0x0293, B:80:0x029e, B:81:0x02a8, B:84:0x02b0, B:87:0x02c1, B:88:0x02c4, B:90:0x02db, B:141:0x04d5, B:142:0x04d8, B:144:0x04e4, B:147:0x04f5, B:149:0x0506, B:151:0x0512, B:184:0x05dd, B:186:0x05ea, B:188:0x05f0, B:190:0x05f6, B:192:0x0606, B:193:0x0609, B:194:0x0615, B:196:0x061b, B:197:0x0627, B:199:0x062d, B:201:0x063d, B:203:0x0647, B:204:0x065c, B:206:0x0662, B:207:0x067d, B:209:0x0683, B:210:0x06a1, B:211:0x06ae, B:215:0x06d7, B:212:0x06b4, B:214:0x06c2, B:216:0x06df, B:217:0x06fe, B:219:0x0704, B:221:0x0717, B:222:0x0724, B:223:0x0728, B:225:0x072e, B:227:0x073c, B:155:0x0535, B:157:0x0545, B:160:0x0558, B:162:0x056a, B:164:0x0576, B:167:0x058a, B:170:0x0598, B:172:0x05a2, B:174:0x05ac, B:177:0x05b7, B:179:0x05bd, B:181:0x05cd, B:182:0x05d8, B:98:0x0301, B:101:0x030b, B:103:0x0319, B:107:0x036a, B:104:0x033b, B:106:0x0349, B:110:0x0371, B:113:0x03a4, B:114:0x03cc, B:116:0x0401, B:118:0x0407, B:121:0x0413, B:123:0x0448, B:124:0x0465, B:126:0x046b, B:128:0x0479, B:132:0x048d, B:129:0x0481, B:135:0x0494, B:138:0x049b, B:139:0x04ba, B:231:0x0767, B:233:0x0779, B:235:0x0782, B:246:0x07b4, B:236:0x078a, B:238:0x0793, B:240:0x0799, B:243:0x07a5, B:245:0x07af, B:247:0x07b7, B:248:0x07c3, B:251:0x07cb, B:253:0x07dd, B:254:0x07e8, B:256:0x07f0, B:260:0x081f, B:262:0x083b, B:264:0x0850, B:266:0x086c, B:268:0x0881, B:269:0x089d, B:271:0x08a3, B:273:0x08bb, B:274:0x08c9, B:276:0x08d9, B:277:0x08e7, B:278:0x08ea, B:280:0x0934, B:282:0x093a, B:288:0x0965, B:290:0x096d, B:291:0x098b, B:293:0x0991, B:294:0x09a5, B:296:0x09bc, B:298:0x09d6, B:300:0x09e8, B:302:0x09f2, B:303:0x09f5, B:305:0x0a50, B:306:0x0a63, B:309:0x0a6b, B:312:0x0a8a, B:314:0x0aa3, B:316:0x0ab8, B:318:0x0abd, B:320:0x0ac1, B:322:0x0ac5, B:324:0x0acf, B:326:0x0ad8, B:328:0x0adc, B:330:0x0ae2, B:332:0x0aed, B:334:0x0afb, B:401:0x0d5c, B:336:0x0b03, B:338:0x0b1f, B:343:0x0b3c, B:345:0x0b5c, B:346:0x0b64, B:348:0x0b6a, B:350:0x0b7c, B:356:0x0b92, B:358:0x0ba8, B:359:0x0bcb, B:361:0x0bd7, B:363:0x0bed, B:364:0x0c2d, B:370:0x0c49, B:372:0x0c54, B:374:0x0c58, B:376:0x0c5c, B:378:0x0c60, B:379:0x0c6c, B:380:0x0c71, B:382:0x0c77, B:384:0x0c8d, B:385:0x0c92, B:400:0x0d59, B:387:0x0cd1, B:389:0x0cd5, B:393:0x0ce9, B:395:0x0d05, B:396:0x0d0c, B:399:0x0d4d, B:390:0x0cda, B:341:0x0b25, B:402:0x0d62, B:404:0x0d6c, B:405:0x0d80, B:406:0x0d88, B:408:0x0d8e, B:409:0x0da2, B:411:0x0db4, B:431:0x0e67, B:433:0x0e6d, B:435:0x0e84, B:438:0x0e8f, B:440:0x0e99, B:442:0x0ec0, B:444:0x0ed0, B:445:0x0ede, B:447:0x0eec, B:448:0x0efa, B:449:0x0f05, B:451:0x0f17, B:454:0x0f1e, B:459:0x0f61, B:455:0x0f2d, B:457:0x0f3b, B:458:0x0f48, B:460:0x0f70, B:461:0x0f83, B:465:0x0fa3, B:464:0x0f8e, B:412:0x0dcf, B:414:0x0dd5, B:416:0x0de7, B:418:0x0dee, B:424:0x0e06, B:426:0x0e0d, B:428:0x0e58, B:430:0x0e5f, B:429:0x0e5c, B:425:0x0e0a, B:417:0x0deb, B:283:0x094a, B:285:0x0950, B:287:0x0956, B:267:0x087e, B:263:0x084d, B:257:0x07f6, B:259:0x07fc, B:466:0x0fac), top: B:472:0x0019, inners: #1, #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:96:0x02f7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean I(long j11, String str) {
        boolean z11;
        int i5;
        Long l9;
        m1 m1Var;
        t0 t0VarH0;
        Long l11;
        long j12;
        long j13;
        int iV;
        long jU;
        String str2;
        ja jaVar;
        int i11;
        int i12;
        e eVarE0;
        w wVar;
        boolean zT;
        boolean z12;
        String str3;
        String str4;
        int i13;
        int i14;
        String str5;
        String str6;
        int i15;
        int i16;
        String str7;
        long jK;
        j4 j4Var = this;
        String str8 = "1";
        String str9 = "_ai";
        String str10 = "purchase";
        String str11 = "items";
        Long l12 = 1L;
        j4Var.g0().r0();
        try {
            x0 x0Var = new x0(j4Var);
            j4Var.g0().p0(str, j11, j4Var.A, x0Var);
            ArrayList arrayList = (ArrayList) x0Var.f13460d;
            if (arrayList == null || arrayList.isEmpty()) {
                g0().s0();
                z11 = false;
            } else {
                ja jaVar2 = (ja) ((ka) x0Var.f13458b).l();
                jaVar2.c();
                ((ka) jaVar2.f32762b).i0();
                int i17 = -1;
                int i18 = -1;
                int i19 = 0;
                int i21 = 0;
                boolean z13 = false;
                ba baVar = null;
                ba baVar2 = null;
                boolean z14 = false;
                while (true) {
                    int size = ((ArrayList) x0Var.f13460d).size();
                    i5 = i21;
                    l9 = l12;
                    m1Var = j4Var.f13050l;
                    if (i19 >= size) {
                        break;
                    }
                    ba baVar3 = (ba) ((ca) ((ArrayList) x0Var.f13460d).get(i19)).l();
                    int i22 = i19;
                    if (j4Var.f0().S(((ka) x0Var.f13458b).x(), baVar3.q())) {
                        String str12 = str11;
                        j4Var.b().I().c(o0.L(((ka) x0Var.f13458b).x()), "Dropping blocked raw event. appId", m1Var.m().a(baVar3.q()));
                        if (!str8.equals(j4Var.f0().f(((ka) x0Var.f13458b).x(), "measurement.upload.blacklist_internal")) && !str8.equals(j4Var.f0().f(((ka) x0Var.f13458b).x(), "measurement.upload.blacklist_public")) && !"_err".equals(baVar3.q())) {
                            j4Var.k0();
                            p4.V(j4Var.J, ((ka) x0Var.f13458b).x(), 11, "_ev", baVar3.q(), 0);
                        }
                        str2 = str8;
                        str4 = str10;
                        i21 = i5;
                        i15 = i22;
                        str5 = str12;
                        str6 = str9;
                    } else {
                        String str13 = str11;
                        String strQ = baVar3.q();
                        str2 = str8;
                        if (strQ.equals(str10) || strQ.equals("_iap") || strQ.equals("ecommerce_purchase")) {
                            jaVar = jaVar2;
                            i11 = i17;
                            i12 = i18;
                        } else {
                            i12 = i18;
                            jaVar = jaVar2;
                            i11 = i17;
                            if (j4Var.e0().O(null, x.f13417f1) && strQ.equals("in_app_purchase")) {
                            }
                            if (baVar3.q().equals(b2.i(str9, b2.f12859f, b2.f12854a))) {
                                baVar3.r(str9);
                                j4Var.b().K().a("Renaming ad_impression to _ai");
                                if (Log.isLoggable(j4Var.b().N(), 5)) {
                                    for (int i23 = 0; i23 < baVar3.j(); i23++) {
                                        if ("ad_platform".equals(baVar3.k(i23).y()) && !baVar3.k(i23).A().isEmpty() && InneractiveMediationNameConsts.ADMOB.equalsIgnoreCase(baVar3.k(i23).A())) {
                                            j4Var.b().f13195k.a("AdMob ad impression logged from app. Potentially duplicative.");
                                        }
                                    }
                                }
                            }
                            eVarE0 = j4Var.e0();
                            wVar = x.f13417f1;
                            if (eVarE0.O(null, wVar) && baVar3.q().equals("in_app_purchase")) {
                                baVar3.r("_iap");
                                j4Var.b().K().a("Renaming in_app_purchase to _iap");
                            }
                            zT = j4Var.f0().T(((ka) x0Var.f13458b).x(), baVar3.q());
                            if (j4Var.e0().O(null, wVar) && "_iap".equals(baVar3.q())) {
                                zT = j4Var.y(baVar3);
                                String strX = ((ka) x0Var.f13458b).x();
                                if ("_iap".equals(baVar3.q())) {
                                    j4Var.L(baVar3, "value", strX);
                                    j4Var.L(baVar3, "price", strX);
                                }
                                if (!"_iap".equals(baVar3.q())) {
                                    ArrayList arrayList2 = new ArrayList(baVar3.i());
                                    int i24 = 0;
                                    while (true) {
                                        if (i24 >= arrayList2.size()) {
                                            ea eaVarJ = fa.J();
                                            eaVarJ.i("quantity");
                                            eaVarJ.k(1L);
                                            baVar3.m((fa) eaVarJ.f());
                                            break;
                                        }
                                        if ("quantity".equals(((fa) arrayList2.get(i24)).y())) {
                                            break;
                                        }
                                        i24++;
                                    }
                                }
                            }
                            if (zT) {
                                j4Var.j0();
                                String strQ2 = baVar3.q();
                                sg.w.e(strQ2);
                                if (strQ2.hashCode() == 95027 && strQ2.equals("_ui")) {
                                    boolean z15 = false;
                                    boolean z16 = false;
                                    for (int i25 = 0; i25 < baVar3.j(); i25++) {
                                        if ("_c".equals(baVar3.k(i25).y())) {
                                            ea eaVar = (ea) baVar3.k(i25).l();
                                            eaVar.k(1L);
                                            fa faVar = (fa) eaVar.f();
                                            baVar3.c();
                                            ((ca) baVar3.f32762b).O(i25, faVar);
                                            z15 = true;
                                        } else if ("_r".equals(baVar3.k(i25).y())) {
                                            ea eaVar2 = (ea) baVar3.k(i25).l();
                                            eaVar2.k(1L);
                                            fa faVar2 = (fa) eaVar2.f();
                                            baVar3.c();
                                            ((ca) baVar3.f32762b).O(i25, faVar2);
                                            z16 = true;
                                        }
                                    }
                                    if (z15 || !zT) {
                                        z12 = zT;
                                        str3 = str9;
                                        str4 = str10;
                                    } else {
                                        z12 = zT;
                                        j4Var.b().K().b(m1Var.m().a(baVar3.q()), "Marking event as conversion");
                                        ea eaVarJ2 = fa.J();
                                        eaVarJ2.i("_c");
                                        str3 = str9;
                                        str4 = str10;
                                        eaVarJ2.k(1L);
                                        baVar3.n(eaVarJ2);
                                    }
                                    if (!z16) {
                                        j4Var.b().K().b(m1Var.m().a(baVar3.q()), "Marking event as real-time");
                                        ea eaVarJ3 = fa.J();
                                        eaVarJ3.i("_r");
                                        eaVarJ3.k(1L);
                                        baVar3.n(eaVarJ3);
                                    }
                                    if (j4Var.g0().J0(j4Var.g(), ((ka) x0Var.f13458b).x(), false, true, false, false).f12961e > j4Var.e0().M(((ka) x0Var.f13458b).x(), x.f13435p)) {
                                        E(baVar3, "_r");
                                    } else {
                                        z14 = true;
                                    }
                                    if (p4.D0(baVar3.q()) && z12 && j4Var.g0().J0(j4Var.g(), ((ka) x0Var.f13458b).x(), true, false, false, false).f12959c > j4Var.e0().M(((ka) x0Var.f13458b).x(), x.o)) {
                                        j4Var.b().I().b(o0.L(((ka) x0Var.f13458b).x()), "Too many conversions. Not logging as conversion. appId");
                                        boolean z17 = false;
                                        ea eaVar3 = null;
                                        int i26 = -1;
                                        for (int i27 = 0; i27 < baVar3.j(); i27++) {
                                            fa faVarK = baVar3.k(i27);
                                            if ("_c".equals(faVarK.y())) {
                                                eaVar3 = (ea) faVarK.l();
                                                i26 = i27;
                                            } else if ("_err".equals(faVarK.y())) {
                                                z17 = true;
                                            }
                                        }
                                        if (z17) {
                                            if (eaVar3 != null) {
                                                baVar3.o(i26);
                                            } else {
                                                eaVar3 = null;
                                                if (eaVar3 == null) {
                                                }
                                            }
                                        } else if (eaVar3 == null) {
                                            ea eaVar4 = (ea) eaVar3.clone();
                                            eaVar4.i("_err");
                                            eaVar4.k(10L);
                                            fa faVar3 = (fa) eaVar4.f();
                                            baVar3.c();
                                            ((ca) baVar3.f32762b).O(i26, faVar3);
                                        } else {
                                            j4Var.b().H().b(o0.L(((ka) x0Var.f13458b).x()), "Did not find conversion parameter. appId");
                                        }
                                    }
                                } else {
                                    str3 = str9;
                                    str4 = str10;
                                    z12 = false;
                                }
                                if (z12) {
                                    j4Var.y(baVar3);
                                }
                                if ("_e".equals(baVar3.q())) {
                                    j4Var.j0();
                                    if (m4.N((ca) baVar3.f(), "_fr") != null) {
                                        jaVar2 = jaVar;
                                        i13 = i11;
                                        i14 = i12;
                                        i17 = i13;
                                    } else if (baVar2 == null || Math.abs(baVar2.t() - baVar3.t()) > 1000) {
                                        jaVar2 = jaVar;
                                        baVar = baVar3;
                                        i17 = i11;
                                        i18 = i5;
                                        if (j4Var.e0().O(null, x.f13414e1) && baVar3.y() && !baVar3.w()) {
                                            jK = j4Var.j0().K(baVar3.z());
                                            if (jK != 0) {
                                                baVar3.x(jK);
                                            }
                                            baVar3.c();
                                            ((ca) baVar3.f32762b).x(0L);
                                        }
                                        if (baVar3.j() == 0) {
                                            j4Var.j0();
                                            Bundle bundleM = m4.M(baVar3.i());
                                            int i28 = 0;
                                            while (i28 < baVar3.j()) {
                                                fa faVarK2 = baVar3.k(i28);
                                                String str14 = str13;
                                                if (!faVarK2.y().equals(str14) || faVarK2.H().isEmpty()) {
                                                    i16 = i28;
                                                    str7 = str3;
                                                    if (!faVarK2.y().equals(str14)) {
                                                        j4Var.x(baVar3.q(), (ea) faVarK2.l(), bundleM, ((ka) x0Var.f13458b).x());
                                                    }
                                                } else {
                                                    String strX2 = ((ka) x0Var.f13458b).x();
                                                    com.google.android.gms.internal.measurement.y1 y1VarH = faVarK2.H();
                                                    Bundle[] bundleArr = new Bundle[y1VarH.size()];
                                                    i16 = i28;
                                                    int i29 = 0;
                                                    while (i29 < y1VarH.size()) {
                                                        fa faVar4 = (fa) y1VarH.get(i29);
                                                        j4Var.j0();
                                                        Bundle bundleM2 = m4.M(faVar4.H());
                                                        Iterator it = faVar4.H().iterator();
                                                        while (it.hasNext()) {
                                                            j4Var.x(baVar3.q(), (ea) ((fa) it.next()).l(), bundleM2, strX2);
                                                            y1VarH = y1VarH;
                                                            str3 = str3;
                                                        }
                                                        bundleArr[i29] = bundleM2;
                                                        i29++;
                                                        y1VarH = y1VarH;
                                                        str3 = str3;
                                                    }
                                                    str7 = str3;
                                                    bundleM.putParcelableArray(str14, bundleArr);
                                                }
                                                i28 = i16 + 1;
                                                str3 = str7;
                                                str13 = str14;
                                            }
                                            str5 = str13;
                                            str6 = str3;
                                            baVar3.c();
                                            ((ca) baVar3.f32762b).R();
                                            m4 m4VarJ0 = j4Var.j0();
                                            ArrayList arrayList3 = new ArrayList();
                                            for (String str15 : bundleM.keySet()) {
                                                ea eaVarJ4 = fa.J();
                                                eaVarJ4.i(str15);
                                                Object obj = bundleM.get(str15);
                                                if (obj != null) {
                                                    m4VarJ0.b0(eaVarJ4, obj);
                                                    arrayList3.add((fa) eaVarJ4.f());
                                                }
                                            }
                                            Iterator it2 = arrayList3.iterator();
                                            while (it2.hasNext()) {
                                                baVar3.m((fa) it2.next());
                                            }
                                        } else {
                                            str5 = str13;
                                            str6 = str3;
                                        }
                                        i15 = i22;
                                        ((ArrayList) x0Var.f13460d).set(i15, (ca) baVar3.f());
                                        jaVar2.c0(baVar3);
                                        i21 = i5 + 1;
                                    } else {
                                        ba baVar4 = (ba) baVar2.clone();
                                        if (j4Var.K(baVar3, baVar4)) {
                                            jaVar2 = jaVar;
                                            int i31 = i11;
                                            jaVar2.b0(i31, baVar4);
                                            i17 = i31;
                                            i18 = i12;
                                            baVar = null;
                                            baVar2 = null;
                                        }
                                        if (j4Var.e0().O(null, x.f13414e1)) {
                                            jK = j4Var.j0().K(baVar3.z());
                                            if (jK != 0) {
                                            }
                                            baVar3.c();
                                            ((ca) baVar3.f32762b).x(0L);
                                        }
                                        if (baVar3.j() == 0) {
                                        }
                                        i15 = i22;
                                        ((ArrayList) x0Var.f13460d).set(i15, (ca) baVar3.f());
                                        jaVar2.c0(baVar3);
                                        i21 = i5 + 1;
                                    }
                                } else {
                                    jaVar2 = jaVar;
                                    i13 = i11;
                                    if ("_vs".equals(baVar3.q())) {
                                        j4Var.j0();
                                        if (m4.N((ca) baVar3.f(), "_et") == null) {
                                            if (baVar != null && Math.abs(baVar.t() - baVar3.t()) <= 1000) {
                                                ba baVar5 = (ba) baVar.clone();
                                                if (j4Var.K(baVar5, baVar3)) {
                                                    i14 = i12;
                                                    jaVar2.b0(i14, baVar5);
                                                    i17 = i13;
                                                    baVar = null;
                                                    baVar2 = null;
                                                }
                                            }
                                            i18 = i12;
                                            baVar2 = baVar3;
                                            i17 = i5;
                                            if (j4Var.e0().O(null, x.f13414e1)) {
                                            }
                                            if (baVar3.j() == 0) {
                                            }
                                            i15 = i22;
                                            ((ArrayList) x0Var.f13460d).set(i15, (ca) baVar3.f());
                                            jaVar2.c0(baVar3);
                                            i21 = i5 + 1;
                                        }
                                        i14 = i12;
                                        i17 = i13;
                                    } else {
                                        i14 = i12;
                                        if (("_f".equals(baVar3.q()) || "_v".equals(baVar3.q())) && ("_f".equals(baVar3.q()) || "_v".equals(baVar3.q()))) {
                                            int i32 = 0;
                                            while (true) {
                                                if (i32 >= baVar3.j()) {
                                                    break;
                                                }
                                                fa faVarK3 = baVar3.k(i32);
                                                if ("_elt".equals(faVarK3.y())) {
                                                    baVar3.v(faVarK3.C());
                                                    baVar3.o(i32);
                                                    break;
                                                }
                                                i32++;
                                            }
                                        }
                                        i17 = i13;
                                    }
                                }
                                i18 = i14;
                                if (j4Var.e0().O(null, x.f13414e1)) {
                                }
                                if (baVar3.j() == 0) {
                                }
                                i15 = i22;
                                ((ArrayList) x0Var.f13460d).set(i15, (ca) baVar3.f());
                                jaVar2.c0(baVar3);
                                i21 = i5 + 1;
                            }
                        }
                        ea eaVarJ5 = fa.J();
                        eaVarJ5.i("_ct");
                        if (!z13) {
                            String strX3 = ((ka) x0Var.f13458b).x();
                            String str16 = (j4Var.R(strX3, str10) && j4Var.R(strX3, "_iap") && j4Var.R(strX3, "ecommerce_purchase")) ? "new" : "returning";
                            eaVarJ5.j(str16);
                            baVar3.m((fa) eaVarJ5.f());
                            z13 = true;
                            if (baVar3.q().equals(b2.i(str9, b2.f12859f, b2.f12854a))) {
                            }
                            eVarE0 = j4Var.e0();
                            wVar = x.f13417f1;
                            if (eVarE0.O(null, wVar)) {
                                baVar3.r("_iap");
                                j4Var.b().K().a("Renaming in_app_purchase to _iap");
                            }
                            zT = j4Var.f0().T(((ka) x0Var.f13458b).x(), baVar3.q());
                            if (j4Var.e0().O(null, wVar)) {
                                zT = j4Var.y(baVar3);
                                String strX4 = ((ka) x0Var.f13458b).x();
                                if ("_iap".equals(baVar3.q())) {
                                }
                                if (!"_iap".equals(baVar3.q())) {
                                }
                            }
                            if (zT) {
                            }
                        }
                    }
                    i19 = i15 + 1;
                    str10 = str4;
                    str11 = str5;
                    l12 = l9;
                    str9 = str6;
                    str8 = str2;
                }
                int i33 = i5;
                int i34 = 0;
                long jLongValue = 0;
                while (i34 < i33) {
                    ca caVarC2 = ((ka) jaVar2.f32762b).c2(i34);
                    if ("_e".equals(caVarC2.C())) {
                        j4Var.j0();
                        if (m4.N(caVarC2, "_fr") != null) {
                            jaVar2.d0(i34);
                            i33--;
                            i34--;
                        } else {
                            j4Var.j0();
                            fa faVarN = m4.N(caVarC2, "_et");
                            if (faVarN != null) {
                                Long lValueOf = faVarN.B() ? Long.valueOf(faVarN.C()) : null;
                                if (lValueOf != null && lValueOf.longValue() > 0) {
                                    jLongValue += lValueOf.longValue();
                                }
                            }
                        }
                    }
                    i34++;
                }
                j4Var.J(jaVar2, jLongValue, false);
                Iterator it3 = jaVar2.Z().iterator();
                while (true) {
                    if (!it3.hasNext()) {
                        break;
                    }
                    if ("_s".equals(((ca) it3.next()).C())) {
                        j4Var.g0().x0(jaVar2.r(), "_se");
                        break;
                    }
                }
                if (m4.p0(jaVar2, "_sid") >= 0) {
                    j4Var.J(jaVar2, jLongValue, true);
                } else {
                    int iP0 = m4.p0(jaVar2, "_se");
                    if (iP0 >= 0) {
                        jaVar2.c();
                        ((ka) jaVar2.f32762b).m0(iP0);
                        j4Var.b().H().b(o0.L(((ka) x0Var.f13458b).x()), "Session engagement user property is in the bundle without session ID. appId");
                    }
                }
                String strX5 = ((ka) x0Var.f13458b).x();
                j4Var.c().D();
                j4Var.l0();
                t0 t0VarH02 = j4Var.g0().H0(strX5);
                if (t0VarH02 == null) {
                    j4Var.b().H().b(o0.L(strX5), "Cannot fix consent fields without appInfo. appId");
                } else {
                    j4Var.m(t0VarH02, jaVar2);
                }
                String strX6 = ((ka) x0Var.f13458b).x();
                j4Var.c().D();
                j4Var.l0();
                t0 t0VarH03 = j4Var.g0().H0(strX6);
                if (t0VarH03 == null) {
                    j4Var.b().I().b(o0.L(strX6), "Cannot populate ad_campaign_info without appInfo. appId");
                } else {
                    j4Var.n(t0VarH03, jaVar2);
                }
                jaVar2.c();
                ((ka) jaVar2.f32762b).p0(Long.MAX_VALUE);
                jaVar2.c();
                ((ka) jaVar2.f32762b).q0(Long.MIN_VALUE);
                for (int i35 = 0; i35 < jaVar2.a0(); i35++) {
                    ca caVarC22 = ((ka) jaVar2.f32762b).c2(i35);
                    if (caVarC22.E() < ((ka) jaVar2.f32762b).j2()) {
                        long jE = caVarC22.E();
                        jaVar2.c();
                        ((ka) jaVar2.f32762b).p0(jE);
                    }
                    if (caVarC22.E() > ((ka) jaVar2.f32762b).l2()) {
                        long jE2 = caVarC22.E();
                        jaVar2.c();
                        ((ka) jaVar2.f32762b).q0(jE2);
                    }
                }
                jaVar2.Q();
                a2 a2Var = a2.f12831c;
                a2 a2VarJ = j4Var.f(((ka) x0Var.f13458b).x()).j(a2.c(100, ((ka) x0Var.f13458b).C0()));
                a2 a2VarM0 = j4Var.g0().m0(((ka) x0Var.f13458b).x());
                j4Var.g0().l0(((ka) x0Var.f13458b).x(), a2VarJ);
                z1 z1Var = z1.ANALYTICS_STORAGE;
                if (!a2VarJ.i(z1Var) && a2VarM0.i(z1Var)) {
                    j4Var.g0().v0(((ka) x0Var.f13458b).x());
                } else if (a2VarJ.i(z1Var) && !a2VarM0.i(z1Var)) {
                    j4Var.g0().w0(((ka) x0Var.f13458b).x());
                }
                z1 z1Var2 = z1.AD_STORAGE;
                if (!a2VarJ.i(z1Var2)) {
                    jaVar2.c();
                    ((ka) jaVar2.f32762b).H1();
                    jaVar2.c();
                    ((ka) jaVar2.f32762b).J1();
                    jaVar2.c();
                    ((ka) jaVar2.f32762b).a1();
                }
                if (!a2VarJ.i(z1Var)) {
                    jaVar2.c();
                    ((ka) jaVar2.f32762b).L1();
                    jaVar2.c();
                    ((ka) jaVar2.f32762b).h1();
                }
                z4.a();
                if (j4Var.e0().O(((ka) x0Var.f13458b).x(), x.O0)) {
                    j4Var.k0();
                    if (p4.f0((String) x.f13438q0.a(null), ((ka) x0Var.f13458b).x()) && j4Var.f(((ka) x0Var.f13458b).x()).i(z1Var2) && ((ka) x0Var.f13458b).H0()) {
                        j4Var.w(jaVar2, x0Var);
                    }
                }
                jaVar2.c();
                ((ka) jaVar2.f32762b).T1();
                jaVar2.N(j4Var.i0().H(jaVar2.r(), jaVar2.Z(), Collections.unmodifiableList(((ka) jaVar2.f32762b).d2()), Long.valueOf(((ka) jaVar2.f32762b).j2()), Long.valueOf(((ka) jaVar2.f32762b).l2()), !a2VarJ.i(z1Var)));
                if (j4Var.e0().F(((ka) x0Var.f13458b).x())) {
                    HashMap map = new HashMap();
                    ArrayList arrayList4 = new ArrayList();
                    SecureRandom secureRandomC0 = j4Var.k0().C0();
                    int i36 = 0;
                    while (i36 < jaVar2.a0()) {
                        ba baVar6 = (ba) ((ka) jaVar2.f32762b).c2(i36).l();
                        if (baVar6.q().equals("_ep")) {
                            j4Var.j0();
                            String str17 = (String) m4.P((ca) baVar6.f(), "_en");
                            q qVarD0 = (q) map.get(str17);
                            if (qVarD0 == null) {
                                l lVarG0 = j4Var.g0();
                                String strX7 = ((ka) x0Var.f13458b).x();
                                sg.w.h(str17);
                                qVarD0 = lVarG0.d0(DatabaseConstants.EVENT_TABLE_NAME, strX7, str17);
                                if (qVarD0 != null) {
                                    map.put(str17, qVarD0);
                                }
                            }
                            if (qVarD0 == null || qVarD0.f13253i != null) {
                                l11 = l9;
                            } else {
                                Long l13 = qVarD0.f13254j;
                                if (l13 != null && l13.longValue() > 1) {
                                    j4Var.j0();
                                    m4.L(baVar6, "_sr", l13);
                                }
                                Boolean bool = qVarD0.f13255k;
                                if (bool == null || !bool.booleanValue()) {
                                    l11 = l9;
                                } else {
                                    j4Var.j0();
                                    l11 = l9;
                                    m4.L(baVar6, "_efs", l11);
                                }
                                arrayList4.add((ca) baVar6.f());
                            }
                            jaVar2.b0(i36, baVar6);
                        } else {
                            l11 = l9;
                            g1 g1VarF0 = j4Var.f0();
                            String strX8 = ((ka) x0Var.f13458b).x();
                            String strF = g1VarF0.f(strX8, "measurement.account.time_zone_offset_minutes");
                            if (TextUtils.isEmpty(strF)) {
                                j12 = 0;
                                j4Var.k0();
                                long j14 = j12 * 60000;
                                long jT = (baVar6.t() + j14) / 86400000;
                                ca caVar = (ca) baVar6.f();
                                if (TextUtils.isEmpty("_dbg")) {
                                }
                            } else {
                                try {
                                    j12 = Long.parseLong(strF);
                                } catch (NumberFormatException e3) {
                                    ((m1) g1VarF0.f13368a).b().I().c(o0.L(strX8), "Unable to parse timezone offset. appId", e3);
                                }
                                j4Var.k0();
                                long j142 = j12 * 60000;
                                long jT2 = (baVar6.t() + j142) / 86400000;
                                ca caVar2 = (ca) baVar6.f();
                                if (TextUtils.isEmpty("_dbg")) {
                                    for (fa faVar5 : caVar2.z()) {
                                        j13 = j142;
                                        if (!"_dbg".equals(faVar5.y())) {
                                            j142 = j13;
                                        } else if (l11.equals(Long.valueOf(faVar5.C()))) {
                                            iV = 1;
                                            if (iV > 0) {
                                            }
                                        } else {
                                            iV = f0().V(((ka) x0Var.f13458b).x(), baVar6.q());
                                            if (iV > 0) {
                                                b().I().c(baVar6.q(), "Sample rate must be positive. event, rate", Integer.valueOf(iV));
                                                arrayList4.add((ca) baVar6.f());
                                                jaVar2.b0(i36, baVar6);
                                            } else {
                                                q qVarB = (q) map.get(baVar6.q());
                                                if (qVarB == null && (qVarB = g0().d0(DatabaseConstants.EVENT_TABLE_NAME, ((ka) x0Var.f13458b).x(), baVar6.q())) == null) {
                                                    b().I().c(((ka) x0Var.f13458b).x(), "Event being bundled has no eventAggregate. appId, eventName", baVar6.q());
                                                    qVarB = new q(((ka) x0Var.f13458b).x(), baVar6.q(), 1L, 1L, 1L, baVar6.t(), 0L, null, null, null, null);
                                                }
                                                j0();
                                                Long l14 = (Long) m4.P((ca) baVar6.f(), "_eid");
                                                boolean z18 = l14 != null;
                                                if (iV == 1) {
                                                    arrayList4.add((ca) baVar6.f());
                                                    if (z18 && (qVarB.f13253i != null || qVarB.f13254j != null || qVarB.f13255k != null)) {
                                                        map.put(baVar6.q(), qVarB.b(null, null, null));
                                                    }
                                                    jaVar2.b0(i36, baVar6);
                                                } else {
                                                    if (secureRandomC0.nextInt(iV) == 0) {
                                                        j0();
                                                        Long lValueOf2 = Long.valueOf(iV);
                                                        m4.L(baVar6, "_sr", lValueOf2);
                                                        arrayList4.add((ca) baVar6.f());
                                                        if (z18) {
                                                            qVarB = qVarB.b(null, null, lValueOf2);
                                                        }
                                                        map.put(baVar6.q(), new q(qVarB.f13245a, qVarB.f13246b, qVarB.f13247c, qVarB.f13248d, qVarB.f13249e, qVarB.f13250f, baVar6.t(), Long.valueOf(jT2), qVarB.f13253i, qVarB.f13254j, qVarB.f13255k));
                                                        l9 = l11;
                                                    } else {
                                                        Long l15 = qVarB.f13252h;
                                                        if (l15 != null) {
                                                            jU = l15.longValue();
                                                        } else {
                                                            k0();
                                                            jU = (j13 + baVar6.u()) / 86400000;
                                                        }
                                                        if (jU != jT2) {
                                                            j0();
                                                            m4.L(baVar6, "_efs", l11);
                                                            j0();
                                                            Long lValueOf3 = Long.valueOf(iV);
                                                            m4.L(baVar6, "_sr", lValueOf3);
                                                            arrayList4.add((ca) baVar6.f());
                                                            if (z18) {
                                                                qVarB = qVarB.b(Boolean.TRUE, null, lValueOf3);
                                                            }
                                                            l9 = l11;
                                                            map.put(baVar6.q(), new q(qVarB.f13245a, qVarB.f13246b, qVarB.f13247c, qVarB.f13248d, qVarB.f13249e, qVarB.f13250f, baVar6.t(), Long.valueOf(jT2), qVarB.f13253i, qVarB.f13254j, qVarB.f13255k));
                                                        } else {
                                                            l9 = l11;
                                                            if (z18) {
                                                                map.put(baVar6.q(), qVarB.b(null, l14, null));
                                                            }
                                                            jaVar2.b0(i36, baVar6);
                                                        }
                                                    }
                                                    jaVar2.b0(i36, baVar6);
                                                }
                                            }
                                        }
                                    }
                                    j13 = j142;
                                    iV = f0().V(((ka) x0Var.f13458b).x(), baVar6.q());
                                    if (iV > 0) {
                                    }
                                } else {
                                    j13 = j142;
                                    iV = f0().V(((ka) x0Var.f13458b).x(), baVar6.q());
                                    if (iV > 0) {
                                    }
                                }
                            }
                            i36++;
                            j4Var = this;
                        }
                        l9 = l11;
                        i36++;
                        j4Var = this;
                    }
                    if (arrayList4.size() < jaVar2.a0()) {
                        jaVar2.c();
                        ((ka) jaVar2.f32762b).i0();
                        jaVar2.c();
                        ((ka) jaVar2.f32762b).h0(arrayList4);
                    }
                    Iterator it4 = map.entrySet().iterator();
                    while (it4.hasNext()) {
                        g0().e0(DatabaseConstants.EVENT_TABLE_NAME, (q) ((Map.Entry) it4.next()).getValue());
                    }
                }
                String strX9 = ((ka) x0Var.f13458b).x();
                t0 t0VarH04 = g0().H0(strX9);
                if (t0VarH04 == null) {
                    b().H().b(o0.L(((ka) x0Var.f13458b).x()), "Bundling raw events w/o app info. appId");
                } else if (jaVar2.a0() > 0) {
                    k1 k1Var = t0VarH04.f13310a.f13139g;
                    m1.l(k1Var);
                    k1Var.D();
                    long j15 = t0VarH04.f13318i;
                    if (j15 != 0) {
                        jaVar2.i(j15);
                    } else {
                        jaVar2.j();
                    }
                    k1 k1Var2 = t0VarH04.f13310a.f13139g;
                    m1.l(k1Var2);
                    k1Var2.D();
                    long j16 = t0VarH04.f13317h;
                    if (j16 != 0) {
                        j15 = j16;
                    }
                    if (j15 != 0) {
                        jaVar2.g0(j15);
                    } else {
                        jaVar2.h0();
                    }
                    t0VarH04.h(jaVar2.a0());
                    k1 k1Var3 = t0VarH04.f13310a.f13139g;
                    m1.l(k1Var3);
                    k1Var3.D();
                    int i37 = (int) t0VarH04.F;
                    jaVar2.c();
                    ((ka) jaVar2.f32762b).r1(i37);
                    k1 k1Var4 = t0VarH04.f13310a.f13139g;
                    m1.l(k1Var4);
                    k1Var4.D();
                    jaVar2.B((int) t0VarH04.f13316g);
                    t0VarH04.M(((ka) jaVar2.f32762b).j2());
                    t0VarH04.N(((ka) jaVar2.f32762b).l2());
                    String strV = t0VarH04.v();
                    if (strV != null) {
                        jaVar2.J(strV);
                    } else {
                        jaVar2.K();
                    }
                    g0().I0(t0VarH04, false);
                }
                if (jaVar2.a0() > 0) {
                    m1Var.getClass();
                    if (e0().O(((ka) x0Var.f13458b).x(), x.f13426j1)) {
                        String strR = jaVar2.r();
                        if (!TextUtils.isEmpty(strR) && (t0VarH0 = g0().H0(strR)) != null) {
                            e().getClass();
                            long jCurrentTimeMillis = System.currentTimeMillis();
                            k1 k1Var5 = t0VarH0.f13310a.f13139g;
                            m1.l(k1Var5);
                            k1Var5.D();
                            if (jCurrentTimeMillis - t0VarH0.J >= e0().L(strR, x.B0)) {
                                List listK0 = g0().k0(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                                if (!listK0.isEmpty()) {
                                    jaVar2.c();
                                    ((ka) jaVar2.f32762b).a2(listK0);
                                }
                                List listK02 = g0().k0(strR);
                                if (!listK02.isEmpty()) {
                                    jaVar2.c();
                                    ((ka) jaVar2.f32762b).a2(listK02);
                                }
                                t0VarH0.u(jCurrentTimeMillis);
                                g0().I0(t0VarH0, false);
                            }
                        }
                    }
                    g9 g9VarP = f0().P(((ka) x0Var.f13458b).x());
                    if (g9VarP != null && g9VarP.x()) {
                        long jY = g9VarP.y();
                        jaVar2.c();
                        ((ka) jaVar2.f32762b).Y0(jY);
                    } else if (((ka) x0Var.f13458b).M().isEmpty()) {
                        jaVar2.c();
                        ((ka) jaVar2.f32762b).Y0(-1L);
                    } else {
                        b().I().b(o0.L(((ka) x0Var.f13458b).x()), "Did not find measurement config or missing version info. appId");
                    }
                    g0().M0((ka) jaVar2.f(), z14);
                }
                g0().T((ArrayList) x0Var.f13459c);
                l lVarG02 = g0();
                try {
                    lVarG02.u0().execSQL("delete from raw_events_metadata where app_id=? and metadata_fingerprint not in (select distinct metadata_fingerprint from raw_events where app_id=?)", new String[]{strX9, strX9});
                } catch (SQLiteException e11) {
                    ((m1) lVarG02.f13368a).b().H().c(o0.L(strX9), "Failed to remove unused event metadata. appId", e11);
                }
                g0().s0();
                z11 = true;
            }
            g0().t0();
            return z11;
        } catch (Throwable th2) {
            g0().t0();
            throw th2;
        }
    }

    public final void J(ja jaVar, long j11, boolean z11) {
        n4 n4Var;
        Object obj;
        String str = true != z11 ? "_lte" : "_se";
        l lVar = this.f13041c;
        T(lVar);
        n4 n4VarZ0 = lVar.z0(jaVar.r(), str);
        if (n4VarZ0 == null || (obj = n4VarZ0.f13184e) == null) {
            String strR = jaVar.r();
            e().getClass();
            n4Var = new n4(strR, TTConst.TRACK_TYPE_AUTO, System.currentTimeMillis(), str, Long.valueOf(j11));
        } else {
            String strR2 = jaVar.r();
            e().getClass();
            n4Var = new n4(strR2, TTConst.TRACK_TYPE_AUTO, System.currentTimeMillis(), str, Long.valueOf(((Long) obj).longValue() + j11));
        }
        sa saVarI = ta.I();
        saVarI.c();
        ((ta) saVarI.f32762b).K(str);
        e().getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        saVarI.c();
        ((ta) saVarI.f32762b).J(jCurrentTimeMillis);
        Object obj2 = n4Var.f13184e;
        long jLongValue = ((Long) obj2).longValue();
        saVarI.c();
        ((ta) saVarI.f32762b).N(jLongValue);
        ta taVar = (ta) saVarI.f();
        int iP0 = m4.p0(jaVar, str);
        if (iP0 >= 0) {
            jaVar.c();
            ((ka) jaVar.f32762b).k0(iP0, taVar);
        } else {
            jaVar.c();
            ((ka) jaVar.f32762b).l0(taVar);
        }
        if (j11 > 0) {
            l lVar2 = this.f13041c;
            T(lVar2);
            lVar2.y0(n4Var);
            b().n.c(true != z11 ? "lifetime" : "session-scoped", "Updated engagement user property. scope, value", obj2);
        }
    }

    public final boolean K(ba baVar, ba baVar2) {
        sg.w.c("_e".equals(baVar.q()));
        j0();
        fa faVarN = m4.N((ca) baVar.f(), "_sc");
        String strA = faVarN == null ? null : faVarN.A();
        j0();
        fa faVarN2 = m4.N((ca) baVar2.f(), "_pc");
        String strA2 = faVarN2 != null ? faVarN2.A() : null;
        if (strA2 == null || !strA2.equals(strA)) {
            return false;
        }
        sg.w.c("_e".equals(baVar.q()));
        j0();
        fa faVarN3 = m4.N((ca) baVar.f(), "_et");
        if (faVarN3 == null || !faVarN3.B() || faVarN3.C() <= 0) {
            return true;
        }
        long jC = faVarN3.C();
        j0();
        fa faVarN4 = m4.N((ca) baVar2.f(), "_et");
        if (faVarN4 != null && faVarN4.C() > 0) {
            jC += faVarN4.C();
        }
        j0();
        m4.L(baVar2, "_et", Long.valueOf(jC));
        j0();
        m4.L(baVar, "_fr", 1L);
        return true;
    }

    public final void L(ba baVar, String str, String str2) {
        ArrayList arrayList = new ArrayList(baVar.i());
        int i5 = 0;
        while (true) {
            if (i5 >= arrayList.size()) {
                i5 = -1;
                break;
            } else if (str.equals(((fa) arrayList.get(i5)).y())) {
                break;
            } else {
                i5++;
            }
        }
        if (i5 == -1) {
            return;
        }
        double dG = baVar.k(i5).G() * 1000000.0d;
        if (dG == 0.0d) {
            dG = baVar.k(i5).C() * 1000000.0d;
        }
        if (dG > 9.223372036854776E18d || dG < -9.223372036854776E18d) {
            b().f13193i.c(o0.L(str2), b.c0.l("Data lost. Purchase ", str, " is too big. appId"), Double.valueOf(dG));
            return;
        }
        baVar.o(i5);
        ea eaVarJ = fa.J();
        eaVarJ.i(str);
        eaVarJ.k(Math.round(dG));
        baVar.m((fa) eaVarJ.f());
    }

    public final boolean M() {
        c().D();
        l0();
        l lVar = this.f13041c;
        T(lVar);
        if (lVar.Z("select count(1) > 0 from raw_events", null) != 0) {
            return true;
        }
        l lVar2 = this.f13041c;
        T(lVar2);
        return !TextUtils.isEmpty(lVar2.L());
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x01b7  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x01d2  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0327  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void N() {
        boolean z11;
        long jMax;
        long jMax2;
        int i5;
        Integer num;
        int iIntValue;
        m4 m4Var = this.f13045g;
        c().D();
        l0();
        if (this.o > 0) {
            e().getClass();
            long jAbs = 3600000 - Math.abs(SystemClock.elapsedRealtime() - this.o);
            if (jAbs > 0) {
                b().n.b(Long.valueOf(jAbs), "Upload has been suspended. Will update scheduling later in approximately ms");
                h0().a();
                b4 b4Var = this.f13043e;
                T(b4Var);
                b4Var.I();
                return;
            }
            this.o = 0L;
        }
        if (!this.f13050l.h() || !M()) {
            b().n.a("Nothing to upload or uploading impossible");
            h0().a();
            b4 b4Var2 = this.f13043e;
            T(b4Var2);
            b4Var2.I();
            return;
        }
        e().getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        e0();
        long jMax3 = Math.max(0L, ((Long) x.O.a(null)).longValue());
        l lVar = this.f13041c;
        T(lVar);
        if (lVar.Z("select count(1) > 0 from raw_events where realtime = 1", null) != 0) {
            z11 = true;
        } else {
            l lVar2 = this.f13041c;
            T(lVar2);
            if (lVar2.Z("select count(1) > 0 from queue where has_realtime = 1", null) == 0) {
                z11 = false;
            }
        }
        if (z11) {
            String strH = e0().H("debug.firebase.analytics.app");
            if (TextUtils.isEmpty(strH) || ".none.".equals(strH)) {
                e0();
                jMax = Math.max(0L, ((Long) x.I.a(null)).longValue());
            } else {
                e0();
                jMax = Math.max(0L, ((Long) x.J.a(null)).longValue());
            }
        } else {
            e0();
            jMax = Math.max(0L, ((Long) x.H.a(null)).longValue());
        }
        long jF = this.f13047i.f13286h.f();
        long jF2 = this.f13047i.f13287i.f();
        l lVar3 = this.f13041c;
        T(lVar3);
        long jA0 = lVar3.a0("select max(bundle_end_timestamp) from queue", null, 0L);
        l lVar4 = this.f13041c;
        T(lVar4);
        long jMax4 = Math.max(jA0, lVar4.a0("select max(timestamp) from raw_events", null, 0L));
        if (jMax4 != 0) {
            long jAbs2 = jCurrentTimeMillis - Math.abs(jMax4 - jCurrentTimeMillis);
            long jAbs3 = jCurrentTimeMillis - Math.abs(jF - jCurrentTimeMillis);
            long jAbs4 = jCurrentTimeMillis - Math.abs(jF2 - jCurrentTimeMillis);
            long jMin = jMax3 + jAbs2;
            long jMax5 = Math.max(jAbs3, jAbs4);
            if (z11 && jMax5 > 0) {
                jMin = Math.min(jAbs2, jMax5) + jMax;
            }
            T(m4Var);
            jMax2 = !m4Var.l0(jMax5, jMax) ? jMax5 + jMax : jMin;
            if (jAbs4 != 0 && jAbs4 >= jAbs2) {
                int i11 = 0;
                while (true) {
                    e0();
                    i5 = 0;
                    if (i11 >= Math.min(20, Math.max(0, ((Integer) x.Q.a(null)).intValue()))) {
                        jMax2 = 0;
                        break;
                    }
                    e0();
                    jMax2 += Math.max(0L, ((Long) x.P.a(null)).longValue()) * (1 << i11);
                    if (jMax2 > jAbs4) {
                        break;
                    } else {
                        i11++;
                    }
                }
            }
            if (jMax2 != 0) {
                b().n.a("Next upload time is 0");
                h0().a();
                b4 b4Var3 = this.f13043e;
                T(b4Var3);
                b4Var3.I();
                return;
            }
            s0 s0Var = this.f13040b;
            T(s0Var);
            if (!s0Var.H()) {
                b().n.a("No network");
                u0 u0VarH0 = h0();
                j4 j4Var = u0VarH0.f13365a;
                j4Var.l0();
                j4Var.c().D();
                if (!u0VarH0.f13366b) {
                    j4Var.f13050l.f13133a.registerReceiver(u0VarH0, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
                    s0 s0Var2 = j4Var.f13040b;
                    T(s0Var2);
                    u0VarH0.f13367c = s0Var2.H();
                    j4Var.b().n.b(Boolean.valueOf(u0VarH0.f13367c), "Registering connectivity change receiver. Network connected");
                    u0VarH0.f13366b = true;
                }
                b4 b4Var4 = this.f13043e;
                T(b4Var4);
                b4Var4.I();
                return;
            }
            long jF3 = this.f13047i.f13285g.f();
            e0();
            long jMax6 = Math.max(0L, ((Long) x.G.a(null)).longValue());
            T(m4Var);
            if (!m4Var.l0(jF3, jMax6)) {
                jMax2 = Math.max(jMax2, jF3 + jMax6);
            }
            h0().a();
            e().getClass();
            long jCurrentTimeMillis2 = jMax2 - System.currentTimeMillis();
            if (jCurrentTimeMillis2 <= 0) {
                e0();
                jCurrentTimeMillis2 = Math.max(0L, ((Long) x.K.a(null)).longValue());
                w0 w0Var = this.f13047i.f13286h;
                e().getClass();
                w0Var.g(System.currentTimeMillis());
            }
            b().n.b(Long.valueOf(jCurrentTimeMillis2), "Upload scheduled in approximately ms");
            b4 b4Var5 = this.f13043e;
            T(b4Var5);
            b4Var5.E();
            m1 m1Var = (m1) b4Var5.f13368a;
            m1Var.getClass();
            o0 o0Var = m1Var.f13138f;
            Context context = m1Var.f13133a;
            if (!p4.y0(context)) {
                m1.l(o0Var);
                o0Var.f13197m.a("Receiver not registered/enabled");
            }
            if (!p4.Y(context)) {
                m1.l(o0Var);
                o0Var.f13197m.a("Service not registered/enabled");
            }
            b4Var5.I();
            m1.l(o0Var);
            o0Var.n.b(Long.valueOf(jCurrentTimeMillis2), "Scheduling upload, millis");
            m1Var.f13143k.getClass();
            SystemClock.elapsedRealtime();
            if (jCurrentTimeMillis2 < Math.max(0L, ((Long) x.L.a(null)).longValue()) && b4Var5.H().f13128c == 0) {
                b4Var5.H().b(jCurrentTimeMillis2);
            }
            ComponentName componentName = new ComponentName(context, "com.google.android.gms.measurement.AppMeasurementJobService");
            int iK = b4Var5.K();
            PersistableBundle persistableBundle = new PersistableBundle();
            persistableBundle.putString("action", "com.google.android.gms.measurement.UPLOAD");
            JobInfo jobInfoBuild = new JobInfo.Builder(iK, componentName).setMinimumLatency(jCurrentTimeMillis2).setOverrideDeadline(jCurrentTimeMillis2 + jCurrentTimeMillis2).setExtras(persistableBundle).build();
            Method method = y6.f33250a;
            JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
            jobScheduler.getClass();
            Method method2 = y6.f33250a;
            if (method2 == null || context.checkSelfPermission("android.permission.UPDATE_DEVICE_STATS") != 0) {
                jobScheduler.schedule(jobInfoBuild);
                return;
            }
            Method method3 = y6.f33251b;
            if (method3 != null) {
                try {
                    num = (Integer) method3.invoke(UserHandle.class, null);
                } catch (IllegalAccessException | InvocationTargetException e3) {
                    if (Log.isLoggable("JobSchedulerCompat", 6)) {
                        Log.e("JobSchedulerCompat", "myUserId invocation illegal", e3);
                    }
                }
                iIntValue = num != null ? num.intValue() : i5;
            }
            try {
                return;
            } catch (IllegalAccessException | InvocationTargetException e11) {
                Log.e("UploadAlarm", "error calling scheduleAsPackage", e11);
                jobScheduler.schedule(jobInfoBuild);
                return;
            }
        }
        jMax2 = 0;
        i5 = 0;
        if (jMax2 != 0) {
        }
    }

    public final void O() {
        c().D();
        if (this.f13056t || this.f13057u || this.f13058v) {
            b().n.d("Not stopping services. fetch, network, upload", Boolean.valueOf(this.f13056t), Boolean.valueOf(this.f13057u), Boolean.valueOf(this.f13058v));
            return;
        }
        b().n.a("Stopping uploading service(s)");
        ArrayList arrayList = this.f13052p;
        if (arrayList == null) {
            return;
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            ((Runnable) it.next()).run();
        }
        ArrayList arrayList2 = this.f13052p;
        sg.w.h(arrayList2);
        arrayList2.clear();
    }

    public final Boolean P(t0 t0Var) {
        try {
            long jQ = t0Var.Q();
            m1 m1Var = this.f13050l;
            if (jQ != -2147483648L) {
                if (t0Var.Q() == zg.b.a(m1Var.f13133a).c(0, t0Var.E()).versionCode) {
                    return Boolean.TRUE;
                }
            } else {
                String str = zg.b.a(m1Var.f13133a).c(0, t0Var.E()).versionName;
                String strO = t0Var.O();
                if (strO != null && strO.equals(str)) {
                    return Boolean.TRUE;
                }
            }
            return Boolean.FALSE;
        } catch (PackageManager.NameNotFoundException unused) {
            return null;
        }
    }

    public final zzr Q(String str) {
        l lVar = this.f13041c;
        T(lVar);
        t0 t0VarH0 = lVar.H0(str);
        if (t0VarH0 != null) {
            m1 m1Var = t0VarH0.f13310a;
            if (!TextUtils.isEmpty(t0VarH0.O())) {
                Boolean boolP = P(t0VarH0);
                if (boolP != null && !boolP.booleanValue()) {
                    b().f13190f.b(o0.L(str), "App version does not match; dropping. appId");
                    return null;
                }
                String strH = t0VarH0.H();
                String strO = t0VarH0.O();
                long jQ = t0VarH0.Q();
                k1 k1Var = m1Var.f13139g;
                m1.l(k1Var);
                k1Var.D();
                String str2 = t0VarH0.f13321l;
                k1 k1Var2 = m1Var.f13139g;
                m1.l(k1Var2);
                k1Var2.D();
                long j11 = t0VarH0.f13322m;
                k1 k1Var3 = m1Var.f13139g;
                m1.l(k1Var3);
                k1Var3.D();
                long j12 = t0VarH0.n;
                k1 k1Var4 = m1Var.f13139g;
                m1.l(k1Var4);
                k1Var4.D();
                boolean z11 = t0VarH0.o;
                String strK = t0VarH0.K();
                k1 k1Var5 = m1Var.f13139g;
                m1.l(k1Var5);
                k1Var5.D();
                boolean z12 = t0VarH0.f13323p;
                Boolean boolX = t0VarH0.x();
                long jB = t0VarH0.b();
                k1 k1Var6 = m1Var.f13139g;
                m1.l(k1Var6);
                k1Var6.D();
                ArrayList arrayList = t0VarH0.f13326s;
                String strG = f(str).g();
                boolean z13 = t0VarH0.z();
                k1 k1Var7 = m1Var.f13139g;
                m1.l(k1Var7);
                k1Var7.D();
                long j13 = t0VarH0.f13329v;
                int i5 = f(str).f12833b;
                String str3 = o0(str).f13167b;
                k1 k1Var8 = m1Var.f13139g;
                m1.l(k1Var8);
                k1Var8.D();
                int i11 = t0VarH0.f13331x;
                k1 k1Var9 = m1Var.f13139g;
                m1.l(k1Var9);
                k1Var9.D();
                return new zzr(str, strH, strO, jQ, str2, j11, j12, (String) null, z11, false, strK, 0L, 0, z12, false, boolX, jB, (List) arrayList, strG, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (String) null, z13, j13, i5, str3, i11, t0VarH0.B, t0VarH0.D(), t0VarH0.s(), 0L, t0VarH0.t(), 0L);
            }
        }
        b().f13197m.b(str, "No app data available; dropping");
        return null;
    }

    public final boolean R(String str, String str2) {
        l lVar = this.f13041c;
        T(lVar);
        q qVarD0 = lVar.d0(DatabaseConstants.EVENT_TABLE_NAME, str, str2);
        return qVarD0 == null || qVarD0.f13247c < 1;
    }

    public final void V() {
        c().D();
        l0();
        if (this.n) {
            return;
        }
        this.n = true;
        c().D();
        FileLock fileLock = this.f13059w;
        m1 m1Var = this.f13050l;
        if (fileLock == null || !fileLock.isValid()) {
            ((m1) this.f13041c.f13368a).getClass();
            try {
                FileChannel channel = new RandomAccessFile(new File(new File(m1Var.f13133a.getFilesDir(), "google_app_measurement.db").getPath()), "rw").getChannel();
                this.f13060x = channel;
                FileLock fileLockTryLock = channel.tryLock();
                this.f13059w = fileLockTryLock;
                if (fileLockTryLock == null) {
                    b().f13190f.a("Storage concurrent data access panic");
                    return;
                }
                b().n.a("Storage concurrent access okay");
            } catch (FileNotFoundException e3) {
                b().f13190f.b(e3, "Failed to acquire storage lock");
                return;
            } catch (IOException e11) {
                b().f13190f.b(e11, "Failed to access storage lock file");
                return;
            } catch (OverlappingFileLockException e12) {
                b().f13193i.b(e12, "Storage lock already acquired");
                return;
            }
        } else {
            b().n.a("Storage concurrent access okay");
        }
        FileChannel fileChannel = this.f13060x;
        c().D();
        int i5 = 0;
        if (fileChannel == null || !fileChannel.isOpen()) {
            b().f13190f.a("Bad channel to read from");
        } else {
            ByteBuffer byteBufferAllocate = ByteBuffer.allocate(4);
            try {
                fileChannel.position(0L);
                int i11 = fileChannel.read(byteBufferAllocate);
                if (i11 == 4) {
                    byteBufferAllocate.flip();
                    i5 = byteBufferAllocate.getInt();
                } else if (i11 != -1) {
                    b().f13193i.b(Integer.valueOf(i11), "Unexpected data length. Bytes read");
                }
            } catch (IOException e13) {
                b().f13190f.b(e13, "Failed to read from channel");
            }
        }
        f0 f0VarQ = m1Var.q();
        f0VarQ.E();
        int i12 = f0VarQ.f12931e;
        c().D();
        if (i5 > i12) {
            b().f13190f.c(Integer.valueOf(i5), "Panic: can't downgrade version. Previous, current version", Integer.valueOf(i12));
            return;
        }
        if (i5 < i12) {
            FileChannel fileChannel2 = this.f13060x;
            c().D();
            if (fileChannel2 == null || !fileChannel2.isOpen()) {
                b().f13190f.a("Bad channel to read from");
            } else {
                ByteBuffer byteBufferAllocate2 = ByteBuffer.allocate(4);
                byteBufferAllocate2.putInt(i12);
                byteBufferAllocate2.flip();
                try {
                    fileChannel2.truncate(0L);
                    fileChannel2.write(byteBufferAllocate2);
                    fileChannel2.force(true);
                    if (fileChannel2.size() != 4) {
                        b().f13190f.b(Long.valueOf(fileChannel2.size()), "Error writing to channel. Bytes written");
                    }
                    b().n.c(Integer.valueOf(i5), "Storage version upgraded. Previous, current version", Integer.valueOf(i12));
                    return;
                } catch (IOException e14) {
                    b().f13190f.b(e14, "Failed to write to channel");
                }
            }
            b().f13190f.c(Integer.valueOf(i5), "Storage version upgrade failed. Previous, current version", Integer.valueOf(i12));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x00cf  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void W(zzpl zzplVar, zzr zzrVar) {
        String str;
        long jLongValue;
        c().D();
        l0();
        boolean zS = S(zzrVar);
        String str2 = zzrVar.f33792f;
        if (zS) {
            if (!zzrVar.f33799m) {
                c0(zzrVar);
                return;
            }
            p4 p4VarK0 = k0();
            String str3 = zzplVar.f33786g;
            int iM0 = p4VarK0.M0(str3);
            g4 g4Var = this.J;
            if (iM0 != 0) {
                k0();
                e0();
                String strK = p4.K(24, str3, true);
                int length = str3 != null ? str3.length() : 0;
                k0();
                p4.V(g4Var, zzrVar.f33792f, iM0, "_ev", strK, length);
                return;
            }
            int iS = k0().S(zzplVar.zza(), str3);
            if (iS != 0) {
                k0();
                e0();
                String strK2 = p4.K(24, str3, true);
                Object objZza = zzplVar.zza();
                int length2 = (objZza == null || !((objZza instanceof String) || (objZza instanceof CharSequence))) ? 0 : objZza.toString().length();
                k0();
                p4.V(g4Var, zzrVar.f33792f, iS, "_ev", strK2, length2);
                return;
            }
            Object objT = k0().T(zzplVar.zza(), str3);
            if (objT != null) {
                if ("_sid".equals(str3)) {
                    long j11 = zzplVar.f33787h;
                    String str4 = zzplVar.f33790k;
                    sg.w.h(str2);
                    l lVar = this.f13041c;
                    T(lVar);
                    n4 n4VarZ0 = lVar.z0(str2, "_sno");
                    if (n4VarZ0 != null) {
                        Object obj = n4VarZ0.f13184e;
                        if (obj instanceof Long) {
                            jLongValue = ((Long) obj).longValue();
                            str = str4;
                        } else {
                            if (n4VarZ0 != null) {
                                b().f13193i.b(n4VarZ0.f13184e, "Retrieved last session number from database does not contain a valid (long) value");
                            }
                            l lVar2 = this.f13041c;
                            T(lVar2);
                            q qVarD0 = lVar2.d0(DatabaseConstants.EVENT_TABLE_NAME, str2, "_s");
                            if (qVarD0 != null) {
                                m0 m0Var = b().n;
                                long j12 = qVarD0.f13247c;
                                str = str4;
                                m0Var.b(Long.valueOf(j12), "Backfill the session number. Last used session number");
                                jLongValue = j12;
                            } else {
                                str = str4;
                                jLongValue = 0;
                            }
                        }
                        W(new zzpl(j11, Long.valueOf(jLongValue + 1), "_sno", str), zzrVar);
                    }
                }
                sg.w.h(str2);
                String str5 = zzplVar.f33790k;
                sg.w.h(str5);
                n4 n4Var = new n4(str2, str5, zzplVar.f33787h, str3, objT);
                m0 m0Var2 = b().n;
                m1 m1Var = this.f13050l;
                i0 i0Var = m1Var.f13142j;
                String str6 = n4Var.f13182c;
                m0Var2.c(i0Var.c(str6), "Setting user property", objT);
                l lVar3 = this.f13041c;
                T(lVar3);
                lVar3.r0();
                try {
                    boolean zEquals = "_id".equals(str6);
                    Object obj2 = n4Var.f13184e;
                    if (zEquals) {
                        l lVar4 = this.f13041c;
                        T(lVar4);
                        n4 n4VarZ02 = lVar4.z0(str2, "_id");
                        if (n4VarZ02 != null && !obj2.equals(n4VarZ02.f13184e)) {
                            l lVar5 = this.f13041c;
                            T(lVar5);
                            lVar5.x0(str2, "_lair");
                        }
                    }
                    c0(zzrVar);
                    l lVar6 = this.f13041c;
                    T(lVar6);
                    boolean zY0 = lVar6.y0(n4Var);
                    if ("_sid".equals(str3)) {
                        m4 m4Var = this.f13045g;
                        T(m4Var);
                        String str7 = zzrVar.f33810z;
                        long jM0 = TextUtils.isEmpty(str7) ? 0L : m4Var.m0(str7.getBytes(StandardCharsets.UTF_8));
                        l lVar7 = this.f13041c;
                        T(lVar7);
                        t0 t0VarH0 = lVar7.H0(str2);
                        if (t0VarH0 != null) {
                            t0VarH0.B(jM0);
                            if (t0VarH0.o()) {
                                l lVar8 = this.f13041c;
                                T(lVar8);
                                lVar8.I0(t0VarH0, false);
                            }
                        }
                    }
                    l lVar9 = this.f13041c;
                    T(lVar9);
                    lVar9.s0();
                    if (!zY0) {
                        b().f13190f.c(m1Var.f13142j.c(str6), "Too many unique user properties are set. Ignoring user property", obj2);
                        k0();
                        p4.V(g4Var, str2, 9, null, null, 0);
                    }
                    l lVar10 = this.f13041c;
                    T(lVar10);
                    lVar10.t0();
                } catch (Throwable th2) {
                    l lVar11 = this.f13041c;
                    T(lVar11);
                    lVar11.t0();
                    throw th2;
                }
            }
        }
    }

    public final void X(String str, zzr zzrVar) {
        c().D();
        l0();
        boolean zS = S(zzrVar);
        String str2 = zzrVar.f33792f;
        if (zS) {
            if (!zzrVar.f33799m) {
                c0(zzrVar);
                return;
            }
            Boolean boolU = U(zzrVar);
            if ("_npa".equals(str) && boolU != null) {
                b().f13197m.a("Falling back to manifest metadata value for ad personalization");
                e().getClass();
                W(new zzpl(System.currentTimeMillis(), Long.valueOf(true != boolU.booleanValue() ? 0L : 1L), "_npa", TTConst.TRACK_TYPE_AUTO), zzrVar);
                return;
            }
            m0 m0Var = b().f13197m;
            m1 m1Var = this.f13050l;
            m0Var.b(m1Var.f13142j.c(str), "Removing user property");
            l lVar = this.f13041c;
            T(lVar);
            lVar.r0();
            try {
                c0(zzrVar);
                if ("_id".equals(str)) {
                    l lVar2 = this.f13041c;
                    T(lVar2);
                    sg.w.h(str2);
                    lVar2.x0(str2, "_lair");
                }
                l lVar3 = this.f13041c;
                T(lVar3);
                sg.w.h(str2);
                lVar3.x0(str2, str);
                l lVar4 = this.f13041c;
                T(lVar4);
                lVar4.s0();
                b().f13197m.b(m1Var.f13142j.c(str), "User property removed");
                l lVar5 = this.f13041c;
                T(lVar5);
                lVar5.t0();
            } catch (Throwable th2) {
                l lVar6 = this.f13041c;
                T(lVar6);
                lVar6.t0();
                throw th2;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:136:0x0371  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x043c A[Catch: all -> 0x00fc, TryCatch #2 {all -> 0x00fc, blocks: (B:33:0x00dc, B:35:0x00ec, B:43:0x0103, B:47:0x0113, B:49:0x0122, B:55:0x0137, B:57:0x0144, B:59:0x014f, B:62:0x0156, B:65:0x0171, B:68:0x018a, B:71:0x01ae, B:74:0x01be, B:76:0x01d6, B:105:0x029a, B:107:0x02c6, B:108:0x02c9, B:110:0x02ea, B:151:0x03b2, B:152:0x03b5, B:160:0x0461, B:113:0x0301, B:118:0x0320, B:120:0x0328, B:122:0x032e, B:126:0x0341, B:130:0x0354, B:134:0x0360, B:137:0x0374, B:142:0x0393, B:144:0x039b, B:146:0x03a3, B:148:0x03a9, B:140:0x0381, B:128:0x034c, B:116:0x030e, B:77:0x01e6, B:79:0x0210, B:80:0x021c, B:82:0x0223, B:84:0x0229, B:86:0x0233, B:88:0x0239, B:90:0x023f, B:92:0x0245, B:93:0x024a, B:99:0x0263, B:101:0x0267, B:102:0x0278, B:103:0x0283, B:104:0x028e, B:153:0x03de, B:155:0x0413, B:156:0x0416, B:157:0x043c, B:159:0x0443, B:63:0x0163, B:58:0x014b, B:51:0x012c, B:54:0x0134), top: B:169:0x00dc, inners: #0, #1, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0144 A[Catch: all -> 0x00fc, TryCatch #2 {all -> 0x00fc, blocks: (B:33:0x00dc, B:35:0x00ec, B:43:0x0103, B:47:0x0113, B:49:0x0122, B:55:0x0137, B:57:0x0144, B:59:0x014f, B:62:0x0156, B:65:0x0171, B:68:0x018a, B:71:0x01ae, B:74:0x01be, B:76:0x01d6, B:105:0x029a, B:107:0x02c6, B:108:0x02c9, B:110:0x02ea, B:151:0x03b2, B:152:0x03b5, B:160:0x0461, B:113:0x0301, B:118:0x0320, B:120:0x0328, B:122:0x032e, B:126:0x0341, B:130:0x0354, B:134:0x0360, B:137:0x0374, B:142:0x0393, B:144:0x039b, B:146:0x03a3, B:148:0x03a9, B:140:0x0381, B:128:0x034c, B:116:0x030e, B:77:0x01e6, B:79:0x0210, B:80:0x021c, B:82:0x0223, B:84:0x0229, B:86:0x0233, B:88:0x0239, B:90:0x023f, B:92:0x0245, B:93:0x024a, B:99:0x0263, B:101:0x0267, B:102:0x0278, B:103:0x0283, B:104:0x028e, B:153:0x03de, B:155:0x0413, B:156:0x0416, B:157:0x043c, B:159:0x0443, B:63:0x0163, B:58:0x014b, B:51:0x012c, B:54:0x0134), top: B:169:0x00dc, inners: #0, #1, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x014b A[Catch: all -> 0x00fc, TryCatch #2 {all -> 0x00fc, blocks: (B:33:0x00dc, B:35:0x00ec, B:43:0x0103, B:47:0x0113, B:49:0x0122, B:55:0x0137, B:57:0x0144, B:59:0x014f, B:62:0x0156, B:65:0x0171, B:68:0x018a, B:71:0x01ae, B:74:0x01be, B:76:0x01d6, B:105:0x029a, B:107:0x02c6, B:108:0x02c9, B:110:0x02ea, B:151:0x03b2, B:152:0x03b5, B:160:0x0461, B:113:0x0301, B:118:0x0320, B:120:0x0328, B:122:0x032e, B:126:0x0341, B:130:0x0354, B:134:0x0360, B:137:0x0374, B:142:0x0393, B:144:0x039b, B:146:0x03a3, B:148:0x03a9, B:140:0x0381, B:128:0x034c, B:116:0x030e, B:77:0x01e6, B:79:0x0210, B:80:0x021c, B:82:0x0223, B:84:0x0229, B:86:0x0233, B:88:0x0239, B:90:0x023f, B:92:0x0245, B:93:0x024a, B:99:0x0263, B:101:0x0267, B:102:0x0278, B:103:0x0283, B:104:0x028e, B:153:0x03de, B:155:0x0413, B:156:0x0416, B:157:0x043c, B:159:0x0443, B:63:0x0163, B:58:0x014b, B:51:0x012c, B:54:0x0134), top: B:169:0x00dc, inners: #0, #1, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0156 A[Catch: all -> 0x00fc, TRY_ENTER, TryCatch #2 {all -> 0x00fc, blocks: (B:33:0x00dc, B:35:0x00ec, B:43:0x0103, B:47:0x0113, B:49:0x0122, B:55:0x0137, B:57:0x0144, B:59:0x014f, B:62:0x0156, B:65:0x0171, B:68:0x018a, B:71:0x01ae, B:74:0x01be, B:76:0x01d6, B:105:0x029a, B:107:0x02c6, B:108:0x02c9, B:110:0x02ea, B:151:0x03b2, B:152:0x03b5, B:160:0x0461, B:113:0x0301, B:118:0x0320, B:120:0x0328, B:122:0x032e, B:126:0x0341, B:130:0x0354, B:134:0x0360, B:137:0x0374, B:142:0x0393, B:144:0x039b, B:146:0x03a3, B:148:0x03a9, B:140:0x0381, B:128:0x034c, B:116:0x030e, B:77:0x01e6, B:79:0x0210, B:80:0x021c, B:82:0x0223, B:84:0x0229, B:86:0x0233, B:88:0x0239, B:90:0x023f, B:92:0x0245, B:93:0x024a, B:99:0x0263, B:101:0x0267, B:102:0x0278, B:103:0x0283, B:104:0x028e, B:153:0x03de, B:155:0x0413, B:156:0x0416, B:157:0x043c, B:159:0x0443, B:63:0x0163, B:58:0x014b, B:51:0x012c, B:54:0x0134), top: B:169:0x00dc, inners: #0, #1, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0163 A[Catch: all -> 0x00fc, TryCatch #2 {all -> 0x00fc, blocks: (B:33:0x00dc, B:35:0x00ec, B:43:0x0103, B:47:0x0113, B:49:0x0122, B:55:0x0137, B:57:0x0144, B:59:0x014f, B:62:0x0156, B:65:0x0171, B:68:0x018a, B:71:0x01ae, B:74:0x01be, B:76:0x01d6, B:105:0x029a, B:107:0x02c6, B:108:0x02c9, B:110:0x02ea, B:151:0x03b2, B:152:0x03b5, B:160:0x0461, B:113:0x0301, B:118:0x0320, B:120:0x0328, B:122:0x032e, B:126:0x0341, B:130:0x0354, B:134:0x0360, B:137:0x0374, B:142:0x0393, B:144:0x039b, B:146:0x03a3, B:148:0x03a9, B:140:0x0381, B:128:0x034c, B:116:0x030e, B:77:0x01e6, B:79:0x0210, B:80:0x021c, B:82:0x0223, B:84:0x0229, B:86:0x0233, B:88:0x0239, B:90:0x023f, B:92:0x0245, B:93:0x024a, B:99:0x0263, B:101:0x0267, B:102:0x0278, B:103:0x0283, B:104:0x028e, B:153:0x03de, B:155:0x0413, B:156:0x0416, B:157:0x043c, B:159:0x0443, B:63:0x0163, B:58:0x014b, B:51:0x012c, B:54:0x0134), top: B:169:0x00dc, inners: #0, #1, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0171 A[Catch: all -> 0x00fc, TRY_LEAVE, TryCatch #2 {all -> 0x00fc, blocks: (B:33:0x00dc, B:35:0x00ec, B:43:0x0103, B:47:0x0113, B:49:0x0122, B:55:0x0137, B:57:0x0144, B:59:0x014f, B:62:0x0156, B:65:0x0171, B:68:0x018a, B:71:0x01ae, B:74:0x01be, B:76:0x01d6, B:105:0x029a, B:107:0x02c6, B:108:0x02c9, B:110:0x02ea, B:151:0x03b2, B:152:0x03b5, B:160:0x0461, B:113:0x0301, B:118:0x0320, B:120:0x0328, B:122:0x032e, B:126:0x0341, B:130:0x0354, B:134:0x0360, B:137:0x0374, B:142:0x0393, B:144:0x039b, B:146:0x03a3, B:148:0x03a9, B:140:0x0381, B:128:0x034c, B:116:0x030e, B:77:0x01e6, B:79:0x0210, B:80:0x021c, B:82:0x0223, B:84:0x0229, B:86:0x0233, B:88:0x0239, B:90:0x023f, B:92:0x0245, B:93:0x024a, B:99:0x0263, B:101:0x0267, B:102:0x0278, B:103:0x0283, B:104:0x028e, B:153:0x03de, B:155:0x0413, B:156:0x0416, B:157:0x043c, B:159:0x0443, B:63:0x0163, B:58:0x014b, B:51:0x012c, B:54:0x0134), top: B:169:0x00dc, inners: #0, #1, #3 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void Y(zzr zzrVar) {
        long j11;
        long j12;
        long j13;
        long j14;
        long j15;
        long j16;
        int i5;
        q qVarD0;
        boolean z11;
        m1 m1Var;
        String str;
        String str2;
        String str3;
        PackageInfo packageInfoC;
        zzr zzrVar2;
        ApplicationInfo applicationInfo;
        ApplicationInfo applicationInfoB;
        long j17;
        boolean z12;
        long jElapsedRealtime;
        m1 m1Var2 = this.f13050l;
        c().D();
        l0();
        sg.w.h(zzrVar);
        boolean z13 = zzrVar.f33804t;
        String str4 = zzrVar.f33792f;
        sg.w.e(str4);
        if (S(zzrVar)) {
            l lVar = this.f13041c;
            T(lVar);
            t0 t0VarH0 = lVar.H0(str4);
            if (t0VarH0 != null && TextUtils.isEmpty(t0VarH0.H()) && !TextUtils.isEmpty(zzrVar.f33793g)) {
                t0VarH0.f(0L);
                l lVar2 = this.f13041c;
                T(lVar2);
                lVar2.I0(t0VarH0, false);
                g1 g1Var = this.f13039a;
                T(g1Var);
                g1Var.D();
                g1Var.f12972i.remove(str4);
            }
            if (!zzrVar.f33799m) {
                c0(zzrVar);
                return;
            }
            long j18 = zzrVar.f33801q;
            e eVarE0 = e0();
            w wVar = x.f13414e1;
            if (eVarE0.O(null, wVar)) {
                j11 = j18;
                j12 = zzrVar.K;
            } else {
                j11 = j18;
                j12 = 0;
            }
            if (j11 == 0) {
                e().getClass();
                long jCurrentTimeMillis = System.currentTimeMillis();
                if (e0().O(null, wVar)) {
                    e().getClass();
                    jElapsedRealtime = SystemClock.elapsedRealtime();
                } else {
                    jElapsedRealtime = 0;
                }
                j14 = jCurrentTimeMillis;
                j13 = jElapsedRealtime;
            } else {
                j13 = j12;
                j14 = j11;
            }
            int i11 = zzrVar.f33802r;
            if (i11 != 0 && i11 != 1) {
                b().f13193i.c(o0.L(str4), "Incorrect app type, assuming installed app. appId, appType", Integer.valueOf(i11));
                i11 = 0;
            }
            l lVar3 = this.f13041c;
            T(lVar3);
            lVar3.r0();
            try {
                l lVar4 = this.f13041c;
                T(lVar4);
                n4 n4VarZ0 = lVar4.z0(str4, "_npa");
                Boolean boolU = U(zzrVar);
                if (n4VarZ0 != null) {
                    j15 = 1;
                    if (!TTConst.TRACK_TYPE_AUTO.equals(n4VarZ0.f13181b)) {
                        j16 = j14;
                        if (e0().O(null, x.W0)) {
                            i5 = i11;
                            b0(zzrVar, j16);
                        } else {
                            i5 = i11;
                            b0(zzrVar, zzrVar.I);
                        }
                        c0(zzrVar);
                        if (i5 != 0) {
                            l lVar5 = this.f13041c;
                            T(lVar5);
                            qVarD0 = lVar5.d0(DatabaseConstants.EVENT_TABLE_NAME, str4, "_f");
                            z11 = false;
                        } else {
                            l lVar6 = this.f13041c;
                            T(lVar6);
                            qVarD0 = lVar6.d0(DatabaseConstants.EVENT_TABLE_NAME, str4, "_v");
                            z11 = true;
                        }
                        if (qVarD0 != null) {
                            long j19 = ((j16 / 3600000) + j15) * 3600000;
                            if (z11) {
                                Long lValueOf = Long.valueOf(j19);
                                long j21 = j16;
                                W(new zzpl(j21, lValueOf, "_fvt", TTConst.TRACK_TYPE_AUTO), zzrVar);
                                c().D();
                                l0();
                                Bundle bundle = new Bundle();
                                bundle.putLong("_c", 1L);
                                bundle.putLong("_r", 1L);
                                bundle.putLong("_et", 1L);
                                if (z13) {
                                    bundle.putLong("_dac", 1L);
                                }
                                e().getClass();
                                bundle.putLong("_elt", System.currentTimeMillis());
                                i(new zzbh("_v", new zzbf(bundle), TTConst.TRACK_TYPE_AUTO, j21, j13), zzrVar);
                            } else {
                                Long lValueOf2 = Long.valueOf(j19);
                                long j22 = j16;
                                W(new zzpl(j22, lValueOf2, "_fot", TTConst.TRACK_TYPE_AUTO), zzrVar);
                                c().D();
                                b1 b1Var = this.f13049k;
                                sg.w.h(b1Var);
                                m1 m1Var3 = b1Var.f12853b;
                                if (str4 == null || str4.isEmpty()) {
                                    m1Var = m1Var2;
                                    str = "_elt";
                                    str2 = str4;
                                    str3 = "_et";
                                    o0 o0Var = m1Var3.f13138f;
                                    m1.l(o0Var);
                                    o0Var.f13194j.a("Install Referrer Reporter was called with invalid app package name");
                                } else {
                                    str3 = "_et";
                                    k1 k1Var = m1Var3.f13139g;
                                    o0 o0Var2 = m1Var3.f13138f;
                                    str = "_elt";
                                    Context context = m1Var3.f13133a;
                                    m1.l(k1Var);
                                    k1Var.D();
                                    if (b1Var.b()) {
                                        a1 a1Var = new a1(b1Var, str4);
                                        k1 k1Var2 = m1Var3.f13139g;
                                        m1.l(k1Var2);
                                        k1Var2.D();
                                        m1Var = m1Var2;
                                        Intent intent = new Intent("com.google.android.finsky.BIND_GET_INSTALL_REFERRER_SERVICE");
                                        str2 = str4;
                                        intent.setComponent(new ComponentName("com.android.vending", "com.google.android.finsky.externalreferrer.GetInstallReferrerService"));
                                        PackageManager packageManager = context.getPackageManager();
                                        if (packageManager == null) {
                                            m1.l(o0Var2);
                                            o0Var2.f13194j.a("Failed to obtain Package Manager to verify binding conditions for Install Referrer");
                                        } else {
                                            List<ResolveInfo> listQueryIntentServices = packageManager.queryIntentServices(intent, 0);
                                            if (listQueryIntentServices == null || listQueryIntentServices.isEmpty()) {
                                                m1.l(o0Var2);
                                                o0Var2.f13196l.a("Play Service for fetching Install Referrer is unavailable on device");
                                            } else {
                                                ServiceInfo serviceInfo = listQueryIntentServices.get(0).serviceInfo;
                                                if (serviceInfo != null) {
                                                    String str5 = serviceInfo.packageName;
                                                    if (serviceInfo.name != null && "com.android.vending".equals(str5) && b1Var.b()) {
                                                        try {
                                                            boolean zA = wg.a.b().a(context, new Intent(intent), a1Var, 1);
                                                            m1.l(o0Var2);
                                                            o0Var2.n.b(zA ? "available" : "not available", "Install Referrer Service is");
                                                        } catch (RuntimeException e3) {
                                                            o0 o0Var3 = m1Var3.f13138f;
                                                            m1.l(o0Var3);
                                                            o0Var3.f13190f.b(e3.getMessage(), "Exception occurred while binding to Install Referrer Service");
                                                        }
                                                    } else {
                                                        m1.l(o0Var2);
                                                        o0Var2.f13193i.a("Play Store version 8.3.73 or higher required for Install Referrer");
                                                    }
                                                }
                                            }
                                        }
                                    } else {
                                        m1.l(o0Var2);
                                        o0Var2.f13196l.a("Install Referrer Reporter is not available");
                                        m1Var = m1Var2;
                                        str2 = str4;
                                    }
                                }
                                c().D();
                                l0();
                                Bundle bundle2 = new Bundle();
                                long j23 = j15;
                                bundle2.putLong("_c", j23);
                                bundle2.putLong("_r", j23);
                                bundle2.putLong("_uwa", 0L);
                                bundle2.putLong("_pfo", 0L);
                                bundle2.putLong("_sys", 0L);
                                bundle2.putLong("_sysu", 0L);
                                bundle2.putLong(str3, j23);
                                if (z13) {
                                    bundle2.putLong("_dac", j23);
                                }
                                sg.w.h(str2);
                                l lVar7 = this.f13041c;
                                T(lVar7);
                                sg.w.e(str2);
                                lVar7.D();
                                lVar7.E();
                                String str6 = str2;
                                long jR = lVar7.R(str6);
                                m1 m1Var4 = m1Var;
                                if (m1Var4.f13133a.getPackageManager() == null) {
                                    b().f13190f.b(o0.L(str6), "PackageManager is null, first open report might be inaccurate. appId");
                                    zzrVar2 = zzrVar;
                                } else {
                                    try {
                                        packageInfoC = zg.b.a(m1Var4.f13133a).c(0, str6);
                                    } catch (PackageManager.NameNotFoundException e11) {
                                        b().f13190f.c(o0.L(str6), "Package info is null, first open report might be inaccurate. appId", e11);
                                        packageInfoC = null;
                                    }
                                    if (packageInfoC != null) {
                                        long j24 = packageInfoC.firstInstallTime;
                                        if (j24 != 0) {
                                            if (j24 != packageInfoC.lastUpdateTime) {
                                                applicationInfo = null;
                                                if (!e0().O(null, x.I0)) {
                                                    bundle2.putLong("_uwa", 1L);
                                                } else if (jR == 0) {
                                                    bundle2.putLong("_uwa", 1L);
                                                    z12 = false;
                                                    jR = 0;
                                                }
                                                z12 = false;
                                            } else {
                                                applicationInfo = null;
                                                z12 = true;
                                            }
                                            zzrVar2 = zzrVar;
                                            W(new zzpl(j22, Long.valueOf(true != z12 ? 0L : 1L), "_fi", TTConst.TRACK_TYPE_AUTO), zzrVar2);
                                        } else {
                                            zzrVar2 = zzrVar;
                                            applicationInfo = null;
                                        }
                                        try {
                                            applicationInfoB = zg.b.a(m1Var4.f13133a).b(0, str6);
                                        } catch (PackageManager.NameNotFoundException e12) {
                                            b().f13190f.c(o0.L(str6), "Application info is null, first open report might be inaccurate. appId", e12);
                                            applicationInfoB = applicationInfo;
                                        }
                                        if (applicationInfoB != null) {
                                            if ((applicationInfoB.flags & 1) != 0) {
                                                j17 = 1;
                                                bundle2.putLong("_sys", 1L);
                                            } else {
                                                j17 = 1;
                                            }
                                            if ((applicationInfoB.flags & 128) != 0) {
                                                bundle2.putLong("_sysu", j17);
                                            }
                                        }
                                    }
                                }
                                long j25 = jR;
                                if (j25 >= 0) {
                                    bundle2.putLong("_pfo", j25);
                                }
                                e().getClass();
                                bundle2.putLong(str, System.currentTimeMillis());
                                i(new zzbh("_f", new zzbf(bundle2), TTConst.TRACK_TYPE_AUTO, j22, j13), zzrVar2);
                            }
                        } else {
                            long j26 = j16;
                            if (zzrVar.n) {
                                i(new zzbh("_cd", new zzbf(new Bundle()), TTConst.TRACK_TYPE_AUTO, j26, 0L), zzrVar);
                            }
                        }
                        l lVar8 = this.f13041c;
                        T(lVar8);
                        lVar8.s0();
                        l lVar9 = this.f13041c;
                        T(lVar9);
                        lVar9.t0();
                    }
                } else {
                    j15 = 1;
                }
                if (boolU != null) {
                    zzpl zzplVar = new zzpl(j14, Long.valueOf(true != boolU.booleanValue() ? 0L : j15), "_npa", TTConst.TRACK_TYPE_AUTO);
                    j16 = j14;
                    if (n4VarZ0 == null || !n4VarZ0.f13184e.equals(zzplVar.f33788i)) {
                        W(zzplVar, zzrVar);
                    }
                } else {
                    j16 = j14;
                    if (n4VarZ0 != null) {
                        X("_npa", zzrVar);
                    }
                }
                if (e0().O(null, x.W0)) {
                }
                c0(zzrVar);
                if (i5 != 0) {
                }
                if (qVarD0 != null) {
                }
                l lVar82 = this.f13041c;
                T(lVar82);
                lVar82.s0();
                l lVar92 = this.f13041c;
                T(lVar92);
                lVar92.t0();
            } catch (Throwable th2) {
                l lVar10 = this.f13041c;
                T(lVar10);
                lVar10.t0();
                throw th2;
            }
        }
    }

    public final void Z(zzah zzahVar, zzr zzrVar) {
        zzbh zzbhVar;
        sg.w.e(zzahVar.f33757f);
        sg.w.h(zzahVar.f33758g);
        sg.w.h(zzahVar.f33759h);
        sg.w.e(zzahVar.f33759h.f33786g);
        c().D();
        l0();
        if (S(zzrVar)) {
            if (!zzrVar.f33799m) {
                c0(zzrVar);
                return;
            }
            zzah zzahVar2 = new zzah(zzahVar);
            boolean z11 = false;
            zzahVar2.f33761j = false;
            l lVar = this.f13041c;
            T(lVar);
            lVar.r0();
            try {
                l lVar2 = this.f13041c;
                T(lVar2);
                String str = zzahVar2.f33757f;
                sg.w.h(str);
                zzah zzahVarD0 = lVar2.D0(str, zzahVar2.f33759h.f33786g);
                m1 m1Var = this.f13050l;
                if (zzahVarD0 != null && !zzahVarD0.f33758g.equals(zzahVar2.f33758g)) {
                    b().f13193i.d("Updating a conditional user property with different origin. name, origin, origin (from DB)", m1Var.f13142j.c(zzahVar2.f33759h.f33786g), zzahVar2.f33758g, zzahVarD0.f33758g);
                }
                if (zzahVarD0 != null && zzahVarD0.f33761j) {
                    zzahVar2.f33758g = zzahVarD0.f33758g;
                    zzahVar2.f33760i = zzahVarD0.f33760i;
                    zzahVar2.f33764m = zzahVarD0.f33764m;
                    zzahVar2.f33762k = zzahVarD0.f33762k;
                    zzahVar2.n = zzahVarD0.n;
                    zzahVar2.f33761j = true;
                    zzpl zzplVar = zzahVar2.f33759h;
                    zzahVar2.f33759h = new zzpl(zzahVarD0.f33759h.f33787h, zzplVar.zza(), zzplVar.f33786g, zzahVarD0.f33759h.f33790k);
                } else if (TextUtils.isEmpty(zzahVar2.f33762k)) {
                    zzpl zzplVar2 = zzahVar2.f33759h;
                    zzahVar2.f33759h = new zzpl(zzahVar2.f33760i, zzplVar2.zza(), zzplVar2.f33786g, zzahVar2.f33759h.f33790k);
                    zzahVar2.f33761j = true;
                    z11 = true;
                }
                if (zzahVar2.f33761j) {
                    zzpl zzplVar3 = zzahVar2.f33759h;
                    String str2 = zzahVar2.f33757f;
                    sg.w.h(str2);
                    String str3 = zzahVar2.f33758g;
                    String str4 = zzplVar3.f33786g;
                    long j11 = zzplVar3.f33787h;
                    Object objZza = zzplVar3.zza();
                    sg.w.h(objZza);
                    n4 n4Var = new n4(str2, str3, j11, str4, objZza);
                    Object obj = n4Var.f13184e;
                    String str5 = n4Var.f13182c;
                    l lVar3 = this.f13041c;
                    T(lVar3);
                    if (lVar3.y0(n4Var)) {
                        b().f13197m.d("User property updated immediately", zzahVar2.f33757f, m1Var.f13142j.c(str5), obj);
                    } else {
                        b().f13190f.d("(2)Too many active user properties, ignoring", o0.L(zzahVar2.f33757f), m1Var.f13142j.c(str5), obj);
                    }
                    if (z11 && (zzbhVar = zzahVar2.n) != null) {
                        l(new zzbh(zzbhVar, zzahVar2.f33760i, 0L), zzrVar);
                    }
                }
                l lVar4 = this.f13041c;
                T(lVar4);
                if (lVar4.C0(zzahVar2)) {
                    b().f13197m.d("Conditional property added", zzahVar2.f33757f, m1Var.f13142j.c(zzahVar2.f33759h.f33786g), zzahVar2.f33759h.zza());
                } else {
                    b().f13190f.d("Too many conditional properties, ignoring", o0.L(zzahVar2.f33757f), m1Var.f13142j.c(zzahVar2.f33759h.f33786g), zzahVar2.f33759h.zza());
                }
                l lVar5 = this.f13041c;
                T(lVar5);
                lVar5.s0();
                l lVar6 = this.f13041c;
                T(lVar6);
                lVar6.t0();
            } catch (Throwable th2) {
                l lVar7 = this.f13041c;
                T(lVar7);
                lVar7.t0();
                throw th2;
            }
        }
    }

    @Override // ai.w1
    public final kc a() {
        return this.f13050l.f13135c;
    }

    public final void a0(zzah zzahVar, zzr zzrVar) {
        sg.w.e(zzahVar.f33757f);
        sg.w.h(zzahVar.f33759h);
        sg.w.e(zzahVar.f33759h.f33786g);
        c().D();
        l0();
        if (S(zzrVar)) {
            if (!zzrVar.f33799m) {
                c0(zzrVar);
                return;
            }
            l lVar = this.f13041c;
            T(lVar);
            lVar.r0();
            try {
                c0(zzrVar);
                String str = zzahVar.f33757f;
                sg.w.h(str);
                l lVar2 = this.f13041c;
                T(lVar2);
                zzah zzahVarD0 = lVar2.D0(str, zzahVar.f33759h.f33786g);
                m1 m1Var = this.f13050l;
                if (zzahVarD0 != null) {
                    b().f13197m.c(zzahVar.f33757f, "Removing conditional user property", m1Var.f13142j.c(zzahVar.f33759h.f33786g));
                    l lVar3 = this.f13041c;
                    T(lVar3);
                    lVar3.E0(str, zzahVar.f33759h.f33786g);
                    if (zzahVarD0.f33761j) {
                        l lVar4 = this.f13041c;
                        T(lVar4);
                        lVar4.x0(str, zzahVar.f33759h.f33786g);
                    }
                    zzbh zzbhVar = zzahVar.f33765p;
                    if (zzbhVar != null) {
                        zzbf zzbfVar = zzbhVar.f33769g;
                        zzbh zzbhVarK0 = k0().k0(zzbhVar.f33768f, zzbfVar != null ? zzbfVar.p() : null, zzahVarD0.f33758g, zzbhVar.f33771i, zzbhVar.f33772j, true);
                        sg.w.h(zzbhVarK0);
                        l(zzbhVarK0, zzrVar);
                    }
                } else {
                    b().f13193i.c(o0.L(zzahVar.f33757f), "Conditional user property doesn't exist", m1Var.f13142j.c(zzahVar.f33759h.f33786g));
                }
                l lVar5 = this.f13041c;
                T(lVar5);
                lVar5.s0();
                l lVar6 = this.f13041c;
                T(lVar6);
                lVar6.t0();
            } catch (Throwable th2) {
                l lVar7 = this.f13041c;
                T(lVar7);
                lVar7.t0();
                throw th2;
            }
        }
    }

    @Override // ai.w1
    public final o0 b() {
        m1 m1Var = this.f13050l;
        sg.w.h(m1Var);
        o0 o0Var = m1Var.f13138f;
        m1.l(o0Var);
        return o0Var;
    }

    public final void b0(zzr zzrVar, long j11) throws Throwable {
        l lVar = this.f13041c;
        T(lVar);
        String str = zzrVar.f33792f;
        sg.w.h(str);
        t0 t0VarH0 = lVar.H0(str);
        if (t0VarH0 != null) {
            k0();
            String str2 = zzrVar.f33793g;
            String strH = t0VarH0.H();
            boolean zIsEmpty = TextUtils.isEmpty(str2);
            boolean zIsEmpty2 = TextUtils.isEmpty(strH);
            if (!zIsEmpty && !zIsEmpty2) {
                sg.w.h(str2);
                if (!str2.equals(strH)) {
                    b().f13193i.b(o0.L(t0VarH0.E()), "New GMP App Id passed in. Removing cached database data. appId");
                    l lVar2 = this.f13041c;
                    T(lVar2);
                    m1 m1Var = (m1) lVar2.f13368a;
                    String strE = t0VarH0.E();
                    lVar2.E();
                    lVar2.D();
                    sg.w.e(strE);
                    try {
                        SQLiteDatabase sQLiteDatabaseU0 = lVar2.u0();
                        String[] strArr = {strE};
                        int iDelete = sQLiteDatabaseU0.delete(DatabaseConstants.EVENT_TABLE_NAME, "app_id=?", strArr) + sQLiteDatabaseU0.delete("user_attributes", "app_id=?", strArr) + sQLiteDatabaseU0.delete("conditional_properties", "app_id=?", strArr) + sQLiteDatabaseU0.delete("apps", "app_id=?", strArr) + sQLiteDatabaseU0.delete("raw_events", "app_id=?", strArr) + sQLiteDatabaseU0.delete("raw_events_metadata", "app_id=?", strArr) + sQLiteDatabaseU0.delete("event_filters", "app_id=?", strArr) + sQLiteDatabaseU0.delete("property_filters", "app_id=?", strArr) + sQLiteDatabaseU0.delete("audience_filter_values", "app_id=?", strArr) + sQLiteDatabaseU0.delete("consent_settings", "app_id=?", strArr) + sQLiteDatabaseU0.delete("default_event_params", "app_id=?", strArr) + sQLiteDatabaseU0.delete("trigger_uris", "app_id=?", strArr) + sQLiteDatabaseU0.delete("diagnostic_signals", "app_id=?", strArr);
                        if (m1Var.f13136d.O(null, x.f13408c1)) {
                            iDelete += sQLiteDatabaseU0.delete("no_data_mode_events", "app_id=?", strArr);
                        }
                        if (iDelete > 0) {
                            o0 o0Var = m1Var.f13138f;
                            m1.l(o0Var);
                            o0Var.n.c(strE, "Deleted application data. app, records", Integer.valueOf(iDelete));
                        }
                    } catch (SQLiteException e3) {
                        o0 o0Var2 = m1Var.f13138f;
                        m1.l(o0Var2);
                        o0Var2.f13190f.c(o0.L(strE), "Error deleting application data. appId, error", e3);
                    }
                    t0VarH0 = null;
                }
            }
        }
        if (t0VarH0 != null) {
            boolean z11 = (t0VarH0.Q() == -2147483648L || t0VarH0.Q() == zzrVar.o) ? false : true;
            String strO = t0VarH0.O();
            if (z11 || ((t0VarH0.Q() != -2147483648L || strO == null || strO.equals(zzrVar.f33794h)) ? false : true)) {
                Bundle bundle = new Bundle();
                bundle.putString("_pv", strO);
                zzbh zzbhVar = new zzbh("_au", new zzbf(bundle), TTConst.TRACK_TYPE_AUTO, j11, 0L);
                if (e0().O(null, x.X0)) {
                    i(zzbhVar, zzrVar);
                } else {
                    j(zzbhVar, zzrVar);
                }
            }
        }
    }

    @Override // ai.w1
    public final k1 c() {
        m1 m1Var = this.f13050l;
        sg.w.h(m1Var);
        k1 k1Var = m1Var.f13139g;
        m1.l(k1Var);
        return k1Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x0112  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0145  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0150  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x015c  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0171  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0182  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0184  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x01d4  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x01da  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x01ff  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0201  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0217  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0219  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x022e  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x025b  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x025d  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0273  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x027f  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0283  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final t0 c0(zzr zzrVar) {
        boolean z11;
        String str;
        long j11;
        String str2;
        String str3;
        String str4;
        c().D();
        l0();
        sg.w.h(zzrVar);
        boolean z12 = zzrVar.f33803s;
        String str5 = zzrVar.f33792f;
        sg.w.e(str5);
        String str6 = zzrVar.f33809y;
        if (!str6.isEmpty()) {
            this.D.put(str5, new h4(this, str6));
        }
        l lVar = this.f13041c;
        T(lVar);
        t0 t0VarH0 = lVar.H0(str5);
        a2 a2VarJ = f(str5).j(a2.c(100, zzrVar.f33808x));
        String strJ = this.f13047i.J(zzrVar, a2VarJ);
        boolean z13 = true;
        z1 z1Var = z1.AD_STORAGE;
        z1 z1Var2 = z1.ANALYTICS_STORAGE;
        if (t0VarH0 != null) {
            m1 m1Var = t0VarH0.f13310a;
            if (a2VarJ.i(z1Var) && strJ != null) {
                k1 k1Var = m1Var.f13139g;
                m1.l(k1Var);
                k1Var.D();
                if (!strJ.equals(t0VarH0.f13314e)) {
                    k1 k1Var2 = m1Var.f13139g;
                    m1.l(k1Var2);
                    k1Var2.D();
                    boolean zIsEmpty = TextUtils.isEmpty(t0VarH0.f13314e);
                    t0VarH0.J(strJ);
                    if (z12 && !"00000000-0000-0000-0000-000000000000".equals(this.f13047i.H(zzrVar, a2VarJ).first) && !zIsEmpty) {
                        if (a2VarJ.i(z1Var2)) {
                            t0VarH0.G(o(a2VarJ));
                            z11 = false;
                        } else {
                            z11 = true;
                        }
                        l lVar2 = this.f13041c;
                        T(lVar2);
                        if (lVar2.z0(str5, "_id") != null) {
                            l lVar3 = this.f13041c;
                            T(lVar3);
                            if (lVar3.z0(str5, "_lair") == null) {
                                e().getClass();
                                n4 n4Var = new n4(str5, TTConst.TRACK_TYPE_AUTO, System.currentTimeMillis(), "_lair", 1L);
                                l lVar4 = this.f13041c;
                                T(lVar4);
                                lVar4.y0(n4Var);
                            }
                        }
                    } else if (TextUtils.isEmpty(t0VarH0.F()) && a2VarJ.i(z1Var2)) {
                        t0VarH0.G(o(a2VarJ));
                    }
                }
            } else if (TextUtils.isEmpty(t0VarH0.F()) && a2VarJ.i(z1Var2)) {
                t0VarH0.G(o(a2VarJ));
            }
            m1 m1Var2 = t0VarH0.f13310a;
            t0VarH0.I(zzrVar.f33793g);
            str = zzrVar.f33800p;
            if (!TextUtils.isEmpty(str)) {
                t0VarH0.L(str);
            }
            j11 = zzrVar.f33796j;
            if (j11 != 0) {
                t0VarH0.T(j11);
            }
            str2 = zzrVar.f33794h;
            if (!TextUtils.isEmpty(str2)) {
                t0VarH0.P(str2);
            }
            t0VarH0.R(zzrVar.o);
            str3 = zzrVar.f33795i;
            if (str3 != null) {
                t0VarH0.S(str3);
            }
            t0VarH0.a(zzrVar.f33797k);
            t0VarH0.d(zzrVar.f33799m);
            str4 = zzrVar.f33798l;
            if (!TextUtils.isEmpty(str4)) {
                t0VarH0.w(str4);
            }
            k1 k1Var3 = m1Var2.f13139g;
            m1.l(k1Var3);
            k1Var3.D();
            t0VarH0.R |= t0VarH0.f13323p == z12;
            t0VarH0.f13323p = z12;
            Boolean bool = zzrVar.f33805u;
            k1 k1Var4 = m1Var2.f13139g;
            m1.l(k1Var4);
            k1Var4.D();
            t0VarH0.R |= !Objects.equals(t0VarH0.f13324q, bool);
            t0VarH0.f13324q = bool;
            t0VarH0.c(zzrVar.f33806v);
            String str7 = zzrVar.f33810z;
            k1 k1Var5 = m1Var2.f13139g;
            m1.l(k1Var5);
            k1Var5.D();
            t0VarH0.R |= !Objects.equals(t0VarH0.f13327t, str7);
            t0VarH0.f13327t = str7;
            com.google.android.gms.internal.measurement.d4 d4Var = com.google.android.gms.internal.measurement.d4.f32458b;
            if (e0().O(null, x.L0)) {
                if (e0().O(null, x.K0)) {
                    t0VarH0.y(null);
                }
            } else {
                t0VarH0.y(zzrVar.f33807w);
            }
            boolean z14 = zzrVar.A;
            k1 k1Var6 = m1Var2.f13139g;
            m1.l(k1Var6);
            k1Var6.D();
            t0VarH0.R |= t0VarH0.f13328u == z14;
            t0VarH0.f13328u = z14;
            String str8 = zzrVar.G;
            k1 k1Var7 = m1Var2.f13139g;
            m1.l(k1Var7);
            k1Var7.D();
            t0VarH0.R |= t0VarH0.C == str8;
            t0VarH0.C = str8;
            z4.a();
            if (e0().O(null, x.O0)) {
                int i5 = zzrVar.E;
                k1 k1Var8 = m1Var2.f13139g;
                m1.l(k1Var8);
                k1Var8.D();
                t0VarH0.R |= t0VarH0.f13331x != i5;
                t0VarH0.f13331x = i5;
            }
            t0VarH0.A(zzrVar.B);
            String str9 = zzrVar.H;
            k1 k1Var9 = m1Var2.f13139g;
            m1.l(k1Var9);
            k1Var9.D();
            t0VarH0.R |= t0VarH0.G == str9;
            t0VarH0.G = str9;
            int i11 = zzrVar.J;
            k1 k1Var10 = m1Var2.f13139g;
            m1.l(k1Var10);
            k1Var10.D();
            t0VarH0.R |= t0VarH0.I != i11;
            t0VarH0.I = i11;
            if (!t0VarH0.o()) {
                z13 = z11;
            } else if (!z11) {
                return t0VarH0;
            }
            l lVar5 = this.f13041c;
            T(lVar5);
            lVar5.I0(t0VarH0, z13);
            return t0VarH0;
        }
        t0VarH0 = new t0(this.f13050l, str5);
        if (a2VarJ.i(z1Var2)) {
            t0VarH0.G(o(a2VarJ));
        }
        if (a2VarJ.i(z1Var)) {
            t0VarH0.J(strJ);
        }
        z11 = false;
        m1 m1Var22 = t0VarH0.f13310a;
        t0VarH0.I(zzrVar.f33793g);
        str = zzrVar.f33800p;
        if (!TextUtils.isEmpty(str)) {
        }
        j11 = zzrVar.f33796j;
        if (j11 != 0) {
        }
        str2 = zzrVar.f33794h;
        if (!TextUtils.isEmpty(str2)) {
        }
        t0VarH0.R(zzrVar.o);
        str3 = zzrVar.f33795i;
        if (str3 != null) {
        }
        t0VarH0.a(zzrVar.f33797k);
        t0VarH0.d(zzrVar.f33799m);
        str4 = zzrVar.f33798l;
        if (!TextUtils.isEmpty(str4)) {
        }
        k1 k1Var32 = m1Var22.f13139g;
        m1.l(k1Var32);
        k1Var32.D();
        t0VarH0.R |= t0VarH0.f13323p == z12;
        t0VarH0.f13323p = z12;
        Boolean bool2 = zzrVar.f33805u;
        k1 k1Var42 = m1Var22.f13139g;
        m1.l(k1Var42);
        k1Var42.D();
        t0VarH0.R |= !Objects.equals(t0VarH0.f13324q, bool2);
        t0VarH0.f13324q = bool2;
        t0VarH0.c(zzrVar.f33806v);
        String str72 = zzrVar.f33810z;
        k1 k1Var52 = m1Var22.f13139g;
        m1.l(k1Var52);
        k1Var52.D();
        t0VarH0.R |= !Objects.equals(t0VarH0.f13327t, str72);
        t0VarH0.f13327t = str72;
        com.google.android.gms.internal.measurement.d4 d4Var2 = com.google.android.gms.internal.measurement.d4.f32458b;
        if (e0().O(null, x.L0)) {
        }
        boolean z142 = zzrVar.A;
        k1 k1Var62 = m1Var22.f13139g;
        m1.l(k1Var62);
        k1Var62.D();
        t0VarH0.R |= t0VarH0.f13328u == z142;
        t0VarH0.f13328u = z142;
        String str82 = zzrVar.G;
        k1 k1Var72 = m1Var22.f13139g;
        m1.l(k1Var72);
        k1Var72.D();
        t0VarH0.R |= t0VarH0.C == str82;
        t0VarH0.C = str82;
        z4.a();
        if (e0().O(null, x.O0)) {
        }
        t0VarH0.A(zzrVar.B);
        String str92 = zzrVar.H;
        k1 k1Var92 = m1Var22.f13139g;
        m1.l(k1Var92);
        k1Var92.D();
        t0VarH0.R |= t0VarH0.G == str92;
        t0VarH0.G = str92;
        int i112 = zzrVar.J;
        k1 k1Var102 = m1Var22.f13139g;
        m1.l(k1Var102);
        k1Var102.D();
        t0VarH0.R |= t0VarH0.I != i112;
        t0VarH0.I = i112;
        if (!t0VarH0.o()) {
        }
        l lVar52 = this.f13041c;
        T(lVar52);
        lVar52.I0(t0VarH0, z13);
        return t0VarH0;
    }

    @Override // ai.w1
    public final Context d() {
        return this.f13050l.f13133a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r0v4, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r0v6, types: [java.util.List] */
    public final List d0(Bundle bundle, zzr zzrVar) {
        int[] iArr;
        c().D();
        z4.a();
        e eVarE0 = e0();
        String str = zzrVar.f33792f;
        if (!eVarE0.O(str, x.O0) || str == null) {
            return new ArrayList();
        }
        if (bundle != null) {
            int[] intArray = bundle.getIntArray("uriSources");
            long[] longArray = bundle.getLongArray("uriTimestamps");
            if (intArray != null) {
                if (longArray == null || longArray.length != intArray.length) {
                    b().f13190f.a("Uri sources and timestamps do not match");
                } else {
                    int i5 = 0;
                    while (i5 < intArray.length) {
                        l lVar = this.f13041c;
                        T(lVar);
                        m1 m1Var = (m1) lVar.f13368a;
                        int i11 = intArray[i5];
                        long j11 = longArray[i5];
                        sg.w.e(str);
                        lVar.D();
                        lVar.E();
                        try {
                            iArr = intArray;
                        } catch (SQLiteException e3) {
                            e = e3;
                            iArr = intArray;
                        }
                        try {
                            int iDelete = lVar.u0().delete("trigger_uris", "app_id=? and source=? and timestamp_millis<=?", new String[]{str, String.valueOf(i11), String.valueOf(j11)});
                            o0 o0Var = m1Var.f13138f;
                            m1.l(o0Var);
                            m0 m0Var = o0Var.n;
                            StringBuilder sb2 = new StringBuilder(String.valueOf(iDelete).length() + 46);
                            sb2.append("Pruned ");
                            sb2.append(iDelete);
                            sb2.append(" trigger URIs. appId, source, timestamp");
                            m0Var.d(sb2.toString(), str, Integer.valueOf(i11), Long.valueOf(j11));
                        } catch (SQLiteException e11) {
                            e = e11;
                            o0 o0Var2 = m1Var.f13138f;
                            m1.l(o0Var2);
                            o0Var2.f13190f.c(o0.L(str), "Error pruning trigger URIs. appId", e);
                            i5++;
                            intArray = iArr;
                        }
                        i5++;
                        intArray = iArr;
                    }
                }
            }
        }
        l lVar2 = this.f13041c;
        T(lVar2);
        String str2 = zzrVar.f33792f;
        sg.w.e(str2);
        lVar2.D();
        lVar2.E();
        ?? arrayList = new ArrayList();
        Cursor cursorQuery = null;
        try {
            try {
                cursorQuery = lVar2.u0().query("trigger_uris", new String[]{"trigger_uri", "timestamp_millis", Plan.AMP_PLAN_SOURCE}, "app_id=?", new String[]{str2}, null, null, "rowid", null);
                if (cursorQuery.moveToFirst()) {
                    do {
                        String string = cursorQuery.getString(0);
                        if (string == null) {
                            string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        arrayList.add(new zzoh(string, cursorQuery.getLong(1), cursorQuery.getInt(2)));
                    } while (cursorQuery.moveToNext());
                }
            } catch (Throwable th2) {
                if (cursorQuery != null) {
                    cursorQuery.close();
                }
                throw th2;
            }
        } catch (SQLiteException e12) {
            o0 o0Var3 = ((m1) lVar2.f13368a).f13138f;
            m1.l(o0Var3);
            o0Var3.f13190f.c(o0.L(str2), "Error querying trigger uris. appId", e12);
            arrayList = Collections.EMPTY_LIST;
        }
        if (cursorQuery != null) {
            cursorQuery.close();
        }
        return arrayList;
    }

    @Override // ai.w1
    public final xg.a e() {
        m1 m1Var = this.f13050l;
        sg.w.h(m1Var);
        return m1Var.f13143k;
    }

    public final e e0() {
        m1 m1Var = this.f13050l;
        sg.w.h(m1Var);
        return m1Var.f13136d;
    }

    public final a2 f(String str) {
        a2 a2Var = a2.f12831c;
        c().D();
        l0();
        HashMap map = this.B;
        a2 a2VarX = (a2) map.get(str);
        if (a2VarX == null) {
            l lVar = this.f13041c;
            T(lVar);
            a2VarX = lVar.X(str);
            if (a2VarX == null) {
                a2VarX = a2.f12831c;
            }
            c().D();
            l0();
            map.put(str, a2VarX);
            l lVar2 = this.f13041c;
            T(lVar2);
            lVar2.j0(str, a2VarX);
        }
        return a2VarX;
    }

    public final g1 f0() {
        g1 g1Var = this.f13039a;
        T(g1Var);
        return g1Var;
    }

    public final long g() {
        e().getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        r3 r3Var = this.f13047i;
        r3Var.E();
        r3Var.D();
        w0 w0Var = r3Var.f13288j;
        long jF = w0Var.f();
        if (jF == 0) {
            m1.j(((m1) r3Var.f13368a).f13141i);
            jF = r2.C0().nextInt(86400000) + 1;
            w0Var.g(jF);
        }
        return ((((jCurrentTimeMillis + jF) / 1000) / 60) / 60) / 24;
    }

    public final l g0() {
        l lVar = this.f13041c;
        T(lVar);
        return lVar;
    }

    public final void h(zzbh zzbhVar, String str) throws Throwable {
        l lVar = this.f13041c;
        T(lVar);
        t0 t0VarH0 = lVar.H0(str);
        if (t0VarH0 != null) {
            m1 m1Var = t0VarH0.f13310a;
            if (!TextUtils.isEmpty(t0VarH0.O())) {
                Boolean boolP = P(t0VarH0);
                if (boolP == null) {
                    if (!"_ui".equals(zzbhVar.f33768f)) {
                        b().f13193i.b(o0.L(str), "Could not find package. appId");
                    }
                } else if (!boolP.booleanValue()) {
                    b().f13190f.b(o0.L(str), "App version does not match; dropping event. appId");
                    return;
                }
                String strH = t0VarH0.H();
                String strO = t0VarH0.O();
                long jQ = t0VarH0.Q();
                k1 k1Var = m1Var.f13139g;
                m1.l(k1Var);
                k1Var.D();
                String str2 = t0VarH0.f13321l;
                k1 k1Var2 = m1Var.f13139g;
                m1.l(k1Var2);
                k1Var2.D();
                long j11 = t0VarH0.f13322m;
                k1 k1Var3 = m1Var.f13139g;
                m1.l(k1Var3);
                k1Var3.D();
                long j12 = t0VarH0.n;
                k1 k1Var4 = m1Var.f13139g;
                m1.l(k1Var4);
                k1Var4.D();
                boolean z11 = t0VarH0.o;
                String strK = t0VarH0.K();
                k1 k1Var5 = m1Var.f13139g;
                m1.l(k1Var5);
                k1Var5.D();
                boolean z12 = t0VarH0.f13323p;
                Boolean boolX = t0VarH0.x();
                long jB = t0VarH0.b();
                k1 k1Var6 = m1Var.f13139g;
                m1.l(k1Var6);
                k1Var6.D();
                ArrayList arrayList = t0VarH0.f13326s;
                String strG = f(str).g();
                boolean z13 = t0VarH0.z();
                k1 k1Var7 = m1Var.f13139g;
                m1.l(k1Var7);
                k1Var7.D();
                long j13 = t0VarH0.f13329v;
                int i5 = f(str).f12833b;
                String str3 = o0(str).f13167b;
                k1 k1Var8 = m1Var.f13139g;
                m1.l(k1Var8);
                k1Var8.D();
                int i11 = t0VarH0.f13331x;
                k1 k1Var9 = m1Var.f13139g;
                m1.l(k1Var9);
                k1Var9.D();
                i(zzbhVar, new zzr(str, strH, strO, jQ, str2, j11, j12, (String) null, z11, false, strK, 0L, 0, z12, false, boolX, jB, (List) arrayList, strG, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (String) null, z13, j13, i5, str3, i11, t0VarH0.B, t0VarH0.D(), t0VarH0.s(), 0L, t0VarH0.t(), 0L));
                return;
            }
        }
        b().f13197m.b(str, "No app data available; dropping event");
    }

    public final u0 h0() {
        u0 u0Var = this.f13042d;
        if (u0Var != null) {
            return u0Var;
        }
        throw new IllegalStateException("Network broadcast receiver not created");
    }

    /* JADX WARN: Not initialized variable reg: 6, insn: 0x007d: MOVE (r5 I:??[OBJECT, ARRAY]) = (r6 I:??[OBJECT, ARRAY]), block:B:18:0x007d */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x010a  */
    /* JADX WARN: Removed duplicated region for block: B:47:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void i(zzbh zzbhVar, zzr zzrVar) throws Throwable {
        Throwable th2;
        Cursor cursorRawQuery;
        Cursor cursor;
        Bundle bundleM;
        zzbh zzbhVarB;
        zzbf zzbfVar;
        String str = zzrVar.f33792f;
        sg.w.e(str);
        p0 p0VarA = p0.a(zzbhVar);
        Bundle bundle = p0VarA.f13220e;
        p4 p4VarK0 = k0();
        l lVar = this.f13041c;
        T(lVar);
        m1 m1Var = (m1) lVar.f13368a;
        lVar.D();
        lVar.E();
        Cursor cursor2 = null;
        try {
            try {
                cursorRawQuery = lVar.u0().rawQuery("select parameters from default_event_params where app_id=?", new String[]{str});
                try {
                } catch (SQLiteException e3) {
                    e = e3;
                    o0 o0Var = m1Var.f13138f;
                    m1.l(o0Var);
                    o0Var.f13190f.b(e, "Error selecting default event parameters");
                    if (cursorRawQuery != null) {
                    }
                    bundleM = null;
                    p4VarK0.Q(bundle, bundleM);
                    p4 p4VarK02 = k0();
                    e eVarE0 = e0();
                    eVarE0.getClass();
                    p4VarK02.O(p0VarA, Math.max(Math.min(eVarE0.M(str, x.X), 100), 25));
                    zzbhVarB = p0VarA.b();
                    if (!e0().O(null, x.Z0)) {
                    }
                    j(zzbhVarB, zzrVar);
                }
            } catch (Throwable th3) {
                th2 = th3;
                cursor2 = cursor;
                if (cursor2 != null) {
                    throw th2;
                }
                cursor2.close();
                throw th2;
            }
        } catch (SQLiteException e11) {
            e = e11;
            cursorRawQuery = null;
        } catch (Throwable th4) {
            th2 = th4;
            if (cursor2 != null) {
            }
        }
        if (cursorRawQuery.moveToFirst()) {
            try {
                ca caVar = (ca) ((ba) m4.o0(ca.N(), cursorRawQuery.getBlob(0))).f();
                lVar.f12889b.j0();
                bundleM = m4.M(caVar.z());
                cursorRawQuery.close();
            } catch (IOException e12) {
                o0 o0Var2 = m1Var.f13138f;
                m1.l(o0Var2);
                o0Var2.f13190f.c(o0.L(str), "Failed to retrieve default event parameters. appId", e12);
            }
            p4VarK0.Q(bundle, bundleM);
            p4 p4VarK022 = k0();
            e eVarE02 = e0();
            eVarE02.getClass();
            p4VarK022.O(p0VarA, Math.max(Math.min(eVarE02.M(str, x.X), 100), 25));
            zzbhVarB = p0VarA.b();
            if (!e0().O(null, x.Z0) && "_cmp".equals(zzbhVarB.f33768f)) {
                zzbfVar = zzbhVarB.f33769g;
                if ("referrer API v2".equals(zzbfVar.f33767f.getString("_cis"))) {
                    String string = zzbfVar.f33767f.getString("gclid");
                    if (!TextUtils.isEmpty(string)) {
                        W(new zzpl(zzbhVarB.f33771i, string, "_lgclid", TTConst.TRACK_TYPE_AUTO), zzrVar);
                    }
                }
            }
            j(zzbhVarB, zzrVar);
        }
        o0 o0Var3 = m1Var.f13138f;
        m1.l(o0Var3);
        o0Var3.n.a("Default event parameters not found");
        if (cursorRawQuery != null) {
            cursorRawQuery.close();
        }
        bundleM = null;
        p4VarK0.Q(bundle, bundleM);
        p4 p4VarK0222 = k0();
        e eVarE022 = e0();
        eVarE022.getClass();
        p4VarK0222.O(p0VarA, Math.max(Math.min(eVarE022.M(str, x.X), 100), 25));
        zzbhVarB = p0VarA.b();
        if (!e0().O(null, x.Z0)) {
            zzbfVar = zzbhVarB.f33769g;
            if ("referrer API v2".equals(zzbfVar.f33767f.getString("_cis"))) {
            }
        }
        j(zzbhVarB, zzrVar);
    }

    public final c i0() {
        c cVar = this.f13044f;
        T(cVar);
        return cVar;
    }

    public final void j(zzbh zzbhVar, zzr zzrVar) {
        long j11;
        List listG0;
        m1 m1Var;
        List listG02;
        List<zzah> listG03;
        long j12;
        String str;
        sg.w.h(zzrVar);
        String str2 = zzrVar.f33792f;
        sg.w.e(str2);
        c().D();
        l0();
        long j13 = zzbhVar.f33771i;
        long j14 = zzbhVar.f33772j;
        p0 p0VarA = p0.a(zzbhVar);
        c().D();
        b3 b3Var = this.F;
        if (b3Var == null || (str = this.G) == null || !str.equals(str2)) {
            b3Var = null;
        }
        p4.z0(b3Var, p0VarA.f13220e, false);
        zzbh zzbhVarB = p0VarA.b();
        j0();
        if (TextUtils.isEmpty(zzrVar.f33793g)) {
            return;
        }
        if (!zzrVar.f33799m) {
            c0(zzrVar);
            return;
        }
        List list = zzrVar.f33807w;
        if (list != null) {
            String str3 = zzbhVarB.f33768f;
            if (!list.contains(str3)) {
                b().f13197m.d("Dropping non-safelisted event. appId, event name, origin", str2, str3, zzbhVarB.f33770h);
                return;
            }
            Bundle bundleP = zzbhVarB.f33769g.p();
            j11 = j13;
            bundleP.putLong("ga_safelisted", 1L);
            zzbhVarB = new zzbh(str3, new zzbf(bundleP), zzbhVarB.f33770h, zzbhVarB.f33771i, zzbhVarB.f33772j);
        } else {
            j11 = j13;
        }
        l lVar = this.f13041c;
        T(lVar);
        lVar.r0();
        try {
            String str4 = zzbhVarB.f33768f;
            if ("_s".equals(str4)) {
                l lVar2 = this.f13041c;
                T(lVar2);
                if (!lVar2.S(str2, "_s") && zzbhVarB.f33769g.f33767f.getLong("_sid") != 0) {
                    l lVar3 = this.f13041c;
                    T(lVar3);
                    if (lVar3.S(str2, "_f")) {
                        l lVar4 = this.f13041c;
                        T(lVar4);
                        lVar4.W(str2, null, "_sid", k(zzbhVarB, str2));
                    } else {
                        l lVar5 = this.f13041c;
                        T(lVar5);
                        if (lVar5.S(str2, "_v")) {
                            l lVar42 = this.f13041c;
                            T(lVar42);
                            lVar42.W(str2, null, "_sid", k(zzbhVarB, str2));
                        } else {
                            l lVar6 = this.f13041c;
                            T(lVar6);
                            e().getClass();
                            lVar6.W(str2, Long.valueOf(System.currentTimeMillis() - 15000), "_sid", k(zzbhVarB, str2));
                        }
                    }
                }
            }
            l lVar7 = this.f13041c;
            T(lVar7);
            sg.w.e(str2);
            lVar7.D();
            lVar7.E();
            int i5 = (j11 > 0L ? 1 : (j11 == 0L ? 0 : -1));
            if (i5 < 0) {
                o0 o0Var = ((m1) lVar7.f13368a).f13138f;
                m1.l(o0Var);
                o0Var.f13193i.c(o0.L(str2), "Invalid time querying timed out conditional properties", Long.valueOf(j11));
                listG0 = Collections.EMPTY_LIST;
            } else {
                listG0 = lVar7.G0("active=0 and app_id=? and abs(? - creation_timestamp) > trigger_timeout", new String[]{str2, String.valueOf(j11)});
            }
            Iterator it = listG0.iterator();
            while (true) {
                boolean zHasNext = it.hasNext();
                m1Var = this.f13050l;
                if (!zHasNext) {
                    break;
                }
                zzah zzahVar = (zzah) it.next();
                if (zzahVar != null) {
                    b().n.d("User property timed out", zzahVar.f33757f, m1Var.f13142j.c(zzahVar.f33759h.f33786g), zzahVar.f33759h.zza());
                    zzbh zzbhVar2 = zzahVar.f33763l;
                    if (zzbhVar2 != null) {
                        j12 = j11;
                        l(new zzbh(zzbhVar2, j12, j14), zzrVar);
                    } else {
                        j12 = j11;
                    }
                    l lVar8 = this.f13041c;
                    T(lVar8);
                    lVar8.E0(str2, zzahVar.f33759h.f33786g);
                    j11 = j12;
                }
            }
            long j15 = j11;
            l lVar9 = this.f13041c;
            T(lVar9);
            sg.w.e(str2);
            lVar9.D();
            lVar9.E();
            if (i5 < 0) {
                o0 o0Var2 = ((m1) lVar9.f13368a).f13138f;
                m1.l(o0Var2);
                o0Var2.f13193i.c(o0.L(str2), "Invalid time querying expired conditional properties", Long.valueOf(j15));
                listG02 = Collections.EMPTY_LIST;
            } else {
                listG02 = lVar9.G0("active<>0 and app_id=? and abs(? - triggered_timestamp) > time_to_live", new String[]{str2, String.valueOf(j15)});
            }
            ArrayList arrayList = new ArrayList(listG02.size());
            Iterator it2 = listG02.iterator();
            while (it2.hasNext()) {
                zzah zzahVar2 = (zzah) it2.next();
                if (zzahVar2 != null) {
                    Iterator it3 = it2;
                    int i11 = i5;
                    long j16 = j15;
                    b().n.d("User property expired", zzahVar2.f33757f, m1Var.f13142j.c(zzahVar2.f33759h.f33786g), zzahVar2.f33759h.zza());
                    l lVar10 = this.f13041c;
                    T(lVar10);
                    lVar10.x0(str2, zzahVar2.f33759h.f33786g);
                    zzbh zzbhVar3 = zzahVar2.f33765p;
                    if (zzbhVar3 != null) {
                        arrayList.add(zzbhVar3);
                    }
                    l lVar11 = this.f13041c;
                    T(lVar11);
                    lVar11.E0(str2, zzahVar2.f33759h.f33786g);
                    it2 = it3;
                    i5 = i11;
                    j15 = j16;
                }
            }
            int i12 = i5;
            long j17 = j15;
            Iterator it4 = arrayList.iterator();
            while (it4.hasNext()) {
                long j18 = j17;
                l(new zzbh((zzbh) it4.next(), j18, j14), zzrVar);
                j17 = j18;
                j14 = j14;
            }
            long j19 = j14;
            long j21 = j17;
            l lVar12 = this.f13041c;
            T(lVar12);
            sg.w.e(str2);
            sg.w.e(str4);
            lVar12.D();
            lVar12.E();
            if (i12 < 0) {
                m1 m1Var2 = (m1) lVar12.f13368a;
                o0 o0Var3 = m1Var2.f13138f;
                m1.l(o0Var3);
                o0Var3.f13193i.d("Invalid time querying triggered conditional properties", o0.L(str2), m1Var2.f13142j.a(str4), Long.valueOf(j21));
                listG03 = Collections.EMPTY_LIST;
            } else {
                listG03 = lVar12.G0("active=0 and app_id=? and trigger_event_name=? and abs(? - creation_timestamp) <= trigger_timeout", new String[]{str2, str4, String.valueOf(j21)});
            }
            ArrayList arrayList2 = new ArrayList(listG03.size());
            for (zzah zzahVar3 : listG03) {
                if (zzahVar3 != null) {
                    zzpl zzplVar = zzahVar3.f33759h;
                    String str5 = zzahVar3.f33757f;
                    sg.w.h(str5);
                    long j22 = j21;
                    String str6 = zzahVar3.f33758g;
                    String str7 = zzplVar.f33786g;
                    Object objZza = zzplVar.zza();
                    sg.w.h(objZza);
                    n4 n4Var = new n4(str5, str6, j22, str7, objZza);
                    j21 = j22;
                    Object obj = n4Var.f13184e;
                    String str8 = n4Var.f13182c;
                    l lVar13 = this.f13041c;
                    T(lVar13);
                    if (lVar13.y0(n4Var)) {
                        b().n.d("User property triggered", zzahVar3.f33757f, m1Var.f13142j.c(str8), obj);
                    } else {
                        b().f13190f.d("Too many active user properties, ignoring", o0.L(zzahVar3.f33757f), m1Var.f13142j.c(str8), obj);
                    }
                    zzbh zzbhVar4 = zzahVar3.n;
                    if (zzbhVar4 != null) {
                        arrayList2.add(zzbhVar4);
                    }
                    zzahVar3.f33759h = new zzpl(n4Var);
                    zzahVar3.f33761j = true;
                    l lVar14 = this.f13041c;
                    T(lVar14);
                    lVar14.C0(zzahVar3);
                }
            }
            l(zzbhVarB, zzrVar);
            Iterator it5 = arrayList2.iterator();
            while (it5.hasNext()) {
                long j23 = j19;
                l(new zzbh((zzbh) it5.next(), j21, j23), zzrVar);
                j19 = j23;
            }
            l lVar15 = this.f13041c;
            T(lVar15);
            lVar15.s0();
            l lVar16 = this.f13041c;
            T(lVar16);
            lVar16.t0();
        } catch (Throwable th2) {
            l lVar17 = this.f13041c;
            T(lVar17);
            lVar17.t0();
            throw th2;
        }
    }

    public final m4 j0() {
        m4 m4Var = this.f13045g;
        T(m4Var);
        return m4Var;
    }

    public final Bundle k(zzbh zzbhVar, String str) {
        Bundle bundle = new Bundle();
        bundle.putLong("_sid", zzbhVar.f33769g.f33767f.getLong("_sid"));
        l lVar = this.f13041c;
        T(lVar);
        n4 n4VarZ0 = lVar.z0(str, "_sno");
        if (n4VarZ0 != null) {
            Object obj = n4VarZ0.f13184e;
            if (obj instanceof Long) {
                bundle.putLong("_sno", ((Long) obj).longValue());
            }
        }
        return bundle;
    }

    public final p4 k0() {
        m1 m1Var = this.f13050l;
        sg.w.h(m1Var);
        p4 p4Var = m1Var.f13141i;
        m1.j(p4Var);
        return p4Var;
    }

    /* JADX WARN: Can't wrap try/catch for region: R(9:73|(4:75|(0)(1:78)|85|(1:87)(1:88))|77|79|343|80|84|85|(0)(0)) */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x02e4, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x02e5, code lost:
    
        ((ai.m1) r10.f13368a).b().H().c(ai.o0.L(r11), "Error pruning currencies. appId", r0);
     */
    /* JADX WARN: Removed duplicated region for block: B:101:0x03d1 A[Catch: all -> 0x01c3, TryCatch #3 {all -> 0x01c3, blocks: (B:37:0x01a1, B:40:0x01b0, B:42:0x01b8, B:48:0x01c7, B:90:0x0356, B:99:0x038e, B:101:0x03d1, B:103:0x03d6, B:104:0x03ed, B:106:0x03f8, B:108:0x0412, B:110:0x0418, B:111:0x042f, B:114:0x044c, B:118:0x046b, B:119:0x0482, B:120:0x048b, B:123:0x04a8, B:124:0x04bc, B:126:0x04c4, B:128:0x04ce, B:130:0x04d4, B:131:0x04db, B:132:0x04e8, B:138:0x052d, B:139:0x0542, B:141:0x0571, B:144:0x059b, B:146:0x05a5, B:150:0x05f2, B:152:0x061d, B:154:0x064a, B:155:0x064d, B:157:0x0655, B:158:0x0658, B:160:0x0660, B:161:0x0663, B:163:0x066b, B:164:0x066e, B:166:0x0677, B:167:0x067b, B:169:0x0689, B:170:0x068c, B:173:0x06bd, B:175:0x06cf, B:179:0x06e4, B:184:0x06f2, B:217:0x0774, B:219:0x077a, B:220:0x077d, B:222:0x0795, B:223:0x079f, B:225:0x07ac, B:227:0x07b6, B:228:0x07bb, B:237:0x07f0, B:187:0x06fb, B:191:0x070d, B:195:0x071c, B:199:0x072b, B:203:0x073a, B:207:0x0749, B:211:0x0756, B:215:0x0765, B:151:0x060d, B:135:0x0512, B:93:0x0368, B:94:0x0374, B:96:0x037a, B:98:0x0388, B:53:0x01e5, B:56:0x01f7, B:58:0x020c, B:64:0x0224, B:69:0x0254, B:71:0x025a, B:73:0x0268, B:75:0x0276, B:78:0x0289, B:85:0x0310, B:87:0x031a, B:79:0x02b9, B:80:0x02d2, B:84:0x02fa, B:83:0x02e5, B:67:0x0230, B:68:0x024e), top: B:342:0x01a1, inners: #4, #6 }] */
    /* JADX WARN: Removed duplicated region for block: B:105:0x03f6  */
    /* JADX WARN: Removed duplicated region for block: B:216:0x0772  */
    /* JADX WARN: Removed duplicated region for block: B:256:0x087c  */
    /* JADX WARN: Removed duplicated region for block: B:259:0x08c3 A[Catch: all -> 0x0855, TryCatch #5 {all -> 0x0855, blocks: (B:230:0x07cf, B:232:0x07d3, B:235:0x07e5, B:238:0x07f9, B:240:0x0803, B:242:0x080f, B:244:0x0819, B:246:0x0827, B:248:0x0841, B:252:0x085c, B:254:0x086a, B:255:0x0873, B:257:0x0880, B:259:0x08c3, B:262:0x08ce, B:263:0x08d8, B:264:0x08d9, B:266:0x08e3), top: B:345:0x07cf }] */
    /* JADX WARN: Removed duplicated region for block: B:266:0x08e3 A[Catch: all -> 0x0855, TRY_LEAVE, TryCatch #5 {all -> 0x0855, blocks: (B:230:0x07cf, B:232:0x07d3, B:235:0x07e5, B:238:0x07f9, B:240:0x0803, B:242:0x080f, B:244:0x0819, B:246:0x0827, B:248:0x0841, B:252:0x085c, B:254:0x086a, B:255:0x0873, B:257:0x0880, B:259:0x08c3, B:262:0x08ce, B:263:0x08d8, B:264:0x08d9, B:266:0x08e3), top: B:345:0x07cf }] */
    /* JADX WARN: Removed duplicated region for block: B:275:0x0943  */
    /* JADX WARN: Removed duplicated region for block: B:283:0x096c A[Catch: all -> 0x090d, TryCatch #7 {all -> 0x090d, blocks: (B:268:0x08ea, B:270:0x0901, B:274:0x0910, B:276:0x0946, B:278:0x094e, B:280:0x0958, B:281:0x0962, B:283:0x096c, B:284:0x0976, B:285:0x097f, B:287:0x0985, B:289:0x09cf, B:291:0x09e1, B:295:0x09fc, B:297:0x0a0c, B:294:0x09f0, B:301:0x0a1f, B:302:0x0a61, B:303:0x0a6c, B:304:0x0a81, B:306:0x0a87, B:315:0x0ace, B:316:0x0b21, B:318:0x0b32, B:332:0x0b99, B:323:0x0b4c, B:324:0x0b4f, B:309:0x0a94, B:311:0x0aba, B:329:0x0b6a, B:330:0x0b83, B:331:0x0b84), top: B:348:0x08ea, inners: #0, #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:287:0x0985 A[Catch: all -> 0x090d, TryCatch #7 {all -> 0x090d, blocks: (B:268:0x08ea, B:270:0x0901, B:274:0x0910, B:276:0x0946, B:278:0x094e, B:280:0x0958, B:281:0x0962, B:283:0x096c, B:284:0x0976, B:285:0x097f, B:287:0x0985, B:289:0x09cf, B:291:0x09e1, B:295:0x09fc, B:297:0x0a0c, B:294:0x09f0, B:301:0x0a1f, B:302:0x0a61, B:303:0x0a6c, B:304:0x0a81, B:306:0x0a87, B:315:0x0ace, B:316:0x0b21, B:318:0x0b32, B:332:0x0b99, B:323:0x0b4c, B:324:0x0b4f, B:309:0x0a94, B:311:0x0aba, B:329:0x0b6a, B:330:0x0b83, B:331:0x0b84), top: B:348:0x08ea, inners: #0, #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:299:0x0a17  */
    /* JADX WARN: Removed duplicated region for block: B:306:0x0a87 A[Catch: all -> 0x090d, TryCatch #7 {all -> 0x090d, blocks: (B:268:0x08ea, B:270:0x0901, B:274:0x0910, B:276:0x0946, B:278:0x094e, B:280:0x0958, B:281:0x0962, B:283:0x096c, B:284:0x0976, B:285:0x097f, B:287:0x0985, B:289:0x09cf, B:291:0x09e1, B:295:0x09fc, B:297:0x0a0c, B:294:0x09f0, B:301:0x0a1f, B:302:0x0a61, B:303:0x0a6c, B:304:0x0a81, B:306:0x0a87, B:315:0x0ace, B:316:0x0b21, B:318:0x0b32, B:332:0x0b99, B:323:0x0b4c, B:324:0x0b4f, B:309:0x0a94, B:311:0x0aba, B:329:0x0b6a, B:330:0x0b83, B:331:0x0b84), top: B:348:0x08ea, inners: #0, #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:318:0x0b32 A[Catch: all -> 0x090d, SQLiteException -> 0x0b48, TRY_LEAVE, TryCatch #0 {SQLiteException -> 0x0b48, blocks: (B:316:0x0b21, B:318:0x0b32), top: B:337:0x0b21, outer: #7 }] */
    /* JADX WARN: Removed duplicated region for block: B:322:0x0b4a  */
    /* JADX WARN: Removed duplicated region for block: B:355:0x0a94 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:87:0x031a A[Catch: all -> 0x01c3, TryCatch #3 {all -> 0x01c3, blocks: (B:37:0x01a1, B:40:0x01b0, B:42:0x01b8, B:48:0x01c7, B:90:0x0356, B:99:0x038e, B:101:0x03d1, B:103:0x03d6, B:104:0x03ed, B:106:0x03f8, B:108:0x0412, B:110:0x0418, B:111:0x042f, B:114:0x044c, B:118:0x046b, B:119:0x0482, B:120:0x048b, B:123:0x04a8, B:124:0x04bc, B:126:0x04c4, B:128:0x04ce, B:130:0x04d4, B:131:0x04db, B:132:0x04e8, B:138:0x052d, B:139:0x0542, B:141:0x0571, B:144:0x059b, B:146:0x05a5, B:150:0x05f2, B:152:0x061d, B:154:0x064a, B:155:0x064d, B:157:0x0655, B:158:0x0658, B:160:0x0660, B:161:0x0663, B:163:0x066b, B:164:0x066e, B:166:0x0677, B:167:0x067b, B:169:0x0689, B:170:0x068c, B:173:0x06bd, B:175:0x06cf, B:179:0x06e4, B:184:0x06f2, B:217:0x0774, B:219:0x077a, B:220:0x077d, B:222:0x0795, B:223:0x079f, B:225:0x07ac, B:227:0x07b6, B:228:0x07bb, B:237:0x07f0, B:187:0x06fb, B:191:0x070d, B:195:0x071c, B:199:0x072b, B:203:0x073a, B:207:0x0749, B:211:0x0756, B:215:0x0765, B:151:0x060d, B:135:0x0512, B:93:0x0368, B:94:0x0374, B:96:0x037a, B:98:0x0388, B:53:0x01e5, B:56:0x01f7, B:58:0x020c, B:64:0x0224, B:69:0x0254, B:71:0x025a, B:73:0x0268, B:75:0x0276, B:78:0x0289, B:85:0x0310, B:87:0x031a, B:79:0x02b9, B:80:0x02d2, B:84:0x02fa, B:83:0x02e5, B:67:0x0230, B:68:0x024e), top: B:342:0x01a1, inners: #4, #6 }] */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0347  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0365  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0368 A[Catch: all -> 0x01c3, TryCatch #3 {all -> 0x01c3, blocks: (B:37:0x01a1, B:40:0x01b0, B:42:0x01b8, B:48:0x01c7, B:90:0x0356, B:99:0x038e, B:101:0x03d1, B:103:0x03d6, B:104:0x03ed, B:106:0x03f8, B:108:0x0412, B:110:0x0418, B:111:0x042f, B:114:0x044c, B:118:0x046b, B:119:0x0482, B:120:0x048b, B:123:0x04a8, B:124:0x04bc, B:126:0x04c4, B:128:0x04ce, B:130:0x04d4, B:131:0x04db, B:132:0x04e8, B:138:0x052d, B:139:0x0542, B:141:0x0571, B:144:0x059b, B:146:0x05a5, B:150:0x05f2, B:152:0x061d, B:154:0x064a, B:155:0x064d, B:157:0x0655, B:158:0x0658, B:160:0x0660, B:161:0x0663, B:163:0x066b, B:164:0x066e, B:166:0x0677, B:167:0x067b, B:169:0x0689, B:170:0x068c, B:173:0x06bd, B:175:0x06cf, B:179:0x06e4, B:184:0x06f2, B:217:0x0774, B:219:0x077a, B:220:0x077d, B:222:0x0795, B:223:0x079f, B:225:0x07ac, B:227:0x07b6, B:228:0x07bb, B:237:0x07f0, B:187:0x06fb, B:191:0x070d, B:195:0x071c, B:199:0x072b, B:203:0x073a, B:207:0x0749, B:211:0x0756, B:215:0x0765, B:151:0x060d, B:135:0x0512, B:93:0x0368, B:94:0x0374, B:96:0x037a, B:98:0x0388, B:53:0x01e5, B:56:0x01f7, B:58:0x020c, B:64:0x0224, B:69:0x0254, B:71:0x025a, B:73:0x0268, B:75:0x0276, B:78:0x0289, B:85:0x0310, B:87:0x031a, B:79:0x02b9, B:80:0x02d2, B:84:0x02fa, B:83:0x02e5, B:67:0x0230, B:68:0x024e), top: B:342:0x01a1, inners: #4, #6 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void l(zzbh zzbhVar, zzr zzrVar) throws Throwable {
        String str;
        j4 j4Var;
        int i5;
        boolean z11;
        String str2;
        boolean z12;
        long jRound;
        String str3;
        String str4;
        String str5;
        g4 g4Var;
        String str6;
        zzbf zzbfVar;
        n4 n4Var;
        long length;
        long jIntValue;
        long jDelete;
        g4 g4Var2;
        p pVar;
        q qVar;
        String str7;
        String str8;
        t0 t0VarH0;
        p pVar2;
        long j11;
        t0 t0VarH02;
        int i11;
        List listA0;
        int i12;
        l lVarG0;
        ka kaVar;
        l lVarG02;
        Iterator<String> it;
        ContentValues contentValues;
        String str9;
        long jM0;
        List listU;
        long j12;
        boolean z13;
        n4 n4VarZ0;
        sg.w.h(zzrVar);
        boolean z14 = zzrVar.f33799m;
        String str10 = zzrVar.f33792f;
        sg.w.e(str10);
        long jNanoTime = System.nanoTime();
        c().D();
        l0();
        j0();
        String str11 = zzrVar.f33793g;
        if (TextUtils.isEmpty(str11)) {
            return;
        }
        if (!z14) {
            c0(zzrVar);
            return;
        }
        g1 g1VarF0 = f0();
        String str12 = zzbhVar.f33768f;
        boolean zS = g1VarF0.S(str10, str12);
        m1 m1Var = this.f13050l;
        g4 g4Var3 = this.J;
        if (zS) {
            b().I().c(o0.L(str10), "Dropping blocked event. appId", m1Var.m().a(str12));
            if (!"1".equals(f0().f(str10, "measurement.upload.blacklist_internal")) && !"1".equals(f0().f(str10, "measurement.upload.blacklist_public"))) {
                if ("_err".equals(str12)) {
                    return;
                }
                k0();
                p4.V(g4Var3, str10, 11, "_ev", str12, 0);
                return;
            }
            t0 t0VarH03 = g0().H0(str10);
            if (t0VarH03 != null) {
                m1 m1Var2 = t0VarH03.f13310a;
                k1 k1Var = m1Var2.f13139g;
                m1.l(k1Var);
                k1Var.D();
                long j13 = t0VarH03.T;
                k1 k1Var2 = m1Var2.f13139g;
                m1.l(k1Var2);
                k1Var2.D();
                long jMax = Math.max(j13, t0VarH03.S);
                e().getClass();
                long jAbs = Math.abs(System.currentTimeMillis() - jMax);
                e0();
                if (jAbs > ((Long) x.N.a(null)).longValue()) {
                    b().J().a("Fetching config for blocked app");
                    A(t0VarH03);
                    return;
                }
                return;
            }
            return;
        }
        p0 p0VarA = p0.a(zzbhVar);
        p4 p4VarK0 = k0();
        e eVarE0 = e0();
        eVarE0.getClass();
        p4VarK0.O(p0VarA, Math.max(Math.min(eVarE0.M(str10, x.X), 100), 25));
        int iMax = Math.max(Math.min(e0().M(str10, x.f13416f0), 35), 10);
        Bundle bundle = p0VarA.f13220e;
        Iterator it2 = new TreeSet(bundle.keySet()).iterator();
        while (it2.hasNext()) {
            String str13 = (String) it2.next();
            Iterator it3 = it2;
            if ("items".equals(str13)) {
                k0().P(bundle.getParcelableArray(str13), iMax);
            }
            it2 = it3;
        }
        zzbh zzbhVarB = p0VarA.b();
        zzbf zzbfVar2 = zzbhVarB.f33769g;
        String str14 = zzbhVarB.f33768f;
        if (Log.isLoggable(b().N(), 2)) {
            str = "_err";
            b().K().b(m1Var.m().d(zzbhVarB), "Logging event");
        } else {
            str = "_err";
        }
        g0().r0();
        try {
            c0(zzrVar);
            i5 = 1;
            z11 = "ecommerce_purchase".equals(str14) || "purchase".equals(str14) || "refund".equals(str14);
        } catch (Throwable th2) {
            th = th2;
            j4Var = this;
        }
        if (!"_iap".equals(str14)) {
            if (!z11) {
                str2 = "app_id";
                str3 = "_fx";
                z12 = z14;
                zzbfVar = zzbfVar2;
                str4 = str14;
                str5 = str11;
                g4Var = g4Var3;
                str6 = str;
                boolean zD0 = p4.D0(str4);
                String str15 = str4;
                boolean zEquals = str6.equals(str15);
                k0();
                if (zzbfVar == null) {
                    length = 0;
                } else {
                    Iterator<String> it4 = zzbfVar.f33767f.keySet().iterator();
                    length = 0;
                    while (it4.hasNext()) {
                        if (zzbfVar.b(it4.next()) instanceof Parcelable[]) {
                            length += ((Parcelable[]) r5).length;
                        }
                    }
                }
                zzbf zzbfVar3 = zzbfVar;
                g gVarK0 = g0().K0(g(), str10, length + 1, true, zD0, false, zEquals, false, false, false);
                long j14 = gVarK0.f12958b;
                e0();
                jIntValue = j14 - ((Integer) x.f13429l.a(null)).intValue();
                if (jIntValue <= 0) {
                    if (zD0) {
                        long j15 = gVarK0.f12957a;
                        e0();
                        long jIntValue2 = j15 - ((Integer) x.n.a(null)).intValue();
                        if (jIntValue2 > 0) {
                            if (jIntValue2 % 1000 == 1) {
                                b().H().c(o0.L(str10), "Data loss. Too many public events logged. appId, count", Long.valueOf(gVarK0.f12957a));
                            }
                            k0();
                            p4.V(g4Var, str10, 16, "_ev", zzbhVarB.f33768f, 0);
                            g0().s0();
                        }
                    }
                    if (zEquals) {
                        long jMax2 = gVarK0.f12960d - Math.max(0, Math.min(1000000, e0().M(str10, x.f13431m)));
                        if (jMax2 > 0) {
                            if (jMax2 == 1) {
                                b().H().c(o0.L(str10), "Too many error events logged. appId, count", Long.valueOf(gVarK0.f12960d));
                            }
                            g0().s0();
                        }
                    }
                    Bundle bundleP = zzbfVar3.p();
                    k0().U(bundleP, "_o", zzbhVarB.f33770h);
                    if (k0().i0(str10, zzrVar.G)) {
                        k0().U(bundleP, "_dbg", 1L);
                        k0().U(bundleP, "_r", 1L);
                    }
                    if ("_s".equals(str15) && (n4VarZ0 = g0().z0(str10, "_sno")) != null) {
                        Object obj = n4VarZ0.f13184e;
                        if (obj instanceof Long) {
                            k0().U(bundleP, "_sno", obj);
                        }
                    }
                    l lVarG03 = g0();
                    sg.w.e(str10);
                    lVarG03.D();
                    lVarG03.E();
                    try {
                        jDelete = lVarG03.u0().delete("raw_events", "rowid in (select rowid from raw_events where app_id=? order by rowid desc limit -1 offset ?)", new String[]{str10, String.valueOf(Math.max(0, Math.min(1000000, ((m1) lVarG03.f13368a).f13136d.M(str10, x.f13437q))))});
                    } catch (SQLiteException e3) {
                        ((m1) lVarG03.f13368a).b().H().c(o0.L(str10), "Error deleting over the limit events. appId", e3);
                        jDelete = 0;
                    }
                    if (jDelete > 0) {
                        b().I().c(o0.L(str10), "Data lost. Too many events stored on disk, deleted. appId", Long.valueOf(jDelete));
                    }
                    m1 m1Var3 = this.f13050l;
                    p pVar3 = new p(m1Var3, zzbhVarB.f33770h, str10, zzbhVarB.f33768f, zzbhVarB.f33771i, zzbhVarB.f33772j, 0L, bundleP);
                    String str16 = str10;
                    l lVarG04 = g0();
                    String str17 = pVar3.f13210b;
                    q qVarD0 = lVarG04.d0(DatabaseConstants.EVENT_TABLE_NAME, str16, str17);
                    if (qVarD0 == null) {
                        long jU = g0().U(str16);
                        e0().getClass();
                        w wVar = x.W;
                        if (jU < Math.max(Math.min(r5.M(str16, wVar), 2000), 500) || !zD0 || k0().L0(str17)) {
                            str16 = str16;
                            g4Var2 = g4Var;
                            qVar = new q(str16, str17, 0L, 0L, 0L, pVar3.f13212d, 0L, null, null, null, null);
                            pVar = pVar3;
                        } else {
                            m0 m0VarH = b().H();
                            n0 n0VarL = o0.L(str16);
                            String strA = m1Var3.m().a(str17);
                            e eVarE02 = e0();
                            eVarE02.getClass();
                            m0VarH.d("Too many event names used, ignoring event. appId, name, supported count", n0VarL, strA, Integer.valueOf(Math.max(Math.min(eVarE02.M(str16, wVar), 2000), 500)));
                            k0();
                            p4.V(g4Var, str16, 8, null, null, 0);
                        }
                    } else {
                        g4Var2 = g4Var;
                        p pVarA = pVar3.a(m1Var3, qVarD0.f13250f);
                        q qVarA = qVarD0.a(pVarA.f13212d);
                        pVar = pVarA;
                        qVar = qVarA;
                    }
                    g0().e0(DatabaseConstants.EVENT_TABLE_NAME, qVar);
                    c().D();
                    l0();
                    String str18 = pVar.f13209a;
                    sg.w.e(str18);
                    sg.w.c(str18.equals(str16));
                    ja jaVarC0 = ka.c0();
                    jaVarC0.C();
                    jaVarC0.k();
                    if (!TextUtils.isEmpty(str16)) {
                        jaVarC0.t(str16);
                    }
                    String str19 = zzrVar.f33795i;
                    if (!TextUtils.isEmpty(str19)) {
                        jaVarC0.q(str19);
                    }
                    String str20 = zzrVar.f33794h;
                    if (!TextUtils.isEmpty(str20)) {
                        jaVarC0.u(str20);
                    }
                    String str21 = zzrVar.f33810z;
                    if (!TextUtils.isEmpty(str21)) {
                        jaVarC0.W(str21);
                    }
                    long j16 = zzrVar.o;
                    if (j16 != -2147483648L) {
                        jaVarC0.P((int) j16);
                    }
                    long j17 = zzrVar.f33796j;
                    jaVarC0.v(j17);
                    if (!TextUtils.isEmpty(str5)) {
                        jaVarC0.L(str5);
                    }
                    sg.w.h(str16);
                    a2 a2VarF = f(str16);
                    String str22 = str21;
                    String str23 = zzrVar.f33808x;
                    a2 a2VarJ = a2VarF.j(a2.c(100, str23));
                    jaVarC0.V(a2VarJ.f());
                    z4.a();
                    boolean zO = e0().O(str16, x.O0);
                    z1 z1Var = z1.AD_STORAGE;
                    if (zO) {
                        k0();
                        if (p4.f0((String) x.f13438q0.a(null), str16)) {
                            jaVarC0.D(zzrVar.E);
                            str7 = str5;
                            str8 = str20;
                            long j18 = zzrVar.F;
                            if (!a2VarJ.i(z1Var) && j18 != 0) {
                                j18 = (j18 & (-2)) | 32;
                            }
                            jaVarC0.Y(j18 == 1);
                            if (j18 != 0) {
                                r9 r9VarE = s9.E();
                                if ((j18 & 1) != 0) {
                                    j12 = j18;
                                    z13 = true;
                                } else {
                                    j12 = j18;
                                    z13 = false;
                                }
                                r9VarE.i(z13);
                                r9VarE.j((j12 & 2) != 0);
                                r9VarE.k((j12 & 4) != 0);
                                r9VarE.m((j12 & 8) != 0);
                                r9VarE.n((j12 & 16) != 0);
                                r9VarE.o((j12 & 32) != 0);
                                r9VarE.q((j12 & 64) != 0);
                                jaVarC0.E((s9) r9VarE.f());
                            }
                        } else {
                            str7 = str5;
                            str8 = str20;
                        }
                        long j19 = zzrVar.f33797k;
                        if (j19 != 0) {
                            jaVarC0.A(j19);
                        }
                        long j21 = zzrVar.f33806v;
                        jaVarC0.T(j21);
                        String str24 = str7;
                        String str25 = str8;
                        if (e0().O(null, x.U0)) {
                            e0();
                            jaVarC0.I(com.google.android.gms.internal.measurement.j3.a());
                        }
                        if (e0().O(null, x.V0) && (listU = f0().U(str16)) != null) {
                            jaVarC0.R(listU);
                        }
                        a2 a2VarJ2 = f(str16).j(a2.c(100, str23));
                        if (a2VarJ2.i(z1Var)) {
                            try {
                                boolean z15 = zzrVar.f33803s;
                                if (z15) {
                                    Pair pairH = this.f13047i.H(zzrVar, a2VarJ2);
                                    if (TextUtils.isEmpty((CharSequence) pairH.first) || !z15) {
                                        pVar2 = pVar;
                                        j11 = j21;
                                        m1Var3.p().F();
                                        String str26 = Build.MODEL;
                                        jaVarC0.m();
                                        m1Var3.p().F();
                                        String str27 = Build.VERSION.RELEASE;
                                        jaVarC0.c();
                                        ((ka) jaVarC0.f32762b).w0(str27);
                                        jaVarC0.o((int) m1Var3.p().H());
                                        jaVarC0.n(m1Var3.p().I());
                                        jaVarC0.X(zzrVar.B);
                                        if (m1Var3.f()) {
                                            jaVarC0.r();
                                            if (!TextUtils.isEmpty(null)) {
                                                jaVarC0.c();
                                                ((ka) jaVarC0.f32762b).Z0(null);
                                                throw null;
                                            }
                                        }
                                        t0VarH02 = g0().H0(str16);
                                        if (t0VarH02 != null) {
                                            t0VarH02 = new t0(m1Var3, str16);
                                            j4Var = this;
                                            try {
                                                t0VarH02.G(j4Var.o(a2VarJ2));
                                                t0VarH02.L(zzrVar.f33800p);
                                                t0VarH02.I(str24);
                                                if (a2VarJ2.i(z1Var)) {
                                                    t0VarH02.J(j4Var.f13047i.J(zzrVar, a2VarJ2));
                                                }
                                                t0VarH02.e(0L);
                                                t0VarH02.M(0L);
                                                t0VarH02.N(0L);
                                                t0VarH02.P(str25);
                                                t0VarH02.R(j16);
                                                t0VarH02.S(str19);
                                                t0VarH02.T(j17);
                                                t0VarH02.a(j19);
                                                t0VarH02.d(z12);
                                                t0VarH02.c(j11);
                                                i11 = 0;
                                                j4Var.g0().I0(t0VarH02, false);
                                            } catch (Throwable th3) {
                                                th = th3;
                                            }
                                        } else {
                                            i11 = 0;
                                            j4Var = this;
                                        }
                                        if (a2VarJ2.i(z1.ANALYTICS_STORAGE) && !TextUtils.isEmpty(t0VarH02.F())) {
                                            String strF = t0VarH02.F();
                                            sg.w.h(strF);
                                            jaVarC0.z(strF);
                                        }
                                        if (!TextUtils.isEmpty(t0VarH02.K())) {
                                            String strK = t0VarH02.K();
                                            sg.w.h(strK);
                                            jaVarC0.O(strK);
                                        }
                                        listA0 = j4Var.g0().A0(str16);
                                        i12 = i11;
                                        while (i12 < listA0.size()) {
                                            sa saVarI = ta.I();
                                            String str28 = ((n4) listA0.get(i12)).f13182c;
                                            saVarI.c();
                                            ((ta) saVarI.f32762b).K(str28);
                                            long j22 = ((n4) listA0.get(i12)).f13183d;
                                            saVarI.c();
                                            ((ta) saVarI.f32762b).J(j22);
                                            j4Var.j0().a0(saVarI, ((n4) listA0.get(i12)).f13184e);
                                            jaVarC0.e0(saVarI);
                                            if ("_sid".equals(((n4) listA0.get(i12)).f13182c)) {
                                                k1 k1Var3 = t0VarH02.f13310a.f13139g;
                                                m1.l(k1Var3);
                                                k1Var3.D();
                                                if (t0VarH02.f13330w != 0) {
                                                    m4 m4VarJ0 = j4Var.j0();
                                                    if (TextUtils.isEmpty(str22)) {
                                                        str9 = str22;
                                                        jM0 = 0;
                                                    } else {
                                                        str9 = str22;
                                                        jM0 = m4VarJ0.m0(str9.getBytes(StandardCharsets.UTF_8));
                                                    }
                                                    k1 k1Var4 = t0VarH02.f13310a.f13139g;
                                                    m1.l(k1Var4);
                                                    k1Var4.D();
                                                    if (jM0 != t0VarH02.f13330w) {
                                                        jaVarC0.c();
                                                        ((ka) jaVarC0.f32762b).h1();
                                                    }
                                                } else {
                                                    str9 = str22;
                                                }
                                            }
                                            i12++;
                                            str22 = str9;
                                        }
                                        try {
                                            lVarG0 = j4Var.g0();
                                            kaVar = (ka) jaVarC0.f();
                                            lVarG0.D();
                                            lVarG0.E();
                                            sg.w.e(kaVar.x());
                                            byte[] bArrA = kaVar.a();
                                            long jM02 = lVarG0.f12889b.j0().m0(bArrA);
                                            ContentValues contentValues2 = new ContentValues();
                                            String str29 = str2;
                                            contentValues2.put(str29, kaVar.x());
                                            contentValues2.put("metadata_fingerprint", Long.valueOf(jM02));
                                            contentValues2.put("metadata", bArrA);
                                        } catch (IOException e11) {
                                            j4Var.b().H().c(o0.L(jaVarC0.r()), "Data loss. Failed to insert raw event metadata. appId", e11);
                                        }
                                        try {
                                            lVarG0.u0().insertWithOnConflict("raw_events_metadata", null, contentValues2, 4);
                                            lVarG02 = j4Var.g0();
                                            p pVar4 = pVar2;
                                            zzbf zzbfVar4 = pVar4.f13215g;
                                            Objects.requireNonNull(zzbfVar4);
                                            it = zzbfVar4.f33767f.keySet().iterator();
                                            while (true) {
                                                if (it.hasNext()) {
                                                    g1 g1VarF02 = j4Var.f0();
                                                    String str30 = pVar4.f13209a;
                                                    boolean zT = g1VarF02.T(str30, pVar4.f13210b);
                                                    g gVarJ0 = j4Var.g0().J0(j4Var.g(), str30, false, false, false, false);
                                                    if (!zT || gVarJ0.f12961e >= j4Var.e0().M(str30, x.f13435p)) {
                                                        i5 = i11;
                                                    }
                                                } else if ("_r".equals(it.next())) {
                                                    break;
                                                }
                                            }
                                            lVarG02.D();
                                            lVarG02.E();
                                            String str31 = pVar4.f13209a;
                                            sg.w.e(str31);
                                            byte[] bArrA2 = lVarG02.f12889b.j0().d0(pVar4).a();
                                            contentValues = new ContentValues();
                                            contentValues.put(str29, str31);
                                            contentValues.put(PendingUpgradeStore.KEY_NAME, pVar4.f13210b);
                                            contentValues.put("timestamp", Long.valueOf(pVar4.f13212d));
                                            contentValues.put("metadata_fingerprint", Long.valueOf(jM02));
                                            contentValues.put("data", bArrA2);
                                            contentValues.put("realtime", Integer.valueOf(i5));
                                            contentValues.put("elapsed_time", Long.valueOf(pVar4.f13213e));
                                            try {
                                                if (lVarG02.u0().insert("raw_events", null, contentValues) != -1) {
                                                    ((m1) lVarG02.f13368a).b().H().b(o0.L(str31), "Failed to insert raw event (got -1). appId");
                                                } else {
                                                    j4Var.o = 0L;
                                                }
                                            } catch (SQLiteException e12) {
                                                ((m1) lVarG02.f13368a).b().H().c(o0.L(pVar4.f13209a), "Error storing raw event. appId", e12);
                                            }
                                            j4Var.g0().s0();
                                            j4Var.g0().t0();
                                            j4Var.N();
                                            j4Var.b().K().b(Long.valueOf(((System.nanoTime() - jNanoTime) + 500000) / 1000000), "Background event processing time, ms");
                                            return;
                                        } catch (SQLiteException e13) {
                                            ((m1) lVarG0.f13368a).b().H().c(o0.L(kaVar.x()), "Error storing raw event metadata. appId", e13);
                                            throw e13;
                                        }
                                    }
                                    jaVarC0.x((String) pairH.first);
                                    Object obj2 = pairH.second;
                                    if (obj2 != null) {
                                        jaVarC0.y(((Boolean) obj2).booleanValue());
                                    }
                                    String str32 = str3;
                                    if (!pVar.f13210b.equals(str32) && !((String) pairH.first).equals("00000000-0000-0000-0000-000000000000") && (t0VarH0 = g0().H0(str16)) != null) {
                                        k1 k1Var5 = t0VarH0.f13310a.f13139g;
                                        m1.l(k1Var5);
                                        k1Var5.D();
                                        if (t0VarH0.f13332y) {
                                            pVar2 = pVar;
                                            u(str16, false, null, null);
                                            Bundle bundle2 = new Bundle();
                                            k1 k1Var6 = t0VarH0.f13310a.f13139g;
                                            m1.l(k1Var6);
                                            k1Var6.D();
                                            Long l9 = t0VarH0.f13333z;
                                            if (l9 != null) {
                                                j11 = j21;
                                                bundle2.putLong("_pfo", Math.max(0L, l9.longValue()));
                                            } else {
                                                j11 = j21;
                                            }
                                            k1 k1Var7 = t0VarH0.f13310a.f13139g;
                                            m1.l(k1Var7);
                                            k1Var7.D();
                                            Long l11 = t0VarH0.A;
                                            if (l11 != null) {
                                                bundle2.putLong("_uwa", l11.longValue());
                                            }
                                            bundle2.putLong("_r", 1L);
                                            g4Var2.d(str16, str32, bundle2);
                                        }
                                        m1Var3.p().F();
                                        String str262 = Build.MODEL;
                                        jaVarC0.m();
                                        m1Var3.p().F();
                                        String str272 = Build.VERSION.RELEASE;
                                        jaVarC0.c();
                                        ((ka) jaVarC0.f32762b).w0(str272);
                                        jaVarC0.o((int) m1Var3.p().H());
                                        jaVarC0.n(m1Var3.p().I());
                                        jaVarC0.X(zzrVar.B);
                                        if (m1Var3.f()) {
                                        }
                                        t0VarH02 = g0().H0(str16);
                                        if (t0VarH02 != null) {
                                        }
                                        if (a2VarJ2.i(z1.ANALYTICS_STORAGE)) {
                                            String strF2 = t0VarH02.F();
                                            sg.w.h(strF2);
                                            jaVarC0.z(strF2);
                                        }
                                        if (!TextUtils.isEmpty(t0VarH02.K())) {
                                        }
                                        listA0 = j4Var.g0().A0(str16);
                                        i12 = i11;
                                        while (i12 < listA0.size()) {
                                        }
                                        lVarG0 = j4Var.g0();
                                        kaVar = (ka) jaVarC0.f();
                                        lVarG0.D();
                                        lVarG0.E();
                                        sg.w.e(kaVar.x());
                                        byte[] bArrA3 = kaVar.a();
                                        long jM022 = lVarG0.f12889b.j0().m0(bArrA3);
                                        ContentValues contentValues22 = new ContentValues();
                                        String str292 = str2;
                                        contentValues22.put(str292, kaVar.x());
                                        contentValues22.put("metadata_fingerprint", Long.valueOf(jM022));
                                        contentValues22.put("metadata", bArrA3);
                                        lVarG0.u0().insertWithOnConflict("raw_events_metadata", null, contentValues22, 4);
                                        lVarG02 = j4Var.g0();
                                        p pVar42 = pVar2;
                                        zzbf zzbfVar42 = pVar42.f13215g;
                                        Objects.requireNonNull(zzbfVar42);
                                        it = zzbfVar42.f33767f.keySet().iterator();
                                        while (true) {
                                            if (it.hasNext()) {
                                            }
                                        }
                                        lVarG02.D();
                                        lVarG02.E();
                                        String str312 = pVar42.f13209a;
                                        sg.w.e(str312);
                                        byte[] bArrA22 = lVarG02.f12889b.j0().d0(pVar42).a();
                                        contentValues = new ContentValues();
                                        contentValues.put(str292, str312);
                                        contentValues.put(PendingUpgradeStore.KEY_NAME, pVar42.f13210b);
                                        contentValues.put("timestamp", Long.valueOf(pVar42.f13212d));
                                        contentValues.put("metadata_fingerprint", Long.valueOf(jM022));
                                        contentValues.put("data", bArrA22);
                                        contentValues.put("realtime", Integer.valueOf(i5));
                                        contentValues.put("elapsed_time", Long.valueOf(pVar42.f13213e));
                                        if (lVarG02.u0().insert("raw_events", null, contentValues) != -1) {
                                        }
                                        j4Var.g0().s0();
                                        j4Var.g0().t0();
                                        j4Var.N();
                                        j4Var.b().K().b(Long.valueOf(((System.nanoTime() - jNanoTime) + 500000) / 1000000), "Background event processing time, ms");
                                        return;
                                    }
                                }
                            } catch (Throwable th4) {
                                th = th4;
                                j4Var = this;
                            }
                        }
                    }
                    j4Var.g0().t0();
                    throw th;
                }
                if (jIntValue % 1000 == 1) {
                    b().H().c(o0.L(str10), "Data loss. Too many events logged. appId, count", Long.valueOf(gVarK0.f12958b));
                }
                g0().s0();
                g0().t0();
            }
            z11 = true;
        }
        String strL = zzbfVar2.l();
        str2 = "app_id";
        Bundle bundle3 = zzbfVar2.f33767f;
        if (z11) {
            double dDoubleValue = zzbfVar2.d().doubleValue() * 1000000.0d;
            if (dDoubleValue == 0.0d) {
                z12 = z14;
                dDoubleValue = bundle3.getLong("value") * 1000000.0d;
            } else {
                z12 = z14;
            }
            if (dDoubleValue > 9.223372036854776E18d || dDoubleValue < -9.223372036854776E18d) {
                b().I().c(o0.L(str10), "Data lost. Currency value is too big. appId", Double.valueOf(dDoubleValue));
                g0().s0();
                g0().t0();
            } else {
                jRound = Math.round(dDoubleValue);
                if ("refund".equals(str14)) {
                    jRound = -jRound;
                }
            }
        } else {
            z12 = z14;
            jRound = bundle3.getLong("value");
        }
        if (!TextUtils.isEmpty(strL)) {
            String upperCase = strL.toUpperCase(Locale.US);
            if (upperCase.matches("[A-Z]{3}")) {
                String strConcat = "_ltv_".concat(upperCase);
                n4 n4VarZ02 = g0().z0(str10, strConcat);
                if (n4VarZ02 != null) {
                    Object obj3 = n4VarZ02.f13184e;
                    if (obj3 instanceof Long) {
                        String str33 = zzbhVarB.f33770h;
                        e().getClass();
                        long jCurrentTimeMillis = System.currentTimeMillis();
                        Long lValueOf = Long.valueOf(((Long) obj3).longValue() + jRound);
                        str4 = str14;
                        str3 = "_fx";
                        str5 = str11;
                        str6 = str;
                        zzbfVar = zzbfVar2;
                        n4Var = new n4(str10, str33, jCurrentTimeMillis, strConcat, lValueOf);
                    }
                    if (g0().y0(n4Var)) {
                        b().H().d("Too many unique user properties are set. Ignoring user property. appId", o0.L(str10), m1Var.m().c(n4Var.f13182c), n4Var.f13184e);
                        k0();
                        p4.V(g4Var3, str10, 9, null, null, 0);
                        g4Var = g4Var3;
                    } else {
                        g4Var = g4Var3;
                    }
                }
                str3 = "_fx";
                long j23 = jRound;
                str4 = str14;
                str5 = str11;
                str6 = str;
                zzbfVar = zzbfVar2;
                l lVarG05 = g0();
                int iM = e0().M(str10, x.T) - 1;
                sg.w.e(str10);
                lVarG05.D();
                lVarG05.E();
                lVarG05.u0().execSQL("delete from user_attributes where app_id=? and name in (select name from user_attributes where app_id=? and name like '!_ltv!_%' escape '!'order by set_timestamp desc limit ?,10);", new String[]{str10, str10, String.valueOf(iM)});
                String str34 = zzbhVarB.f33770h;
                e().getClass();
                n4Var = new n4(str10, str34, System.currentTimeMillis(), strConcat, Long.valueOf(j23));
                if (g0().y0(n4Var)) {
                }
            }
            boolean zD02 = p4.D0(str4);
            String str152 = str4;
            boolean zEquals2 = str6.equals(str152);
            k0();
            if (zzbfVar == null) {
            }
            zzbf zzbfVar32 = zzbfVar;
            g gVarK02 = g0().K0(g(), str10, length + 1, true, zD02, false, zEquals2, false, false, false);
            long j142 = gVarK02.f12958b;
            e0();
            jIntValue = j142 - ((Integer) x.f13429l.a(null)).intValue();
            if (jIntValue <= 0) {
            }
            g0().t0();
        }
        str3 = "_fx";
        str4 = str14;
        str5 = str11;
        g4Var = g4Var3;
        str6 = str;
        zzbfVar = zzbfVar2;
        boolean zD022 = p4.D0(str4);
        String str1522 = str4;
        boolean zEquals22 = str6.equals(str1522);
        k0();
        if (zzbfVar == null) {
        }
        zzbf zzbfVar322 = zzbfVar;
        g gVarK022 = g0().K0(g(), str10, length + 1, true, zD022, false, zEquals22, false, false, false);
        long j1422 = gVarK022.f12958b;
        e0();
        jIntValue = j1422 - ((Integer) x.f13429l.a(null)).intValue();
        if (jIntValue <= 0) {
        }
        g0().t0();
    }

    public final void l0() {
        if (!this.f13051m.get()) {
            throw new IllegalStateException("UploadController is not initialized");
        }
    }

    public final void m(t0 t0Var, ja jaVar) {
        a5.d dVar;
        ta taVar;
        f fVar;
        c().D();
        l0();
        String strJ0 = ((ka) jaVar.f32762b).J0();
        EnumMap enumMap = new EnumMap(z1.class);
        int length = strJ0.length();
        int length2 = z1.values().length;
        f fVar2 = f.UNSET;
        int i5 = 0;
        if (length < length2 || strJ0.charAt(0) != '1') {
            dVar = new a5.d();
        } else {
            z1[] z1VarArrValues = z1.values();
            int length3 = z1VarArrValues.length;
            int i11 = 0;
            int i12 = 1;
            while (i11 < length3) {
                z1 z1Var = z1VarArrValues[i11];
                int i13 = i12 + 1;
                char cCharAt = strJ0.charAt(i12);
                f[] fVarArrValues = f.values();
                int length4 = fVarArrValues.length;
                int i14 = i5;
                while (true) {
                    if (i14 >= length4) {
                        fVar = fVar2;
                        break;
                    }
                    fVar = fVarArrValues[i14];
                    if (fVar.f12928a == cCharAt) {
                        break;
                    } else {
                        i14++;
                    }
                }
                enumMap.put((EnumMap) z1Var, (z1) fVar);
                i11++;
                i12 = i13;
                i5 = 0;
            }
            dVar = new a5.d(enumMap);
        }
        String strE = t0Var.E();
        c().D();
        l0();
        a2 a2VarF = f(strE);
        EnumMap enumMap2 = a2VarF.f12832a;
        z1 z1Var2 = z1.AD_STORAGE;
        x1 x1Var = (x1) enumMap2.get(z1Var2);
        x1 x1Var2 = x1.UNINITIALIZED;
        if (x1Var == null) {
            x1Var = x1Var2;
        }
        int i15 = a2VarF.f12833b;
        int iOrdinal = x1Var.ordinal();
        f fVar3 = f.REMOTE_ENFORCED_DEFAULT;
        f fVar4 = f.FAILSAFE;
        if (iOrdinal == 1) {
            dVar.Q(z1Var2, fVar3);
        } else if (iOrdinal == 2 || iOrdinal == 3) {
            dVar.N(z1Var2, i15);
        } else {
            dVar.Q(z1Var2, fVar4);
        }
        z1 z1Var3 = z1.ANALYTICS_STORAGE;
        x1 x1Var3 = (x1) enumMap2.get(z1Var3);
        if (x1Var3 != null) {
            x1Var2 = x1Var3;
        }
        int iOrdinal2 = x1Var2.ordinal();
        if (iOrdinal2 == 1) {
            dVar.Q(z1Var3, fVar3);
        } else if (iOrdinal2 == 2 || iOrdinal2 == 3) {
            dVar.N(z1Var3, i15);
        } else {
            dVar.Q(z1Var3, fVar4);
        }
        String strE2 = t0Var.E();
        c().D();
        l0();
        n nVarQ0 = q0(strE2, o0(strE2), f(strE2), dVar);
        String str = nVarQ0.f13169d;
        Boolean bool = nVarQ0.f13168c;
        sg.w.h(bool);
        boolean zBooleanValue = bool.booleanValue();
        jaVar.c();
        ((ka) jaVar.f32762b).n1(zBooleanValue);
        if (!TextUtils.isEmpty(str)) {
            jaVar.c();
            ((ka) jaVar.f32762b).o1(str);
        }
        c().D();
        l0();
        Iterator it = Collections.unmodifiableList(((ka) jaVar.f32762b).d2()).iterator();
        while (true) {
            if (it.hasNext()) {
                taVar = (ta) it.next();
                if ("_npa".equals(taVar.z())) {
                    break;
                }
            } else {
                taVar = null;
                break;
            }
        }
        if (taVar != null) {
            EnumMap enumMap3 = (EnumMap) dVar.f267b;
            z1 z1Var4 = z1.AD_PERSONALIZATION;
            f fVar5 = (f) enumMap3.get(z1Var4);
            if (fVar5 == null) {
                fVar5 = fVar2;
            }
            if (fVar5 == fVar2) {
                l lVar = this.f13041c;
                T(lVar);
                n4 n4VarZ0 = lVar.z0(t0Var.E(), "_npa");
                f fVar6 = f.MANIFEST;
                f fVar7 = f.API;
                if (n4VarZ0 != null) {
                    String str2 = n4VarZ0.f13181b;
                    if ("tcf".equals(str2)) {
                        dVar.Q(z1Var4, f.TCF);
                    } else if ("app".equals(str2)) {
                        dVar.Q(z1Var4, fVar7);
                    } else {
                        dVar.Q(z1Var4, fVar6);
                    }
                } else {
                    Boolean boolX = t0Var.x();
                    if (boolX == null || ((boolX.booleanValue() && taVar.D() != 1) || !(boolX.booleanValue() || taVar.D() == 0))) {
                        dVar.Q(z1Var4, fVar7);
                    } else {
                        dVar.Q(z1Var4, fVar6);
                    }
                }
            }
        } else {
            int iF = F(t0Var.E(), dVar);
            sa saVarI = ta.I();
            saVarI.c();
            ((ta) saVarI.f32762b).K("_npa");
            e().getClass();
            long jCurrentTimeMillis = System.currentTimeMillis();
            saVarI.c();
            ((ta) saVarI.f32762b).J(jCurrentTimeMillis);
            saVarI.c();
            ((ta) saVarI.f32762b).N(iF);
            ta taVar2 = (ta) saVarI.f();
            jaVar.c();
            ((ka) jaVar.f32762b).l0(taVar2);
            b().n.c("non_personalized_ads(_npa)", "Setting user property", Integer.valueOf(iF));
        }
        String string = dVar.toString();
        jaVar.c();
        ((ka) jaVar.f32762b).m1(string);
        String strE3 = t0Var.E();
        g1 g1Var = this.f13039a;
        g1Var.D();
        g1Var.J(strE3);
        b9 b9VarZ = g1Var.Z(strE3);
        boolean z11 = b9VarZ == null || !b9VarZ.A() || b9VarZ.B();
        List listZ = jaVar.Z();
        for (int i16 = 0; i16 < listZ.size(); i16++) {
            if ("_tcf".equals(((ca) listZ.get(i16)).C())) {
                ba baVar = (ba) ((ca) listZ.get(i16)).l();
                List listI = baVar.i();
                int i17 = 0;
                while (true) {
                    if (i17 >= listI.size()) {
                        break;
                    }
                    if ("_tcfd".equals(((fa) listI.get(i17)).y())) {
                        String strA = ((fa) listI.get(i17)).A();
                        if (z11 && strA.length() > 4) {
                            char[] charArray = strA.toCharArray();
                            int i18 = 1;
                            while (true) {
                                if (i18 >= 64) {
                                    i18 = 0;
                                    break;
                                } else if (charArray[4] == "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_".charAt(i18)) {
                                    break;
                                } else {
                                    i18++;
                                }
                            }
                            charArray[4] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_".charAt(i18 | 1);
                            strA = String.valueOf(charArray);
                        }
                        ea eaVarJ = fa.J();
                        eaVarJ.i("_tcfd");
                        eaVarJ.j(strA);
                        baVar.c();
                        ((ca) baVar.f32762b).O(i17, (fa) eaVarJ.f());
                    } else {
                        i17++;
                    }
                }
                jaVar.b0(i16, baVar);
                return;
            }
        }
    }

    public final void m0(zzr zzrVar) {
        c().D();
        l0();
        String str = zzrVar.f33792f;
        sg.w.e(str);
        a2 a2VarC = a2.c(zzrVar.C, zzrVar.f33808x);
        f(str);
        b().n.c(str, "Setting storage consent for package", a2VarC);
        c().D();
        l0();
        this.B.put(str, a2VarC);
        l lVar = this.f13041c;
        T(lVar);
        lVar.j0(str, a2VarC);
    }

    public final void n(t0 t0Var, ja jaVar) {
        Serializable serializableV;
        c().D();
        l0();
        m9 m9VarC0 = p9.c0();
        m1 m1Var = t0Var.f13310a;
        k1 k1Var = m1Var.f13139g;
        m1.l(k1Var);
        k1Var.D();
        byte[] bArr = t0Var.H;
        if (bArr != null) {
            try {
                m9VarC0 = (m9) m4.o0(m9VarC0, bArr);
            } catch (zzaeh unused) {
                b().f13193i.b(o0.L(t0Var.E()), "Failed to parse locally stored ad campaign info. appId");
            }
        }
        Iterator it = jaVar.Z().iterator();
        while (it.hasNext()) {
            ca caVar = (ca) it.next();
            if (caVar.C().equals("_cmp")) {
                fa faVarN = m4.N(caVar, "gclid");
                Serializable serializableV2 = faVarN == null ? null : m4.V(faVarN);
                Object obj = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                if (serializableV2 == null) {
                    serializableV2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                String str = (String) serializableV2;
                fa faVarN2 = m4.N(caVar, "gbraid");
                Serializable serializableV3 = faVarN2 == null ? null : m4.V(faVarN2);
                if (serializableV3 == null) {
                    serializableV3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                String str2 = (String) serializableV3;
                fa faVarN3 = m4.N(caVar, "gad_source");
                Serializable serializableV4 = faVarN3 == null ? null : m4.V(faVarN3);
                if (serializableV4 == null) {
                    serializableV4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                String str3 = (String) serializableV4;
                fa faVarN4 = m4.N(caVar, "deep_link_url");
                Object objV = faVarN4 == null ? null : m4.V(faVarN4);
                if (objV != null) {
                    obj = objV;
                }
                String str4 = (String) obj;
                String[] strArrSplit = ((String) x.f13405b1.a(null)).split(",");
                j0();
                HashMap map = new HashMap();
                for (fa faVar : caVar.z()) {
                    Iterator it2 = it;
                    if (Arrays.asList(strArrSplit).contains(faVar.y()) && (serializableV = m4.V(faVar)) != null) {
                        map.put(faVar.y(), serializableV);
                    }
                    it = it2;
                }
                Iterator it3 = it;
                if (!map.isEmpty()) {
                    fa faVarN5 = m4.N(caVar, "click_timestamp");
                    Object objV2 = faVarN5 == null ? null : m4.V(faVarN5);
                    long jLongValue = ((Long) (objV2 != null ? objV2 : 0L)).longValue();
                    if (jLongValue <= 0) {
                        jLongValue = caVar.E();
                    }
                    long j11 = jLongValue;
                    fa faVarN6 = m4.N(caVar, "_cis");
                    if ("referrer API v2".equals(faVarN6 == null ? null : m4.V(faVarN6))) {
                        if (j11 > ((p9) m9VarC0.f32762b).Z()) {
                            if (str.isEmpty()) {
                                m9VarC0.c();
                                ((p9) m9VarC0.f32762b).A();
                            } else {
                                m9VarC0.c();
                                ((p9) m9VarC0.f32762b).z(str);
                            }
                            if (str2.isEmpty()) {
                                m9VarC0.c();
                                ((p9) m9VarC0.f32762b).C();
                            } else {
                                m9VarC0.c();
                                ((p9) m9VarC0.f32762b).B(str2);
                            }
                            if (str3.isEmpty()) {
                                m9VarC0.c();
                                ((p9) m9VarC0.f32762b).E();
                            } else {
                                m9VarC0.c();
                                ((p9) m9VarC0.f32762b).D(str3);
                            }
                            m9VarC0.c();
                            ((p9) m9VarC0.f32762b).F(j11);
                            m9VarC0.c();
                            ((p9) m9VarC0.f32762b).H().clear();
                            HashMap mapG = G(caVar);
                            m9VarC0.c();
                            ((p9) m9VarC0.f32762b).H().putAll(mapG);
                        }
                    } else if (j11 > ((p9) m9VarC0.f32762b).R()) {
                        if (str.isEmpty()) {
                            m9VarC0.c();
                            ((p9) m9VarC0.f32762b).f0();
                        } else {
                            m9VarC0.c();
                            ((p9) m9VarC0.f32762b).e0(str);
                        }
                        if (str2.isEmpty()) {
                            m9VarC0.c();
                            ((p9) m9VarC0.f32762b).h0();
                        } else {
                            m9VarC0.c();
                            ((p9) m9VarC0.f32762b).g0(str2);
                        }
                        if (str3.isEmpty()) {
                            m9VarC0.c();
                            ((p9) m9VarC0.f32762b).x();
                        } else {
                            m9VarC0.c();
                            ((p9) m9VarC0.f32762b).i0(str3);
                        }
                        if (e0().O(null, x.f13402a1)) {
                            if (str4.isEmpty()) {
                                m9VarC0.c();
                                ((p9) m9VarC0.f32762b).J();
                            } else {
                                m9VarC0.c();
                                ((p9) m9VarC0.f32762b).I(str4);
                            }
                        }
                        m9VarC0.c();
                        ((p9) m9VarC0.f32762b).y(j11);
                        m9VarC0.c();
                        ((p9) m9VarC0.f32762b).G().clear();
                        HashMap mapG2 = G(caVar);
                        m9VarC0.c();
                        ((p9) m9VarC0.f32762b).G().putAll(mapG2);
                    }
                }
                it = it3;
            }
        }
        if (!((p9) m9VarC0.f()).equals(p9.d0())) {
            p9 p9Var = (p9) m9VarC0.f();
            jaVar.c();
            ((ka) jaVar.f32762b).s1(p9Var);
        }
        byte[] bArrA = ((p9) m9VarC0.f()).a();
        k1 k1Var2 = m1Var.f13139g;
        m1.l(k1Var2);
        k1Var2.D();
        t0Var.R |= t0Var.H != bArrA;
        t0Var.H = bArrA;
        if (t0Var.o()) {
            l lVar = this.f13041c;
            T(lVar);
            lVar.I0(t0Var, false);
        }
        if (e0().O(null, x.f13402a1)) {
            for (int i5 = 0; i5 < jaVar.a0(); i5++) {
                ca caVarC2 = ((ka) jaVar.f32762b).c2(i5);
                if ("_cmp".equals(caVarC2.C())) {
                    ba baVar = (ba) caVarC2.l();
                    List listI = baVar.i();
                    int i11 = 0;
                    while (true) {
                        if (i11 >= listI.size()) {
                            break;
                        }
                        if ("deep_link_url".equals(((fa) listI.get(i11)).y())) {
                            baVar.o(i11);
                            jaVar.b0(i5, baVar);
                            break;
                        }
                        i11++;
                    }
                }
            }
        }
        if (e0().O(null, x.Z0)) {
            l lVar2 = this.f13041c;
            T(lVar2);
            lVar2.x0(t0Var.E(), "_lgclid");
        }
    }

    public final void n0(zzr zzrVar) throws NumberFormatException {
        c().D();
        l0();
        String str = zzrVar.f33792f;
        sg.w.e(str);
        n nVarB = n.b(zzrVar.D);
        b().n.c(str, "Setting DMA consent for package", nVarB);
        c().D();
        l0();
        x1 x1VarA = n.c(100, p0(str)).a();
        this.C.put(str, nVarB);
        l lVar = this.f13041c;
        T(lVar);
        sg.w.h(str);
        sg.w.h(nVarB);
        lVar.D();
        lVar.E();
        a2 a2VarX = lVar.X(str);
        a2 a2Var = a2.f12831c;
        if (a2VarX == a2Var) {
            lVar.j0(str, a2Var);
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("app_id", str);
        contentValues.put("dma_consent_settings", nVarB.f13167b);
        lVar.c0(contentValues);
        x1 x1VarA2 = n.c(100, p0(str)).a();
        c().D();
        l0();
        x1 x1Var = x1.GRANTED;
        x1 x1Var2 = x1.DENIED;
        boolean z11 = x1VarA == x1Var2 && x1VarA2 == x1Var;
        boolean z12 = x1VarA == x1Var && x1VarA2 == x1Var2;
        if (z11 || z12) {
            b().n.b(str, "Generated _dcu event for");
            Bundle bundle = new Bundle();
            l lVar2 = this.f13041c;
            T(lVar2);
            if (lVar2.J0(g(), str, false, false, false, false).f12962f < e0().M(str, x.f13430l0)) {
                bundle.putLong("_r", 1L);
                l lVar3 = this.f13041c;
                T(lVar3);
                b().n.c(str, "_dcu realtime event count", Long.valueOf(lVar3.J0(g(), str, false, false, true, false).f12962f));
            }
            this.J.d(str, "_dcu", bundle);
        }
    }

    public final String o(a2 a2Var) {
        if (!a2Var.i(z1.ANALYTICS_STORAGE)) {
            return null;
        }
        byte[] bArr = new byte[16];
        k0().C0().nextBytes(bArr);
        return String.format(Locale.US, "%032x", new BigInteger(1, bArr));
    }

    public final n o0(String str) throws NumberFormatException {
        c().D();
        l0();
        HashMap map = this.C;
        n nVar = (n) map.get(str);
        if (nVar != null) {
            return nVar;
        }
        l lVar = this.f13041c;
        T(lVar);
        sg.w.h(str);
        lVar.D();
        lVar.E();
        n nVarB = n.b(lVar.b0("select dma_consent_settings from consent_settings where app_id=? limit 1;", new String[]{str}));
        map.put(str, nVarB);
        return nVarB;
    }

    public final void p(ArrayList arrayList) {
        sg.w.c(!arrayList.isEmpty());
        if (this.f13061y != null) {
            b().f13190f.a("Set uploading progress before finishing the previous upload");
        } else {
            this.f13061y = new ArrayList(arrayList);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final Bundle p0(String str) {
        c().D();
        l0();
        g1 g1Var = this.f13039a;
        T(g1Var);
        if (g1Var.Z(str) == null) {
            return null;
        }
        Bundle bundle = new Bundle();
        a2 a2VarF = f(str);
        Bundle bundle2 = new Bundle();
        Iterator it = a2VarF.f12832a.entrySet().iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Map.Entry entry = (Map.Entry) it.next();
            int iOrdinal = ((x1) entry.getValue()).ordinal();
            String str2 = iOrdinal != 2 ? iOrdinal != 3 ? null : "granted" : "denied";
            if (str2 != null) {
                bundle2.putString(((z1) entry.getKey()).f13512a, str2);
            }
        }
        bundle.putAll(bundle2);
        n nVarQ0 = q0(str, o0(str), a2VarF, new a5.d());
        Bundle bundle3 = new Bundle();
        for (Map.Entry entry2 : nVarQ0.f13170e.entrySet()) {
            int iOrdinal2 = ((x1) entry2.getValue()).ordinal();
            String str3 = iOrdinal2 != 2 ? iOrdinal2 != 3 ? null : "granted" : "denied";
            if (str3 != null) {
                bundle3.putString(((z1) entry2.getKey()).f13512a, str3);
            }
        }
        Boolean bool = nVarQ0.f13168c;
        if (bool != null) {
            bundle3.putString("is_dma_region", bool.toString());
        }
        String str4 = nVarQ0.f13169d;
        if (str4 != null) {
            bundle3.putString("cps_display_str", str4);
        }
        bundle.putAll(bundle3);
        l lVar = this.f13041c;
        T(lVar);
        n4 n4VarZ0 = lVar.z0(str, "_npa");
        bundle.putString("ad_personalization", 1 != (n4VarZ0 != null ? n4VarZ0.f13184e.equals(1L) : F(str, new a5.d())) ? "granted" : "denied");
        return bundle;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:73:0x01ab A[Catch: all -> 0x0028, TryCatch #4 {all -> 0x0028, blocks: (B:3:0x000e, B:5:0x001b, B:8:0x002b, B:10:0x0031, B:11:0x003e, B:13:0x0046, B:14:0x004b, B:16:0x0056, B:17:0x0063, B:19:0x006e, B:20:0x007e, B:22:0x00a8, B:24:0x00ae, B:25:0x00b1, B:27:0x00ca, B:28:0x00df, B:30:0x00f0, B:32:0x00f6, B:35:0x010b, B:45:0x012a, B:47:0x012f, B:48:0x0132, B:49:0x0133, B:50:0x0138, B:55:0x017d, B:71:0x01a5, B:73:0x01ab, B:75:0x01b6, B:79:0x01c1, B:80:0x01c4, B:33:0x00fb, B:37:0x010f, B:42:0x0117), top: B:91:0x000e, inners: #1 }] */
    /* JADX WARN: Type inference failed for: r11v0, types: [ai.j4] */
    /* JADX WARN: Type inference failed for: r1v12, types: [long] */
    /* JADX WARN: Type inference failed for: r1v13 */
    /* JADX WARN: Type inference failed for: r1v17 */
    /* JADX WARN: Type inference failed for: r1v18 */
    /* JADX WARN: Type inference failed for: r1v22, types: [android.database.Cursor] */
    /* JADX WARN: Type inference failed for: r1v25, types: [android.database.Cursor] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void q() {
        l lVar;
        long jLongValue;
        SQLiteException e3;
        c().D();
        l0();
        this.f13058v = true;
        try {
            m1 m1Var = this.f13050l;
            m1Var.getClass();
            Boolean bool = m1Var.o().f13231e;
            if (bool == null) {
                b().f13193i.a("Upload data called on the client side before use of service was decided");
            } else if (bool.booleanValue()) {
                b().f13190f.a("Upload called in the client side when service should be used");
            } else if (this.o > 0) {
                N();
            } else {
                c().D();
                if (this.f13061y != null) {
                    b().n.a("Uploading requested multiple times");
                } else {
                    s0 s0Var = this.f13040b;
                    T(s0Var);
                    if (s0Var.H()) {
                        e().getClass();
                        ?? CurrentTimeMillis = System.currentTimeMillis();
                        Cursor cursor = null;
                        cursorRawQuery = null;
                        Cursor cursorRawQuery = null;
                        string = null;
                        string = null;
                        String string = null;
                        int iM = e0().M(null, x.f13421h0);
                        e0();
                        long jLongValue2 = CurrentTimeMillis - ((Long) x.f13412e.a(null)).longValue();
                        for (int i5 = 0; i5 < iM && I(jLongValue2, null); i5++) {
                        }
                        z4.a();
                        c().D();
                        H();
                        long jF = this.f13047i.f13286h.f();
                        if (jF != 0) {
                            b().f13197m.b(Long.valueOf(Math.abs(CurrentTimeMillis - jF)), "Uploading events. Elapsed time since last upload attempt (ms)");
                        }
                        l lVar2 = this.f13041c;
                        T(lVar2);
                        String strL = lVar2.L();
                        long j11 = -1;
                        if (TextUtils.isEmpty(strL)) {
                            try {
                                this.A = -1L;
                                lVar = this.f13041c;
                                T(lVar);
                                e0();
                                jLongValue = CurrentTimeMillis - ((Long) x.f13412e.a(null)).longValue();
                                lVar.D();
                                lVar.E();
                            } catch (Throwable th2) {
                                th = th2;
                                cursor = CurrentTimeMillis;
                            }
                            try {
                                CurrentTimeMillis = lVar.u0().rawQuery("select app_id from apps where app_id in (select distinct app_id from raw_events) and config_fetched_time < ? order by failed_config_fetch_time limit 1;", new String[]{String.valueOf(jLongValue)});
                                try {
                                    if (CurrentTimeMillis.moveToFirst()) {
                                        string = CurrentTimeMillis.getString(0);
                                    } else {
                                        o0 o0Var = ((m1) lVar.f13368a).f13138f;
                                        m1.l(o0Var);
                                        o0Var.n.a("No expired configs for apps with pending events");
                                    }
                                } catch (SQLiteException e11) {
                                    e3 = e11;
                                    o0 o0Var2 = ((m1) lVar.f13368a).f13138f;
                                    m1.l(o0Var2);
                                    o0Var2.f13190f.b(e3, "Error selecting expired configs");
                                    if (CurrentTimeMillis != 0) {
                                        CurrentTimeMillis.close();
                                    }
                                    if (!TextUtils.isEmpty(string)) {
                                    }
                                    this.f13058v = false;
                                    O();
                                }
                            } catch (SQLiteException e12) {
                                e3 = e12;
                                CurrentTimeMillis = 0;
                            } catch (Throwable th3) {
                                th = th3;
                                throw th;
                            }
                            CurrentTimeMillis.close();
                            if (!TextUtils.isEmpty(string)) {
                                l lVar3 = this.f13041c;
                                T(lVar3);
                                t0 t0VarH0 = lVar3.H0(string);
                                if (t0VarH0 != null) {
                                    A(t0VarH0);
                                }
                            }
                        } else {
                            if (this.A == -1) {
                                l lVar4 = this.f13041c;
                                T(lVar4);
                                try {
                                    try {
                                        cursorRawQuery = lVar4.u0().rawQuery("select rowid from raw_events order by rowid desc limit 1;", null);
                                        if (cursorRawQuery.moveToFirst()) {
                                            j11 = cursorRawQuery.getLong(0);
                                        }
                                    } finally {
                                        if (cursorRawQuery != null) {
                                            cursorRawQuery.close();
                                        }
                                    }
                                } catch (SQLiteException e13) {
                                    o0 o0Var3 = ((m1) lVar4.f13368a).f13138f;
                                    m1.l(o0Var3);
                                    o0Var3.f13190f.b(e13, "Error querying raw events");
                                    if (cursorRawQuery != null) {
                                    }
                                }
                                cursorRawQuery.close();
                                this.A = j11;
                            }
                            r(CurrentTimeMillis, strL);
                        }
                    } else {
                        b().n.a("Network not connected, ignoring upload request");
                        N();
                    }
                }
            }
            this.f13058v = false;
            O();
        } catch (Throwable th4) {
            this.f13058v = false;
            O();
            throw th4;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00b2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final n q0(String str, n nVar, a2 a2Var, a5.d dVar) {
        z1 z1VarO;
        z1 z1Var;
        x1 x1Var;
        x1 x1VarH;
        g1 g1Var = this.f13039a;
        T(g1Var);
        b9 b9VarZ = g1Var.Z(str);
        int i5 = 90;
        x1 x1Var2 = x1.DENIED;
        z1 z1Var2 = z1.AD_USER_DATA;
        if (b9VarZ == null) {
            if (nVar.a() == x1Var2) {
                i5 = nVar.f13166a;
                dVar.N(z1Var2, i5);
            } else {
                dVar.Q(z1Var2, f.FAILSAFE);
            }
            return new n(Boolean.FALSE, i5, Boolean.TRUE, Identify.UNSET_VALUE);
        }
        x1 x1VarA = nVar.a();
        x1 x1Var3 = x1.GRANTED;
        if (x1VarA == x1Var3 || x1VarA == x1Var2) {
            i5 = nVar.f13166a;
            dVar.N(z1Var2, i5);
        } else {
            x1 x1Var4 = x1.POLICY;
            x1 x1Var5 = x1.UNINITIALIZED;
            if (x1VarA != x1Var4 || (x1VarH = g1Var.H(str, z1Var2)) == x1Var5) {
                g1Var.D();
                g1Var.J(str);
                b9 b9VarZ2 = g1Var.Z(str);
                if (b9VarZ2 == null) {
                    z1VarO = null;
                    EnumMap enumMap = a2Var.f12832a;
                    z1Var = z1.AD_STORAGE;
                    x1Var = (x1) enumMap.get(z1Var);
                    if (x1Var != null) {
                        x1Var5 = x1Var;
                    }
                    boolean z11 = x1Var5 != x1Var3 || x1Var5 == x1Var2;
                    if (z1VarO == z1Var || !z11) {
                        dVar.Q(z1Var2, f.REMOTE_DEFAULT);
                        x1VarA = true == g1Var.Y(str, z1Var2) ? x1Var2 : x1Var3;
                    } else {
                        dVar.Q(z1Var2, f.REMOTE_DELEGATION);
                        x1VarA = x1Var5;
                    }
                } else {
                    for (z8 z8Var : b9VarZ2.y()) {
                        if (z1Var2 == g1.O(z8Var.x())) {
                            z1VarO = g1.O(z8Var.y());
                            break;
                        }
                    }
                    z1VarO = null;
                    EnumMap enumMap2 = a2Var.f12832a;
                    z1Var = z1.AD_STORAGE;
                    x1Var = (x1) enumMap2.get(z1Var);
                    if (x1Var != null) {
                    }
                    if (x1Var5 != x1Var3) {
                        if (z1VarO == z1Var) {
                            dVar.Q(z1Var2, f.REMOTE_DEFAULT);
                            if (true == g1Var.Y(str, z1Var2)) {
                            }
                        }
                    }
                }
            } else {
                dVar.Q(z1Var2, f.REMOTE_ENFORCED_DEFAULT);
                x1VarA = x1VarH;
            }
        }
        g1Var.D();
        g1Var.J(str);
        b9 b9VarZ3 = g1Var.Z(str);
        boolean z12 = b9VarZ3 == null || !b9VarZ3.A() || b9VarZ3.B();
        T(g1Var);
        g1Var.D();
        g1Var.J(str);
        TreeSet treeSet = new TreeSet();
        b9 b9VarZ4 = g1Var.Z(str);
        if (b9VarZ4 != null) {
            Iterator it = b9VarZ4.z().iterator();
            while (it.hasNext()) {
                treeSet.add(((a9) it.next()).x());
            }
        }
        if (x1VarA == x1Var2 || treeSet.isEmpty()) {
            return new n(Boolean.FALSE, i5, Boolean.valueOf(z12), Identify.UNSET_VALUE);
        }
        Boolean bool = Boolean.TRUE;
        Boolean boolValueOf = Boolean.valueOf(z12);
        String strJoin = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (z12) {
            strJoin = TextUtils.join(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, treeSet);
        }
        return new n(bool, i5, boolValueOf, strJoin);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0231  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x006f A[PHI: r0 r11 r22 r24
      0x006f: PHI (r0v114 java.util.List) = (r0v8 java.util.List), (r0v136 java.util.List) binds: [B:108:0x0225, B:16:0x006d] A[DONT_GENERATE, DONT_INLINE]
      0x006f: PHI (r11v47 android.database.Cursor) = (r11v5 android.database.Cursor), (r11v49 android.database.Cursor) binds: [B:108:0x0225, B:16:0x006d] A[DONT_GENERATE, DONT_INLINE]
      0x006f: PHI (r22v28 android.database.Cursor) = (r22v40 android.database.Cursor), (r22v41 android.database.Cursor) binds: [B:108:0x0225, B:16:0x006d] A[DONT_GENERATE, DONT_INLINE]
      0x006f: PHI (r24v7 long) = (r24v2 long), (r24v8 long) binds: [B:108:0x0225, B:16:0x006d] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:191:0x04a0  */
    /* JADX WARN: Removed duplicated region for block: B:195:0x04ae  */
    /* JADX WARN: Removed duplicated region for block: B:228:0x0594  */
    /* JADX WARN: Removed duplicated region for block: B:237:0x05af  */
    /* JADX WARN: Removed duplicated region for block: B:255:0x0605  */
    /* JADX WARN: Removed duplicated region for block: B:258:0x0621  */
    /* JADX WARN: Removed duplicated region for block: B:261:0x062d  */
    /* JADX WARN: Removed duplicated region for block: B:265:0x065c  */
    /* JADX WARN: Removed duplicated region for block: B:309:0x07b9  */
    /* JADX WARN: Removed duplicated region for block: B:319:0x080d  */
    /* JADX WARN: Removed duplicated region for block: B:321:0x081c  */
    /* JADX WARN: Removed duplicated region for block: B:334:0x0850  */
    /* JADX WARN: Removed duplicated region for block: B:340:0x0880  */
    /* JADX WARN: Removed duplicated region for block: B:343:0x0898  */
    /* JADX WARN: Removed duplicated region for block: B:347:0x08ae A[LOOP:7: B:345:0x08a8->B:347:0x08ae, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:350:0x08ee  */
    /* JADX WARN: Removed duplicated region for block: B:351:0x08f1  */
    /* JADX WARN: Removed duplicated region for block: B:354:0x0906  */
    /* JADX WARN: Removed duplicated region for block: B:369:0x0a01  */
    /* JADX WARN: Removed duplicated region for block: B:371:0x0a04  */
    /* JADX WARN: Removed duplicated region for block: B:381:0x0a92  */
    /* JADX WARN: Removed duplicated region for block: B:447:0x0801 A[EDGE_INSN: B:447:0x0801->B:317:0x0801 BREAK  A[LOOP:4: B:263:0x0658->B:316:0x07f3], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:449:0x07f3 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:457:0x0865 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:484:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:489:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r11v2 */
    /* JADX WARN: Type inference failed for: r11v3, types: [boolean] */
    /* JADX WARN: Type inference failed for: r11v50 */
    /* JADX WARN: Type inference failed for: r22v1 */
    /* JADX WARN: Type inference failed for: r22v30, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r22v31 */
    /* JADX WARN: Type inference failed for: r22v32 */
    /* JADX WARN: Type inference failed for: r22v33 */
    /* JADX WARN: Type inference failed for: r22v34 */
    /* JADX WARN: Type inference failed for: r22v35 */
    /* JADX WARN: Type inference failed for: r22v36 */
    /* JADX WARN: Type inference failed for: r22v37 */
    /* JADX WARN: Type inference failed for: r22v38 */
    /* JADX WARN: Type inference failed for: r22v39 */
    /* JADX WARN: Type inference failed for: r22v46 */
    /* JADX WARN: Type inference failed for: r22v47 */
    /* JADX WARN: Type inference failed for: r33v0, types: [ai.j4] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void r(long j11, String str) throws Throwable {
        Cursor cursor;
        m1 m1Var;
        long j12;
        Cursor cursorQuery;
        ?? r22;
        List list;
        Cursor cursor2;
        List<Pair> list2;
        int i5;
        List list3;
        a2 a2VarF;
        z1 z1Var;
        int i11;
        List listSubList;
        ha haVarE;
        int size;
        int i12;
        boolean zI;
        boolean zO;
        List list4;
        m1 m1Var2;
        Iterator it;
        String string;
        String strQ;
        Iterator it2;
        String str2;
        e4 e4Var;
        int i13;
        int i14;
        boolean z11;
        List list5;
        boolean z12;
        String strD;
        List list6;
        boolean zIsEmpty;
        Cursor cursor3;
        m1 m1Var3;
        Cursor cursor4;
        List list7;
        Iterator it3;
        Iterator it4;
        int i15;
        int i16;
        ArrayList arrayList;
        Cursor cursor5;
        Cursor cursor6;
        byte[] byteArray;
        long jD;
        long jD2;
        String str3 = str;
        int iM = e0().M(str3, x.f13420h);
        int i17 = 0;
        int iMax = Math.max(0, e0().M(str3, x.f13422i));
        l lVarG0 = g0();
        m1 m1Var4 = (m1) lVarG0.f13368a;
        lVarG0.D();
        lVarG0.E();
        int i18 = 1;
        sg.w.c(iM > 0);
        ?? r11 = iMax > 0 ? 1 : 0;
        sg.w.c(r11);
        sg.w.e(str3);
        try {
            try {
                try {
                    j12 = -1;
                } catch (Throwable th2) {
                    th = th2;
                    cursor = null;
                    if (cursor != null) {
                        cursor.close();
                    }
                    throw th;
                }
            } catch (SQLiteException e3) {
                e = e3;
                m1Var = m1Var4;
                j12 = -1;
            }
            try {
                r22 = "rowid";
                cursorQuery = lVarG0.u0().query("queue", new String[]{"rowid", "data", "retry_count"}, "app_id=?", new String[]{str3}, null, null, "rowid", String.valueOf(iM));
                try {
                } catch (SQLiteException e11) {
                    e = e11;
                    m1Var = m1Var4;
                }
            } catch (SQLiteException e12) {
                e = e12;
                m1Var = m1Var4;
                cursorQuery = null;
                m1Var.b().H().c(o0.L(str3), "Error querying bundles. appId", e);
                list = Collections.EMPTY_LIST;
                cursor6 = r22;
                cursor5 = r22;
                if (cursorQuery != null) {
                    cursorQuery.close();
                    cursor5 = cursor6;
                }
                list2 = list;
                cursor2 = cursor5;
                if (list2.isEmpty()) {
                }
            }
            if (!cursorQuery.moveToFirst()) {
                list = Collections.EMPTY_LIST;
                cursor6 = "rowid";
                cursorQuery.close();
                cursor5 = cursor6;
                list2 = list;
                cursor2 = cursor5;
                if (list2.isEmpty()) {
                    return;
                }
                com.google.android.gms.internal.measurement.a4 a4Var = com.google.android.gms.internal.measurement.a4.f32368b;
                e eVarE0 = e0();
                w wVar = x.f13408c1;
                boolean zO2 = eVarE0.O(null, wVar);
                z1 z1Var2 = z1.ANALYTICS_STORAGE;
                if (zO2) {
                    if (!e0().O(null, wVar)) {
                        i5 = 34;
                        list6 = list2;
                    } else if (f(str3).i(z1Var2) || !f0().I(str3)) {
                        i5 = 34;
                        ArrayList arrayList2 = new ArrayList(list2.size());
                        l lVarG02 = g0();
                        m1 m1Var5 = (m1) lVarG02.f13368a;
                        sg.w.e(str3);
                        lVarG02.D();
                        lVarG02.E();
                        ArrayList arrayList3 = new ArrayList();
                        try {
                            try {
                                try {
                                    SQLiteDatabase sQLiteDatabaseU0 = lVarG02.u0();
                                    m1Var5.e().getClass();
                                    long jCurrentTimeMillis = System.currentTimeMillis();
                                    Cursor cursorQuery2 = sQLiteDatabaseU0.query("no_data_mode_events", new String[]{"data"}, "app_id=? AND timestamp_millis <= CAST(? AS INTEGER)", new String[]{str3, String.valueOf(jCurrentTimeMillis)}, null, null, "rowid", null);
                                    try {
                                        try {
                                            if (cursorQuery2.moveToFirst()) {
                                                m1Var3 = m1Var5;
                                                while (true) {
                                                    try {
                                                        try {
                                                            arrayList3.add((ca) ((ba) m4.o0(ca.N(), cursorQuery2.getBlob(0))).f());
                                                            cursor4 = cursorQuery2;
                                                            arrayList = arrayList3;
                                                        } catch (SQLiteException e13) {
                                                            e = e13;
                                                            cursor4 = cursorQuery2;
                                                            m1Var3.b().H().c(o0.L(str3), "Error flushing NO_DATA mode events. appId", e);
                                                            list7 = Collections.EMPTY_LIST;
                                                            if (cursor4 != null) {
                                                            }
                                                            it3 = list2.iterator();
                                                            boolean z13 = true;
                                                            while (it3.hasNext()) {
                                                            }
                                                            list6 = arrayList2;
                                                            zIsEmpty = list6.isEmpty();
                                                            list3 = list6;
                                                            if (zIsEmpty) {
                                                            }
                                                            a2VarF = f(str3);
                                                            z1Var = z1.AD_STORAGE;
                                                            if (!a2VarF.i(z1Var)) {
                                                            }
                                                            haVarE = ia.E();
                                                            size = listSubList.size();
                                                            ArrayList arrayList4 = new ArrayList(listSubList.size());
                                                            if (e0().E(str3)) {
                                                            }
                                                            boolean zI2 = f(str3).i(z1Var);
                                                            zI = f(str3).i(z1Var2);
                                                            zO = e0().O(str3, x.M0);
                                                            f4 f4Var = this.f13048j;
                                                            e4 e4VarE = f4Var.E(str3);
                                                            list4 = listSubList;
                                                            while (true) {
                                                                m1Var2 = this.f13050l;
                                                                if (i11 < size) {
                                                                }
                                                                i11 = i14 + 1;
                                                                i12 = i13;
                                                                size = i;
                                                                list4 = list5;
                                                                zI = z11;
                                                                zO = z12;
                                                            }
                                                            if (((ia) haVarE.f32762b).y() != 0) {
                                                            }
                                                        }
                                                    } catch (zzaeh e14) {
                                                        cursor4 = cursorQuery2;
                                                        try {
                                                            arrayList = arrayList3;
                                                            m1Var3.b().f13195k.c(o0.L(str3), "Failed to parse stored NO_DATA mode event, appId", e14);
                                                        } catch (SQLiteException e15) {
                                                            e = e15;
                                                            m1Var3.b().H().c(o0.L(str3), "Error flushing NO_DATA mode events. appId", e);
                                                            list7 = Collections.EMPTY_LIST;
                                                            if (cursor4 != null) {
                                                            }
                                                            it3 = list2.iterator();
                                                            boolean z132 = true;
                                                            while (it3.hasNext()) {
                                                            }
                                                            list6 = arrayList2;
                                                            zIsEmpty = list6.isEmpty();
                                                            list3 = list6;
                                                            if (zIsEmpty) {
                                                            }
                                                            a2VarF = f(str3);
                                                            z1Var = z1.AD_STORAGE;
                                                            if (!a2VarF.i(z1Var)) {
                                                            }
                                                            haVarE = ia.E();
                                                            size = listSubList.size();
                                                            ArrayList arrayList42 = new ArrayList(listSubList.size());
                                                            if (e0().E(str3)) {
                                                            }
                                                            boolean zI22 = f(str3).i(z1Var);
                                                            zI = f(str3).i(z1Var2);
                                                            zO = e0().O(str3, x.M0);
                                                            f4 f4Var2 = this.f13048j;
                                                            e4 e4VarE2 = f4Var2.E(str3);
                                                            list4 = listSubList;
                                                            while (true) {
                                                                m1Var2 = this.f13050l;
                                                                if (i11 < size) {
                                                                }
                                                                i11 = i14 + 1;
                                                                i12 = i13;
                                                                size = i;
                                                                list4 = list5;
                                                                zI = z11;
                                                                zO = z12;
                                                            }
                                                            if (((ia) haVarE.f32762b).y() != 0) {
                                                            }
                                                        }
                                                    }
                                                    if (!cursor4.moveToNext()) {
                                                        break;
                                                    }
                                                    cursorQuery2 = cursor4;
                                                    arrayList3 = arrayList;
                                                }
                                                cursor4.close();
                                                try {
                                                    int iDelete = sQLiteDatabaseU0.delete("no_data_mode_events", "app_id=? AND timestamp_millis <= CAST(? AS INTEGER)", new String[]{str3, String.valueOf(jCurrentTimeMillis)});
                                                    m0 m0VarK = m1Var3.b().K();
                                                    StringBuilder sb2 = new StringBuilder(String.valueOf(iDelete).length() + 34);
                                                    sb2.append("Pruned ");
                                                    sb2.append(iDelete);
                                                    sb2.append(" NO_DATA mode events. appId");
                                                    m0VarK.b(str3, sb2.toString());
                                                } catch (SQLiteException e16) {
                                                    e = e16;
                                                    cursor4 = null;
                                                    m1Var3.b().H().c(o0.L(str3), "Error flushing NO_DATA mode events. appId", e);
                                                    list7 = Collections.EMPTY_LIST;
                                                    if (cursor4 != null) {
                                                        cursor4.close();
                                                    }
                                                    it3 = list2.iterator();
                                                    boolean z1322 = true;
                                                    while (it3.hasNext()) {
                                                    }
                                                    list6 = arrayList2;
                                                    zIsEmpty = list6.isEmpty();
                                                    list3 = list6;
                                                    if (zIsEmpty) {
                                                    }
                                                    a2VarF = f(str3);
                                                    z1Var = z1.AD_STORAGE;
                                                    if (!a2VarF.i(z1Var)) {
                                                    }
                                                    haVarE = ia.E();
                                                    size = listSubList.size();
                                                    ArrayList arrayList422 = new ArrayList(listSubList.size());
                                                    if (e0().E(str3)) {
                                                    }
                                                    boolean zI222 = f(str3).i(z1Var);
                                                    zI = f(str3).i(z1Var2);
                                                    zO = e0().O(str3, x.M0);
                                                    f4 f4Var22 = this.f13048j;
                                                    e4 e4VarE22 = f4Var22.E(str3);
                                                    list4 = listSubList;
                                                    while (true) {
                                                        m1Var2 = this.f13050l;
                                                        if (i11 < size) {
                                                        }
                                                        i11 = i14 + 1;
                                                        i12 = i13;
                                                        size = i;
                                                        list4 = list5;
                                                        zI = z11;
                                                        zO = z12;
                                                    }
                                                    if (((ia) haVarE.f32762b).y() != 0) {
                                                    }
                                                }
                                            } else {
                                                arrayList = arrayList3;
                                                cursorQuery2.close();
                                            }
                                            list7 = arrayList;
                                        } catch (Throwable th3) {
                                            th = th3;
                                            cursor2 = cursorQuery2;
                                            cursor3 = cursor2;
                                            if (cursor3 != null) {
                                            }
                                            throw th;
                                        }
                                    } catch (SQLiteException e17) {
                                        e = e17;
                                        cursor4 = cursorQuery2;
                                        m1Var3 = m1Var5;
                                    }
                                } catch (Throwable th4) {
                                    th = th4;
                                    cursor3 = null;
                                    if (cursor3 != null) {
                                        cursor3.close();
                                    }
                                    throw th;
                                }
                            } catch (SQLiteException e18) {
                                e = e18;
                                m1Var3 = m1Var5;
                            }
                            it3 = list2.iterator();
                            boolean z13222 = true;
                            while (it3.hasNext()) {
                                Pair pair = (Pair) it3.next();
                                ja jaVar = (ja) ((ka) pair.first).l();
                                if (z13222 && !list7.isEmpty()) {
                                    List listZ = jaVar.Z();
                                    jaVar.c();
                                    ((ka) jaVar.f32762b).i0();
                                    jaVar.c();
                                    ((ka) jaVar.f32762b).h0(list7);
                                    jaVar.c();
                                    ((ka) jaVar.f32762b).h0(listZ);
                                    z13222 = false;
                                }
                                v9 v9VarY = y9.y();
                                b9 b9VarZ = f0().Z(str3);
                                ArrayList arrayList5 = new ArrayList();
                                if (b9VarZ != null) {
                                    Iterator it5 = b9VarZ.x().iterator();
                                    while (it5.hasNext()) {
                                        y8 y8Var = (y8) it5.next();
                                        Iterator it6 = it3;
                                        w9 w9VarX = x9.x();
                                        boolean z14 = z13222;
                                        int iX = y8Var.x() - 1;
                                        List list8 = list7;
                                        if (iX == 1) {
                                            it4 = it5;
                                            i15 = 3;
                                            i16 = 2;
                                        } else if (iX != 2) {
                                            it4 = it5;
                                            i15 = 3;
                                            i16 = iX != 3 ? iX != 4 ? 1 : 5 : 4;
                                        } else {
                                            it4 = it5;
                                            i15 = 3;
                                            i16 = 3;
                                        }
                                        w9VarX.i(i16);
                                        int iZ = y8Var.z() - 1;
                                        if (iZ == 1) {
                                            i15 = 2;
                                        } else if (iZ != 2) {
                                            i15 = 1;
                                        }
                                        w9VarX.j(i15);
                                        arrayList5.add((x9) w9VarX.f());
                                        it3 = it6;
                                        list7 = list8;
                                        z13222 = z14;
                                        it5 = it4;
                                    }
                                }
                                Iterator it7 = it3;
                                boolean z15 = z13222;
                                List list9 = list7;
                                v9VarY.i(arrayList5);
                                jaVar.H(v9VarY);
                                arrayList2.add(Pair.create((ka) jaVar.f(), (Long) pair.second));
                                it3 = it7;
                                list7 = list9;
                                z13222 = z15;
                            }
                            list6 = arrayList2;
                        } catch (Throwable th5) {
                            th = th5;
                        }
                    } else {
                        List listAsList = Arrays.asList(((String) x.f13411d1.a(null)).split(","));
                        for (Pair pair2 : list2) {
                            try {
                                g0().M(((Long) pair2.second).longValue());
                                for (ca caVar : ((ka) pair2.first).X1()) {
                                    if (listAsList.contains(caVar.C())) {
                                        if (caVar.C().equals("_f") || caVar.C().equals("_v")) {
                                            ba baVar = (ba) caVar.l();
                                            j0();
                                            m4.L(baVar, "_dac", 1L);
                                            caVar = (ca) baVar.f();
                                        }
                                        l lVarG03 = g0();
                                        lVarG03.D();
                                        lVarG03.E();
                                        sg.w.e(str3);
                                        m1 m1Var6 = (m1) lVarG03.f13368a;
                                        try {
                                            m1Var6.b().K().b(caVar, "Caching events in NO_DATA mode");
                                            ContentValues contentValues = new ContentValues();
                                            contentValues.put("app_id", str3);
                                            ca caVar2 = caVar;
                                            contentValues.put(PendingUpgradeStore.KEY_NAME, caVar2.C());
                                            contentValues.put("data", caVar2.a());
                                            contentValues.put("timestamp_millis", Long.valueOf(caVar2.E()));
                                            try {
                                                if (lVarG03.u0().insert("no_data_mode_events", null, contentValues) == j12) {
                                                    m1Var6.b().H().b(o0.L(str3), "Failed to insert NO_DATA mode event (got -1). appId");
                                                }
                                            } catch (SQLiteException e19) {
                                                ((m1) lVarG03.f13368a).b().H().c(o0.L(str3), "Error storing NO_DATA mode event. appId", e19);
                                            }
                                        } catch (SQLiteException unused) {
                                            b().f13195k.b(str3, "Failed handling NO_DATA mode bundles. appId");
                                        }
                                    }
                                }
                            } catch (SQLiteException unused2) {
                            }
                        }
                        i5 = 34;
                        list6 = Collections.EMPTY_LIST;
                    }
                    zIsEmpty = list6.isEmpty();
                    list3 = list6;
                    if (zIsEmpty) {
                        return;
                    }
                } else {
                    i5 = 34;
                    list3 = list2;
                }
                a2VarF = f(str3);
                z1Var = z1.AD_STORAGE;
                if (!a2VarF.i(z1Var)) {
                    Iterator it8 = list3.iterator();
                    while (true) {
                        if (!it8.hasNext()) {
                            strD = null;
                            break;
                        }
                        ka kaVar = (ka) ((Pair) it8.next()).first;
                        if (!kaVar.D().isEmpty()) {
                            strD = kaVar.D();
                            break;
                        }
                    }
                    if (strD != null) {
                        for (int i19 = 0; i19 < list3.size(); i19++) {
                            ka kaVar2 = (ka) ((Pair) list3.get(i19)).first;
                            if (!kaVar2.D().isEmpty() && !kaVar2.D().equals(strD)) {
                                i11 = 0;
                                listSubList = list3.subList(0, i19);
                                break;
                            }
                        }
                        i11 = 0;
                        listSubList = list3;
                    } else {
                        i11 = 0;
                        listSubList = list3;
                    }
                }
                haVarE = ia.E();
                size = listSubList.size();
                ArrayList arrayList4222 = new ArrayList(listSubList.size());
                i12 = (e0().E(str3) || !f(str3).i(z1Var)) ? i11 : 1;
                boolean zI2222 = f(str3).i(z1Var);
                zI = f(str3).i(z1Var2);
                zO = e0().O(str3, x.M0);
                f4 f4Var222 = this.f13048j;
                e4 e4VarE222 = f4Var222.E(str3);
                list4 = listSubList;
                while (true) {
                    m1Var2 = this.f13050l;
                    if (i11 < size) {
                        break;
                    }
                    ja jaVar2 = (ja) ((ka) ((Pair) list4.get(i11)).first).l();
                    int i21 = size;
                    arrayList4222.add((Long) ((Pair) list4.get(i11)).second);
                    e0().J();
                    jaVar2.w();
                    jaVar2.c();
                    ((ka) jaVar2.f32762b).n0(j11);
                    m1Var2.getClass();
                    jaVar2.M();
                    if (i12 == 0) {
                        jaVar2.c();
                        ((ka) jaVar2.f32762b).a1();
                    }
                    if (!zI2222) {
                        jaVar2.c();
                        ((ka) jaVar2.f32762b).H1();
                        jaVar2.c();
                        ((ka) jaVar2.f32762b).J1();
                    }
                    if (!zI) {
                        jaVar2.c();
                        ((ka) jaVar2.f32762b).L1();
                    }
                    v(jaVar2, str3);
                    if (!zO) {
                        jaVar2.c();
                        ((ka) jaVar2.f32762b).h1();
                    }
                    if (!zI) {
                        jaVar2.c();
                        ((ka) jaVar2.f32762b).T1();
                    }
                    String strD2 = ((ka) jaVar2.f32762b).D();
                    if (TextUtils.isEmpty(strD2)) {
                        i13 = i12;
                    } else {
                        i13 = i12;
                        if (!strD2.equals("00000000-0000-0000-0000-000000000000")) {
                            i14 = i11;
                            z11 = zI;
                            list5 = list4;
                            z12 = zO;
                        }
                        if (jaVar2.a0() != 0) {
                            if (e0().O(str3, x.C0)) {
                                jaVar2.U(j0().m0(((ka) jaVar2.f()).a()));
                            }
                            ra raVarB = e4VarE222.b();
                            if (raVarB != null) {
                                jaVar2.F(raVarB);
                            }
                            haVarE.c();
                            ((ia) haVarE.f32762b).H((ka) jaVar2.f());
                        }
                        i11 = i14 + 1;
                        i12 = i13;
                        size = i21;
                        list4 = list5;
                        zI = z11;
                        zO = z12;
                    }
                    ArrayList arrayList6 = new ArrayList(jaVar2.Z());
                    Iterator it9 = arrayList6.iterator();
                    i14 = i11;
                    Long lValueOf = null;
                    Long lValueOf2 = null;
                    boolean z16 = false;
                    boolean z17 = false;
                    while (it9.hasNext()) {
                        boolean z18 = zI;
                        ca caVar3 = (ca) it9.next();
                        List list10 = list4;
                        boolean z19 = zO;
                        if ("_fx".equals(caVar3.C())) {
                            it9.remove();
                            list4 = list10;
                            zI = z18;
                            zO = z19;
                            z16 = true;
                        } else if ("_f".equals(caVar3.C())) {
                            j0();
                            fa faVarN = m4.N(caVar3, "_pfo");
                            if (faVarN != null) {
                                lValueOf = Long.valueOf(faVarN.C());
                            }
                            j0();
                            fa faVarN2 = m4.N(caVar3, "_uwa");
                            if (faVarN2 != null) {
                                lValueOf2 = Long.valueOf(faVarN2.C());
                            }
                            list4 = list10;
                            zI = z18;
                            zO = z19;
                        } else {
                            list4 = list10;
                            zI = z18;
                            zO = z19;
                        }
                        z17 = true;
                    }
                    z11 = zI;
                    list5 = list4;
                    z12 = zO;
                    if (z16) {
                        jaVar2.c();
                        ((ka) jaVar2.f32762b).i0();
                        jaVar2.c();
                        ((ka) jaVar2.f32762b).h0(arrayList6);
                    }
                    if (z17) {
                        u(jaVar2.r(), true, lValueOf, lValueOf2);
                    }
                    if (jaVar2.a0() != 0) {
                    }
                    i11 = i14 + 1;
                    i12 = i13;
                    size = i21;
                    list4 = list5;
                    zI = z11;
                    zO = z12;
                }
                if (((ia) haVarE.f32762b).y() != 0) {
                    p(arrayList4222);
                    z(false, Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, null, null, str3, Collections.EMPTY_LIST, null);
                    return;
                }
                ia iaVar = (ia) haVarE.f();
                ArrayList arrayList7 = new ArrayList();
                a3 a3Var = e4VarE222.f12916c;
                boolean z21 = a3Var == a3.SGTM_CLIENT;
                if (a3Var == a3.SGTM) {
                    it = ((ia) haVarE.f()).x().iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            if (((ka) it.next()).V()) {
                                string = UUID.randomUUID().toString();
                                break;
                            }
                        } else {
                            string = null;
                            break;
                        }
                    }
                    ia iaVar2 = (ia) haVarE.f();
                    c().D();
                    l0();
                    ha haVarF = ia.F(iaVar2);
                    if (!TextUtils.isEmpty(string)) {
                        haVarF.c();
                        ((ia) haVarF.f32762b).K(string);
                    }
                    strQ = f0().Q(str3);
                    if (!TextUtils.isEmpty(strQ)) {
                        haVarF.j(strQ);
                    }
                    ArrayList arrayList8 = new ArrayList();
                    it2 = iaVar2.x().iterator();
                    while (it2.hasNext()) {
                        ja jaVarD0 = ka.d0((ka) it2.next());
                        jaVarD0.c();
                        ((ka) jaVarD0.f32762b).a1();
                        arrayList8.add((ka) jaVarD0.f());
                    }
                    haVarF.c();
                    ((ia) haVarF.f32762b).J();
                    haVarF.c();
                    ((ia) haVarF.f32762b).I(arrayList8);
                    b().K().b(!TextUtils.isEmpty(string) ? AbstractJsonLexerKt.NULL : haVarF.i(), "[sgtm] Processed MeasurementBatch for sGTM with sgtmJoinId: ");
                    ia iaVar3 = (ia) haVarF.f();
                    if (TextUtils.isEmpty(string)) {
                        ia iaVar4 = (ia) haVarE.f();
                        c().D();
                        l0();
                        ha haVarE2 = ia.E();
                        b().K().b(string, "[sgtm] Processing Google Signal, sgtmJoinId:");
                        haVarE2.c();
                        ((ia) haVarE2.f32762b).K(string);
                        for (ka kaVar3 : iaVar4.x()) {
                            ja jaVarC0 = ka.c0();
                            String strW = kaVar3.W();
                            jaVarC0.c();
                            ((ka) jaVarC0.f32762b).Z0(strW);
                            int iS0 = kaVar3.S0();
                            jaVarC0.c();
                            ((ka) jaVarC0.f32762b).r1(iS0);
                            haVarE2.c();
                            ((ia) haVarE2.f32762b).H((ka) jaVarC0.f());
                        }
                        ia iaVar5 = (ia) haVarE2.f();
                        String strQ2 = f4Var222.f12889b.f0().Q(str3);
                        boolean zIsEmpty2 = TextUtils.isEmpty(strQ2);
                        a3 a3Var2 = a3.GOOGLE_SIGNAL;
                        a3 a3Var3 = a3.GOOGLE_SIGNAL_PENDING;
                        if (zIsEmpty2) {
                            str2 = null;
                            String str4 = (String) x.f13441s.a(null);
                            if (z21) {
                                a3Var2 = a3Var3;
                            }
                            e4Var = new e4(str4, Collections.EMPTY_MAP, a3Var2, null);
                        } else {
                            Uri uri = Uri.parse((String) x.f13441s.a(null));
                            Uri.Builder builderBuildUpon = uri.buildUpon();
                            String authority = uri.getAuthority();
                            StringBuilder sb3 = new StringBuilder(String.valueOf(strQ2).length() + 1 + String.valueOf(authority).length());
                            sb3.append(strQ2);
                            sb3.append(".");
                            sb3.append(authority);
                            builderBuildUpon.authority(sb3.toString());
                            String string2 = builderBuildUpon.build().toString();
                            if (z21) {
                                a3Var2 = a3Var3;
                            }
                            str2 = null;
                            e4Var = new e4(string2, Collections.EMPTY_MAP, a3Var2, null);
                        }
                        arrayList7.add(Pair.create(iaVar5, e4Var));
                    } else {
                        str2 = null;
                    }
                    if (!z21) {
                        ha haVar = (ha) iaVar3.l();
                        for (int i22 = 0; i22 < iaVar3.y(); i22++) {
                            ja jaVar3 = (ja) iaVar3.z(i22).l();
                            jaVar3.f0();
                            jaVar3.G(j11);
                            haVar.c();
                            ((ia) haVar.f32762b).G(i22, (ka) jaVar3.f());
                        }
                        arrayList7.add(Pair.create((ia) haVar.f(), e4VarE222));
                        p(arrayList4222);
                        z(false, Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, null, null, str, arrayList7, null);
                        if (s(str, e4VarE222.a())) {
                            b().K().b(str, "[sgtm] Sending sgtm batches available notification to app");
                            Intent intent = new Intent();
                            intent.setAction("com.google.android.gms.measurement.BATCHES_AVAILABLE");
                            intent.setPackage(str);
                            Context contextD = m1Var2.d();
                            if (Build.VERSION.SDK_INT < i5) {
                                contextD.sendBroadcast(intent);
                                return;
                            } else {
                                contextD.sendBroadcast(intent, null, BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle());
                                return;
                            }
                        }
                        return;
                    }
                    str3 = str;
                    iaVar = iaVar3;
                } else if (z21) {
                    z21 = true;
                    it = ((ia) haVarE.f()).x().iterator();
                    while (true) {
                        if (!it.hasNext()) {
                        }
                    }
                    ia iaVar22 = (ia) haVarE.f();
                    c().D();
                    l0();
                    ha haVarF2 = ia.F(iaVar22);
                    if (!TextUtils.isEmpty(string)) {
                    }
                    strQ = f0().Q(str3);
                    if (!TextUtils.isEmpty(strQ)) {
                    }
                    ArrayList arrayList82 = new ArrayList();
                    it2 = iaVar22.x().iterator();
                    while (it2.hasNext()) {
                    }
                    haVarF2.c();
                    ((ia) haVarF2.f32762b).J();
                    haVarF2.c();
                    ((ia) haVarF2.f32762b).I(arrayList82);
                    b().K().b(!TextUtils.isEmpty(string) ? AbstractJsonLexerKt.NULL : haVarF2.i(), "[sgtm] Processed MeasurementBatch for sGTM with sgtmJoinId: ");
                    ia iaVar32 = (ia) haVarF2.f();
                    if (TextUtils.isEmpty(string)) {
                    }
                    if (!z21) {
                    }
                } else {
                    str2 = null;
                }
                s0 s0Var = this.f13040b;
                T(s0Var);
                if (s0Var.H()) {
                    String strE0 = Log.isLoggable(b().N(), 2) ? j0().e0(iaVar) : str2;
                    j0();
                    byte[] bArrA = iaVar.a();
                    p(arrayList4222);
                    this.f13047i.f13287i.g(j11);
                    b().K().d("Uploading data. app, uncompressed size, data", str3, Integer.valueOf(bArrA.length), strE0);
                    this.f13057u = true;
                    T(s0Var);
                    s0Var.K(str3, e4VarE222, iaVar, new mg.l((j4) this, str3, arrayList7, 8));
                    return;
                }
                return;
            }
            ArrayList arrayList9 = new ArrayList();
            int length = 0;
            while (true) {
                long j13 = cursorQuery.getLong(i17);
                try {
                    byte[] blob = cursorQuery.getBlob(i18);
                    m4 m4VarJ0 = lVarG0.f12889b.j0();
                    try {
                        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(blob);
                        GZIPInputStream gZIPInputStream = new GZIPInputStream(byteArrayInputStream);
                        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                        byte[] bArr = new byte[1024];
                        r22 = lVarG0;
                        while (true) {
                            try {
                                int i23 = gZIPInputStream.read(bArr);
                                if (i23 <= 0) {
                                    break;
                                }
                                m1Var = m1Var4;
                                try {
                                    try {
                                        byteArrayOutputStream.write(bArr, 0, i23);
                                        m1Var4 = m1Var;
                                    } catch (IOException e21) {
                                        e = e21;
                                        try {
                                            ((m1) m4VarJ0.f13368a).b().H().b(e, "Failed to ungzip content");
                                            throw e;
                                        } catch (IOException e22) {
                                            e = e22;
                                            m1Var.b().H().c(o0.L(str3), "Failed to unzip queued bundle. appId", e);
                                            r22 = r22;
                                            if (cursorQuery.moveToNext()) {
                                                break;
                                            } else {
                                                break;
                                            }
                                            cursorQuery.close();
                                            list2 = arrayList9;
                                            cursor2 = r22;
                                            if (list2.isEmpty()) {
                                            }
                                        }
                                    }
                                } catch (SQLiteException e23) {
                                    e = e23;
                                    m1Var.b().H().c(o0.L(str3), "Error querying bundles. appId", e);
                                    list = Collections.EMPTY_LIST;
                                    cursor6 = r22;
                                    cursor5 = r22;
                                    if (cursorQuery != null) {
                                    }
                                    list2 = list;
                                    cursor2 = cursor5;
                                    if (list2.isEmpty()) {
                                    }
                                }
                            } catch (IOException e24) {
                                e = e24;
                                m1Var = m1Var4;
                                ((m1) m4VarJ0.f13368a).b().H().b(e, "Failed to ungzip content");
                                throw e;
                            }
                        }
                        gZIPInputStream.close();
                        byteArrayInputStream.close();
                        byteArray = byteArrayOutputStream.toByteArray();
                    } catch (IOException e25) {
                        e = e25;
                        r22 = lVarG0;
                    }
                } catch (IOException e26) {
                    e = e26;
                    r22 = lVarG0;
                    m1Var = m1Var4;
                }
                if (!arrayList9.isEmpty() && byteArray.length + length > iMax) {
                    break;
                }
                try {
                    ja jaVar4 = (ja) m4.o0(ka.c0(), byteArray);
                    if (!arrayList9.isEmpty()) {
                        ka kaVar4 = (ka) ((Pair) arrayList9.get(0)).first;
                        ka kaVar5 = (ka) jaVar4.f();
                        if (!kaVar4.C0().equals(kaVar5.C0()) || !kaVar4.J0().equals(kaVar5.J0()) || kaVar4.L0() != kaVar5.L0() || !kaVar4.N0().equals(kaVar5.N0())) {
                            break;
                        }
                        Iterator it10 = kaVar4.d2().iterator();
                        while (true) {
                            if (!it10.hasNext()) {
                                jD = -1;
                                break;
                            }
                            ta taVar = (ta) it10.next();
                            Iterator it11 = it10;
                            if ("_npa".equals(taVar.z())) {
                                jD = taVar.D();
                                break;
                            }
                            it10 = it11;
                        }
                        Iterator it12 = kaVar5.d2().iterator();
                        while (true) {
                            if (!it12.hasNext()) {
                                jD2 = -1;
                                break;
                            }
                            ta taVar2 = (ta) it12.next();
                            if ("_npa".equals(taVar2.z())) {
                                jD2 = taVar2.D();
                                break;
                            }
                        }
                        if (jD != jD2) {
                            break;
                        }
                    }
                    if (!cursorQuery.isNull(2)) {
                        int i24 = cursorQuery.getInt(2);
                        jaVar4.c();
                        ((ka) jaVar4.f32762b).b1(i24);
                    }
                    length += byteArray.length;
                    arrayList9.add(Pair.create((ka) jaVar4.f(), Long.valueOf(j13)));
                } catch (IOException e27) {
                    m1Var4.b().H().c(o0.L(str3), "Failed to merge queued bundle. appId", e27);
                }
                m1Var = m1Var4;
                r22 = r22;
                if (cursorQuery.moveToNext() || length > iMax) {
                    break;
                    break;
                }
                lVarG0 = r22;
                m1Var4 = m1Var;
                i17 = 0;
                i18 = 1;
            }
            cursorQuery.close();
            list2 = arrayList9;
            cursor2 = r22;
            if (list2.isEmpty()) {
            }
        } catch (Throwable th6) {
            th = th6;
            cursor = r11;
        }
    }

    public final boolean s(String str, String str2) {
        l lVar = this.f13041c;
        T(lVar);
        t0 t0VarH0 = lVar.H0(str);
        HashMap map = this.E;
        if (t0VarH0 != null && k0().i0(str, t0VarH0.D())) {
            map.remove(str2);
            return true;
        }
        i4 i4Var = (i4) map.get(str2);
        if (i4Var != null) {
            i4Var.f13016a.e().getClass();
            if (System.currentTimeMillis() < i4Var.f13018c) {
                return false;
            }
        }
        return true;
    }

    public final void t(String str) {
        c().D();
        l0();
        this.f13058v = true;
        try {
            m1 m1Var = this.f13050l;
            m1Var.getClass();
            Boolean bool = m1Var.o().f13231e;
            if (bool == null) {
                b().f13193i.a("Upload data called on the client side before use of service was decided");
            } else if (bool.booleanValue()) {
                b().f13190f.a("Upload called in the client side when service should be used");
            } else if (this.o > 0) {
                N();
            } else {
                s0 s0Var = this.f13040b;
                T(s0Var);
                if (s0Var.H()) {
                    l lVar = this.f13041c;
                    T(lVar);
                    if (lVar.J(str)) {
                        l lVar2 = this.f13041c;
                        T(lVar2);
                        sg.w.e(str);
                        lVar2.D();
                        lVar2.E();
                        List listI = lVar2.I(str, zzoo.b(a3.GOOGLE_SIGNAL), 1);
                        l4 l4Var = listI.isEmpty() ? null : (l4) listI.get(0);
                        if (l4Var != null) {
                            ia iaVar = l4Var.f13117b;
                            b().n.d("[sgtm] Uploading data from upload queue. appId, type, url", str, l4Var.f13120e, l4Var.f13118c);
                            byte[] bArrA = iaVar.a();
                            if (Log.isLoggable(b().N(), 2)) {
                                m4 m4Var = this.f13045g;
                                T(m4Var);
                                b().n.d("[sgtm] Uploading data from upload queue. appId, uncompressed size, data", str, Integer.valueOf(bArrA.length), m4Var.e0(iaVar));
                            }
                            e4 e4Var = new e4(l4Var.f13118c, l4Var.f13119d, l4Var.f13120e, null);
                            this.f13057u = true;
                            s0 s0Var2 = this.f13040b;
                            T(s0Var2);
                            s0Var2.K(str, e4Var, iaVar, new mg.l(this, str, l4Var, 9));
                        }
                    } else {
                        b().n.b(str, "[sgtm] Upload queue has no batches for appId");
                    }
                } else {
                    b().n.a("Network not connected, ignoring upload request");
                    N();
                }
            }
            this.f13058v = false;
            O();
        } catch (Throwable th2) {
            this.f13058v = false;
            O();
            throw th2;
        }
    }

    public final void u(String str, boolean z11, Long l9, Long l11) {
        l lVar = this.f13041c;
        T(lVar);
        t0 t0VarH0 = lVar.H0(str);
        if (t0VarH0 != null) {
            m1 m1Var = t0VarH0.f13310a;
            k1 k1Var = m1Var.f13139g;
            m1.l(k1Var);
            k1Var.D();
            t0VarH0.R |= t0VarH0.f13332y != z11;
            t0VarH0.f13332y = z11;
            k1 k1Var2 = m1Var.f13139g;
            m1.l(k1Var2);
            k1Var2.D();
            t0VarH0.R |= !Objects.equals(t0VarH0.f13333z, l9);
            t0VarH0.f13333z = l9;
            k1 k1Var3 = m1Var.f13139g;
            m1.l(k1Var3);
            k1Var3.D();
            t0VarH0.R |= !Objects.equals(t0VarH0.A, l11);
            t0VarH0.A = l11;
            if (t0VarH0.o()) {
                l lVar2 = this.f13041c;
                T(lVar2);
                lVar2.I0(t0VarH0, false);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x0121  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void v(ja jaVar, String str) {
        int iP0;
        int iIndexOf;
        g1 g1Var = this.f13039a;
        T(g1Var);
        g1Var.D();
        g1Var.J(str);
        z.e eVar = g1Var.f12968e;
        Set set = (Set) eVar.get(str);
        if (set != null) {
            jaVar.c();
            ((ka) jaVar.f32762b).i1(set);
        }
        T(g1Var);
        g1Var.D();
        g1Var.J(str);
        if (eVar.get(str) != null && (((Set) eVar.get(str)).contains(TrackingOptions.AMP_TRACKING_OPTION_DEVICE_MODEL) || ((Set) eVar.get(str)).contains("device_info"))) {
            jaVar.c();
            ((ka) jaVar.f32762b).y1();
        }
        T(g1Var);
        if (g1Var.W(str)) {
            String strR2 = ((ka) jaVar.f32762b).r2();
            if (!TextUtils.isEmpty(strR2) && (iIndexOf = strR2.indexOf(".")) != -1) {
                String strSubstring = strR2.substring(0, iIndexOf);
                jaVar.c();
                ((ka) jaVar.f32762b).w0(strSubstring);
            }
        }
        T(g1Var);
        g1Var.D();
        g1Var.J(str);
        if (eVar.get(str) != null && ((Set) eVar.get(str)).contains("user_id") && (iP0 = m4.p0(jaVar, "_id")) != -1) {
            jaVar.c();
            ((ka) jaVar.f32762b).m0(iP0);
        }
        T(g1Var);
        g1Var.D();
        g1Var.J(str);
        if (eVar.get(str) != null && ((Set) eVar.get(str)).contains("google_signals")) {
            jaVar.c();
            ((ka) jaVar.f32762b).a1();
        }
        T(g1Var);
        if (g1Var.X(str)) {
            jaVar.c();
            ((ka) jaVar.f32762b).L1();
            if (f(str).i(z1.ANALYTICS_STORAGE)) {
                HashMap map = this.D;
                h4 h4Var = (h4) map.get(str);
                if (h4Var != null) {
                    long jL = e0().L(str, x.f13425j0) + h4Var.f12998b;
                    e().getClass();
                    if (jL < SystemClock.elapsedRealtime()) {
                        h4Var = new h4(this, k0().A0());
                        map.put(str, h4Var);
                    }
                    String str2 = h4Var.f12997a;
                    jaVar.c();
                    ((ka) jaVar.f32762b).j1(str2);
                }
            }
        }
        T(g1Var);
        g1Var.D();
        g1Var.J(str);
        if (eVar.get(str) == null || !((Set) eVar.get(str)).contains("enhanced_user_id")) {
            return;
        }
        jaVar.c();
        ((ka) jaVar.f32762b).h1();
    }

    public final void w(ja jaVar, x0 x0Var) {
        String strA0;
        String strA02;
        for (int i5 = 0; i5 < jaVar.a0(); i5++) {
            ba baVar = (ba) ((ka) jaVar.f32762b).c2(i5).l();
            Iterator it = baVar.i().iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                if ("_c".equals(((fa) it.next()).y())) {
                    if (((ka) x0Var.f13458b).O0() >= e0().M(((ka) x0Var.f13458b).x(), x.f13428k0)) {
                        int iM = e0().M(((ka) x0Var.f13458b).x(), x.f13452x0);
                        LinkedList linkedList = this.f13053q;
                        m4 m4Var = this.f13045g;
                        if (iM > 0) {
                            l lVar = this.f13041c;
                            T(lVar);
                            if (lVar.J0(g(), ((ka) x0Var.f13458b).x(), false, false, false, true).f12963g > iM) {
                                ea eaVarJ = fa.J();
                                eaVarJ.i("_tnr");
                                eaVarJ.k(1L);
                                baVar.m((fa) eaVarJ.f());
                            } else {
                                if (e0().O(((ka) x0Var.f13458b).x(), x.Q0)) {
                                    strA02 = k0().A0();
                                    ea eaVarJ2 = fa.J();
                                    eaVarJ2.i("_tu");
                                    eaVarJ2.j(strA02);
                                    baVar.m((fa) eaVarJ2.f());
                                } else {
                                    strA02 = null;
                                }
                                ea eaVarJ3 = fa.J();
                                eaVarJ3.i("_tr");
                                eaVarJ3.k(1L);
                                baVar.m((fa) eaVarJ3.f());
                                T(m4Var);
                                zzoh zzohVarC0 = m4Var.c0(((ka) x0Var.f13458b).x(), jaVar, baVar, strA02);
                                if (zzohVarC0 != null) {
                                    b().n.c(((ka) x0Var.f13458b).x(), "Generated trigger URI. appId, uri", zzohVarC0.f33773f);
                                    l lVar2 = this.f13041c;
                                    T(lVar2);
                                    lVar2.Y(((ka) x0Var.f13458b).x(), zzohVarC0);
                                    if (!linkedList.contains(((ka) x0Var.f13458b).x())) {
                                        linkedList.add(((ka) x0Var.f13458b).x());
                                    }
                                }
                            }
                        } else {
                            if (e0().O(((ka) x0Var.f13458b).x(), x.Q0)) {
                                strA0 = k0().A0();
                                ea eaVarJ4 = fa.J();
                                eaVarJ4.i("_tu");
                                eaVarJ4.j(strA0);
                                baVar.m((fa) eaVarJ4.f());
                            } else {
                                strA0 = null;
                            }
                            ea eaVarJ5 = fa.J();
                            eaVarJ5.i("_tr");
                            eaVarJ5.k(1L);
                            baVar.m((fa) eaVarJ5.f());
                            T(m4Var);
                            zzoh zzohVarC02 = m4Var.c0(((ka) x0Var.f13458b).x(), jaVar, baVar, strA0);
                            if (zzohVarC02 != null) {
                                b().n.c(((ka) x0Var.f13458b).x(), "Generated trigger URI. appId, uri", zzohVarC02.f33773f);
                                l lVar3 = this.f13041c;
                                T(lVar3);
                                lVar3.Y(((ka) x0Var.f13458b).x(), zzohVarC02);
                                if (!linkedList.contains(((ka) x0Var.f13458b).x())) {
                                    linkedList.add(((ka) x0Var.f13458b).x());
                                }
                            }
                        }
                    }
                    ca caVar = (ca) baVar.f();
                    jaVar.c();
                    ((ka) jaVar.f32762b).f0(i5, caVar);
                }
            }
        }
    }

    public final void x(String str, ea eaVar, Bundle bundle, String str2) {
        int I;
        List listK = e0().O(str2, x.f13402a1) ? p6.a1.k("_o", "_sn", "_sc", "_si", "deep_link_url") : p6.a1.k("_o", "_sn", "_sc", "_si");
        if (p4.h0(((fa) eaVar.f32762b).y()) || p4.h0(str)) {
            I = e0().I(str2, true);
        } else {
            e eVarE0 = e0();
            eVarE0.getClass();
            I = Math.max(Math.min(eVarE0.M(str2, x.f13419g0), 500), 100);
        }
        long j11 = I;
        long jCodePointCount = ((fa) eaVar.f32762b).A().codePointCount(0, ((fa) eaVar.f32762b).A().length());
        k0();
        String strY = ((fa) eaVar.f32762b).y();
        e0();
        String strK = p4.K(40, strY, true);
        if (jCodePointCount <= j11 || listK.contains(((fa) eaVar.f32762b).y())) {
            return;
        }
        if ("_ev".equals(((fa) eaVar.f32762b).y())) {
            k0();
            bundle.putString("_ev", p4.K(e0().I(str2, true), ((fa) eaVar.f32762b).A(), true));
            return;
        }
        b().f13195k.c(strK, "Param value is too long; discarded. Name, value length", Long.valueOf(jCodePointCount));
        if (bundle.getLong("_err") == 0) {
            bundle.putLong("_err", 4L);
            if (bundle.getString("_ev") == null) {
                bundle.putString("_ev", strK);
                bundle.putLong("_el", jCodePointCount);
            }
        }
        bundle.remove(((fa) eaVar.f32762b).y());
    }

    public final boolean y(ba baVar) {
        ArrayList arrayList = new ArrayList(baVar.i());
        int i5 = -1;
        int i11 = -1;
        for (int i12 = 0; i12 < arrayList.size(); i12++) {
            if ("value".equals(((fa) arrayList.get(i12)).y())) {
                i5 = i12;
            } else if (TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY.equals(((fa) arrayList.get(i12)).y())) {
                i11 = i12;
            }
        }
        if (i5 == -1) {
            if (!e0().O(null, x.f13417f1) || !"_iap".equals(baVar.q())) {
                return true;
            }
            E(baVar, "_c");
            D(baVar, 18, "value");
            return false;
        }
        if (!((fa) arrayList.get(i5)).B() && !((fa) arrayList.get(i5)).F()) {
            b().f13195k.a("Value must be specified with a numeric type.");
            baVar.o(i5);
            E(baVar, "_c");
            D(baVar, 18, "value");
            return false;
        }
        if (i11 != -1) {
            String strA = ((fa) arrayList.get(i11)).A();
            if (strA.length() == 3) {
                int iCharCount = 0;
                while (iCharCount < strA.length()) {
                    int iCodePointAt = strA.codePointAt(iCharCount);
                    if (Character.isLetter(iCodePointAt)) {
                        iCharCount += Character.charCount(iCodePointAt);
                    }
                }
                return true;
            }
        }
        b().f13195k.a("Value parameter discarded. You must also supply a 3-letter ISO_4217 currency code in the currency parameter.");
        baVar.o(i5);
        E(baVar, "_c");
        D(baVar, 19, TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY);
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:109:0x0169 A[EDGE_INSN: B:109:0x0169->B:55:0x0169 BREAK  A[LOOP:0: B:36:0x010b->B:111:0x010b], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0086 A[Catch: all -> 0x0018, TryCatch #1 {all -> 0x0018, blocks: (B:4:0x0015, B:8:0x001d, B:10:0x002a, B:11:0x0034, B:19:0x0048, B:24:0x0098, B:23:0x0086, B:25:0x00a5, B:27:0x00ba, B:30:0x00d0, B:32:0x00de, B:34:0x00fa, B:84:0x0234, B:86:0x0247, B:88:0x0252, B:96:0x0271, B:90:0x0258, B:92:0x0261, B:94:0x0267, B:95:0x026b, B:97:0x0274, B:98:0x027c, B:33:0x00ef, B:99:0x027d), top: B:105:0x0015, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00a5 A[Catch: all -> 0x0018, PHI: r0
      0x00a5: PHI (r0v2 int) = (r0v0 int), (r0v35 int) binds: [B:12:0x003b, B:18:0x0046] A[DONT_GENERATE, DONT_INLINE], TRY_LEAVE, TryCatch #1 {all -> 0x0018, blocks: (B:4:0x0015, B:8:0x001d, B:10:0x002a, B:11:0x0034, B:19:0x0048, B:24:0x0098, B:23:0x0086, B:25:0x00a5, B:27:0x00ba, B:30:0x00d0, B:32:0x00de, B:34:0x00fa, B:84:0x0234, B:86:0x0247, B:88:0x0252, B:96:0x0271, B:90:0x0258, B:92:0x0261, B:94:0x0267, B:95:0x026b, B:97:0x0274, B:98:0x027c, B:33:0x00ef, B:99:0x027d), top: B:105:0x0015, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00de A[Catch: all -> 0x0018, SQLiteException -> 0x00cd, TryCatch #3 {SQLiteException -> 0x00cd, blocks: (B:27:0x00ba, B:30:0x00d0, B:32:0x00de, B:34:0x00fa, B:84:0x0234, B:86:0x0247, B:88:0x0252, B:96:0x0271, B:90:0x0258, B:92:0x0261, B:94:0x0267, B:95:0x026b, B:97:0x0274, B:98:0x027c, B:33:0x00ef), top: B:108:0x00ba, outer: #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00ef A[Catch: all -> 0x0018, SQLiteException -> 0x00cd, TryCatch #3 {SQLiteException -> 0x00cd, blocks: (B:27:0x00ba, B:30:0x00d0, B:32:0x00de, B:34:0x00fa, B:84:0x0234, B:86:0x0247, B:88:0x0252, B:96:0x0271, B:90:0x0258, B:92:0x0261, B:94:0x0267, B:95:0x026b, B:97:0x0274, B:98:0x027c, B:33:0x00ef), top: B:108:0x00ba, outer: #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0115 A[Catch: all -> 0x0166, TRY_ENTER, TRY_LEAVE, TryCatch #0 {all -> 0x0166, blocks: (B:35:0x0102, B:36:0x010b, B:39:0x0115, B:42:0x0129, B:44:0x0135, B:45:0x0137, B:49:0x014e, B:51:0x0158, B:55:0x0169, B:56:0x016e, B:58:0x0174, B:60:0x0187, B:62:0x019e, B:63:0x01a0, B:65:0x01b2, B:67:0x01ce, B:69:0x01f2, B:70:0x0201, B:71:0x0205, B:73:0x020b, B:74:0x0212, B:77:0x0220, B:79:0x0224, B:82:0x022b, B:83:0x022c), top: B:104:0x0102, inners: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0174 A[Catch: all -> 0x0166, TryCatch #0 {all -> 0x0166, blocks: (B:35:0x0102, B:36:0x010b, B:39:0x0115, B:42:0x0129, B:44:0x0135, B:45:0x0137, B:49:0x014e, B:51:0x0158, B:55:0x0169, B:56:0x016e, B:58:0x0174, B:60:0x0187, B:62:0x019e, B:63:0x01a0, B:65:0x01b2, B:67:0x01ce, B:69:0x01f2, B:70:0x0201, B:71:0x0205, B:73:0x020b, B:74:0x0212, B:77:0x0220, B:79:0x0224, B:82:0x022b, B:83:0x022c), top: B:104:0x0102, inners: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x01ce A[Catch: all -> 0x0166, TryCatch #0 {all -> 0x0166, blocks: (B:35:0x0102, B:36:0x010b, B:39:0x0115, B:42:0x0129, B:44:0x0135, B:45:0x0137, B:49:0x014e, B:51:0x0158, B:55:0x0169, B:56:0x016e, B:58:0x0174, B:60:0x0187, B:62:0x019e, B:63:0x01a0, B:65:0x01b2, B:67:0x01ce, B:69:0x01f2, B:70:0x0201, B:71:0x0205, B:73:0x020b, B:74:0x0212, B:77:0x0220, B:79:0x0224, B:82:0x022b, B:83:0x022c), top: B:104:0x0102, inners: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:73:0x020b A[Catch: all -> 0x0166, TRY_LEAVE, TryCatch #0 {all -> 0x0166, blocks: (B:35:0x0102, B:36:0x010b, B:39:0x0115, B:42:0x0129, B:44:0x0135, B:45:0x0137, B:49:0x014e, B:51:0x0158, B:55:0x0169, B:56:0x016e, B:58:0x0174, B:60:0x0187, B:62:0x019e, B:63:0x01a0, B:65:0x01b2, B:67:0x01ce, B:69:0x01f2, B:70:0x0201, B:71:0x0205, B:73:0x020b, B:74:0x0212, B:77:0x0220, B:79:0x0224, B:82:0x022b, B:83:0x022c), top: B:104:0x0102, inners: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0247 A[Catch: all -> 0x0018, SQLiteException -> 0x00cd, TryCatch #3 {SQLiteException -> 0x00cd, blocks: (B:27:0x00ba, B:30:0x00d0, B:32:0x00de, B:34:0x00fa, B:84:0x0234, B:86:0x0247, B:88:0x0252, B:96:0x0271, B:90:0x0258, B:92:0x0261, B:94:0x0267, B:95:0x026b, B:97:0x0274, B:98:0x027c, B:33:0x00ef), top: B:108:0x00ba, outer: #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0258 A[Catch: all -> 0x0018, SQLiteException -> 0x00cd, TryCatch #3 {SQLiteException -> 0x00cd, blocks: (B:27:0x00ba, B:30:0x00d0, B:32:0x00de, B:34:0x00fa, B:84:0x0234, B:86:0x0247, B:88:0x0252, B:96:0x0271, B:90:0x0258, B:92:0x0261, B:94:0x0267, B:95:0x026b, B:97:0x0274, B:98:0x027c, B:33:0x00ef), top: B:108:0x00ba, outer: #1 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void z(boolean z11, int i5, Throwable th2, byte[] bArr, String str, List list, Map map) {
        byte[] bArr2;
        Iterator it;
        boolean zHasNext;
        a3 a3Var;
        Iterator it2;
        List listI;
        int i11 = i5;
        s0 s0Var = this.f13040b;
        c().D();
        l0();
        if (bArr == null) {
            try {
                bArr2 = new byte[0];
            } catch (Throwable th3) {
                this.f13057u = false;
                O();
                throw th3;
            }
        } else {
            bArr2 = bArr;
        }
        if (e0().O(null, x.f13414e1)) {
            m4 m4Var = this.f13045g;
            T(m4Var);
            m4Var.J(map);
        }
        ArrayList<Long> arrayList = this.f13061y;
        sg.w.h(arrayList);
        this.f13061y = null;
        if (!z11) {
            m0 m0Var = b().n;
            Integer numValueOf = Integer.valueOf(i11);
            m0Var.c(numValueOf, "Network upload successful with code, uploadAttempted", Boolean.valueOf(z11));
            if (z11) {
                try {
                    w0 w0Var = this.f13047i.f13286h;
                    e().getClass();
                    w0Var.g(System.currentTimeMillis());
                    this.f13047i.f13287i.g(0L);
                    N();
                    if (z11) {
                        b().n.a("Purged empty bundles");
                    } else {
                        b().n.c(numValueOf, "Successful upload. Got network response. code, size", Integer.valueOf(bArr2.length));
                    }
                    l lVar = this.f13041c;
                    T(lVar);
                    lVar.r0();
                    try {
                        HashMap map2 = new HashMap();
                        it = list.iterator();
                        while (true) {
                            zHasNext = it.hasNext();
                            a3Var = a3.SGTM_CLIENT;
                            if (zHasNext) {
                                break;
                            }
                            Pair pair = (Pair) it.next();
                            ia iaVar = (ia) pair.first;
                            e4 e4Var = (e4) pair.second;
                            a3 a3Var2 = e4Var.f12916c;
                            a3 a3Var3 = e4Var.f12916c;
                            if (a3Var2 != a3Var) {
                                l lVar2 = this.f13041c;
                                T(lVar2);
                                String str2 = e4Var.f12914a;
                                Map map3 = e4Var.f12915b;
                                if (map3 == null) {
                                    map3 = Collections.EMPTY_MAP;
                                }
                                long jH = lVar2.H(str, iaVar, str2, map3, a3Var3, null);
                                if (a3Var3 == a3.GOOGLE_SIGNAL_PENDING && jH != -1 && !iaVar.B().isEmpty()) {
                                    map2.put(iaVar.B(), Long.valueOf(jH));
                                }
                            }
                        }
                        it2 = list.iterator();
                        while (it2.hasNext()) {
                            Pair pair2 = (Pair) it2.next();
                            ia iaVar2 = (ia) pair2.first;
                            e4 e4Var2 = (e4) pair2.second;
                            if (e4Var2.f12916c == a3Var) {
                                Long l9 = (Long) map2.get(iaVar2.B());
                                l lVar3 = this.f13041c;
                                T(lVar3);
                                a3 a3Var4 = a3Var;
                                String str3 = e4Var2.f12914a;
                                Map map4 = e4Var2.f12915b;
                                if (map4 == null) {
                                    map4 = Collections.EMPTY_MAP;
                                }
                                lVar3.H(str, iaVar2, str3, map4, e4Var2.f12916c, l9);
                                a3Var = a3Var4;
                            }
                        }
                        l lVar4 = this.f13041c;
                        T(lVar4);
                        listI = lVar4.I(str, zzoo.b(a3Var), 1);
                        if (!listI.isEmpty()) {
                            long j11 = ((l4) listI.get(0)).f13121f;
                            e().getClass();
                            if (System.currentTimeMillis() > ((Long) x.F.a(null)).longValue() + j11) {
                                b().f13193i.c(str, "[sgtm] client batches are queued too long. appId, creationTime", Long.valueOf(j11));
                            }
                        }
                        for (Long l11 : arrayList) {
                            try {
                                l lVar5 = this.f13041c;
                                T(lVar5);
                                lVar5.M(l11.longValue());
                            } catch (SQLiteException e3) {
                                ArrayList arrayList2 = this.f13062z;
                                if (arrayList2 == null || !arrayList2.contains(l11)) {
                                    throw e3;
                                }
                            }
                        }
                        l lVar6 = this.f13041c;
                        T(lVar6);
                        lVar6.s0();
                        l lVar7 = this.f13041c;
                        T(lVar7);
                        lVar7.t0();
                        this.f13062z = null;
                        T(s0Var);
                        if (!s0Var.H()) {
                            l lVar8 = this.f13041c;
                            T(lVar8);
                            if (lVar8.J(str)) {
                                t(str);
                            } else {
                                T(s0Var);
                                if (s0Var.H() && M()) {
                                    q();
                                } else {
                                    this.A = -1L;
                                    N();
                                }
                            }
                            this.o = 0L;
                        }
                    } catch (Throwable th4) {
                        l lVar9 = this.f13041c;
                        T(lVar9);
                        lVar9.t0();
                        throw th4;
                    }
                } catch (SQLiteException e11) {
                    b().f13190f.b(e11, "Database error while trying to delete uploaded bundles");
                    e().getClass();
                    this.o = SystemClock.elapsedRealtime();
                    b().n.b(Long.valueOf(this.o), "Disable upload, time");
                }
            } else {
                this.f13047i.f13287i.g(0L);
                N();
                if (z11) {
                }
                l lVar10 = this.f13041c;
                T(lVar10);
                lVar10.r0();
                HashMap map22 = new HashMap();
                it = list.iterator();
                while (true) {
                    zHasNext = it.hasNext();
                    a3Var = a3.SGTM_CLIENT;
                    if (zHasNext) {
                    }
                }
                it2 = list.iterator();
                while (it2.hasNext()) {
                }
                l lVar42 = this.f13041c;
                T(lVar42);
                listI = lVar42.I(str, zzoo.b(a3Var), 1);
                if (!listI.isEmpty()) {
                }
                while (r2.hasNext()) {
                }
                l lVar62 = this.f13041c;
                T(lVar62);
                lVar62.s0();
                l lVar72 = this.f13041c;
                T(lVar72);
                lVar72.t0();
                this.f13062z = null;
                T(s0Var);
                if (!s0Var.H()) {
                }
            }
        } else if (i11 != 200) {
            if (i11 == 204) {
                i11 = 204;
                if (th2 == null) {
                }
            }
            String str4 = new String(bArr2, StandardCharsets.UTF_8);
            b().f13195k.d("Network upload failed. Will retry later. code, error", Integer.valueOf(i11), th2, str4.substring(0, Math.min(32, str4.length())));
            w0 w0Var2 = this.f13047i.f13287i;
            e().getClass();
            w0Var2.g(System.currentTimeMillis());
            if (i11 != 503) {
                w0 w0Var3 = this.f13047i.f13285g;
                e().getClass();
                w0Var3.g(System.currentTimeMillis());
                l lVar11 = this.f13041c;
                T(lVar11);
                lVar11.O(arrayList);
                N();
            }
        } else if (th2 == null) {
            String str42 = new String(bArr2, StandardCharsets.UTF_8);
            b().f13195k.d("Network upload failed. Will retry later. code, error", Integer.valueOf(i11), th2, str42.substring(0, Math.min(32, str42.length())));
            w0 w0Var22 = this.f13047i.f13287i;
            e().getClass();
            w0Var22.g(System.currentTimeMillis());
            if (i11 != 503 || i11 == 429) {
                w0 w0Var32 = this.f13047i.f13285g;
                e().getClass();
                w0Var32.g(System.currentTimeMillis());
            }
            l lVar112 = this.f13041c;
            T(lVar112);
            lVar112.O(arrayList);
            N();
        }
        this.f13057u = false;
        O();
    }
}
