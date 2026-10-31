package zk;

import b.c0;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import h6.c1;
import java.io.BufferedInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayDeque;
import java.util.Arrays;
import vk.b0;

/* loaded from: classes.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f98553a = 0;

    static {
        new e();
    }

    public static byte[] a(ArrayDeque arrayDeque, int i5) {
        if (arrayDeque.isEmpty()) {
            return new byte[0];
        }
        byte[] bArr = (byte[]) arrayDeque.remove();
        if (bArr.length == i5) {
            return bArr;
        }
        int length = i5 - bArr.length;
        byte[] bArrCopyOf = Arrays.copyOf(bArr, i5);
        while (length > 0) {
            byte[] bArr2 = (byte[]) arrayDeque.remove();
            int iMin = Math.min(length, bArr2.length);
            System.arraycopy(bArr2, 0, bArrCopyOf, i5 - length, iMin);
            length -= iMin;
        }
        return bArrCopyOf;
    }

    public static void b(BufferedInputStream bufferedInputStream, byte[] bArr) throws IOException {
        int length = bArr.length;
        if (length < 0) {
            throw new IndexOutOfBoundsException(c0.i(length, "len (", ") cannot be negative"));
        }
        int i5 = 0;
        b0.i(0, length, bArr.length);
        while (i5 < length) {
            int i11 = bufferedInputStream.read(bArr, i5, length - i5);
            if (i11 == -1) {
                break;
            } else {
                i5 += i11;
            }
        }
        if (i5 != length) {
            throw new EOFException(c1.n(i5, "reached end of stream after reading ", " bytes; ", length, " bytes expected"));
        }
    }

    public static byte[] c(InputStream inputStream) throws IOException {
        ArrayDeque arrayDeque = new ArrayDeque(20);
        int iMin = Math.min(UserMetadata.MAX_INTERNAL_KEY_SIZE, Math.max(128, Integer.highestOneBit(0) * 2));
        int i5 = 0;
        while (i5 < 2147483639) {
            int iMin2 = Math.min(iMin, 2147483639 - i5);
            byte[] bArr = new byte[iMin2];
            arrayDeque.add(bArr);
            int i11 = 0;
            while (i11 < iMin2) {
                int i12 = inputStream.read(bArr, i11, iMin2 - i11);
                if (i12 == -1) {
                    return a(arrayDeque, i5);
                }
                i11 += i12;
                i5 += i12;
            }
            iMin = ul.b.a0(iMin * (iMin < 4096 ? 4 : 2));
        }
        if (inputStream.read() == -1) {
            return a(arrayDeque, 2147483639);
        }
        throw new OutOfMemoryError("input is too large to fit in a byte array");
    }
}
