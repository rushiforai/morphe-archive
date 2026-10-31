package c6;

import android.util.Log;
import b.c0;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* loaded from: classes2.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final int f19712a;

    /* renamed from: b, reason: collision with root package name */
    public final int f19713b;

    /* renamed from: c, reason: collision with root package name */
    public final long f19714c;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f19715d;

    public c(int i5, int i11, byte[] bArr) {
        this(-1L, bArr, i5, i11);
    }

    public static c a(long j11, ByteOrder byteOrder) {
        long[] jArr = {j11};
        ByteBuffer byteBufferWrap = ByteBuffer.wrap(new byte[g.D[4]]);
        byteBufferWrap.order(byteOrder);
        byteBufferWrap.putInt((int) jArr[0]);
        return new c(4, 1, byteBufferWrap.array());
    }

    public static c b(e eVar, ByteOrder byteOrder) {
        ByteBuffer byteBufferWrap = ByteBuffer.wrap(new byte[g.D[5]]);
        byteBufferWrap.order(byteOrder);
        e eVar2 = new e[]{eVar}[0];
        byteBufferWrap.putInt((int) eVar2.f19720a);
        byteBufferWrap.putInt((int) eVar2.f19721b);
        return new c(5, 1, byteBufferWrap.array());
    }

    public static c c(int i5, ByteOrder byteOrder) {
        ByteBuffer byteBufferWrap = ByteBuffer.wrap(new byte[g.D[3]]);
        byteBufferWrap.order(byteOrder);
        byteBufferWrap.putShort((short) new int[]{i5}[0]);
        return new c(3, 1, byteBufferWrap.array());
    }

    public final double d(ByteOrder byteOrder) throws Throwable {
        Object objG = g(byteOrder);
        if (objG == null) {
            throw new NumberFormatException("NULL can't be converted to a double value");
        }
        if (objG instanceof String) {
            return Double.parseDouble((String) objG);
        }
        if (objG instanceof long[]) {
            if (((long[]) objG).length == 1) {
                return r5[0];
            }
            throw new NumberFormatException("There are more than one component");
        }
        if (objG instanceof int[]) {
            if (((int[]) objG).length == 1) {
                return r5[0];
            }
            throw new NumberFormatException("There are more than one component");
        }
        if (objG instanceof double[]) {
            double[] dArr = (double[]) objG;
            if (dArr.length == 1) {
                return dArr[0];
            }
            throw new NumberFormatException("There are more than one component");
        }
        if (!(objG instanceof e[])) {
            throw new NumberFormatException("Couldn't find a double value");
        }
        e[] eVarArr = (e[]) objG;
        if (eVarArr.length != 1) {
            throw new NumberFormatException("There are more than one component");
        }
        e eVar = eVarArr[0];
        return eVar.f19720a / eVar.f19721b;
    }

    public final int e(ByteOrder byteOrder) throws Throwable {
        Object objG = g(byteOrder);
        if (objG == null) {
            throw new NumberFormatException("NULL can't be converted to a integer value");
        }
        if (objG instanceof String) {
            return Integer.parseInt((String) objG);
        }
        if (objG instanceof long[]) {
            long[] jArr = (long[]) objG;
            if (jArr.length == 1) {
                return (int) jArr[0];
            }
            throw new NumberFormatException("There are more than one component");
        }
        if (!(objG instanceof int[])) {
            throw new NumberFormatException("Couldn't find a integer value");
        }
        int[] iArr = (int[]) objG;
        if (iArr.length == 1) {
            return iArr[0];
        }
        throw new NumberFormatException("There are more than one component");
    }

    public final String f(ByteOrder byteOrder) throws Throwable {
        Object objG = g(byteOrder);
        if (objG == null) {
            return null;
        }
        if (objG instanceof String) {
            return (String) objG;
        }
        StringBuilder sb2 = new StringBuilder();
        int i5 = 0;
        if (objG instanceof long[]) {
            long[] jArr = (long[]) objG;
            while (i5 < jArr.length) {
                sb2.append(jArr[i5]);
                i5++;
                if (i5 != jArr.length) {
                    sb2.append(",");
                }
            }
            return sb2.toString();
        }
        if (objG instanceof int[]) {
            int[] iArr = (int[]) objG;
            while (i5 < iArr.length) {
                sb2.append(iArr[i5]);
                i5++;
                if (i5 != iArr.length) {
                    sb2.append(",");
                }
            }
            return sb2.toString();
        }
        if (objG instanceof double[]) {
            double[] dArr = (double[]) objG;
            while (i5 < dArr.length) {
                sb2.append(dArr[i5]);
                i5++;
                if (i5 != dArr.length) {
                    sb2.append(",");
                }
            }
            return sb2.toString();
        }
        if (!(objG instanceof e[])) {
            return null;
        }
        e[] eVarArr = (e[]) objG;
        while (i5 < eVarArr.length) {
            sb2.append(eVarArr[i5].f19720a);
            sb2.append('/');
            sb2.append(eVarArr[i5].f19721b);
            i5++;
            if (i5 != eVarArr.length) {
                sb2.append(",");
            }
        }
        return sb2.toString();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Not initialized variable reg: 4, insn: 0x0032: MOVE (r3 I:??[OBJECT, ARRAY]) = (r4 I:??[OBJECT, ARRAY]), block:B:17:0x0032 */
    /* JADX WARN: Removed duplicated region for block: B:103:0x012e A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r14v11, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r14v19, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r14v23, types: [int[]] */
    /* JADX WARN: Type inference failed for: r14v24, types: [long[]] */
    /* JADX WARN: Type inference failed for: r14v25, types: [c6.e[]] */
    /* JADX WARN: Type inference failed for: r14v26, types: [int[]] */
    /* JADX WARN: Type inference failed for: r14v27, types: [int[]] */
    /* JADX WARN: Type inference failed for: r14v28, types: [c6.e[]] */
    /* JADX WARN: Type inference failed for: r14v29, types: [double[]] */
    /* JADX WARN: Type inference failed for: r14v30, types: [java.io.Serializable] */
    /* JADX WARN: Type inference failed for: r14v31, types: [double[]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable g(ByteOrder byteOrder) throws Throwable {
        b bVar;
        InputStream inputStream;
        ?? str;
        byte b11;
        byte[] bArr = this.f19715d;
        InputStream inputStream2 = null;
        try {
            try {
                bVar = new b(bArr);
                try {
                    bVar.f19709b = byteOrder;
                    int i5 = this.f19712a;
                    int length = 0;
                    int i11 = this.f19713b;
                    switch (i5) {
                        case 1:
                        case 6:
                            if (bArr.length == 1 && (b11 = bArr[0]) >= 0 && b11 <= 1) {
                                String str2 = new String(new char[]{(char) (b11 + 48)});
                                try {
                                    bVar.close();
                                    return str2;
                                } catch (IOException e3) {
                                    Log.e("ExifInterface", "IOException occurred while closing InputStream", e3);
                                    return str2;
                                }
                            }
                            str = new String(bArr, g.M);
                            break;
                            break;
                        case 2:
                        case 7:
                            if (i11 >= g.E.length) {
                                int i12 = 0;
                                while (true) {
                                    byte[] bArr2 = g.E;
                                    if (i12 >= bArr2.length) {
                                        length = bArr2.length;
                                    } else if (bArr[i12] == bArr2[i12]) {
                                        i12++;
                                    }
                                }
                            }
                            StringBuilder sb2 = new StringBuilder();
                            while (length < i11) {
                                byte b12 = bArr[length];
                                if (b12 == 0) {
                                    str = sb2.toString();
                                    break;
                                } else {
                                    if (b12 >= 32) {
                                        sb2.append((char) b12);
                                    } else {
                                        sb2.append('?');
                                    }
                                    length++;
                                }
                            }
                            str = sb2.toString();
                        case 3:
                            str = new int[i11];
                            while (length < i11) {
                                str[length] = bVar.readUnsignedShort();
                                length++;
                            }
                        case 4:
                            str = new long[i11];
                            while (length < i11) {
                                str[length] = bVar.readInt() & 4294967295L;
                                length++;
                            }
                        case 5:
                            str = new e[i11];
                            while (length < i11) {
                                str[length] = new e(bVar.readInt() & 4294967295L, bVar.readInt() & 4294967295L);
                                length++;
                            }
                        case 8:
                            str = new int[i11];
                            while (length < i11) {
                                str[length] = bVar.readShort();
                                length++;
                            }
                        case 9:
                            str = new int[i11];
                            while (length < i11) {
                                str[length] = bVar.readInt();
                                length++;
                            }
                        case 10:
                            str = new e[i11];
                            while (length < i11) {
                                str[length] = new e(bVar.readInt(), bVar.readInt());
                                length++;
                            }
                        case 11:
                            str = new double[i11];
                            while (length < i11) {
                                str[length] = bVar.readFloat();
                                length++;
                            }
                        case 12:
                            str = new double[i11];
                            while (length < i11) {
                                str[length] = bVar.readDouble();
                                length++;
                            }
                        default:
                            try {
                                bVar.close();
                                return null;
                            } catch (IOException e11) {
                                Log.e("ExifInterface", "IOException occurred while closing InputStream", e11);
                                return null;
                            }
                    }
                    try {
                        bVar.close();
                        return str;
                    } catch (IOException e12) {
                        Log.e("ExifInterface", "IOException occurred while closing InputStream", e12);
                        return str;
                    }
                } catch (IOException e13) {
                    e = e13;
                    Log.w("ExifInterface", "IOException occurred during reading a value", e);
                    if (bVar != null) {
                        try {
                            bVar.close();
                        } catch (IOException e14) {
                            Log.e("ExifInterface", "IOException occurred while closing InputStream", e14);
                        }
                    }
                    return null;
                }
            } catch (Throwable th2) {
                th = th2;
                inputStream2 = inputStream;
                if (inputStream2 != null) {
                    try {
                        inputStream2.close();
                    } catch (IOException e15) {
                        Log.e("ExifInterface", "IOException occurred while closing InputStream", e15);
                    }
                }
                throw th;
            }
        } catch (IOException e16) {
            e = e16;
            bVar = null;
        } catch (Throwable th3) {
            th = th3;
            if (inputStream2 != null) {
            }
            throw th;
        }
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("(");
        sb2.append(g.C[this.f19712a]);
        sb2.append(", data length:");
        return c0.o(sb2, this.f19715d.length, ")");
    }

    public c(long j11, byte[] bArr, int i5, int i11) {
        this.f19712a = i5;
        this.f19713b = i11;
        this.f19714c = j11;
        this.f19715d = bArr;
    }
}
