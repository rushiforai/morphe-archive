package io.branch.search.internal;

import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.u6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3398u6 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final AbstractC3466y6<?> f66012a;

    /* renamed from: b, reason: collision with root package name */
    public final int f66013b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3364s6 f66014c;

    /* renamed from: io.branch.search.internal.u6$a */
    public /* synthetic */ class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int[] f66015a;

        static {
            int[] iArr = new int[EnumC3396u4.values().length];
            iArr[11] = 1;
            f66015a = iArr;
        }
    }

    public C3398u6() {
        throw null;
    }

    public C3398u6(@NotNull Yd shortcutEntity, @NotNull AbstractC3466y6<?> entityVirtualRequest, int i5) {
        Intrinsics.g(shortcutEntity, "shortcutEntity");
        Intrinsics.g(entityVirtualRequest, "entityVirtualRequest");
        this.f66012a = entityVirtualRequest;
        this.f66013b = i5;
        String strQ = shortcutEntity.q();
        String str = strQ == null ? "unspecified" : strQ;
        String strH = shortcutEntity.h();
        String str2 = strH == null ? "unspecified" : strH;
        List<C3155g> listX = shortcutEntity.x();
        ArrayList arrayList = new ArrayList(b70.c.u0(listX, 10));
        for (C3155g c3155g : listX) {
            arrayList.add(new C3314p6(c3155g.a(), c3155g.b()));
        }
        String strA = a.f66015a[shortcutEntity.getContainerType().ordinal()] == 1 ? "unspecified" : shortcutEntity.getContainerType().a();
        String strA2 = shortcutEntity.o() != EnumC3449x6.Unknown ? shortcutEntity.o().a() : "unspecified";
        String strK = shortcutEntity.k();
        String str3 = strK == null ? "unspecified" : strK;
        String strL = shortcutEntity.l();
        String str4 = strL == null ? "unspecified" : strL;
        String strA3 = this.f66012a.a();
        int i11 = this.f66013b;
        String strJ = shortcutEntity.j();
        this.f66014c = new C3364s6(str, i11, strA, strA2, str3, strA3, strJ == null ? "unspecified" : strJ, arrayList, str4, str2, shortcutEntity.r(), shortcutEntity.u());
    }
}
