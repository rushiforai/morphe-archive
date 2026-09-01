package defpackage;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Base64;
import android.view.textclassifier.TextClassifier;
import com.google.firebase.components.DependencyException;
import java.net.ProtocolException;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lg8 implements m33, aj3, dnb {
    public final /* synthetic */ int a;

    public /* synthetic */ lg8(int i) {
        this.a = i;
    }

    public static /* bridge */ /* synthetic */ TextClassifier c(Object obj) {
        return (TextClassifier) obj;
    }

    public static /* synthetic */ void d() {
        throw new IllegalStateException();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ void f(int i, Object obj, String str) {
        throw new IllegalArgumentException(str + obj + ((char) i));
    }

    public static /* synthetic */ void g(int i, String str) {
        throw new IllegalStateException((str + i).toString());
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ void h(int i, String str, Object obj, Object obj2, Object obj3) {
        throw new IllegalArgumentException(str + obj + obj2 + obj3 + ((char) i));
    }

    public static /* synthetic */ void i(Object obj) {
        throw new IllegalStateException(obj.toString());
    }

    public static /* synthetic */ void j(Object obj, Object obj2, Object obj3, Throwable th) {
        StringBuilder sb = new StringBuilder();
        sb.append(obj);
        sb.append(obj2);
        sb.append(obj3);
        throw new IllegalStateException(sb.toString(), th);
    }

    public static /* synthetic */ void k(String str) throws ProtocolException {
        throw new ProtocolException(str);
    }

    public static /* synthetic */ void l(String str, float f, Object obj, float f2, Object obj2) {
        throw new IllegalArgumentException(str + f + obj + f2 + obj2);
    }

    public static /* synthetic */ void m(String str, Object obj) {
        throw new IllegalStateException((str + obj).toString());
    }

    public static /* synthetic */ void n(String str, Object obj, Object obj2) {
        throw new DependencyException(str + obj + obj2);
    }

    public static /* synthetic */ void o(String str, Object obj, Object obj2, Object obj3) {
        throw new IllegalArgumentException((str + obj + obj2 + obj3).toString());
    }

    public static /* synthetic */ void p(String str, Throwable th) {
        throw new RuntimeException(str, th);
    }

    public static /* synthetic */ void q(StringBuilder sb, Object obj) {
        sb.append(", ");
        sb.append(obj);
        throw new IllegalStateException(sb.toString().toString());
    }

    public static /* synthetic */ void r() {
        throw new IllegalArgumentException();
    }

    public static /* synthetic */ void s(int i, String str) {
        throw new IllegalStateException((str + i).toString());
    }

    public static /* synthetic */ void t(String str, Object obj) {
        throw new IllegalArgumentException((str + obj).toString());
    }

    public static /* synthetic */ void u(String str, Object obj, Object obj2, Object obj3) {
        throw new IllegalStateException(str + obj + obj2 + obj3);
    }

    public static /* synthetic */ void v(StringBuilder sb, Object obj) {
        sb.append(obj);
        throw new IllegalStateException(sb.toString());
    }

    public static /* synthetic */ void w(String str, Object obj) {
        throw new IllegalStateException((str + obj).toString());
    }

    public static /* synthetic */ void x(String str, Object obj, Object obj2, Object obj3) {
        throw new zb2(str + obj + obj2 + obj3 + ')');
    }

    public static /* synthetic */ void y(String str, Object obj) {
        throw new IllegalStateException((str + obj + '\'').toString());
    }

    @Override // defpackage.dnb
    public Object apply(Object obj) {
        switch (this.a) {
            case 27:
                Cursor cursorRawQuery = ((SQLiteDatabase) obj).rawQuery("SELECT distinct t._id, t.backend_name, t.priority, t.extras FROM transport_contexts AS t, events AS e WHERE e.context_id = t._id", new String[0]);
                try {
                    ArrayList arrayList = new ArrayList();
                    while (cursorRawQuery.moveToNext()) {
                        m50 m50VarA = kk0.a();
                        m50VarA.L(cursorRawQuery.getString(1));
                        m50VarA.d = c1a.b(cursorRawQuery.getInt(2));
                        String string = cursorRawQuery.getString(3);
                        m50VarA.c = string == null ? null : Base64.decode(string, 0);
                        arrayList.add(m50VarA.k());
                        break;
                    }
                    return arrayList;
                } finally {
                    cursorRawQuery.close();
                }
            default:
                return Boolean.valueOf(((Cursor) obj).getCount() > 0);
        }
    }

    @Override // defpackage.m33
    public void e(h8a h8aVar) {
        switch (this.a) {
            case 4:
                return;
            default:
                h8aVar.get().getClass();
                throw new ClassCastException();
        }
    }

    private final void b(h8a h8aVar) {
    }

    @Override // defpackage.aj3
    public double a(double d) {
        return d;
    }
}
