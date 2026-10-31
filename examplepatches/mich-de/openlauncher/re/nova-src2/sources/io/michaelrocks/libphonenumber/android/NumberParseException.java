package io.michaelrocks.libphonenumber.android;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public class NumberParseException extends Exception {

    /* renamed from: a, reason: collision with root package name */
    public final int f66696a;

    /* renamed from: b, reason: collision with root package name */
    public final String f66697b;

    public NumberParseException(int i5, String str) {
        super(str);
        this.f66697b = str;
        this.f66696a = i5;
    }

    @Override // java.lang.Throwable
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Error type: ");
        int i5 = this.f66696a;
        sb2.append(i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? i5 != 5 ? AbstractJsonLexerKt.NULL : "TOO_LONG" : "TOO_SHORT_NSN" : "TOO_SHORT_AFTER_IDD" : "NOT_A_NUMBER" : "INVALID_COUNTRY_CODE");
        sb2.append(". ");
        sb2.append(this.f66697b);
        return sb2.toString();
    }
}
