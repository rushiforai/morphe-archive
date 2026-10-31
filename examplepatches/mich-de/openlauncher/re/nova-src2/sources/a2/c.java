package a2;

import android.content.SharedPreferences;
import androidx.compose.ui.node.LayoutNode;
import androidx.recyclerview.widget.RecyclerView;
import com.google.protobuf.t;
import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import i2.s;
import java.util.List;
import kotlin.KotlinNothingValueException;
import kotlin.jvm.internal.PropertyReference1Impl;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KProperty1;
import p1.m0;
import p1.r1;

/* loaded from: classes.dex */
public abstract /* synthetic */ class c {
    public static int A(int i5, int i11, int i12, int i13) {
        return ((i5 * i11) / i12) + i13;
    }

    public static int B(int i5, int i11, int i12, int i13) {
        return t.H(i5) + i11 + i12 + i13;
    }

    public static float a(float f11, float f12, float f13, float f14) {
        return ((f11 - f12) * f13) + f14;
    }

    public static int b(int i5, int i11, int i12, int i13) {
        return androidx.datastore.preferences.protobuf.m.i0(i5) + i11 + i12 + i13;
    }

    public static int c(LayoutNode layoutNode) {
        return layoutNode.getNodes().getHead().getAggregateChildKindSet();
    }

    public static i0.i d(p1.t tVar) {
        i0.i iVar = new i0.i();
        tVar.m0(iVar);
        return iVar;
    }

    public static Object e(int i5, List list) {
        return list.get(list.size() - i5);
    }

    public static Object f(int i5, p1.t tVar, boolean z11) {
        tVar.p(z11);
        tVar.b0(i5);
        return tVar.P();
    }

    public static String g(char c11, String str, String str2) {
        return str + c11 + str2;
    }

    public static String h(int i5, String str) {
        return i5 + str;
    }

    public static String i(long j11, String str, StringBuilder sb2) {
        sb2.append(j11);
        sb2.append(str);
        return sb2.toString();
    }

    public static String j(RecyclerView recyclerView, StringBuilder sb2) {
        sb2.append(recyclerView.exceptionLabel());
        return sb2.toString();
    }

    public static String k(String str, StringBuilder sb2) {
        return str + ((Object) sb2);
    }

    public static String l(String str, boolean z11) {
        return str + z11;
    }

    public static String m(StringBuilder sb2, int i5, char c11) {
        sb2.append(i5);
        sb2.append(c11);
        return sb2.toString();
    }

    public static String n(StringBuilder sb2, long j11, char c11) {
        sb2.append(j11);
        sb2.append(c11);
        return sb2.toString();
    }

    public static String o(StringBuilder sb2, Integer num, char c11) {
        sb2.append(num);
        sb2.append(c11);
        return sb2.toString();
    }

    public static String p(StringBuilder sb2, boolean z11, char c11) {
        sb2.append(z11);
        sb2.append(c11);
        return sb2.toString();
    }

    public static StringBuilder q(String str) {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(str);
        return sb2;
    }

    public static KotlinNothingValueException r(String str) {
        y2.a.c(str);
        return new KotlinNothingValueException();
    }

    public static KProperty1 s(Class cls, String str, String str2, int i5) {
        return Reflection.f71864a.property1(new PropertyReference1Impl(cls, str, str2, i5));
    }

    public static r1 t(long j11, m0 m0Var) {
        return m0Var.a(new s(j11));
    }

    public static void u(int i5, p1.t tVar, int i11, b3.i iVar) {
        tVar.m0(Integer.valueOf(i5));
        tVar.b(Integer.valueOf(i11), iVar);
    }

    public static void v(SharedPreferences sharedPreferences, String str, String str2) {
        sharedPreferences.edit().putString(str, str2).apply();
    }

    public static void w(com.moloco.sdk.internal.client_metrics_data.d dVar, CountEvent countEvent, String str, MetricsRecorder metricsRecorder) {
        metricsRecorder.recordCountEvent(countEvent.withTag(dVar.c(), str));
    }

    public static void x(k2.d dVar, long j11) {
        dVar.getCanvas().restore();
        dVar.mo112setSizeuvyYCjk(j11);
    }

    public static void y(p1.t tVar, boolean z11, boolean z12, boolean z13) {
        tVar.p(z11);
        tVar.p(z12);
        tVar.p(z13);
    }

    public static float z(float f11, float f12, float f13, float f14) {
        return ((f11 - f12) / f13) + f14;
    }
}
