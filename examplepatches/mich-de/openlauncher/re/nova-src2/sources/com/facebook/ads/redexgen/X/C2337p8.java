package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import com.facebook.ads.AudienceNetworkActivity;
import com.facebook.ads.internal.api.AudienceNetworkRemoteServiceApi;
import com.facebook.ads.internal.util.activity.ActivityUtils;
import com.facebook.ads.internal.util.activity.AdActivityIntent;
import com.facebook.ads.internal.util.process.ProcessUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicReference;

/* renamed from: com.facebook.ads.redexgen.X.p8, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2337p8 {
    public static byte[] A00;
    public static String[] A01 = {"R2O7PMYP6nkOeNui3I4WlXx4fu7rpRKA", "y", "n9RLgUbY6qPVyxnn4C2MCNq6tOX6tKMu", "KtI8XvYnNiAs4lVQz", "VIjGruAAxxfbDEfj8", "jnPluIPOifq7BY1vqnqKLiUetY3DHsfM", "J5aiTqmsNT2689NKU", "zCaDldCe0EtEl2h3W"};
    public static final Package A02;
    public static final String A03;
    public static final String A04;
    public static final String A05;
    public static final Set<C0958Hi> A06;
    public static final AtomicReference<InterfaceC2344pH> A07;
    public static final AtomicReference<InterfaceC2346pJ> A08;
    public static final AtomicReference<AudienceNetworkRemoteServiceApi.HorizonWorldUrlLauncher> A09;

    public static String A08(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 18);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        A00 = new byte[]{-111, -92, -89, -79, -70, -62, -92, -89, -62, -78, -91, -83, -62, -84, -89, -62, -82, -88, -68, -68, -49, -46, -36, -27, -19, -35, -32, -41, -43, -41, -36, -49, -38, -19, -45, -26, -30, -32, -49, -31, 102, 121, 124, -122, -113, -105, -117, 121, -114, 125, 124, -105, -117, -116, 121, -116, 125, -105, 124, 121, -116, 121, -57, -43, -22, -39, -40, -108, -25, -24, -43, -24, -39, -108, -42, -23, -30, -40, -32, -39, -108, -35, -25, -108, -39, -31, -28, -24, -19, -107, -19, -17, 0, -21, 1, 0, -11, -8, -77, -64, -79, -75, -66, -69, -73, -64, -58, -79, -58, -63, -67, -73, -64, -80, -68, -70, 123, -77, -82, -80, -78, -81, -68, -68, -72, 123, -82, -79, -64, 123, -74, -69, -63, -78, -65, -69, -82, -71, 123, -74, -67, -80, 123, -114, -62, -79, -74, -78, -69, -80, -78, -101, -78, -63, -60, -68, -65, -72, -97, -78, -70, -68, -63, -78, -114, -80, -63, -74, -61, -74, -63, -58, -30, -37, -24, -34, -26, -33, -49, -20, -29, -64, -23, -20, -52, -33, -19, -17, -26, -18, -92, -91, -110, -93, -91, 114, -108, -91, -102, -89, -102, -91, -86, -53, -52, -71, -54, -52, -103, -69, -52, -63, -50, -63, -52, -47, -98, -57, -54, -86, -67, -53, -51, -60, -52};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 7 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static boolean A0E(Intent intent, Set<String> set) {
        Uri data = intent.getData();
        if (data == null) {
            return false;
        }
        String string = data.toString();
        Iterator<String> it = set.iterator();
        while (it.hasNext()) {
            if (string.startsWith(it.next())) {
                return true;
            }
        }
        return false;
    }

    static {
        A09();
        A02 = C2337p8.class.getPackage();
        A04 = A02 + A08(40, 22, 38);
        A03 = A02 + A08(0, 19, 81);
        A05 = A02 + A08(19, 21, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
        A06 = Collections.newSetFromMap(new WeakHashMap());
        A07 = new AtomicReference<>();
        A08 = new AtomicReference<>();
        A09 = new AtomicReference<>();
    }

    public static int A00(C0958Hi c0958Hi, Intent intent) throws C2335p6 {
        Intent intentA01 = A01(intent);
        int usedContext = 0;
        try {
            Activity activityA00 = ActivityUtils.A00();
            if (activityA00 == null) {
                activityA00 = c0958Hi.A0E();
                usedContext = 1;
            }
            if (activityA00 != null) {
                activityA00.startActivity(intentA01);
                return usedContext;
            }
            intentA01.addFlags(268435456);
            c0958Hi.startActivity(intentA01);
            return 2;
        } catch (ActivityNotFoundException e3) {
            throw new C2335p6(e3);
        }
    }

    public static Intent A01(Intent intent) {
        Intent intentCloneFilter = intent.cloneFilter();
        intentCloneFilter.setFlags(intent.getFlags());
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeBundle(intent.getExtras());
        intentCloneFilter.putExtra(A05, parcelObtain.marshall());
        parcelObtain.recycle();
        return intentCloneFilter;
    }

    public static Intent A02(Intent intent, ClassLoader classLoader) {
        Intent intentCloneFilter = intent.cloneFilter();
        intentCloneFilter.setFlags(intent.getFlags());
        Bundle audienceNetworkActivityBundle = new Bundle();
        Parcel parcelObtain = Parcel.obtain();
        byte[] byteArrayExtra = intent.getByteArrayExtra(A05);
        if (byteArrayExtra != null) {
            parcelObtain.unmarshall(byteArrayExtra, 0, byteArrayExtra.length);
            parcelObtain.setDataPosition(0);
            audienceNetworkActivityBundle = parcelObtain.readBundle(classLoader);
            parcelObtain.recycle();
        }
        intentCloneFilter.putExtras(audienceNetworkActivityBundle);
        return intentCloneFilter;
    }

    public static Bundle A03(Bundle bundle, ClassLoader classLoader) {
        Parcel parcelObtain = Parcel.obtain();
        byte[] byteArray = bundle.getByteArray(A04);
        if (byteArray != null) {
            parcelObtain.unmarshall(byteArray, 0, byteArray.length);
            parcelObtain.setDataPosition(0);
            Bundle bundle2 = parcelObtain.readBundle(classLoader);
            parcelObtain.recycle();
            String[] strArr = A01;
            if (strArr[6].length() != strArr[7].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[4] = "08vXapB5qdF8q1e2g";
            strArr2[3] = "bPV7EQI3jYdBWJzP2";
            return bundle2;
        }
        throw new IllegalStateException(A08(62, 28, 98));
    }

    public static AudienceNetworkRemoteServiceApi.HorizonWorldUrlLauncher A04() {
        return A09.get();
    }

    public static C0958Hi A05(Intent intent) {
        String stringExtra = intent.getStringExtra(A03);
        if (stringExtra != null) {
            for (C0958Hi c0958Hi : A06) {
                String adId = c0958Hi.A0F().getId();
                if (stringExtra.equals(adId)) {
                    return c0958Hi;
                }
            }
            return null;
        }
        return null;
    }

    public static AdActivityIntent A06(C0958Hi c0958Hi) {
        AdActivityIntent adActivityIntent = new AdActivityIntent(c0958Hi.getApplicationContext(), A07());
        adActivityIntent.putExtra(A03, c0958Hi.A0F().getId());
        A06.add(c0958Hi);
        return adActivityIntent;
    }

    public static Class A07() {
        boolean zIsRemoteRenderingProcess = ProcessUtils.isRemoteRenderingProcess();
        if (A01[1].length() != 1) {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[4] = "4NnM5dRGBMW0KGxzs";
        strArr[3] = "N6FCbEqQMIqNBYuck";
        if (zIsRemoteRenderingProcess) {
            try {
                return Class.forName(A08(113, 59, 59));
            } catch (ClassNotFoundException e3) {
                throw new RuntimeException(e3);
            }
        }
        return AudienceNetworkActivity.class;
    }

    public static void A0A(Activity activity, Intent intent) throws C2335p6 {
        try {
            activity.startActivityForResult(intent, 0);
        } catch (ActivityNotFoundException e3) {
            throw new C2335p6(e3);
        }
    }

    public static void A0B(Bundle bundle, Bundle bundle2) {
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeBundle(bundle2);
        bundle.putByteArray(A04, parcelObtain.marshall());
        parcelObtain.recycle();
    }

    public static void A0C(AudienceNetworkRemoteServiceApi.HorizonWorldUrlLauncher horizonWorldUrlLauncher) {
        A09.set(horizonWorldUrlLauncher);
    }

    public static void A0D(C0958Hi c0958Hi, AdActivityIntent adActivityIntent) throws C2335p6 {
        Context launchContext;
        Context applicationContext = c0958Hi.getApplicationContext();
        if (C2203mv.A2f(c0958Hi) && (launchContext = c0958Hi.A0E()) != null) {
            applicationContext = launchContext;
            if ((adActivityIntent.getFlags() & 268435456) == 268435456) {
                adActivityIntent.setFlags(adActivityIntent.getFlags() ^ 268435456);
            }
        }
        try {
            if (ProcessUtils.isRemoteRenderingProcess()) {
                if (!A0K(c0958Hi, adActivityIntent)) {
                    c0958Hi.A0F().AJQ();
                    return;
                }
                return;
            }
            applicationContext.startActivity(A01(adActivityIntent));
        } catch (ActivityNotFoundException e3) {
            throw new C2335p6(e3);
        }
    }

    public static boolean A0F(C0958Hi c0958Hi, Intent intent) throws C2335p6 {
        A07.get();
        return A0H(c0958Hi, intent, null);
    }

    public static boolean A0G(C0958Hi c0958Hi, Intent intent) throws C2335p6 {
        A07.get();
        if (0 == 0 || c0958Hi.A0E() == null) {
            return false;
        }
        c0958Hi.A0C();
        try {
            c0958Hi.A0E();
            throw new NullPointerException(A08(Sdk.SDKError.Reason.AD_IS_LOADING_VALUE, 22, 70));
        } catch (ActivityNotFoundException e3) {
            throw new C2335p6(e3);
        } catch (Exception e11) {
            c0958Hi.A08().ABz(A08(90, 8, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), AbstractC2126lf.A07, new C2127lg(e11));
            return false;
        }
    }

    public static boolean A0H(C0958Hi c0958Hi, Intent intent, InterfaceC2344pH interfaceC2344pH) throws C2335p6 {
        if (A0E(intent, C2203mv.A0X(c0958Hi))) {
            return false;
        }
        Context context = c0958Hi;
        String[] strArr = A01;
        if (strArr[6].length() != strArr[7].length()) {
            throw new RuntimeException();
        }
        A01[1] = "W";
        Context startContext = c0958Hi.A0E();
        if (startContext != null) {
            context = startContext;
        } else {
            intent.addFlags(268435456);
        }
        if (interfaceC2344pH != null && !A0E(intent, C2203mv.A0Z(c0958Hi))) {
            c0958Hi.A0C();
            try {
                throw new NullPointerException(A08(190, 13, 31));
            } catch (ActivityNotFoundException e3) {
                throw new C2335p6(e3);
            } catch (Exception e11) {
                c0958Hi.A08().ABz(A08(90, 8, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), AbstractC2126lf.A08, new C2127lg(e11));
                return false;
            }
        }
        try {
            context.startActivity(intent);
            return true;
        } catch (ActivityNotFoundException e12) {
            throw new C2335p6(e12);
        }
    }

    public static boolean A0I(C0958Hi c0958Hi, Uri uri, String str) throws ActivityNotFoundException {
        A08.get();
        return A0J(c0958Hi, uri, str, null);
    }

    public static boolean A0J(C0958Hi c0958Hi, Uri uri, String str, InterfaceC2346pJ interfaceC2346pJ) throws ActivityNotFoundException {
        if (interfaceC2346pJ == null || c0958Hi.A0E() == null) {
            return false;
        }
        new Bundle().putString(A08(98, 15, 64), str);
        uri.toString();
        c0958Hi.A0E();
        throw new NullPointerException(A08(172, 18, 104));
    }

    public static boolean A0K(C0958Hi c0958Hi, AdActivityIntent adActivityIntent) throws C2335p6 {
        Intent intentA01 = A01(adActivityIntent);
        try {
            Activity activityA00 = ActivityUtils.A00();
            if (activityA00 == null) {
                activityA00 = c0958Hi.A0E();
            }
            if (activityA00 == null) {
                return false;
            }
            activityA00.startActivityForResult(intentA01, 0);
            return true;
        } catch (ActivityNotFoundException e3) {
            throw new C2335p6(e3);
        } catch (RuntimeException e11) {
            if (C2203mv.A0n(c0958Hi)) {
                c0958Hi.A08().ABz(A08(90, 8, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), AbstractC2126lf.A08, new C2127lg(e11));
                return false;
            }
            throw e11;
        }
    }
}
