package com.facebook.ads.redexgen.X;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.RemoteException;
import android.support.customtabs.ICustomTabsService;
import android.util.Log;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Io, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC0990Io {
    public static byte[] A03;
    public final ComponentName A00;
    public final Context A01;
    public final ICustomTabsService A02;

    static {
        A05();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 56);
        }
        return new String(bArrCopyOfRange);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 9 out of bounds for length 9
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static String A04(Context context, List<String> list, boolean z11) {
        ResolveInfo resolveInfoResolveActivity;
        PackageManager packageManager = context.getPackageManager();
        List<String> arrayList = list == null ? new ArrayList<>() : list;
        Intent intent = new Intent(A02(196, 26, Sdk.SDKError.Reason.TPAT_ERROR_VALUE), Uri.parse(A02(Sdk.SDKError.Reason.GENERATE_JSON_DATA_ERROR_VALUE, 7, 1)));
        if (!z11 && (resolveInfoResolveActivity = packageManager.resolveActivity(intent, 0)) != null) {
            String str = resolveInfoResolveActivity.activityInfo.packageName;
            arrayList = new ArrayList<>(arrayList.size() + 1);
            arrayList.add(str);
            if (list != null) {
                arrayList.addAll(list);
            }
        }
        Intent intent2 = new Intent(A02(Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE, 51, 98));
        for (String str2 : arrayList) {
            intent2.setPackage(str2);
            if (packageManager.resolveService(intent2, 0) != null) {
                return str2;
            }
        }
        if (Build.VERSION.SDK_INT < 30) {
            return null;
        }
        Log.w(A02(0, 16, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE), A02(48, 148, 25));
        return null;
    }

    public static void A05() {
        A03 = new byte[]{12, 58, 60, 59, 32, 34, 27, 46, 45, 60, 12, 35, 38, 42, 33, 59, 77, 123, 108, 104, 119, 125, 123, 62, 87, 112, 106, 123, 112, 106, 109, 62, 115, 107, 109, 106, 62, 124, 123, 62, 123, 102, 110, 114, 119, 125, 119, 106, 116, 79, 64, 67, 77, 68, 1, 85, 78, 1, 71, 72, 79, 69, 1, 64, 79, 88, 1, 98, 84, 82, 85, 78, 76, 1, 117, 64, 67, 82, 1, 81, 64, 66, 74, 64, 70, 68, 82, 13, 1, 88, 78, 84, 1, 76, 64, 88, 1, 79, 68, 68, 69, 1, 85, 78, 1, 64, 69, 69, 1, 64, 1, 29, 80, 84, 68, 83, 72, 68, 82, 31, 1, 68, 77, 68, 76, 68, 79, 85, 1, 85, 78, 1, 88, 78, 84, 83, 1, 76, 64, 79, 72, 71, 68, 82, 85, 15, 1, 114, 68, 68, 1, 85, 73, 68, 1, 69, 78, 66, 82, 1, 71, 78, 83, 1, 98, 84, 82, 85, 78, 76, 117, 64, 67, 82, 98, 77, 72, 68, 79, 85, 2, 70, 68, 85, 113, 64, 66, 74, 64, 70, 68, 111, 64, 76, 68, 15, 32, 47, 37, 51, 46, 40, 37, 111, 40, 47, 53, 36, 47, 53, 111, 32, 34, 53, 40, 46, 47, 111, 23, 8, 4, 22, 59, 52, 62, 40, 53, 51, 62, 116, 41, 47, 42, 42, 53, 40, 46, 116, 57, 47, 41, 46, 53, 55, 46, 59, 56, 41, 116, 59, 57, 46, 51, 53, 52, 116, 25, 47, 41, 46, 53, 55, 14, 59, 56, 41, 9, 63, 40, 44, 51, 57, 63, 119, 120, 114, 100, 121, AbstractJsonLexerKt.TC_INVALID, 114, 56, 101, 99, 102, 102, 121, 100, 98, 56, 117, 99, 101, 98, 121, 123, 98, 119, 116, 101, 56, 115, 110, 98, 100, 119, 56, 69, 83, 69, 69, 95, 89, 88, 73, 95, 82, 81, 77, 77, 73, 3, 22, 22};
    }

    public AbstractC0990Io(ICustomTabsService iCustomTabsService, ComponentName componentName, Context context) {
        this.A02 = iCustomTabsService;
        this.A00 = componentName;
        this.A01 = context;
    }

    private BinderC0989In A00(IX ix2) {
        return new BinderC0989In(this, ix2);
    }

    private JQ A01(IX ix2, PendingIntent pendingIntent) {
        boolean zNewSession;
        BinderC0989In binderC0989InA00 = A00(ix2);
        try {
            if (pendingIntent != null) {
                Bundle bundle = new Bundle();
                bundle.putParcelable(A02(273, 43, 46), pendingIntent);
                zNewSession = this.A02.newSessionWithExtras(binderC0989InA00, bundle);
            } else {
                zNewSession = this.A02.newSession(binderC0989InA00);
            }
            if (!zNewSession) {
                return null;
            }
            return new JQ(this.A02, binderC0989InA00, this.A00, pendingIntent);
        } catch (RemoteException unused) {
            return null;
        }
    }

    public static String A03(Context context, List<String> packages) {
        return A04(context, packages, false);
    }

    public static boolean A06(Context context, String str, JF jf2) {
        jf2.A05(context.getApplicationContext());
        Intent intent = new Intent(A02(Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE, 51, 98));
        if (!str.isEmpty()) {
            intent.setPackage(str);
            return context.bindService(intent, jf2, 33);
        }
        throw new IllegalArgumentException(A02(16, 32, 38));
    }

    public final JQ A07(IX ix2) {
        return A01(ix2, null);
    }

    public final boolean A08(long j11) {
        try {
            return this.A02.warmup(j11);
        } catch (RemoteException unused) {
            return false;
        }
    }
}
