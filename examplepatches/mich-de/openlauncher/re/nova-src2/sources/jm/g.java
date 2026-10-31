package jm;

import a80.m;
import com.amplitude.android.migration.DatabaseConstants;
import com.google.firebase.encoders.EncodingException;
import com.vungle.ads.internal.protos.Sdk;
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

/* loaded from: classes3.dex */
public final class g implements gm.e {

    /* renamed from: f, reason: collision with root package name */
    public static final Charset f69600f = Charset.forName("UTF-8");

    /* renamed from: g, reason: collision with root package name */
    public static final gm.c f69601g = new gm.c(DatabaseConstants.KEY_FIELD, m.o(qm.e.d(e.class, new a(1))));

    /* renamed from: h, reason: collision with root package name */
    public static final gm.c f69602h = new gm.c("value", m.o(qm.e.d(e.class, new a(2))));

    /* renamed from: i, reason: collision with root package name */
    public static final f f69603i = new f(0);

    /* renamed from: a, reason: collision with root package name */
    public OutputStream f69604a;

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f69605b;

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f69606c;

    /* renamed from: d, reason: collision with root package name */
    public final gm.d f69607d;

    /* renamed from: e, reason: collision with root package name */
    public final i f69608e = new i(this);

    public g(ByteArrayOutputStream byteArrayOutputStream, HashMap map, HashMap map2, gm.d dVar) {
        this.f69604a = byteArrayOutputStream;
        this.f69605b = map;
        this.f69606c = map2;
        this.f69607d = dVar;
    }

    public static int j(gm.c cVar) {
        e eVar = (e) ((Annotation) cVar.f57748b.get(e.class));
        if (eVar != null) {
            return ((a) eVar).f69595c;
        }
        throw new EncodingException("Field has no @Protobuf config");
    }

    public final void a(gm.c cVar, double d5, boolean z11) throws IOException {
        if (z11 && d5 == 0.0d) {
            return;
        }
        k((j(cVar) << 3) | 1);
        this.f69604a.write(ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN).putDouble(d5).array());
    }

    @Override // gm.e
    public final gm.e b(gm.c cVar, boolean z11) {
        g(cVar, z11 ? 1 : 0, true);
        return this;
    }

    @Override // gm.e
    public final gm.e c(gm.c cVar, int i5) {
        g(cVar, i5, true);
        return this;
    }

    @Override // gm.e
    public final gm.e d(gm.c cVar, long j11) throws IOException {
        if (j11 == 0) {
            return this;
        }
        e eVar = (e) ((Annotation) cVar.f57748b.get(e.class));
        if (eVar == null) {
            throw new EncodingException("Field has no @Protobuf config");
        }
        k(((a) eVar).f69595c << 3);
        l(j11);
        return this;
    }

    @Override // gm.e
    public final gm.e e(gm.c cVar, double d5) throws IOException {
        a(cVar, d5, true);
        return this;
    }

    @Override // gm.e
    public final gm.e f(gm.c cVar, Object obj) {
        h(cVar, obj, true);
        return this;
    }

    public final void g(gm.c cVar, int i5, boolean z11) {
        if (z11 && i5 == 0) {
            return;
        }
        e eVar = (e) ((Annotation) cVar.f57748b.get(e.class));
        if (eVar == null) {
            throw new EncodingException("Field has no @Protobuf config");
        }
        k(((a) eVar).f69595c << 3);
        k(i5);
    }

    public final void h(gm.c cVar, Object obj, boolean z11) {
        if (obj == null) {
            return;
        }
        if (obj instanceof CharSequence) {
            CharSequence charSequence = (CharSequence) obj;
            if (z11 && charSequence.length() == 0) {
                return;
            }
            k((j(cVar) << 3) | 2);
            byte[] bytes = charSequence.toString().getBytes(f69600f);
            k(bytes.length);
            this.f69604a.write(bytes);
            return;
        }
        if (obj instanceof Collection) {
            Iterator it = ((Collection) obj).iterator();
            while (it.hasNext()) {
                h(cVar, it.next(), false);
            }
            return;
        }
        if (obj instanceof Map) {
            Iterator it2 = ((Map) obj).entrySet().iterator();
            while (it2.hasNext()) {
                i(f69603i, cVar, (Map.Entry) it2.next(), false);
            }
            return;
        }
        if (obj instanceof Double) {
            a(cVar, ((Double) obj).doubleValue(), z11);
            return;
        }
        if (obj instanceof Float) {
            float fFloatValue = ((Float) obj).floatValue();
            if (z11 && fFloatValue == 0.0f) {
                return;
            }
            k((j(cVar) << 3) | 5);
            this.f69604a.write(ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putFloat(fFloatValue).array());
            return;
        }
        if (obj instanceof Number) {
            long jLongValue = ((Number) obj).longValue();
            if (z11 && jLongValue == 0) {
                return;
            }
            e eVar = (e) ((Annotation) cVar.f57748b.get(e.class));
            if (eVar == null) {
                throw new EncodingException("Field has no @Protobuf config");
            }
            k(((a) eVar).f69595c << 3);
            l(jLongValue);
            return;
        }
        if (obj instanceof Boolean) {
            g(cVar, ((Boolean) obj).booleanValue() ? 1 : 0, z11);
            return;
        }
        if (obj instanceof byte[]) {
            byte[] bArr = (byte[]) obj;
            if (z11 && bArr.length == 0) {
                return;
            }
            k((j(cVar) << 3) | 2);
            k(bArr.length);
            this.f69604a.write(bArr);
            return;
        }
        gm.d dVar = (gm.d) this.f69605b.get(obj.getClass());
        if (dVar != null) {
            i(dVar, cVar, obj, z11);
            return;
        }
        gm.f fVar = (gm.f) this.f69606c.get(obj.getClass());
        if (fVar != null) {
            i iVar = this.f69608e;
            iVar.f69610a = false;
            iVar.f69612c = cVar;
            iVar.f69611b = z11;
            fVar.encode(obj, iVar);
            return;
        }
        if (obj instanceof c) {
            g(cVar, ((c) obj).getNumber(), true);
        } else if (obj instanceof Enum) {
            g(cVar, ((Enum) obj).ordinal(), true);
        } else {
            i(this.f69607d, cVar, obj, z11);
        }
    }

    public final void i(gm.d dVar, gm.c cVar, Object obj, boolean z11) throws IOException {
        b bVar = new b();
        bVar.f69596a = 0L;
        try {
            OutputStream outputStream = this.f69604a;
            this.f69604a = bVar;
            try {
                dVar.encode(obj, this);
                this.f69604a = outputStream;
                long j11 = bVar.f69596a;
                bVar.close();
                if (z11 && j11 == 0) {
                    return;
                }
                k((j(cVar) << 3) | 2);
                l(j11);
                dVar.encode(obj, this);
            } catch (Throwable th2) {
                this.f69604a = outputStream;
                throw th2;
            }
        } catch (Throwable th3) {
            try {
                bVar.close();
            } catch (Throwable th4) {
                th3.addSuppressed(th4);
            }
            throw th3;
        }
    }

    public final void k(int i5) throws IOException {
        while ((i5 & (-128)) != 0) {
            this.f69604a.write((i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) | 128);
            i5 >>>= 7;
        }
        this.f69604a.write(i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
    }

    public final void l(long j11) throws IOException {
        while (((-128) & j11) != 0) {
            this.f69604a.write((((int) j11) & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) | 128);
            j11 >>>= 7;
        }
        this.f69604a.write(((int) j11) & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
    }
}
