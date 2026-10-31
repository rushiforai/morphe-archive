package kotlin.reflect.jvm.internal.impl.protobuf;

/* loaded from: classes5.dex */
final class Utf8 {
    private static int incompleteStateFor(int i5) {
        if (i5 > -12) {
            return -1;
        }
        return i5;
    }

    public static boolean isValidUtf8(byte[] bArr) {
        return isValidUtf8(bArr, 0, bArr.length);
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0015, code lost:
    
        if (r7[r8] > (-65)) goto L13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0046, code lost:
    
        if (r7[r8] > (-65)) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0083, code lost:
    
        if (r7[r6] > (-65)) goto L53;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int partialIsValidUtf8(int i5, byte[] bArr, int i11, int i12) {
        byte b11;
        int i13;
        int i14;
        if (i5 != 0) {
            if (i11 >= i12) {
                return i5;
            }
            byte b12 = (byte) i5;
            if (b12 < -32) {
                if (b12 >= -62) {
                    i14 = i11 + 1;
                }
                return -1;
            }
            if (b12 < -16) {
                byte b13 = (byte) (~(i5 >> 8));
                if (b13 == 0) {
                    int i15 = i11 + 1;
                    byte b14 = bArr[i11];
                    if (i15 >= i12) {
                        return incompleteStateFor(b12, b14);
                    }
                    i11 = i15;
                    b13 = b14;
                }
                if (b13 <= -65 && ((b12 != -32 || b13 >= -96) && (b12 != -19 || b13 < -96))) {
                    i14 = i11 + 1;
                }
                return -1;
            }
            byte b15 = (byte) (~(i5 >> 8));
            if (b15 == 0) {
                i13 = i11 + 1;
                b15 = bArr[i11];
                if (i13 >= i12) {
                    return incompleteStateFor(b12, b15);
                }
                b11 = 0;
            } else {
                b11 = (byte) (i5 >> 16);
                i13 = i11;
            }
            if (b11 == 0) {
                int i16 = i13 + 1;
                byte b16 = bArr[i13];
                if (i16 >= i12) {
                    return incompleteStateFor(b12, b15, b16);
                }
                b11 = b16;
                i13 = i16;
            }
            if (b15 <= -65) {
                if ((((b15 + 112) + (b12 << 28)) >> 30) == 0 && b11 <= -65) {
                    i11 = i13 + 1;
                }
            }
            return -1;
            i11 = i14;
        }
        return partialIsValidUtf8(bArr, i11, i12);
    }

    private static int partialIsValidUtf8NonAscii(byte[] bArr, int i5, int i11) {
        while (i5 < i11) {
            int i12 = i5 + 1;
            byte b11 = bArr[i5];
            if (b11 < 0) {
                if (b11 < -32) {
                    if (i12 >= i11) {
                        return b11;
                    }
                    if (b11 >= -62) {
                        i5 += 2;
                        if (bArr[i12] > -65) {
                        }
                    }
                    return -1;
                }
                if (b11 < -16) {
                    if (i12 >= i11 - 1) {
                        return incompleteStateFor(bArr, i12, i11);
                    }
                    int i13 = i5 + 2;
                    byte b12 = bArr[i12];
                    if (b12 <= -65 && ((b11 != -32 || b12 >= -96) && (b11 != -19 || b12 < -96))) {
                        i5 += 3;
                        if (bArr[i13] > -65) {
                        }
                    }
                    return -1;
                }
                if (i12 >= i11 - 2) {
                    return incompleteStateFor(bArr, i12, i11);
                }
                int i14 = i5 + 2;
                byte b13 = bArr[i12];
                if (b13 <= -65) {
                    if ((((b13 + 112) + (b11 << 28)) >> 30) == 0) {
                        int i15 = i5 + 3;
                        if (bArr[i14] <= -65) {
                            i5 += 4;
                            if (bArr[i15] > -65) {
                            }
                        }
                    }
                }
                return -1;
            }
            i5 = i12;
        }
        return 0;
    }

    private static int incompleteStateFor(int i5, int i11) {
        if (i5 > -12 || i11 > -65) {
            return -1;
        }
        return i5 ^ (i11 << 8);
    }

    public static boolean isValidUtf8(byte[] bArr, int i5, int i11) {
        return partialIsValidUtf8(bArr, i5, i11) == 0;
    }

    private static int incompleteStateFor(int i5, int i11, int i12) {
        if (i5 > -12 || i11 > -65 || i12 > -65) {
            return -1;
        }
        return (i5 ^ (i11 << 8)) ^ (i12 << 16);
    }

    private static int incompleteStateFor(byte[] bArr, int i5, int i11) {
        byte b11 = bArr[i5 - 1];
        int i12 = i11 - i5;
        if (i12 == 0) {
            return incompleteStateFor(b11);
        }
        if (i12 == 1) {
            return incompleteStateFor(b11, bArr[i5]);
        }
        if (i12 == 2) {
            return incompleteStateFor(b11, bArr[i5], bArr[i5 + 1]);
        }
        throw new AssertionError();
    }

    public static int partialIsValidUtf8(byte[] bArr, int i5, int i11) {
        while (i5 < i11 && bArr[i5] >= 0) {
            i5++;
        }
        if (i5 >= i11) {
            return 0;
        }
        return partialIsValidUtf8NonAscii(bArr, i5, i11);
    }
}
