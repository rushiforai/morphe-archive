package com.google.android.gms.internal.measurement;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class s3 implements f6 {

    /* renamed from: a, reason: collision with root package name */
    public final Double f33048a;

    public s3(Double d5) {
        if (d5 == null) {
            this.f33048a = Double.valueOf(Double.NaN);
        } else {
            this.f33048a = d5;
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof s3) {
            return this.f33048a.equals(((s3) obj).f33048a);
        }
        return false;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final f6 f(String str, j8 j8Var, ArrayList arrayList) {
        if ("toString".equals(str)) {
            return new i6(zzc());
        }
        throw new IllegalArgumentException(a80.m.h(zzc(), ".", str, " is not a function."));
    }

    public final int hashCode() {
        return this.f33048a.hashCode();
    }

    public final String toString() {
        return zzc();
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final String zzc() throws NumberFormatException {
        Double d5 = this.f33048a;
        if (Double.isNaN(d5.doubleValue())) {
            return "NaN";
        }
        if (Double.isInfinite(d5.doubleValue())) {
            return d5.doubleValue() > 0.0d ? "Infinity" : "-Infinity";
        }
        BigDecimal bigDecimalValueOf = BigDecimal.valueOf(d5.doubleValue());
        BigDecimal bigDecimal = bigDecimalValueOf.signum() == 0 ? new BigDecimal(BigInteger.ZERO, 0) : bigDecimalValueOf.stripTrailingZeros();
        DecimalFormat decimalFormat = new DecimalFormat("0E0");
        decimalFormat.setRoundingMode(RoundingMode.HALF_UP);
        decimalFormat.setMinimumFractionDigits((bigDecimal.scale() > 0 ? bigDecimal.precision() : bigDecimal.scale()) - 1);
        String str = decimalFormat.format(bigDecimal);
        int iIndexOf = str.indexOf("E");
        if (iIndexOf <= 0) {
            return str;
        }
        int i5 = Integer.parseInt(str.substring(iIndexOf + 1));
        return ((i5 >= 0 || i5 <= -7) && (i5 < 0 || i5 >= 21)) ? str.replace("E-", "e-").replace("E", "e+") : bigDecimal.toPlainString();
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Double zzd() {
        return this.f33048a;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Boolean zze() {
        Double d5 = this.f33048a;
        boolean z11 = false;
        if (!Double.isNaN(d5.doubleValue()) && d5.doubleValue() != 0.0d) {
            z11 = true;
        }
        return Boolean.valueOf(z11);
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Iterator zzf() {
        return null;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final f6 zzt() {
        return new s3(this.f33048a);
    }
}
