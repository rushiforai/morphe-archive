package ai;

import ads_mobile_sdk.qm1;
import ads_mobile_sdk.qq;
import ads_mobile_sdk.sq;
import ads_mobile_sdk.v6;
import ads_mobile_sdk.wi0;
import ads_mobile_sdk.wo3;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.media.AudioAttributes;
import android.media.AudioFormat;
import android.media.Spatializer;
import android.opengl.Matrix;
import android.os.Bundle;
import android.util.Base64;
import android.view.MotionEvent;
import b.g5;
import com.google.android.gms.common.Feature;
import com.google.android.gms.internal.measurement.le;
import com.google.android.gms.internal.measurement.td;
import com.google.firebase.messaging.FirebaseMessaging;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class y0 implements ba0.y {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f13473a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f13474b;

    /* renamed from: c, reason: collision with root package name */
    public Object f13475c;

    /* renamed from: d, reason: collision with root package name */
    public Object f13476d;

    /* renamed from: e, reason: collision with root package name */
    public Object f13477e;

    public y0(le leVar, td tdVar, Feature[] featureArr, boolean z11) {
        this.f13473a = 6;
        this.f13477e = leVar;
        this.f13475c = tdVar;
        this.f13476d = featureArr;
        this.f13474b = z11;
    }

    public static void i(float[] fArr, float[] fArr2) {
        Matrix.setIdentityM(fArr, 0);
        float f11 = fArr2[10];
        float f12 = fArr2[8];
        float fSqrt = (float) Math.sqrt((f12 * f12) + (f11 * f11));
        float f13 = fArr2[10] / fSqrt;
        fArr[0] = f13;
        float f14 = fArr2[8];
        fArr[2] = f14 / fSqrt;
        fArr[8] = (-f14) / fSqrt;
        fArr[10] = f13;
    }

    public static final byte s(int[] iArr, int i5) {
        int i11;
        int i12 = iArr[i5 / 4];
        int i13 = i5 % 4;
        if (i13 == 0) {
            i11 = i12 & 255;
        } else if (i13 == 1) {
            i11 = (i12 & 65280) >>> 8;
        } else if (i13 == 2) {
            i11 = (i12 & 16711680) >>> 16;
        } else {
            if (i13 != 3) {
                throw new IllegalStateException("offset % 4 out of range [0, 4] ?");
            }
            i11 = (i12 & (-16777216)) >>> 24;
        }
        return (byte) i11;
    }

    public static final int z(int[] iArr, int i5) {
        int i11 = iArr[i5 / 4];
        return (i5 % 4) / 2 == 0 ? i11 & 65535 : i11 >>> 16;
    }

    @Override // ba0.y
    public void A(ba0.t tVar) {
        Q(tVar);
    }

    @Override // ba0.y
    public void B(ba0.q qVar) {
        Q(qVar);
    }

    public String C(int i5) {
        int[] iArr;
        if (i5 < 0 || (iArr = (int[]) this.f13475c) == null || i5 >= iArr.length) {
            return null;
        }
        int i11 = iArr[i5];
        if (!this.f13474b) {
            int iZ = z((int[]) this.f13476d, i11);
            StringBuilder sb2 = new StringBuilder(iZ);
            while (iZ != 0) {
                i11 += 2;
                sb2.append((char) z((int[]) this.f13476d, i11));
                iZ--;
            }
            return sb2.toString();
        }
        int iS = s((int[]) this.f13476d, i11);
        int i12 = iS & 128;
        int i13 = i12 != 0 ? i11 + 2 : i11 + 1;
        int i14 = i13 + 1;
        if (i12 != 0) {
            iS = ((iS & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << 8) + (s((int[]) this.f13476d, i14) & 255);
            i14 = i13 + 2;
        }
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(iS);
        byteBufferAllocate.order(ByteOrder.LITTLE_ENDIAN);
        int i15 = i14 / 4;
        int i16 = i14 % 4;
        int i17 = i14 + iS;
        int i18 = (i17 - 1) / 4;
        int i19 = i17 % 4;
        for (int i21 = i15; i21 <= i18; i21++) {
            if (i21 == i15 && i16 > 0) {
                for (int i22 = i16; i22 < 4 && i22 < iS; i22++) {
                    byteBufferAllocate.put(s((int[]) this.f13476d, (i21 * 4) + i22));
                }
            } else if (i21 != i18 || i19 <= 0) {
                byteBufferAllocate.putInt(((int[]) this.f13476d)[i21]);
            } else {
                for (int i23 = 0; i23 < i19; i23++) {
                    byteBufferAllocate.put(s((int[]) this.f13476d, (i21 * 4) + i23));
                }
            }
        }
        byteBufferAllocate.rewind();
        try {
            return ((CharsetDecoder) this.f13477e).decode(byteBufferAllocate).toString();
        } catch (CharacterCodingException e3) {
            e3.printStackTrace();
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }

    @Override // ba0.y
    public void D(ba0.n nVar) {
        Q(nVar);
    }

    @Override // ba0.y
    public void E(ba0.i iVar) {
        Q(iVar);
    }

    @Override // ba0.y
    public void F(w90.a aVar) {
        Q(aVar);
    }

    @Override // ba0.y
    public void G(ba0.s sVar) {
        Q(sVar);
    }

    @Override // ba0.y
    public void H(ba0.k kVar) {
        Q(kVar);
    }

    public synchronized void I() {
        try {
            if (this.f13474b) {
                return;
            }
            Boolean boolO = O();
            this.f13476d = boolO;
            if (boolO == null) {
                rl.g gVar = new rl.g(11);
                bm.l lVar = (bm.l) ((km.c) this.f13475c);
                lVar.a(lVar.f18094c, gVar);
            }
            this.f13474b = true;
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public synchronized boolean J() {
        Boolean bool;
        try {
            I();
            bool = (Boolean) this.f13476d;
        } catch (Throwable th2) {
            throw th2;
        }
        return bool != null ? bool.booleanValue() : ((FirebaseMessaging) this.f13477e).f34753a.h();
    }

    @Override // ba0.y
    public void K(ba0.u uVar) {
        Q(uVar);
    }

    @Override // ba0.y
    public void L(ba0.j jVar) {
        Q(jVar);
    }

    public OutputStream M(int i5) {
        FileOutputStream fileOutputStream;
        qo.b bVar;
        synchronized (((qo.d) this.f13477e)) {
            try {
                qo.c cVar = (qo.c) this.f13475c;
                if (cVar.f84273d != this) {
                    throw new IllegalStateException();
                }
                if (!cVar.f84272c) {
                    ((boolean[]) this.f13476d)[i5] = true;
                }
                File fileB = cVar.b(i5);
                try {
                    fileOutputStream = new FileOutputStream(fileB);
                } catch (FileNotFoundException unused) {
                    ((qo.d) this.f13477e).f84276a.mkdirs();
                    try {
                        fileOutputStream = new FileOutputStream(fileB);
                    } catch (FileNotFoundException unused2) {
                        return qo.d.f84275p;
                    }
                }
                bVar = new qo.b(this, fileOutputStream);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return bVar;
    }

    public m90.h0 N(int i5) {
        m90.y yVarT;
        z80.f fVar = (z80.f) this.f13477e;
        synchronized (fVar) {
            try {
                if (this.f13474b) {
                    throw new IllegalStateException("Check failed.");
                }
                if (!Intrinsics.b(((z80.d) this.f13475c).f98317g, this)) {
                    return new m90.f();
                }
                if (!((z80.d) this.f13475c).f98315e) {
                    boolean[] zArr = (boolean[]) this.f13476d;
                    Intrinsics.d(zArr);
                    zArr[i5] = true;
                }
                File file = (File) ((z80.d) this.f13475c).f98314d.get(i5);
                try {
                    Intrinsics.g(file, "file");
                    try {
                        yVarT = x7.f.T(file);
                    } catch (FileNotFoundException unused) {
                        file.getParentFile().mkdirs();
                        yVarT = x7.f.T(file);
                    }
                    return new p8.e(yVarT, new b0.e(25, fVar, this));
                } catch (FileNotFoundException unused2) {
                    return new m90.f();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public Boolean O() {
        ApplicationInfo applicationInfo;
        Bundle bundle;
        ul.g gVar = ((FirebaseMessaging) this.f13477e).f34753a;
        gVar.a();
        Context context = gVar.f91320a;
        SharedPreferences sharedPreferences = context.getSharedPreferences("com.google.firebase.messaging", 0);
        if (sharedPreferences.contains("auto_init")) {
            return Boolean.valueOf(sharedPreferences.getBoolean("auto_init", false));
        }
        try {
            PackageManager packageManager = context.getPackageManager();
            if (packageManager == null || (applicationInfo = packageManager.getApplicationInfo(context.getPackageName(), 128)) == null || (bundle = applicationInfo.metaData) == null || !bundle.containsKey("firebase_messaging_auto_init_enabled")) {
                return null;
            }
            return Boolean.valueOf(applicationInfo.metaData.getBoolean("firebase_messaging_auto_init_enabled"));
        } catch (PackageManager.NameNotFoundException unused) {
            return null;
        }
    }

    public void P(qg.c cVar, fi.j jVar) {
        ((mg.l) ((le) this.f13477e).f32793b).accept(cVar, jVar);
    }

    public void Q(ba0.r rVar) {
        ba0.r rVar2 = rVar.f17782b;
        while (rVar2 != null) {
            ba0.r rVar3 = rVar2.f17785e;
            rVar2.a(this);
            rVar2 = rVar3;
        }
    }

    public String R() {
        if (!this.f13474b) {
            this.f13474b = true;
            z0 z0Var = (z0) this.f13477e;
            this.f13476d = z0Var.H().getString((String) this.f13475c, null);
        }
        return (String) this.f13476d;
    }

    public void S(String str) {
        SharedPreferences.Editor editorEdit = ((z0) this.f13477e).H().edit();
        editorEdit.putString((String) this.f13475c, str);
        editorEdit.apply();
        this.f13476d = str;
    }

    public synchronized void a() {
        try {
            long jCurrentTimeMillis = System.currentTimeMillis();
            this.f13475c.getClass().getDeclaredMethod(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39150d, null).invoke(this.f13475c, null);
            v6 v6Var = (v6) this.f13477e;
            ((qm1) v6Var.f10600a).a(3001, System.currentTimeMillis() - jCurrentTimeMillis, null, null);
            new fi.t().t(Boolean.TRUE);
        } catch (Exception e3) {
            throw new wo3(e3, 2003);
        }
    }

    @Override // ba0.y
    public void b(ba0.b bVar) {
        Q(bVar);
    }

    @Override // ba0.y
    public void c(ba0.f fVar) {
        Q(fVar);
    }

    public void d() {
        switch (this.f13473a) {
            case 5:
                qo.d.a((qo.d) this.f13477e, this, false);
                return;
            default:
                z80.f fVar = (z80.f) this.f13477e;
                synchronized (fVar) {
                    try {
                        if (this.f13474b) {
                            throw new IllegalStateException("Check failed.");
                        }
                        if (Intrinsics.b(((z80.d) this.f13475c).f98317g, this)) {
                            fVar.b(this, false);
                        }
                        this.f13474b = true;
                        Unit unit = Unit.f71706a;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return;
        }
    }

    public boolean e(fe.k0 k0Var, he.d dVar) throws IllegalArgumentException {
        String str = k0Var.f54883l;
        int i5 = k0Var.f54894y;
        if ("audio/eac3-joc".equals(str) && i5 == 16) {
            i5 = 12;
        }
        AudioFormat.Builder channelMask = new AudioFormat.Builder().setEncoding(2).setChannelMask(wf.v.k(i5));
        int i11 = k0Var.f54895z;
        if (i11 != -1) {
            channelMask.setSampleRate(i11);
        }
        return ((Spatializer) this.f13475c).canBeSpatialized((AudioAttributes) dVar.a().f57836b, channelMask.build());
    }

    @Override // ba0.y
    public void f(ba0.g gVar) {
        Q(gVar);
    }

    public void g() {
        z80.f fVar = (z80.f) this.f13477e;
        synchronized (fVar) {
            try {
                if (this.f13474b) {
                    throw new IllegalStateException("Check failed.");
                }
                if (Intrinsics.b(((z80.d) this.f13475c).f98317g, this)) {
                    fVar.b(this, true);
                }
                this.f13474b = true;
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public void h(boolean z11) {
        p8.d dVar = (p8.d) this.f13477e;
        synchronized (dVar) {
            try {
                if (this.f13474b) {
                    throw new IllegalStateException("editor is closed");
                }
                if (Intrinsics.b(((p8.a) this.f13475c).f82426g, this)) {
                    p8.d.a(dVar, this, z11);
                }
                this.f13474b = true;
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // ba0.y
    public void j(ba0.d dVar) {
        Q(dVar);
    }

    public void k() {
        z80.d dVar = (z80.d) this.f13475c;
        if (Intrinsics.b(dVar.f98317g, this)) {
            z80.f fVar = (z80.f) this.f13477e;
            if (fVar.f98340k) {
                fVar.b(this, false);
            } else {
                dVar.f98316f = true;
            }
        }
    }

    @Override // ba0.y
    public void l(ba0.x xVar) {
        Q(xVar);
    }

    @Override // ba0.y
    public void m(ba0.o oVar) {
        Q(oVar);
    }

    public m90.z n(int i5) {
        m90.z zVar;
        p8.d dVar = (p8.d) this.f13477e;
        synchronized (dVar) {
            if (this.f13474b) {
                throw new IllegalStateException("editor is closed");
            }
            ((boolean[]) this.f13476d)[i5] = true;
            Object obj = ((p8.a) this.f13475c).f82423d.get(i5);
            p8.c cVar = dVar.f82447p;
            m90.z zVar2 = (m90.z) obj;
            if (!cVar.g(zVar2)) {
                c9.g.a(cVar.m(zVar2));
            }
            zVar = (m90.z) obj;
        }
        return zVar;
    }

    @Override // ba0.y
    public void o(ba0.m mVar) {
        Q(mVar);
    }

    @Override // ba0.y
    public void p(ba0.l lVar) {
        Q(lVar);
    }

    public int q(String str) {
        if (str == null) {
            return -1;
        }
        int i5 = 0;
        while (true) {
            int[] iArr = (int[]) this.f13475c;
            if (i5 == iArr.length) {
                return -1;
            }
            int i11 = iArr[i5];
            int iZ = z((int[]) this.f13476d, i11);
            if (iZ == str.length()) {
                int i12 = 0;
                while (i12 != iZ) {
                    i11 += 2;
                    if (str.charAt(i12) != z((int[]) this.f13476d, i11)) {
                        break;
                    }
                    i12++;
                }
                if (i12 == iZ) {
                    return i5;
                }
            }
            i5++;
        }
    }

    @Override // ba0.y
    public void r(ba0.h hVar) {
        Q(hVar);
    }

    @Override // ba0.y
    public void t(ba0.v vVar) {
        Q(vVar);
    }

    public Feature[] u() {
        return (Feature[]) this.f13476d;
    }

    @Override // ba0.y
    public void v(ba0.c cVar) {
        Q(cVar);
    }

    @Override // ba0.y
    public void w(ba0.e eVar) {
        int i5 = 2;
        if (eVar instanceof w90.d) {
            w90.d dVar = (w90.d) eVar;
            if (((ArrayList) this.f13477e) == null) {
                this.f13477e = new ArrayList(2);
            }
            ArrayList arrayList = (ArrayList) this.f13477e;
            w90.c cVar = dVar.f94125g;
            if (w90.c.f94122c == cVar) {
                i5 = 3;
            } else if (w90.c.f94121b != cVar) {
                i5 = 1;
            }
            arrayList.add(new l60.a(i5, ((h60.b) this.f13475c).b(dVar)));
            this.f13474b = dVar.f94124f;
            return;
        }
        if (!(eVar instanceof w90.e) && !(eVar instanceof w90.f)) {
            Q(eVar);
            return;
        }
        Q(eVar);
        ArrayList arrayList2 = (ArrayList) this.f13477e;
        if (arrayList2 != null && arrayList2.size() > 0) {
            if (((ArrayList) this.f13476d) == null) {
                this.f13476d = new ArrayList(2);
            }
            ((ArrayList) this.f13476d).add(new l60.b((ArrayList) this.f13477e, this.f13474b));
        }
        this.f13477e = null;
        this.f13474b = false;
    }

    @Override // ba0.y
    public void x(ba0.w wVar) {
        Q(wVar);
    }

    @Override // ba0.y
    public void y(ba0.j jVar) {
        Q(jVar);
    }

    public y0(z0 z0Var, String str) {
        this.f13473a = 0;
        this.f13477e = z0Var;
        sg.w.e(str);
        this.f13475c = str;
    }

    public y0(Object obj, wi0 wi0Var, v6 v6Var, boolean z11) {
        this.f13473a = 1;
        this.f13475c = obj;
        this.f13476d = wi0Var;
        this.f13477e = v6Var;
        this.f13474b = z11;
    }

    public y0(h60.b bVar) {
        this.f13473a = 2;
        this.f13475c = bVar;
    }

    public y0(int i5) {
        this.f13473a = i5;
        switch (i5) {
            case 9:
                this.f13475c = new float[16];
                this.f13476d = new float[16];
                this.f13477e = new fk.l();
                break;
            default:
                this.f13477e = Charset.forName("UTF-8").newDecoder();
                break;
        }
    }

    public synchronized void a(MotionEvent motionEvent) {
        try {
            long jCurrentTimeMillis = System.currentTimeMillis();
            ((wi0) this.f13476d).getClass();
            HashMap map = new HashMap();
            map.put("t", new Throwable());
            map.put("aid", null);
            map.put("evt", motionEvent);
            this.f13475c.getClass().getDeclaredMethod("he", Map.class).invoke(this.f13475c, map);
            v6 v6Var = (v6) this.f13477e;
            ((qm1) v6Var.f10600a).a(Sdk.SDKMetric.SDKMetricType.BANNER_AUTO_REDIRECT_NOT_OVERRIDE_URL_VALUE, System.currentTimeMillis() - jCurrentTimeMillis, null, null);
            new fi.t().t(Boolean.TRUE);
        } catch (Exception e3) {
            throw new wo3(e3, 2005);
        }
    }

    public y0(p8.d dVar, p8.a aVar) {
        this.f13473a = 4;
        this.f13477e = dVar;
        this.f13475c = aVar;
        this.f13476d = new boolean[2];
    }

    public y0(qo.d dVar, qo.c cVar) {
        this.f13473a = 5;
        this.f13477e = dVar;
        this.f13475c = cVar;
        this.f13476d = cVar.f84272c ? null : new boolean[dVar.f84282g];
    }

    public y0(z80.f fVar, z80.d dVar) {
        boolean[] zArr;
        this.f13473a = 10;
        this.f13477e = fVar;
        this.f13475c = dVar;
        if (dVar.f98315e) {
            zArr = null;
        } else {
            fVar.getClass();
            zArr = new boolean[2];
        }
        this.f13476d = zArr;
    }

    public y0(FirebaseMessaging firebaseMessaging, km.c cVar) {
        this.f13473a = 8;
        this.f13477e = firebaseMessaging;
        this.f13475c = cVar;
    }

    public static String a(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        g5 g5VarO = ads_mobile_sdk.le.o();
        g5VarO.b();
        ads_mobile_sdk.le leVar = (ads_mobile_sdk.le) g5VarO.f1095b;
        leVar.getClass();
        leVar.encryptionMethod_ = b.c0.F(5);
        leVar.bitField0_ |= 4;
        qq qqVarA = sq.a(0, bArr.length, bArr);
        g5VarO.b();
        ((ads_mobile_sdk.le) g5VarO.f1095b).a(qqVarA);
        return Base64.encodeToString(((ads_mobile_sdk.le) g5VarO.a()).a(), 11);
    }

    public y0(Spatializer spatializer) {
        this.f13473a = 7;
        this.f13475c = spatializer;
        this.f13474b = spatializer.getImmersiveAudioLevel() != 0;
    }

    public synchronized byte[] a(HashMap map) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        try {
        } catch (Exception e3) {
            ((v6) this.f13477e).a(2007, System.currentTimeMillis() - jCurrentTimeMillis, e3);
            return null;
        }
        return (byte[]) this.f13475c.getClass().getDeclaredMethod("xss", Map.class, Map.class).invoke(this.f13475c, null, map);
    }
}
