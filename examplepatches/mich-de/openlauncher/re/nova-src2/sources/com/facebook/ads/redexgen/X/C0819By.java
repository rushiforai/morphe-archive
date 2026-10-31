package com.facebook.ads.redexgen.X;

import android.graphics.drawable.ColorDrawable;
import android.util.SparseBooleanArray;
import android.widget.ImageView;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.Map;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.By, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0819By extends AbstractC1978jE {
    public static byte[] A0C;
    public static final C1916iC A0D;
    public AbstractC1540c3 A00;
    public C1539c2 A01;
    public final SparseBooleanArray A02;
    public final ImageView A03;
    public final C1750fT A04;
    public final C0958Hi A05;
    public final InterfaceC2224nG A06;
    public final C2417qT A07;
    public final C1539c2 A08;
    public final String A09;
    public final InterfaceC05610m<Map<String, String>, AnonymousClass22> A0A;
    public final boolean A0B;

    static {
        A09();
        A0D = new C1916iC(null);
    }

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 46);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        A0C = new byte[]{9, 12, -19, 30, 13, 22, 28, -11, 9, 22, 9, 15, 13, 26, -86, -88, -71, -85, -112, -75, -83, -74, -105, -107, -90, -104, -89, 125, -95, -92, -90, -103, -89, -89, -99, -93, -94, -89, -18, -9, -12, -16, -7, -1, -33, -6, -10, -16, -7, -75, -63, -64, -58, -73, -54, -58, -78, -74, -86, -80, -82, -97, -78, -82, -64, -19, -20, -63, -22, -25, -31, -23, -30, -45, -28, -41, -32, -26, -56, -37, -41, -23, -45, -44, -37, -34, -37, -26, -21, -75, -38, -41, -43, -35, -41, -28, -24, -29, -23, -41, -36, -72, -43, -24, -43, -58, -39, -41, -29, -26, -40, -39, -26};
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public C0819By(ImageView imageView, C0958Hi c0958Hi, SparseBooleanArray sparseBooleanArray, C1539c2 c1539c2, InterfaceC2224nG interfaceC2224nG, C2417qT c2417qT, String str, C1750fT c1750fT, InterfaceC05610m<? super Map<String, String>, AnonymousClass22> interfaceC05610m, boolean z11) {
        super(imageView);
        C1h.A09(imageView, A07(56, 9, 27));
        C1h.A09(c0958Hi, A07(49, 7, 36));
        C1h.A09(sparseBooleanArray, A07(22, 16, 6));
        C1h.A09(c1539c2, A07(72, 24, 68));
        C1h.A09(interfaceC2224nG, A07(0, 14, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE));
        C1h.A09(c2417qT, A07(96, 17, 70));
        C1h.A09(str, A07(38, 11, 93));
        this.A03 = imageView;
        this.A05 = c0958Hi;
        this.A02 = sparseBooleanArray;
        this.A08 = c1539c2;
        this.A06 = interfaceC2224nG;
        this.A07 = c2417qT;
        this.A09 = str;
        this.A04 = c1750fT;
        this.A0A = interfaceC05610m;
        this.A0B = z11;
    }

    private final void A0A(C1962iy c1962iy, AsyncTaskC0892Et asyncTaskC0892Et) {
        if (!this.A0B || this.A02.get(c1962iy.A02())) {
            return;
        }
        C1539c2 checker = this.A01;
        if (checker != null) {
            checker.A0V();
            this.A01 = null;
        }
        Map urlParams = c1962iy.A08();
        this.A00 = new C0(this, c1962iy, urlParams);
        C1539c2 c1539c2 = new C1539c2(this.A03, 10, new WeakReference(this.A00), this.A05);
        c1539c2.A0Y(false);
        c1539c2.A0W(100);
        c1539c2.A0X(100);
        this.A01 = c1539c2;
        asyncTaskC0892Et.A06(new C0820Bz(c1962iy, this));
    }

    public final void A0w() {
        C1539c2 c1539c2 = this.A01;
        if (c1539c2 != null) {
            c1539c2.A0V();
        }
        this.A01 = null;
        this.A00 = null;
    }

    public final void A0x(C1962iy c1962iy, boolean z11, InterfaceC05620n<AnonymousClass22> interfaceC05620n) {
        C1h.A09(c1962iy, A07(14, 8, 25));
        C1h.A09(interfaceC05620n, A07(65, 7, 80));
        InterfaceC05610m<Map<String, String>, AnonymousClass22> interfaceC05610m = this.A0A;
        if (interfaceC05610m != null) {
            interfaceC05610m.AB1(c1962iy.A08());
        }
        AsyncTaskC0892Et asyncTaskC0892Et = new AsyncTaskC0892Et(this.A03, this.A05);
        A0A(c1962iy, asyncTaskC0892Et);
        asyncTaskC0892Et.A07(c1962iy.A06());
        if (z11) {
            this.A03.setPadding(AbstractC2383pv.A0K, AbstractC2383pv.A0K, AbstractC2383pv.A0K, AbstractC2383pv.A0K);
            this.A03.setCropToPadding(true);
            AbstractC2426qc.A0W(this.A03, new ColorDrawable(-15173646));
        } else {
            this.A03.setPadding(0, 0, 0, 0);
            this.A03.setCropToPadding(false);
            AbstractC2426qc.A0W(this.A03, new ColorDrawable(0));
        }
        this.A03.setOnClickListener(new ViewOnClickListenerC1913i9(interfaceC05620n));
    }
}
