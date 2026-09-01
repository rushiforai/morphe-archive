package defpackage;

import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class byd {
    public static final ThreadLocal d = new ThreadLocal();
    public final int a;
    public final n0c b;
    public volatile int c = 0;

    public byd(n0c n0cVar, int i) {
        this.b = n0cVar;
        this.a = i;
    }

    public final int a(int i) {
        uz7 uz7VarB = b();
        int iA = uz7VarB.a(16);
        if (iA == 0) {
            return 0;
        }
        ByteBuffer byteBuffer = (ByteBuffer) uz7VarB.d;
        int i2 = iA + uz7VarB.a;
        return byteBuffer.getInt((i * 4) + byteBuffer.getInt(i2) + i2 + 4);
    }

    public final uz7 b() {
        ThreadLocal threadLocal = d;
        uz7 uz7Var = (uz7) threadLocal.get();
        if (uz7Var == null) {
            uz7Var = new uz7();
            threadLocal.set(uz7Var);
        }
        vz7 vz7Var = (vz7) this.b.b;
        int iA = vz7Var.a(6);
        if (iA != 0) {
            int i = iA + vz7Var.a;
            int i2 = (this.a * 4) + ((ByteBuffer) vz7Var.d).getInt(i) + i + 4;
            int i3 = ((ByteBuffer) vz7Var.d).getInt(i2) + i2;
            ByteBuffer byteBuffer = (ByteBuffer) vz7Var.d;
            uz7Var.d = byteBuffer;
            if (byteBuffer != null) {
                uz7Var.a = i3;
                int i4 = i3 - byteBuffer.getInt(i3);
                uz7Var.b = i4;
                uz7Var.c = ((ByteBuffer) uz7Var.d).getShort(i4);
                return uz7Var;
            }
            uz7Var.a = 0;
            uz7Var.b = 0;
            uz7Var.c = 0;
        }
        return uz7Var;
    }

    public final String toString() {
        int i;
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append(", id:");
        uz7 uz7VarB = b();
        int iA = uz7VarB.a(4);
        sb.append(Integer.toHexString(iA != 0 ? ((ByteBuffer) uz7VarB.d).getInt(iA + uz7VarB.a) : 0));
        sb.append(", codepoints:");
        uz7 uz7VarB2 = b();
        int iA2 = uz7VarB2.a(16);
        if (iA2 != 0) {
            int i2 = iA2 + uz7VarB2.a;
            i = ((ByteBuffer) uz7VarB2.d).getInt(((ByteBuffer) uz7VarB2.d).getInt(i2) + i2);
        } else {
            i = 0;
        }
        for (int i3 = 0; i3 < i; i3++) {
            sb.append(Integer.toHexString(a(i3)));
            sb.append(" ");
        }
        return sb.toString();
    }
}
