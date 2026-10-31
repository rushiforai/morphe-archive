package x5;

import a5.l1;
import androidx.datastore.preferences.protobuf.InvalidProtocolBufferException;
import androidx.datastore.preferences.protobuf.UninitializedMessageException;
import androidx.datastore.preferences.protobuf.b0;
import androidx.datastore.preferences.protobuf.l;
import androidx.datastore.preferences.protobuf.l0;
import androidx.datastore.preferences.protobuf.p;
import androidx.datastore.preferences.protobuf.u0;
import androidx.datastore.preferences.protobuf.w;
import androidx.datastore.preferences.protobuf.w0;
import androidx.datastore.preferences.protobuf.x;
import androidx.datastore.preferences.protobuf.y;
import androidx.datastore.preferences.protobuf.y0;
import androidx.datastore.preferences.protobuf.z0;
import b.c0;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public final class e extends y {
    private static final e DEFAULT_INSTANCE;
    private static volatile u0 PARSER = null;
    public static final int PREFERENCES_FIELD_NUMBER = 1;
    private l0 preferences_ = l0.f14351b;

    static {
        e eVar = new e();
        DEFAULT_INSTANCE = eVar;
        y.i(e.class, eVar);
    }

    public static l0 l(e eVar) {
        l0 l0Var = eVar.preferences_;
        if (!l0Var.f14352a) {
            eVar.preferences_ = l0Var.c();
        }
        return eVar.preferences_;
    }

    public static c n() {
        return (c) ((w) DEFAULT_INSTANCE.b(5));
    }

    public static e o(InputStream inputStream) throws InvalidProtocolBufferException {
        l1 kVar;
        e eVar = DEFAULT_INSTANCE;
        if (inputStream == null) {
            byte[] bArr = b0.f14279b;
            int length = bArr.length;
            kVar = new androidx.datastore.preferences.protobuf.j(bArr, 0, length, false);
            try {
                kVar.i(length);
            } catch (InvalidProtocolBufferException e3) {
                throw new IllegalArgumentException(e3);
            }
        } else {
            kVar = new androidx.datastore.preferences.protobuf.k(inputStream);
        }
        p pVarA = p.a();
        y yVarH = eVar.h();
        try {
            w0 w0Var = w0.f14415c;
            w0Var.getClass();
            z0 z0VarA = w0Var.a(yVarH.getClass());
            l lVar = (l) kVar.f317b;
            if (lVar == null) {
                lVar = new l(kVar);
            }
            z0VarA.f(yVarH, lVar, pVarA);
            z0VarA.b(yVarH);
            if (y.e(yVarH, true)) {
                return (e) yVarH;
            }
            throw new UninitializedMessageException().a();
        } catch (InvalidProtocolBufferException e11) {
            if (e11.f14273a) {
                throw new InvalidProtocolBufferException(e11.getMessage(), e11);
            }
            throw e11;
        } catch (UninitializedMessageException e12) {
            throw e12.a();
        } catch (IOException e13) {
            if (e13.getCause() instanceof InvalidProtocolBufferException) {
                throw ((InvalidProtocolBufferException) e13.getCause());
            }
            throw new InvalidProtocolBufferException(e13.getMessage(), e13);
        } catch (RuntimeException e14) {
            if (e14.getCause() instanceof InvalidProtocolBufferException) {
                throw ((InvalidProtocolBufferException) e14.getCause());
            }
            throw e14;
        }
    }

    @Override // androidx.datastore.preferences.protobuf.y
    public final Object b(int i5) {
        u0 xVar;
        switch (c0.F(i5)) {
            case 0:
                return (byte) 1;
            case 1:
                return null;
            case 2:
                return new y0(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u00012", new Object[]{"preferences_", d.f95101a});
            case 3:
                return new e();
            case 4:
                return new c(DEFAULT_INSTANCE);
            case 5:
                return DEFAULT_INSTANCE;
            case 6:
                u0 u0Var = PARSER;
                if (u0Var != null) {
                    return u0Var;
                }
                synchronized (e.class) {
                    try {
                        xVar = PARSER;
                        if (xVar == null) {
                            xVar = new x();
                            PARSER = xVar;
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return xVar;
            default:
                throw new UnsupportedOperationException();
        }
    }

    public final Map m() {
        return Collections.unmodifiableMap(this.preferences_);
    }
}
