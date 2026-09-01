package defpackage;

import androidx.datastore.preferences.protobuf.e;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vy9 extends e {
    private static final vy9 DEFAULT_INSTANCE;
    private static volatile r49 PARSER = null;
    public static final int STRINGS_FIELD_NUMBER = 1;
    private u56 strings_ = w7a.d;

    static {
        vy9 vy9Var = new vy9();
        DEFAULT_INSTANCE = vy9Var;
        e.j(vy9.class, vy9Var);
    }

    public static vy9 m() {
        return DEFAULT_INSTANCE;
    }

    public static uy9 o() {
        return (uy9) ((h75) DEFAULT_INSTANCE.c(r75.NEW_BUILDER));
    }

    @Override // androidx.datastore.preferences.protobuf.e
    public final Object c(r75 r75Var) {
        r49 j75Var;
        switch (qy9.a[r75Var.ordinal()]) {
            case 1:
                return new vy9();
            case 2:
                return new uy9(DEFAULT_INSTANCE);
            case 3:
                return new tsa(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001a", new Object[]{"strings_"});
            case 4:
                return DEFAULT_INSTANCE;
            case 5:
                r49 r49Var = PARSER;
                if (r49Var != null) {
                    return r49Var;
                }
                synchronized (vy9.class) {
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

    public final void l(Iterable iterable) {
        u56 u56VarF = this.strings_;
        if (!((w7a) u56VarF).a) {
            w7a w7aVar = (w7a) u56VarF;
            int i = w7aVar.c;
            u56VarF = w7aVar.f(i == 0 ? 10 : i * 2);
            this.strings_ = u56VarF;
        }
        Charset charset = x56.a;
        if (iterable instanceof ww6) {
            ((ww6) iterable).a();
            rd6.m();
            return;
        }
        if (iterable instanceof t0a) {
            ((w7a) u56VarF).addAll((Collection) iterable);
            return;
        }
        if ((u56VarF instanceof ArrayList) && (iterable instanceof Collection)) {
            ((ArrayList) u56VarF).ensureCapacity(((Collection) iterable).size() + ((w7a) u56VarF).c);
        }
        w7a w7aVar2 = (w7a) u56VarF;
        int i2 = w7aVar2.c;
        for (Object obj : iterable) {
            if (obj == null) {
                String str = "Element at index " + (w7aVar2.c - i2) + " is null.";
                for (int i3 = w7aVar2.c - 1; i3 >= i2; i3--) {
                    w7aVar2.remove(i3);
                }
                z72.c(str);
                return;
            }
            w7aVar2.add(obj);
        }
    }

    public final u56 n() {
        return this.strings_;
    }
}
