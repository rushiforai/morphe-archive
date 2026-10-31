package b;

import ads_mobile_sdk.b71;
import ads_mobile_sdk.c71;
import ads_mobile_sdk.cc2;
import ads_mobile_sdk.cd3;
import ads_mobile_sdk.d61;
import ads_mobile_sdk.d62;
import ads_mobile_sdk.e42;
import ads_mobile_sdk.fh1;
import ads_mobile_sdk.gq;
import ads_mobile_sdk.ha2;
import ads_mobile_sdk.hq;
import ads_mobile_sdk.ib1;
import ads_mobile_sdk.il2;
import ads_mobile_sdk.im0;
import ads_mobile_sdk.jh3;
import ads_mobile_sdk.ji3;
import ads_mobile_sdk.jr0;
import ads_mobile_sdk.k61;
import ads_mobile_sdk.km0;
import ads_mobile_sdk.kv0;
import ads_mobile_sdk.lm1;
import ads_mobile_sdk.mi3;
import ads_mobile_sdk.mu0;
import ads_mobile_sdk.mv0;
import ads_mobile_sdk.p82;
import ads_mobile_sdk.q82;
import ads_mobile_sdk.qw2;
import ads_mobile_sdk.sx2;
import ads_mobile_sdk.th3;
import ads_mobile_sdk.ts2;
import ads_mobile_sdk.tu2;
import ads_mobile_sdk.u22;
import ads_mobile_sdk.ug2;
import ads_mobile_sdk.un3;
import ads_mobile_sdk.ur2;
import ads_mobile_sdk.v03;
import ads_mobile_sdk.v22;
import ads_mobile_sdk.vn3;
import ads_mobile_sdk.yi1;
import android.app.ActivityManager;
import android.app.KeyguardManager;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.PowerManager;
import android.os.Process;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import android.util.Pair;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.function.UnaryOperator;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.text.Charsets;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes2.dex */
public class k9 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f15911b;

    public /* synthetic */ k9(int i5) {
        this.f15911b = i5;
    }

    public static void A(Class cls, Object obj) {
        if (obj != null) {
            return;
        }
        throw new IllegalStateException(cls.getCanonicalName() + " must be set");
    }

    public static /* synthetic */ void B(Object obj) {
        if (obj != null) {
            throw new ClassCastException();
        }
    }

    public static boolean C(byte b11) {
        return b11 > -65;
    }

    public static boolean D(Context context) {
        PowerManager powerManager;
        ActivityManager activityManager;
        List<ActivityManager.RunningAppProcessInfo> runningAppProcesses;
        Intrinsics.g(context, "<this>");
        KeyguardManager keyguardManager = (KeyguardManager) context.getSystemService(KeyguardManager.class);
        if (keyguardManager == null || (powerManager = (PowerManager) context.getSystemService(PowerManager.class)) == null || (activityManager = (ActivityManager) context.getSystemService(ActivityManager.class)) == null || (runningAppProcesses = activityManager.getRunningAppProcesses()) == null) {
            return false;
        }
        Iterator<ActivityManager.RunningAppProcessInfo> it = runningAppProcesses.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            ActivityManager.RunningAppProcessInfo next = it.next();
            if (Process.myPid() == next.pid) {
                if (!powerManager.isInteractive() || keyguardManager.isKeyguardLocked() || next.importance != 100) {
                    break;
                }
                return false;
            }
        }
        return true;
    }

    public static boolean E(File file) {
        boolean z11;
        if (!file.exists()) {
            return true;
        }
        File[] fileArrListFiles = file.listFiles();
        if (fileArrListFiles != null) {
            int length = fileArrListFiles.length;
            z11 = true;
            for (int i5 = 0; i5 < length; i5++) {
                File file2 = fileArrListFiles[i5];
                z11 = file2 != null && E(file2) && z11;
            }
        } else {
            z11 = true;
        }
        return file.delete() && z11;
    }

    public static boolean F(File file, byte[] bArr) throws Throwable {
        FileOutputStream fileOutputStream = null;
        try {
            FileOutputStream fileOutputStream2 = new FileOutputStream(file);
            try {
                if (Build.VERSION.SDK_INT >= 34) {
                    file.setReadOnly();
                }
                fileOutputStream2.write(bArr);
                fileOutputStream2.flush();
                ph.a.l(fileOutputStream2);
                return true;
            } catch (IOException unused) {
                fileOutputStream = fileOutputStream2;
                ph.a.l(fileOutputStream);
                return false;
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = fileOutputStream2;
                ph.a.l(fileOutputStream);
                throw th;
            }
        } catch (IOException unused2) {
        } catch (Throwable th3) {
            th = th3;
        }
    }

    public static boolean G(String str) {
        if (str == null || !str.startsWith("omid-native")) {
            return false;
        }
        try {
            Uri uri = Uri.parse(str);
            if (!"omid-native".equals(uri.getScheme())) {
                return false;
            }
            x(uri);
            return true;
        } catch (Exception unused) {
            return false;
        }
    }

    public static byte[] H(String str, boolean z11) {
        byte[] bArrA = u(z11).a(str);
        if (bArrA.length != 0 || str.length() <= 0) {
            return bArrA;
        }
        throw new IllegalArgumentException("Unable to decode ".concat(str));
    }

    public static int I(String str) {
        ads_mobile_sdk.w1[] w1VarArr = ads_mobile_sdk.w1.f10989a;
        if (str.equals("landscape")) {
            return 6;
        }
        return str.equals("portrait") ? 7 : -1;
    }

    public static boolean J() {
        if (Build.VERSION.SDK_INT < 31) {
            return Build.DEVICE.startsWith("generic");
        }
        String str = Build.FINGERPRINT;
        return str.contains("generic") || str.contains("emulator") || Build.HARDWARE.contains("ranchu");
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x008f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static ads_mobile_sdk.o9 K(com.google.gson.r rVar) {
        ads_mobile_sdk.q9 q9Var;
        ni.y yVar;
        String strA = d62.a(rVar, TTConst.TRACK_TYPE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        String strA2 = d62.a(rVar, "precision", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        String strA3 = d62.a(rVar, TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        long jG = d62.g(rVar, "value");
        int iHashCode = strA.hashCode();
        if (iHashCode != 66934) {
            if (iHashCode != 66944) {
                if (iHashCode == 1349395245 && strA.equals("ONE_PIXEL")) {
                    jG /= 1000;
                    q9Var = ads_mobile_sdk.q9.f8527g;
                } else {
                    q9Var = ads_mobile_sdk.q9.f8524d;
                }
            } else if (strA.equals("CPM")) {
                q9Var = ads_mobile_sdk.q9.f8525e;
            }
        } else if (strA.equals("CPC")) {
            q9Var = ads_mobile_sdk.q9.f8526f;
        }
        ads_mobile_sdk.q9 q9Var2 = q9Var;
        long j11 = jG;
        int iHashCode2 = strA2.hashCode();
        if (iHashCode2 != -2131980260) {
            if (iHashCode2 != 399232571) {
                yVar = (iHashCode2 == 1271254246 && strA2.equals("PUBLISHER_PROVIDED")) ? ni.y.f78346c : ni.y.f78344a;
            } else if (strA2.equals("PRECISE")) {
                yVar = ni.y.f78347d;
            }
        } else if (strA2.equals("ESTIMATED")) {
            yVar = ni.y.f78345b;
        }
        return new ads_mobile_sdk.o9(q9Var2, j11, yVar, strA3);
    }

    public static void L(Object obj) {
        if (obj == null) {
            throw new NullPointerException("Cannot return null from a non- @Provides method");
        }
    }

    public static int a(int i5) {
        return a80.m.e(i5, 3, 2, 1, 10);
    }

    public static int b(int i5, int i11) {
        return u4.a(i5, i11, 31);
    }

    public static int c(int i5, int i11, int i12, int i13) {
        return ((i5 + i11) - i12) + i13;
    }

    public static int d(int i5, List list) {
        return u4.c(i5, 31, list);
    }

    public static cc2 e(Exception exc, Exception exc2) {
        th3 th3VarA = ji3.a();
        th3VarA.a(exc2);
        return th3VarA.e();
    }

    public static d61 f(m5 m5Var, String str, m5 m5Var2, boolean z11) {
        Intrinsics.g(m5Var, str);
        return new d61(m5Var2, z11);
    }

    public static jh3 g(com.google.gson.r rVar) {
        im0 im0Var;
        if (rVar != null) {
            com.google.gson.p pVarV = rVar.v("fill_definition");
            int iG = pVarV != null ? pVarV.g() : 0;
            im0.f4865b.getClass();
            im0[] im0VarArrValues = im0.values();
            int length = im0VarArrValues.length;
            int i5 = 0;
            while (true) {
                if (i5 >= length) {
                    im0Var = null;
                    break;
                }
                im0Var = im0VarArrValues[i5];
                if (im0Var.f4871a == iG) {
                    break;
                }
                i5++;
            }
            if (im0Var == null) {
                im0Var = im0.f4866c;
            }
            im0 im0Var2 = im0Var;
            if (im0Var2 != im0.f4866c) {
                com.google.gson.p pVarV2 = rVar.v("nofill_retention_time_ms");
                long jL = pVarV2 != null ? pVarV2.l() : 0L;
                com.google.gson.p pVarV3 = rVar.v("callback_delay_ms");
                long jL2 = pVarV3 != null ? pVarV3.l() : 50L;
                com.google.gson.p pVarV4 = rVar.v("nofills_before_throttle");
                int iG2 = pVarV4 != null ? pVarV4.g() : 0;
                com.google.gson.p pVarV5 = rVar.v("post_throttle_nofills_before_throttle");
                Integer numValueOf = pVarV5 != null ? Integer.valueOf(pVarV5.g()) : null;
                Duration.Companion companion = Duration.f72038b;
                DurationUnit durationUnit = DurationUnit.f72045d;
                return new jh3(iG2, numValueOf, DurationKt.h(jL, durationUnit), DurationKt.h(jL2, durationUnit), im0Var2);
            }
        }
        return null;
    }

    public static final lm1 h(qw2 qw2Var) {
        Intrinsics.g(qw2Var, "<this>");
        switch (qw2Var.ordinal()) {
            case 0:
                return lm1.FORMAT_UNKNOWN;
            case 1:
                return lm1.FORMAT_APP_OPEN;
            case 2:
                return lm1.FORMAT_BANNER;
            case 3:
                return lm1.FORMAT_ICON;
            case 4:
                return lm1.FORMAT_INTERSTITIAL;
            case 5:
                return lm1.FORMAT_NATIVE;
            case 6:
                return lm1.FORMAT_REWARDED;
            case 7:
                return lm1.FORMAT_REWARDED_INTERSTITIAL;
            case 8:
                return lm1.FORMAT_SWIPEABLE_INTERSTITIAL;
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    public static mi3 i() {
        return new mi3(new ur2(), new fh1(), new tu2(), new ads_mobile_sdk.s8());
    }

    public static ads_mobile_sdk.o9 j(com.google.gson.r rVar) {
        try {
            i8 i8Var = ads_mobile_sdk.q9.f8522b;
            int iG = rVar.v("type_num").g();
            i8Var.getClass();
            ads_mobile_sdk.q9 q9VarH = i8.h(iG);
            long jL = rVar.v("value").l();
            int iG2 = rVar.v("precision_num").g();
            ni.y yVar = iG2 != 1 ? iG2 != 2 ? iG2 != 3 ? ni.y.f78344a : ni.y.f78347d : ni.y.f78346c : ni.y.f78345b;
            String strO = rVar.v(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY).o();
            Intrinsics.f(strO, "getAsString(...)");
            return new ads_mobile_sdk.o9(q9VarH, jL, yVar, strO);
        } catch (Exception e3) {
            th3 th3VarA = ji3.a();
            th3VarA.a(e3);
            ArrayList arrayList = th3VarA.e().f1803s;
            String message = e3.getMessage();
            if (message == null) {
                message = e3.getClass().getName();
            }
            arrayList.add(message);
            return null;
        }
    }

    public static ads_mobile_sdk.z1 k(com.google.gson.r rVar, int i5, t70.p0 p0Var) {
        ads_mobile_sdk.z1 z1Var;
        ArrayList arrayList;
        ads_mobile_sdk.u8 u8Var;
        ArrayList arrayList2;
        ArrayList arrayList3;
        ArrayList arrayList4;
        ads_mobile_sdk.v1 v1Var;
        ArrayList arrayList5;
        ArrayList arrayList6;
        ArrayList arrayList7;
        ArrayList arrayList8;
        ArrayList arrayList9;
        ArrayList arrayList10;
        ArrayList arrayList11;
        ArrayList arrayList12;
        final Ref.ObjectRef objectRef;
        com.google.gson.r rVar2;
        com.google.gson.r rVar3;
        ArrayList arrayList13;
        ArrayList arrayList14;
        ArrayList arrayList15;
        ads_mobile_sdk.u8 u8Var2;
        String str;
        ads_mobile_sdk.u8 u8Var3;
        ArrayList arrayList16;
        ads_mobile_sdk.v1 v1Var2;
        ArrayList arrayList17;
        ArrayList arrayList18;
        ArrayList arrayList19;
        u22 u22Var;
        double dE;
        ArrayList arrayList20;
        ArrayList arrayList21;
        ArrayList arrayList22;
        ArrayList arrayList23;
        ArrayList arrayList24;
        ArrayList arrayList25;
        ArrayList arrayList26;
        com.google.gson.m mVarE;
        ha2 ha2Var = ha2.f4272d;
        try {
            arrayList = new ArrayList();
            u8Var = ads_mobile_sdk.u8.f10240b;
            arrayList2 = new ArrayList();
            arrayList3 = new ArrayList();
            arrayList4 = new ArrayList();
            v1Var = ads_mobile_sdk.v1.f10543d;
            arrayList5 = new ArrayList();
            arrayList6 = new ArrayList();
            arrayList7 = new ArrayList();
            arrayList8 = new ArrayList();
            arrayList9 = new ArrayList();
            ArrayList arrayList27 = new ArrayList();
            arrayList10 = new ArrayList();
            arrayList11 = new ArrayList();
            arrayList12 = new ArrayList();
            ArrayList arrayList28 = new ArrayList();
            ArrayList arrayList29 = new ArrayList();
            objectRef = new Ref.ObjectRef();
            objectRef.f71863a = new com.google.gson.r();
            rVar2 = new com.google.gson.r();
            rVar3 = new com.google.gson.r();
            Duration.f72038b.getClass();
            Duration.Companion.a();
            arrayList13 = arrayList28;
            arrayList14 = arrayList29;
            arrayList15 = arrayList27;
            z1Var = null;
        } catch (Exception e3) {
            e = e3;
            z1Var = null;
        }
        try {
            q82 q82Var = new q82(p82.f8137c, ha2Var, false, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            ads_mobile_sdk.y1 y1Var = ads_mobile_sdk.y1.f11907d;
            Duration.Companion.a();
            com.google.gson.r rVar4 = new com.google.gson.r();
            ArrayList arrayList30 = new ArrayList();
            Bundle bundle = Bundle.EMPTY;
            v03 v03Var = new v03();
            il2 il2Var = il2.f4849c;
            com.google.gson.r rVar5 = new com.google.gson.r();
            Duration.Companion.a();
            com.google.gson.r rVar6 = new com.google.gson.r();
            Iterator it = rVar.u().iterator();
            String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            ads_mobile_sdk.y1 y1Var2 = y1Var;
            String str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            String str4 = str3;
            String str5 = str4;
            String str6 = str5;
            String str7 = str6;
            String str8 = str7;
            String str9 = str8;
            String str10 = str9;
            String str11 = str10;
            com.google.gson.r rVar7 = rVar4;
            com.google.gson.r rVar8 = rVar2;
            com.google.gson.r rVar9 = rVar3;
            ads_mobile_sdk.u8 u8Var4 = u8Var;
            v03 v03Var2 = v03Var;
            il2 il2Var2 = il2Var;
            com.google.gson.r rVar10 = rVar5;
            com.google.gson.r rVar11 = rVar6;
            q82 q82Var2 = q82Var;
            long j11 = 0;
            long j12 = 0;
            long j13 = 0;
            double d5 = 0.0d;
            ads_mobile_sdk.o9 o9Var = null;
            String str12 = null;
            k61 k61Var = null;
            String str13 = null;
            com.google.gson.m mVar = null;
            sx2 sx2Var = null;
            e42 e42Var = null;
            cd3 cd3Var = null;
            ug2 ug2Var = null;
            u22 u22Var2 = null;
            boolean z11 = false;
            boolean z12 = false;
            boolean z13 = false;
            boolean z14 = false;
            boolean z15 = false;
            int i11 = -1;
            boolean z16 = false;
            boolean z17 = false;
            boolean z18 = false;
            boolean z19 = false;
            boolean z21 = false;
            boolean z22 = false;
            boolean z23 = false;
            boolean z24 = false;
            boolean z25 = false;
            boolean z26 = false;
            boolean z27 = false;
            boolean z28 = false;
            boolean z29 = false;
            String str14 = str11;
            String str15 = str14;
            String str16 = str15;
            String str17 = str16;
            String str18 = str17;
            String str19 = str18;
            String str20 = str19;
            String str21 = str20;
            Bundle bundle2 = bundle;
            ads_mobile_sdk.v1 v1Var3 = v1Var;
            boolean z31 = false;
            String str22 = str21;
            while (((hn.l) it).hasNext()) {
                Map.Entry entry = (Map.Entry) ((hn.l) it).next();
                Intrinsics.d(entry);
                String str23 = (String) entry.getKey();
                ha2 ha2Var2 = ha2Var;
                com.google.gson.p pVar = (com.google.gson.p) entry.getValue();
                if (str23 != null) {
                    u8Var3 = u8Var4;
                    switch (str23.hashCode()) {
                        case -2138196627:
                            str = str2;
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList17 = arrayList15;
                            arrayList18 = arrayList13;
                            if (str23.equals("ad_source_instance_name")) {
                                String strO = pVar.o();
                                Intrinsics.f(strO, "getAsString(...)");
                                Unit unit = Unit.f71706a;
                                str18 = strO;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1980587809:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList17 = arrayList15;
                            arrayList18 = arrayList13;
                            if (str23.equals("debug_signals")) {
                                com.google.gson.r rVarJ = pVar.j();
                                Unit unit3 = Unit.f71706a;
                                str = str2;
                                rVar8 = rVarJ;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1965512151:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList17 = arrayList15;
                            arrayList18 = arrayList13;
                            if (str23.equals("omid_settings")) {
                                com.google.gson.r rVarJ2 = pVar.j();
                                int iA = d62.a(rVarJ2, "media_type", -1);
                                p82 p82Var = iA != 0 ? iA != 1 ? p82.f8137c : p82.f8135a : p82.f8136b;
                                q82 q82Var3 = new q82(p82Var, k7.f15910a[p82Var.ordinal()] == 1 ? ha2Var2 : ha2.f4271c, d62.a(rVarJ2, "javascript_session_service_enabled", true), d62.a(rVarJ2, "omid_partner_name", str2), d62.a(rVarJ2, "omid_html", str2));
                                Unit unit4 = Unit.f71706a;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                u8Var4 = u8Var3;
                                arrayList30 = arrayList16;
                                q82Var2 = q82Var3;
                            } else {
                                str = str2;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1964744830:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList17 = arrayList15;
                            arrayList18 = arrayList13;
                            if (str23.equals("offline_ad_config")) {
                                e42 e42VarA = ed.a(pVar.j());
                                Unit unit5 = Unit.f71706a;
                                str = str2;
                                e42Var = e42VarA;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1882692970:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList17 = arrayList15;
                            arrayList18 = arrayList13;
                            if (str23.equals("swipeable_interstitial_ad_config")) {
                                cd3 cd3VarD = d0.d(pVar.j());
                                Unit unit6 = Unit.f71706a;
                                str = str2;
                                cd3Var = cd3VarD;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                            str = str2;
                            mu0.a(new p6.d0(str23, 1));
                            Unit unit22222 = Unit.f71706a;
                            u8Var4 = u8Var3;
                            str2 = str;
                            arrayList13 = arrayList18;
                            arrayList15 = arrayList17;
                            v1Var3 = v1Var2;
                            ha2Var = ha2Var2;
                            arrayList30 = arrayList16;
                        case -1840512279:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList18 = arrayList13;
                            if (str23.equals("presentation_urls")) {
                                Iterator it2 = pVar.h().iterator();
                                int i12 = 0;
                                while (it2.hasNext()) {
                                    Object next = it2.next();
                                    int i13 = i12 + 1;
                                    if (i12 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar2 = (com.google.gson.p) next;
                                    Intrinsics.d(pVar2);
                                    String strO2 = pVar2.o();
                                    Intrinsics.f(strO2, "getAsString(...)");
                                    Uri uri = Uri.parse(strO2);
                                    if (uri != null) {
                                        arrayList19 = arrayList15;
                                        arrayList19.add(uri);
                                        Unit unit7 = Unit.f71706a;
                                    } else {
                                        arrayList19 = arrayList15;
                                    }
                                    arrayList15 = arrayList19;
                                    i12 = i13;
                                }
                                arrayList17 = arrayList15;
                                Unit unit8 = Unit.f71706a;
                                str = str2;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1828733410:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList18 = arrayList13;
                            if (str23.equals("network_ping_config")) {
                                Intrinsics.d(pVar);
                                if ((pVar instanceof com.google.gson.r) && pVar.j().y()) {
                                    com.google.gson.p pVarV = pVar.j().v("ping_strategy");
                                    pVarV.getClass();
                                    if (pVarV instanceof com.google.gson.r) {
                                        com.google.gson.r rVarJ3 = pVarV.j();
                                        int iA2 = d62.a(rVarJ3, "max_attempts", 1);
                                        int iA3 = d62.a(rVarJ3, "initial_backoff_ms", 0);
                                        boolean zA = d62.a(rVarJ3, "buffer_after_max_attempts", false);
                                        try {
                                            dE = rVarJ3.v("backoff_multiplier").e();
                                        } catch (Exception unused) {
                                            dE = 1.0d;
                                        }
                                        u22Var = new u22(new v22(iA2, zA, dE, iA3));
                                    }
                                    Unit unit9 = Unit.f71706a;
                                    str = str2;
                                    u22Var2 = u22Var;
                                    u8Var4 = u8Var3;
                                    arrayList17 = arrayList15;
                                    str2 = str;
                                    arrayList13 = arrayList18;
                                    arrayList15 = arrayList17;
                                    v1Var3 = v1Var2;
                                    ha2Var = ha2Var2;
                                    arrayList30 = arrayList16;
                                }
                                u22Var = null;
                                Unit unit92 = Unit.f71706a;
                                str = str2;
                                u22Var2 = u22Var;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                            break;
                        case -1812055556:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList18 = arrayList13;
                            if (str23.equals("play_prewarm_options")) {
                                ug2 ug2VarQ = t2.q(pVar.j());
                                Unit unit10 = Unit.f71706a;
                                str = str2;
                                ug2Var = ug2VarQ;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1785028569:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList18 = arrayList13;
                            if (str23.equals("parallel_key")) {
                                String strO3 = pVar.o();
                                Unit unit11 = Unit.f71706a;
                                str = str2;
                                str13 = strO3;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1776946669:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList18 = arrayList13;
                            if (str23.equals("ad_source_name")) {
                                String strO4 = pVar.o();
                                Intrinsics.f(strO4, "getAsString(...)");
                                Unit unit12 = Unit.f71706a;
                                str = str2;
                                str22 = strO4;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1620552059:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList18 = arrayList13;
                            if (str23.equals("preload_sort_type")) {
                                i8 i8Var = il2.f4847a;
                                int iG = pVar.g();
                                i8Var.getClass();
                                il2 il2VarC = i8.c(iG);
                                Unit unit13 = Unit.f71706a;
                                str = str2;
                                il2Var2 = il2VarC;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1620470467:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList18 = arrayList13;
                            if (str23.equals("backend_query_id")) {
                                String strO5 = pVar.o();
                                Intrinsics.f(strO5, "getAsString(...)");
                                Unit unit14 = Unit.f71706a;
                                str = str2;
                                str7 = strO5;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1550155393:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList18 = arrayList13;
                            if (str23.equals("nofill_urls")) {
                                Iterator it3 = pVar.h().iterator();
                                int i14 = 0;
                                while (it3.hasNext()) {
                                    Object next2 = it3.next();
                                    int i15 = i14 + 1;
                                    if (i14 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar3 = (com.google.gson.p) next2;
                                    Intrinsics.d(pVar3);
                                    String strO6 = pVar3.o();
                                    Intrinsics.f(strO6, "getAsString(...)");
                                    Uri uri2 = Uri.parse(strO6);
                                    if (uri2 != null) {
                                        arrayList20 = arrayList9;
                                        arrayList20.add(uri2);
                                        Unit unit15 = Unit.f71706a;
                                    } else {
                                        arrayList20 = arrayList9;
                                    }
                                    arrayList9 = arrayList20;
                                    i14 = i15;
                                }
                                Unit unit16 = Unit.f71706a;
                                str = str2;
                                arrayList9 = arrayList9;
                                arrayList17 = arrayList15;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1538424578:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList18 = arrayList13;
                            if (str23.equals("enable_lock_screen_ad")) {
                                boolean zD = pVar.d();
                                Unit unit17 = Unit.f71706a;
                                str = str2;
                                z14 = zD;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                            str = str2;
                            arrayList17 = arrayList15;
                            mu0.a(new p6.d0(str23, 1));
                            Unit unit22222222222222 = Unit.f71706a;
                            u8Var4 = u8Var3;
                            str2 = str;
                            arrayList13 = arrayList18;
                            arrayList15 = arrayList17;
                            v1Var3 = v1Var2;
                            ha2Var = ha2Var2;
                            arrayList30 = arrayList16;
                        case -1440104884:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList18 = arrayList13;
                            if (str23.equals("is_custom_close_blocked")) {
                                boolean zD2 = pVar.d();
                                Unit unit18 = Unit.f71706a;
                                str = str2;
                                z18 = zD2;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1439500848:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList18 = arrayList13;
                            if (str23.equals("orientation")) {
                                List list = ads_mobile_sdk.z1.D0;
                                String strO7 = pVar.o();
                                Intrinsics.f(strO7, "getAsString(...)");
                                int I = I(strO7);
                                Unit unit19 = Unit.f71706a;
                                str = str2;
                                i11 = I;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                            str = str2;
                            arrayList17 = arrayList15;
                            mu0.a(new p6.d0(str23, 1));
                            Unit unit2222222222222222 = Unit.f71706a;
                            u8Var4 = u8Var3;
                            str2 = str;
                            arrayList13 = arrayList18;
                            arrayList15 = arrayList17;
                            v1Var3 = v1Var2;
                            ha2Var = ha2Var2;
                            arrayList30 = arrayList16;
                        case -1428969291:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList21 = arrayList10;
                            if (str23.equals("enable_omid")) {
                                boolean zD3 = pVar.d();
                                Unit unit20 = Unit.f71706a;
                                str = str2;
                                z19 = zD3;
                                arrayList10 = arrayList21;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList10 = arrayList21;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1406227629:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList21 = arrayList10;
                            if (str23.equals("buffer_click_url_as_ready_to_ping")) {
                                boolean zD4 = pVar.d();
                                Unit unit21 = Unit.f71706a;
                                str = str2;
                                z12 = zD4;
                                arrayList10 = arrayList21;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList10 = arrayList21;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1403779768:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList21 = arrayList10;
                            if (str23.equals("showable_impression_type")) {
                                kc kcVar = ads_mobile_sdk.y1.f11905b;
                                int iG2 = pVar.g();
                                kcVar.getClass();
                                ads_mobile_sdk.y1 y1VarA = kc.a(iG2);
                                Unit unit23 = Unit.f71706a;
                                str = str2;
                                y1Var2 = y1VarA;
                                arrayList10 = arrayList21;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList10 = arrayList21;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1360811658:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList21 = arrayList10;
                            if (str23.equals("ad_sizes")) {
                                Iterator it4 = pVar.h().iterator();
                                int i16 = 0;
                                while (it4.hasNext()) {
                                    Object next3 = it4.next();
                                    int i17 = i16 + 1;
                                    if (i16 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar4 = (com.google.gson.p) next3;
                                    Intrinsics.d(pVar4);
                                    ads_mobile_sdk.g2 g2VarM = t2.m(pVar4.j());
                                    if (g2VarM != null) {
                                        arrayList22 = arrayList14;
                                        arrayList22.add(g2VarM);
                                        Unit unit24 = Unit.f71706a;
                                    } else {
                                        arrayList22 = arrayList14;
                                    }
                                    arrayList14 = arrayList22;
                                    i16 = i17;
                                }
                                Unit unit25 = Unit.f71706a;
                                str = str2;
                                arrayList14 = arrayList14;
                                arrayList10 = arrayList21;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList10 = arrayList21;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1306015996:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList21 = arrayList10;
                            if (str23.equals("adapters")) {
                                Iterator it5 = pVar.h().iterator();
                                int i18 = 0;
                                while (it5.hasNext()) {
                                    Object next4 = it5.next();
                                    int i19 = i18 + 1;
                                    if (i18 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar5 = (com.google.gson.p) next4;
                                    Intrinsics.d(pVar5);
                                    String strO8 = pVar5.o();
                                    if (strO8 != null) {
                                        arrayList23 = arrayList13;
                                        arrayList23.add(strO8);
                                        Unit unit26 = Unit.f71706a;
                                    } else {
                                        arrayList23 = arrayList13;
                                    }
                                    arrayList13 = arrayList23;
                                    i18 = i19;
                                }
                                Unit unit27 = Unit.f71706a;
                                str = str2;
                                arrayList10 = arrayList21;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList10 = arrayList21;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1303332046:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList21 = arrayList10;
                            if (str23.equals("test_mode_enabled")) {
                                boolean zD5 = pVar.d();
                                Unit unit28 = Unit.f71706a;
                                str = str2;
                                z25 = zD5;
                                arrayList10 = arrayList21;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList10 = arrayList21;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1289032093:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList21 = arrayList10;
                            if (str23.equals("extras")) {
                                com.google.gson.r rVarJ4 = pVar.j();
                                Unit unit29 = Unit.f71706a;
                                str = str2;
                                rVar9 = rVarJ4;
                                arrayList10 = arrayList21;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                            str = str2;
                            arrayList10 = arrayList21;
                            arrayList17 = arrayList15;
                            arrayList18 = arrayList13;
                            mu0.a(new p6.d0(str23, 1));
                            Unit unit22222222222222222222222 = Unit.f71706a;
                            u8Var4 = u8Var3;
                            str2 = str;
                            arrayList13 = arrayList18;
                            arrayList15 = arrayList17;
                            v1Var3 = v1Var2;
                            ha2Var = ha2Var2;
                            arrayList30 = arrayList16;
                        case -1240082064:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList21 = arrayList10;
                            if (str23.equals("ad_event_value")) {
                                ads_mobile_sdk.o9 o9VarJ = j(pVar.j());
                                Unit unit30 = Unit.f71706a;
                                str = str2;
                                o9Var = o9VarJ;
                                arrayList10 = arrayList21;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList10 = arrayList21;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1234181075:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            arrayList21 = arrayList10;
                            if (str23.equals("allow_pub_rendered_attribution")) {
                                boolean zD6 = pVar.d();
                                Unit unit31 = Unit.f71706a;
                                str = str2;
                                z31 = zD6;
                                arrayList10 = arrayList21;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                            str = str2;
                            arrayList10 = arrayList21;
                            arrayList17 = arrayList15;
                            arrayList18 = arrayList13;
                            mu0.a(new p6.d0(str23, 1));
                            Unit unit2222222222222222222222222 = Unit.f71706a;
                            u8Var4 = u8Var3;
                            str2 = str;
                            arrayList13 = arrayList18;
                            arrayList15 = arrayList17;
                            v1Var3 = v1Var2;
                            ha2Var = ha2Var2;
                            arrayList30 = arrayList16;
                        case -1168140544:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("presentation_error_urls")) {
                                Iterator it6 = pVar.h().iterator();
                                int i21 = 0;
                                while (it6.hasNext()) {
                                    Object next5 = it6.next();
                                    int i22 = i21 + 1;
                                    if (i21 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar6 = (com.google.gson.p) next5;
                                    Intrinsics.d(pVar6);
                                    String strO9 = pVar6.o();
                                    Intrinsics.f(strO9, "getAsString(...)");
                                    Uri uri3 = Uri.parse(strO9);
                                    if (uri3 != null) {
                                        arrayList24 = arrayList10;
                                        arrayList24.add(uri3);
                                        Unit unit32 = Unit.f71706a;
                                    } else {
                                        arrayList24 = arrayList10;
                                    }
                                    arrayList10 = arrayList24;
                                    i21 = i22;
                                }
                                arrayList21 = arrayList10;
                                Unit unit33 = Unit.f71706a;
                                str = str2;
                                arrayList10 = arrayList21;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1152230954:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("ad_type")) {
                                lm.e eVar = ads_mobile_sdk.u8.f10239a;
                                String strO10 = pVar.o();
                                Intrinsics.f(strO10, "getAsString(...)");
                                String upperCase = strO10.toUpperCase(Locale.ROOT);
                                Intrinsics.f(upperCase, "toUpperCase(...)");
                                eVar.getClass();
                                ads_mobile_sdk.u8 u8VarF = lm.e.f(upperCase);
                                Unit unit34 = Unit.f71706a;
                                str = str2;
                                u8Var4 = u8VarF;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1146534047:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            ArrayList arrayList31 = arrayList8;
                            if (str23.equals("is_scroll_aware")) {
                                boolean zD7 = pVar.d();
                                Unit unit35 = Unit.f71706a;
                                str = str2;
                                z21 = zD7;
                                arrayList8 = arrayList31;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList8 = arrayList31;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1115838944:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("fill_urls")) {
                                Iterator it7 = pVar.h().iterator();
                                int i23 = 0;
                                while (it7.hasNext()) {
                                    Object next6 = it7.next();
                                    int i24 = i23 + 1;
                                    if (i23 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar7 = (com.google.gson.p) next6;
                                    Intrinsics.d(pVar7);
                                    String strO11 = pVar7.o();
                                    Intrinsics.f(strO11, "getAsString(...)");
                                    Uri uri4 = Uri.parse(strO11);
                                    if (uri4 != null) {
                                        arrayList25 = arrayList8;
                                        arrayList25.add(uri4);
                                        Unit unit36 = Unit.f71706a;
                                    } else {
                                        arrayList25 = arrayList8;
                                    }
                                    arrayList8 = arrayList25;
                                    i23 = i24;
                                }
                                Unit unit37 = Unit.f71706a;
                                str = str2;
                                arrayList8 = arrayList8;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1081936678:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("allocation_id")) {
                                String strO12 = pVar.o();
                                Intrinsics.f(strO12, "getAsString(...)");
                                Unit unit38 = Unit.f71706a;
                                str = str2;
                                str20 = strO12;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1078050970:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("video_complete_urls")) {
                                Iterator it8 = pVar.h().iterator();
                                int i25 = 0;
                                while (it8.hasNext()) {
                                    Object next7 = it8.next();
                                    int i26 = i25 + 1;
                                    if (i25 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar8 = (com.google.gson.p) next7;
                                    Intrinsics.d(pVar8);
                                    String strO13 = pVar8.o();
                                    Intrinsics.f(strO13, "getAsString(...)");
                                    Uri uri5 = Uri.parse(strO13);
                                    if (uri5 != null) {
                                        arrayList26 = arrayList7;
                                        arrayList26.add(uri5);
                                        Unit unit39 = Unit.f71706a;
                                    } else {
                                        arrayList26 = arrayList7;
                                    }
                                    arrayList7 = arrayList26;
                                    i25 = i26;
                                }
                                Unit unit40 = Unit.f71706a;
                                str = str2;
                                arrayList7 = arrayList7;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -1051269058:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("active_view")) {
                                String string = pVar.toString();
                                Intrinsics.f(string, "toString(...)");
                                Unit unit41 = Unit.f71706a;
                                str = str2;
                                str14 = string;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -982608540:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("valid_from_timestamp")) {
                                String strO14 = pVar.o();
                                Intrinsics.f(strO14, "getAsString(...)");
                                Unit unit42 = Unit.f71706a;
                                str = str2;
                                str9 = strO14;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -972056451:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("ad_source_instance_id")) {
                                String strO15 = pVar.o();
                                Intrinsics.f(strO15, "getAsString(...)");
                                Unit unit43 = Unit.f71706a;
                                str = str2;
                                str19 = strO15;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -776859333:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("click_urls")) {
                                Iterator it9 = pVar.h().iterator();
                                int i27 = 0;
                                while (it9.hasNext()) {
                                    Object next8 = it9.next();
                                    int i28 = i27 + 1;
                                    if (i27 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar9 = (com.google.gson.p) next8;
                                    Intrinsics.d(pVar9);
                                    String strO16 = pVar9.o();
                                    Intrinsics.f(strO16, "getAsString(...)");
                                    Uri uri6 = Uri.parse(strO16);
                                    if (uri6 != null) {
                                        arrayList2.add(uri6);
                                        Unit unit44 = Unit.f71706a;
                                    }
                                    i27 = i28;
                                }
                                Unit unit45 = Unit.f71706a;
                                str = str2;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -544216775:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("safe_browsing")) {
                                v03 v03VarR = t2.r(pVar.j());
                                Unit unit46 = Unit.f71706a;
                                str = str2;
                                v03Var2 = v03VarR;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -437057161:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("imp_urls")) {
                                Iterator it10 = pVar.h().iterator();
                                int i29 = 0;
                                while (it10.hasNext()) {
                                    Object next9 = it10.next();
                                    int i31 = i29 + 1;
                                    if (i29 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar10 = (com.google.gson.p) next9;
                                    Intrinsics.d(pVar10);
                                    String strO17 = pVar10.o();
                                    Intrinsics.f(strO17, "getAsString(...)");
                                    Uri uri7 = Uri.parse(strO17);
                                    if (uri7 != null) {
                                        arrayList3.add(uri7);
                                        Unit unit47 = Unit.f71706a;
                                    }
                                    i29 = i31;
                                }
                                Unit unit48 = Unit.f71706a;
                                str = str2;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -404433734:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("rtb_native_required_assets")) {
                                com.google.gson.r rVarJ5 = pVar.j();
                                Unit unit49 = Unit.f71706a;
                                str = str2;
                                rVar7 = rVarJ5;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -404326515:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("render_timeout_ms")) {
                                Duration.Companion companion = Duration.f72038b;
                                long jG = DurationKt.g(pVar.g(), DurationUnit.f72045d);
                                Unit unit50 = Unit.f71706a;
                                str = str2;
                                j12 = jG;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                            str = str2;
                            arrayList17 = arrayList15;
                            arrayList18 = arrayList13;
                            mu0.a(new p6.d0(str23, 1));
                            Unit unit222222222222222222222222222222222222222 = Unit.f71706a;
                            u8Var4 = u8Var3;
                            str2 = str;
                            arrayList13 = arrayList18;
                            arrayList15 = arrayList17;
                            v1Var3 = v1Var2;
                            ha2Var = ha2Var2;
                            arrayList30 = arrayList16;
                        case -388807511:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("content_url")) {
                                String strO18 = pVar.o();
                                Unit unit51 = Unit.f71706a;
                                str = str2;
                                str12 = strO18;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case -213449460:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("force_disable_hardware_acceleration")) {
                                boolean zD8 = pVar.d();
                                Unit unit52 = Unit.f71706a;
                                str = str2;
                                z15 = zD8;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                            str = str2;
                            arrayList17 = arrayList15;
                            arrayList18 = arrayList13;
                            mu0.a(new p6.d0(str23, 1));
                            Unit unit22222222222222222222222222222222222222222 = Unit.f71706a;
                            u8Var4 = u8Var3;
                            str2 = str;
                            arrayList13 = arrayList18;
                            arrayList15 = arrayList17;
                            v1Var3 = v1Var2;
                            ha2Var = ha2Var2;
                            arrayList30 = arrayList16;
                        case -213424028:
                            arrayList16 = arrayList30;
                            v1Var2 = v1Var3;
                            if (str23.equals("watermark")) {
                                String strO19 = pVar.o();
                                Intrinsics.f(strO19, "getAsString(...)");
                                Unit unit53 = Unit.f71706a;
                                str = str2;
                                str11 = strO19;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                            str = str2;
                            arrayList17 = arrayList15;
                            arrayList18 = arrayList13;
                            mu0.a(new p6.d0(str23, 1));
                            Unit unit222222222222222222222222222222222222222222 = Unit.f71706a;
                            u8Var4 = u8Var3;
                            str2 = str;
                            arrayList13 = arrayList18;
                            arrayList15 = arrayList17;
                            v1Var3 = v1Var2;
                            ha2Var = ha2Var2;
                            arrayList30 = arrayList16;
                        case -180214626:
                            v1Var2 = v1Var3;
                            if (str23.equals("native_required_asset_viewability")) {
                                boolean zD9 = pVar.d();
                                Unit unit54 = Unit.f71706a;
                                str = str2;
                                z13 = zD9;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 3107:
                            v1Var2 = v1Var3;
                            if (str23.equals("ad")) {
                                k61 k61VarP = t2.p(pVar.j(), p0Var);
                                com.google.gson.r rVar12 = k61VarP.f5522d;
                                boolean z32 = (rVar12 == null || (mVarE = d62.e(rVar12, "slots")) == null || mVarE.size() <= 0) ? false : true;
                                Unit unit55 = Unit.f71706a;
                                str = str2;
                                k61Var = k61VarP;
                                arrayList16 = arrayList30;
                                z27 = z32;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                            break;
                        case 3355:
                            v1Var2 = v1Var3;
                            if (str23.equals("id")) {
                                String strO20 = pVar.o();
                                Intrinsics.f(strO20, "getAsString(...)");
                                Unit unit56 = Unit.f71706a;
                                str = str2;
                                str4 = strO20;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 3076010:
                            v1Var2 = v1Var3;
                            if (str23.equals("data")) {
                                objectRef.f71863a = pVar.j();
                                Unit unit57 = Unit.f71706a;
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 37109963:
                            v1Var2 = v1Var3;
                            if (str23.equals("request_id")) {
                                String strO21 = pVar.o();
                                Intrinsics.f(strO21, "getAsString(...)");
                                Unit unit58 = Unit.f71706a;
                                str = str2;
                                str5 = strO21;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 63195984:
                            v1Var2 = v1Var3;
                            if (str23.equals("render_test_label")) {
                                boolean zD10 = pVar.d();
                                Unit unit59 = Unit.f71706a;
                                str = str2;
                                z23 = zD10;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 107433883:
                            v1Var2 = v1Var3;
                            if (str23.equals("qdata")) {
                                String strO22 = pVar.o();
                                Intrinsics.f(strO22, "getAsString(...)");
                                Unit unit60 = Unit.f71706a;
                                str = str2;
                                str6 = strO22;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 230323073:
                            v1Var2 = v1Var3;
                            if (str23.equals("ad_load_urls")) {
                                Iterator it11 = pVar.h().iterator();
                                int i32 = 0;
                                while (it11.hasNext()) {
                                    Object next10 = it11.next();
                                    int i33 = i32 + 1;
                                    if (i32 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar11 = (com.google.gson.p) next10;
                                    Intrinsics.d(pVar11);
                                    String strO23 = pVar11.o();
                                    Intrinsics.f(strO23, "getAsString(...)");
                                    Uri uri8 = Uri.parse(strO23);
                                    if (uri8 != null) {
                                        arrayList4.add(uri8);
                                        Unit unit61 = Unit.f71706a;
                                    }
                                    i32 = i33;
                                }
                                Unit unit62 = Unit.f71706a;
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 418392395:
                            v1Var2 = v1Var3;
                            if (str23.equals("is_closable_area_disabled")) {
                                boolean zD11 = pVar.d();
                                Unit unit63 = Unit.f71706a;
                                str = str2;
                                z16 = zD11;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 549176928:
                            v1Var2 = v1Var3;
                            if (str23.equals("presentation_error_timeout_ms")) {
                                Duration.Companion companion2 = Duration.f72038b;
                                long jG2 = DurationKt.g(pVar.g(), DurationUnit.f72045d);
                                Unit unit64 = Unit.f71706a;
                                str = str2;
                                j11 = jG2;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 597473788:
                            v1Var2 = v1Var3;
                            if (str23.equals("debug_dialog_string")) {
                                String strO24 = pVar.o();
                                Intrinsics.f(strO24, "getAsString(...)");
                                Unit unit65 = Unit.f71706a;
                                str = str2;
                                str3 = strO24;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 639133141:
                            v1Var2 = v1Var3;
                            if (str23.equals("response_info_extras_override")) {
                                com.google.gson.r rVarA = d62.a(pVar);
                                if (rVarA == null) {
                                    rVarA = new com.google.gson.r();
                                }
                                Unit unit66 = Unit.f71706a;
                                str = str2;
                                rVar11 = rVarA;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 754887508:
                            v1Var2 = v1Var3;
                            if (str23.equals("container_sizes")) {
                                Iterator it12 = pVar.h().iterator();
                                int i34 = 0;
                                while (it12.hasNext()) {
                                    Object next11 = it12.next();
                                    int i35 = i34 + 1;
                                    if (i34 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar12 = (com.google.gson.p) next11;
                                    Intrinsics.d(pVar12);
                                    ads_mobile_sdk.g2 g2VarM2 = t2.m(pVar12.j());
                                    if (g2VarM2 != null) {
                                        arrayList12.add(g2VarM2);
                                        Unit unit67 = Unit.f71706a;
                                    }
                                    i34 = i35;
                                }
                                Unit unit68 = Unit.f71706a;
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 791122864:
                            v1Var2 = v1Var3;
                            if (str23.equals("impression_type")) {
                                hb hbVar = ads_mobile_sdk.v1.f10541b;
                                int iG3 = pVar.g();
                                hbVar.getClass();
                                ads_mobile_sdk.v1 v1VarB = hb.b(iG3);
                                Unit unit69 = Unit.f71706a;
                                str = str2;
                                v1Var2 = v1VarB;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 805095541:
                            v1Var2 = v1Var3;
                            if (str23.equals("analytics_event_name_to_parameters_map")) {
                                Bundle bundleB = d62.b(pVar.j());
                                Unit unit70 = Unit.f71706a;
                                str = str2;
                                bundle2 = bundleB;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1010584092:
                            v1Var2 = v1Var3;
                            if (str23.equals("transaction_id")) {
                                String strO25 = pVar.o();
                                Intrinsics.f(strO25, "getAsString(...)");
                                Unit unit71 = Unit.f71706a;
                                str = str2;
                                str8 = strO25;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1100650276:
                            v1Var2 = v1Var3;
                            if (str23.equals("rewards")) {
                                Intrinsics.d(pVar);
                                sx2 sx2VarD = fb.d(pVar);
                                Unit unit72 = Unit.f71706a;
                                str = str2;
                                sx2Var = sx2VarD;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1141602460:
                            v1Var2 = v1Var3;
                            if (str23.equals("adapter_response_info_key")) {
                                String strO26 = pVar.o();
                                Intrinsics.f(strO26, "getAsString(...)");
                                Unit unit73 = Unit.f71706a;
                                str = str2;
                                str15 = strO26;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1186014765:
                            v1Var2 = v1Var3;
                            if (str23.equals("cache_hit_urls")) {
                                Iterator it13 = pVar.h().iterator();
                                int i36 = 0;
                                while (it13.hasNext()) {
                                    Object next12 = it13.next();
                                    int i37 = i36 + 1;
                                    if (i36 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar13 = (com.google.gson.p) next12;
                                    Intrinsics.d(pVar13);
                                    String strO27 = pVar13.o();
                                    Intrinsics.f(strO27, "getAsString(...)");
                                    Uri uri9 = Uri.parse(strO27);
                                    if (uri9 != null) {
                                        arrayList30.add(uri9);
                                        Unit unit74 = Unit.f71706a;
                                    }
                                    i36 = i37;
                                }
                                Unit unit75 = Unit.f71706a;
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1303622534:
                            v1Var2 = v1Var3;
                            if (str23.equals("preload_sort_value")) {
                                double dE2 = pVar.e();
                                Unit unit76 = Unit.f71706a;
                                str = str2;
                                d5 = dE2;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1321720943:
                            v1Var2 = v1Var3;
                            if (str23.equals("allow_pub_owned_ad_view")) {
                                boolean zD12 = pVar.d();
                                Unit unit77 = Unit.f71706a;
                                str = str2;
                                z11 = zD12;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1364100807:
                            v1Var2 = v1Var3;
                            if (str23.equals("recursive_request_parameters")) {
                                com.google.gson.r rVarJ6 = pVar.j();
                                Unit unit78 = Unit.f71706a;
                                str = str2;
                                rVar10 = rVarJ6;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1422388341:
                            v1Var2 = v1Var3;
                            if (str23.equals("is_collapsible")) {
                                boolean zD13 = pVar.d();
                                Unit unit79 = Unit.f71706a;
                                str = str2;
                                z17 = zD13;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1437255331:
                            v1Var2 = v1Var3;
                            if (str23.equals("ad_source_id")) {
                                String strO28 = pVar.o();
                                Intrinsics.f(strO28, "getAsString(...)");
                                Unit unit80 = Unit.f71706a;
                                str = str2;
                                str17 = strO28;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1556932485:
                            v1Var2 = v1Var3;
                            if (str23.equals("post_click_lifecycle_monitoring_duration_ms")) {
                                Duration.Companion companion3 = Duration.f72038b;
                                long jG3 = DurationKt.g(pVar.g(), DurationUnit.f72045d);
                                Unit unit81 = Unit.f71706a;
                                str = str2;
                                j13 = jG3;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1565514205:
                            v1Var2 = v1Var3;
                            if (str23.equals("adapter_only_third_party_impression")) {
                                boolean zD14 = pVar.d();
                                Unit unit82 = Unit.f71706a;
                                str = str2;
                                z29 = zD14;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1637553475:
                            v1Var2 = v1Var3;
                            if (str23.equals("bid_response")) {
                                String strO29 = pVar.o();
                                Intrinsics.f(strO29, "getAsString(...)");
                                Unit unit83 = Unit.f71706a;
                                str = str2;
                                str21 = strO29;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1638957285:
                            v1Var2 = v1Var3;
                            if (str23.equals("video_start_urls")) {
                                Iterator it14 = pVar.h().iterator();
                                int i38 = 0;
                                while (it14.hasNext()) {
                                    Object next13 = it14.next();
                                    int i39 = i38 + 1;
                                    if (i38 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar14 = (com.google.gson.p) next13;
                                    Intrinsics.d(pVar14);
                                    String strO30 = pVar14.o();
                                    Intrinsics.f(strO30, "getAsString(...)");
                                    Uri uri10 = Uri.parse(strO30);
                                    if (uri10 != null) {
                                        arrayList5.add(uri10);
                                        Unit unit84 = Unit.f71706a;
                                    }
                                    i38 = i39;
                                }
                                Unit unit85 = Unit.f71706a;
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1686319423:
                            v1Var2 = v1Var3;
                            if (str23.equals("ad_network_class_name")) {
                                String strO31 = pVar.o();
                                Intrinsics.f(strO31, "getAsString(...)");
                                Unit unit86 = Unit.f71706a;
                                str = str2;
                                str16 = strO31;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1688341040:
                            v1Var2 = v1Var3;
                            if (str23.equals("video_reward_urls")) {
                                Iterator it15 = pVar.h().iterator();
                                int i40 = 0;
                                while (it15.hasNext()) {
                                    Object next14 = it15.next();
                                    int i41 = i40 + 1;
                                    if (i40 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar15 = (com.google.gson.p) next14;
                                    Intrinsics.d(pVar15);
                                    String strO32 = pVar15.o();
                                    Intrinsics.f(strO32, "getAsString(...)");
                                    Uri uri11 = Uri.parse(strO32);
                                    if (uri11 != null) {
                                        arrayList6.add(uri11);
                                        Unit unit87 = Unit.f71706a;
                                    }
                                    i40 = i41;
                                }
                                Unit unit88 = Unit.f71706a;
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1799285870:
                            v1Var2 = v1Var3;
                            if (str23.equals("use_third_party_container_height")) {
                                boolean zD15 = pVar.d();
                                Unit unit89 = Unit.f71706a;
                                str = str2;
                                z26 = zD15;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit2222222222222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1839650832:
                            v1Var2 = v1Var3;
                            if (str23.equals("renderers")) {
                                Iterator it16 = pVar.h().iterator();
                                int i42 = 0;
                                while (it16.hasNext()) {
                                    Object next15 = it16.next();
                                    int i43 = i42 + 1;
                                    if (i42 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar16 = (com.google.gson.p) next15;
                                    Intrinsics.d(pVar16);
                                    String strO33 = pVar16.o();
                                    if (strO33 != null) {
                                        arrayList.add(strO33);
                                        Unit unit90 = Unit.f71706a;
                                    }
                                    i42 = i43;
                                }
                                Unit unit91 = Unit.f71706a;
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 1875425491:
                            v1Var2 = v1Var3;
                            if (str23.equals("is_analytics_logging_enabled")) {
                                boolean zD16 = pVar.d();
                                Unit unit93 = Unit.f71706a;
                                str = str2;
                                z24 = zD16;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit222222222222222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 2004337096:
                            v1Var2 = v1Var3;
                            if (str23.equals("recursive_signal_collection")) {
                                com.google.gson.m mVarH = pVar.h();
                                Unit unit94 = Unit.f71706a;
                                str = str2;
                                mVar = mVarH;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                            str = str2;
                            arrayList16 = arrayList30;
                            arrayList17 = arrayList15;
                            arrayList18 = arrayList13;
                            mu0.a(new p6.d0(str23, 1));
                            Unit unit2222222222222222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                            u8Var4 = u8Var3;
                            str2 = str;
                            arrayList13 = arrayList18;
                            arrayList15 = arrayList17;
                            v1Var3 = v1Var2;
                            ha2Var = ha2Var2;
                            arrayList30 = arrayList16;
                        case 2068142375:
                            v1Var2 = v1Var3;
                            if (str23.equals("rule_line_external_id")) {
                                String strO34 = pVar.o();
                                Intrinsics.f(strO34, "getAsString(...)");
                                Unit unit95 = Unit.f71706a;
                                str = str2;
                                str10 = strO34;
                                arrayList16 = arrayList30;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            } else {
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                mu0.a(new p6.d0(str23, 1));
                                Unit unit22222222222222222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 2072888499:
                            v1Var2 = v1Var3;
                            if (str23.equals("manual_tracking_urls")) {
                                Iterator it17 = pVar.h().iterator();
                                int i44 = 0;
                                while (it17.hasNext()) {
                                    Object next16 = it17.next();
                                    int i45 = i44 + 1;
                                    if (i44 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar17 = (com.google.gson.p) next16;
                                    Intrinsics.d(pVar17);
                                    String strO35 = pVar17.o();
                                    Intrinsics.f(strO35, "getAsString(...)");
                                    Uri uri12 = Uri.parse(strO35);
                                    if (uri12 != null) {
                                        arrayList11.add(uri12);
                                        Unit unit96 = Unit.f71706a;
                                    }
                                    i44 = i45;
                                }
                                Unit unit97 = Unit.f71706a;
                                str = str2;
                                arrayList16 = arrayList30;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                u8Var4 = u8Var3;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                            str = str2;
                            arrayList16 = arrayList30;
                            arrayList17 = arrayList15;
                            arrayList18 = arrayList13;
                            mu0.a(new p6.d0(str23, 1));
                            Unit unit222222222222222222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                            u8Var4 = u8Var3;
                            str2 = str;
                            arrayList13 = arrayList18;
                            arrayList15 = arrayList17;
                            v1Var3 = v1Var2;
                            ha2Var = ha2Var2;
                            arrayList30 = arrayList16;
                        case 2075506442:
                            if (!str23.equals("render_serially")) {
                                str = str2;
                                break;
                            } else {
                                boolean zD17 = pVar.d();
                                Unit unit98 = Unit.f71706a;
                                str = str2;
                                z22 = zD17;
                                arrayList16 = arrayList30;
                                v1Var2 = v1Var3;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        case 2117205836:
                            if (!str23.equals("flow_control")) {
                                str = str2;
                                break;
                            } else {
                                boolean zD18 = pVar.d();
                                Unit unit99 = Unit.f71706a;
                                str = str2;
                                z28 = zD18;
                                arrayList16 = arrayList30;
                                v1Var2 = v1Var3;
                                u8Var4 = u8Var3;
                                arrayList17 = arrayList15;
                                arrayList18 = arrayList13;
                                str2 = str;
                                arrayList13 = arrayList18;
                                arrayList15 = arrayList17;
                                v1Var3 = v1Var2;
                                ha2Var = ha2Var2;
                                arrayList30 = arrayList16;
                            }
                        default:
                            str = str2;
                            break;
                    }
                } else {
                    str = str2;
                    u8Var3 = u8Var4;
                }
                arrayList16 = arrayList30;
                v1Var2 = v1Var3;
                arrayList17 = arrayList15;
                arrayList18 = arrayList13;
                mu0.a(new p6.d0(str23, 1));
                Unit unit2222222222222222222222222222222222222222222222222222222222222222222222222222222 = Unit.f71706a;
                u8Var4 = u8Var3;
                str2 = str;
                arrayList13 = arrayList18;
                arrayList15 = arrayList17;
                v1Var3 = v1Var2;
                ha2Var = ha2Var2;
                arrayList30 = arrayList16;
            }
            ads_mobile_sdk.u8 u8Var5 = u8Var4;
            ArrayList arrayList32 = arrayList30;
            ads_mobile_sdk.v1 v1Var4 = v1Var3;
            ArrayList arrayList33 = arrayList15;
            ArrayList arrayList34 = arrayList13;
            if (v1Var4 != ads_mobile_sdk.v1.f10545f) {
                u8Var2 = u8Var5;
                if (u8Var2 == ads_mobile_sdk.u8.f10241c && z29) {
                }
                ads_mobile_sdk.y1 y1Var3 = y1Var2;
                arrayList34.replaceAll(new UnaryOperator() { // from class: b.pa
                    @Override // java.util.function.Function
                    public final Object apply(Object obj) {
                        String it18 = (String) obj;
                        Ref.ObjectRef adapterData = objectRef;
                        Intrinsics.g(adapterData, "$adapterData");
                        Intrinsics.g(it18, "it");
                        List list2 = ads_mobile_sdk.z1.D0;
                        return k9.t((com.google.gson.r) adapterData.f71863a, it18);
                    }
                });
                com.google.gson.r rVar13 = (com.google.gson.r) objectRef.f71863a;
                Intrinsics.d(bundle2);
                return new ads_mobile_sdk.z1(str14, arrayList34, rVar13, str15, arrayList4, str16, arrayList14, str22, str17, str18, str19, u8Var2, o9Var, str20, z11, z31, bundle2, str21, z12, arrayList32, z13, arrayList2, i5, str12, arrayList12, str3, rVar8, z14, rVar9, arrayList8, z15, str4, v1Var4, arrayList3, k61Var, str5, i11, z16, z17, z18, z19, z21, arrayList11, arrayList9, q82Var2, str13, arrayList33, j11, arrayList10, str6, rVar10, mVar, arrayList, z22, z23, j12, str7, arrayList6, str8, str9, arrayList7, arrayList5, sx2Var, rVar7, str10, v03Var2, z24, y1Var3, z25, z26, str11, e42Var, cd3Var, ug2Var, u22Var2, d5, il2Var2, z27, z28, j13, rVar11);
            }
            u8Var2 = u8Var5;
            y1Var2 = ads_mobile_sdk.y1.f11910g;
            ads_mobile_sdk.y1 y1Var32 = y1Var2;
            arrayList34.replaceAll(new UnaryOperator() { // from class: b.pa
                @Override // java.util.function.Function
                public final Object apply(Object obj) {
                    String it18 = (String) obj;
                    Ref.ObjectRef adapterData = objectRef;
                    Intrinsics.g(adapterData, "$adapterData");
                    Intrinsics.g(it18, "it");
                    List list2 = ads_mobile_sdk.z1.D0;
                    return k9.t((com.google.gson.r) adapterData.f71863a, it18);
                }
            });
            com.google.gson.r rVar132 = (com.google.gson.r) objectRef.f71863a;
            Intrinsics.d(bundle2);
            return new ads_mobile_sdk.z1(str14, arrayList34, rVar132, str15, arrayList4, str16, arrayList14, str22, str17, str18, str19, u8Var2, o9Var, str20, z11, z31, bundle2, str21, z12, arrayList32, z13, arrayList2, i5, str12, arrayList12, str3, rVar8, z14, rVar9, arrayList8, z15, str4, v1Var4, arrayList3, k61Var, str5, i11, z16, z17, z18, z19, z21, arrayList11, arrayList9, q82Var2, str13, arrayList33, j11, arrayList10, str6, rVar10, mVar, arrayList, z22, z23, j12, str7, arrayList6, str8, str9, arrayList7, arrayList5, sx2Var, rVar7, str10, v03Var2, z24, y1Var32, z25, z26, str11, e42Var, cd3Var, ug2Var, u22Var2, d5, il2Var2, z27, z28, j13, rVar11);
        } catch (Exception e11) {
            e = e11;
            ArrayList arrayList35 = e(e, e).f1803s;
            String message = e.getMessage();
            if (message == null) {
                message = e.getClass().getName();
            }
            arrayList35.add(message);
            return z1Var;
        }
    }

    public static Pair l(RandomAccessFile randomAccessFile, int i5) throws IOException {
        int i11;
        if (i5 < 0 || i5 > 65535) {
            throw new IllegalArgumentException(ed.i("maxCommentSize: ", i5));
        }
        long length = randomAccessFile.length();
        if (length < 22) {
            return null;
        }
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(((int) Math.min(i5, length - 22)) + 22);
        ByteOrder byteOrder = ByteOrder.LITTLE_ENDIAN;
        byteBufferAllocate.order(byteOrder);
        long jCapacity = length - byteBufferAllocate.capacity();
        randomAccessFile.seek(jCapacity);
        randomAccessFile.readFully(byteBufferAllocate.array(), byteBufferAllocate.arrayOffset(), byteBufferAllocate.capacity());
        if (byteBufferAllocate.order() != byteOrder) {
            throw new IllegalArgumentException("ByteBuffer byte order must be little endian");
        }
        int iCapacity = byteBufferAllocate.capacity();
        if (iCapacity < 22) {
            i11 = -1;
        } else {
            int i12 = iCapacity - 22;
            int iMin = Math.min(i12, 65535);
            for (int i13 = 0; i13 < iMin; i13++) {
                i11 = i12 - i13;
                if (byteBufferAllocate.getInt(i11) == 101010256 && (byteBufferAllocate.getShort(i11 + 20) & 65535) == i13) {
                    break;
                }
            }
            i11 = -1;
        }
        if (i11 == -1) {
            return null;
        }
        byteBufferAllocate.position(i11);
        ByteBuffer byteBufferSlice = byteBufferAllocate.slice();
        byteBufferSlice.order(ByteOrder.LITTLE_ENDIAN);
        return Pair.create(byteBufferSlice, Long.valueOf(jCapacity + i11));
    }

    public static final w6 m(w6 w6Var, ni.k adRequest, qw2 qw2Var, String requestId, c71 inspectorAdLifecycleMonitorFactory, jr0 flags) {
        Intrinsics.g(adRequest, "adRequest");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(inspectorAdLifecycleMonitorFactory, "inspectorAdLifecycleMonitorFactory");
        Intrinsics.g(flags, "flags");
        Optional optionalOf = Optional.of(adRequest);
        Intrinsics.f(optionalOf, "of(...)");
        Optional optionalEmpty = Optional.empty();
        Intrinsics.f(optionalEmpty, "empty(...)");
        return (w6) ((w6) ((w6) ((w6) ((w6) ((w6) ((w6) ((w6) ((w6) ((w6) w6Var.a(adRequest)).a(qw2Var)).a(new ur2())).a(new fh1())).a(new b71(inspectorAdLifecycleMonitorFactory.f1702a, qw2Var, optionalOf, requestId, false, inspectorAdLifecycleMonitorFactory.f1703b, inspectorAdLifecycleMonitorFactory.f1704c, inspectorAdLifecycleMonitorFactory.f1705d, optionalEmpty))).a(false)).a(new ts2())).b(false)).c(true)).a(new ads_mobile_sdk.i8(flags));
    }

    public static e9 n(e9 e9Var) {
        return e9Var.a(e9Var.size() * 2);
    }

    public static final com.google.gson.r o(x80.h0 h0Var) {
        com.google.gson.r rVar = new com.google.gson.r();
        com.google.gson.r rVar2 = new com.google.gson.r();
        rVar2.s("uri", h0Var.f95509a.f95633i);
        rVar2.s("verb", h0Var.f95510b);
        Unit unit = Unit.f71706a;
        rVar.p("firstline", rVar2);
        x80.u uVar = h0Var.f95511c;
        if (uVar.size() > 0) {
            com.google.gson.m mVar = new com.google.gson.m();
            Iterator it = uVar.iterator();
            while (true) {
                b70.a aVar = (b70.a) it;
                if (!aVar.hasNext()) {
                    break;
                }
                kotlin.Pair pair = (kotlin.Pair) aVar.next();
                com.google.gson.r rVar3 = new com.google.gson.r();
                rVar3.s(PendingUpgradeStore.KEY_NAME, (String) pair.f71683a);
                rVar3.s("value", (String) pair.f71684b);
                mVar.p(rVar3);
            }
            Unit unit2 = Unit.f71706a;
            rVar.p("headers", mVar);
        }
        x80.k0 k0Var = h0Var.f95512d;
        if (k0Var != null) {
            byte[] bytes = k0Var.toString().getBytes(Charsets.f72000b);
            Intrinsics.f(bytes, "getBytes(...)");
            rVar.s("body", Base64.encodeToString(bytes, 0));
        }
        return rVar;
    }

    public static File p(String str, File file, String str2) {
        File file2 = null;
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return null;
        }
        if (!TextUtils.isEmpty(str)) {
            file2 = new File(file, str);
            z(file2, false);
        }
        return new File(file2, str2);
    }

    public static Integer q(jr0 jr0Var, String str, int i5) {
        jr0Var.getClass();
        return Integer.valueOf(i5);
    }

    public static /* synthetic */ String r(int i5) {
        if (i5 == 1) {
            return "ctv";
        }
        if (i5 == 2) {
            return "mobile";
        }
        if (i5 == 3) {
            return InneractiveMediationNameConsts.OTHER;
        }
        throw null;
    }

    public static String s(ads_mobile_sdk.z1 z1Var, km0 fillStatus, long j11, Integer num) {
        Intrinsics.g(fillStatus, "fillStatus");
        if (z1Var == null) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String str = z1Var.f12392m0;
        String strM = z1Var.n + "." + fillStatus.f5791a + "." + Duration.h(j11);
        if (str.length() > 0) {
            strM = u4.m(strM, ".", str);
            if (num != null) {
                return strM + "." + num;
            }
        }
        return strM;
    }

    public static String t(com.google.gson.r adapterData, String className) {
        Intrinsics.g(className, "className");
        Intrinsics.g(adapterData, "adapterData");
        if (ads_mobile_sdk.z1.D0.contains(className)) {
            try {
                String strO = adapterData.v(TTEDPEventConstants.EDP_EVENT_PROPERTY_CLASS_NAME).o();
                Intrinsics.f(strO, "getAsString(...)");
                return strO;
            } catch (Exception unused) {
            }
        }
        return className;
    }

    public static zk.d u(boolean z11) {
        if (!z11) {
            return zk.d.f98547d;
        }
        zk.c cVar = zk.d.f98548e;
        return cVar.f98551b == null ? cVar : cVar.g(cVar.f98550a, null);
    }

    public static void v() {
        hq hqVar = gq.f4020a;
    }

    public static final void w(mv0 mv0Var, mi3 traceMetaSet) {
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        ur2 ur2Var = traceMetaSet.f7224a;
        String value = ur2Var.f10461a;
        Intrinsics.g(value, "value");
        c4 c4Var = mv0Var.f7336a;
        c4Var.b();
        ((kv0) c4Var.f1095b).s(value);
        String value2 = ur2Var.f10462b;
        Intrinsics.g(value2, "value");
        c4Var.b();
        ((kv0) c4Var.f1095b).c(value2);
        String value3 = ur2Var.f10467g;
        Intrinsics.g(value3, "value");
        c4Var.b();
        ((kv0) c4Var.f1095b).r(value3);
        String str = traceMetaSet.f7225b.f3352b;
        c4Var.b();
        ((kv0) c4Var.f1095b).l(str);
        String value4 = traceMetaSet.f7226c.f10107d;
        Intrinsics.g(value4, "value");
        c4Var.b();
        ((kv0) c4Var.f1095b).m(value4);
        String value5 = traceMetaSet.f7226c.f10108e;
        Intrinsics.g(value5, "value");
        c4Var.b();
        ((kv0) c4Var.f1095b).n(value5);
        int i5 = traceMetaSet.f7225b.f3355e;
        c4Var.b();
        ((kv0) c4Var.f1095b).mediationChainLength_ = i5;
        String str2 = traceMetaSet.f7227d.f9459c;
        c4Var.b();
        ((kv0) c4Var.f1095b).h(str2);
        String value6 = traceMetaSet.f7227d.f9458b;
        Intrinsics.g(value6, "value");
        c4Var.b();
        ((kv0) c4Var.f1095b).b(value6);
        lm1 lm1VarH = h(ur2Var.f10463c);
        c4Var.b();
        kv0 kv0Var = (kv0) c4Var.f1095b;
        kv0Var.getClass();
        kv0Var.format_ = lm1VarH.getNumber();
    }

    public static void x(Uri uri) {
        try {
            String queryParameter = uri.getQueryParameter("method");
            if (TextUtils.isEmpty(queryParameter)) {
                uri.toString();
                return;
            }
            if (queryParameter.hashCode() == -1407254715 && queryParameter.equals("attest")) {
                HashMap map = new HashMap();
                for (String str : uri.getQueryParameterNames()) {
                    map.put(str, uri.getQueryParameter(str));
                }
                try {
                    t2.D(ib1.f4719b.f4720a.getApplicationContext(), (String) map.get("mechanism"), new ads_mobile_sdk.c7(map));
                } catch (Exception e3) {
                    Log.e("OMIDLIB", "Error processing attestation request in OmidNativeUrlHandler", e3);
                }
            }
        } catch (Exception e11) {
            Log.e("OMIDLIB", "OmidNativeUrlHandler failed to handle url [" + uri.toString() + "]", e11);
        }
    }

    public static void y(m5 m5Var) {
        m5Var.getClass();
    }

    public static void z(File file, boolean z11) {
        if (z11 && file.exists() && !file.isDirectory()) {
            file.delete();
        }
        if (file.exists()) {
            return;
        }
        file.mkdirs();
    }

    public static int b(String str, byte[] bArr, int i5, int i11) {
        byte[] bytes = str.getBytes(StandardCharsets.UTF_8);
        if (bytes.length - i5 > i11) {
            throw new ArrayIndexOutOfBoundsException("Not enough space in output buffer to encode UTF-8 string");
        }
        System.arraycopy(bytes, 0, bArr, i5, bytes.length);
        return i5 + bytes.length;
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x0033, code lost:
    
        if (r2 < r0) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0035, code lost:
    
        return r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0048, code lost:
    
        throw new java.lang.IllegalArgumentException(b.u4.g(r2 + 4294967296L, "UTF-8 length does not fit in int: "));
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public int a(String str) {
        int length = str.length();
        int i5 = 0;
        while (i5 < length && str.charAt(i5) < 128) {
            i5++;
        }
        int iA = length;
        while (true) {
            if (i5 >= length) {
                break;
            }
            char cCharAt = str.charAt(i5);
            if (cCharAt >= 2048) {
                try {
                    iA += vn3.a(str, i5);
                    break;
                } catch (un3 unused) {
                    return str.getBytes(StandardCharsets.UTF_8).length;
                }
            }
            iA += (127 - cCharAt) >>> 31;
            i5++;
        }
    }

    public final int a(String str, byte[] bArr, int i5, int i11) {
        int i12;
        int i13;
        char cCharAt;
        switch (this.f15911b) {
            case 0:
                int length = str.length();
                int i14 = i5 + i11;
                int i15 = 0;
                while (i15 < length && (i13 = i15 + i5) < i14 && (cCharAt = str.charAt(i15)) < 128) {
                    bArr[i13] = (byte) cCharAt;
                    i15++;
                }
                if (i15 == length) {
                    return i5 + length;
                }
                int i16 = i5 + i15;
                while (i15 < length) {
                    char cCharAt2 = str.charAt(i15);
                    if (cCharAt2 < 128 && i16 < i14) {
                        bArr[i16] = (byte) cCharAt2;
                        i16++;
                    } else if (cCharAt2 < 2048 && i16 <= i14 - 2) {
                        int i17 = i16 + 1;
                        bArr[i16] = (byte) ((cCharAt2 >>> 6) | 960);
                        i16 += 2;
                        bArr[i17] = (byte) ((cCharAt2 & '?') | 128);
                    } else {
                        if ((cCharAt2 >= 55296 && 57343 >= cCharAt2) || i16 > i14 - 3) {
                            if (i16 <= i14 - 4) {
                                i15++;
                                if (i15 != str.length()) {
                                    char cCharAt3 = str.charAt(i15);
                                    if (Character.isSurrogatePair(cCharAt2, cCharAt3)) {
                                        int codePoint = Character.toCodePoint(cCharAt2, cCharAt3);
                                        bArr[i16] = (byte) ((codePoint >>> 18) | 240);
                                        bArr[i16 + 1] = (byte) (((codePoint >>> 12) & 63) | 128);
                                        int i18 = i16 + 3;
                                        bArr[i16 + 2] = (byte) (((codePoint >>> 6) & 63) | 128);
                                        i16 += 4;
                                        bArr[i18] = (byte) ((codePoint & 63) | 128);
                                    }
                                }
                                return b(str, bArr, i5, i11);
                            }
                            if (55296 <= cCharAt2 && cCharAt2 <= 57343 && ((i12 = i15 + 1) == str.length() || !Character.isSurrogatePair(cCharAt2, str.charAt(i12)))) {
                                return b(str, bArr, i5, i11);
                            }
                            throw new ArrayIndexOutOfBoundsException("Not enough space in output buffer to encode UTF-8 string");
                        }
                        bArr[i16] = (byte) ((cCharAt2 >>> '\f') | 480);
                        int i19 = i16 + 2;
                        bArr[i16 + 1] = (byte) (((cCharAt2 >>> 6) & 63) | 128);
                        i16 += 3;
                        bArr[i19] = (byte) ((cCharAt2 & '?') | 128);
                    }
                    i15++;
                }
                return i16;
            default:
                return b(str, bArr, i5, i11);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x004d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String a(byte[] bArr, int i5, int i11) {
        switch (this.f15911b) {
            case 0:
                if ((i5 | i11 | ((bArr.length - i5) - i11)) >= 0) {
                    int i12 = i5 + i11;
                    char[] cArr = new char[i11];
                    int i13 = 0;
                    while (i5 < i12) {
                        byte b11 = bArr[i5];
                        if (b11 >= 0) {
                            i5++;
                            cArr[i13] = (char) b11;
                            i13++;
                        } else {
                            while (i5 < i12) {
                                int i14 = i5 + 1;
                                byte b12 = bArr[i5];
                                if (b12 >= 0) {
                                    cArr[i13] = (char) b12;
                                    i13++;
                                    i5 = i14;
                                    while (i5 < i12) {
                                        byte b13 = bArr[i5];
                                        if (b13 >= 0) {
                                            i5++;
                                            cArr[i13] = (char) b13;
                                            i13++;
                                        }
                                    }
                                } else if (b12 < -32) {
                                    if (i14 < i12) {
                                        i5 += 2;
                                        byte b14 = bArr[i14];
                                        int i15 = i13 + 1;
                                        if (b12 >= -62 && !C(b14)) {
                                            cArr[i13] = (char) ((b14 & 63) | ((b12 & 31) << 6));
                                            i13 = i15;
                                        } else {
                                            throw new yi1("Protocol message had invalid UTF-8.");
                                        }
                                    } else {
                                        throw new yi1("Protocol message had invalid UTF-8.");
                                    }
                                } else {
                                    if (b12 >= -16) {
                                        if (i14 < i12 - 2) {
                                            byte b15 = bArr[i14];
                                            int i16 = i5 + 3;
                                            byte b16 = bArr[i5 + 2];
                                            i5 += 4;
                                            byte b17 = bArr[i16];
                                            int i17 = i13 + 1;
                                            if (!C(b15)) {
                                                if ((((b15 + 112) + (b12 << 28)) >> 30) == 0 && !C(b16) && !C(b17)) {
                                                    int i18 = ((b15 & 63) << 12) | ((b12 & 7) << 18) | ((b16 & 63) << 6) | (b17 & 63);
                                                    cArr[i13] = (char) ((i18 >>> 10) + 55232);
                                                    cArr[i17] = (char) ((i18 & 1023) + 56320);
                                                    i13 += 2;
                                                }
                                            }
                                            throw new yi1("Protocol message had invalid UTF-8.");
                                        }
                                        throw new yi1("Protocol message had invalid UTF-8.");
                                    }
                                    if (i14 < i12 - 1) {
                                        int i19 = i5 + 2;
                                        byte b18 = bArr[i14];
                                        i5 += 3;
                                        byte b19 = bArr[i19];
                                        int i21 = i13 + 1;
                                        if (!C(b18) && ((b12 != -32 || b18 >= -96) && ((b12 != -19 || b18 < -96) && !C(b19)))) {
                                            cArr[i13] = (char) (((b18 & 63) << 6) | ((b12 & 15) << 12) | (b19 & 63));
                                            i13 = i21;
                                        } else {
                                            throw new yi1("Protocol message had invalid UTF-8.");
                                        }
                                    } else {
                                        throw new yi1("Protocol message had invalid UTF-8.");
                                    }
                                }
                            }
                            return new String(cArr, 0, i13);
                        }
                    }
                    while (i5 < i12) {
                    }
                    return new String(cArr, 0, i13);
                }
                throw new ArrayIndexOutOfBoundsException(String.format("buffer length=%d, index=%d, size=%d", Integer.valueOf(bArr.length), Integer.valueOf(i5), Integer.valueOf(i11)));
            default:
                Charset charset = StandardCharsets.UTF_8;
                String str = new String(bArr, i5, i11, charset);
                if (str.indexOf(65533) >= 0 && !Arrays.equals(str.getBytes(charset), Arrays.copyOfRange(bArr, i5, i11 + i5))) {
                    throw new yi1("Protocol message had invalid UTF-8.");
                }
                return str;
        }
    }
}
