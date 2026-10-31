package ads_mobile_sdk;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.util.Base64;
import b.e6;
import b.k9;
import java.net.URL;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class ep {

    /* renamed from: a, reason: collision with root package name */
    public final e6 f2936a;

    /* renamed from: b, reason: collision with root package name */
    public final jr0 f2937b;

    /* renamed from: c, reason: collision with root package name */
    public final ci3 f2938c;

    public ep(e6 httpClient, jr0 flags, ci3 traceLogger) {
        Intrinsics.g(httpClient, "httpClient");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(traceLogger, "traceLogger");
        this.f2936a = httpClient;
        this.f2937b = flags;
        this.f2938c = traceLogger;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x00c6  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(ep epVar, String str, double d5, boolean z11, ContinuationImpl continuationImpl) {
        dp dpVar;
        b.a1 tu0Var;
        b.a1 qu0Var;
        if (continuationImpl instanceof dp) {
            dpVar = (dp) continuationImpl;
            int i5 = dpVar.f2581f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dpVar.f2581f = i5 - Integer.MIN_VALUE;
            } else {
                dpVar = new dp(epVar, continuationImpl);
            }
        }
        Object objB = dpVar.f2579d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dpVar.f2581f;
        if (i11 == 0) {
            ResultKt.b(objB);
            jr0 jr0Var = epVar.f2937b;
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("gads:native_bitmap_loader_supports_data_url", Boolean.TRUE, jn.a$10)).booleanValue() && r70.j.I0(str, "data:", false)) {
                int iS0 = r70.k.S0(str, ",", 0, false, 6);
                if (iS0 == -1) {
                    tu0Var = new tu0("Bad data URL: no ',' found for base64 data", wd1.n);
                } else {
                    String strSubstring = str.substring(0, iS0);
                    Intrinsics.f(strSubstring, "substring(...)");
                    if (r70.j.A0(strSubstring, ";base64", false)) {
                        int iS02 = r70.k.S0(str, ":", 0, false, 6);
                        int iS03 = r70.k.S0(str, ";", 0, false, 6);
                        if (iS02 != -1) {
                            String strSubstring2 = str.substring(iS02 + 1, iS03);
                            Intrinsics.f(strSubstring2, "substring(...)");
                            if (r70.j.I0(strSubstring2, "image/", false)) {
                                String strSubstring3 = str.substring(iS0 + 1);
                                Intrinsics.f(strSubstring3, "substring(...)");
                                try {
                                    qu0Var = new xu0(Base64.decode(strSubstring3, 0));
                                } catch (IllegalArgumentException e3) {
                                    qu0Var = new qu0(e3, wd1.n, "Bad data URL: could not decode base64");
                                }
                                tu0Var = qu0Var;
                            } else {
                                tu0Var = new tu0("Bad data URL: only image media is supported", wd1.n);
                            }
                        }
                    } else {
                        tu0Var = new tu0("Bad data URL: only base64 is supported", wd1.n);
                    }
                }
                return tu0Var instanceof pu0 ? (pu0) tu0Var : epVar.a((byte[]) ((xu0) tu0Var).f11834b, d5, z11);
            }
            e6 e6Var = epVar.f2936a;
            URL url = new URL(Uri.parse(str).toString());
            dpVar.f2576a = epVar;
            dpVar.f2577b = d5;
            dpVar.f2578c = z11;
            dpVar.f2581f = 1;
            objB = e6.b(e6Var, url, null, dpVar, 30);
            if (objB == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z11 = dpVar.f2578c;
            d5 = dpVar.f2577b;
            epVar = dpVar.f2576a;
            ResultKt.b(objB);
        }
        b.a1 a1Var = (b.a1) objB;
        if (a1Var instanceof pu0) {
            return (pu0) a1Var;
        }
        Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
        try {
            ww2 ww2Var = ((a21) ((xu0) a1Var).f11834b).f812d;
            return ww2Var != null ? epVar.a(ww2Var.f11503a, d5, z11) : new tu0("HTTP response body is null", wd1.f11213a);
        } catch (Exception e11) {
            epVar.f2938c.a("Error downloading bitmap from url.", (Throwable) e11);
            return new qu0(e11, wd1.f11217e, null, 4);
        }
    }

    public final b.a1 a(byte[] bArr, double d5, boolean z11) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inDensity = (int) (160 * d5);
        if (!z11) {
            options.inPreferredConfig = Bitmap.Config.RGB_565;
        }
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
        options.inJustDecodeBounds = false;
        int i5 = options.outWidth * options.outHeight;
        if (i5 > 0) {
            jr0 jr0Var = this.f2937b;
            options.inSampleSize = 1 << ((33 - Integer.numberOfLeadingZeros((i5 - 1) / ((Number) jr0Var.a("gads:nativeads:image:sample:pixels", k9.q(jr0Var, "gads:nativeads:image:sample:pixels", 1048576), jn.a$15)).intValue())) / 2);
        }
        Bitmap bitmapDecodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
        if (bitmapDecodeByteArray == null) {
            return new tu0("Cannot decode image", wd1.f11213a);
        }
        return new xu0(bitmapDecodeByteArray);
    }
}
