package io.sentry;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;

/* loaded from: classes4.dex */
public final class r implements f0 {

    /* renamed from: b, reason: collision with root package name */
    public static final Charset f67678b = Charset.forName("UTF-8");

    /* renamed from: a, reason: collision with root package name */
    public final p0 f67679a;

    public r(p0 p0Var) {
        this.f67679a = p0Var;
    }

    /* JADX WARN: Code restructure failed: missing block: B:47:0x00aa, code lost:
    
        r13 = new io.sentry.e3(r2, r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00af, code lost:
    
        r3.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00b2, code lost:
    
        return r13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x010b, code lost:
    
        throw new java.lang.IllegalArgumentException("Item header at index '" + r4.size() + "' is null or empty.");
     */
    @Override // io.sentry.f0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final e3 a(BufferedInputStream bufferedInputStream) throws IOException {
        p0 p0Var = this.f67679a;
        Charset charset = f67678b;
        byte[] bArr = new byte[1024];
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        int i5 = 0;
        int i11 = -1;
        while (true) {
            try {
                int i12 = bufferedInputStream.read(bArr);
                if (i12 <= 0) {
                    break;
                }
                int i13 = 0;
                while (true) {
                    if (i11 != -1 || i13 >= i12) {
                        break;
                    }
                    if (bArr[i13] == 10) {
                        i11 = i5 + i13;
                        break;
                    }
                    i13++;
                }
                byteArrayOutputStream.write(bArr, 0, i12);
                i5 += i12;
            } catch (Throwable th2) {
                try {
                    byteArrayOutputStream.close();
                } catch (Throwable th3) {
                    th2.addSuppressed(th3);
                }
                throw th2;
            }
        }
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        if (byteArray.length == 0) {
            throw new IllegalArgumentException("Empty stream.");
        }
        if (i11 == -1) {
            throw new IllegalArgumentException("Envelope contains no header.");
        }
        StringReader stringReader = new StringReader(new String(byteArray, 0, i11, charset));
        try {
            w2 w2Var = (w2) p0Var.d(stringReader, w2.class);
            stringReader.close();
            if (w2Var == null) {
                throw new IllegalArgumentException("Envelope header is null.");
            }
            int i14 = i11 + 1;
            ArrayList arrayList = new ArrayList();
            while (true) {
                int i15 = i14;
                while (true) {
                    if (i15 >= byteArray.length) {
                        i15 = -1;
                        break;
                    }
                    if (byteArray[i15] == 10) {
                        break;
                    }
                    i15++;
                }
                if (i15 == -1) {
                    throw new IllegalArgumentException("Invalid envelope. Item at index '" + arrayList.size() + "'. has no header delimiter.");
                }
                stringReader = new StringReader(new String(byteArray, i14, i15 - i14, charset));
                try {
                    a3 a3Var = (a3) p0Var.d(stringReader, a3.class);
                    stringReader.close();
                    if (a3Var == null || a3Var.a() <= 0) {
                        break;
                    }
                    int iA = a3Var.a() + i15;
                    int i16 = iA + 1;
                    if (i16 > byteArray.length) {
                        throw new IllegalArgumentException("Invalid length for item at index '" + arrayList.size() + "'. Item is '" + i16 + "' bytes. There are '" + byteArray.length + "' in the buffer.");
                    }
                    arrayList.add(new z2(a3Var, Arrays.copyOfRange(byteArray, i15 + 1, i16)));
                    if (i16 == byteArray.length) {
                        break;
                    }
                    i14 = iA + 2;
                    if (i14 == byteArray.length) {
                        if (byteArray[i16] != 10) {
                            throw new IllegalArgumentException("Envelope has invalid data following an item.");
                        }
                    }
                } finally {
                }
            }
        } finally {
        }
    }
}
