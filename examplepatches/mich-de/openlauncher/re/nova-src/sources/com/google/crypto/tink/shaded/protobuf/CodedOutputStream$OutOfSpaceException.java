package com.google.crypto.tink.shaded.protobuf;

import java.io.IOException;
import java.util.Locale;

/* loaded from: classes3.dex */
public class CodedOutputStream$OutOfSpaceException extends IOException {
    public CodedOutputStream$OutOfSpaceException() {
        super("CodedOutputStream was writing to a flat byte array and ran out of space.");
    }

    public CodedOutputStream$OutOfSpaceException(IndexOutOfBoundsException indexOutOfBoundsException) {
        super("CodedOutputStream was writing to a flat byte array and ran out of space.", indexOutOfBoundsException);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public CodedOutputStream$OutOfSpaceException(int i5, int i11, int i12, IndexOutOfBoundsException indexOutOfBoundsException) {
        Locale locale = Locale.US;
        StringBuilder sbU = b.c0.u(i5, "Pos: ", ", limit: ");
        sbU.append(i11);
        sbU.append(", len: ");
        sbU.append(i12);
        super("CodedOutputStream was writing to a flat byte array and ran out of space.: ".concat(sbU.toString()), indexOutOfBoundsException);
    }
}
