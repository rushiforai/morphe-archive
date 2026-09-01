package defpackage;

import com.squareup.moshi.JsonDataException;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class rd6 implements m8c, qrd {
    public static /* synthetic */ void b() {
        throw new UnsupportedOperationException();
    }

    public static /* synthetic */ void c(double d, String str) {
        throw new IllegalArgumentException(str + d);
    }

    public static /* synthetic */ void d(int i, Object obj) {
        throw new IllegalStateException("Source subfield " + i + ((Object) " is present but null: ") + obj);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ void e(int i, String str, Object obj, Object obj2, Object obj3) {
        throw new IllegalArgumentException((str + obj + obj2 + obj3 + ((char) i)).toString());
    }

    public static /* synthetic */ void f(Object obj, Object obj2) {
        StringBuilder sb = new StringBuilder();
        sb.append(obj);
        sb.append(obj2);
        throw new IllegalArgumentException(sb.toString().toString());
    }

    public static /* synthetic */ void g(String str, Object obj) {
        throw new IllegalStateException(str + obj);
    }

    public static /* synthetic */ void h(String str, Object obj, Object obj2) {
        throw new AssertionError(str + obj + obj2);
    }

    public static /* synthetic */ void i(String str, Object obj, Object obj2, Object obj3) {
        throw new JsonDataException(str + obj + obj2 + obj3);
    }

    public static /* synthetic */ void j(String str, Object obj, Object obj2, Object obj3, Object obj4) {
        throw new IllegalStateException((str + obj + obj2 + obj3 + obj4).toString());
    }

    public static /* synthetic */ void k(StringBuilder sb, Object obj) {
        sb.append(" at path ");
        sb.append(obj);
        throw new h22(sb.toString());
    }

    public static /* synthetic */ void l(StringBuilder sb, Object obj, Object obj2) {
        sb.append(obj);
        sb.append(obj2);
        throw new IllegalArgumentException(sb.toString().toString());
    }

    public static /* synthetic */ void m() {
        throw new ClassCastException();
    }

    public static /* synthetic */ void n(String str, Object obj) {
        throw new zb2(str + obj);
    }

    public static /* synthetic */ void o(String str, Object obj, Object obj2) {
        throw new IllegalStateException((str + obj + obj2).toString());
    }

    public static /* synthetic */ void p(String str, Object obj, Object obj2, Object obj3) {
        throw new IllegalStateException(str + obj + obj2 + obj3);
    }

    public static /* synthetic */ void q(StringBuilder sb, Object obj) {
        sb.append(" at path ");
        sb.append(obj);
        throw new JsonDataException(sb.toString());
    }

    public static /* synthetic */ void r(String str, Object obj) {
        throw new zb2(str + obj);
    }

    public static /* synthetic */ void s(String str, Object obj, Object obj2) {
        throw new IllegalArgumentException(str + obj + obj2);
    }

    public static /* synthetic */ void t(StringBuilder sb, Object obj) {
        sb.append(" at path ");
        sb.append(obj);
        throw new com.apollographql.apollo.exception.JsonDataException(sb.toString(), null);
    }

    public static /* synthetic */ void u(String str, Object obj) {
        throw new AssertionError(str + obj);
    }

    public static /* synthetic */ void v(String str, Object obj, Object obj2) {
        throw new IllegalArgumentException((str + obj + obj2).toString());
    }

    public static /* synthetic */ void w(String str, Object obj, Object obj2) {
        throw new IllegalStateException(str + obj + obj2);
    }

    @Override // defpackage.m8c
    public boolean a() {
        return false;
    }

    @Override // defpackage.qrd
    public Object apply(Object obj) {
        mz7 mz7Var = (mz7) obj;
        z7a z7aVar = k7a.a;
        z7aVar.getClass();
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            z7aVar.a(mz7Var, byteArrayOutputStream);
        } catch (IOException unused) {
        }
        return byteArrayOutputStream.toByteArray();
    }
}
