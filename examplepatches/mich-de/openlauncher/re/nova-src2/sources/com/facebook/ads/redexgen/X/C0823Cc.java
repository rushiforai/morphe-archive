package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* renamed from: com.facebook.ads.redexgen.X.Cc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0823Cc extends AbstractC1965j1 {
    public static byte[] A0R;
    public static String[] A0S = {"vVts3290hN8iYOphvTtUHsw8p", "g", "QXZRYfiopoOIgyOb", "uRY3EBcOhcPzIFCW", "1yhQGC5wOot73mjsntHrCCOy6H7", "ngPHprqJPXgJBcmGEhNrmzVf2B4dA5Oh", "DCeBbFrEMIUsiq6", "addqTveDrmk"};
    public C2648uC A02;
    public Runnable A03;
    public int A07;
    public InterfaceC2748vo A09;
    public C1539c2 A0B;
    public List<C2314ol> A0C;
    public boolean A0G;
    public final C06243u A0I;
    public final boolean A0J;
    public final int A0K;
    public final Context A0L;
    public final J7 A0M;
    public final AbstractC1973j9 A0N;
    public final Set<Integer> A0Q = new HashSet();
    public boolean A0F = true;
    public boolean A0D = true;
    public boolean A0E = true;
    public int A08 = -1;
    public float A06 = 0.0f;
    public final Handler A0H = new Handler(Looper.getMainLooper());
    public boolean A05 = false;
    public int A00 = 0;
    public long A01 = 5000;
    public boolean A04 = false;
    public final InterfaceC2752vs A0P = new C0826Cf(this);
    public InterfaceC2750vq A0A = new C0825Ce(this);
    public final InterfaceC2751vr A0O = new C0824Cd(this);

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0R, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 126);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0A() {
        A0R = new byte[]{-26, -6, -7, -12, 4, -11, -15, -26, -2, 4, -22, -13, -26, -25, -15, -22, -23, 4, -11, -26, -9, -26, -14, 7, 17, 29, 4, 7, 16, 17, 18, 29, 20, 7, 2, 3, 13, 29, 14, -1, 16, -1, 11, -5, -12, -15, -6, -14, -22, 4, -15, -22, -5, -22, -15, 4, -11, -26, -9, -26, -14};
    }

    static {
        A0A();
    }

    public C0823Cc(C06243u c06243u, int i5, int i11, C1539c2 c1539c2, Bundle bundle, boolean z11) {
        this.A0M = c06243u.getLayoutManager();
        this.A0K = i5;
        this.A07 = i11;
        this.A0B = c1539c2;
        this.A0N = new J5(c06243u.getContext());
        this.A0L = c06243u.getContext();
        this.A0I = c06243u;
        this.A0J = z11;
        c06243u.A1o(this);
        A0H(bundle);
    }

    private ED A03(int i5, int i11) {
        return A04(i5, i11, true);
    }

    private ED A04(int i5, int i11, boolean z11) {
        ED ed = null;
        while (i5 <= i11) {
            ED ed2 = (ED) this.A0M.A1z(i5);
            if (ed2 == null || ed2.A1n()) {
                return null;
            }
            boolean zA0m = A0m(ed2);
            int i12 = A0S[2].length();
            if (i12 != 16) {
                throw new RuntimeException();
            }
            A0S[0] = b.f42142b;
            if (ed == null && ed2.A1o() && zA0m && !this.A0Q.contains(Integer.valueOf(i5)) && (!z11 || A0M(ed2, this.A0K))) {
                ed = ed2;
            }
            if (ed2.A1o() && !zA0m) {
                A0G(i5, false);
            }
            i5++;
        }
        return ed;
    }

    private void A06() {
        if (!this.A0E) {
            return;
        }
        int lastVisibleItem = this.A0M.A39();
        int firstVisibleItem = this.A0M.A3A();
        ED edA03 = A03(lastVisibleItem, firstVisibleItem);
        if (edA03 != null) {
            edA03.A1l();
        }
    }

    private void A07() {
        if (this.A03 != null) {
            this.A0H.removeCallbacks(this.A03);
            this.A03 = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A08() {
        int iA38 = this.A0M.A38();
        if (this.A0J) {
            A0B(iA38);
        } else {
            A0C(iA38);
        }
    }

    private void A09() {
        A07();
        if (this.A05) {
            int i5 = this.A00;
            if (A0S[3].length() != 16) {
                throw new RuntimeException();
            }
            A0S[0] = "AtU1br2N8k1ZZmtyeIfqsYSd";
            if (i5 <= 1) {
                return;
            }
            this.A03 = new Runnable() { // from class: com.facebook.ads.redexgen.X.om
                @Override // java.lang.Runnable
                public final void run() {
                    this.A00.A0Z();
                }
            };
            this.A0H.postDelayed(this.A03, this.A01);
            if (this.A02 != null) {
                C2648uC c2648uC = this.A02;
                long j11 = this.A01;
                if (A0S[0].length() != 21) {
                    A0S[3] = "UAA6j1XDT1stqytK";
                    c2648uC.A0C(j11);
                } else {
                    c2648uC.A0C(j11);
                }
            }
        }
    }

    private void A0B(int i5) {
        if (i5 != -1 && this.A00 > 0) {
            int i11 = this.A00 - 1;
            if (A0S[0].length() == 21) {
                throw new RuntimeException();
            }
            A0S[2] = "Njy78PeapAzvoM0t";
            if (i5 >= i11) {
                A0Y();
            } else {
                A0c(i5 + 1);
            }
        }
    }

    private void A0C(int i5) {
        if (i5 >= 0 && i5 < this.A07 - 1) {
            A0c(i5 + 1);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0D(int i5) {
        ED edA04 = A04(i5 + 1, this.A0M.A3A(), false);
        if (edA04 != null) {
            edA04.A1l();
            A0c(((Integer) edA04.getTag(-1593835536)).intValue());
        }
    }

    private void A0E(int i5, int i11) {
        while (i5 <= i11) {
            A0b(i5);
            i5++;
        }
    }

    private final void A0F(int i5, int i11) {
        A0a(i5);
        A0a(i11);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0G(int i5, boolean z11) {
        if (z11) {
            this.A0Q.add(Integer.valueOf(i5));
        } else {
            this.A0Q.remove(Integer.valueOf(i5));
        }
    }

    private void A0H(Bundle bundle) {
        if (bundle == null) {
            return;
        }
        this.A06 = bundle.getFloat(A05(43, 18, 39), 0.0f);
        this.A0E = bundle.getBoolean(A05(0, 23, 39), true);
        this.A0F = bundle.getBoolean(A05(23, 20, 64), true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0L() {
        return this.A0K == 1;
    }

    public static boolean A0M(AbstractC2685un abstractC2685un, int i5) {
        int allowedAreaMaxX;
        int furthestX;
        if (i5 != 2) {
            allowedAreaMaxX = (int) (((abstractC2685un.getWidth() + AbstractC2385px.A04.widthPixels) * 1.3f) / 2.0f);
        } else {
            int i11 = AbstractC2385px.A04.widthPixels;
            if (A0S[5].charAt(29) != '5') {
                throw new RuntimeException();
            }
            A0S[0] = "Sny8hSa0LYjBAej7q";
            allowedAreaMaxX = i11 - 1;
        }
        if (i5 == 2) {
            furthestX = 1;
        } else {
            int i12 = AbstractC2385px.A04.widthPixels;
            int allowedAreaMinX = abstractC2685un.getWidth();
            furthestX = (int) (((i12 - allowedAreaMinX) * 0.7f) / 2.0f);
        }
        float x11 = abstractC2685un.getX();
        int allowedAreaMinX2 = abstractC2685un.getWidth();
        return ((int) (x11 + ((float) allowedAreaMinX2))) <= allowedAreaMaxX && abstractC2685un.getX() >= ((float) furthestX);
    }

    private boolean A0N(ED ed) {
        if (!this.A0F || !ed.A1o()) {
            return false;
        }
        this.A0F = false;
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1965j1
    public void A0P(C7O c7o, int i5) {
        super.A0P(c7o, i5);
        if (i5 == 1) {
            A0Y();
            return;
        }
        if (i5 != 0) {
            return;
        }
        this.A0G = true;
        A06();
        if (this.A05) {
            A09();
        } else {
            if (this.A02 == null) {
                return;
            }
            this.A02.A08();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1965j1
    public void A0Q(C7O c7o, int i5, int i11) {
        super.A0Q(c7o, i5, i11);
        this.A0G = false;
        if (this.A0D) {
            this.A0G = true;
            A06();
            this.A0D = false;
        }
        int lastVisibleItem = this.A0M.A39();
        int firstVisibleItem = this.A0M.A3A();
        A0F(lastVisibleItem, firstVisibleItem);
        A0E(lastVisibleItem, firstVisibleItem);
        A0d(lastVisibleItem, firstVisibleItem, i5);
    }

    public final InterfaceC2750vq A0R() {
        return this.A0A;
    }

    public final InterfaceC2751vr A0S() {
        return this.A0O;
    }

    public final InterfaceC2752vs A0T() {
        return this.A0P;
    }

    public final void A0U() {
        this.A08 = -1;
        int i5 = this.A0M.A3A();
        for (int iA39 = this.A0M.A39(); iA39 <= i5 && iA39 >= 0; iA39++) {
            ED ed = (ED) this.A0M.A1z(iA39);
            if (ed != null && ed.A1n()) {
                this.A08 = iA39;
                ed.A1k();
                return;
            }
        }
    }

    public final void A0V() {
        A07();
        if (this.A02 != null) {
            C2648uC c2648uC = this.A02;
            if (A0S[0].length() == 21) {
                throw new RuntimeException();
            }
            String[] strArr = A0S;
            strArr[6] = "JMVDYeTpoC0fdlF";
            strArr[7] = "BlNVWh9QARl";
            c2648uC.A09();
        }
    }

    public final void A0W() {
        ED ed = (ED) this.A0M.A1z(this.A08);
        if (ed != null && this.A08 >= 0) {
            ed.A1l();
        }
    }

    public final void A0X() {
        if (this.A05) {
            A09();
            if (this.A02 != null) {
                this.A02.A0A();
            }
        }
    }

    public final void A0Y() {
        this.A05 = false;
        A07();
        if (this.A02 != null) {
            this.A02.A08();
        }
    }

    public final /* synthetic */ void A0Z() {
        if (!this.A05 || this.A0I == null) {
            return;
        }
        int iA38 = this.A0M.A38();
        if (iA38 == -1) {
            iA38 = 0;
        }
        int curPos = this.A00;
        if (iA38 >= curPos - 1) {
            A0Y();
        } else {
            int curPos2 = iA38 + 1;
            A0c(curPos2);
        }
    }

    public final void A0a(int i5) {
        ED ed = (ED) this.A0M.A1z(i5);
        if (ed == null || A0m(ed)) {
            return;
        }
        String[] strArr = A0S;
        if (strArr[6].length() == strArr[7].length()) {
            throw new RuntimeException();
        }
        A0S[0] = "Vxamqv9qm4zlsVVB8";
        A0j(ed, false);
    }

    public final void A0b(int i5) {
        ED ed = (ED) this.A0M.A1z(i5);
        if (ed == null) {
            return;
        }
        if (A0m(ed)) {
            A0j(ed, true);
        }
        if (A0N(ed) && this.A0C != null) {
            this.A0P.setVolume(this.A0C.get(((Integer) ed.getTag(-1593835536)).intValue()).A03().A0I().A0A() ? 0.0f : 1.0f);
        }
    }

    public final void A0c(int i5) {
        this.A0N.A0H(i5);
        this.A0M.A2c(this.A0N);
    }

    public final void A0d(int i5, int i11, int i12) {
        if (!A0L() || this.A09 == null) {
            return;
        }
        int recomputeFrom = this.A0M.A38();
        if (recomputeFrom == -1) {
            recomputeFrom = i12 < 0 ? i5 : i11;
        }
        this.A09.ALu(recomputeFrom);
        if (this.A05) {
            return;
        }
        C2648uC c2648uC = this.A02;
        String[] strArr = A0S;
        String str = strArr[1];
        String str2 = strArr[4];
        int recomputeFrom2 = str.length();
        int firstCompletelyVisible = str2.length();
        if (recomputeFrom2 == firstCompletelyVisible) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0S;
        strArr2[1] = "G";
        strArr2[4] = "5LK315oexhQLrUarwjj5oXtvCwP";
        if (c2648uC != null) {
            this.A02.A08();
        }
    }

    public final void A0e(int i5, long j11) {
        this.A00 = i5;
        this.A01 = j11;
        this.A05 = true;
        A09();
    }

    public final void A0f(Bundle bundle) {
        bundle.putFloat(A05(43, 18, 39), this.A06);
        bundle.putBoolean(A05(0, 23, 39), this.A0E);
        bundle.putBoolean(A05(23, 20, 64), this.A0F);
    }

    public void A0g(View view, boolean z11) {
        if (this.A04) {
            return;
        }
        view.setAlpha(z11 ? 1.0f : 0.5f);
    }

    public final void A0h(C2648uC c2648uC) {
        this.A02 = c2648uC;
    }

    public final void A0i(InterfaceC2748vo interfaceC2748vo) {
        this.A09 = interfaceC2748vo;
    }

    public void A0j(ED ed, boolean z11) {
        if (A0L()) {
            A0g(ed, z11);
        }
        if (z11) {
            return;
        }
        boolean zA1n = ed.A1n();
        String[] strArr = A0S;
        if (strArr[6].length() == strArr[7].length()) {
            throw new RuntimeException();
        }
        A0S[2] = "slnyAJQBNPORwedJ";
        if (zA1n) {
            ed.A1k();
        }
    }

    public void A0k(List<C2314ol> list) {
        this.A0C = list;
    }

    public final void A0l(boolean z11) {
        this.A04 = z11;
    }

    public boolean A0m(View view) {
        Rect rect = new Rect();
        view.getGlobalVisibleRect(rect);
        return ((float) rect.width()) / ((float) view.getWidth()) >= 0.15f;
    }
}
