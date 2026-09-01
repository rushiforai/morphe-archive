package defpackage;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class h21 implements Serializable, Comparable {
    public static final h21 d = new h21(new byte[0]);
    public final byte[] a;
    public transient int b;
    public transient String c;

    public h21(byte[] bArr) {
        bArr.getClass();
        this.a = bArr;
    }

    public static int h(h21 h21Var, h21 h21Var2) {
        h21Var.getClass();
        h21Var2.getClass();
        return h21Var.g(0, h21Var2.i());
    }

    public static int l(h21 h21Var, h21 h21Var2) {
        h21Var.getClass();
        h21Var2.getClass();
        return h21Var.k(h21Var2.i());
    }

    public static h21 q(h21 h21Var, int i, int i2, int i3) {
        if ((i3 & 1) != 0) {
            i = 0;
        }
        if ((i3 & 2) != 0) {
            i2 = -1234567890;
        }
        return h21Var.p(i, i2);
    }

    private final void readObject(ObjectInputStream objectInputStream) throws IllegalAccessException, NoSuchFieldException, IOException {
        int i = objectInputStream.readInt();
        if (i < 0) {
            ywb.g(b09.w(i, "byteCount < 0: "));
            return;
        }
        byte[] bArr = new byte[i];
        int i2 = 0;
        while (i2 < i) {
            int i3 = objectInputStream.read(bArr, i2, i - i2);
            if (i3 == -1) {
                ay0.b();
                return;
            }
            i2 += i3;
        }
        h21 h21Var = new h21(bArr);
        Field declaredField = h21.class.getDeclaredField("a");
        declaredField.setAccessible(true);
        declaredField.set(this, h21Var.a);
    }

    private final void writeObject(ObjectOutputStream objectOutputStream) throws IOException {
        objectOutputStream.writeInt(this.a.length);
        objectOutputStream.write(this.a);
    }

    public String a() {
        byte[] bArr = this.a;
        byte[] bArr2 = a.a;
        bArr.getClass();
        bArr2.getClass();
        byte[] bArr3 = new byte[((bArr.length + 2) / 3) * 4];
        int length = bArr.length - (bArr.length % 3);
        int i = 0;
        int i2 = 0;
        while (i < length) {
            byte b = bArr[i];
            int i3 = i + 2;
            byte b2 = bArr[i + 1];
            i += 3;
            byte b3 = bArr[i3];
            bArr3[i2] = bArr2[(b & 255) >> 2];
            bArr3[i2 + 1] = bArr2[((b & 3) << 4) | ((b2 & 255) >> 4)];
            int i4 = i2 + 3;
            bArr3[i2 + 2] = bArr2[((b2 & 15) << 2) | ((b3 & 255) >> 6)];
            i2 += 4;
            bArr3[i4] = bArr2[b3 & 63];
        }
        int length2 = bArr.length - length;
        if (length2 == 1) {
            byte b4 = bArr[i];
            bArr3[i2] = bArr2[(b4 & 255) >> 2];
            bArr3[i2 + 1] = bArr2[(b4 & 3) << 4];
            bArr3[i2 + 2] = 61;
            bArr3[i2 + 3] = 61;
        } else if (length2 == 2) {
            int i5 = i + 1;
            byte b5 = bArr[i];
            byte b6 = bArr[i5];
            bArr3[i2] = bArr2[(b5 & 255) >> 2];
            bArr3[i2 + 1] = bArr2[((b5 & 3) << 4) | ((b6 & 255) >> 4)];
            bArr3[i2 + 2] = bArr2[(b6 & 15) << 2];
            bArr3[i2 + 3] = 61;
        }
        return new String(bArr3, wk1.a);
    }

    @Override // java.lang.Comparable
    /* JADX INFO: renamed from: b, reason: merged with bridge method [inline-methods] */
    public final int compareTo(h21 h21Var) {
        h21Var.getClass();
        int iE = e();
        int iE2 = h21Var.e();
        int iMin = Math.min(iE, iE2);
        for (int i = 0; i < iMin; i++) {
            int iJ = j(i) & 255;
            int iJ2 = h21Var.j(i) & 255;
            if (iJ != iJ2) {
                return iJ < iJ2 ? -1 : 1;
            }
        }
        if (iE == iE2) {
            return 0;
        }
        return iE < iE2 ? -1 : 1;
    }

    public void c(int i, int i2, int i3, byte[] bArr) {
        bArr.getClass();
        k80.f0(i2, i, i3 + i, this.a, bArr);
    }

    public h21 d(String str) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance(str);
        messageDigest.update(this.a, 0, e());
        byte[] bArrDigest = messageDigest.digest();
        bArrDigest.getClass();
        return new h21(bArrDigest);
    }

    public int e() {
        return this.a.length;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof h21) {
            h21 h21Var = (h21) obj;
            int iE = h21Var.e();
            byte[] bArr = this.a;
            if (iE == bArr.length && h21Var.m(0, 0, bArr.length, bArr)) {
                return true;
            }
        }
        return false;
    }

    public String f() {
        byte[] bArr = this.a;
        char[] cArr = new char[bArr.length * 2];
        int i = 0;
        for (byte b : bArr) {
            int i2 = i + 1;
            char[] cArr2 = gx1.b;
            cArr[i] = cArr2[(b >> 4) & 15];
            i += 2;
            cArr[i2] = cArr2[b & 15];
        }
        return new String(cArr);
    }

    public int g(int i, byte[] bArr) {
        bArr.getClass();
        int length = this.a.length - bArr.length;
        int iMax = Math.max(i, 0);
        if (iMax > length) {
            return -1;
        }
        while (!dm2.w(iMax, 0, bArr.length, this.a, bArr)) {
            if (iMax == length) {
                return -1;
            }
            iMax++;
        }
        return iMax;
    }

    public int hashCode() {
        int i = this.b;
        if (i != 0) {
            return i;
        }
        int iHashCode = Arrays.hashCode(this.a);
        this.b = iHashCode;
        return iHashCode;
    }

    public byte[] i() {
        return this.a;
    }

    public byte j(int i) {
        return this.a[i];
    }

    public int k(byte[] bArr) {
        bArr.getClass();
        for (int iMin = Math.min(e(), this.a.length - bArr.length); -1 < iMin; iMin--) {
            if (dm2.w(iMin, 0, bArr.length, this.a, bArr)) {
                return iMin;
            }
        }
        return -1;
    }

    public boolean m(int i, int i2, int i3, byte[] bArr) {
        bArr.getClass();
        if (i < 0) {
            return false;
        }
        byte[] bArr2 = this.a;
        return i <= bArr2.length - i3 && i2 >= 0 && i2 <= bArr.length - i3 && dm2.w(i, i2, i3, bArr2, bArr);
    }

    public boolean n(h21 h21Var, int i, int i2) {
        h21Var.getClass();
        return h21Var.m(0, i, i2, this.a);
    }

    public String o(Charset charset) {
        charset.getClass();
        return new String(this.a, charset);
    }

    public h21 p(int i, int i2) {
        if (i2 == -1234567890) {
            i2 = e();
        }
        if (i < 0) {
            ay0.e("beginIndex < 0");
            return null;
        }
        byte[] bArr = this.a;
        if (i2 > bArr.length) {
            ywb.g(km4.A(new StringBuilder("endIndex > length("), this.a.length, ')'));
            return null;
        }
        if (i2 - i >= 0) {
            return (i == 0 && i2 == bArr.length) ? this : new h21(k80.l0(bArr, i, i2));
        }
        ay0.e("endIndex < beginIndex");
        return null;
    }

    public h21 r() {
        int i = 0;
        while (true) {
            byte[] bArr = this.a;
            if (i >= bArr.length) {
                return this;
            }
            byte b = bArr[i];
            if (b >= 65 && b <= 90) {
                byte[] bArrCopyOf = Arrays.copyOf(bArr, bArr.length);
                bArrCopyOf[i] = (byte) (b + 32);
                for (int i2 = i + 1; i2 < bArrCopyOf.length; i2++) {
                    byte b2 = bArrCopyOf[i2];
                    if (b2 >= 65 && b2 <= 90) {
                        bArrCopyOf[i2] = (byte) (b2 + 32);
                    }
                }
                return new h21(bArrCopyOf);
            }
            i++;
        }
    }

    public byte[] s() {
        byte[] bArr = this.a;
        return Arrays.copyOf(bArr, bArr.length);
    }

    public final String t() {
        String str = this.c;
        if (str != null) {
            return str;
        }
        byte[] bArrI = i();
        bArrI.getClass();
        String str2 = new String(bArrI, wk1.a);
        this.c = str2;
        return str2;
    }

    public String toString() {
        byte b;
        int i;
        h21 h21Var = this;
        byte[] bArr = h21Var.a;
        if (bArr.length == 0) {
            return "[size=0]";
        }
        int length = bArr.length;
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        loop0: while (true) {
            if (i2 >= length) {
                break;
            }
            byte b2 = bArr[i2];
            if (b2 >= 0) {
                int i5 = i4 + 1;
                if (i4 == 64) {
                    break;
                }
                if ((b2 != 10 && b2 != 13 && ((b2 >= 0 && b2 < 32) || (127 <= b2 && b2 < 160))) || b2 == 65533) {
                    break;
                }
                i3 += b2 < 65536 ? 1 : 2;
                i2++;
                while (true) {
                    i4 = i5;
                    if (i2 < length && (b = bArr[i2]) >= 0) {
                        i2++;
                        i5 = i4 + 1;
                        if (i4 == 64) {
                            break loop0;
                        }
                        if ((b != 10 && b != 13 && ((b >= 0 && b < 32) || (127 <= b && b < 160))) || b == 65533) {
                            break loop0;
                        }
                        i3 += b < 65536 ? 1 : 2;
                    } else {
                        break;
                    }
                }
            } else if ((b2 >> 5) == -2) {
                int i6 = i2 + 1;
                if (length > i6) {
                    byte b3 = bArr[i6];
                    if ((b3 & 192) == 128) {
                        int i7 = (b3 ^ 3968) ^ (b2 << 6);
                        if (i7 >= 128) {
                            i = i4 + 1;
                            if (i4 == 64) {
                                break;
                            }
                            if ((i7 != 10 && i7 != 13 && ((i7 >= 0 && i7 < 32) || (127 <= i7 && i7 < 160))) || i7 == 65533) {
                                break;
                            }
                            i3 += i7 < 65536 ? 1 : 2;
                            i2 += 2;
                            i4 = i;
                        } else if (i4 != 64) {
                            break;
                        }
                    } else if (i4 != 64) {
                        break;
                    }
                } else if (i4 != 64) {
                    break;
                }
            } else if ((b2 >> 4) == -2) {
                int i8 = i2 + 2;
                if (length > i8) {
                    byte b4 = bArr[i2 + 1];
                    if ((b4 & 192) == 128) {
                        byte b5 = bArr[i8];
                        if ((b5 & 192) == 128) {
                            int i9 = ((b5 ^ (-123008)) ^ (b4 << 6)) ^ (b2 << 12);
                            if (i9 < 2048) {
                                if (i4 != 64) {
                                    break;
                                }
                            } else if (55296 > i9 || i9 >= 57344) {
                                i = i4 + 1;
                                if (i4 == 64) {
                                    break;
                                }
                                if ((i9 != 10 && i9 != 13 && ((i9 >= 0 && i9 < 32) || (127 <= i9 && i9 < 160))) || i9 == 65533) {
                                    break;
                                }
                                i3 += i9 < 65536 ? 1 : 2;
                                i2 += 3;
                                i4 = i;
                            } else if (i4 != 64) {
                                break;
                            }
                        } else if (i4 != 64) {
                            break;
                        }
                    } else if (i4 != 64) {
                        break;
                    }
                } else if (i4 != 64) {
                    break;
                }
            } else if ((b2 >> 3) == -2) {
                int i10 = i2 + 3;
                if (length > i10) {
                    byte b6 = bArr[i2 + 1];
                    if ((b6 & 192) == 128) {
                        byte b7 = bArr[i2 + 2];
                        if ((b7 & 192) == 128) {
                            byte b8 = bArr[i10];
                            if ((b8 & 192) == 128) {
                                int i11 = (((b8 ^ 3678080) ^ (b7 << 6)) ^ (b6 << 12)) ^ (b2 << 18);
                                if (i11 > 1114111) {
                                    if (i4 != 64) {
                                        break;
                                    }
                                } else if (55296 > i11 || i11 >= 57344) {
                                    if (i11 >= 65536) {
                                        i = i4 + 1;
                                        if (i4 == 64) {
                                            break;
                                        }
                                        if ((i11 != 10 && i11 != 13 && ((i11 >= 0 && i11 < 32) || (127 <= i11 && i11 < 160))) || i11 == 65533) {
                                            break;
                                        }
                                        i3 += i11 < 65536 ? 1 : 2;
                                        i2 += 4;
                                        i4 = i;
                                    } else if (i4 != 64) {
                                        break;
                                    }
                                } else if (i4 != 64) {
                                    break;
                                }
                            } else if (i4 != 64) {
                                break;
                            }
                        } else if (i4 != 64) {
                            break;
                        }
                    } else if (i4 != 64) {
                        break;
                    }
                } else if (i4 != 64) {
                    break;
                }
            } else if (i4 != 64) {
                break;
            }
        }
        i3 = -1;
        if (i3 != -1) {
            String strT = h21Var.t();
            String strL = tuc.L(tuc.L(tuc.L(strT.substring(0, i3), "\\", "\\\\"), "\n", "\\n"), "\r", "\\r");
            if (i3 >= strT.length()) {
                return wgd.t(']', "[text=", strL);
            }
            return "[size=" + h21Var.a.length + " text=" + strL + "…]";
        }
        if (h21Var.a.length <= 64) {
            return "[hex=" + h21Var.f() + ']';
        }
        StringBuilder sb = new StringBuilder("[size=");
        sb.append(h21Var.a.length);
        sb.append(" hex=");
        byte[] bArr2 = h21Var.a;
        if (64 > bArr2.length) {
            ywb.g(km4.A(new StringBuilder("endIndex > length("), h21Var.a.length, ')'));
            return null;
        }
        if (64 != bArr2.length) {
            h21Var = new h21(k80.l0(bArr2, 0, 64));
        }
        sb.append(h21Var.f());
        sb.append("…]");
        return sb.toString();
    }

    public void u(kz0 kz0Var, int i) {
        kz0Var.write(this.a, 0, i);
    }
}
