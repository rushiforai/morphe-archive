package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.facebook.ads.androidx.media3.extractor.ExtractorsFactory;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.8o, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07418o {
    public static byte[] A07;
    public InterfaceC1291Uy A02;
    public String A05;
    public final NN A06;
    public InterfaceC1212Ru A01 = AbstractC1209Rr.A01();
    public X1 A03 = new C1185Qt();
    public int A00 = 1048576;

    @MetaExoPlayerCustomization
    public InterfaceC1317Wb<XN> A04 = new InterfaceC1317Wb() { // from class: com.facebook.ads.redexgen.X.Rf
        @Override // com.facebook.ads.redexgen.X.InterfaceC1317Wb
        public final Object get() {
            return C07418o.A01();
        }
    };

    static {
        A03();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 47);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A07 = new byte[]{-118, -73, -73, -76, -73, 101, -82, -77, -72, -71, -90, -77, -71, -82, -90, -71, -82, -77, -84, 101, -119, -86, -85, -90, -70, -79, -71, -118, -67, -71, -73, -90, -88, -71, -76, -73, -72, -117, -90, -88, -71, -76, -73, -66, -86, -74, -76, 117, -83, -88, -86, -84, -87, -74, -74, -78, 117, -88, -85, -70, 117, -88, -75, -85, -71, -74, -80, -85, -65, 117, -76, -84, -85, -80, -88, 122, 117, -84, -65, -69, -71, -88, -86, -69, -74, -71, 117, -117, -84, -83, -88, -68, -77, -69, -116, -65, -69, -71, -88, -86, -69, -74, -71, -70, -115, -88, -86, -69, -74, -71, -64};
    }

    public C07418o(NN nn2) {
        this.A06 = nn2;
    }

    public static /* synthetic */ C1210Rs A00(InterfaceC1387Yz interfaceC1387Yz, QD qd2) {
        return new C1210Rs(interfaceC1387Yz);
    }

    public static /* synthetic */ XN A01() {
        return null;
    }

    @MetaExoPlayerCustomization
    public final C8n A04(Uri uri) throws NoSuchMethodException, SecurityException {
        String strA02 = A02(0, 44, 22);
        if (this.A02 == null) {
            try {
                Constructor<? extends ExtractorsFactory> constructor = Class.forName(A02(44, 67, 24)).asSubclass(InterfaceC1387Yz.class).getConstructor(new Class[0]);
                final InterfaceC1387Yz interfaceC1387Yz = (InterfaceC1387Yz) constructor.newInstance(new Object[0]);
                this.A02 = new InterfaceC1291Uy() { // from class: com.facebook.ads.redexgen.X.Rh
                    @Override // com.facebook.ads.redexgen.X.InterfaceC1291Uy
                    public final InterfaceC1292Uz A66(QD qd2) {
                        return C07418o.A00(interfaceC1387Yz, qd2);
                    }
                };
            } catch (ClassNotFoundException e3) {
                throw new RuntimeException(strA02, e3);
            } catch (IllegalAccessException e11) {
                throw new RuntimeException(strA02, e11);
            } catch (InstantiationException e12) {
                throw new RuntimeException(strA02, e12);
            } catch (NoSuchMethodException e13) {
                throw new RuntimeException(strA02, e13);
            } catch (InvocationTargetException e14) {
                throw new RuntimeException(strA02, e14);
            }
        }
        return new C8n(new C1034Kj().A00(uri).A02(this.A05).A01(null).A05(), this.A06, this.A02, this.A01, this.A03, this.A00, null);
    }
}
