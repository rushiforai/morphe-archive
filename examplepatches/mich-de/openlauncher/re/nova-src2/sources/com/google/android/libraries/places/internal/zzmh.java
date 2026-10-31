package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.util.Iterator;
import java.util.Objects;

/* loaded from: classes3.dex */
public class zzmh {
    private final String zza;

    public static zzmh zzb(char c11) {
        return new zzmh(",");
    }

    public static zzmh zzc(String str) {
        return new zzmh(str);
    }

    public static final CharSequence zzh(Object obj) {
        Objects.requireNonNull(obj);
        return obj instanceof CharSequence ? (CharSequence) obj : obj.toString();
    }

    public Appendable zza(Appendable appendable, Iterator it) throws IOException {
        if (it.hasNext()) {
            appendable.append(zzh(it.next()));
            while (it.hasNext()) {
                appendable.append(this.zza);
                appendable.append(zzh(it.next()));
            }
        }
        return appendable;
    }

    public final zzmh zzd() {
        return new zzme(this, this);
    }

    public final String zzf(Iterable iterable) {
        Iterator it = iterable.iterator();
        StringBuilder sb2 = new StringBuilder();
        zzg(sb2, it);
        return sb2.toString();
    }

    public final StringBuilder zzg(StringBuilder sb2, Iterator it) {
        try {
            zza(sb2, it);
            return sb2;
        } catch (IOException e3) {
            throw new AssertionError(e3);
        }
    }

    private zzmh(String str) {
        this.zza = str;
    }
}
