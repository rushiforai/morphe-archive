package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class U5 {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public P5 f63424a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public C3278n4 f63425b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public N4 f63426c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public C3127e5 f63427d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public C3245l5 f63428e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public Vd f63429f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public F7 f63430g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public C3435w9 f63431h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public C3404uc f63432i;

    /* renamed from: j, reason: collision with root package name */
    @Nullable
    public M6 f63433j;

    public U5() {
        this(0);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof U5)) {
            return false;
        }
        U5 u5 = (U5) obj;
        return Intrinsics.b(this.f63424a, u5.f63424a) && Intrinsics.b(this.f63425b, u5.f63425b) && Intrinsics.b(this.f63426c, u5.f63426c) && Intrinsics.b(this.f63427d, u5.f63427d) && Intrinsics.b(this.f63428e, u5.f63428e) && Intrinsics.b(this.f63429f, u5.f63429f) && Intrinsics.b(this.f63430g, u5.f63430g) && Intrinsics.b(this.f63431h, u5.f63431h) && Intrinsics.b(this.f63432i, u5.f63432i) && Intrinsics.b(this.f63433j, u5.f63433j);
    }

    public final int hashCode() {
        P5 p52 = this.f63424a;
        int iHashCode = (p52 == null ? 0 : p52.hashCode()) * 31;
        C3278n4 c3278n4 = this.f63425b;
        int iHashCode2 = (iHashCode + (c3278n4 == null ? 0 : c3278n4.hashCode())) * 31;
        N4 n42 = this.f63426c;
        int iHashCode3 = (iHashCode2 + (n42 == null ? 0 : n42.f62969a.hashCode())) * 31;
        C3127e5 c3127e5 = this.f63427d;
        int iHashCode4 = (iHashCode3 + (c3127e5 == null ? 0 : c3127e5.f64363a.hashCode())) * 31;
        C3245l5 c3245l5 = this.f63428e;
        int iHashCode5 = (iHashCode4 + (c3245l5 == null ? 0 : c3245l5.f64959a.hashCode())) * 31;
        Vd vd2 = this.f63429f;
        int iHashCode6 = (iHashCode5 + (vd2 == null ? 0 : vd2.f63543a.hashCode())) * 31;
        F7 f72 = this.f63430g;
        int iHashCode7 = (iHashCode6 + (f72 == null ? 0 : f72.f62451a.hashCode())) * 31;
        C3435w9 c3435w9 = this.f63431h;
        int iHashCode8 = (iHashCode7 + (c3435w9 == null ? 0 : c3435w9.hashCode())) * 31;
        C3404uc c3404uc = this.f63432i;
        int iHashCode9 = (iHashCode8 + (c3404uc == null ? 0 : c3404uc.hashCode())) * 31;
        M6 m62 = this.f63433j;
        return iHashCode9 + (m62 != null ? m62.hashCode() : 0);
    }

    @NotNull
    public final String toString() {
        return "DiagnosticDataCollector(deviceInfoData=" + this.f63424a + ", configurationData=" + this.f63425b + ", crashInfoData=" + this.f63426c + ", databaseDiagnosticInfo=" + this.f63427d + ", databaseVersionsInfo=" + this.f63428e + ", sharedPrefDiagnostics=" + this.f63429f + ", imageDownloaderDiagnostics=" + this.f63430g + ", networkDiagnostic=" + this.f63431h + ", ssmlDiagnostics=" + this.f63432i + ", fileDiagnostics=" + this.f63433j + ')';
    }

    public /* synthetic */ U5(int i5) {
        this(null, null, null, null, null, null, null, null, null, null);
    }

    public U5(@Nullable P5 p52, @Nullable C3278n4 c3278n4, @Nullable N4 n42, @Nullable C3127e5 c3127e5, @Nullable C3245l5 c3245l5, @Nullable Vd vd2, @Nullable F7 f72, @Nullable C3435w9 c3435w9, @Nullable C3404uc c3404uc, @Nullable M6 m62) {
        this.f63424a = p52;
        this.f63425b = c3278n4;
        this.f63426c = n42;
        this.f63427d = c3127e5;
        this.f63428e = c3245l5;
        this.f63429f = vd2;
        this.f63430g = f72;
        this.f63431h = c3435w9;
        this.f63432i = c3404uc;
        this.f63433j = m62;
    }
}
