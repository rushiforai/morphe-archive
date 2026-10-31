package com.google.android.libraries.places.internal;

import b.c0;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
final class zzlw extends zzlv {
    private final char zza;

    public zzlw(char c11) {
        this.zza = c11;
    }

    public final String toString() {
        char[] cArr = new char[6];
        cArr[0] = AbstractJsonLexerKt.STRING_ESC;
        cArr[1] = AbstractJsonLexerKt.UNICODE_ESC;
        cArr[2] = 0;
        cArr[3] = 0;
        cArr[4] = 0;
        cArr[5] = 0;
        int i5 = this.zza;
        for (int i11 = 0; i11 < 4; i11++) {
            cArr[5 - i11] = "0123456789ABCDEF".charAt(i5 & 15);
            i5 >>= 4;
        }
        return c0.l("CharMatcher.is('", String.copyValueOf(cArr), "')");
    }

    @Override // com.google.android.libraries.places.internal.zzma
    public final boolean zza(char c11) {
        return c11 == this.zza;
    }
}
