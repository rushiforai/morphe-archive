package qp;

import ads_mobile_sdk.nl0;
import ads_mobile_sdk.pd;
import ads_mobile_sdk.rt0;
import ads_mobile_sdk.ut0;
import ads_mobile_sdk.wt0;
import ads_mobile_sdk.yi1;
import android.content.Context;
import android.os.Build;
import android.os.DeadObjectException;
import android.os.HandlerThread;
import android.os.Parcel;
import android.text.Layout;
import android.text.TextUtils;
import b.b5;
import b.g4;
import b.x3;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.internal.consent_sdk.e0;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.novalauncher.novalytics.stats.internal.DailyMetricsDatabase_Impl;
import java.text.Bidi;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.EnumMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Pair;
import kotlin.collections.ArrayDeque;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import m3.p0;
import m3.s;
import m3.t;
import np.k;
import pp.b0;
import pp.f0;
import pp.l;
import q3.o;
import t70.k0;
import t70.m0;
import t70.y0;
import x7.u;

/* loaded from: classes.dex */
public final class i implements sg.b, sg.c, t, vd.b {

    /* renamed from: a, reason: collision with root package name */
    public final Object f84307a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f84308b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f84309c;

    /* renamed from: d, reason: collision with root package name */
    public Object f84310d;

    /* renamed from: e, reason: collision with root package name */
    public Object f84311e;

    public i(Context context, String installationId) {
        Intrinsics.g(context, "context");
        Intrinsics.g(installationId, "installationId");
        this.f84307a = installationId;
        y70.d dVarB = k0.b();
        this.f84308b = dVarB;
        Object obj = new Object();
        this.f84309c = obj;
        context.getFileStreamPath("novalytics_log.json");
        this.f84311e = new ArrayList();
        LocalDate localDateNow = LocalDate.now();
        synchronized (obj) {
            a80.e eVar = y0.f88884a;
            m0.t(dVarB, a80.d.f488c, null, new mx.e(this, localDateNow, (Continuation) null, 13), 2);
        }
    }

    public static String d(i iVar, l lVar) {
        if (lVar == null) {
            return null;
        }
        int iOrdinal = lVar.ordinal();
        if (iOrdinal == 0) {
            return "NONE";
        }
        if (iOrdinal == 1) {
            return "SEARCH";
        }
        if (iOrdinal == 2) {
            return "SEARCH_CLICK";
        }
        throw new IllegalArgumentException("Can't convert enum to string, unknown enum value: " + lVar);
    }

    public static String e(i iVar, k kVar) {
        if (kVar == null) {
            return null;
        }
        int iOrdinal = kVar.ordinal();
        if (iOrdinal == 0) {
            return "UNSUBMITTED";
        }
        if (iOrdinal == 1) {
            return "PENDING";
        }
        if (iOrdinal == 2) {
            return "SUBMITTED";
        }
        throw new IllegalArgumentException("Can't convert enum to string, unknown enum value: " + kVar);
    }

    public static l f(String str) {
        if (str == null) {
            return null;
        }
        switch (str) {
            case "SEARCH":
                return l.f82758b;
            case "SEARCH_CLICK":
                return l.f82759c;
            case "NONE":
                return l.f82757a;
            default:
                throw new IllegalArgumentException("Can't convert value to enum, unknown value: ".concat(str));
        }
    }

    public static k g(String str) {
        if (str == null) {
            return null;
        }
        switch (str) {
            case "UNSUBMITTED":
                return k.f78519b;
            case "SUBMITTED":
                return k.f78521d;
            case "PENDING":
                return k.f78520c;
            default:
                throw new IllegalArgumentException("Can't convert value to enum, unknown value: ".concat(str));
        }
    }

