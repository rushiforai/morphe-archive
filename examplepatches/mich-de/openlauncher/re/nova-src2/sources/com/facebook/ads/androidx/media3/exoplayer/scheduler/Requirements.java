package com.facebook.ads.androidx.media3.exoplayer.scheduler;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.PowerManager;
import com.facebook.ads.redexgen.X.AbstractC1062Ln;
import com.facebook.ads.redexgen.X.N1;
import com.facebook.ads.redexgen.X.UA;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class Requirements implements Parcelable {
    public static byte[] A01;
    public static String[] A02 = {"4gV7vCuh0zaFd2OwwXNJgaJNWio9KHfF", "2IAIJ97slDcdy", "4S4Mj7ExqoeJ0svhvCjGYeTZB1oXboIh", "oAxvcP3BzuKZMt7ZUsd69VRWGmZ8rrTZ", "AXi9CQkInCM7Y", "bpU8vbK8oI9iAz5Hi0ieqPMoLZxqNYhL", "XXZyLuBM4fP4RC1ZmaferKg0OTWQVKRs", "PByK9OZSC5cqLtWxNEi9UgA7dqMbrIft"};
    public static final Parcelable.Creator<Requirements> CREATOR;
    public final int A00;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 61);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A01 = new byte[]{-18, -5, -15, -1, -4, -10, -15, -69, -10, -5, 1, -14, -5, 1, -69, -18, -16, 1, -10, -4, -5, -69, -49, -50, -31, -31, -46, -33, -26, -20, -48, -43, -50, -37, -44, -46, -47, -66, -53, -63, -49, -52, -58, -63, -117, -58, -53, -47, -62, -53, -47, -117, -66, -64, -47, -58, -52, -53, -117, -95, -94, -77, -90, -96, -94, -68, -80, -79, -84, -81, -98, -92, -94, -68, -87, -84, -76, -85, -73, -74, -74, -83, -85, -68, -79, -66, -79, -68, -63, 44, 43, 51, 33, 46, -75, -74, -93, -74, -73, -75};
    }

    static {
        A02();
        CREATOR = new UA();
    }

    public Requirements(int i5) {
        this.A00 = (i5 & 2) != 0 ? i5 | 1 : i5;
    }

    private int A00(Context context) {
        if (!A0A()) {
            return 0;
        }
        ConnectivityManager connectivityManager = (ConnectivityManager) AbstractC1062Ln.A01(context.getSystemService(A01(77, 12, 11)));
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        if (activeNetworkInfo != null && activeNetworkInfo.isConnected() && A06(connectivityManager)) {
            return (A0C() && connectivityManager.isActiveNetworkMetered()) ? 2 : 0;
        }
        return this.A00 & 3;
    }

    private boolean A03(Context context) {
        Intent intentRegisterReceiver = context.registerReceiver(null, new IntentFilter(A01(0, 37, 80)));
        if (intentRegisterReceiver == null) {
            return false;
        }
        int intExtra = intentRegisterReceiver.getIntExtra(A01(94, 6, 5), -1);
        return intExtra == 2 || intExtra == 5;
    }

    private boolean A04(Context context) {
        PowerManager powerManager = (PowerManager) AbstractC1062Ln.A01(context.getSystemService(A01(89, 5, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE)));
        if (N1.A02 >= 23) {
            return powerManager.isDeviceIdleMode();
        }
        return N1.A02 < 20 ? !powerManager.isScreenOn() : !powerManager.isInteractive();
    }

    private boolean A05(Context context) {
        return context.registerReceiver(null, new IntentFilter(A01(37, 40, 32))) == null;
    }

    public static boolean A06(ConnectivityManager connectivityManager) {
        if (N1.A02 < 24) {
            return true;
        }
        Network activeNetwork = connectivityManager.getActiveNetwork();
        if (activeNetwork == null) {
            return false;
        }
        try {
            NetworkCapabilities networkCapabilities = connectivityManager.getNetworkCapabilities(activeNetwork);
            if (networkCapabilities != null) {
                if (networkCapabilities.hasCapability(16)) {
                    return true;
                }
            }
            return false;
        } catch (SecurityException unused) {
            return true;
        }
    }

    public final int A07(Context context) {
        int iA00 = A00(context);
        if (A08()) {
            boolean zA03 = A03(context);
            if (A02[7].charAt(17) == 'x') {
                throw new RuntimeException();
            }
            String[] strArr = A02;
            strArr[2] = "wgr3q2Tt3i7wPOsSVYThpvPZdmiMlCaF";
            strArr[3] = "i9wSXib3dUHk1rcuU9mlfyCWCg0N7MfG";
            if (!zA03) {
                iA00 |= 8;
            }
        }
        if (A09() && !A04(context)) {
            iA00 |= 4;
        }
        if (A0B() && !A05(context)) {
            return iA00 | 16;
        }
        return iA00;
    }

    public final boolean A08() {
        return (this.A00 & 8) != 0;
    }

    public final boolean A09() {
        return (this.A00 & 4) != 0;
    }

    public final boolean A0A() {
        return (this.A00 & 1) != 0;
    }

    public final boolean A0B() {
        return (this.A00 & 16) != 0;
    }

    public final boolean A0C() {
        return (this.A00 & 2) != 0;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return obj != null && getClass() == obj.getClass() && this.A00 == ((Requirements) obj).A00;
    }

    public final int hashCode() {
        return this.A00;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.A00);
    }
}
