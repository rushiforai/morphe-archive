package defpackage;

import com.apollographql.apollo.exception.JsonDataException;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.EOFException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentSkipListMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ay0 implements y51, aj3, km8 {
    public final /* synthetic */ int a;

    public /* synthetic */ ay0(int i) {
        this.a = i;
    }

    public static /* synthetic */ void b() throws EOFException {
        throw new EOFException();
    }

    public static /* synthetic */ void c(int i, int i2, Object obj) {
        StringBuilder sb = new StringBuilder(i);
        sb.append(obj);
        sb.append(i2);
        throw new IndexOutOfBoundsException(sb.toString());
    }

    public static /* synthetic */ void d(Object obj) {
        throw new AssertionError(obj);
    }

    public static /* synthetic */ void e(String str) {
        throw new IllegalArgumentException(str);
    }

    public static /* synthetic */ void f(String str, Object obj, Object obj2) {
        throw new NumberFormatException(str + obj + obj2);
    }

    public static /* synthetic */ void h(String str, Object obj, Object obj2, Object obj3) {
        throw new IllegalArgumentException(str + obj + obj2 + obj3);
    }

    public static /* synthetic */ void i(StringBuilder sb, Object obj) {
        sb.append(obj);
        throw new IllegalArgumentException(sb.toString());
    }

    public static /* synthetic */ void j(String str, Object obj, Object obj2) {
        throw new JsonDataException(str + obj + ((Object) " at path ") + obj2, null);
    }

    @Override // defpackage.aj3
    public double a(double d) {
        switch (this.a) {
            case 13:
                double d2 = d < 0.0d ? -d : d;
                return Math.copySign(d2 >= 0.0031308049535603718d ? (Math.pow(d2, 0.4166666666666667d) - 0.05213270142180095d) / 0.9478672985781991d : d2 / 0.07739938080495357d, d);
            case 14:
                double d3 = d < 0.0d ? -d : d;
                return Math.copySign(d3 >= 0.04045d ? Math.pow((0.9478672985781991d * d3) + 0.05213270142180095d, 2.4d) : d3 * 0.07739938080495357d, d);
            case 15:
                float[] fArr = lv1.a;
                return lv1.b(lv1.c, d);
            case 16:
                float[] fArr2 = lv1.a;
                return lv1.a(lv1.c, d);
            case 17:
                float[] fArr3 = lv1.a;
                return lv1.d(lv1.d, d);
            default:
                float[] fArr4 = lv1.a;
                return lv1.c(lv1.d, d);
        }
    }

    @Override // defpackage.km8
    public Object g() {
        switch (this.a) {
            case 21:
                return new ArrayList();
            case 22:
                return new ConcurrentHashMap();
            case 23:
                return new ConcurrentSkipListMap();
            case 24:
                return new LinkedHashSet();
            case 25:
                return new TreeSet();
            case 26:
                return new ArrayDeque();
            case 27:
                return new b17(true);
            case 28:
                return new LinkedHashMap();
            default:
                return new TreeMap();
        }
    }

    @Override // defpackage.y51
    public void cancel() {
    }
}
