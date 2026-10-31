package com.google.android.gms.internal.measurement;

import android.content.Context;
import android.net.Uri;
import android.os.StrictMode;
import android.util.Pair;
import com.google.android.gms.common.Feature;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public final class sd {

    /* renamed from: i, reason: collision with root package name */
    public static final d2 f33058i = new d2(12);

    /* renamed from: j, reason: collision with root package name */
    public static final kd f33059j;

    /* renamed from: a, reason: collision with root package name */
    public volatile le f33060a;

    /* renamed from: b, reason: collision with root package name */
    public final ob f33061b;

    /* renamed from: c, reason: collision with root package name */
    public final String f33062c;

    /* renamed from: d, reason: collision with root package name */
    public final String f33063d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f33064e;

    /* renamed from: f, reason: collision with root package name */
    public final xk.d1 f33065f;

    /* renamed from: g, reason: collision with root package name */
    public final d2 f33066g;

    /* renamed from: h, reason: collision with root package name */
    public final mg.l f33067h;

    static {
        i3 i3Var = i3.f32631c;
        int i5 = xk.d1.f95891c;
        f33059j = new kd(i3Var, false, xk.z2.f96074j);
    }

    public sd(ob obVar, kd kdVar) {
        this.f33061b = obVar;
        Context context = obVar.f32922b;
        String str = kdVar.f32736d;
        if (str == null) {
            str = (String) kdVar.f32733a.apply(context);
            kdVar.f32736d = str;
        }
        this.f33062c = str;
        this.f33063d = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f33064e = kdVar.f32734b;
        this.f33065f = kdVar.f32735c;
        this.f33060a = null;
        this.f33066g = new d2(13);
        this.f33067h = new mg.l(obVar, str);
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x00ac A[Catch: all -> 0x005f, TryCatch #1 {all -> 0x005f, blocks: (B:5:0x0005, B:7:0x0009, B:9:0x0013, B:13:0x0026, B:15:0x0031, B:17:0x0039, B:19:0x0043, B:29:0x00a8, B:31:0x00ac, B:34:0x00b7, B:22:0x0061, B:24:0x0085, B:25:0x0092, B:27:0x009a, B:36:0x00bb, B:37:0x00be, B:38:0x00bf, B:8:0x000d), top: B:45:0x0005, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00b7 A[Catch: all -> 0x005f, TryCatch #1 {all -> 0x005f, blocks: (B:5:0x0005, B:7:0x0009, B:9:0x0013, B:13:0x0026, B:15:0x0031, B:17:0x0039, B:19:0x0043, B:29:0x00a8, B:31:0x00ac, B:34:0x00b7, B:22:0x0061, B:24:0x0085, B:25:0x0092, B:27:0x009a, B:36:0x00bb, B:37:0x00be, B:38:0x00bf, B:8:0x000d), top: B:45:0x0005, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final le a() {
        le leVar;
        le leVar2 = this.f33060a;
        if (leVar2 != null) {
            return leVar2;
        }
        synchronized (this) {
            try {
                leVar = this.f33060a;
                if (leVar == null) {
                    StrictMode.ThreadPolicy threadPolicyAllowThreadDiskWrites = StrictMode.allowThreadDiskWrites();
                    try {
                        le leVarA = this.f33067h.A();
                        StrictMode.setThreadPolicy(threadPolicyAllowThreadDiskWrites);
                        int i5 = ((ke) leVarA.f32796e).f32739c - 2;
                        if (i5 == 15 || i5 == 16) {
                            leVar = leVarA;
                            if (!this.f33064e || ((ke) leVar.f32796e).f32739c != 17) {
                                this.f33060a = leVar;
                            }
                        } else {
                            ob obVar = this.f33061b;
                            obVar.f32927g.a();
                            if (this.f33064e || this.f33067h.E() || !((String) leVarA.f32793b).isEmpty()) {
                                final int i11 = 3;
                                obVar.a().execute(new Runnable(this) { // from class: com.google.android.gms.internal.measurement.md

                                    /* renamed from: b, reason: collision with root package name */
                                    public final /* synthetic */ sd f32822b;

                                    {
                                        this.f32822b = this;
                                    }

                                    @Override // java.lang.Runnable
                                    public final void run() throws Throwable {
                                        boolean z11;
                                        ob obVar2;
                                        vk.o oVar;
                                        vk.o oVar2;
                                        cl.q0 q0Var;
                                        cl.a aVarB;
                                        int i12 = 2;
                                        int i13 = 1;
                                        int i14 = 0;
                                        switch (i11) {
                                            case 0:
                                                this.f32822b.b();
                                                return;
                                            case 1:
                                                sd sdVar = this.f32822b;
                                                ob obVar3 = sdVar.f33061b;
                                                String str = sdVar.f33062c;
                                                xf xfVar = yd.f33257a;
                                                Object obj = k1.f32722c;
                                                byte b11 = (byte) (((byte) 2) | 1);
                                                Context context = obVar3.f32922b;
                                                Pattern pattern = cf.f32439a;
                                                bn.i iVar = new bn.i(context);
                                                iVar.H("phenotype");
                                                iVar.I("all_accounts.pb");
                                                Uri uriJ = iVar.J();
                                                if (uriJ == null) {
                                                    throw new NullPointerException("Null uri");
                                                }
                                                bd bdVarY = bd.y();
                                                if (bdVarY == null) {
                                                    throw new NullPointerException("Null schema");
                                                }
                                                xf xfVar2 = yd.f33257a;
                                                xfVar2.getClass();
                                                vk.o oVar3 = new vk.o(xfVar2);
                                                byte b12 = (byte) (b11 | 2);
                                                xk.l0 l0Var = xk.v0.f96030b;
                                                xk.r2 r2Var = xk.r2.f96007e;
                                                if (b12 != 3) {
                                                    StringBuilder sb2 = new StringBuilder();
                                                    if ((b12 & 1) == 0) {
                                                        sb2.append(" useGeneratedExtensionRegistry");
                                                    }
                                                    if ((2 & b12) == 0) {
                                                        sb2.append(" enableTracing");
                                                    }
                                                    throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
                                                }
                                                of ofVar = new of(uriJ, bdVarY, oVar3, r2Var);
                                                bn.s0 s0Var = yd.f33259c;
                                                if (s0Var == null) {
                                                    synchronized (yd.f33258b) {
                                                        try {
                                                            s0Var = yd.f33259c;
                                                            if (s0Var == null) {
                                                                HashMap map = new HashMap();
                                                                cl.e1 e1VarA = obVar3.a();
                                                                ye yeVar = (ye) obVar3.f32926f.get();
                                                                z11 = true;
                                                                rf rfVar = rf.f33037a;
                                                                obVar2 = obVar3;
                                                                oVar = oVar3;
                                                                vk.b0.d(!map.containsKey("singleproc"), "There is already a factory registered for the ID %s", "singleproc");
                                                                map.put("singleproc", rfVar);
                                                                bn.s0 s0Var2 = new bn.s0(e1VarA, yeVar, map);
                                                                yd.f33259c = s0Var2;
                                                                s0Var = s0Var2;
                                                            } else {
                                                                z11 = true;
                                                                obVar2 = obVar3;
                                                                oVar = oVar3;
                                                            }
                                                        } finally {
                                                        }
                                                    }
                                                } else {
                                                    z11 = true;
                                                    obVar2 = obVar3;
                                                    oVar = oVar3;
                                                }
                                                ConcurrentHashMap concurrentHashMap = (ConcurrentHashMap) s0Var.f18279b;
                                                Pair pairCreate = (Pair) concurrentHashMap.get(uriJ);
                                                if (pairCreate == null) {
                                                    vk.b0.d(uriJ.isHierarchical(), "Uri must be hierarchical: %s", uriJ);
                                                    String lastPathSegment = uriJ.getLastPathSegment();
                                                    int i15 = vk.l.f92820a;
                                                    if (lastPathSegment == null) {
                                                        lastPathSegment = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                                    }
                                                    int iLastIndexOf = lastPathSegment.lastIndexOf(46);
                                                    vk.b0.d((iLastIndexOf == -1 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : lastPathSegment.substring(iLastIndexOf + 1)).equals("pb"), "Uri extension must be .pb: %s", uriJ);
                                                    rf rfVar2 = (rf) ((HashMap) s0Var.f18283f).get("singleproc");
                                                    vk.b0.d(rfVar2 != null ? z11 : false, "No XDataStoreVariantFactory registered for ID %s", "singleproc");
                                                    String lastPathSegment2 = uriJ.getLastPathSegment();
                                                    if (lastPathSegment2 == null) {
                                                        lastPathSegment2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                                    }
                                                    int iLastIndexOf2 = lastPathSegment2.lastIndexOf(46);
                                                    if (iLastIndexOf2 != -1) {
                                                        lastPathSegment2 = lastPathSegment2.substring(0, iLastIndexOf2);
                                                    }
                                                    cl.u uVarF = cl.w0.f(cl.w0.b(uriJ), (gc) s0Var.f18282e, cl.m0.f20038a);
                                                    Executor executor = (Executor) s0Var.f18280c;
                                                    ye yeVar2 = (ye) s0Var.f18281d;
                                                    rfVar2.getClass();
                                                    oVar2 = oVar;
                                                    qf qfVar = new qf(new vf(lastPathSegment2, cl.w0.b(uriJ), new yf(bdVarY, e1.a()), executor, yeVar2, oVar, new k1(17)), uVarF);
                                                    if (!r2Var.isEmpty()) {
                                                        be beVar = new be(z11 ? 1 : 0, r2Var, executor);
                                                        synchronized (qfVar.f33013g) {
                                                            qfVar.f33015i.add(beVar);
                                                        }
                                                    }
                                                    pairCreate = Pair.create(qfVar, ofVar);
                                                    Pair pair = (Pair) concurrentHashMap.putIfAbsent(uriJ, pairCreate);
                                                    if (pair != null) {
                                                        pairCreate = pair;
                                                    }
                                                } else {
                                                    oVar2 = oVar;
                                                }
                                                qf qfVar2 = (qf) pairCreate.first;
                                                of ofVar2 = (of) pairCreate.second;
                                                if (ofVar.equals(ofVar2)) {
                                                    cl.v vVarA = qfVar2.a(new qd(str, 1), obVar2.a());
                                                    vVarA.b(new od(sdVar, vVarA, 0), obVar2.a());
                                                    return;
                                                }
                                                String strP = vk.b0.p("ProtoDataStoreConfig<%s> doesn't match previous call [uri=%s] [%s]", bd.class.getSimpleName(), uriJ);
                                                vk.b0.d(uriJ.equals(ofVar2.f32934a), strP, "uri");
                                                vk.b0.d(bdVarY.equals(ofVar2.f32935b), strP, "schema");
                                                vk.b0.d(oVar2.equals(ofVar2.f32936c), strP, "handler");
                                                vk.b0.d(r2Var.equals(ofVar2.f32937d), strP, "migrations");
                                                vk.b0.d(obj.equals(obj), strP, "variantConfig");
                                                throw new IllegalArgumentException(vk.b0.p(strP, "unknown"));
                                            case 2:
                                                sd sdVar2 = this.f32822b;
                                                ee eeVar = sdVar2.f33061b.f32929i;
                                                boolean z12 = sdVar2.f33064e;
                                                pd pdVar = pd.f32963a;
                                                he heVar = (he) eeVar.f32504c.get();
                                                if (heVar == null && !z12) {
                                                    cl.z0 z0Var = cl.z0.f20092b;
                                                    return;
                                                }
                                                if ((eeVar.f32506e & 64) == 0) {
                                                    CopyOnWriteArrayList copyOnWriteArrayList = eeVar.f32507f;
                                                    synchronized (copyOnWriteArrayList) {
                                                        try {
                                                            int i16 = eeVar.f32506e;
                                                            if ((i16 & 64) == 0) {
                                                                copyOnWriteArrayList.add(pdVar);
                                                                eeVar.f32506e = i16 | 64;
                                                            }
                                                        } finally {
                                                        }
                                                    }
                                                }
                                                if (eeVar.f32509h == null) {
                                                    synchronized (eeVar.f32508g) {
                                                        try {
                                                            if (eeVar.f32509h == null) {
                                                                if (heVar == null) {
                                                                    heVar = ce.f32438a;
                                                                }
                                                                Context context2 = eeVar.f32502a;
                                                                if (fb.i(context2)) {
                                                                    cl.q0 q0VarA = ((hc) eeVar.f32505d.get()).a(new de(eeVar, heVar));
                                                                    eeVar.f32509h = q0VarA;
                                                                    q0Var = q0VarA;
                                                                } else {
                                                                    ae aeVar = ae.f32378b;
                                                                    vk.u uVar = eeVar.f32503b;
                                                                    cl.q0 q0VarF = cl.w0.f(fb.h(context2, Executors.callable(aeVar, null), (Executor) uVar.get()), new be(i14, eeVar, heVar), (Executor) uVar.get());
                                                                    eeVar.f32509h = q0VarF;
                                                                    q0Var = q0VarF;
                                                                }
                                                                q0Var.b(new zd(q0Var, i12), (Executor) eeVar.f32503b.get());
                                                            }
                                                        } finally {
                                                        }
                                                    }
                                                    return;
                                                }
                                                return;
                                            default:
                                                sd sdVar3 = this.f32822b;
                                                le leVarA2 = sdVar3.a();
                                                String str2 = (String) leVarA2.f32793b;
                                                ob obVar4 = sdVar3.f33061b;
                                                vk.u uVar2 = obVar4.f32924d;
                                                ie ieVarB = obVar4.f32927g.b();
                                                boolean z13 = ieVarB.f32662i;
                                                if (ieVarB.f32663j) {
                                                    if (vk.l.a(str2) && !z13) {
                                                        cl.z0 z0Var2 = cl.z0.f20092b;
                                                        return;
                                                    }
                                                    yb ybVarY = bc.y();
                                                    ke keVar = (ke) leVarA2.f32796e;
                                                    int i17 = keVar.f32738b;
                                                    zb zbVarX = ac.x();
                                                    zbVarX.c();
                                                    ((ac) zbVarX.f32762b).y(i17);
                                                    int i18 = keVar.f32739c;
                                                    zbVarX.c();
                                                    ((ac) zbVarX.f32762b).z(i18);
                                                    ac acVar = (ac) zbVarX.f();
                                                    ybVarY.c();
                                                    ((bc) ybVarY.f32762b).A(acVar);
                                                    if (!vk.l.a(str2)) {
                                                        ybVarY.c();
                                                        ((bc) ybVarY.f32762b).z(str2);
                                                    }
                                                    if (z13) {
                                                        String str3 = sdVar3.f33062c;
                                                        ybVarY.c();
                                                        ((bc) ybVarY.f32762b).B(str3);
                                                    }
                                                    hc hcVar = (hc) uVar2.get();
                                                    bc bcVar = (bc) ybVarY.f();
                                                    ab abVar = hcVar.f32609a;
                                                    cz.b bVarB = rg.m.b();
                                                    bVarB.f48575c = new d2(bcVar, 6);
                                                    bVarB.f48576d = new Feature[]{h.f32582a};
                                                    bVarB.f48573a = false;
                                                    aVarB = hc.b(abVar.c(0, bVarB.a()).k(cl.m0.f20038a, new l6(i13, abVar, bcVar)));
                                                } else {
                                                    if (vk.l.a(str2)) {
                                                        cl.z0 z0Var3 = cl.z0.f20092b;
                                                        return;
                                                    }
                                                    hc hcVar2 = (hc) uVar2.get();
                                                    hcVar2.getClass();
                                                    str2.getClass();
                                                    aVarB = hc.b(hcVar2.f32609a.d(str2));
                                                }
                                                cl.c.s(aVarB, zzmk.class, new nd(sdVar3, i14), obVar4.a());
                                                return;
                                        }
                                    }
                                });
                                obVar.f32921a.C((v0) leVarA.f32794c, this.f33065f, this.f33062c);
                                if (!this.f33063d.equals(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) {
                                    final int i12 = 1;
                                    obVar.a().execute(new Runnable(this) { // from class: com.google.android.gms.internal.measurement.md

                                        /* renamed from: b, reason: collision with root package name */
                                        public final /* synthetic */ sd f32822b;

                                        {
                                            this.f32822b = this;
                                        }

                                        @Override // java.lang.Runnable
                                        public final void run() throws Throwable {
                                            boolean z11;
                                            ob obVar2;
                                            vk.o oVar;
                                            vk.o oVar2;
                                            cl.q0 q0Var;
                                            cl.a aVarB;
                                            int i122 = 2;
                                            int i13 = 1;
                                            int i14 = 0;
                                            switch (i12) {
                                                case 0:
                                                    this.f32822b.b();
                                                    return;
                                                case 1:
                                                    sd sdVar = this.f32822b;
                                                    ob obVar3 = sdVar.f33061b;
                                                    String str = sdVar.f33062c;
                                                    xf xfVar = yd.f33257a;
                                                    Object obj = k1.f32722c;
                                                    byte b11 = (byte) (((byte) 2) | 1);
                                                    Context context = obVar3.f32922b;
                                                    Pattern pattern = cf.f32439a;
                                                    bn.i iVar = new bn.i(context);
                                                    iVar.H("phenotype");
                                                    iVar.I("all_accounts.pb");
                                                    Uri uriJ = iVar.J();
                                                    if (uriJ == null) {
                                                        throw new NullPointerException("Null uri");
                                                    }
                                                    bd bdVarY = bd.y();
                                                    if (bdVarY == null) {
                                                        throw new NullPointerException("Null schema");
                                                    }
                                                    xf xfVar2 = yd.f33257a;
                                                    xfVar2.getClass();
                                                    vk.o oVar3 = new vk.o(xfVar2);
                                                    byte b12 = (byte) (b11 | 2);
                                                    xk.l0 l0Var = xk.v0.f96030b;
                                                    xk.r2 r2Var = xk.r2.f96007e;
                                                    if (b12 != 3) {
                                                        StringBuilder sb2 = new StringBuilder();
                                                        if ((b12 & 1) == 0) {
                                                            sb2.append(" useGeneratedExtensionRegistry");
                                                        }
                                                        if ((2 & b12) == 0) {
                                                            sb2.append(" enableTracing");
                                                        }
                                                        throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
                                                    }
                                                    of ofVar = new of(uriJ, bdVarY, oVar3, r2Var);
                                                    bn.s0 s0Var = yd.f33259c;
                                                    if (s0Var == null) {
                                                        synchronized (yd.f33258b) {
                                                            try {
                                                                s0Var = yd.f33259c;
                                                                if (s0Var == null) {
                                                                    HashMap map = new HashMap();
                                                                    cl.e1 e1VarA = obVar3.a();
                                                                    ye yeVar = (ye) obVar3.f32926f.get();
                                                                    z11 = true;
                                                                    rf rfVar = rf.f33037a;
                                                                    obVar2 = obVar3;
                                                                    oVar = oVar3;
                                                                    vk.b0.d(!map.containsKey("singleproc"), "There is already a factory registered for the ID %s", "singleproc");
                                                                    map.put("singleproc", rfVar);
                                                                    bn.s0 s0Var2 = new bn.s0(e1VarA, yeVar, map);
                                                                    yd.f33259c = s0Var2;
                                                                    s0Var = s0Var2;
                                                                } else {
                                                                    z11 = true;
                                                                    obVar2 = obVar3;
                                                                    oVar = oVar3;
                                                                }
                                                            } finally {
                                                            }
                                                        }
                                                    } else {
                                                        z11 = true;
                                                        obVar2 = obVar3;
                                                        oVar = oVar3;
                                                    }
                                                    ConcurrentHashMap concurrentHashMap = (ConcurrentHashMap) s0Var.f18279b;
                                                    Pair pairCreate = (Pair) concurrentHashMap.get(uriJ);
                                                    if (pairCreate == null) {
                                                        vk.b0.d(uriJ.isHierarchical(), "Uri must be hierarchical: %s", uriJ);
                                                        String lastPathSegment = uriJ.getLastPathSegment();
                                                        int i15 = vk.l.f92820a;
                                                        if (lastPathSegment == null) {
                                                            lastPathSegment = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                                        }
                                                        int iLastIndexOf = lastPathSegment.lastIndexOf(46);
                                                        vk.b0.d((iLastIndexOf == -1 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : lastPathSegment.substring(iLastIndexOf + 1)).equals("pb"), "Uri extension must be .pb: %s", uriJ);
                                                        rf rfVar2 = (rf) ((HashMap) s0Var.f18283f).get("singleproc");
                                                        vk.b0.d(rfVar2 != null ? z11 : false, "No XDataStoreVariantFactory registered for ID %s", "singleproc");
                                                        String lastPathSegment2 = uriJ.getLastPathSegment();
                                                        if (lastPathSegment2 == null) {
                                                            lastPathSegment2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                                        }
                                                        int iLastIndexOf2 = lastPathSegment2.lastIndexOf(46);
                                                        if (iLastIndexOf2 != -1) {
                                                            lastPathSegment2 = lastPathSegment2.substring(0, iLastIndexOf2);
                                                        }
                                                        cl.u uVarF = cl.w0.f(cl.w0.b(uriJ), (gc) s0Var.f18282e, cl.m0.f20038a);
                                                        Executor executor = (Executor) s0Var.f18280c;
                                                        ye yeVar2 = (ye) s0Var.f18281d;
                                                        rfVar2.getClass();
                                                        oVar2 = oVar;
                                                        qf qfVar = new qf(new vf(lastPathSegment2, cl.w0.b(uriJ), new yf(bdVarY, e1.a()), executor, yeVar2, oVar, new k1(17)), uVarF);
                                                        if (!r2Var.isEmpty()) {
                                                            be beVar = new be(z11 ? 1 : 0, r2Var, executor);
                                                            synchronized (qfVar.f33013g) {
                                                                qfVar.f33015i.add(beVar);
                                                            }
                                                        }
                                                        pairCreate = Pair.create(qfVar, ofVar);
                                                        Pair pair = (Pair) concurrentHashMap.putIfAbsent(uriJ, pairCreate);
                                                        if (pair != null) {
                                                            pairCreate = pair;
                                                        }
                                                    } else {
                                                        oVar2 = oVar;
                                                    }
                                                    qf qfVar2 = (qf) pairCreate.first;
                                                    of ofVar2 = (of) pairCreate.second;
                                                    if (ofVar.equals(ofVar2)) {
                                                        cl.v vVarA = qfVar2.a(new qd(str, 1), obVar2.a());
                                                        vVarA.b(new od(sdVar, vVarA, 0), obVar2.a());
                                                        return;
                                                    }
                                                    String strP = vk.b0.p("ProtoDataStoreConfig<%s> doesn't match previous call [uri=%s] [%s]", bd.class.getSimpleName(), uriJ);
                                                    vk.b0.d(uriJ.equals(ofVar2.f32934a), strP, "uri");
                                                    vk.b0.d(bdVarY.equals(ofVar2.f32935b), strP, "schema");
                                                    vk.b0.d(oVar2.equals(ofVar2.f32936c), strP, "handler");
                                                    vk.b0.d(r2Var.equals(ofVar2.f32937d), strP, "migrations");
                                                    vk.b0.d(obj.equals(obj), strP, "variantConfig");
                                                    throw new IllegalArgumentException(vk.b0.p(strP, "unknown"));
                                                case 2:
                                                    sd sdVar2 = this.f32822b;
                                                    ee eeVar = sdVar2.f33061b.f32929i;
                                                    boolean z12 = sdVar2.f33064e;
                                                    pd pdVar = pd.f32963a;
                                                    he heVar = (he) eeVar.f32504c.get();
                                                    if (heVar == null && !z12) {
                                                        cl.z0 z0Var = cl.z0.f20092b;
                                                        return;
                                                    }
                                                    if ((eeVar.f32506e & 64) == 0) {
                                                        CopyOnWriteArrayList copyOnWriteArrayList = eeVar.f32507f;
                                                        synchronized (copyOnWriteArrayList) {
                                                            try {
                                                                int i16 = eeVar.f32506e;
                                                                if ((i16 & 64) == 0) {
                                                                    copyOnWriteArrayList.add(pdVar);
                                                                    eeVar.f32506e = i16 | 64;
                                                                }
                                                            } finally {
                                                            }
                                                        }
                                                    }
                                                    if (eeVar.f32509h == null) {
                                                        synchronized (eeVar.f32508g) {
                                                            try {
                                                                if (eeVar.f32509h == null) {
                                                                    if (heVar == null) {
                                                                        heVar = ce.f32438a;
                                                                    }
                                                                    Context context2 = eeVar.f32502a;
                                                                    if (fb.i(context2)) {
                                                                        cl.q0 q0VarA = ((hc) eeVar.f32505d.get()).a(new de(eeVar, heVar));
                                                                        eeVar.f32509h = q0VarA;
                                                                        q0Var = q0VarA;
                                                                    } else {
                                                                        ae aeVar = ae.f32378b;
                                                                        vk.u uVar = eeVar.f32503b;
                                                                        cl.q0 q0VarF = cl.w0.f(fb.h(context2, Executors.callable(aeVar, null), (Executor) uVar.get()), new be(i14, eeVar, heVar), (Executor) uVar.get());
                                                                        eeVar.f32509h = q0VarF;
                                                                        q0Var = q0VarF;
                                                                    }
                                                                    q0Var.b(new zd(q0Var, i122), (Executor) eeVar.f32503b.get());
                                                                }
                                                            } finally {
                                                            }
                                                        }
                                                        return;
                                                    }
                                                    return;
                                                default:
                                                    sd sdVar3 = this.f32822b;
                                                    le leVarA2 = sdVar3.a();
                                                    String str2 = (String) leVarA2.f32793b;
                                                    ob obVar4 = sdVar3.f33061b;
                                                    vk.u uVar2 = obVar4.f32924d;
                                                    ie ieVarB = obVar4.f32927g.b();
                                                    boolean z13 = ieVarB.f32662i;
                                                    if (ieVarB.f32663j) {
                                                        if (vk.l.a(str2) && !z13) {
                                                            cl.z0 z0Var2 = cl.z0.f20092b;
                                                            return;
                                                        }
                                                        yb ybVarY = bc.y();
                                                        ke keVar = (ke) leVarA2.f32796e;
                                                        int i17 = keVar.f32738b;
                                                        zb zbVarX = ac.x();
                                                        zbVarX.c();
                                                        ((ac) zbVarX.f32762b).y(i17);
                                                        int i18 = keVar.f32739c;
                                                        zbVarX.c();
                                                        ((ac) zbVarX.f32762b).z(i18);
                                                        ac acVar = (ac) zbVarX.f();
                                                        ybVarY.c();
                                                        ((bc) ybVarY.f32762b).A(acVar);
                                                        if (!vk.l.a(str2)) {
                                                            ybVarY.c();
                                                            ((bc) ybVarY.f32762b).z(str2);
                                                        }
                                                        if (z13) {
                                                            String str3 = sdVar3.f33062c;
                                                            ybVarY.c();
                                                            ((bc) ybVarY.f32762b).B(str3);
                                                        }
                                                        hc hcVar = (hc) uVar2.get();
                                                        bc bcVar = (bc) ybVarY.f();
                                                        ab abVar = hcVar.f32609a;
                                                        cz.b bVarB = rg.m.b();
                                                        bVarB.f48575c = new d2(bcVar, 6);
                                                        bVarB.f48576d = new Feature[]{h.f32582a};
                                                        bVarB.f48573a = false;
                                                        aVarB = hc.b(abVar.c(0, bVarB.a()).k(cl.m0.f20038a, new l6(i13, abVar, bcVar)));
                                                    } else {
                                                        if (vk.l.a(str2)) {
                                                            cl.z0 z0Var3 = cl.z0.f20092b;
                                                            return;
                                                        }
                                                        hc hcVar2 = (hc) uVar2.get();
                                                        hcVar2.getClass();
                                                        str2.getClass();
                                                        aVarB = hc.b(hcVar2.f32609a.d(str2));
                                                    }
                                                    cl.c.s(aVarB, zzmk.class, new nd(sdVar3, i14), obVar4.a());
                                                    return;
                                            }
                                        }
                                    });
                                }
                                if (this.f33067h.E()) {
                                    final int i13 = 2;
                                    obVar.a().execute(new Runnable(this) { // from class: com.google.android.gms.internal.measurement.md

                                        /* renamed from: b, reason: collision with root package name */
                                        public final /* synthetic */ sd f32822b;

                                        {
                                            this.f32822b = this;
                                        }

                                        @Override // java.lang.Runnable
                                        public final void run() throws Throwable {
                                            boolean z11;
                                            ob obVar2;
                                            vk.o oVar;
                                            vk.o oVar2;
                                            cl.q0 q0Var;
                                            cl.a aVarB;
                                            int i122 = 2;
                                            int i132 = 1;
                                            int i14 = 0;
                                            switch (i13) {
                                                case 0:
                                                    this.f32822b.b();
                                                    return;
                                                case 1:
                                                    sd sdVar = this.f32822b;
                                                    ob obVar3 = sdVar.f33061b;
                                                    String str = sdVar.f33062c;
                                                    xf xfVar = yd.f33257a;
                                                    Object obj = k1.f32722c;
                                                    byte b11 = (byte) (((byte) 2) | 1);
                                                    Context context = obVar3.f32922b;
                                                    Pattern pattern = cf.f32439a;
                                                    bn.i iVar = new bn.i(context);
                                                    iVar.H("phenotype");
                                                    iVar.I("all_accounts.pb");
                                                    Uri uriJ = iVar.J();
                                                    if (uriJ == null) {
                                                        throw new NullPointerException("Null uri");
                                                    }
                                                    bd bdVarY = bd.y();
                                                    if (bdVarY == null) {
                                                        throw new NullPointerException("Null schema");
                                                    }
                                                    xf xfVar2 = yd.f33257a;
                                                    xfVar2.getClass();
                                                    vk.o oVar3 = new vk.o(xfVar2);
                                                    byte b12 = (byte) (b11 | 2);
                                                    xk.l0 l0Var = xk.v0.f96030b;
                                                    xk.r2 r2Var = xk.r2.f96007e;
                                                    if (b12 != 3) {
                                                        StringBuilder sb2 = new StringBuilder();
                                                        if ((b12 & 1) == 0) {
                                                            sb2.append(" useGeneratedExtensionRegistry");
                                                        }
                                                        if ((2 & b12) == 0) {
                                                            sb2.append(" enableTracing");
                                                        }
                                                        throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
                                                    }
                                                    of ofVar = new of(uriJ, bdVarY, oVar3, r2Var);
                                                    bn.s0 s0Var = yd.f33259c;
                                                    if (s0Var == null) {
                                                        synchronized (yd.f33258b) {
                                                            try {
                                                                s0Var = yd.f33259c;
                                                                if (s0Var == null) {
                                                                    HashMap map = new HashMap();
                                                                    cl.e1 e1VarA = obVar3.a();
                                                                    ye yeVar = (ye) obVar3.f32926f.get();
                                                                    z11 = true;
                                                                    rf rfVar = rf.f33037a;
                                                                    obVar2 = obVar3;
                                                                    oVar = oVar3;
                                                                    vk.b0.d(!map.containsKey("singleproc"), "There is already a factory registered for the ID %s", "singleproc");
                                                                    map.put("singleproc", rfVar);
                                                                    bn.s0 s0Var2 = new bn.s0(e1VarA, yeVar, map);
                                                                    yd.f33259c = s0Var2;
                                                                    s0Var = s0Var2;
                                                                } else {
                                                                    z11 = true;
                                                                    obVar2 = obVar3;
                                                                    oVar = oVar3;
                                                                }
                                                            } finally {
                                                            }
                                                        }
                                                    } else {
                                                        z11 = true;
                                                        obVar2 = obVar3;
                                                        oVar = oVar3;
                                                    }
                                                    ConcurrentHashMap concurrentHashMap = (ConcurrentHashMap) s0Var.f18279b;
                                                    Pair pairCreate = (Pair) concurrentHashMap.get(uriJ);
                                                    if (pairCreate == null) {
                                                        vk.b0.d(uriJ.isHierarchical(), "Uri must be hierarchical: %s", uriJ);
                                                        String lastPathSegment = uriJ.getLastPathSegment();
                                                        int i15 = vk.l.f92820a;
                                                        if (lastPathSegment == null) {
                                                            lastPathSegment = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                                        }
                                                        int iLastIndexOf = lastPathSegment.lastIndexOf(46);
                                                        vk.b0.d((iLastIndexOf == -1 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : lastPathSegment.substring(iLastIndexOf + 1)).equals("pb"), "Uri extension must be .pb: %s", uriJ);
                                                        rf rfVar2 = (rf) ((HashMap) s0Var.f18283f).get("singleproc");
                                                        vk.b0.d(rfVar2 != null ? z11 : false, "No XDataStoreVariantFactory registered for ID %s", "singleproc");
                                                        String lastPathSegment2 = uriJ.getLastPathSegment();
                                                        if (lastPathSegment2 == null) {
                                                            lastPathSegment2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                                        }
                                                        int iLastIndexOf2 = lastPathSegment2.lastIndexOf(46);
                                                        if (iLastIndexOf2 != -1) {
                                                            lastPathSegment2 = lastPathSegment2.substring(0, iLastIndexOf2);
                                                        }
                                                        cl.u uVarF = cl.w0.f(cl.w0.b(uriJ), (gc) s0Var.f18282e, cl.m0.f20038a);
                                                        Executor executor = (Executor) s0Var.f18280c;
                                                        ye yeVar2 = (ye) s0Var.f18281d;
                                                        rfVar2.getClass();
                                                        oVar2 = oVar;
                                                        qf qfVar = new qf(new vf(lastPathSegment2, cl.w0.b(uriJ), new yf(bdVarY, e1.a()), executor, yeVar2, oVar, new k1(17)), uVarF);
                                                        if (!r2Var.isEmpty()) {
                                                            be beVar = new be(z11 ? 1 : 0, r2Var, executor);
                                                            synchronized (qfVar.f33013g) {
                                                                qfVar.f33015i.add(beVar);
                                                            }
                                                        }
                                                        pairCreate = Pair.create(qfVar, ofVar);
                                                        Pair pair = (Pair) concurrentHashMap.putIfAbsent(uriJ, pairCreate);
                                                        if (pair != null) {
                                                            pairCreate = pair;
                                                        }
                                                    } else {
                                                        oVar2 = oVar;
                                                    }
                                                    qf qfVar2 = (qf) pairCreate.first;
                                                    of ofVar2 = (of) pairCreate.second;
                                                    if (ofVar.equals(ofVar2)) {
                                                        cl.v vVarA = qfVar2.a(new qd(str, 1), obVar2.a());
                                                        vVarA.b(new od(sdVar, vVarA, 0), obVar2.a());
                                                        return;
                                                    }
                                                    String strP = vk.b0.p("ProtoDataStoreConfig<%s> doesn't match previous call [uri=%s] [%s]", bd.class.getSimpleName(), uriJ);
                                                    vk.b0.d(uriJ.equals(ofVar2.f32934a), strP, "uri");
                                                    vk.b0.d(bdVarY.equals(ofVar2.f32935b), strP, "schema");
                                                    vk.b0.d(oVar2.equals(ofVar2.f32936c), strP, "handler");
                                                    vk.b0.d(r2Var.equals(ofVar2.f32937d), strP, "migrations");
                                                    vk.b0.d(obj.equals(obj), strP, "variantConfig");
                                                    throw new IllegalArgumentException(vk.b0.p(strP, "unknown"));
                                                case 2:
                                                    sd sdVar2 = this.f32822b;
                                                    ee eeVar = sdVar2.f33061b.f32929i;
                                                    boolean z12 = sdVar2.f33064e;
                                                    pd pdVar = pd.f32963a;
                                                    he heVar = (he) eeVar.f32504c.get();
                                                    if (heVar == null && !z12) {
                                                        cl.z0 z0Var = cl.z0.f20092b;
                                                        return;
                                                    }
                                                    if ((eeVar.f32506e & 64) == 0) {
                                                        CopyOnWriteArrayList copyOnWriteArrayList = eeVar.f32507f;
                                                        synchronized (copyOnWriteArrayList) {
                                                            try {
                                                                int i16 = eeVar.f32506e;
                                                                if ((i16 & 64) == 0) {
                                                                    copyOnWriteArrayList.add(pdVar);
                                                                    eeVar.f32506e = i16 | 64;
                                                                }
                                                            } finally {
                                                            }
                                                        }
                                                    }
                                                    if (eeVar.f32509h == null) {
                                                        synchronized (eeVar.f32508g) {
                                                            try {
                                                                if (eeVar.f32509h == null) {
                                                                    if (heVar == null) {
                                                                        heVar = ce.f32438a;
                                                                    }
                                                                    Context context2 = eeVar.f32502a;
                                                                    if (fb.i(context2)) {
                                                                        cl.q0 q0VarA = ((hc) eeVar.f32505d.get()).a(new de(eeVar, heVar));
                                                                        eeVar.f32509h = q0VarA;
                                                                        q0Var = q0VarA;
                                                                    } else {
                                                                        ae aeVar = ae.f32378b;
                                                                        vk.u uVar = eeVar.f32503b;
                                                                        cl.q0 q0VarF = cl.w0.f(fb.h(context2, Executors.callable(aeVar, null), (Executor) uVar.get()), new be(i14, eeVar, heVar), (Executor) uVar.get());
                                                                        eeVar.f32509h = q0VarF;
                                                                        q0Var = q0VarF;
                                                                    }
                                                                    q0Var.b(new zd(q0Var, i122), (Executor) eeVar.f32503b.get());
                                                                }
                                                            } finally {
                                                            }
                                                        }
                                                        return;
                                                    }
                                                    return;
                                                default:
                                                    sd sdVar3 = this.f32822b;
                                                    le leVarA2 = sdVar3.a();
                                                    String str2 = (String) leVarA2.f32793b;
                                                    ob obVar4 = sdVar3.f33061b;
                                                    vk.u uVar2 = obVar4.f32924d;
                                                    ie ieVarB = obVar4.f32927g.b();
                                                    boolean z13 = ieVarB.f32662i;
                                                    if (ieVarB.f32663j) {
                                                        if (vk.l.a(str2) && !z13) {
                                                            cl.z0 z0Var2 = cl.z0.f20092b;
                                                            return;
                                                        }
                                                        yb ybVarY = bc.y();
                                                        ke keVar = (ke) leVarA2.f32796e;
                                                        int i17 = keVar.f32738b;
                                                        zb zbVarX = ac.x();
                                                        zbVarX.c();
                                                        ((ac) zbVarX.f32762b).y(i17);
                                                        int i18 = keVar.f32739c;
                                                        zbVarX.c();
                                                        ((ac) zbVarX.f32762b).z(i18);
                                                        ac acVar = (ac) zbVarX.f();
                                                        ybVarY.c();
                                                        ((bc) ybVarY.f32762b).A(acVar);
                                                        if (!vk.l.a(str2)) {
                                                            ybVarY.c();
                                                            ((bc) ybVarY.f32762b).z(str2);
                                                        }
                                                        if (z13) {
                                                            String str3 = sdVar3.f33062c;
                                                            ybVarY.c();
                                                            ((bc) ybVarY.f32762b).B(str3);
                                                        }
                                                        hc hcVar = (hc) uVar2.get();
                                                        bc bcVar = (bc) ybVarY.f();
                                                        ab abVar = hcVar.f32609a;
                                                        cz.b bVarB = rg.m.b();
                                                        bVarB.f48575c = new d2(bcVar, 6);
                                                        bVarB.f48576d = new Feature[]{h.f32582a};
                                                        bVarB.f48573a = false;
                                                        aVarB = hc.b(abVar.c(0, bVarB.a()).k(cl.m0.f20038a, new l6(i132, abVar, bcVar)));
                                                    } else {
                                                        if (vk.l.a(str2)) {
                                                            cl.z0 z0Var3 = cl.z0.f20092b;
                                                            return;
                                                        }
                                                        hc hcVar2 = (hc) uVar2.get();
                                                        hcVar2.getClass();
                                                        str2.getClass();
                                                        aVarB = hc.b(hcVar2.f32609a.d(str2));
                                                    }
                                                    cl.c.s(aVarB, zzmk.class, new nd(sdVar3, i14), obVar4.a());
                                                    return;
                                            }
                                        }
                                    });
                                }
                                leVar = leVarA;
                                if (!this.f33064e) {
                                    this.f33060a = leVar;
                                }
                            } else {
                                final int i14 = 0;
                                obVar.a().execute(new Runnable(this) { // from class: com.google.android.gms.internal.measurement.md

                                    /* renamed from: b, reason: collision with root package name */
                                    public final /* synthetic */ sd f32822b;

                                    {
                                        this.f32822b = this;
                                    }

                                    @Override // java.lang.Runnable
                                    public final void run() throws Throwable {
                                        boolean z11;
                                        ob obVar2;
                                        vk.o oVar;
                                        vk.o oVar2;
                                        cl.q0 q0Var;
                                        cl.a aVarB;
                                        int i122 = 2;
                                        int i132 = 1;
                                        int i142 = 0;
                                        switch (i14) {
                                            case 0:
                                                this.f32822b.b();
                                                return;
                                            case 1:
                                                sd sdVar = this.f32822b;
                                                ob obVar3 = sdVar.f33061b;
                                                String str = sdVar.f33062c;
                                                xf xfVar = yd.f33257a;
                                                Object obj = k1.f32722c;
                                                byte b11 = (byte) (((byte) 2) | 1);
                                                Context context = obVar3.f32922b;
                                                Pattern pattern = cf.f32439a;
                                                bn.i iVar = new bn.i(context);
                                                iVar.H("phenotype");
                                                iVar.I("all_accounts.pb");
                                                Uri uriJ = iVar.J();
                                                if (uriJ == null) {
                                                    throw new NullPointerException("Null uri");
                                                }
                                                bd bdVarY = bd.y();
                                                if (bdVarY == null) {
                                                    throw new NullPointerException("Null schema");
                                                }
                                                xf xfVar2 = yd.f33257a;
                                                xfVar2.getClass();
                                                vk.o oVar3 = new vk.o(xfVar2);
                                                byte b12 = (byte) (b11 | 2);
                                                xk.l0 l0Var = xk.v0.f96030b;
                                                xk.r2 r2Var = xk.r2.f96007e;
                                                if (b12 != 3) {
                                                    StringBuilder sb2 = new StringBuilder();
                                                    if ((b12 & 1) == 0) {
                                                        sb2.append(" useGeneratedExtensionRegistry");
                                                    }
                                                    if ((2 & b12) == 0) {
                                                        sb2.append(" enableTracing");
                                                    }
                                                    throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
                                                }
                                                of ofVar = new of(uriJ, bdVarY, oVar3, r2Var);
                                                bn.s0 s0Var = yd.f33259c;
                                                if (s0Var == null) {
                                                    synchronized (yd.f33258b) {
                                                        try {
                                                            s0Var = yd.f33259c;
                                                            if (s0Var == null) {
                                                                HashMap map = new HashMap();
                                                                cl.e1 e1VarA = obVar3.a();
                                                                ye yeVar = (ye) obVar3.f32926f.get();
                                                                z11 = true;
                                                                rf rfVar = rf.f33037a;
                                                                obVar2 = obVar3;
                                                                oVar = oVar3;
                                                                vk.b0.d(!map.containsKey("singleproc"), "There is already a factory registered for the ID %s", "singleproc");
                                                                map.put("singleproc", rfVar);
                                                                bn.s0 s0Var2 = new bn.s0(e1VarA, yeVar, map);
                                                                yd.f33259c = s0Var2;
                                                                s0Var = s0Var2;
                                                            } else {
                                                                z11 = true;
                                                                obVar2 = obVar3;
                                                                oVar = oVar3;
                                                            }
                                                        } finally {
                                                        }
                                                    }
                                                } else {
                                                    z11 = true;
                                                    obVar2 = obVar3;
                                                    oVar = oVar3;
                                                }
                                                ConcurrentHashMap concurrentHashMap = (ConcurrentHashMap) s0Var.f18279b;
                                                Pair pairCreate = (Pair) concurrentHashMap.get(uriJ);
                                                if (pairCreate == null) {
                                                    vk.b0.d(uriJ.isHierarchical(), "Uri must be hierarchical: %s", uriJ);
                                                    String lastPathSegment = uriJ.getLastPathSegment();
                                                    int i15 = vk.l.f92820a;
                                                    if (lastPathSegment == null) {
                                                        lastPathSegment = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                                    }
                                                    int iLastIndexOf = lastPathSegment.lastIndexOf(46);
                                                    vk.b0.d((iLastIndexOf == -1 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : lastPathSegment.substring(iLastIndexOf + 1)).equals("pb"), "Uri extension must be .pb: %s", uriJ);
                                                    rf rfVar2 = (rf) ((HashMap) s0Var.f18283f).get("singleproc");
                                                    vk.b0.d(rfVar2 != null ? z11 : false, "No XDataStoreVariantFactory registered for ID %s", "singleproc");
                                                    String lastPathSegment2 = uriJ.getLastPathSegment();
                                                    if (lastPathSegment2 == null) {
                                                        lastPathSegment2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                                    }
                                                    int iLastIndexOf2 = lastPathSegment2.lastIndexOf(46);
                                                    if (iLastIndexOf2 != -1) {
                                                        lastPathSegment2 = lastPathSegment2.substring(0, iLastIndexOf2);
                                                    }
                                                    cl.u uVarF = cl.w0.f(cl.w0.b(uriJ), (gc) s0Var.f18282e, cl.m0.f20038a);
                                                    Executor executor = (Executor) s0Var.f18280c;
                                                    ye yeVar2 = (ye) s0Var.f18281d;
                                                    rfVar2.getClass();
                                                    oVar2 = oVar;
                                                    qf qfVar = new qf(new vf(lastPathSegment2, cl.w0.b(uriJ), new yf(bdVarY, e1.a()), executor, yeVar2, oVar, new k1(17)), uVarF);
                                                    if (!r2Var.isEmpty()) {
                                                        be beVar = new be(z11 ? 1 : 0, r2Var, executor);
                                                        synchronized (qfVar.f33013g) {
                                                            qfVar.f33015i.add(beVar);
                                                        }
                                                    }
                                                    pairCreate = Pair.create(qfVar, ofVar);
                                                    Pair pair = (Pair) concurrentHashMap.putIfAbsent(uriJ, pairCreate);
                                                    if (pair != null) {
                                                        pairCreate = pair;
                                                    }
                                                } else {
                                                    oVar2 = oVar;
                                                }
                                                qf qfVar2 = (qf) pairCreate.first;
                                                of ofVar2 = (of) pairCreate.second;
                                                if (ofVar.equals(ofVar2)) {
                                                    cl.v vVarA = qfVar2.a(new qd(str, 1), obVar2.a());
                                                    vVarA.b(new od(sdVar, vVarA, 0), obVar2.a());
                                                    return;
                                                }
                                                String strP = vk.b0.p("ProtoDataStoreConfig<%s> doesn't match previous call [uri=%s] [%s]", bd.class.getSimpleName(), uriJ);
                                                vk.b0.d(uriJ.equals(ofVar2.f32934a), strP, "uri");
                                                vk.b0.d(bdVarY.equals(ofVar2.f32935b), strP, "schema");
                                                vk.b0.d(oVar2.equals(ofVar2.f32936c), strP, "handler");
                                                vk.b0.d(r2Var.equals(ofVar2.f32937d), strP, "migrations");
                                                vk.b0.d(obj.equals(obj), strP, "variantConfig");
                                                throw new IllegalArgumentException(vk.b0.p(strP, "unknown"));
                                            case 2:
                                                sd sdVar2 = this.f32822b;
                                                ee eeVar = sdVar2.f33061b.f32929i;
                                                boolean z12 = sdVar2.f33064e;
                                                pd pdVar = pd.f32963a;
                                                he heVar = (he) eeVar.f32504c.get();
                                                if (heVar == null && !z12) {
                                                    cl.z0 z0Var = cl.z0.f20092b;
                                                    return;
                                                }
                                                if ((eeVar.f32506e & 64) == 0) {
                                                    CopyOnWriteArrayList copyOnWriteArrayList = eeVar.f32507f;
                                                    synchronized (copyOnWriteArrayList) {
                                                        try {
                                                            int i16 = eeVar.f32506e;
                                                            if ((i16 & 64) == 0) {
                                                                copyOnWriteArrayList.add(pdVar);
                                                                eeVar.f32506e = i16 | 64;
                                                            }
                                                        } finally {
                                                        }
                                                    }
                                                }
                                                if (eeVar.f32509h == null) {
                                                    synchronized (eeVar.f32508g) {
                                                        try {
                                                            if (eeVar.f32509h == null) {
                                                                if (heVar == null) {
                                                                    heVar = ce.f32438a;
                                                                }
                                                                Context context2 = eeVar.f32502a;
                                                                if (fb.i(context2)) {
                                                                    cl.q0 q0VarA = ((hc) eeVar.f32505d.get()).a(new de(eeVar, heVar));
                                                                    eeVar.f32509h = q0VarA;
                                                                    q0Var = q0VarA;
                                                                } else {
                                                                    ae aeVar = ae.f32378b;
                                                                    vk.u uVar = eeVar.f32503b;
                                                                    cl.q0 q0VarF = cl.w0.f(fb.h(context2, Executors.callable(aeVar, null), (Executor) uVar.get()), new be(i142, eeVar, heVar), (Executor) uVar.get());
                                                                    eeVar.f32509h = q0VarF;
                                                                    q0Var = q0VarF;
                                                                }
                                                                q0Var.b(new zd(q0Var, i122), (Executor) eeVar.f32503b.get());
                                                            }
                                                        } finally {
                                                        }
                                                    }
                                                    return;
                                                }
                                                return;
                                            default:
                                                sd sdVar3 = this.f32822b;
                                                le leVarA2 = sdVar3.a();
                                                String str2 = (String) leVarA2.f32793b;
                                                ob obVar4 = sdVar3.f33061b;
                                                vk.u uVar2 = obVar4.f32924d;
                                                ie ieVarB = obVar4.f32927g.b();
                                                boolean z13 = ieVarB.f32662i;
                                                if (ieVarB.f32663j) {
                                                    if (vk.l.a(str2) && !z13) {
                                                        cl.z0 z0Var2 = cl.z0.f20092b;
                                                        return;
                                                    }
                                                    yb ybVarY = bc.y();
                                                    ke keVar = (ke) leVarA2.f32796e;
                                                    int i17 = keVar.f32738b;
                                                    zb zbVarX = ac.x();
                                                    zbVarX.c();
                                                    ((ac) zbVarX.f32762b).y(i17);
                                                    int i18 = keVar.f32739c;
                                                    zbVarX.c();
                                                    ((ac) zbVarX.f32762b).z(i18);
                                                    ac acVar = (ac) zbVarX.f();
                                                    ybVarY.c();
                                                    ((bc) ybVarY.f32762b).A(acVar);
                                                    if (!vk.l.a(str2)) {
                                                        ybVarY.c();
                                                        ((bc) ybVarY.f32762b).z(str2);
                                                    }
                                                    if (z13) {
                                                        String str3 = sdVar3.f33062c;
                                                        ybVarY.c();
                                                        ((bc) ybVarY.f32762b).B(str3);
                                                    }
                                                    hc hcVar = (hc) uVar2.get();
                                                    bc bcVar = (bc) ybVarY.f();
                                                    ab abVar = hcVar.f32609a;
                                                    cz.b bVarB = rg.m.b();
                                                    bVarB.f48575c = new d2(bcVar, 6);
                                                    bVarB.f48576d = new Feature[]{h.f32582a};
                                                    bVarB.f48573a = false;
                                                    aVarB = hc.b(abVar.c(0, bVarB.a()).k(cl.m0.f20038a, new l6(i132, abVar, bcVar)));
                                                } else {
                                                    if (vk.l.a(str2)) {
                                                        cl.z0 z0Var3 = cl.z0.f20092b;
                                                        return;
                                                    }
                                                    hc hcVar2 = (hc) uVar2.get();
                                                    hcVar2.getClass();
                                                    str2.getClass();
                                                    aVarB = hc.b(hcVar2.f32609a.d(str2));
                                                }
                                                cl.c.s(aVarB, zzmk.class, new nd(sdVar3, i142), obVar4.a());
                                                return;
                                        }
                                    }
                                });
                                leVar = new le(ne.E(), (ke) leVarA.f32796e);
                                if (!this.f33064e) {
                                }
                            }
                        }
                    } catch (Throwable th2) {
                        StrictMode.setThreadPolicy(threadPolicyAllowThreadDiskWrites);
                        throw th2;
                    }
                }
            } finally {
            }
        }
        return leVar;
    }

    public final void b() {
        mg.l lVar = this.f33067h;
        ob obVar = (ob) lVar.f76309b;
        hc hcVar = (hc) obVar.f32924d.get();
        String str = (String) lVar.f76311d;
        hcVar.getClass();
        str.getClass();
        ab abVar = hcVar.f32609a;
        cz.b bVarB = rg.m.b();
        bVarB.f48575c = new wd(str, 1);
        cl.v vVarE = cl.w0.e(hc.b(abVar.c(0, bVarB.a()).i(cl.m0.f20038a, new k1(12))), i3.f32632d, obVar.a());
        nd ndVar = new nd(lVar, 1);
        ob obVar2 = this.f33061b;
        cl.w0.f(vVarE, ndVar, obVar2.a()).b(new od(this, vVarE, 1), obVar2.a());
    }
}
