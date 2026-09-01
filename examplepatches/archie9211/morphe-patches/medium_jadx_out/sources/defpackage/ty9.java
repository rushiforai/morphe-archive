package defpackage;

import androidx.datastore.preferences.protobuf.InvalidProtocolBufferException;
import androidx.datastore.preferences.protobuf.UninitializedMessageException;
import androidx.datastore.preferences.protobuf.c;
import androidx.datastore.preferences.protobuf.d;
import androidx.datastore.preferences.protobuf.e;
import j$.util.DesugarCollections;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ty9 extends e {
    private static final ty9 DEFAULT_INSTANCE;
    private static volatile r49 PARSER = null;
    public static final int PREFERENCES_FIELD_NUMBER = 1;
    private mh7 preferences_ = mh7.b;

    static {
        ty9 ty9Var = new ty9();
        DEFAULT_INSTANCE = ty9Var;
        e.j(ty9.class, ty9Var);
    }

    public static ry9 n() {
        return (ry9) ((h75) DEFAULT_INSTANCE.c(r75.NEW_BUILDER));
    }

    public static ty9 o(FileInputStream fileInputStream) {
        ty9 ty9Var = DEFAULT_INSTANCE;
        c cVar = new c(fileInputStream);
        r74 r74VarA = r74.a();
        e eVarI = ty9Var.i();
        try {
            u7a u7aVar = u7a.c;
            u7aVar.getClass();
            crb crbVarA = u7aVar.a(eVarI.getClass());
            d dVar = (d) cVar.c;
            if (dVar == null) {
                dVar = new d(cVar);
            }
            crbVarA.e(eVarI, dVar, r74VarA);
            crbVarA.b(eVarI);
            if (e.f(eVarI, true)) {
                return (ty9) eVarI;
            }
            throw new InvalidProtocolBufferException(new UninitializedMessageException().getMessage());
        } catch (InvalidProtocolBufferException e) {
            if (e.a) {
                throw new InvalidProtocolBufferException(e.getMessage(), e);
            }
            throw e;
        } catch (UninitializedMessageException e2) {
            throw new InvalidProtocolBufferException(e2.getMessage());
        } catch (IOException e3) {
            if (e3.getCause() instanceof InvalidProtocolBufferException) {
                throw ((InvalidProtocolBufferException) e3.getCause());
            }
            throw new InvalidProtocolBufferException(e3.getMessage(), e3);
        } catch (RuntimeException e4) {
            if (e4.getCause() instanceof InvalidProtocolBufferException) {
                throw ((InvalidProtocolBufferException) e4.getCause());
            }
            throw e4;
        }
    }

    @Override // androidx.datastore.preferences.protobuf.e
    public final Object c(r75 r75Var) {
        r49 j75Var;
        switch (qy9.a[r75Var.ordinal()]) {
            case 1:
                return new ty9();
            case 2:
                return new ry9(DEFAULT_INSTANCE);
            case 3:
                return new tsa(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u00012", new Object[]{"preferences_", sy9.a});
            case 4:
                return DEFAULT_INSTANCE;
            case 5:
                r49 r49Var = PARSER;
                if (r49Var != null) {
                    return r49Var;
                }
                synchronized (ty9.class) {
                    try {
                        j75Var = PARSER;
                        if (j75Var == null) {
                            j75Var = new j75();
                            PARSER = j75Var;
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                    break;
                }
                return j75Var;
            case 6:
                return (byte) 1;
            default:
                rd6.b();
            case 7:
                return null;
        }
    }

    public final Map l() {
        return DesugarCollections.unmodifiableMap(this.preferences_);
    }

    public final mh7 m() {
        mh7 mh7Var = this.preferences_;
        if (mh7Var.a) {
            return mh7Var;
        }
        mh7 mh7VarB = mh7Var.b();
        this.preferences_ = mh7VarB;
        return mh7VarB;
    }
}
