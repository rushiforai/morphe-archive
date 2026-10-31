package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Jq, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1015Jq {
    public static String[] A02 = {"Z83feij0dqMnv8l7XVl89aIhxyjz", "u8oh5uJfkP1OwakAOof1LwNo5boOClU", "yXozUpcQSMZIiSk", "KDBXb1XZqcaJTTSqYOkhwvDinfxffYTe", "mkhK4sIrnjp7QVSkZvM93FeO7cTO4tKz", "lbvSelyJg1emT4Vf", "4BaNyIdTI0W5D7I7l9kcM7idxPZMoGd", "mQ3aCX9m3A7eHUDrTuGXcWx8NfMzZPc6"};
    public final float A00;
    public final int A01;

    public C1015Jq(int i5, float f11) {
        this.A01 = i5;
        this.A00 = f11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        C1015Jq c1015Jq = (C1015Jq) obj;
        int i5 = this.A01;
        int i11 = c1015Jq.A01;
        String[] strArr = A02;
        if (strArr[0].length() == strArr[6].length()) {
            throw new RuntimeException();
        }
        A02[1] = "VrTg1rXCt8VyxQCfbgp8i";
        if (i5 == i11 && Float.compare(c1015Jq.A00, this.A00) == 0) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        int result = this.A01;
        return (((17 * 31) + result) * 31) + Float.floatToIntBits(this.A00);
    }
}
