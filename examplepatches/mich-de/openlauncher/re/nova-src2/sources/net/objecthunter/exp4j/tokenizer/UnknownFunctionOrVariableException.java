package net.objecthunter.exp4j.tokenizer;

import b.c0;

/* loaded from: classes5.dex */
public class UnknownFunctionOrVariableException extends IllegalArgumentException {

    /* renamed from: a, reason: collision with root package name */
    public final String f78239a;

    public UnknownFunctionOrVariableException(String str, int i5, int i11) {
        int length = str.length();
        int i12 = (i11 + i5) - 1;
        this.f78239a = c0.q(c0.v("Unknown function or variable '", i5, str.substring(i5, length >= i12 ? i12 : length), "' at pos ", " in expression '"), str, "'");
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return this.f78239a;
    }
}
