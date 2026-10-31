package x5;

import androidx.datastore.preferences.protobuf.a0;
import androidx.datastore.preferences.protobuf.b0;
import androidx.datastore.preferences.protobuf.d0;
import androidx.datastore.preferences.protobuf.u0;
import androidx.datastore.preferences.protobuf.v0;
import androidx.datastore.preferences.protobuf.w;
import androidx.datastore.preferences.protobuf.x;
import androidx.datastore.preferences.protobuf.x0;
import androidx.datastore.preferences.protobuf.y;
import androidx.datastore.preferences.protobuf.y0;
import b.c0;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes.dex */
public final class g extends y {
    private static final g DEFAULT_INSTANCE;
    private static volatile u0 PARSER = null;
    public static final int STRINGS_FIELD_NUMBER = 1;
    private a0 strings_ = x0.e();

    static {
        g gVar = new g();
        DEFAULT_INSTANCE = gVar;
        y.i(g.class, gVar);
    }

    public static void m(g gVar, Iterable iterable) {
        androidx.datastore.preferences.protobuf.b bVar = (androidx.datastore.preferences.protobuf.b) gVar.strings_;
        if (!bVar.d()) {
            x0 x0Var = (x0) bVar;
            int size = x0Var.size();
            gVar.strings_ = x0Var.g(size == 0 ? 10 : size * 2);
        }
        List list = gVar.strings_;
        Charset charset = b0.f14278a;
        if (iterable instanceof d0) {
            List underlyingElements = ((d0) iterable).getUnderlyingElements();
            c0.y(list);
            list.size();
            Iterator it = underlyingElements.iterator();
            if (it.hasNext()) {
                Object next = it.next();
                next.getClass();
                if (next instanceof androidx.datastore.preferences.protobuf.h) {
                    throw null;
                }
                if (!(next instanceof byte[])) {
                    throw null;
                }
                byte[] bArr = (byte[]) next;
                androidx.datastore.preferences.protobuf.h.e(0, bArr.length, bArr);
                throw null;
            }
            return;
        }
        if (iterable instanceof v0) {
            list.addAll((Collection) iterable);
            return;
        }
        if ((list instanceof ArrayList) && (iterable instanceof Collection)) {
            ((ArrayList) list).ensureCapacity(((Collection) iterable).size() + list.size());
        }
        int size2 = list.size();
        for (Object obj : iterable) {
            if (obj == null) {
                String str = "Element at index " + (list.size() - size2) + " is null.";
                for (int size3 = list.size() - 1; size3 >= size2; size3--) {
                    list.remove(size3);
                }
                throw new NullPointerException(str);
            }
            list.add(obj);
        }
    }

    public static g n() {
        return DEFAULT_INSTANCE;
    }

    public static f p() {
        return (f) ((w) DEFAULT_INSTANCE.b(5));
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
                return new y0(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001a", new Object[]{"strings_"});
            case 3:
                return new g();
            case 4:
                return new f();
            case 5:
                return DEFAULT_INSTANCE;
            case 6:
                u0 u0Var = PARSER;
                if (u0Var != null) {
                    return u0Var;
                }
                synchronized (g.class) {
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

    public final a0 o() {
        return this.strings_;
    }
}