    @Override // m3.t
    public boolean a() {
        ArrayList arrayList = (ArrayList) this.f84311e;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            if (((s) arrayList.get(i5)).f75970a.a()) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, kotlin.Lazy] */
    @Override // m3.t
    public float b() {
        return ((Number) this.f84310d.getValue()).floatValue();
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, kotlin.Lazy] */
    @Override // m3.t
    public float c() {
        return ((Number) this.f84309c.getValue()).floatValue();
    }

    @Override // w60.a
    public Object get() {
        return new zd.a((Executor) ((w60.a) this.f84307a).get(), (ud.e) ((w60.a) this.f84308b).get(), (u) ((i50.c) this.f84309c).get(), (be.d) ((w60.a) this.f84310d).get(), (ce.b) ((w60.a) this.f84311e).get());
    }

    public void h(r8.g gVar, Class cls) {
        ((ArrayList) this.f84310d).add(new Pair(gVar, cls));
    }

    public void i(u8.b bVar, Class cls) {
        ((ArrayList) this.f84308b).add(new Pair(bVar, cls));
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0076  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Bidi j(int i5) {
        Bidi bidi;
        Layout layout = (Layout) this.f84307a;
        ArrayList arrayList = (ArrayList) this.f84308b;
        ArrayList arrayList2 = (ArrayList) this.f84309c;
        boolean[] zArr = (boolean[]) this.f84310d;
        if (zArr[i5]) {
            return (Bidi) arrayList2.get(i5);
        }
        int iIntValue = i5 == 0 ? 0 : ((Number) arrayList.get(i5 - 1)).intValue();
        int iIntValue2 = ((Number) arrayList.get(i5)).intValue();
        int i11 = iIntValue2 - iIntValue;
        char[] cArr = (char[]) this.f84311e;
        if (cArr == null || cArr.length < i11) {
            cArr = new char[i11];
        }
        char[] cArr2 = cArr;
        TextUtils.getChars(layout.getText(), iIntValue, iIntValue2, cArr2, 0);
        if (Bidi.requiresBidi(cArr2, 0, i11)) {
            bidi = new Bidi(cArr2, 0, null, 0, i11, layout.getParagraphDirection(layout.getLineForOffset(o(i5))) == -1 ? 1 : 0);
            if (bidi.getRunCount() == 1) {
            }
        } else {
            bidi = null;
        }
        arrayList2.set(i5, bidi);
        zArr[i5] = true;
        if (bidi != null) {
            char[] cArr3 = (char[]) this.f84311e;
            cArr2 = cArr2 == cArr3 ? null : cArr3;
        }
        this.f84311e = cArr2;
        return bidi;
    }

    public m8.b k() {
        return new m8.b(ul.b.h0((ArrayList) this.f84307a), ul.b.h0((ArrayList) this.f84308b), ul.b.h0((ArrayList) this.f84309c), ul.b.h0((ArrayList) this.f84310d), ul.b.h0((ArrayList) this.f84311e));
    }

    public float l(int i5, boolean z11) {
        Layout layout = (Layout) this.f84307a;
        int lineEnd = layout.getLineEnd(layout.getLineForOffset(i5));
        if (i5 > lineEnd) {
            i5 = lineEnd;
        }
        return z11 ? layout.getPrimaryHorizontal(i5) : layout.getSecondaryHorizontal(i5);
    }

    public float m(int i5, boolean z11, boolean z12) {
        int i11;
        int i12;
        int iP = i5;
        Layout layout = (Layout) this.f84307a;
        if (!z12) {
            return l(i5, z11);
        }
        int iH = e0.H(layout, iP, z12);
        int lineStart = layout.getLineStart(iH);
        int lineEnd = layout.getLineEnd(iH);
        if (iP != lineStart && iP != lineEnd) {
            return l(i5, z11);
        }
        if (iP == 0 || iP == layout.getText().length()) {
            return l(i5, z11);
        }
        int iN = n(iP, z12);
        boolean z13 = layout.getParagraphDirection(layout.getLineForOffset(o(iN))) == -1;
        int iP2 = p(lineEnd, lineStart);
        int iO = o(iN);
        int i13 = lineStart - iO;
        int i14 = iP2 - iO;
        Bidi bidiJ = j(iN);
        Bidi bidiCreateLineBidi = bidiJ != null ? bidiJ.createLineBidi(i13, i14) : null;
        if (bidiCreateLineBidi == null || bidiCreateLineBidi.getRunCount() == 1) {
            boolean zIsRtlCharAt = layout.isRtlCharAt(lineStart);
            if (z11 || z13 == zIsRtlCharAt) {
                z13 = !z13;
            }
            return iP == lineStart ? z13 : !z13 ? layout.getLineLeft(iH) : layout.getLineRight(iH);
        }
        int runCount = bidiCreateLineBidi.getRunCount();
        n3.e[] eVarArr = new n3.e[runCount];
        for (int i15 = 0; i15 < runCount; i15++) {
            eVarArr[i15] = new n3.e(bidiCreateLineBidi.getRunStart(i15) + lineStart, bidiCreateLineBidi.getRunLimit(i15) + lineStart, bidiCreateLineBidi.getRunLevel(i15) % 2 == 1);
        }
        int runCount2 = bidiCreateLineBidi.getRunCount();
        byte[] bArr = new byte[runCount2];
        for (int i16 = 0; i16 < runCount2; i16++) {
            bArr[i16] = (byte) bidiCreateLineBidi.getRunLevel(i16);
        }
        Bidi.reorderVisually(bArr, 0, eVarArr, 0, runCount);
        if (iP == lineStart) {
            int i17 = 0;
            while (true) {
                if (i17 >= runCount) {
                    i12 = -1;
                    break;
                }
                if (eVarArr[i17].b() == iP) {
                    i12 = i17;
                    break;
                }
                i17++;
            }
            boolean z14 = (z11 || z13 == eVarArr[i12].c()) ? !z13 : z13;
            return (i12 == 0 && z14) ? layout.getLineLeft(iH) : (i12 != runCount - 1 || z14) ? z14 ? layout.getPrimaryHorizontal(eVarArr[i12 - 1].b()) : layout.getPrimaryHorizontal(eVarArr[i12 + 1].b()) : layout.getLineRight(iH);
        }
        if (iP > iP2) {
            iP = p(iP, lineStart);
        }
        int i18 = 0;
        while (true) {
            if (i18 >= runCount) {
                i11 = -1;
                break;
            }
            if (eVarArr[i18].a() == iP) {
                i11 = i18;
                break;
            }
            i18++;
        }
        boolean z15 = (z11 || z13 == eVarArr[i11].c()) ? z13 : !z13;
        return (i11 == 0 && z15) ? layout.getLineLeft(iH) : (i11 != runCount - 1 || z15) ? z15 ? layout.getPrimaryHorizontal(eVarArr[i11 - 1].a()) : layout.getPrimaryHorizontal(eVarArr[i11 + 1].a()) : layout.getLineRight(iH);
    }

    public int n(int i5, boolean z11) {
        ArrayList arrayList = (ArrayList) this.f84308b;
        int iL = ul.b.l(arrayList, Integer.valueOf(i5));
        int i11 = iL < 0 ? -(iL + 1) : iL + 1;
        if (z11 && i11 > 0) {
            int i12 = i11 - 1;
            if (i5 == ((Number) arrayList.get(i12)).intValue()) {
                return i12;
            }
        }
        return i11;
    }

    public int o(int i5) {
        if (i5 == 0) {
            return 0;
        }
        return ((Number) ((ArrayList) this.f84308b).get(i5 - 1)).intValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x00bb  */
    @Override // sg.b
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onConnected() {
        b5 b5Var;
        HandlerThread handlerThread = (HandlerThread) this.f84311e;
        LinkedBlockingQueue linkedBlockingQueue = (LinkedBlockingQueue) this.f84310d;
        rt0 rt0Var = (rt0) this.f84307a;
        try {
            b5Var = (b5) rt0Var.getService();
        } catch (DeadObjectException | IllegalStateException unused) {
            b5Var = null;
        }
        if (b5Var != null) {
            try {
                try {
                    ut0 ut0Var = new ut0(1, (String) this.f84308b, (String) this.f84309c);
                    g4 g4Var = (g4) b5Var;
                    Parcel parcelObtain = Parcel.obtain();
                    parcelObtain.writeInterfaceToken(g4Var.f74936c);
                    parcelObtain.writeInt(1);
                    ut0Var.writeToParcel(parcelObtain, 0);
                    Parcel parcelA = g4Var.a(parcelObtain, 1);
                    wt0 wt0VarCreateFromParcel = parcelA.readInt() == 0 ? null : wt0.CREATOR.createFromParcel(parcelA);
                    parcelA.recycle();
                    if (wt0VarCreateFromParcel.f11382b == null) {
                        try {
                            wt0VarCreateFromParcel.f11382b = pd.a(wt0VarCreateFromParcel.f11383c, nl0.a());
                            wt0VarCreateFromParcel.f11383c = null;
                        } catch (yi1 | NullPointerException e3) {
                            throw new IllegalStateException(e3);
                        }
                    }
                    wt0VarCreateFromParcel.a();
                    linkedBlockingQueue.put(wt0VarCreateFromParcel.f11382b);
                } catch (Throwable unused2) {
                    x3 x3VarW = pd.w();
                    x3VarW.v(32768L);
                    linkedBlockingQueue.put((pd) x3VarW.a());
                    if (rt0Var != null && (rt0Var.isConnected() || rt0Var.isConnecting())) {
                    }
                    handlerThread.quit();
                }
            } catch (InterruptedException unused3) {
                if (rt0Var != null) {
                    rt0Var.disconnect();
                }
                handlerThread.quit();
            } catch (Throwable th2) {
                if (rt0Var != null && (rt0Var.isConnected() || rt0Var.isConnecting())) {
                    rt0Var.disconnect();
                }
                handlerThread.quit();
                throw th2;
            }
            if (rt0Var != null && (rt0Var.isConnected() || rt0Var.isConnecting())) {
                rt0Var.disconnect();
            }
            handlerThread.quit();
        }
    }

    @Override // sg.c
    public void onConnectionFailed(ConnectionResult connectionResult) throws InterruptedException {
        try {
            LinkedBlockingQueue linkedBlockingQueue = (LinkedBlockingQueue) this.f84310d;
            x3 x3VarW = pd.w();
            x3VarW.v(32768L);
            linkedBlockingQueue.put((pd) x3VarW.a());
        } catch (InterruptedException unused) {
        }
    }

    @Override // sg.b
    public void onConnectionSuspended(int i5) throws InterruptedException {
        try {
            LinkedBlockingQueue linkedBlockingQueue = (LinkedBlockingQueue) this.f84310d;
            x3 x3VarW = pd.w();
            x3VarW.v(32768L);
            linkedBlockingQueue.put((pd) x3VarW.a());
        } catch (InterruptedException unused) {
        }
    }

    public int p(int i5, int i11) {
        while (i5 > i11) {
            char cCharAt = ((Layout) this.f84307a).getText().charAt(i5 - 1);
            if (cCharAt != ' ' && cCharAt != '\n' && cCharAt != 5760 && ((Intrinsics.h(cCharAt, UserMetadata.MAX_INTERNAL_KEY_SIZE) < 0 || Intrinsics.h(cCharAt, 8202) > 0 || cCharAt == 8199) && cCharAt != 8287 && cCharAt != 12288)) {
                return i5;
            }
            i5--;
        }
        return i5;
    }

    public np.d q(LocalDate date) {
        Intrinsics.g(date, "date");
        String str = (String) this.f84307a;
        int i5 = Build.VERSION.SDK_INT;
        String BRAND = Build.BRAND;
        Intrinsics.f(BRAND, "BRAND");
        String MODEL = Build.MODEL;
        Intrinsics.f(MODEL, "MODEL");
        k kVar = k.f78519b;
        l lVar = l.f82757a;
        EnumMap enumMap = new EnumMap(b0.class);
        EnumMap enumMap2 = new EnumMap(f0.class);
        EmptyList emptyList = EmptyList.f71733a;
        return new np.d(date, "com.teslacoilsw.launcher", 89400, str, i5, BRAND, MODEL, kVar, 0L, lVar, lVar, 0, 0, 0, 0, enumMap, enumMap2, emptyList, false, false, false, false, null, new String[0], new op.c(), new op.l(), false, emptyList, new LinkedHashMap());
    }

    public void r(np.d dVar) {
        DailyMetricsDatabase_Impl dailyMetricsDatabase_Impl = (DailyMetricsDatabase_Impl) this.f84307a;
        dailyMetricsDatabase_Impl.assertNotSuspendingTransaction();
        dailyMetricsDatabase_Impl.beginTransaction();
        try {
            g gVar = (g) this.f84309c;
            d7.g gVarAcquire = gVar.acquire();
            try {
                gVar.bind(gVarAcquire, dVar);
                gVarAcquire.executeUpdateDelete();
                gVar.release(gVarAcquire);
                dailyMetricsDatabase_Impl.setTransactionSuccessful();
            } catch (Throwable th2) {
                gVar.release(gVarAcquire);
                throw th2;
            }
        } finally {
            dailyMetricsDatabase_Impl.endTransaction();
        }
    }

    public i(a3.e eVar) {
        this.f84307a = null;
        this.f84308b = null;
        this.f84309c = null;
        this.f84310d = null;
        this.f84311e = null;
    }

    public i(Layout layout) {
        this.f84307a = layout;
        ArrayList arrayList = new ArrayList();
        int length = 0;
        do {
            int iR0 = r70.k.R0('\n', length, 4, ((Layout) this.f84307a).getText());
            length = iR0 < 0 ? ((Layout) this.f84307a).getText().length() : iR0 + 1;
            arrayList.add(Integer.valueOf(length));
        } while (length < ((Layout) this.f84307a).getText().length());
        this.f84308b = arrayList;
        int size = arrayList.size();
        ArrayList arrayList2 = new ArrayList(size);
        for (int i5 = 0; i5 < size; i5++) {
            arrayList2.add(null);
        }
        this.f84309c = arrayList2;
        this.f84310d = new boolean[((ArrayList) this.f84308b).size()];
        ((ArrayList) this.f84308b).size();
    }

    public i(w60.a aVar, w60.a aVar2, i50.c cVar, w60.a aVar3, w60.a aVar4) {
        this.f84307a = aVar;
        this.f84308b = aVar2;
        this.f84309c = cVar;
        this.f84310d = aVar3;
        this.f84311e = aVar4;
    }

    public i(m3.g gVar, p0 p0Var, List list, y3.c cVar, o oVar) {
        int i5;
        String strSubstring;
        ArrayList arrayList;
        String str;
        List list2;
        m3.g gVar2 = gVar;
        p0 p0Var2 = p0Var;
        this.f84307a = gVar2;
        this.f84308b = list;
        LazyThreadSafetyMode lazyThreadSafetyMode = LazyThreadSafetyMode.f71681c;
        final int i11 = 0;
        this.f84309c = LazyKt.b(lazyThreadSafetyMode, new Function0(this) { // from class: m3.q

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ qp.i f75960b;

            {
                this.f75960b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                Object obj;
                Object obj2;
                switch (i11) {
                    case 0:
                        ArrayList arrayList2 = (ArrayList) this.f75960b.f84311e;
                        if (arrayList2.isEmpty()) {
                            obj = null;
                        } else {
                            Object obj3 = arrayList2.get(0);
                            float fC = ((s) obj3).f75970a.c();
                            int iK = ul.b.K(arrayList2);
                            int i12 = 1;
                            if (1 <= iK) {
                                while (true) {
                                    Object obj4 = arrayList2.get(i12);
                                    float fC2 = ((s) obj4).f75970a.c();
                                    if (Float.compare(fC, fC2) < 0) {
                                        obj3 = obj4;
                                        fC = fC2;
                                    }
                                    if (i12 != iK) {
                                        i12++;
                                    }
                                }
                            }
                            obj = obj3;
                        }
                        s sVar = (s) obj;
                        return Float.valueOf(sVar != null ? sVar.f75970a.c() : 0.0f);
                    default:
                        ArrayList arrayList3 = (ArrayList) this.f75960b.f84311e;
                        if (arrayList3.isEmpty()) {
                            obj2 = null;
                        } else {
                            Object obj5 = arrayList3.get(0);
                            float fC3 = ((s) obj5).f75970a.f90529i.c();
                            int iK2 = ul.b.K(arrayList3);
                            int i13 = 1;
                            if (1 <= iK2) {
                                while (true) {
                                    Object obj6 = arrayList3.get(i13);
                                    float fC4 = ((s) obj6).f75970a.f90529i.c();
                                    if (Float.compare(fC3, fC4) < 0) {
                                        obj5 = obj6;
                                        fC3 = fC4;
                                    }
                                    if (i13 != iK2) {
                                        i13++;
                                    }
                                }
                            }
                            obj2 = obj5;
                        }
                        s sVar2 = (s) obj2;
                        return Float.valueOf(sVar2 != null ? sVar2.f75970a.f90529i.c() : 0.0f);
                }
            }
        });
        final int i12 = 1;
        this.f84310d = LazyKt.b(lazyThreadSafetyMode, new Function0(this) { // from class: m3.q

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ qp.i f75960b;

            {
                this.f75960b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                Object obj;
                Object obj2;
                switch (i12) {
                    case 0:
                        ArrayList arrayList2 = (ArrayList) this.f75960b.f84311e;
                        if (arrayList2.isEmpty()) {
                            obj = null;
                        } else {
                            Object obj3 = arrayList2.get(0);
                            float fC = ((s) obj3).f75970a.c();
                            int iK = ul.b.K(arrayList2);
                            int i122 = 1;
                            if (1 <= iK) {
                                while (true) {
                                    Object obj4 = arrayList2.get(i122);
                                    float fC2 = ((s) obj4).f75970a.c();
                                    if (Float.compare(fC, fC2) < 0) {
                                        obj3 = obj4;
                                        fC = fC2;
                                    }
                                    if (i122 != iK) {
                                        i122++;
                                    }
                                }
                            }
                            obj = obj3;
                        }
                        s sVar = (s) obj;
                        return Float.valueOf(sVar != null ? sVar.f75970a.c() : 0.0f);
                    default:
                        ArrayList arrayList3 = (ArrayList) this.f75960b.f84311e;
                        if (arrayList3.isEmpty()) {
                            obj2 = null;
                        } else {
                            Object obj5 = arrayList3.get(0);
                            float fC3 = ((s) obj5).f75970a.f90529i.c();
                            int iK2 = ul.b.K(arrayList3);
                            int i13 = 1;
                            if (1 <= iK2) {
                                while (true) {
                                    Object obj6 = arrayList3.get(i13);
                                    float fC4 = ((s) obj6).f75970a.f90529i.c();
                                    if (Float.compare(fC3, fC4) < 0) {
                                        obj5 = obj6;
                                        fC3 = fC4;
                                    }
                                    if (i13 != iK2) {
                                        i13++;
                                    }
                                }
                            }
                            obj2 = obj5;
                        }
                        s sVar2 = (s) obj2;
                        return Float.valueOf(sVar2 != null ? sVar2.f75970a.f90529i.c() : 0.0f);
                }
            }
        });
        m3.u uVar = p0Var2.f75957b;
        m3.g gVar3 = m3.h.f75897a;
        ArrayList arrayList2 = gVar2.f75882d;
        String str2 = gVar2.f75880b;
        List listD1 = (arrayList2 == null || (listD1 = b70.g.D1(new m3.f(i12), arrayList2)) == null) ? EmptyList.f71733a : listD1;
        ArrayList arrayList3 = new ArrayList();
        ArrayDeque arrayDeque = new ArrayDeque();
        int size = listD1.size();
        int i13 = 0;
        int i14 = 0;
        while (i13 < size) {
            m3.e eVar = (m3.e) listD1.get(i13);
            m3.e eVarA = m3.e.a(eVar, uVar.a((m3.u) eVar.f75852a), i11, 14);
            Object obj = eVarA.f75852a;
            int i15 = eVarA.f75854c;
            int i16 = eVarA.f75853b;
            while (i14 < i16 && !arrayDeque.isEmpty()) {
                m3.e eVar2 = (m3.e) arrayDeque.last();
                int i17 = eVar2.f75854c;
                List list3 = listD1;
                Object obj2 = eVar2.f75852a;
                if (i16 < i17) {
                    arrayList3.add(new m3.e(obj2, i14, i16));
                    i14 = i16;
                    listD1 = list3;
                } else {
                    int i18 = size;
                    arrayList3.add(new m3.e(obj2, i14, i17));
                    i14 = eVar2.f75854c;
                    while (!arrayDeque.isEmpty() && i14 == ((m3.e) arrayDeque.last()).f75854c) {
                        arrayDeque.removeLast();
                    }
                    listD1 = list3;
                    size = i18;
                }
            }
            List list4 = listD1;
            int i19 = size;
            if (i14 < i16) {
                arrayList3.add(new m3.e(uVar, i14, i16));
                i14 = i16;
            }
            m3.e eVar3 = (m3.e) arrayDeque.j();
            if (eVar3 != null) {
                int i21 = eVar3.f75854c;
                Object obj3 = eVar3.f75852a;
                int i22 = eVar3.f75853b;
                if (i22 == i16 && i21 == i15) {
                    arrayDeque.removeLast();
                    arrayDeque.addLast(new m3.e(((m3.u) obj3).a((m3.u) obj), i16, i15));
                } else if (i22 == i21) {
                    arrayList3.add(new m3.e(obj3, i22, i21));
                    arrayDeque.removeLast();
                    arrayDeque.addLast(new m3.e(obj, i16, i15));
                } else if (i21 >= i15) {
                    arrayDeque.addLast(new m3.e(((m3.u) obj3).a((m3.u) obj), i16, i15));
                } else {
                    throw new IllegalArgumentException();
                }
            } else {
                arrayDeque.addLast(new m3.e(obj, i16, i15));
            }
            i13++;
            listD1 = list4;
            size = i19;
            i11 = 0;
        }
        while (i14 <= str2.length() && !arrayDeque.isEmpty()) {
            m3.e eVar4 = (m3.e) arrayDeque.last();
            Object obj4 = eVar4.f75852a;
            int i23 = eVar4.f75854c;
            arrayList3.add(new m3.e(obj4, i14, i23));
            while (!arrayDeque.isEmpty() && i23 == ((m3.e) arrayDeque.last()).f75854c) {
                arrayDeque.removeLast();
            }
            i14 = i23;
        }
        if (i14 < str2.length()) {
            arrayList3.add(new m3.e(uVar, i14, str2.length()));
        }
        if (arrayList3.isEmpty()) {
            i5 = 0;
            arrayList3.add(new m3.e(uVar, 0, 0));
        } else {
            i5 = 0;
        }
        ArrayList arrayList4 = new ArrayList(arrayList3.size());
        int size2 = arrayList3.size();
        int i24 = i5;
        while (i24 < size2) {
            m3.e eVar5 = (m3.e) arrayList3.get(i24);
            int i25 = eVar5.f75853b;
            int i26 = eVar5.f75854c;
            if (i25 != i26) {
                strSubstring = str2.substring(i25, i26);
                Intrinsics.f(strSubstring, "substring(...)");
            } else {
                strSubstring = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            List listA = m3.h.a(gVar2, i25, i26, new lm.h(2));
            m3.g gVar4 = new m3.g(strSubstring, listA == null ? EmptyList.f71733a : listA);
            m3.u uVar2 = (m3.u) eVar5.f75852a;
            if (uVar2.f75974b == Integer.MIN_VALUE) {
                arrayList = arrayList3;
                str = str2;
                uVar2 = new m3.u(uVar2.f75973a, uVar.f75974b, uVar2.f75975c, uVar2.f75976d, uVar2.f75977e, uVar2.f75978f, uVar2.f75979g, uVar2.f75980h, uVar2.f75981i);
            } else {
                arrayList = arrayList3;
                str = str2;
            }
            p0 p0Var3 = new p0(p0Var2.f75956a, uVar.a(uVar2));
            List list5 = gVar4.f75879a;
            List list6 = list5 == null ? EmptyList.f71733a : list5;
            List list7 = (List) this.f84308b;
            ArrayList arrayList5 = new ArrayList(list7.size());
            int size3 = list7.size();
            int i27 = 0;
            while (i27 < size3) {
                m3.e eVar6 = (m3.e) list7.get(i27);
                int i28 = eVar6.f75853b;
                m3.u uVar3 = uVar;
                int i29 = eVar6.f75854c;
                if (m3.h.b(i25, i26, i28, i29)) {
                    if (i25 > i28 || i29 > i26) {
                        s3.a.a("placeholder can not overlap with paragraph.");
                    }
                    list2 = list7;
                    arrayList5.add(new m3.e(eVar6.f75852a, i28 - i25, i29 - i25));
                } else {
                    list2 = list7;
                }
                i27++;
                list7 = list2;
                uVar = uVar3;
            }
            arrayList4.add(new s(new u3.e(strSubstring, p0Var3, list6, arrayList5, oVar, cVar), i25, i26));
            i24++;
            gVar2 = gVar;
            p0Var2 = p0Var;
            str2 = str;
            arrayList3 = arrayList;
        }
        this.f84311e = arrayList4;
    }

    public i(DailyMetricsDatabase_Impl dailyMetricsDatabase_Impl) {
        this.f84307a = dailyMetricsDatabase_Impl;
        this.f84308b = new e(this, dailyMetricsDatabase_Impl);
        int i5 = 0;
        new f(dailyMetricsDatabase_Impl, i5);
        this.f84309c = new g(this, dailyMetricsDatabase_Impl);
        this.f84310d = new h(dailyMetricsDatabase_Impl, i5);
        this.f84311e = new h(dailyMetricsDatabase_Impl, 1);
    }

    public i(Context context, String str, String str2) {
        this.f84308b = str;
        this.f84309c = str2;
        HandlerThread handlerThread = new HandlerThread("GassClient");
        this.f84311e = handlerThread;
        handlerThread.start();
        rt0 rt0Var = new rt0(9200000, context, handlerThread.getLooper(), this, this);
        this.f84307a = rt0Var;
        this.f84310d = new LinkedBlockingQueue();
        rt0Var.checkAvailabilityAndConnect();
    }

    public i() {
        this.f84307a = new ArrayList();
        this.f84308b = new ArrayList();
        this.f84309c = new ArrayList();
        this.f84310d = new ArrayList();
        this.f84311e = new ArrayList();
    }

    public i(m8.b bVar) {
        this.f84307a = b70.g.K1(bVar.f76047a);
        this.f84308b = b70.g.K1(bVar.f76048b);
        this.f84309c = b70.g.K1(bVar.f76049c);
        this.f84310d = b70.g.K1(bVar.f76050d);
        this.f84311e = b70.g.K1(bVar.f76051e);
    }
}
