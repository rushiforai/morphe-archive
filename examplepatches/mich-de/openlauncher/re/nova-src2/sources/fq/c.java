package fq;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.u4;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.reflect.jvm.internal.impl.metadata.deserialization.Flags;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import kotlin.reflect.jvm.internal.impl.name.Name;
import kotlin.reflect.jvm.internal.impl.types.model.SimpleTypeMarker;
import kotlinx.serialization.json.JsonElement;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import kw.v1;
import mx.j0;
import nb0.z;
import p1.e2;
import p1.t;
import x7.f;

/* loaded from: classes4.dex */
public abstract /* synthetic */ class c {
    public static /* synthetic */ String A(int i5) {
        switch (i5) {
            case 1:
                return "ENQUEUED";
            case 2:
                return "RUNNING";
            case 3:
                return "SUCCEEDED";
            case 4:
                return "FAILED";
            case 5:
                return "BLOCKED";
            case 6:
                return "CANCELLED";
            default:
                return AbstractJsonLexerKt.NULL;
        }
    }

    public static /* synthetic */ String B(int i5) {
        return i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? i5 != 5 ? AbstractJsonLexerKt.NULL : "REGISTER_ERROR" : "REGISTERED" : "UNREGISTERED" : "NOT_GENERATED" : "ATTEMPT_MIGRATION";
    }

    public static int[] _values() {
        return c0.G(4);
    }

    public static final boolean a(int i5) {
        return i5 == 3 || i5 == 4 || i5 == 6;
    }

    public static int b(Parcelable.Creator creator, Parcel parcel, ArrayList arrayList, int i5, int i11) {
        arrayList.add(creator.createFromParcel(parcel));
        return i5 + i11;
    }

    public static Object c(Bundle bundle, String str, String str2, String str3, String str4) {
        Intrinsics.g(bundle, str);
        Intrinsics.g(str2, str3);
        return bundle.get(str4);
    }

    public static String d(String str, String str2, Throwable th2) {
        return str + th2 + str2;
    }

    public static String e(StringBuilder sb2, List list, char c11) {
        sb2.append(list);
        sb2.append(c11);
        return sb2.toString();
    }

    public static String f(Throwable th2, StringBuilder sb2) {
        sb2.append(th2.getMessage());
        return sb2.toString();
    }

    public static String g(t tVar, int i5, int i11, t tVar2, boolean z11) {
        tVar.b0(i5);
        String strY = f.Y(tVar2, i11);
        tVar.p(z11);
        return strY;
    }

    public static StringBuilder h(String str, SimpleTypeMarker simpleTypeMarker, String str2) {
        StringBuilder sb2 = new StringBuilder(str);
        sb2.append(simpleTypeMarker);
        sb2.append(str2);
        return sb2;
    }

    public static StringBuilder i(j0 j0Var, String str, float f11, StringBuilder sb2, PrintWriter printWriter) {
        sb2.append(j0Var.p(str, f11));
        printWriter.println(sb2.toString());
        return new StringBuilder();
    }

    public static Iterator j(ArrayList arrayList, Parcel parcel) {
        parcel.writeInt(arrayList.size());
        return arrayList.iterator();
    }

    public static Iterator k(List list, Parcel parcel) {
        parcel.writeInt(list.size());
        return list.iterator();
    }

    public static /* synthetic */ Set l(String str) {
        HashSet hashSet = new HashSet(1);
        Object obj = new Object[]{str}[0];
        Objects.requireNonNull(obj);
        if (hashSet.add(obj)) {
            return Collections.unmodifiableSet(hashSet);
        }
        throw new IllegalArgumentException(u4.h(obj, "duplicate element: "));
    }

    public static Pair m(String str, String str2, String str3, String str4) {
        return new Pair(str4, new v1(str, str2, str3));
    }

    public static FqName n(String str, FqName fqName, String str2) {
        FqName fqNameChild = fqName.child(Name.identifier(str));
        Intrinsics.f(fqNameChild, str2);
        return fqNameChild;
    }

    public static /* synthetic */ void o(int i5, String str) {
        if (i5 != 0) {
            return;
        }
        NullPointerException nullPointerException = new NullPointerException(Intrinsics.j(str));
        Intrinsics.l(nullPointerException, Intrinsics.class.getName());
        throw nullPointerException;
    }

    public static void p(int i5, x1.e eVar, e2 e2Var, t tVar, int i11) {
        eVar.invoke(e2Var, tVar, Integer.valueOf(i5));
        tVar.c0(i11);
    }

    public static void q(Parcel parcel, int i5, Integer num) {
        parcel.writeInt(i5);
        parcel.writeInt(num.intValue());
    }

    public static /* synthetic */ void r(Object obj) {
        throw new ClassCastException();
    }

    public static void s(ReflectionFactory reflectionFactory, Class cls, StringBuilder sb2, String str, JsonElement jsonElement) {
        sb2.append(reflectionFactory.getOrCreateKotlinClass(cls).getSimpleName());
        sb2.append(str);
        sb2.append(reflectionFactory.getOrCreateKotlinClass(jsonElement.getClass()).getSimpleName());
    }

    public static void t(t tVar, boolean z11, boolean z12, boolean z13, boolean z14) {
        tVar.p(z11);
        tVar.p(z12);
        tVar.p(z13);
        tVar.p(z14);
    }

    public static /* synthetic */ boolean u(AtomicReference atomicReference, z zVar, z zVar2) {
        while (!atomicReference.compareAndSet(zVar, zVar2)) {
            if (atomicReference.get() != zVar) {
                return false;
            }
        }
        return true;
    }

    public static boolean v(Flags.BooleanFlagField booleanFlagField, int i5, String str) {
        Boolean bool = booleanFlagField.get(i5);
        Intrinsics.f(bool, str);
        return bool.booleanValue();
    }

    public static /* synthetic */ String w(int i5) {
        switch (i5) {
            case 1:
                return "NONE";
            case 2:
                return "LEFT";
            case 3:
                return "TOP";
            case 4:
                return "RIGHT";
            case 5:
                return "BOTTOM";
            case 6:
                return "BASELINE";
            case 7:
                return "CENTER";
            case 8:
                return "CENTER_X";
            case 9:
                return "CENTER_Y";
            default:
                throw null;
        }
    }

    public static /* synthetic */ String x(int i5) {
        return i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? AbstractJsonLexerKt.NULL : "MANUAL" : "SUGGESTED" : "EMPTY" : "UNLABELED";
    }

    public static /* synthetic */ String y(int i5) {
        switch (i5) {
            case 1:
                return "BEGIN_ARRAY";
            case 2:
                return "END_ARRAY";
            case 3:
                return "BEGIN_OBJECT";
            case 4:
                return "END_OBJECT";
            case 5:
                return "NAME";
            case 6:
                return "STRING";
            case 7:
                return "NUMBER";
            case 8:
                return "BOOLEAN";
            case 9:
                return "NULL";
            case 10:
                return "END_DOCUMENT";
            default:
                return AbstractJsonLexerKt.NULL;
        }
    }

    public static /* synthetic */ String z(int i5) {
        return i5 != 1 ? i5 != 2 ? i5 != 3 ? AbstractJsonLexerKt.NULL : "RIGHT" : "CENTER" : "LEFT";
    }
}
