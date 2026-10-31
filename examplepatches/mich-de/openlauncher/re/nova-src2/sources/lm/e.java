package lm;

import ads_mobile_sdk.c7;
import ads_mobile_sdk.c72;
import ads_mobile_sdk.db0;
import ads_mobile_sdk.el;
import ads_mobile_sdk.gu0;
import ads_mobile_sdk.ib1;
import ads_mobile_sdk.km0;
import ads_mobile_sdk.n30;
import ads_mobile_sdk.od1;
import ads_mobile_sdk.qu0;
import ads_mobile_sdk.su0;
import ads_mobile_sdk.u8;
import ads_mobile_sdk.vw2;
import ads_mobile_sdk.xu0;
import ads_mobile_sdk.xv0;
import ads_mobile_sdk.yf1;
import ads_mobile_sdk.yu0;
import android.content.Context;
import android.location.Location;
import android.location.LocationManager;
import android.net.Uri;
import android.os.Looper;
import android.os.Parcel;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import b.a1;
import b.b4;
import b.ca;
import b.t2;
import b.u6;
import b.z6;
import com.google.android.gms.appset.zza;
import com.google.android.gms.internal.consent_sdk.i0;
import com.google.android.gms.internal.consent_sdk.l7;
import com.google.android.gms.internal.consent_sdk.v0;
import com.google.android.gms.internal.measurement.k2;
import com.google.firebase.components.ComponentRegistrar;
import com.teslacoilsw.launcher.util.NamedIntent;
import db0.n0;
import e10.n2;
import e10.y2;
import i2.e0;
import i2.r0;
import i2.s;
import j10.m;
import j2.q;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.CancellationException;
import k30.h0;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import ni.u;
import org.json.JSONException;
import org.json.JSONObject;
import r80.n;
import r80.o;
import r80.p;
import rg.l;
import t70.m0;
import x80.f0;

/* loaded from: classes.dex */
public final class e implements u6, z6, ca, bh.b, bh.d, l7, de.a, d7.c, p, l {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75045a;

    public /* synthetic */ e(int i5) {
        this.f75045a = i5;
    }

    public static km0 b(a1 result) {
        Intrinsics.g(result, "result");
        if (result instanceof xu0) {
            return km0.f5781c;
        }
        if (result instanceof yu0) {
            return km0.f5783e;
        }
        if (result instanceof qu0) {
            return ((qu0) result).f8811c instanceof CancellationException ? km0.f5785g : km0.f5786h;
        }
        if (!(result instanceof su0)) {
            return km0.f5787i;
        }
        int iIntValue = ((su0) result).f9692c.b0().intValue();
        u uVar = u.f78326b;
        if (iIntValue == 7) {
            return km0.f5784f;
        }
        u uVar2 = u.f78326b;
        return iIntValue == 3 ? km0.f5782d : km0.f5787i;
    }

    public static u8 f(String str) {
        String lowerCase = str.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        return lowerCase.equals("app_open_ad") ? u8.f10242d : (u8) Enum.valueOf(u8.class, str);
    }

    public static boolean h(Uri uri) {
        Intrinsics.g(uri, "<this>");
        return "gmsg".equalsIgnoreCase(uri.getScheme()) && "mobileads.google.com".equalsIgnoreCase(uri.getHost());
    }

    public static final String i(long j11) {
        h0 h0Var = h0.f70974r;
        long j12 = j11 / 3600000;
        long j13 = (j11 % 3600000) / 60000;
        long j14 = (j11 % 60000) / 1000;
        if (j12 > 0) {
            return j12 + " hours " + j13 + " minutes " + j14 + " seconds";
        }
        if (j13 <= 0) {
            return j14 > 5 ? k2.i(j14, " seconds") : k2.i(j11, " ms");
        }
        return j13 + " minutes " + j14 + " seconds";
    }

    public static ArrayList j(List protocols) {
        Intrinsics.g(protocols, "protocols");
        ArrayList arrayList = new ArrayList();
        for (Object obj : protocols) {
            if (((f0) obj) != f0.HTTP_1_0) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(((f0) it.next()).f95490a);
        }
        return arrayList2;
    }

    public static boolean k(Uri uri) {
        return r70.j.B0(uri.getScheme(), "http", true) || r70.j.B0(uri.getScheme(), "https", true);
    }

