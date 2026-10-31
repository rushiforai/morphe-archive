package com.google.android.libraries.places.internal;

import java.util.Iterator;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
final class zzmw implements Iterable {
    final /* synthetic */ CharSequence zza;
    final /* synthetic */ zzmy zzb;

    public zzmw(zzmy zzmyVar, CharSequence charSequence) {
        this.zza = charSequence;
        this.zzb = zzmyVar;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return this.zzb.zzg(this.zza);
    }

    public final String toString() {
        zzmh zzmhVarZzc = zzmh.zzc(", ");
        StringBuilder sb2 = new StringBuilder();
        sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
        zzmhVarZzc.zzg(sb2, iterator());
        sb2.append(AbstractJsonLexerKt.END_LIST);
        return sb2.toString();
    }
}
