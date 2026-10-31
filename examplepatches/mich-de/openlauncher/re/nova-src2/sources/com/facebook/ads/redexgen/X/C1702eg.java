package com.facebook.ads.redexgen.X;

import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;
import com.facebook.ads.internal.util.activity.ActivityUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.eg, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1702eg {
    public static byte[] A00;
    public static String[] A01 = {"88AoqknPZ4rnlocmRSd1iIvU160OI6Up", "Xa", "c0t0ITAkOrWkNbi2AOUUle7x7Lv9c02n", "B7XNNyfmW5R2wceLmJkXAkDES3fZG3Pt", "MUV", "NALjFYAH0tlSEiNw3RaQSfKZY5jyxbRm", "XF7p93xq3OHri6co5HggQunfVTz3vEaG", "n2FdIZz9zx79PfKUryB9rXi8CBHMM9xX"};
    public static final String A02;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 33);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{111, 84, 91, 88, 86, 95, 26, 78, 85, 26, 74, 91, 72, 73, 95, 26, 80, 73, 85, 84, 26, 94, 91, 78, 91, 26, 83, 84, 26, 123, 94, 123, 89, 78, 83, 85, 84, 124, 91, 89, 78, 85, 72, 67, 20, 19, 22, 3, 22, 82, 83, 78, 84, 73, 88, 65, 94, 75, 64, 113, 66, 71, 64, 69, 98, 115, 96, 97, 123, 124, 117, 27, 10, 24, 24, 31, 3, 25, 4, 30, 12, 3, 39, 32, 59, 38, 49, 40, 47, 52, 41, 62, 4, 46, 41, 55, 4, 44, 62, 57, 4, 61, 58, 55, 55, 57, 58, 56, 48, 49, 55, 48, 32, 123, 100, 105, 104, 98, 82, 120, AbstractJsonLexerKt.TC_INVALID, 97};
    }

    static {
        A03();
        A02 = C1702eg.class.getSimpleName();
    }

    public static AbstractC1701ef A00(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, String str, Uri uri, Map<String, String> map, C1750fT c1750fT) {
        return A01(c0958Hi, interfaceC2224nG, str, uri, map, true, false, c1750fT);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00af  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00c7  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00d8  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0120  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static AbstractC1701ef A01(final C0958Hi c0958Hi, final InterfaceC2224nG interfaceC2224nG, final String action, final Uri uri, final Map<String, String> map, final boolean z11, boolean z12, final C1750fT c1750fT) {
        char c11;
        if (uri == null || uri.getAuthority() == null) {
            return null;
        }
        String key = uri.getAuthority();
        String queryParameter = uri.getQueryParameter(A02(113, 9, 44));
        String queryParameter2 = uri.getQueryParameter(A02(45, 4, 86));
        if (queryParameter2 != null) {
            boolean zIsEmpty = TextUtils.isEmpty(queryParameter2);
            if (A01[2].charAt(25) != 'L') {
                throw new RuntimeException();
            }
            A01[2] = "ISDJ842CIGTTmPHzT0dMVnvZcLrwzpZ1";
            if (!zIsEmpty) {
                try {
                    JSONObject jSONObject = new JSONObject(queryParameter2);
                    Iterator<String> dataIterator = jSONObject.keys();
                    while (dataIterator.hasNext()) {
                        String next = dataIterator.next();
                        try {
                            map.put(next, jSONObject.getString(next));
                        } catch (JSONException e3) {
                            e = e3;
                            c0958Hi.A08().ABz(A02(64, 7, 51), AbstractC2126lf.A23, new C2127lg(e));
                            Log.w(A02, A02(0, 45, 27), e);
                            final C1707em c1707emA00 = C1707em.A00(interfaceC2224nG, ActivityUtils.A00());
                            switch (key.hashCode()) {
                                case -1458789996:
                                    break;
                                case 109770977:
                                    break;
                                case 1546100943:
                                    break;
                            }
                            switch (c11) {
                            }
                        }
                    }
                } catch (JSONException e11) {
                    e = e11;
                }
            }
        }
        final C1707em c1707emA002 = C1707em.A00(interfaceC2224nG, ActivityUtils.A00());
        switch (key.hashCode()) {
            case -1458789996:
                if (!key.equals(A02(71, 11, 74))) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 2;
                    break;
                }
            case 109770977:
                if (key.equals(A02(82, 5, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE))) {
                    c11 = 0;
                    break;
                }
                break;
            case 1546100943:
                if (key.equals(A02(55, 9, 15))) {
                    c11 = 1;
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
                if (queryParameter != null) {
                    return null;
                }
                return (!z12 || TextUtils.isEmpty(uri.getQueryParameter(A02(87, 22, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE)))) ? new MH(c0958Hi, interfaceC2224nG, action, uri, map, c1707emA002, z11, c1750fT) { // from class: com.facebook.ads.redexgen.X.7w
                    public static byte[] A04;
                    public static String[] A05 = {"eZwrQOnpnpQE2xbRo0zNjy7tlobdqdqH", "SFt7WwZUn", "NjRPf9lXQVcUlHZaPZ2tHyzwDKEOZm5m", "vsw9aGbGyLBdbL44W3z8tEYPUFR7w9", "bZApvv", "GYK1wV", "jBSwIULngy0dc0IzE6SbgF9ev3BAFzHy", "9HFC3JFq8"};
                    public static final String A06;
                    public String A00;
                    public final Uri A01;
                    public final C1750fT A02;
                    public final Map<String, String> A03;

                    public static String A04(int i5, int i11, int i12) {
                        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
                        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                            int i14 = (bArrCopyOfRange[i13] - i12) - 27;
                            String[] strArr = A05;
                            if (strArr[6].charAt(23) == strArr[0].charAt(23)) {
                                throw new RuntimeException();
                            }
                            A05[3] = "uqLwDcTKX4SWJds2FMBMp5QNw2MnWtU";
                            bArrCopyOfRange[i13] = (byte) i14;
                        }
                        return new String(bArrCopyOfRange);
                    }

                    /* JADX WARN: Failed to parse debug info
                    java.lang.ArrayIndexOutOfBoundsException
                     */
                    private final List<Intent> A06() {
                        List<C1706ek> listA05 = A05();
                        ArrayList arrayList = new ArrayList();
                        if (listA05 != null) {
                            Iterator<C1706ek> it = listA05.iterator();
                            while (it.hasNext()) {
                                Intent intentA00 = A00(it.next());
                                if (intentA00 != null) {
                                    arrayList.add(intentA00);
                                }
                            }
                        }
                        return arrayList;
                    }

                    public static void A07() {
                        A04 = new byte[]{106, -105, -105, -108, -105, 69, -107, -122, -105, -104, -114, -109, -116, 69, -122, -107, -107, -104, -114, -103, -118, -124, -119, -122, -103, -122, -124, -97, -89, -86, -93, -94, 94, -78, -83, 94, -83, -82, -93, -84, 94, -85, -97, -80, -87, -93, -78, 94, -77, -80, -86, 120, 94, -29, -27, -5, 8, -2, 12, 9, 3, -2, -108, -95, -105, -91, -94, -100, -105, 97, -100, -95, -89, -104, -95, -89, 97, -108, -106, -89, -100, -94, -95, 97, 119, 124, 116, AbstractJsonLexerKt.TC_INVALID, -94, -81, -91, -77, -80, -86, -91, 111, -86, -81, -75, -90, -81, -75, 111, -94, -92, -75, -86, -80, -81, 111, -105, -118, -122, -104, -8, 7, 7, 10, 0, 11, -4, -10, -5, -8, 11, -8, -3, -15, 2, -5, -11, 4, -54, -65, -65, -12, -11, 4, -15, -7, -4, 3, -49, -7, -12, -51, -75, 3, -26, -25, -36, -27, -36, -37, -42, -37, -36, -36, -25, -29, -32, -27, -30, -108, -107, -118, -109, -118, -119, -124, -104, -103, -108, -105, -118, -124, -117, -122, -111, -111, -121, -122, -120, -112, -124, -102, -105, -111, -38, -37, -48, -39, -48, -49, -54, -34, -33, -38, -35, -48, -54, -32, -35, -41, -70, -85, -68, -67, -77, -72, -79, -51, -50, -55, -52, -65, -71, -61, -66, -10, -9, -14, -11, -24, -30, -8, -11, -17, -96, -95, -100, -97, -110, -116, -94, -97, -103, -116, -92, -110, -113, -116, -109, -114, -103, -103, -113, -114, -112, -104, -90, -105, -98, 108, -72, -87, -80, -76, -74, -77, -79, -76, -72, 126, -61, -68, -73, -60, -77, -64, -63, -81, -70, -83, -70, -73, -68, -71};
                    }

                    static {
                        A07();
                        A06 = C07307w.class.getSimpleName();
                    }

                    {
                        this.A01 = uri;
                        this.A03 = map;
                        this.A02 = c1750fT;
                    }

                    /* JADX WARN: Code restructure failed: missing block: B:15:0x0048, code lost:
                    
                        if (r4.startsWith(r0) != false) goto L16;
                     */
                    /* JADX WARN: Removed duplicated region for block: B:53:0x011d  */
                    /*
                        Code decompiled incorrectly, please refer to instructions dump.
                    */
                    private Intent A00(C1706ek c1706ek) {
                        if (TextUtils.isEmpty(c1706ek.A05())) {
                            return null;
                        }
                        String strA03 = c1706ek.A03();
                        C0958Hi c0958Hi2 = ((AbstractC1701ef) this).A01;
                        String appLinkUri = c1706ek.A05();
                        if (!AbstractC2397q9.A04(c0958Hi2, appLinkUri) && !A09(((AbstractC1701ef) this).A01, strA03)) {
                            return null;
                        }
                        if (!TextUtils.isEmpty(strA03)) {
                            String appLinkUri2 = A04(androidx.recyclerview.widget.n0.DEFAULT_SWIPE_ANIMATION_DURATION, 4, 23);
                            if (!strA03.startsWith(appLinkUri2)) {
                                String appLinkUri3 = A04(254, 10, 41);
                            }
                            return new Intent(A04(62, 26, 24), AbstractC2351pP.A00(strA03));
                        }
                        PackageManager packageManager = ((AbstractC1701ef) this).A01.getPackageManager();
                        if (packageManager == null) {
                            return null;
                        }
                        String appLinkUri4 = c1706ek.A04();
                        if (TextUtils.isEmpty(appLinkUri4) && TextUtils.isEmpty(strA03)) {
                            String appLinkUri5 = c1706ek.A05();
                            return packageManager.getLaunchIntentForPackage(appLinkUri5);
                        }
                        Intent unresolvedAppIntent = A01(c1706ek);
                        List<ResolveInfo> listQueryIntentActivities = packageManager.queryIntentActivities(unresolvedAppIntent, SQLiteDatabase.OPEN_FULLMUTEX);
                        if (unresolvedAppIntent.getComponent() == null) {
                            Iterator<ResolveInfo> it = listQueryIntentActivities.iterator();
                            while (true) {
                                boolean zHasNext = it.hasNext();
                                String[] strArr = A05;
                                String str = strArr[5];
                                String appLinkUri6 = strArr[4];
                                if (str.length() == appLinkUri6.length()) {
                                    String[] strArr2 = A05;
                                    strArr2[7] = "mdy3DwQER";
                                    strArr2[1] = "z4eGZXaiq";
                                    if (!zHasNext) {
                                        break;
                                    }
                                    ResolveInfo next2 = it.next();
                                    if (next2.activityInfo != null) {
                                        String appLinkUri7 = next2.activityInfo.packageName;
                                        if (appLinkUri7 != null) {
                                            String appLinkUri8 = next2.activityInfo.name;
                                            if (appLinkUri8 != null) {
                                                String str2 = next2.activityInfo.packageName;
                                                String appLinkUri9 = c1706ek.A05();
                                                if (str2.equals(appLinkUri9)) {
                                                    unresolvedAppIntent.setComponent(new ComponentName(next2.activityInfo.packageName, next2.activityInfo.name));
                                                    break;
                                                }
                                            } else {
                                                continue;
                                            }
                                        } else {
                                            continue;
                                        }
                                    }
                                } else {
                                    throw new RuntimeException();
                                }
                            }
                        }
                        if (!listQueryIntentActivities.isEmpty()) {
                            ComponentName component = unresolvedAppIntent.getComponent();
                            String[] strArr3 = A05;
                            String str3 = strArr3[5];
                            String appLinkUri10 = strArr3[4];
                            if (str3.length() != appLinkUri10.length()) {
                                throw new RuntimeException();
                            }
                            A05[2] = "8xekkGfEbM0UNtDVsVek4v0mq2iI8UOu";
                            if (component == null) {
                                if (!A09(((AbstractC1701ef) this).A01, strA03)) {
                                    return null;
                                }
                                String appLinkUri11 = c1706ek.A05();
                                unresolvedAppIntent.setPackage(appLinkUri11);
                            }
                        }
                        return unresolvedAppIntent;
                    }

                    private Intent A01(C1706ek c1706ek) {
                        Intent intent = new Intent(A04(88, 26, 38));
                        intent.addFlags(268435456);
                        if (!TextUtils.isEmpty(c1706ek.A05()) && !TextUtils.isEmpty(c1706ek.A04())) {
                            intent.setComponent(new ComponentName(c1706ek.A05(), c1706ek.A04()));
                        }
                        if (!TextUtils.isEmpty(c1706ek.A03())) {
                            intent.setData(AbstractC2351pP.A00(c1706ek.A03()));
                        }
                        return intent;
                    }

                    private final Uri A02() {
                        String queryParameter3 = this.A01.getQueryParameter(A04(Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, 9, 104));
                        if (!TextUtils.isEmpty(queryParameter3)) {
                            return AbstractC2351pP.A00(queryParameter3);
                        }
                        Uri uri2 = this.A01;
                        String storeUrl = A04(211, 8, 63);
                        String storeId = uri2.getQueryParameter(storeUrl);
                        Locale locale = Locale.US;
                        Object[] objArr = {storeId};
                        String storeUrl2 = A04(Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, 22, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
                        return AbstractC2351pP.A00(String.format(locale, storeUrl2, objArr));
                    }

                    private EnumC1698ec A03() throws PackageManager.NameNotFoundException, C2335p6, SecurityException {
                        this.A00 = null;
                        C2347pK c2347pK = new C2347pK();
                        try {
                            Uri uriA02 = A02();
                            EnumC1698ec enumC1698ecA06 = C2347pK.A06(c2347pK, ((AbstractC1701ef) this).A01, uriA02, ((AbstractC1701ef) this).A03, this.A03);
                            if (enumC1698ecA06 != EnumC1698ec.A08) {
                                this.A00 = uriA02 != null ? uriA02.toString() : null;
                            }
                            return enumC1698ecA06;
                        } catch (C2335p6 unused) {
                            String str = A04(26, 27, 35) + this.A01.toString();
                            String queryParameter3 = this.A01.getQueryParameter(A04(228, 22, 18));
                            if (queryParameter3 != null) {
                                int length = queryParameter3.length();
                                String[] strArr = A05;
                                if (strArr[5].length() != strArr[4].length()) {
                                    throw new RuntimeException();
                                }
                                A05[2] = "UmbMkLHRt7mU5WI1cGYqu3JtAtwRZWLm";
                                if (length > 0) {
                                    Uri uriA00 = AbstractC2351pP.A00(queryParameter3);
                                    C2347pK.A0E(c2347pK, ((AbstractC1701ef) this).A01, uriA00, ((AbstractC1701ef) this).A03);
                                    this.A00 = uriA00 != null ? uriA00.toString() : null;
                                }
                            }
                            return EnumC1698ec.A08;
                        }
                    }

                    private List<C1706ek> A05() {
                        String queryParameter3 = this.A01.getQueryParameter(A04(114, 12, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
                        if (TextUtils.isEmpty(queryParameter3)) {
                            return null;
                        }
                        String appsiteDataString = A04(53, 2, 109);
                        if (appsiteDataString.equals(queryParameter3)) {
                            return null;
                        }
                        ArrayList arrayList = new ArrayList();
                        try {
                            JSONObject jSONObject2 = new JSONObject(queryParameter3);
                            String appsiteDataString2 = A04(55, 7, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
                            JSONArray jSONArrayOptJSONArray = jSONObject2.optJSONArray(appsiteDataString2);
                            if (jSONArrayOptJSONArray != null) {
                                for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                                    C1706ek c1706ekA00 = C1706ek.A00(jSONArrayOptJSONArray.optJSONObject(i5));
                                    if (c1706ekA00 != null) {
                                        arrayList.add(c1706ekA00);
                                    }
                                }
                            }
                        } catch (JSONException e12) {
                            InterfaceC2125le interfaceC2125leA08 = ((AbstractC1701ef) this).A01.A08();
                            int i11 = AbstractC2126lf.A24;
                            C2127lg c2127lg = new C2127lg(e12);
                            String appsiteDataString3 = A04(Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, 7, 47);
                            interfaceC2125leA08.ABz(appsiteDataString3, i11, c2127lg);
                            String str = A06;
                            String appsiteDataString4 = A04(0, 26, 10);
                            Log.w(str, appsiteDataString4, e12);
                        }
                        return arrayList;
                    }

                    private boolean A08() {
                        List<Intent> appLaunchIntents = A06();
                        if (appLaunchIntents == null) {
                            return false;
                        }
                        Iterator<Intent> it = appLaunchIntents.iterator();
                        while (it.hasNext()) {
                            if (C2337p8.A0F(((AbstractC1701ef) this).A01, it.next())) {
                                return true;
                            }
                        }
                        return false;
                    }

                    public static boolean A09(C0958Hi c0958Hi2, String str) {
                        if (Build.VERSION.SDK_INT >= 30 && str != null) {
                            boolean zA29 = C2203mv.A29(c0958Hi2);
                            if (A05[3].length() == 13) {
                                throw new RuntimeException();
                            }
                            String[] strArr = A05;
                            strArr[7] = "1LqNNd92i";
                            strArr[1] = "QkgxMECyk";
                            if (zA29) {
                                return true;
                            }
                        }
                        return false;
                    }

                    @Override // com.facebook.ads.redexgen.X.MH
                    public final EnumC1698ec A0J() {
                        EnumC1698ec enumC1698ecA0O = EnumC1698ec.A08;
                        if (((MH) this).A03) {
                            enumC1698ecA0O = A0O();
                        } else {
                            this.A03.put(A04(188, 16, 80), String.valueOf(true));
                        }
                        A0L(this.A03, enumC1698ecA0O);
                        C1750fT.A06(this.A02, ((AbstractC1701ef) this).A01);
                        return enumC1698ecA0O;
                    }

                    public final EnumC1698ec A0O() {
                        EnumC1698ec enumC1698ecA03 = EnumC1698ec.A08;
                        String strA04 = A04(148, 15, 92);
                        String queryParameter3 = null;
                        boolean zA0M = A0M(this.A01);
                        if (!zA0M) {
                            zA0M = A08();
                        }
                        if (zA0M) {
                            Uri uri2 = this.A01;
                            String redirectionAction = A04(264, 14, 51);
                            queryParameter3 = uri2.getQueryParameter(redirectionAction);
                        } else {
                            try {
                                enumC1698ecA03 = A03();
                                strA04 = enumC1698ecA03 != EnumC1698ec.A08 ? A04(188, 16, 80) : A04(163, 25, 10);
                                queryParameter3 = this.A00;
                            } catch (Exception unused) {
                                enumC1698ecA03 = EnumC1698ec.A03;
                            }
                        }
                        Map<String, String> map2 = this.A03;
                        String redirectionAction2 = String.valueOf(true);
                        map2.put(strA04, redirectionAction2);
                        new C2618ti(this.A03).A03(((AbstractC1701ef) this).A01, queryParameter3);
                        return enumC1698ecA03;
                    }
                } : new C07297v(c0958Hi, interfaceC2224nG, action, uri, map);
            case 1:
                if (A02(109, 4, 100).equals(uri.getQueryParameter(A02(49, 6, 28)))) {
                    return new MH(c0958Hi, interfaceC2224nG, action, uri, map, c1707emA002, z11) { // from class: com.facebook.ads.redexgen.X.7t
                        public static byte[] A02;
                        public static final String A03;
                        public final Uri A00;
                        public final Map<String, String> A01;

                        public static String A00(int i5, int i11, int i12) {
                            byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
                            for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                                bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 79);
                            }
                            return new String(bArrCopyOfRange);
                        }

                        public static void A01() {
                            A02 = new byte[]{122, 93, 85, 80, 89, 88, 28, 72, 83, 28, 83, 76, 89, 82, 28, 80, 85, 82, 87, 28, 73, 78, 80, 6, 28, 43, 46, 41, 44};
                        }

                        static {
                            A01();
                            A03 = C07277t.class.getSimpleName();
                        }

                        {
                            this.A00 = uri;
                            this.A01 = map;
                        }

                        @Override // com.facebook.ads.redexgen.X.MH
                        public final EnumC1698ec A0J() {
                            String queryParameter3;
                            EnumC1698ec enumC1698ecA0O = EnumC1698ec.A08;
                            if (((MH) this).A03) {
                                enumC1698ecA0O = A0O();
                                EnumC1698ec actionOutcome = EnumC1698ec.A03;
                                if (enumC1698ecA0O != actionOutcome && this.A01 != null && (queryParameter3 = this.A00.getQueryParameter(A00(25, 4, 8))) != null) {
                                    try {
                                        Uri uriA00 = AbstractC2351pP.A00(queryParameter3);
                                        if (uriA00 != null) {
                                            C2618ti c2618ti = new C2618ti(this.A01);
                                            C0958Hi c0958Hi2 = ((AbstractC1701ef) this).A01;
                                            String link = uriA00.toString();
                                            c2618ti.A03(c0958Hi2, link);
                                        }
                                    } catch (Exception unused) {
                                    }
                                }
                            }
                            A0L(this.A01, enumC1698ecA0O);
                            return enumC1698ecA0O;
                        }

                        public final EnumC1698ec A0O() {
                            EnumC1698ec enumC1698ec = EnumC1698ec.A08;
                            try {
                                C2347pK.A0D(new C2347pK(), ((AbstractC1701ef) this).A01, AbstractC2351pP.A00(this.A00.getQueryParameter(A00(25, 4, 8))), ((AbstractC1701ef) this).A03);
                                return enumC1698ec;
                            } catch (Exception unused) {
                                String str = A00(0, 25, 115) + this.A00.toString();
                                return EnumC1698ec.A03;
                            }
                        }
                    };
                }
                return z12 ? new C07297v(c0958Hi, interfaceC2224nG, action, uri, map) : new MH(c0958Hi, interfaceC2224nG, action, uri, map, c1707emA002, z11) { // from class: com.facebook.ads.redexgen.X.7u
                    public static byte[] A02;
                    public static String[] A03 = {"EO73VH", "Qgz5bq7vpM6wgaeZrwJ0N", "K0RixItTLV229tIQ9volfY9Fr2yfBG4Z", "0XJd0xzB9RaoqzSBbOWrwbmO5Qd7B1Hm", b.f42142b, "cDFQfUnzrKwrnb1BC8KnyL9IHyRAK9fC", "Q7Q0M0vYffDRrtcuJmKxnq", "hygqtGcON2Cep"};
                    public static final String A04;
                    public final Uri A00;
                    public final Map<String, String> A01;

                    public static String A00(int i5, int i11, int i12) {
                        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
                        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 99);
                        }
                        return new String(bArrCopyOfRange);
                    }

                    public static void A01() {
                        byte[] bArr = {14, 41, 49, 52, 45, 44, -24, 60, 55, -24, 55, 56, 45, 54, -24, 52, 49, 54, 51, -24, 61, 58, 52, 2, -24, -14, -17, -12, -15, 35, 28, 23, 36, 19, 32, 33, 15, 26, 13, 26, 23, 28, 25};
                        if (A03[0].length() == 23) {
                            throw new RuntimeException();
                        }
                        String[] strArr = A03;
                        strArr[3] = "z2LBMWL3UZ6mgEOfq1wT6wdWGhdUBaxY";
                        strArr[2] = "LNV6u0tAGiEAXpu6l5ZCQkq7c5KJBKxy";
                        A02 = bArr;
                    }

                    static {
                        A01();
                        A04 = C07287u.class.getSimpleName();
                    }

                    {
                        this.A00 = uri;
                        this.A01 = map;
                    }

                    @Override // com.facebook.ads.redexgen.X.MH
                    public final EnumC1698ec A0J() {
                        EnumC1698ec enumC1698ecA0O = EnumC1698ec.A08;
                        if (((MH) this).A03) {
                            enumC1698ecA0O = A0O();
                        }
                        if (!AbstractC2426qc.A0j(((AbstractC1701ef) this).A01, enumC1698ecA0O, this.A01)) {
                            A0L(this.A01, enumC1698ecA0O);
                        }
                        return enumC1698ecA0O;
                    }

                    public final EnumC1698ec A0O() {
                        EnumC1698ec enumC1698ecA06;
                        if (A0M(this.A00)) {
                            String deeplink = this.A00.getQueryParameter(A00(29, 14, 75));
                            if (this.A01 != null) {
                                new C2618ti(this.A01).A03(((AbstractC1701ef) this).A01, deeplink);
                            }
                            EnumC1698ec actionOutcome = EnumC1698ec.A09;
                            return actionOutcome;
                        }
                        Uri uriA00 = null;
                        try {
                            uriA00 = AbstractC2351pP.A00(this.A00.getQueryParameter(A00(25, 4, 35)));
                            enumC1698ecA06 = C2347pK.A06(new C2347pK(), ((AbstractC1701ef) this).A01, uriA00, ((AbstractC1701ef) this).A03, this.A01);
                        } catch (Exception unused) {
                            String str = A00(0, 25, 101) + this.A00.toString();
                            enumC1698ecA06 = EnumC1698ec.A03;
                        }
                        EnumC1698ec actionOutcome2 = EnumC1698ec.A03;
                        if (enumC1698ecA06 != actionOutcome2 && this.A01 != null && uriA00 != null) {
                            new C2618ti(this.A01).A03(((AbstractC1701ef) this).A01, uriA00.toString());
                        }
                        return enumC1698ecA06;
                    }
                };
            case 2:
                return new MG(c0958Hi, interfaceC2224nG, action, uri, map);
            default:
                return new MF(c0958Hi, interfaceC2224nG, action, uri);
        }
    }

    public static boolean A04(String str) {
        return A02(82, 5, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE).equalsIgnoreCase(str) || A02(55, 9, 15).equalsIgnoreCase(str);
    }
}
