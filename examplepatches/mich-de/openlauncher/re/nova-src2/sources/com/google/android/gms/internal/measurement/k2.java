package com.google.android.gms.internal.measurement;

import android.os.Parcel;
import com.google.android.libraries.places.internal.zzasx;
import com.instabridge.ai.tools.DeepLinkRegistry;
import com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.atomic.AtomicReferenceArray;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;

/* loaded from: classes3.dex */
public abstract /* synthetic */ class k2 {
    public static int A(int i5, int i11, int i12) {
        return com.google.android.gms.internal.play_billing.n2.D0(i5) + i11 + i12;
    }

    public static int B(int i5, int i11, int i12, int i13) {
        return com.google.android.gms.internal.play_billing.n2.D0(i5) + i11 + i12 + i13;
    }

    public static int C(int i5, int i11, int i12) {
        return zzasx.zzB(i5) + i11 + i12;
    }

    public static /* synthetic */ String D(int i5) {
        switch (i5) {
            case 1:
                return "CLIENT_UPLOAD_ELIGIBILITY_UNKNOWN";
            case 2:
                return "CLIENT_UPLOAD_ELIGIBLE";
            case 3:
                return "MEASUREMENT_SERVICE_NOT_ENABLED";
            case 4:
                return "ANDROID_TOO_OLD";
            case 5:
                return "NON_PLAY_MODE";
            case 6:
                return "SDK_TOO_OLD";
            case 7:
                return "MISSING_JOB_SCHEDULER";
            case 8:
                return "NOT_ENABLED_IN_MANIFEST";
            case 9:
                return "CLIENT_FLAG_OFF";
            case 10:
                return "SERVICE_FLAG_OFF";
            case 11:
                return "PINNED_TO_SERVICE_UPLOAD";
            case 12:
                return "MISSING_SGTM_SERVER_URL";
            default:
                throw null;
        }
    }

    public static int[] _values() {
        return b.c0.G(14);
    }

    public static Object a(int i5, com.google.protobuf.p pVar) {
        return i5 != 1 ? i5 != 2 ? pVar.m() : pVar.D() : pVar.C();
    }

    public static final int b(int i5) {
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return 8388611;
        }
        if (iF == 1) {
            return 1;
        }
        if (iF == 2) {
            return 8388613;
        }
        throw new IllegalStateException("Invalid gravity constant");
    }

    public static int c(int i5) {
        switch (i5) {
            case 0:
                return 1;
            case 1:
                return 2;
            case 2:
                return 3;
            case 3:
                return 4;
            case 4:
                return 5;
            case 5:
                return 6;
            case 6:
                return 7;
            case 7:
                return 8;
            case 8:
                return 9;
            default:
                switch (i5) {
                    case 20:
                        return 10;
                    case 21:
                        return 11;
                    case 22:
                        return 12;
                    default:
                        return 0;
                }
        }
    }

    public static /* synthetic */ int d(int i5) {
        switch (i5) {
            case 1:
                return 0;
            case 2:
                return 1;
            case 3:
                return 2;
            case 4:
                return 3;
            case 5:
                return 4;
            case 6:
                return 5;
            case 7:
                return 6;
            case 8:
                return 7;
            case 9:
                return 8;
            case 10:
                return 20;
            case 11:
                return 21;
            case 12:
                return 22;
            default:
                throw null;
        }
    }

    public static int e(int i5, int i11, int i12) {
        return c1.p(i5) + i11 + i12;
    }

    public static int f(int i5, int i11, int i12, int i13) {
        return c1.p(i5) + i11 + i12 + i13;
    }

    public static int g(int i5, int i11, m3.p0 p0Var) {
        return (p0Var.hashCode() + i5) * i11;
    }

    public static int h(Parcel parcel, LinkedHashSet linkedHashSet, int i5, int i11) {
        linkedHashSet.add(parcel.readString());
        return i5 + i11;
    }

    public static String i(long j11, String str) {
        return j11 + str;
    }

    public static String j(StringBuilder sb2, Object obj, char c11) {
        sb2.append(obj);
        sb2.append(c11);
        return sb2.toString();
    }

    public static StringBuilder k(String str, String str2) {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(str);
        sb2.append(str2);
        return sb2;
    }

    public static /* synthetic */ List l() {
        Object[] objArr = {"trigger-type-anomaly", "trigger-type-oom"};
        ArrayList arrayList = new ArrayList(2);
        for (int i5 = 0; i5 < 2; i5++) {
            Object obj = objArr[i5];
            Objects.requireNonNull(obj);
            arrayList.add(obj);
        }
        return Collections.unmodifiableList(arrayList);
    }

    public static List m(DeepLinkRegistry.ActionType actionType, String str, DeepLinkRegistry.RecipientType recipientType, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        return ul.b.P(new DeepLinkRegistry.DeepLinkPattern(actionType, str, recipientType, i5, defaultConstructorMarker));
    }

    public static /* synthetic */ List n(Object obj, Object obj2) {
        Object[] objArr = {obj, obj2};
        ArrayList arrayList = new ArrayList(2);
        for (int i5 = 0; i5 < 2; i5++) {
            Object obj3 = objArr[i5];
            Objects.requireNonNull(obj3);
            arrayList.add(obj3);
        }
        return Collections.unmodifiableList(arrayList);
    }

    public static Map o(String str, Map map) {
        return b70.k.e0(new Pair(str, map));
    }

    public static /* synthetic */ Optional p(Optional optional, ab.f fVar) {
        if (optional.isPresent()) {
            return optional;
        }
        Optional optional2 = (Optional) fVar.get();
        Objects.requireNonNull(optional2);
        return optional2;
    }

    public static NoWhenBranchMatchedException q(int i5, p1.t tVar, boolean z11) {
        tVar.b0(i5);
        tVar.p(z11);
        return new NoWhenBranchMatchedException();
    }

    public static p1.e2 r(p1.t tVar, c3.n3 n3Var, b3.i iVar, p1.t tVar2) {
        p1.a0.j(n3Var, iVar, tVar);
        tVar.f81575y = tVar.f81576z >= 0;
        return new p1.e2(tVar2);
    }

    public static y70.d s() {
        return t70.k0.a(com.moloco.sdk.internal.scheduling.b.a().getMain());
    }

    public static void t(int i5, String str, String str2) {
        wf.a.D(str2, str + i5);
    }

    public static void u(int i5, Function2 function2, p1.t tVar, boolean z11) {
        function2.invoke(tVar, Integer.valueOf(i5));
        tVar.p(z11);
    }

    public static void v(long j11, String str, StringBuilder sb2) {
        sb2.append((Object) i2.s.h(j11));
        sb2.append(str);
    }

    public static void w(Parcel parcel, int i5, Boolean bool) {
        parcel.writeInt(i5);
        parcel.writeInt(bool.booleanValue() ? 1 : 0);
    }

    public static /* synthetic */ boolean x(AtomicReference atomicReference, e0.g1 g1Var, e0.g1 g1Var2) {
        while (!atomicReference.compareAndSet(g1Var, g1Var2)) {
            if (atomicReference.get() != g1Var) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ boolean y(AtomicReferenceArray atomicReferenceArray, int i5, e80.h hVar, e80.h hVar2) {
        while (!atomicReferenceArray.compareAndSet(i5, hVar, hVar2)) {
            if (atomicReferenceArray.get(i5) != hVar) {
                return false;
            }
        }
        return true;
    }

    public static boolean z(p1.t tVar, boolean z11, int i5, MobileFlowViewModel mobileFlowViewModel) {
        tVar.p(z11);
        tVar.b0(i5);
        return tVar.h(mobileFlowViewModel);
    }
}
