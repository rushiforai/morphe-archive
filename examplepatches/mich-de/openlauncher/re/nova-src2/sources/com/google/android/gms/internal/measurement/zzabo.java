package com.google.android.gms.internal.measurement;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class zzabo extends RuntimeException {
    public static zzabo a(int i5, int i11, String str, String str2) {
        return new zzabo(c(i5, i11, str, str2));
    }

    public static zzabo b(int i5, String str, String str2) {
        return new zzabo(c(i5, i5 + 1, str, str2));
    }

    public static String c(int i5, int i11, String str, String str2) {
        if (i11 < 0) {
            i11 = str2.length();
        }
        StringBuilder sb2 = new StringBuilder(str);
        sb2.append(": ");
        if (i5 > 8) {
            sb2.append("...");
            sb2.append((CharSequence) str2, i5 - 5, i5);
        } else {
            sb2.append((CharSequence) str2, 0, i5);
        }
        sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
        sb2.append(str2.substring(i5, i11));
        sb2.append(AbstractJsonLexerKt.END_LIST);
        if (str2.length() - i11 > 8) {
            sb2.append((CharSequence) str2, i11, i11 + 5);
            sb2.append("...");
        } else {
            sb2.append((CharSequence) str2, i11, str2.length());
        }
        return sb2.toString();
    }

    @Override // java.lang.Throwable
    public final synchronized Throwable fillInStackTrace() {
        return this;
    }
}
