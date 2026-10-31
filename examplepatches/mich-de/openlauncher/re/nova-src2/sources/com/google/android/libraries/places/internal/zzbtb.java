package com.google.android.libraries.places.internal;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class zzbtb {
    private final List zza = new ArrayList(20);

    public final zzbtb zza(String str, String str2) {
        if (str.isEmpty()) {
            throw new IllegalArgumentException("name is empty");
        }
        int length = str.length();
        int i5 = 0;
        for (int i11 = 0; i11 < length; i11++) {
            char cCharAt = str.charAt(i11);
            if (cCharAt <= 31 || cCharAt >= 127) {
                throw new IllegalArgumentException(String.format(Locale.US, "Unexpected char %#04x at %d in header name: %s", Integer.valueOf(cCharAt), Integer.valueOf(i11), str));
            }
        }
        if (str2 == null) {
            throw new IllegalArgumentException("value == null");
        }
        for (int i12 = 0; i12 < str2.length(); i12++) {
            char cCharAt2 = str2.charAt(i12);
            if (cCharAt2 <= 31 || cCharAt2 >= 127) {
                throw new IllegalArgumentException(String.format(Locale.US, "Unexpected char %#04x at %d in header value: %s", Integer.valueOf(cCharAt2), Integer.valueOf(i12), str2));
            }
        }
        while (i5 < this.zza.size()) {
            if (str.equalsIgnoreCase((String) this.zza.get(i5))) {
                this.zza.remove(i5);
                this.zza.remove(i5);
                i5 -= 2;
            }
            i5 += 2;
        }
        this.zza.add(str);
        this.zza.add(str2.trim());
        return this;
    }

    public final zzbtd zzb() {
        return new zzbtd(this, null);
    }
}
