package io.branch.search.internal;

import io.branch.search.internal.C3398u6;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Db {
    public static final long a(@NotNull AbstractC3466y6<?> vr2, @NotNull Yd entity, boolean z11) {
        Intrinsics.g(vr2, "vr");
        Intrinsics.g(entity, "entity");
        int andIncrement = vr2.f66315f.getAndIncrement();
        String strQ = entity.q();
        if (strQ == null) {
            strQ = "unspecified";
        }
        String str = strQ;
        String strH = entity.h();
        if (strH == null) {
            strH = "unspecified";
        }
        String str2 = strH;
        List<C3155g> listX = entity.x();
        ArrayList arrayList = new ArrayList(b70.c.u0(listX, 10));
        for (C3155g c3155g : listX) {
            arrayList.add(new C3314p6(c3155g.f64531c, c3155g.f64536h));
        }
        String str3 = C3398u6.a.f66015a[entity.getContainerType().ordinal()] == 1 ? "unspecified" : entity.getContainerType().f66001a;
        String str4 = entity.o() != EnumC3449x6.Unknown ? entity.o().f66269a : "unspecified";
        String strK = entity.k();
        if (strK == null) {
            strK = "unspecified";
        }
        String str5 = strK;
        String strL = entity.l();
        if (strL == null) {
            strL = "unspecified";
        }
        String str6 = strL;
        String str7 = vr2.f66313d;
        String strJ = entity.j();
        if (strJ == null) {
            strJ = "unspecified";
        }
        vr2.a(new C3364s6(str, andIncrement, str3, str4, null, str5, str7, strJ, arrayList, str6, str2, entity.r(), null, null, entity.u()));
        long j11 = andIncrement;
        if (!z11) {
            return j11;
        }
        int i5 = (int) j11;
        Map<String, String> data = entity.u();
        Intrinsics.g(data, "data");
        synchronized (vr2.f66316g) {
            vr2.f66316g.put(Integer.valueOf(i5), data);
            Unit unit = Unit.f71706a;
        }
        return j11;
    }

    public static final void a(@NotNull jg zeroStateVirtualRequest, @Nullable Long l9, @NotNull String cause) {
        Intrinsics.g(zeroStateVirtualRequest, "zeroStateVirtualRequest");
        Intrinsics.g(cause, "cause");
        if (l9 != null) {
            zeroStateVirtualRequest.a(cause, (int) l9.longValue());
        }
    }
}
