package defpackage;

import com.squareup.moshi.JsonDataException;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Type;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class f8 extends jb6 {
    public final /* synthetic */ i8 a;
    public final /* synthetic */ jb6 b;
    public final /* synthetic */ i8 c;
    public final /* synthetic */ Set d;
    public final /* synthetic */ Type e;

    public f8(i8 i8Var, jb6 jb6Var, x38 x38Var, i8 i8Var2, Set set, Type type) {
        this.a = i8Var;
        this.b = jb6Var;
        this.c = i8Var2;
        this.d = set;
        this.e = type;
    }

    @Override // defpackage.jb6
    public final Object a(hd6 hd6Var) throws IOException {
        i8 i8Var = this.c;
        if (i8Var == null) {
            return this.b.a(hd6Var);
        }
        if (!i8Var.g && hd6Var.I() == dd6.NULL) {
            hd6Var.a0();
            return null;
        }
        try {
            return i8Var.b(hd6Var);
        } catch (InvocationTargetException e) {
            Throwable cause = e.getCause();
            if (cause instanceof IOException) {
                throw ((IOException) cause);
            }
            StringBuilder sb = new StringBuilder();
            sb.append(cause);
            String strD = hd6Var.D();
            sb.append(" at ");
            sb.append(strD);
            throw new JsonDataException(sb.toString(), cause);
        }
    }

    @Override // defpackage.jb6
    public final void e(zd6 zd6Var, Object obj) throws IOException {
        i8 i8Var = this.a;
        if (i8Var == null) {
            this.b.e(zd6Var, obj);
            return;
        }
        if (!i8Var.g && obj == null) {
            zd6Var.I();
            return;
        }
        try {
            i8Var.d(zd6Var, obj);
        } catch (InvocationTargetException e) {
            Throwable cause = e.getCause();
            if (cause instanceof IOException) {
                throw ((IOException) cause);
            }
            StringBuilder sb = new StringBuilder();
            sb.append(cause);
            String strB = zd6Var.B();
            sb.append(" at ");
            sb.append(strB);
            throw new JsonDataException(sb.toString(), cause);
        }
    }

    public final String toString() {
        return "JsonAdapter" + this.d + "(" + this.e + ")";
    }
}
