package x7;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final String f95147a;

    /* renamed from: b, reason: collision with root package name */
    public final o7.g f95148b;

    public m(String workSpecId, o7.g progress) {
        Intrinsics.g(workSpecId, "workSpecId");
        Intrinsics.g(progress, "progress");
        this.f95147a = workSpecId;
        this.f95148b = progress;
    }

    public final o7.g a() {
        return this.f95148b;
    }

    public final String b() {
        return this.f95147a;
    }
}
