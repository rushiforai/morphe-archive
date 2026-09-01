package defpackage;

import com.google.firebase.encoders.EncodingException;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.annotation.Annotation;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y7a implements mm8 {
    public static final Charset e = Charset.forName("UTF-8");
    public static final gf4 f;
    public static final gf4 g;
    public static final vb6 h;
    public OutputStream a;
    public final HashMap b;
    public final HashMap c;
    public final a8a d = new a8a(this);

    static {
        ad adVarE = ad.e();
        adVarE.b = 1;
        f = new gf4("key", y30.w(y30.v(s7a.class, adVarE.c())));
        ad adVarE2 = ad.e();
        adVarE2.b = 2;
        g = new gf4("value", y30.w(y30.v(s7a.class, adVarE2.c())));
        h = new vb6(1);
    }

    public y7a(ByteArrayOutputStream byteArrayOutputStream, HashMap map, HashMap map2) {
        this.a = byteArrayOutputStream;
        this.b = map;
        this.c = map2;
    }

    public static int k(gf4 gf4Var) {
        s7a s7aVar = (s7a) ((Annotation) gf4Var.b.get(s7a.class));
        if (s7aVar != null) {
            return s7aVar.tag();
        }
        throw new EncodingException("Field has no @Protobuf config");
    }

    @Override // defpackage.mm8
    public final mm8 a(gf4 gf4Var, Object obj) throws IOException {
        i(gf4Var, obj, true);
        return this;
    }

    public final void b(gf4 gf4Var, double d, boolean z) throws IOException {
        if (z && d == 0.0d) {
            return;
        }
        l((k(gf4Var) << 3) | 1);
        this.a.write(ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN).putDouble(d).array());
    }

    public final void c(gf4 gf4Var, int i, boolean z) throws IOException {
        if (z && i == 0) {
            return;
        }
        s7a s7aVar = (s7a) ((Annotation) gf4Var.b.get(s7a.class));
        if (s7aVar == null) {
            throw new EncodingException("Field has no @Protobuf config");
        }
        int i2 = x7a.a[s7aVar.intEncoding().ordinal()];
        if (i2 == 1) {
            l(s7aVar.tag() << 3);
            l(i);
        } else if (i2 == 2) {
            l(s7aVar.tag() << 3);
            l((i << 1) ^ (i >> 31));
        } else {
            if (i2 != 3) {
                return;
            }
            l((s7aVar.tag() << 3) | 5);
            this.a.write(ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putInt(i).array());
        }
    }

    @Override // defpackage.mm8
    public final mm8 d(gf4 gf4Var, boolean z) throws IOException {
        c(gf4Var, z ? 1 : 0, true);
        return this;
    }

    @Override // defpackage.mm8
    public final mm8 e(gf4 gf4Var, int i) throws IOException {
        c(gf4Var, i, true);
        return this;
    }

    @Override // defpackage.mm8
    public final mm8 f(gf4 gf4Var, double d) throws IOException {
        b(gf4Var, d, true);
        return this;
    }

    @Override // defpackage.mm8
    public final mm8 g(gf4 gf4Var, long j) throws IOException {
        h(gf4Var, j, true);
        return this;
    }

    public final void h(gf4 gf4Var, long j, boolean z) throws IOException {
        if (z && j == 0) {
            return;
        }
        s7a s7aVar = (s7a) ((Annotation) gf4Var.b.get(s7a.class));
        if (s7aVar == null) {
            throw new EncodingException("Field has no @Protobuf config");
        }
        int i = x7a.a[s7aVar.intEncoding().ordinal()];
        if (i == 1) {
            l(s7aVar.tag() << 3);
            m(j);
        } else if (i == 2) {
            l(s7aVar.tag() << 3);
            m((j >> 63) ^ (j << 1));
        } else {
            if (i != 3) {
                return;
            }
            l((s7aVar.tag() << 3) | 1);
            this.a.write(ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN).putLong(j).array());
        }
    }

    public final void i(gf4 gf4Var, Object obj, boolean z) throws IOException {
        if (obj == null) {
            return;
        }
        if (obj instanceof CharSequence) {
            CharSequence charSequence = (CharSequence) obj;
            if (z && charSequence.length() == 0) {
                return;
            }
            l((k(gf4Var) << 3) | 2);
            byte[] bytes = charSequence.toString().getBytes(e);
            l(bytes.length);
            this.a.write(bytes);
            return;
        }
        if (obj instanceof Collection) {
            Iterator it2 = ((Collection) obj).iterator();
            while (it2.hasNext()) {
                i(gf4Var, it2.next(), false);
            }
            return;
        }
        if (obj instanceof Map) {
            Iterator it3 = ((Map) obj).entrySet().iterator();
            while (it3.hasNext()) {
                j(h, gf4Var, (Map.Entry) it3.next(), false);
            }
            return;
        }
        if (obj instanceof Double) {
            b(gf4Var, ((Double) obj).doubleValue(), z);
            return;
        }
        if (obj instanceof Float) {
            float fFloatValue = ((Float) obj).floatValue();
            if (z && fFloatValue == 0.0f) {
                return;
            }
            l((k(gf4Var) << 3) | 5);
            this.a.write(ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putFloat(fFloatValue).array());
            return;
        }
        if (obj instanceof Number) {
            h(gf4Var, ((Number) obj).longValue(), z);
            return;
        }
        if (obj instanceof Boolean) {
            c(gf4Var, ((Boolean) obj).booleanValue() ? 1 : 0, z);
            return;
        }
        if (obj instanceof byte[]) {
            byte[] bArr = (byte[]) obj;
            if (z && bArr.length == 0) {
                return;
            }
            l((k(gf4Var) << 3) | 2);
            l(bArr.length);
            this.a.write(bArr);
            return;
        }
        lm8 lm8Var = (lm8) this.b.get(obj.getClass());
        if (lm8Var != null) {
            j(lm8Var, gf4Var, obj, z);
            return;
        }
        eqe eqeVar = (eqe) this.c.get(obj.getClass());
        if (eqeVar != null) {
            a8a a8aVar = this.d;
            a8aVar.a = false;
            a8aVar.c = gf4Var;
            a8aVar.b = z;
            eqeVar.a(obj, a8aVar);
            return;
        }
        if (obj instanceof m7a) {
            c(gf4Var, ((m7a) obj).getNumber(), true);
        } else if (obj instanceof Enum) {
            c(gf4Var, ((Enum) obj).ordinal(), true);
        } else {
            j(yi2.D, gf4Var, obj, z);
        }
    }

    public final void j(lm8 lm8Var, gf4 gf4Var, Object obj, boolean z) throws IOException {
        nx6 nx6Var = new nx6();
        nx6Var.a = 0L;
        try {
            OutputStream outputStream = this.a;
            this.a = nx6Var;
            try {
                lm8Var.a(obj, this);
                this.a = outputStream;
                long j = nx6Var.a;
                nx6Var.close();
                if (z && j == 0) {
                    return;
                }
                l((k(gf4Var) << 3) | 2);
                m(j);
                lm8Var.a(obj, this);
            } catch (Throwable th) {
                this.a = outputStream;
                throw th;
            }
        } catch (Throwable th2) {
            try {
                nx6Var.close();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public final void l(int i) throws IOException {
        while (true) {
            long j = i & (-128);
            OutputStream outputStream = this.a;
            if (j == 0) {
                outputStream.write(i & 127);
                return;
            } else {
                outputStream.write((i & 127) | 128);
                i >>>= 7;
            }
        }
    }

    public final void m(long j) throws IOException {
        while (true) {
            long j2 = (-128) & j;
            OutputStream outputStream = this.a;
            if (j2 == 0) {
                outputStream.write(((int) j) & 127);
                return;
            } else {
                outputStream.write((((int) j) & 127) | 128);
                j >>>= 7;
            }
        }
    }
}
