package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.RelativeLayout;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class FJ extends RelativeLayout implements InterfaceC2460rA {
    public static byte[] A02;
    public final C1998jY A00;
    public final C0958Hi A01;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 110);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{1, 11, 1, 6, 23, 31, 13, 16, 0, 29, 5, 1, 23, 0, 120, 122, 109, 112, 111, 112, 109, 96, 80, 116, 105, 117, 64, 69, 98, 78, 79, 85, 68, 89, 85, 118, 83, 64, 81, 81, 68, 83, 86, 89, 83, 69, 88, 94, 83, 25, 94, 89, 67, 82, 89, 67, 25, 86, 84, 67, 94, 88, 89, 25, 97, 126, 114, 96, 56, 40, 53, 45, 41, 63, 40, 15, 8, 22, 15, 10, 31, 10, AbstractJsonLexerKt.TC_INVALID, 120, 98, 115, 120, 98, 103, 98, 120, AbstractJsonLexerKt.TC_INVALID, 110, 101, 110, 121, 66, 83, 64, 65, 87, 119, 92, 81, 93, 86, 87, 86, 96, 116, 113, 0, 1, 11, 4, 26, 28, 28, 28, 27, 30, 12, 27, 8, 9, 36, 3, 30, 25, 12, 3, 14, 8, 62, 25, 12, 25, 8};
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final /* synthetic */ void onStart() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final /* synthetic */ void onStop() {
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FJ(C1998jY c1998jY, C0958Hi c0958Hi) {
        super(c0958Hi);
        C1h.A09(c1998jY, A00(14, 12, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
        C1h.A09(c0958Hi, A00(26, 16, 79));
        this.A00 = c1998jY;
        this.A01 = c0958Hi;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void ABc(Intent intent, Bundle bundle, C1998jY c1998jY) throws SecurityException {
        C1h.A09(intent, A00(82, 6, 120));
        C1h.A09(c1998jY, A00(14, 12, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
        String url = intent.getStringExtra(A00(68, 10, 52));
        if (url != null) {
            Uri uriA00 = AbstractC2351pP.A00(url);
            C1h.A08(uriA00, A00(96, 24, 92));
            this.A01.A0F().ALj();
            this.A01.A0F().A5F(A00(0, 14, 60));
            AbstractC2503rr.A00(this.A01.A0F().getId());
            Intent intent2 = new Intent(A00(42, 26, 89), uriA00);
            intent2.addFlags(268435456);
            getContext().startActivity(intent2);
        }
        c1998jY.finish(17);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGF(boolean z11) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGp(boolean z11) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AKD(Bundle bundle) {
        C1h.A09(bundle, A00(120, 18, 3));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public String getCurrentClientToken() {
        return A00(0, 0, 107);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final boolean onActivityResult(int i5, int i11, Intent intent) {
        C1h.A09(intent, A00(78, 4, 5));
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void onDestroy() {
    }

    public void setListener(InterfaceC2459r9 interfaceC2459r9) {
        C1h.A09(interfaceC2459r9, A00(88, 8, 101));
    }
}
