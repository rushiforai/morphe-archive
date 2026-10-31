package com.google.android.gms.internal.measurement;

import java.util.List;
import java.util.Objects;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class ie {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f32654a;

    /* renamed from: b, reason: collision with root package name */
    public final List f32655b;

    /* renamed from: c, reason: collision with root package name */
    public final v0 f32656c;

    /* renamed from: d, reason: collision with root package name */
    public final String f32657d;

    /* renamed from: e, reason: collision with root package name */
    public final String f32658e;

    /* renamed from: f, reason: collision with root package name */
    public final List f32659f;

    /* renamed from: g, reason: collision with root package name */
    public final List f32660g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f32661h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f32662i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f32663j;

    /* renamed from: k, reason: collision with root package name */
    public final qc f32664k;

    public ie(boolean z11, xk.v0 enabledBackings, v0 secret, String dirPath, String gmsCoreDirPath, xk.v0 includeStaticConfigPackages, xk.v0 excludeStaticConfigPackages, boolean z12, boolean z13, boolean z14, qc clientFlags) {
        Intrinsics.g(enabledBackings, "enabledBackings");
        Intrinsics.g(secret, "secret");
        Intrinsics.g(dirPath, "dirPath");
        Intrinsics.g(gmsCoreDirPath, "gmsCoreDirPath");
        Intrinsics.g(includeStaticConfigPackages, "includeStaticConfigPackages");
        Intrinsics.g(excludeStaticConfigPackages, "excludeStaticConfigPackages");
        Intrinsics.g(clientFlags, "clientFlags");
        this.f32654a = z11;
        this.f32655b = enabledBackings;
        this.f32656c = secret;
        this.f32657d = dirPath;
        this.f32658e = gmsCoreDirPath;
        this.f32659f = includeStaticConfigPackages;
        this.f32660g = excludeStaticConfigPackages;
        this.f32661h = z12;
        this.f32662i = z13;
        this.f32663j = z14;
        this.f32664k = clientFlags;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ie)) {
            return false;
        }
        ie ieVar = (ie) obj;
        return this.f32654a == ieVar.f32654a && Intrinsics.b(this.f32655b, ieVar.f32655b) && Intrinsics.b(this.f32656c, ieVar.f32656c) && Intrinsics.b(this.f32657d, ieVar.f32657d) && Intrinsics.b(this.f32658e, ieVar.f32658e) && Intrinsics.b(this.f32659f, ieVar.f32659f) && Intrinsics.b(this.f32660g, ieVar.f32660g) && this.f32661h == ieVar.f32661h && this.f32662i == ieVar.f32662i && this.f32663j == ieVar.f32663j && Intrinsics.b(this.f32664k, ieVar.f32664k);
    }

    public final int hashCode() {
        return Objects.hash(Boolean.valueOf(this.f32654a), this.f32655b, this.f32656c, this.f32657d, this.f32658e, this.f32659f, this.f32660g, Boolean.valueOf(this.f32661h), Boolean.valueOf(this.f32662i), Boolean.valueOf(this.f32663j));
    }

    public final String toString() {
        boolean z11 = this.f32654a;
        int length = String.valueOf(z11).length();
        List list = this.f32655b;
        int length2 = String.valueOf(list).length();
        v0 v0Var = this.f32656c;
        int length3 = String.valueOf(v0Var).length();
        String str = this.f32657d;
        int length4 = String.valueOf(str).length();
        String str2 = this.f32658e;
        int length5 = String.valueOf(str2).length();
        List list2 = this.f32659f;
        int length6 = String.valueOf(list2).length();
        List list3 = this.f32660g;
        int length7 = String.valueOf(list3).length();
        boolean z12 = this.f32661h;
        int length8 = String.valueOf(z12).length();
        boolean z13 = this.f32662i;
        int length9 = String.valueOf(z13).length();
        boolean z14 = this.f32663j;
        int length10 = String.valueOf(z14).length();
        qc qcVar = this.f32664k;
        StringBuilder sb2 = new StringBuilder(length + 59 + length2 + 9 + length3 + 10 + length4 + 17 + length5 + 30 + length6 + 30 + length7 + 24 + length8 + 26 + length9 + 20 + length10 + 14 + String.valueOf(qcVar).length() + 1);
        sb2.append("SharedStorageInfo(shouldUseSharedStorage=");
        sb2.append(z11);
        sb2.append(", enabledBackings=");
        sb2.append(list);
        sb2.append(", secret=");
        sb2.append(v0Var);
        sb2.append(", dirPath=");
        sb2.append(str);
        sb2.append(", gmsCoreDirPath=");
        sb2.append(str2);
        sb2.append(", includeStaticConfigPackages=");
        sb2.append(list2);
        sb2.append(", excludeStaticConfigPackages=");
        sb2.append(list3);
        sb2.append(", hasStorageInfoFromGms=");
        sb2.append(z12);
        sb2.append(", allowEmptySnapshotToken=");
        sb2.append(z13);
        sb2.append(", enableCommitV2Api=");
        sb2.append(z14);
        sb2.append(", clientFlags=");
        sb2.append(qcVar);
        sb2.append(")");
        return sb2.toString();
    }
}
