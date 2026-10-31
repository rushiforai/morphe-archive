package j9;

import b.c0;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Locale;

/* loaded from: classes2.dex */
public final class h {

    /* renamed from: h, reason: collision with root package name */
    public static final Charset f69257h = Charset.forName("US-ASCII");

    /* renamed from: i, reason: collision with root package name */
    public static final int[] f69258i = {0, 1, 1, 2, 4, 8, 0, 1, 0, 4, 8};

    /* renamed from: a, reason: collision with root package name */
    public final short f69259a;

    /* renamed from: b, reason: collision with root package name */
    public final short f69260b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f69261c;

    /* renamed from: d, reason: collision with root package name */
    public int f69262d;

    /* renamed from: e, reason: collision with root package name */
    public int f69263e;

    /* renamed from: f, reason: collision with root package name */
    public Object f69264f = null;

    /* renamed from: g, reason: collision with root package name */
    public int f69265g;

    static {
        new SimpleDateFormat("yyyy:MM:dd kk:mm:ss", Locale.US);
    }

    public h(short s11, short s12, int i5, int i11, boolean z11) {
        this.f69259a = s11;
        this.f69260b = s12;
        this.f69262d = i5;
        this.f69261c = z11;
        this.f69263e = i11;
    }

    public final boolean a(int i5) {
        return this.f69261c && this.f69262d != i5;
    }

    public final long b(int i5) {
        String str;
        Object obj = this.f69264f;
        if (obj instanceof long[]) {
            return ((long[]) obj)[i5];
        }
        if (obj instanceof byte[]) {
            return ((byte[]) obj)[i5];
        }
        switch (this.f69260b) {
            case 1:
                str = "UNSIGNED_BYTE";
                break;
            case 2:
                str = "ASCII";
                break;
            case 3:
                str = "UNSIGNED_SHORT";
                break;
            case 4:
                str = "UNSIGNED_LONG";
                break;
            case 5:
                str = "UNSIGNED_RATIONAL";
                break;
            case 6:
            case 8:
            default:
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                break;
            case 7:
                str = "UNDEFINED";
                break;
            case 9:
                str = "LONG";
                break;
            case 10:
                str = "RATIONAL";
                break;
        }
        throw new IllegalArgumentException("Cannot get integer value from ".concat(str));
    }

    public final void c(byte[] bArr) {
        int length = bArr.length;
        if (a(length)) {
            return;
        }
        short s11 = this.f69260b;
        if (s11 == 1 || s11 == 7) {
            byte[] bArr2 = new byte[length];
            this.f69264f = bArr2;
            System.arraycopy(bArr, 0, bArr2, 0, length);
            this.f69262d = length;
        }
    }

    public final void d(int[] iArr) {
        if (a(iArr.length)) {
            return;
        }
        short s11 = this.f69260b;
        if (s11 == 3 || s11 == 9 || s11 == 4) {
            if (s11 == 3) {
                for (int i5 : iArr) {
                    if (i5 > 65535 || i5 < 0) {
                        return;
                    }
                }
            }
            if (s11 == 4) {
                for (int i11 : iArr) {
                    if (i11 < 0) {
                        return;
                    }
                }
            }
            long[] jArr = new long[iArr.length];
            for (int i12 = 0; i12 < iArr.length; i12++) {
                jArr[i12] = iArr[i12];
            }
            this.f69264f = jArr;
            this.f69262d = iArr.length;
        }
    }

    public final void e(j[] jVarArr) {
        if (a(jVarArr.length)) {
            return;
        }
        short s11 = this.f69260b;
        if (s11 == 5 || s11 == 10) {
            if (s11 == 5) {
                for (j jVar : jVarArr) {
                    long j11 = jVar.f69269a;
                    if (j11 < 0) {
                        return;
                    }
                    long j12 = jVar.f69270b;
                    if (j12 < 0 || j11 > 4294967295L || j12 > 4294967295L) {
                        return;
                    }
                }
            }
            if (s11 == 10) {
                for (j jVar2 : jVarArr) {
                    long j13 = jVar2.f69269a;
                    if (j13 < -2147483648L) {
                        return;
                    }
                    long j14 = jVar2.f69270b;
                    if (j14 < -2147483648L || j13 > 2147483647L || j14 > 2147483647L) {
                        return;
                    }
                }
            }
            this.f69264f = jVarArr;
            this.f69262d = jVarArr.length;
        }
    }

    public final boolean equals(Object obj) {
        if (obj != null && (obj instanceof h)) {
            h hVar = (h) obj;
            if (hVar.f69259a == this.f69259a && hVar.f69262d == this.f69262d && hVar.f69260b == this.f69260b) {
                Object obj2 = this.f69264f;
                if (obj2 != null) {
                    Object obj3 = hVar.f69264f;
                    if (obj3 == null) {
                        return false;
                    }
                    if (obj2 instanceof long[]) {
                        if (obj3 instanceof long[]) {
                            return Arrays.equals((long[]) obj2, (long[]) obj3);
                        }
                        return false;
                    }
                    if (obj2 instanceof j[]) {
                        if (obj3 instanceof j[]) {
                            return Arrays.equals((j[]) obj2, (j[]) obj3);
                        }
                        return false;
                    }
                    if (!(obj2 instanceof byte[])) {
                        return obj2.equals(obj3);
                    }
                    if (obj3 instanceof byte[]) {
                        return Arrays.equals((byte[]) obj2, (byte[]) obj3);
                    }
                    return false;
                }
                if (hVar.f69264f == null) {
                    return true;
                }
            }
        }
        return false;
    }

    public final String toString() {
        String str;
        StringBuilder sb2 = new StringBuilder();
        sb2.append(String.format("tag id: %04X\n", Short.valueOf(this.f69259a)));
        sb2.append("ifd id: ");
        sb2.append(this.f69263e);
        sb2.append("\ntype: ");
        String string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        short s11 = this.f69260b;
        switch (s11) {
            case 1:
                str = "UNSIGNED_BYTE";
                break;
            case 2:
                str = "ASCII";
                break;
            case 3:
                str = "UNSIGNED_SHORT";
                break;
            case 4:
                str = "UNSIGNED_LONG";
                break;
            case 5:
                str = "UNSIGNED_RATIONAL";
                break;
            case 6:
            case 8:
            default:
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                break;
            case 7:
                str = "UNDEFINED";
                break;
            case 9:
                str = "LONG";
                break;
            case 10:
                str = "RATIONAL";
                break;
        }
        sb2.append(str);
        sb2.append("\ncount: ");
        sb2.append(this.f69262d);
        sb2.append("\noffset: ");
        sb2.append(this.f69265g);
        sb2.append("\nvalue: ");
        Object obj = this.f69264f;
        if (obj != null) {
            if (obj instanceof byte[]) {
                string = s11 == 2 ? new String((byte[]) obj, f69257h) : Arrays.toString((byte[]) obj);
            } else if (obj instanceof long[]) {
                long[] jArr = (long[]) obj;
                string = jArr.length == 1 ? String.valueOf(jArr[0]) : Arrays.toString(jArr);
            } else if (obj instanceof Object[]) {
                Object[] objArr = (Object[]) obj;
                if (objArr.length == 1) {
                    Object obj2 = objArr[0];
                    if (obj2 != null) {
                        string = obj2.toString();
                    }
                } else {
                    string = Arrays.toString(objArr);
                }
            } else {
                string = obj.toString();
            }
        }
        return c0.q(sb2, string, "\n");
    }
}
