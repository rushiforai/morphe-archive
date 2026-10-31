package com.fyber.inneractive.sdk.protobuf;

import java.io.IOException;

/* loaded from: classes.dex */
public final class z extends IOException {
    private static final long serialVersionUID = -6947486886997889499L;

    public z(IndexOutOfBoundsException indexOutOfBoundsException) {
        super("CodedOutputStream was writing to a flat byte array and ran out of space.", indexOutOfBoundsException);
    }

    public z(String str, IndexOutOfBoundsException indexOutOfBoundsException) {
        super("CodedOutputStream was writing to a flat byte array and ran out of space.: ".concat(str), indexOutOfBoundsException);
    }
}
