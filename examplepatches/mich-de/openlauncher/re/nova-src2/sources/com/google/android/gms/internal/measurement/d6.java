package com.google.android.gms.internal.measurement;

import java.util.ArrayList;
import java.util.Iterator;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class d6 implements f6 {
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        return obj instanceof d6;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final f6 f(String str, j8 j8Var, ArrayList arrayList) {
        throw new IllegalStateException("null has no function ".concat(str));
    }

    public final int hashCode() {
        return 1;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final String zzc() {
        return AbstractJsonLexerKt.NULL;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Double zzd() {
        return Double.valueOf(0.0d);
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Boolean zze() {
        return Boolean.FALSE;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Iterator zzf() {
        return null;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final f6 zzt() {
        return f6.Ro;
    }
}
