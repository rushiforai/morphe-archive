package com.facebook.ads.redexgen.X;

import com.facebook.ads.RewardData;
import com.facebook.ads.internal.protocol.AdPlacementType;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.7a, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07087a extends KI {
    public static byte[] A00;
    public static String[] A01 = {"QPajxPBXawZguZvIACdyFqOYUKJhGG1P", "5fhxQ1wmDDZwcYW6vVZtBFGAbpCppeaF", "0C8PIOmzvjBgpmOh8JUWA", "4kKOVZ4CcWBKVljagfvAN2XyBryastSO", "Oy7EzKzQwTS7e9udIDBq4FtqglrDvqBF", "BZaaKRqUw", "6zOS7wuF6dlGz7u6SsHniaRnv53e8kon", "jwUp8OtoUlvjJY1bP74aKb8UsU7a0Ko9"};

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A01;
            if (strArr[7].charAt(30) != strArr[6].charAt(30)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[1] = "Dg0tZg7IxBj4D2AEunqK4FRxjbaI0pzK";
            strArr2[4] = "5sVR5Q40j80Tm4EH72ZLdFDAQDj0jOHn";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 112);
            i13++;
        }
    }

    public static void A02() {
        A00 = new byte[]{-11, -13, 0, -78, 1, 0, -2, 11, -78, 5, -9, 6, -78, 1, 0, -78, 4, -9, 9, -13, 4, -10, -9, -10, -78, 8, -5, -10, -9, 1, -78, -13, -10, 5, -15, -14, -93, -28, -25, -28, -13, -9, -24, -11, -93, -11, -24, -28, -25, -4, -93, -9, -14, -93, -10, -24, -9, -93, -11, -24, -6, -28, -11, -25, -93, -14, -15};
    }

    static {
        A02();
    }

    public C07087a(C0958Hi c0958Hi, C1781fy c1781fy) {
        super(c0958Hi, c1781fy);
    }

    private KA A00(Runnable runnable) {
        return new KA(this, runnable);
    }

    @Override // com.facebook.ads.redexgen.X.KI
    public final void A0O() {
        LG lg2 = (LG) this.A01;
        if (lg2 != null) {
            lg2.A00(this.A08.A00);
            lg2.A01(this.A08.A01);
            lg2.A0K();
        }
    }

    @Override // com.facebook.ads.redexgen.X.KI
    public final void A0Q(InterfaceC1708en interfaceC1708en, C2145ly c2145ly, C2143lw c2143lw, C1782fz c1782fz) {
        C07207m c07207m = (C07207m) interfaceC1708en;
        KB kb2 = new KB(this, c1782fz, c07207m);
        if (C2203mv.A2h(this.A0B)) {
            A0G().postDelayed(kb2, c2145ly.A05().A05());
        }
        C0958Hi c0958Hi = this.A0B;
        KA kaA00 = A00(kb2);
        boolean z11 = this.A08.A06;
        String str = this.A08.A04;
        C1781fy c1781fy = this.A08;
        String[] strArr = A01;
        if (strArr[3].charAt(31) == strArr[0].charAt(31)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[3] = "qv162d7nxdmOCgZ5HSNnY6lM4lD0tO4m";
        strArr2[0] = "JwvltbAvbK0MQjlZGmmyrgC4vpl52SAH";
        c07207m.A0L(c0958Hi, kaA00, c1782fz, z11, str, c1781fy.A05);
    }

    public final void A0Z(RewardData rewardData) {
        if (this.A01 != null) {
            if (this.A01.A9N() == AdPlacementType.REWARDED_VIDEO) {
                LG rewardedVideoAdapter = (LG) this.A01;
                rewardedVideoAdapter.A02(rewardData);
                return;
            }
            throw new IllegalStateException(A01(0, 34, 34));
        }
        throw new IllegalStateException(A01(34, 33, 19));
    }
}
