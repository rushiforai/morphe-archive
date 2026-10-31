package com.fyber.inneractive.sdk.protobuf;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;

/* loaded from: classes.dex */
public abstract class b implements d2 {
    protected int memoizedHashCode = 0;

    @Deprecated
    public static <T> void addAll(Iterable<T> iterable, Collection<? super T> collection) {
        t0.a(iterable, (List) collection);
    }

    public static void checkByteStringIsUtf8(s sVar) throws IllegalArgumentException {
        if (!sVar.c()) {
            throw new IllegalArgumentException("Byte string is not UTF-8.");
        }
    }

    public abstract int getMemoizedSerializedSize();

    public int getSerializedSize(t2 t2Var) {
        int memoizedSerializedSize = getMemoizedSerializedSize();
        if (memoizedSerializedSize != -1) {
            return memoizedSerializedSize;
        }
        int iB = t2Var.b(this);
        setMemoizedSerializedSize(iB);
        return iB;
    }

    public m3 newUninitializedMessageException() {
        return new m3();
    }

    public abstract void setMemoizedSerializedSize(int i5);

    public byte[] toByteArray() {
        try {
            int serializedSize = getSerializedSize();
            byte[] bArr = new byte[serializedSize];
            Logger logger = b0.f30768b;
            y yVar = new y(serializedSize, bArr);
            writeTo(yVar);
            if (yVar.a() == 0) {
                return bArr;
            }
            throw new IllegalStateException("Did not write as much data as expected.");
        } catch (IOException e3) {
            throw new RuntimeException("Serializing " + getClass().getName() + " to a byte array threw an IOException (should never happen).", e3);
        }
    }

    public s toByteString() {
        try {
            int serializedSize = getSerializedSize();
            q qVar = s.f30889b;
            byte[] bArr = new byte[serializedSize];
            Logger logger = b0.f30768b;
            y yVar = new y(serializedSize, bArr);
            writeTo(yVar);
            if (yVar.a() == 0) {
                return new q(bArr);
            }
            throw new IllegalStateException("Did not write as much data as expected.");
        } catch (IOException e3) {
            throw new RuntimeException("Serializing " + getClass().getName() + " to a ByteString threw an IOException (should never happen).", e3);
        }
    }

    public void writeDelimitedTo(OutputStream outputStream) throws IOException {
        int serializedSize = getSerializedSize();
        int iC = b0.c(serializedSize) + serializedSize;
        if (iC > 4096) {
            iC = 4096;
        }
        a0 a0Var = new a0(outputStream, iC);
        a0Var.j(5);
        a0Var.i(serializedSize);
        writeTo(a0Var);
        if (a0Var.f30759f > 0) {
            a0Var.a();
        }
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        int serializedSize = getSerializedSize();
        Logger logger = b0.f30768b;
        if (serializedSize > 4096) {
            serializedSize = 4096;
        }
        a0 a0Var = new a0(outputStream, serializedSize);
        writeTo(a0Var);
        if (a0Var.f30759f > 0) {
            a0Var.a();
        }
    }

    public static <T> void addAll(Iterable<T> iterable, List<? super T> list) {
        t0.a(iterable, list);
    }
}
