package com.google.android.libraries.places.internal;

import b.c0;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
final class zzno extends zznp {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzno(Comparable comparable) {
        super(comparable);
        comparable.getClass();
    }

    @Override // com.google.android.libraries.places.internal.zznp
    public final int hashCode() {
        return this.zza.hashCode();
    }

    public final String toString() {
        return c0.l("\\", this.zza.toString(), "/");
    }

    @Override // com.google.android.libraries.places.internal.zznp
    public final void zzc(StringBuilder sb2) {
        sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
        sb2.append(this.zza);
    }

    @Override // com.google.android.libraries.places.internal.zznp
    public final void zzd(StringBuilder sb2) {
        sb2.append(this.zza);
        sb2.append(')');
    }

    @Override // com.google.android.libraries.places.internal.zznp
    public final boolean zze(Comparable comparable) {
        int i5 = zzok.zzc;
        return this.zza.compareTo(comparable) <= 0;
    }
}
