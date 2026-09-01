package defpackage;

import com.google.protobuf.InvalidProtocolBufferException;
import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class poe extends aq7 {
    public final /* synthetic */ int d;

    public /* synthetic */ poe(int i) {
        this.d = i;
    }

    public static int I(long j, byte[] bArr, int i, int i2) {
        if (i2 == 0) {
            aq7 aq7Var = toe.a;
            if (i > -12) {
                return -1;
            }
            return i;
        }
        if (i2 == 1) {
            return toe.b(i, r2e.e(bArr, j));
        }
        if (i2 == 2) {
            return toe.c(i, r2e.e(bArr, j), r2e.e(bArr, j + 1));
        }
        ywb.d();
        return 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x004a  */
    @Override // defpackage.aq7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String m(byte[] r8, int r9, int r10) throws com.google.protobuf.InvalidProtocolBufferException {
        /*
            Method dump skipped, instruction units count: 230
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.poe.m(byte[], int, int):java.lang.String");
    }

    @Override // defpackage.aq7
    public final String o(ByteBuffer byteBuffer, int i, int i2) throws InvalidProtocolBufferException {
        long j;
        byte bC;
        byte bC2;
        switch (this.d) {
            case 0:
                return aq7.n(byteBuffer, i, i2);
            default:
                if ((i | i2 | ((byteBuffer.limit() - i) - i2)) < 0) {
                    throw new ArrayIndexOutOfBoundsException(String.format("buffer limit=%d, index=%d, limit=%d", Integer.valueOf(byteBuffer.limit()), Integer.valueOf(i), Integer.valueOf(i2)));
                }
                long j2 = r2e.c.b.getLong(byteBuffer, r2e.g) + ((long) i);
                long j3 = ((long) i2) + j2;
                char[] cArr = new char[i2];
                int i3 = 0;
                while (true) {
                    j = 1;
                    if (j2 < j3 && (bC2 = r2e.c.c(j2)) >= 0) {
                        j2++;
                        cArr[i3] = (char) bC2;
                        i3++;
                    }
                }
                int i4 = i3;
                while (j2 < j3) {
                    long j4 = j2 + j;
                    q2e q2eVar = r2e.c;
                    byte bC3 = q2eVar.c(j2);
                    if (bC3 >= 0) {
                        int i5 = i4 + 1;
                        cArr[i4] = (char) bC3;
                        while (j4 < j3 && (bC = r2e.c.c(j4)) >= 0) {
                            j4 += j;
                            cArr[i5] = (char) bC;
                            i5++;
                        }
                        i4 = i5;
                        j2 = j4;
                    } else if (bC3 < -32) {
                        if (j4 >= j3) {
                            throw InvalidProtocolBufferException.b();
                        }
                        j2 += 2;
                        tp7.t(bC3, q2eVar.c(j4), cArr, i4);
                        i4++;
                    } else if (bC3 < -16) {
                        if (j4 >= j3 - j) {
                            throw InvalidProtocolBufferException.b();
                        }
                        long j5 = 2 + j2;
                        j2 += 3;
                        tp7.s(bC3, q2eVar.c(j4), q2eVar.c(j5), cArr, i4);
                        i4++;
                    } else {
                        if (j4 >= j3 - 2) {
                            throw InvalidProtocolBufferException.b();
                        }
                        byte bC4 = q2eVar.c(j4);
                        long j6 = j2 + 3;
                        byte bC5 = q2eVar.c(2 + j2);
                        j2 += 4;
                        tp7.r(bC3, bC4, bC5, q2eVar.c(j6), cArr, i4);
                        i4 += 2;
                    }
                    j = 1;
                }
                return new String(cArr, 0, i4);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:70:0x0180  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0184  */
    @Override // defpackage.aq7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int p(java.lang.String r26, byte[] r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 620
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.poe.p(java.lang.String, byte[], int, int):int");
    }

    @Override // defpackage.aq7
    public final int y(byte[] bArr, int i, int i2) {
        int i3;
        byte b;
        int i4 = i;
        switch (this.d) {
            case 0:
                while (i4 < i2 && bArr[i4] >= 0) {
                    i4++;
                }
                if (i4 < i2) {
                    while (i4 < i2) {
                        int i5 = i4 + 1;
                        byte b2 = bArr[i4];
                        if (b2 < 0) {
                            if (b2 < -32) {
                                if (i5 >= i2) {
                                    return b2;
                                }
                                if (b2 >= -62) {
                                    i4 += 2;
                                    if (bArr[i5] > -65) {
                                    }
                                }
                                return -1;
                            }
                            if (b2 >= -16) {
                                if (i5 >= i2 - 2) {
                                    return toe.d(bArr, i5, i2);
                                }
                                int i6 = i4 + 2;
                                byte b3 = bArr[i5];
                                if (b3 <= -65 && (((b3 + 112) + (b2 << 28)) >> 30) == 0) {
                                    int i7 = i4 + 3;
                                    if (bArr[i6] <= -65) {
                                        i4 += 4;
                                        if (bArr[i7] > -65) {
                                        }
                                    }
                                }
                                return -1;
                            }
                            if (i5 >= i2 - 1) {
                                return toe.d(bArr, i5, i2);
                            }
                            int i8 = i4 + 2;
                            byte b4 = bArr[i5];
                            if (b4 <= -65 && ((b2 != -32 || b4 >= -96) && (b2 != -19 || b4 < -96))) {
                                i4 += 3;
                                if (bArr[i8] > -65) {
                                }
                            }
                            return -1;
                        }
                        i4 = i5;
                    }
                }
                return 0;
            default:
                if ((i4 | i2 | (bArr.length - i2)) < 0) {
                    throw new ArrayIndexOutOfBoundsException(String.format("Array length=%d, index=%d, limit=%d", Integer.valueOf(bArr.length), Integer.valueOf(i4), Integer.valueOf(i2)));
                }
                long j = i4;
                int i9 = (int) (((long) i2) - j);
                if (i9 < 16) {
                    i3 = 0;
                    b = 0;
                } else {
                    int i10 = 8 - (((int) j) & 7);
                    long j2 = j;
                    i3 = 0;
                    b = 0;
                    while (true) {
                        if (i3 < i10) {
                            long j3 = j2 + 1;
                            if (r2e.e(bArr, j2) >= 0) {
                                i3++;
                                j2 = j3;
                            }
                        } else {
                            while (true) {
                                int i11 = i3 + 8;
                                if (i11 <= i9 && (r2e.i(r2e.f + j2, bArr) & (-9187201950435737472L)) == 0) {
                                    j2 += 8;
                                    i3 = i11;
                                }
                            }
                            while (true) {
                                if (i3 < i9) {
                                    long j4 = j2 + 1;
                                    if (r2e.e(bArr, j2) >= 0) {
                                        i3++;
                                        j2 = j4;
                                    }
                                } else {
                                    i3 = i9;
                                }
                            }
                        }
                    }
                }
                int i12 = i9 - i3;
                long j5 = j + ((long) i3);
                while (true) {
                    byte bE = b;
                    while (true) {
                        if (i12 > 0) {
                            long j6 = j5 + 1;
                            bE = r2e.e(bArr, j5);
                            if (bE >= 0) {
                                i12--;
                                j5 = j6;
                            } else {
                                j5 = j6;
                            }
                        }
                    }
                    if (i12 == 0) {
                        return b;
                    }
                    int i13 = i12 - 1;
                    if (bE < -32) {
                        if (i13 == 0) {
                            return bE;
                        }
                        i12 -= 2;
                        if (bE >= -62) {
                            long j7 = j5 + 1;
                            if (r2e.e(bArr, j5) <= -65) {
                                j5 = j7;
                            }
                        }
                    } else if (bE < -16) {
                        if (i13 < 2) {
                            return I(j5, bArr, bE, i13);
                        }
                        i12 -= 3;
                        long j8 = j5 + 1;
                        byte bE2 = r2e.e(bArr, j5);
                        if (bE2 <= -65 && ((bE != -32 || bE2 >= -96) && (bE != -19 || bE2 < -96))) {
                            j5 += 2;
                            if (r2e.e(bArr, j8) > -65) {
                            }
                        }
                    } else {
                        if (i13 < 3) {
                            return I(j5, bArr, bE, i13);
                        }
                        i12 -= 4;
                        long j9 = j5 + 1;
                        byte bE3 = r2e.e(bArr, j5);
                        if (bE3 <= -65 && (((bE3 + 112) + (bE << 28)) >> 30) == 0) {
                            long j10 = j5 + 2;
                            if (r2e.e(bArr, j9) <= -65) {
                                j5 += 3;
                                if (r2e.e(bArr, j10) > -65) {
                                }
                            }
                        }
                    }
                }
                return -1;
        }
    }
}