    public static byte[] l(List protocols) {
        Intrinsics.g(protocols, "protocols");
        m90.g gVar = new m90.g();
        Iterator it = j(protocols).iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            gVar.g0(str.length());
            gVar.m0(str);
        }
        return gVar.D(gVar.f76126b);
    }

    public static m90.j m(String str) {
        if (str.length() % 2 != 0) {
            throw new IllegalArgumentException("Unexpected hex string: ".concat(str).toString());
        }
        int length = str.length() / 2;
        byte[] bArr = new byte[length];
        for (int i5 = 0; i5 < length; i5++) {
            int i11 = i5 * 2;
            bArr[i5] = (byte) (n90.b.b(str.charAt(i11 + 1)) + (n90.b.b(str.charAt(i11)) << 4));
        }
        return new m90.j(bArr);
    }

    public static m90.j n(String str) {
        Intrinsics.g(str, "<this>");
        byte[] bytes = str.getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "this as java.lang.String).getBytes(charset)");
        m90.j jVar = new m90.j(bytes);
        jVar.f76133c = str;
        return jVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:51:0x00a1, code lost:
    
        if (r1 == null) goto L33;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Location o(Context context) {
        Location lastKnownLocation;
        Location lastKnownLocation2;
        h0 h0Var = h0.f70974r;
        LocationManager locationManager = (LocationManager) context.getSystemService(LocationManager.class);
        Location lastKnownLocation3 = null;
        if (context.checkSelfPermission("android.permission.ACCESS_FINE_LOCATION") != 0 || m.i(context)) {
            return null;
        }
        try {
            lastKnownLocation = locationManager.getLastKnownLocation("fused");
        } catch (Exception e3) {
            mc0.d.f76206a.o(e3);
            lastKnownLocation = null;
        }
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (lastKnownLocation != null && jCurrentTimeMillis - lastKnownLocation.getTime() <= 1800000) {
            return lastKnownLocation;
        }
        try {
            lastKnownLocation2 = locationManager.getLastKnownLocation("gps");
        } catch (Exception e11) {
            mc0.d.f76206a.o(e11);
            lastKnownLocation2 = null;
        }
        if (lastKnownLocation2 == null || jCurrentTimeMillis - lastKnownLocation2.getTime() > 1800000) {
            try {
                lastKnownLocation3 = locationManager.getLastKnownLocation("network");
            } catch (Exception e12) {
                mc0.d.f76206a.o(e12);
            }
            if (lastKnownLocation3 == null || jCurrentTimeMillis - lastKnownLocation3.getTime() > 1800000) {
                if (lastKnownLocation != null) {
                    if (lastKnownLocation.getTime() + 300000 > (lastKnownLocation2 != null ? lastKnownLocation2.getTime() : 0L)) {
                        return lastKnownLocation;
                    }
                }
                if (lastKnownLocation2 != null) {
                    if (lastKnownLocation2.getTime() + 300000 <= (lastKnownLocation3 != null ? lastKnownLocation3.getTime() : 0L)) {
                    }
                }
                if (lastKnownLocation != null) {
                    return lastKnownLocation;
                }
            }
            return lastKnownLocation3;
        }
        return lastKnownLocation2;
    }

    public static h0 p(Context context) {
        if (h0.f70974r == null) {
            h0.f70974r = new h0(context.getApplicationContext());
        }
        h0 h0Var = h0.f70974r;
        Intrinsics.d(h0Var);
        return h0Var;
    }

    public static long q() {
        return s.f61140f;
    }

    public static long r(float f11, float f12, float f13) {
        int i5 = s.n;
        q qVar = j2.d.f68662e;
        if (0.0f > f11 || f11 > 360.0f || 0.0f > f12 || f12 > 1.0f || 0.0f > f13 || f13 > 1.0f) {
            e0.a("HSV (" + f11 + ", " + f12 + ", " + f13 + ") must be in range (0..360, 0..1, 0..1)");
        }
        return r0.a(s(f11, f12, f13, 5), s(f11, f12, f13, 3), s(f11, f12, f13, 1), 1.0f, qVar);
    }

    public static float s(float f11, float f12, float f13, int i5) {
        float f14 = ((f11 / 60.0f) + i5) % 6.0f;
        return f13 - (Math.max(0.0f, Math.min(f14, Math.min(4 - f14, 1.0f))) * (f12 * f13));
    }

    public static n2 t(NamedIntent namedIntent, Function1 function1, String str, int i5) {
        if ((i5 & 2) != 0) {
            function1 = new n0(1, y2.f51877a, y2.class, "defaultIsValid", "defaultIsValid(Ljava/lang/Object;)Z", 0, 3);
        }
        if ((i5 & 4) != 0) {
            str = null;
        }
        return new n2(str, namedIntent, function1);
    }

    public static boolean u() {
        return "Dalvik".equals(System.getProperty("java.vm.name"));
    }

    public static m90.j v(byte[] bArr) {
        m90.j jVar = m90.j.f76130d;
        int iZ = com.google.android.gms.internal.consent_sdk.e0.Z(bArr);
        com.google.android.gms.internal.consent_sdk.e0.v(bArr.length, 0, iZ);
        return new m90.j(u90.b.x(0, iZ, bArr));
    }

    @Override // b.ca
    public void a(String str, JSONObject jSONObject) throws JSONException {
        if ("attest".equals(str)) {
            try {
                String string = jSONObject.getString("mechanism");
                String string2 = jSONObject.getString("version");
                HashMap mapA = c72.a(jSONObject.getJSONObject("attestationArgs"));
                mapA.put("version", string2);
                t2.D(ib1.f4719b.f4720a.getApplicationContext(), string, new c7(mapA));
            } catch (Exception e3) {
                Log.e("OMIDLIB", "Error processing attestation request", e3);
            }
        }
    }

    @Override // rg.l
    public void accept(Object obj, Object obj2) {
        hh.b bVar = (hh.b) ((hh.a) obj).getService();
        zza zzaVar = new zza(null, null);
        hh.f fVar = new hh.f((fi.j) obj2);
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeInterfaceToken("com.google.android.gms.appset.internal.IAppSetService");
        parcelObtain.writeInt(1);
        zzaVar.writeToParcel(parcelObtain, 0);
        parcelObtain.writeStrongBinder(fVar);
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            bVar.f59855a.transact(1, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
        } finally {
            parcelObtain.recycle();
            parcelObtain2.recycle();
        }
    }

    @Override // bh.b
    public int c(Context context, String str, boolean z11) {
        return bh.e.d(context, str, z11);
    }

    @Override // bh.b
    public int d(Context context, String str) {
        return bh.e.a(context, str);
    }

    @Override // d7.c
    public d7.d e(d7.b bVar) {
        return new e7.i(bVar.f49000a, bVar.f49001b, bVar.f49002c, bVar.f49003d, bVar.f49004e);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object g(od1 od1Var, ContinuationImpl continuationImpl) throws Throwable {
        yf1 yf1Var;
        if (continuationImpl instanceof yf1) {
            yf1Var = (yf1) continuationImpl;
            int i5 = yf1Var.f12024d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                yf1Var.f12024d = i5 - Integer.MIN_VALUE;
            } else {
                yf1Var = new yf1(this, continuationImpl);
            }
        }
        Object objY = yf1Var.f12022b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = yf1Var.f12024d;
        if (i11 == 0) {
            ResultKt.b(objY);
            b4.f15783a.getClass();
            CoroutineContext coroutineContext = (CoroutineContext) ((db0) gu0.a()).f2360w.get();
            yf1Var.f12021a = od1Var;
            yf1Var.f12024d = 1;
            if (Intrinsics.b(Looper.getMainLooper(), Looper.myLooper())) {
                mi.a aVarL = od1Var.l();
                View view = od1Var.f7841m;
                Context context = view.getContext();
                Intrinsics.f(context, "getContext(...)");
                vw2 vw2Var = new vw2(context, aVarL);
                vw2Var.addView(view);
                objY = vw2Var;
            } else {
                objY = m0.y(coroutineContext, new e20.c(od1Var, null, 8), yf1Var);
            }
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            od1Var = yf1Var.f12021a;
            ResultKt.b(objY);
        }
        return new ui.f(new el(od1Var, (vw2) objY));
    }

    @Override // r80.p
    public o getLevel() {
        return o.f85698b;
    }

    @Override // de.a
    public long getTime() {
        return SystemClock.elapsedRealtime();
    }

    @Override // r80.p
    public n getWriter() {
        return new b50.d();
    }

    public List w(ComponentRegistrar componentRegistrar) {
        ArrayList arrayList = new ArrayList();
        for (bm.b bVar : componentRegistrar.getComponents()) {
            String str = bVar.f18063a;
            if (str != null) {
                bVar = new bm.b(str, bVar.f18064b, bVar.f18065c, bVar.f18066d, bVar.f18067e, new bm.o(2, str, bVar), bVar.f18069g);
            }
            arrayList.add(bVar);
        }
        return arrayList;
    }

    @Override // com.google.android.gms.internal.consent_sdk.m7
    public Object zzb() {
        com.google.android.gms.internal.consent_sdk.h0 h0Var = i0.f32099b;
        com.google.android.gms.internal.consent_sdk.c.a(h0Var);
        return new v0(h0Var);
    }

    public /* synthetic */ e(hh.g gVar) {
        this.f75045a = 24;
    }

    @Override // bh.d
    public bh.c a(Context context, String str, bh.b bVar) {
        int iC;
        switch (this.f75045a) {
            case 14:
                bh.c cVar = new bh.c();
                int iD = bVar.d(context, str);
                cVar.f17889a = iD;
                if (iD != 0) {
                    cVar.f17891c = -1;
                } else {
                    int iC2 = bVar.c(context, str, true);
                    cVar.f17890b = iC2;
                    if (iC2 != 0) {
                        cVar.f17891c = 1;
                    }
                }
                return cVar;
            default:
                bh.c cVar2 = new bh.c();
                int iD2 = bVar.d(context, str);
                cVar2.f17889a = iD2;
                int i5 = 1;
                int i11 = 0;
                if (iD2 != 0) {
                    iC = bVar.c(context, str, false);
                    cVar2.f17890b = iC;
                } else {
                    iC = bVar.c(context, str, true);
                    cVar2.f17890b = iC;
                }
                int i12 = cVar2.f17889a;
                if (i12 == 0) {
                    if (iC == 0) {
                        i5 = 0;
                    }
                    cVar2.f17891c = i5;
                    return cVar2;
                }
                i11 = i12;
                if (i11 >= iC) {
                    i5 = -1;
                }
                cVar2.f17891c = i5;
                return cVar2;
        }
    }

    @Override // b.ca
    public void b() {
    }

    @Override // b.u6
    public Object a(int i5) {
        n30 n30Var;
        xv0 xv0Var;
        switch (this.f75045a) {
            case 4:
                n30 n30Var2 = n30.UNSPECIFIED;
                if (i5 == 0) {
                    n30Var = n30Var2;
                } else if (i5 == 1) {
                    n30Var = n30.TAILORED_WARNING_CT_BASE;
                } else if (i5 == 2) {
                    n30Var = n30.TAILORED_WARNING_CT;
                } else if (i5 == 3) {
                    n30Var = n30.TAILORED_WARNING_CT_ACCOUNT_INFO;
                } else if (i5 != 4) {
                    n30Var = i5 != 5 ? null : n30.TAILORED_WARNING_SUSPICIOUS;
                } else {
                    n30Var = n30.TAILORED_WARNING_SUSPICIOUS_BASE;
                }
                return n30Var == null ? n30Var2 : n30Var;
            default:
                switch (i5) {
                    case 0:
                        xv0Var = xv0.FORMAT_UNKNOWN;
                        break;
                    case 1:
                        xv0Var = xv0.FORMAT_BANNER;
                        break;
                    case 2:
                        xv0Var = xv0.FORMAT_INTERSTITIAL;
                        break;
                    case 3:
                        xv0Var = xv0.FORMAT_REWARDED;
                        break;
                    case 4:
                        xv0Var = xv0.FORMAT_REWARDED_INTERSTITIAL;
                        break;
                    case 5:
                        xv0Var = xv0.FORMAT_APP_OPEN;
                        break;
                    case 6:
                        xv0Var = xv0.FORMAT_NATIVE;
                        break;
                    case 7:
                        xv0Var = xv0.FORMAT_ICON;
                        break;
                    case 8:
                        xv0Var = xv0.FORMAT_SWIPEABLE_INTERSTITIAL;
                        break;
                    default:
                        xv0Var = null;
                        break;
                }
                return xv0Var == null ? xv0.UNRECOGNIZED : xv0Var;
        }
    }

    @Override // b.ca
    public String a() {
        return "omidJsAttestationListener";
    }

    @Override // b.z6
    public byte[] a(byte[] bArr, int i5, int i11) {
        return Arrays.copyOfRange(bArr, i5, i11 + i5);
    }
}
