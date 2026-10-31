package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.q;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.y;
import java.util.Comparator;
import java.util.Iterator;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final Comparator<y> f40321a = new com.google.firebase.crashlytics.internal.persistence.c(1);

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final Comparator<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.l> f40322b = new com.google.firebase.crashlytics.internal.persistence.c(2);

    public static final Unit a(Ref.IntRef intRef, Ref.IntRef intRef2, Pair pair) {
        Intrinsics.g(pair, "<destruct>");
        boolean zBooleanValue = ((Boolean) pair.f71683a).booleanValue();
        boolean zBooleanValue2 = ((Boolean) pair.f71684b).booleanValue();
        if (zBooleanValue) {
            intRef.f71861a++;
        }
        if (zBooleanValue2) {
            intRef2.f71861a++;
        }
        return Unit.f71706a;
    }

    public static final Unit b(Ref.IntRef intRef, Ref.IntRef intRef2, Pair pair) {
        Intrinsics.g(pair, "<destruct>");
        boolean zBooleanValue = ((Boolean) pair.f71683a).booleanValue();
        boolean zBooleanValue2 = ((Boolean) pair.f71684b).booleanValue();
        if (zBooleanValue) {
            intRef.f71861a++;
        }
        if (zBooleanValue2) {
            intRef2.f71861a++;
        }
        return Unit.f71706a;
    }

    public static final Pair<Boolean, Boolean> c(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e eVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e eVar2, Integer num, Integer num2) {
        return a(b(eVar.i(), eVar.f(), num, num2), b(eVar2.i(), eVar2.f(), num, num2));
    }

    public static final Pair<Integer, Integer> d(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e eVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e eVar2, Integer num, Integer num2) {
        Ref.IntRef intRef = new Ref.IntRef();
        Ref.IntRef intRef2 = new Ref.IntRef();
        a(intRef, intRef2, b(eVar, eVar2, num, num2));
        a(intRef, intRef2, c(eVar, eVar2, num, num2));
        a(intRef, intRef2, a(eVar, eVar2));
        return new Pair<>(Integer.valueOf(intRef.f71861a), Integer.valueOf(intRef2.f71861a));
    }

    @NotNull
    public static final Comparator<y> b() {
        return f40321a;
    }

    public static final Pair<Integer, Integer> b(q qVar, q qVar2, double d5, Long l9, Integer num, Integer num2) {
        Ref.IntRef intRef = new Ref.IntRef();
        Ref.IntRef intRef2 = new Ref.IntRef();
        b(intRef, intRef2, a(qVar, qVar2, num, num2));
        b(intRef, intRef2, b(qVar, qVar2, num, num2));
        b(intRef, intRef2, a(qVar, qVar2, d5, l9));
        return new Pair<>(Integer.valueOf(intRef.f71861a), Integer.valueOf(intRef2.f71861a));
    }

    @NotNull
    public static final Comparator<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e> a(@Nullable Integer num, @Nullable Integer num2) {
        return new a(num, num2);
    }

    @NotNull
    public static final Comparator<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.l> a() {
        return f40322b;
    }

    @NotNull
    public static final Comparator<q> a(double d5, @Nullable Long l9, @Nullable Integer num, @Nullable Integer num2) {
        return new b(d5, l9, num, num2);
    }

    public static final int a(y yVar, y yVar2) {
        Intrinsics.d(yVar2);
        int iB = b(yVar2);
        Intrinsics.d(yVar);
        return Intrinsics.h(iB, b(yVar));
    }

    public static final int a(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.l lVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.l lVar2) {
        return f40321a.compare(lVar.g(), lVar2.g());
    }

    public static /* synthetic */ Pair a(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e eVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e eVar2, Integer num, Integer num2, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            num = null;
        }
        if ((i5 & 8) != 0) {
            num2 = null;
        }
        return d(eVar, eVar2, num, num2);
    }

    public static /* synthetic */ Pair a(q qVar, q qVar2, double d5, Long l9, Integer num, Integer num2, int i5, Object obj) {
        if ((i5 & 8) != 0) {
            l9 = null;
        }
        if ((i5 & 16) != 0) {
            num = null;
        }
        if ((i5 & 32) != 0) {
            num2 = null;
        }
        return b(qVar, qVar2, d5, l9, num, num2);
    }

    public static final boolean a(y it) {
        Intrinsics.g(it, "it");
        return it instanceof y.c;
    }

    public static final Pair<Boolean, Boolean> a(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e eVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e eVar2) {
        Object obj;
        Object next;
        com.instabridge.mobilesdk.internal.data.api.a aVar = new com.instabridge.mobilesdk.internal.data.api.a(25);
        Iterator<T> it = eVar.h().iterator();
        while (true) {
            obj = null;
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (((Boolean) aVar.invoke(next)).booleanValue()) {
                break;
            }
        }
        boolean z11 = next != null;
        Iterator<T> it2 = eVar2.h().iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            Object next2 = it2.next();
            if (((Boolean) aVar.invoke(next2)).booleanValue()) {
                obj = next2;
                break;
            }
        }
        return new Pair<>(Boolean.valueOf(z11), Boolean.valueOf(obj != null));
    }

    public static final Pair<Boolean, Boolean> b(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e eVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e eVar2, Integer num, Integer num2) {
        return a(a(eVar.i(), eVar.f(), num, num2), a(eVar2.i(), eVar2.f(), num, num2));
    }

    public static final Pair<Boolean, Boolean> b(q qVar, q qVar2, Integer num, Integer num2) {
        return a(b(qVar.j(), qVar.d(), num, num2), b(qVar2.j(), qVar2.d(), num, num2));
    }

    public static final Pair<Boolean, Boolean> a(Double d5, Double d11) {
        if (d5 == null || d11 == null) {
            return new Pair<>(Boolean.valueOf(d5 != null), Boolean.valueOf(d11 != null));
        }
        if (d5.doubleValue() == d11.doubleValue()) {
            Boolean bool = Boolean.TRUE;
            return new Pair<>(bool, bool);
        }
        if (Math.abs(d5.doubleValue()) == Math.abs(d11.doubleValue())) {
            return new Pair<>(Boolean.valueOf(d5.doubleValue() < 0.0d), Boolean.valueOf(d11.doubleValue() < 0.0d));
        }
        if (Double.compare(Math.abs(d5.doubleValue()), Math.abs(d11.doubleValue())) < 0) {
            return new Pair<>(Boolean.TRUE, Boolean.FALSE);
        }
        return new Pair<>(Boolean.FALSE, Boolean.TRUE);
    }

    public static final Double b(Integer num, Integer num2, Integer num3, Integer num4) {
        if (num == null || num.intValue() == 0 || num2 == null || num2.intValue() == 0 || num3 == null || num3.intValue() == 0 || num4 == null || num4.intValue() == 0) {
            return null;
        }
        return Double.valueOf((num.intValue() / num2.intValue()) - (num3.intValue() / num4.intValue()));
    }

    public static final int b(y yVar) {
        if (yVar instanceof y.a) {
            return 4;
        }
        if (yVar instanceof y.c) {
            return ((y.c) yVar).a().a() == com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.i.f40756b ? 3 : 2;
        }
        if (yVar instanceof y.b) {
            return 1;
        }
        throw new NoWhenBranchMatchedException();
    }

    public static final Pair<Boolean, Boolean> a(q qVar, q qVar2, Integer num, Integer num2) {
        return a(a(qVar.j(), qVar.d(), num, num2), a(qVar2.j(), qVar2.d(), num, num2));
    }

    public static final Pair<Boolean, Boolean> a(q qVar, q qVar2, double d5, Long l9) {
        return a(a(qVar, d5, l9), a(qVar2, d5, l9));
    }

    public static final Double a(Integer num, Integer num2, Integer num3, Integer num4) {
        if (num == null || num.intValue() == 0 || num2 == null || num2.intValue() == 0 || num3 == null || num3.intValue() == 0 || num4 == null || num4.intValue() == 0) {
            return null;
        }
        return Double.valueOf((num.intValue() * num2.intValue()) - (num3.intValue() * num4.intValue()));
    }

    public static final Double a(q qVar, double d5, Long l9) {
        Double dA = a(qVar, l9);
        if (dA != null) {
            return Double.valueOf(dA.doubleValue() - d5);
        }
        return null;
    }

    public static final Double a(q qVar, Long l9) {
        Double dValueOf;
        if (l9 == null) {
            return null;
        }
        if (qVar.b() != null) {
            dValueOf = Double.valueOf(qVar.b().intValue());
        } else {
            dValueOf = (qVar.f() == null || qVar.h() == null) ? null : Double.valueOf((qVar.f().intValue() - qVar.h().intValue()) / 2.0d);
        }
        if (dValueOf == null) {
            return null;
        }
        return Double.valueOf((dValueOf.doubleValue() / UserMetadata.MAX_INTERNAL_KEY_SIZE) * (l9.longValue() / 1000.0d));
    }
}
