package com.google.protobuf;

import io.sentry.e3;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.logging.Logger;

/* loaded from: classes.dex */
public abstract class c implements o1 {
    protected int memoizedHashCode;

    public static <T> void addAll(Iterable<T> iterable, List<? super T> list) {
        b.addAll((Iterable) iterable, (List) list);
    }

    public static void checkByteStringIsUtf8(l lVar) throws IllegalArgumentException {
        if (!lVar.h()) {
            throw new IllegalArgumentException("Byte string is not UTF-8.");
        }
    }

    public final String a(String str) {
        return "Serializing " + getClass().getName() + " to a " + str + " threw an IOException (should never happen).";
    }

    public abstract int getSerializedSize(b2 b2Var);

    public UninitializedMessageException newUninitializedMessageException() {
        return new UninitializedMessageException();
    }

    public byte[] toByteArray() {
        try {
            int serializedSize = getSerializedSize();
            byte[] bArr = new byte[serializedSize];
            Logger logger = t.f34970b;
            r rVar = new r(bArr, serializedSize);
            writeTo(rVar);
            if (rVar.g0() == 0) {
                return bArr;
            }
            throw new IllegalStateException("Did not write as much data as expected.");
        } catch (IOException e3) {
            throw new RuntimeException(a("byte array"), e3);
        }
    }

    public l toByteString() {
        try {
            int serializedSize = getSerializedSize();
            j jVar = l.f34884b;
            e3 e3Var = new e3(serializedSize);
            writeTo(e3Var.l());
            return e3Var.g();
        } catch (IOException e3) {
            throw new RuntimeException(a("ByteString"), e3);
        }
    }

    public void writeDelimitedTo(OutputStream outputStream) throws IOException {
        int serializedSize = getSerializedSize();
        int iH = t.H(serializedSize) + serializedSize;
        if (iH > 4096) {
            iH = 4096;
        }
        s sVar = new s(outputStream, iH);
        sVar.d0(serializedSize);
        writeTo(sVar);
        sVar.m0();
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        int serializedSize = getSerializedSize();
        Logger logger = t.f34970b;
        if (serializedSize > 4096) {
            serializedSize = 4096;
        }
        s sVar = new s(outputStream, serializedSize);
        writeTo(sVar);
        sVar.m0();
    }
}
