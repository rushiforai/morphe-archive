package ads_mobile_sdk;

import b.c0;
import b.g5;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import vk.b0;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public MessageDigest f784a;

    /* renamed from: b, reason: collision with root package name */
    public final vi3 f785b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f786c = new Object();

    /* renamed from: d, reason: collision with root package name */
    public boolean f787d = false;

    /* renamed from: e, reason: collision with root package name */
    public SecureRandom f788e;

    public a(vi3 vi3Var) {
        this.f785b = vi3Var;
    }

    public final byte[] a(byte[] bArr) {
        byte[] bArrDigest;
        synchronized (this.f786c) {
            this.f784a.reset();
            this.f784a.update(bArr);
            bArrDigest = this.f784a.digest();
        }
        return bArrDigest;
    }

    public final byte[] a(String str, boolean z11, byte[] bArr) {
        byte[] bytes;
        int i5 = z11 ? 239 : 255;
        b0.c(bArr.length <= i5);
        ByteBuffer byteBufferPut = ByteBuffer.allocate(i5 + 1).put((byte) bArr.length);
        if (bArr.length < i5) {
            int length = i5 - bArr.length;
            byte[] bArr2 = new byte[length];
            this.f788e.nextBytes(bArr2);
            byte[] bArrCopyOf = Arrays.copyOf(bArr, bArr.length + length);
            System.arraycopy(bArr2, 0, bArrCopyOf, bArr.length, length);
            bArr = bArrCopyOf;
        }
        byte[] bArrArray = byteBufferPut.put(bArr).array();
        if (z11) {
            bArrArray = ByteBuffer.allocate(256).put(a(bArrArray)).put(bArrArray).array();
        }
        byte[] bArr3 = new byte[256];
        for (b.ab abVar : new gk0().K2) {
            abVar.a(bArrArray, bArr3);
        }
        if (!vk.l.a(str)) {
            if (str.length() > 32) {
                bytes = str.substring(0, 32).getBytes(StandardCharsets.UTF_8);
            } else {
                bytes = str.getBytes(StandardCharsets.UTF_8);
            }
            c cVar = new c(bytes, 0);
            int i11 = 0;
            int i12 = 0;
            for (int i13 = 0; i13 < 256; i13++) {
                i11 = (i11 + 1) & 255;
                byte[] bArr4 = cVar.f1614a;
                byte b11 = bArr4[i11];
                i12 = (i12 + b11) & 255;
                bArr4[i11] = bArr4[i12];
                bArr4[i12] = b11;
                bArr3[i13] = (byte) (bArr4[(bArr4[i11] + b11) & 255] ^ bArr3[i13]);
            }
        }
        return bArr3;
    }

    public final g5 a(String str, byte[] bArr) {
        g5 g5VarO = le.o();
        byte[] bArrA = a(bArr);
        qq qqVarA = sq.a(0, bArrA.length, bArrA);
        g5VarO.b();
        ((le) g5VarO.f1095b).b(qqVarA);
        int iC = c0.c(bArr.length, 1, 255, 1);
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < iC; i5++) {
            int i11 = i5 * 255;
            int length = i11 + 255;
            if (bArr.length <= length) {
                length = bArr.length;
            }
            arrayList.add(Arrays.copyOfRange(bArr, i11, length));
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            qq qqVarA2 = sq.a(0, 256, a(str, false, (byte[]) it.next()));
            g5VarO.b();
            ((le) g5VarO.f1095b).a(qqVarA2);
        }
        return g5VarO;
    }

    public final void a() {
        boolean z11;
        synchronized (this) {
            z11 = this.f787d;
        }
        if (z11) {
            return;
        }
        SecureRandom secureRandom = new SecureRandom();
        synchronized (this) {
            vi3 vi3Var = this.f785b;
            sh3 sh3Var = new sh3(yk0.EVENT_ID_FALLBACK_INIT_OBFUSCATOR, vi3Var.f10793b, vi3Var.f10792a);
            try {
                try {
                    try {
                        sh3Var.b();
                        this.f788e = secureRandom;
                        this.f784a = MessageDigest.getInstance("MD5");
                        this.f787d = true;
                    } catch (Throwable th2) {
                        sh3Var.a(th2);
                        throw th2;
                    }
                } catch (NoSuchAlgorithmException e3) {
                    sh3Var.a(e3);
                }
                sh3Var.a();
            } catch (Throwable th3) {
                sh3Var.a();
                throw th3;
            }
        }
    }
}
