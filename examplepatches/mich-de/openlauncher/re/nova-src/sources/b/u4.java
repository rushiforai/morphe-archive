package b;

import java.util.Iterator;
import java.util.List;
import kotlin.ResultKt;
import kotlin.jvm.internal.Ref;
import kotlin.text.Regex;

/* loaded from: classes.dex */
public abstract /* synthetic */ class u4 {
    public static int a(int i5, int i11, int i12) {
        return (Integer.hashCode(i5) + i11) * i12;
    }

    public static int b(int i5, int i11, int i12, int i13) {
        return ((i5 / i11) * i12) + i13;
    }

    public static int c(int i5, int i11, List list) {
        return (list.hashCode() + i5) * i11;
    }

    public static ClassCastException d(Object obj) {
        obj.getClass();
        return new ClassCastException();
    }

    public static ClassCastException e(Iterator it) {
        it.next().getClass();
        return new ClassCastException();
    }

    public static String f(int i5, int i11, String str) {
        return str.substring(i11, str.length() - i5);
    }

    public static String g(long j11, String str) {
        return str + j11;
    }

    public static String h(Object obj, String str) {
        return str + obj;
    }

    public static String i(String str, String str2, String str3) {
        return new Regex(str).h(str3, str2);
    }

    public static StringBuilder j(int i5, String str, String str2) {
        StringBuilder sb2 = new StringBuilder(str);
        sb2.append(i5);
        sb2.append(str2);
        return sb2;
    }

    public static StringBuilder k(String str, String str2, String str3) {
        StringBuilder sb2 = new StringBuilder(str);
        sb2.append(str2);
        sb2.append(str3);
        return sb2;
    }

    public static Ref.ObjectRef l(Object obj) {
        ResultKt.b(obj);
        return new Ref.ObjectRef();
    }

    public static String m(String str, String str2, String str3) {
        return str + str2 + str3;
    }
}
