package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.os.Bundle;
import android.util.SparseArray;
import android.util.SparseBooleanArray;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.8i, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07408i extends U1 implements InterfaceC1018Jt {
    public final boolean A00;
    public final boolean A01;
    public final boolean A02;
    public final boolean A03;
    public final boolean A04;
    public final boolean A05;
    public final boolean A06;
    public final boolean A07;
    public final boolean A08;
    public final boolean A09;

    @MetaExoPlayerCustomization
    public final boolean A0A;
    public final boolean A0B;
    public final boolean A0C;
    public final boolean A0D;
    public final SparseArray<Map<RY, RJ>> A0E;
    public final SparseBooleanArray A0F;
    public static String[] A0G = {"J", "xWG4Mkyo2MmcVDLPPoqlOuE0lrIimz", "aN0VAozLqdag2Rs10PGvHItyw5xgRBq5", "ex4nLgeroSUSpUiDdzI7O", "w60QnQLcu", "SaQXQ1r1XCYLVsuzTlJVce3FuRXNLfft", "mn2Eym2JuaZKOd", "A49lLS5Cjfo97WvzNkArZLV7WxXawoAY"};
    public static final C07408i A0J = new RL().A0p();

    @Deprecated
    public static final C07408i A0I = A0J;
    public static final String A0W = N1.A0h(1000);
    public static final String A0Q = N1.A0h(1001);
    public static final String A0R = N1.A0h(1002);
    public static final String A0T = N1.A0h(BackupConstant.SCENE_CLOSED_WITHOUT_SHOW);
    public static final String A0M = N1.A0h(1004);
    public static final String A0N = N1.A0h(1005);
    public static final String A0K = N1.A0h(1006);
    public static final String A0V = N1.A0h(1007);
    public static final String A0b = N1.A0h(1008);
    public static final String A0O = N1.A0h(1009);
    public static final String A0Z = N1.A0h(TTAdConstant.IMAGE_MODE_1010);
    public static final String A0a = N1.A0h(TTAdConstant.IMAGE_MODE_1011);
    public static final String A0Y = N1.A0h(TTAdConstant.IMAGE_MODE_1012);
    public static final String A0X = N1.A0h(1013);
    public static final String A0P = N1.A0h(1014);
    public static final String A0L = N1.A0h(1015);
    public static final String A0S = N1.A0h(1016);
    public static final String A0U = N1.A0h(1017);
    public static final InterfaceC1017Js<C07408i> A0H = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.RN
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return new RL(bundle).A0p();
        }
    };

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static boolean A0M(SparseArray<Map<RY, RJ>> sparseArray, SparseArray<Map<RY, RJ>> sparseArray2) {
        int size = sparseArray.size();
        if (sparseArray2.size() != size) {
            return false;
        }
        for (int i5 = 0; i5 < size; i5++) {
            int iIndexOfKey = sparseArray2.indexOfKey(sparseArray.keyAt(i5));
            if (iIndexOfKey < 0 || !A0O(sparseArray.valueAt(i5), sparseArray2.valueAt(iIndexOfKey))) {
                return false;
            }
        }
        return true;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static boolean A0O(Map<RY, RJ> map, Map<RY, RJ> map2) {
        if (map2.size() != map.size()) {
            return false;
        }
        for (Map.Entry<RY, RJ> entry : map.entrySet()) {
            RY key = entry.getKey();
            if (!map2.containsKey(key) || !N1.A1E(entry.getValue(), map2.get(key))) {
                return false;
            }
        }
        return true;
    }

    public C07408i(RL rl2) {
        super(rl2);
        this.A0C = rl2.A0C;
        this.A06 = rl2.A06;
        this.A07 = rl2.A07;
        this.A05 = rl2.A05;
        this.A09 = rl2.A09;
        this.A02 = rl2.A02;
        this.A03 = rl2.A03;
        this.A00 = rl2.A00;
        this.A01 = rl2.A01;
        this.A08 = rl2.A08;
        this.A0B = rl2.A0B;
        this.A0D = rl2.A0D;
        this.A04 = rl2.A04;
        this.A0E = rl2.A0E;
        this.A0F = rl2.A0F;
        this.A0A = rl2.A0A;
    }

    public static C07408i A02(Context context) {
        return new RL(context).A0p();
    }

    public static /* synthetic */ String A05() {
        String str = A0S;
        if (A0G[3].length() == 13) {
            throw new RuntimeException();
        }
        A0G[4] = "rpve0NCow";
        return str;
    }

    public static /* synthetic */ String A0E() {
        String str = A0Y;
        if (A0G[4].length() != 9) {
            throw new RuntimeException();
        }
        A0G[6] = "pXQafUYt4hfHbgNpu1U";
        return str;
    }

    public static /* synthetic */ String A0G() {
        String str = A0R;
        if (A0G[3].length() == 13) {
            throw new RuntimeException();
        }
        A0G[2] = "edbFXJ2bZR0OTpNx48kTq5jWgi6IHk7w";
        return str;
    }

    public static boolean A0N(SparseBooleanArray sparseBooleanArray, SparseBooleanArray sparseBooleanArray2) {
        int size = sparseBooleanArray.size();
        int firstSize = sparseBooleanArray2.size();
        if (firstSize != size) {
            return false;
        }
        for (int indexInFirst = 0; indexInFirst < size; indexInFirst++) {
            int firstSize2 = sparseBooleanArray.keyAt(indexInFirst);
            if (sparseBooleanArray2.indexOfKey(firstSize2) < 0) {
                return false;
            }
        }
        return true;
    }

    public final RL A0P() {
        return new RL(this);
    }

    @Deprecated
    public final RJ A0Q(int i5, RY ry2) {
        Map<RY, RJ> map = this.A0E.get(i5);
        if (map != null) {
            return map.get(ry2);
        }
        return null;
    }

    public final boolean A0R(int i5) {
        return this.A0F.get(i5);
    }

    @Deprecated
    public final boolean A0S(int i5, RY ry2) {
        Map<RY, RJ> map = this.A0E.get(i5);
        return map != null && map.containsKey(ry2);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0047  */
    @Override // com.facebook.ads.redexgen.X.U1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        C07408i c07408i = (C07408i) obj;
        boolean zEquals = super.equals(c07408i);
        if (A0G[3].length() == 13) {
            throw new RuntimeException();
        }
        A0G[1] = "OOXRexOVznW4XDpxjXQwLF";
        if (zEquals && this.A0C == c07408i.A0C) {
            boolean z11 = this.A06;
            if (A0G[4].length() == 9) {
                A0G[6] = "G3td";
                if (z11 == c07408i.A06) {
                }
            } else if (z11 == c07408i.A06) {
                if (this.A07 == c07408i.A07 && this.A05 == c07408i.A05 && this.A09 == c07408i.A09 && this.A02 == c07408i.A02 && this.A03 == c07408i.A03 && this.A00 == c07408i.A00 && this.A01 == c07408i.A01 && this.A08 == c07408i.A08 && this.A0B == c07408i.A0B && this.A0D == c07408i.A0D && this.A04 == c07408i.A04 && A0N(this.A0F, c07408i.A0F) && A0M(this.A0E, c07408i.A0E)) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.U1
    public final int hashCode() {
        return (((((((((((((((((((((((((((1 * 31) + super.hashCode()) * 31) + (this.A0C ? 1 : 0)) * 31) + (this.A06 ? 1 : 0)) * 31) + (this.A07 ? 1 : 0)) * 31) + (this.A05 ? 1 : 0)) * 31) + (this.A09 ? 1 : 0)) * 31) + (this.A02 ? 1 : 0)) * 31) + (this.A03 ? 1 : 0)) * 31) + (this.A00 ? 1 : 0)) * 31) + (this.A01 ? 1 : 0)) * 31) + (this.A08 ? 1 : 0)) * 31) + (this.A0B ? 1 : 0)) * 31) + (this.A0D ? 1 : 0)) * 31) + (this.A04 ? 1 : 0);
    }
}
