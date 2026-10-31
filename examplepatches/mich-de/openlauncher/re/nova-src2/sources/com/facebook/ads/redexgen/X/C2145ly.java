package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.protocol.AdPlacementType;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.ly, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2145ly {
    public static byte[] A0A;
    public C2146lz A01;
    public AdPlacementType A02;
    public String A03;
    public String A04;
    public String A05;
    public String A06;
    public JSONObject A08;
    public final boolean A09;
    public int A00 = 0;
    public List<C2143lw> A07 = new ArrayList();

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0A, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 109);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A0A = new byte[]{79, 88};
    }

    public C2145ly(C2146lz c2146lz, String str, String str2, String str3, String str4, boolean z11) {
        this.A01 = c2146lz;
        this.A05 = str;
        this.A03 = str2;
        this.A04 = str3;
        this.A06 = str4;
        if (this.A01 != null) {
            this.A02 = this.A01.A0D();
        }
        this.A09 = z11;
    }

    public final int A02() {
        return this.A07.size();
    }

    public final long A03() {
        if (this.A01 != null) {
            return this.A01.A0C() + this.A01.A03();
        }
        return -1L;
    }

    public final C2143lw A04() {
        if (this.A00 < this.A07.size()) {
            this.A00++;
            return this.A07.get(this.A00 - 1);
        }
        return null;
    }

    public final C2146lz A05() {
        return this.A01;
    }

    public final AdPlacementType A06() {
        return this.A02;
    }

    public final String A07() {
        return this.A03;
    }

    public final String A08() {
        return this.A04;
    }

    public final String A09() {
        if (this.A00 > 0 && this.A00 <= this.A07.size()) {
            return this.A07.get(this.A00 - 1).A04().optString(A00(0, 2, 65));
        }
        return null;
    }

    public final String A0A() {
        return this.A05;
    }

    public final String A0B() {
        C2143lw c2143lw;
        if (this.A07.isEmpty() || (c2143lw = this.A07.get(0)) == null || c2143lw.A04() == null) {
            return null;
        }
        return c2143lw.A04().optString(A00(0, 2, 65));
    }

    public final String A0C() {
        return this.A06;
    }

    public final JSONObject A0D() {
        return this.A08;
    }

    public final void A0E(C2143lw c2143lw) {
        this.A07.add(c2143lw);
    }

    public final void A0F(JSONObject jSONObject) {
        this.A08 = jSONObject;
    }

    public final boolean A0G() {
        return this.A09;
    }

    public final boolean A0H() {
        return this.A01 == null || C2416qS.A00() > this.A01.A0C() + ((long) this.A01.A03());
    }
}
