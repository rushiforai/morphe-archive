package com.facebook.ads.redexgen.X;

import com.facebook.kotlin.compilerplugins.dataclassgenerate.annotation.DataClassGenerate;
import kotlin.Metadata;

@Metadata
@DataClassGenerate
/* renamed from: com.facebook.ads.redexgen.X.13, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass13 extends YI {
    public static String[] A03 = {"K0nBcaofn3n2yJV0xkMXJZB5JDXuEmEg", "weM3", "7l9aDROvCqwOPStIVfEmWfJvnBZtrD8n", "H43R7OBVjCBEpj4YA5a92czNZscYOyOZ", "6EuZQ8TfgHc9nuA3EdUOxwBiV2NO6EEx", "jobD", "6ZEIZ5JbUAA94mW3gnIRK1yTNeHVtyBo", "8maMVzixHoMLK9EGXaWiN6Kws80"};
    public final boolean A00;
    public final boolean A01;
    public final boolean A02;

    public AnonymousClass13() {
        this(false, false, false, 7, null);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof AnonymousClass13)) {
            return false;
        }
        AnonymousClass13 anonymousClass13 = (AnonymousClass13) obj;
        if (this.A01 != anonymousClass13.A01) {
            return false;
        }
        boolean z11 = this.A02;
        if (A03[6].charAt(25) == 'Z') {
            throw new RuntimeException();
        }
        String[] strArr = A03;
        strArr[0] = "3erlDpwffmnde94h17kc348P2bKyPKJm";
        strArr[4] = "5TM4OlQfSuN0Li1SPWQOeXSvQtkslgQN";
        return z11 == anonymousClass13.A02 && this.A00 == anonymousClass13.A00;
    }

    public final int hashCode() {
        return (((YM.A00(this.A01) * 31) + YM.A00(this.A02)) * 31) + YM.A00(this.A00);
    }

    public final String toString() {
        return super.toString();
    }

    public AnonymousClass13(boolean z11, boolean z12, boolean z13) {
        this.A01 = z11;
        this.A02 = z12;
        this.A00 = z13;
    }

    public /* synthetic */ AnonymousClass13(boolean z11, boolean z12, boolean z13, int i5, AbstractC05811i abstractC05811i) {
        this((i5 & 1) != 0 ? false : z11, (i5 & 2) != 0 ? false : z12, (i5 & 4) != 0 ? false : z13);
    }
}
