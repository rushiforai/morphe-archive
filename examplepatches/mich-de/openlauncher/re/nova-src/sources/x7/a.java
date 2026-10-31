package x7;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f95122a;

    /* renamed from: b, reason: collision with root package name */
    public final String f95123b;

    public a(String str, String prerequisiteId) {
        Intrinsics.g(prerequisiteId, "prerequisiteId");
        this.f95122a = str;
        this.f95123b = prerequisiteId;
    }

    public final String a() {
        return this.f95123b;
    }

    public final String b() {
        return this.f95122a;
    }
}
