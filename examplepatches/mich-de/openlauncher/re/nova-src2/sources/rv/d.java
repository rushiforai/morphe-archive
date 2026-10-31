package rv;

import android.content.Context;
import android.content.pm.PackageManager;
import android.media.AudioManager;
import android.os.Build;
import android.os.LocaleList;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import android.webkit.WebSettings;
import b.c0;
import b.u4;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.android.gms.internal.measurement.ag;
import com.stripe.android.stripe3ds2.init.AppInfo;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.TimeZone;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.collections.MapsKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;

/* loaded from: classes4.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final ag f86400a;

    /* renamed from: b, reason: collision with root package name */
    public final wv.l f86401b;

    /* renamed from: c, reason: collision with root package name */
    public final DisplayMetrics f86402c;

    /* renamed from: d, reason: collision with root package name */
    public final String f86403d;

    /* renamed from: e, reason: collision with root package name */
    public final TelephonyManager f86404e;

    /* renamed from: f, reason: collision with root package name */
    public final int f86405f;

    /* renamed from: g, reason: collision with root package name */
    public final AudioManager f86406g;

    /* renamed from: h, reason: collision with root package name */
    public final PackageManager f86407h;

    /* renamed from: i, reason: collision with root package name */
    public final int f86408i;

    /* renamed from: j, reason: collision with root package name */
    public final String f86409j;

    /* renamed from: k, reason: collision with root package name */
    public final String f86410k;

    /* renamed from: l, reason: collision with root package name */
    public final int f86411l;

    public d(Context context, ag agVar, wv.l lVar) throws IllegalAccessException, SecurityException, IllegalArgumentException {
        String name;
        int i5;
        this.f86400a = agVar;
        this.f86401b = lVar;
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics, "getDisplayMetrics(...)");
        this.f86402c = displayMetrics;
        this.f86403d = WebSettings.getDefaultUserAgent(context);
        Object systemService = context.getSystemService("phone");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.telephony.TelephonyManager");
        this.f86404e = (TelephonyManager) systemService;
        int i11 = 0;
        this.f86405f = Settings.Secure.getInt(context.getContentResolver(), "secure_frp_mode", 0);
        Object systemService2 = context.getSystemService("audio");
        Intrinsics.e(systemService2, "null cannot be cast to non-null type android.media.AudioManager");
        this.f86406g = (AudioManager) systemService2;
        this.f86407h = context.getPackageManager();
        this.f86408i = Build.VERSION.SDK_INT;
        this.f86409j = new SimpleDateFormat("yyyyMMddHHmmss", Locale.getDefault()).format(Calendar.getInstance().getTime());
        Field[] fields = Build.VERSION_CODES.class.getFields();
        Intrinsics.f(fields, "getFields(...)");
        int length = fields.length;
        while (true) {
            if (i11 >= length) {
                name = null;
                break;
            }
            Field field = fields[i11];
            name = field.getName();
            Intrinsics.f(name, "getName(...)");
            try {
                i5 = field.getInt(new Object());
            } catch (IllegalAccessException | IllegalArgumentException | NullPointerException unused) {
                i5 = -1;
            }
            if (i5 == Build.VERSION.SDK_INT) {
                break;
            } else {
                i11++;
            }
        }
        name = name == null ? "UNKNOWN" : name;
        String str = Build.VERSION.RELEASE;
        int i12 = this.f86408i;
        StringBuilder sbW = c0.w("Android ", name, " ", str, " API ");
        sbW.append(i12);
        this.f86410k = sbW.toString();
        this.f86411l = (TimeZone.getDefault().getRawOffset() / 1000) / 60;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable a(String str, SdkTransactionId sdkTransactionId, ContinuationImpl continuationImpl) {
        c cVar;
        String str2;
        Pair[] pairArr;
        int i5;
        SdkTransactionId sdkTransactionId2;
        String str3;
        d dVar;
        Pair[] pairArr2;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i11 = cVar.C;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                cVar.C = i11 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuationImpl);
            }
        }
        Object obj = cVar.A;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = cVar.C;
        if (i12 == 0) {
            ResultKt.b(obj);
            Pair[] pairArr3 = new Pair[13];
            e eVar = e.f86412b;
            pairArr3[0] = new Pair("C001", AndroidContextPlugin.PLATFORM);
            pairArr3[1] = new Pair("C002", u4.m(Build.MANUFACTURER, "||", Build.MODEL));
            pairArr3[2] = new Pair("C003", this.f86410k);
            pairArr3[3] = new Pair("C004", Build.VERSION.RELEASE);
            Locale[] localeArr = {Locale.getDefault()};
            w4.g gVar = w4.g.f93750b;
            pairArr3[4] = new Pair("C005", w4.g.f(new LocaleList(localeArr)).e());
            pairArr3[5] = new Pair("C006", String.valueOf(this.f86411l));
            StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
            Locale locale = Locale.ROOT;
            DisplayMetrics displayMetrics = this.f86402c;
            pairArr3[6] = new Pair("C008", String.format(locale, "%sx%s", Arrays.copyOf(new Object[]{new Integer(displayMetrics.heightPixels), new Integer(displayMetrics.widthPixels)}, 2)));
            cVar.f86393t = this;
            cVar.f86394u = str;
            cVar.f86395v = sdkTransactionId;
            cVar.f86396w = pairArr3;
            cVar.f86397x = pairArr3;
            cVar.f86398y = "C014";
            cVar.f86399z = 7;
            cVar.C = 1;
            Object objG = this.f86400a.g(cVar);
            if (objG == coroutineSingletons) {
                return coroutineSingletons;
            }
            str2 = str;
            pairArr = pairArr3;
            i5 = 7;
            sdkTransactionId2 = sdkTransactionId;
            obj = objG;
            str3 = "C014";
            dVar = this;
            pairArr2 = pairArr;
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i5 = cVar.f86399z;
            str3 = cVar.f86398y;
            pairArr = cVar.f86397x;
            pairArr2 = cVar.f86396w;
            sdkTransactionId2 = cVar.f86395v;
            str2 = cVar.f86394u;
            dVar = cVar.f86393t;
            ResultKt.b(obj);
        }
        pairArr[i5] = new Pair(str3, ((AppInfo) obj).f45027a);
        e eVar2 = e.f86412b;
        wv.l lVar = dVar.f86401b;
        int i13 = dVar.f86408i;
        TelephonyManager telephonyManager = dVar.f86404e;
        pairArr2[8] = new Pair("C015", "2.2.0");
        pairArr2[9] = new Pair("C016", str2);
        pairArr2[10] = new Pair("C017", dVar.f86409j);
        pairArr2[11] = new Pair("C018", sdkTransactionId2.f45118a);
        pairArr2[12] = new Pair("A137", dVar.f86403d);
        HashMap mapH0 = MapsKt.h0(pairArr2);
        if (i13 >= 28) {
            mapH0.put("A138", String.valueOf(telephonyManager.getSimCarrierId()));
            mapH0.put("A139", String.valueOf(telephonyManager.getSimCarrierIdName()));
        }
        if (i13 >= 29) {
            mapH0.put("A141", String.valueOf(telephonyManager.getSimSpecificCarrierId()));
            mapH0.put("A142", String.valueOf(telephonyManager.getSimSpecificCarrierIdName()));
            if (dVar.f86407h.hasSystemFeature("android.hardware.telephony.ims")) {
                mapH0.put("A150", String.valueOf(telephonyManager.isRttSupported()));
            }
        }
        if (i13 >= 30) {
            mapH0.put("A145", String.valueOf(telephonyManager.getSubscriptionId()));
            mapH0.put("A151", dVar.f86405f == 1 ? InneractiveMediationDefs.SHOW_HOUSE_AD_YES : "false");
        }
        if (i13 >= 31) {
            mapH0.put("A153", Build.SKU);
            mapH0.put("A154", Build.SOC_MANUFACTURER);
            mapH0.put("A155", Build.SOC_MODEL);
        }
        if (i13 >= 33) {
            mapH0.put("A152", String.valueOf(dVar.f86406g.isRampingRingerEnabled()));
        }
        return mapH0;
    }
}
