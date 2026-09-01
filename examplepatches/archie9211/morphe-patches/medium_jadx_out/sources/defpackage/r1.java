package defpackage;

import com.google.protobuf.UninitializedMessageException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class r1 implements cz7 {
    protected int memoizedHashCode;

    @Deprecated
    public static <T> void addAll(Iterable<T> iterable, Collection<? super T> collection) {
        p1.addAll((Iterable) iterable, (List) collection);
    }

    public static void checkByteStringIsUtf8(f21 f21Var) {
        if (f21Var.p()) {
            return;
        }
        ay0.e("Byte string is not UTF-8.");
    }

    public final String a(String str) {
        return "Serializing " + getClass().getName() + " to a " + str + " threw an IOException (should never happen).";
    }

    public abstract int getSerializedSize(brb brbVar);

    public UninitializedMessageException newUninitializedMessageException() {
        return new UninitializedMessageException();
    }

    public byte[] toByteArray() {
        try {
            int serializedSize = getSerializedSize();
            byte[] bArr = new byte[serializedSize];
            Logger logger = aq1.b;
            xp1 xp1Var = new xp1(bArr, serializedSize);
            writeTo(xp1Var);
            if (xp1Var.H() == 0) {
                return bArr;
            }
            throw new IllegalStateException("Did not write as much data as expected.");
        } catch (IOException e) {
            lg8.p(a("byte array"), e);
            return null;
        }
    }

    public f21 toByteString() {
        try {
            int serializedSize = getSerializedSize();
            c21 c21Var = f21.b;
            byte[] bArr = new byte[serializedSize];
            Logger logger = aq1.b;
            xp1 xp1Var = new xp1(bArr, serializedSize);
            writeTo(xp1Var);
            if (xp1Var.H() == 0) {
                return new c21(bArr);
            }
            throw new IllegalStateException("Did not write as much data as expected.");
        } catch (IOException e) {
            lg8.p(a("ByteString"), e);
            return null;
        }
    }

    public void writeDelimitedTo(OutputStream outputStream) {
        int serializedSize = getSerializedSize();
        int iJ = aq1.j(serializedSize) + serializedSize;
        if (iJ > 4096) {
            iJ = 4096;
        }
        yp1 yp1Var = new yp1(outputStream, iJ);
        yp1Var.E(serializedSize);
        writeTo(yp1Var);
        if (yp1Var.f > 0) {
            yp1Var.M();
        }
    }

    public void writeTo(OutputStream outputStream) {
        int serializedSize = getSerializedSize();
        Logger logger = aq1.b;
        if (serializedSize > 4096) {
            serializedSize = 4096;
        }
        yp1 yp1Var = new yp1(outputStream, serializedSize);
        writeTo(yp1Var);
        if (yp1Var.f > 0) {
            yp1Var.M();
        }
    }

    public static <T> void addAll(Iterable<T> iterable, List<? super T> list) {
        p1.addAll((Iterable) iterable, (List) list);
    }
}
