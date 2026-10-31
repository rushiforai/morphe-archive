package com.bykv.vk.openvk.preload.geckox.utils;

import androidx.recyclerview.widget.u1;
import b.c0;
import h6.c1;
import java.io.InputStream;
import java.security.MessageDigest;

/* loaded from: classes2.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    private static char[] f22161a = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    public static void a(InputStream inputStream, String str) throws Exception {
        if (str == null) {
            throw new RuntimeException("md5 check failed: md5 == null");
        }
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            try {
                try {
                    byte[] bArr = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
                    while (true) {
                        int i5 = inputStream.read(bArr, 0, u1.FLAG_APPEARED_IN_PRE_LAYOUT);
                        if (i5 == -1) {
                            break;
                        } else {
                            messageDigest.update(bArr, 0, i5);
                        }
                    }
                    try {
                        byte[] bArrDigest = messageDigest.digest();
                        String strA = a(bArrDigest, bArrDigest.length);
                        if (!str.equals(strA)) {
                            throw new RuntimeException(c0.m("md5 check failed file: local md5:", strA, " expect md5:", str));
                        }
                    } catch (Exception e3) {
                        throw new RuntimeException(c1.s(e3, new StringBuilder("md5 check failed:")), e3);
                    }
                } catch (Exception e11) {
                    throw new RuntimeException("md5 check failed:" + e11.getMessage(), e11);
                }
            } finally {
                CloseableUtils.close(inputStream);
            }
        } catch (Exception e12) {
            throw new RuntimeException(c1.s(e12, new StringBuilder("md5 check failed:")), e12);
        }
    }

    private static String a(byte[] bArr, int i5) {
        if (bArr != null) {
            if (i5 <= bArr.length) {
                int i11 = i5 << 1;
                char[] cArr = new char[i11];
                int i12 = 0;
                for (int i13 = 0; i13 < i5; i13++) {
                    byte b11 = bArr[i13];
                    int i14 = i12 + 1;
                    char[] cArr2 = f22161a;
                    cArr[i12] = cArr2[(b11 & 255) >> 4];
                    i12 += 2;
                    cArr[i14] = cArr2[b11 & 15];
                }
                return new String(cArr, 0, i11);
            }
            throw new IndexOutOfBoundsException();
        }
        throw new NullPointerException("bytes is null");
    }
}
